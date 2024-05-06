shutdown -a
Remove-Item -Path "HKLM:\SOFTWARE\AirWatchMDM\AppDeploymentAgent\AppManifests\{622258FC-6A50-4297-A254-C613AD4D18B6}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\AirWatchMDM\AppDeploymentAgent\AppManifests\{49F5EE77-812F-4DB0-BD24-F74664F05F00}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\AirWatchMDM\AppDeploymentAgent\Queue*" -Recurse