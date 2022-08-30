param(
[string] [Parameter(Mandatory=$true)] $resourceGroup,
[string] [Parameter(Mandatory=$true)] $afdProfile,
[string] [Parameter(Mandatory=$true)] $afdEndpoint
)

$afdHostNameOutputLine = az afd endpoint show -g testafd103 --endpoint-name testafd103-afdendpoint --profile-name testafd103-afdprofile-7acaba4f090fa4385b46 | Select-String -Pattern '( )*"hostName":( )*"[a-z]([a-z0-9]|-)*.z01.azurefd.net"( )*,(.)*'
