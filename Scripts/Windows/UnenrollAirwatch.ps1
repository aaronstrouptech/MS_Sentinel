## Removes Enrollments folder in Registry
Remove-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Enrollments\*" -Recurse
## Uninstalls Intelligent Hub silently
msiexec /x '{12E6A912-F946-445C-94FC-068BC8FB820A}' /qn
## Installs Airwatch
msiexec /i "AirwatchAgent.msi" /qn