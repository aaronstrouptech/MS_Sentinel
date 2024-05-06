Import-Certificate -FilePath "C:\Windows\security\certs\cert_Varo-SLC-root.crt" -CertStoreLocation Cert:\LocalMachine\Root
Import-Certificate -FilePath "C:\Windows\security\certs\cert_Varo-SLC-root.crt" -CertStoreLocation Cert:\LocalMachine\CA
Import-Certificate -FilePath "C:\Windows\security\certs\cert_Varo-SLC-root.crt" -CertStoreLocation Cert:\LocalMachine\AuthRoot