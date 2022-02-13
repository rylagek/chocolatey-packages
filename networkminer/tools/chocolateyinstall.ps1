
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.netresec.com/?download=NetworkMiner'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'ZIP'
  url            = $url

  softwareName   = 'networkminer*'

  checksum       = '094e14271a560a8880d3dded329c3d7cd9c84bdee527f926261c1b080a639b7f'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs