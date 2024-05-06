wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name=”C:\\pagefile.sys” set InitialSize=10500,MaximumSize=12500