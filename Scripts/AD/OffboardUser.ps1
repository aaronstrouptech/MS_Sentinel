<############################################################################################################

Purpose: Off-loading employees in Active Directory

###Assumes script run in desktop PowerShell with
###Active Directory administrator permissions already in place.

Chain:

Active Directory Section:
* Asks admin for a user name to disable.
* Checks for active user with that name.
* Disables user in AD.
* Resets the password of the user's AD account.
* Adds the path of the OU that the user came from to the "Description" of the account.
* Exports a list of the user's group memberships (permissions) to an Excel file in a specified directory.
* Strips group memberships from user's AD account.
* Moves user's AD account to the "Disabled Users" OU.


############################################################################################################>


$date = [datetime]::Today.ToString('dd-MM-yyyy')

# Un-comment the following if PowerShell isn't already set up to do this on its own
# Import-Module ActiveDirectory

# Blank the console
# Clear-Host
Write-Host "Offboard a user

"

<# --- Active Directory account dispensation section --- #>
do{

# Get the name of the account to disable from the admin
$sam = Read-Host 'Account name to disable'

# Get the properties of the account and set variables
$user = Get-ADuser $sam -properties canonicalName, distinguishedName, displayName
$dn = $user.distinguishedName
$cn = $user.canonicalName
$din = $user.displayName
$UserAlias = $user.mailNickname

# Path building
$path1 = "D:\OffboardedUsersPermissions\"
$path2 = "-AD-DisabledUserPermissions.csv"
$pathFinal = $path1 + $din + $path2

# Disable the account
Disable-ADAccount $sam
Write-Host ($din + "'s Active Directory account is disabled.")

# Reset password
Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "tK26#bghasSjfxp=pof" -Force) $sam
Write-Host ("* " + $din + "'s Active Directory password has been changed.")

# Add the OU path where the account originally came from to the description of the account's properties
Set-ADUser $dn -Description ("Moved from: " + $cn + " - on $date")
Write-Host ("* " + $din + "'s Active Directory account path saved.")

# Get the list of permissions (group names) and export them to a CSV file for safekeeping
$groupinfo = get-aduser $sam -Properties memberof | select name, 
@{ n="GroupMembership"; e={($_.memberof | foreach{get-adgroup $_}).name}}

$count = 0
$arrlist =  New-Object System.Collections.ArrayList
do{
    $null = $arrlist.add([PSCustomObject]@{
        # Name = $groupinfo.name
        GroupMembership = $groupinfo.GroupMembership[$count]
    })
    $count++
}until($count -eq $groupinfo.GroupMembership.count)

$arrlist | select groupmembership |
convertto-csv -NoTypeInformation |
select -Skip 1 |
out-file $pathFinal
Write-Host ("* " + $din + "'s Active Directory group memberships (permissions) exported and saved to " + $pathFinal)

# Strip the permissions from the account
Get-ADUser $User -Properties MemberOf | Select -Expand MemberOf | %{Remove-ADGroupMember $_ -member $User}
Write-Host ("* " + $din + "'s Active Directory group memberships (permissions) stripped from account")

# Move the account to the Disabled Users OU
Move-ADObject -Identity $dn -TargetPath "Ou=Terminated,Ou=CORP,DC=corp,DC=varomoney,DC=com"
Write-Host ("* " + $din + "'s Active Directory account moved to 'Terminated' OU")
Write-Host ("Repeat? Y or N to exit script")
$response = read-host "Repeat?"
}
while ($response -eq "Y")