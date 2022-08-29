param(
[string] [Parameter(Mandatory=$true)] $resourceGroup,
[string] [Parameter(Mandatory=$true)] $afdProfile,
[string] [Parameter(Mandatory=$true)] $afdEndpoint
)

$ErrorActionPreference = 'Stop'
$DeploymentScriptOutputs = @{}
$afdHostNameOutputLine = az afd endpoint show -g testafd103 --endpoint-name testafd103-afdendpoint --profile-name testafd103-afdprofile-7acaba4f090fa4385b46 | Select-String -Pattern '( )*"hostName":( )*"[a-z]([a-z0-9]|-)*.z01.azurefd.net"( )*,(.)*'
$afdHostLine = $afdHostNameOutputLine[0].ToString()
$afdEndpointStartIndex = $afdHostLine.IndexOf('"',$afdHostLine.IndexOf(':')+1)
$afdEndpointEndIndex = $afdHostLine.IndexOf('azurefd.net')+10
$DeploymentScriptOutputs['afdHostName'] = $afdHostLine.Substring($afdEndpointStartIndex+1, $afdEndpointEndIndex-$afdEndpointStartIndex)