$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

$folderNameBase64 = "UHJvamVjdDA0LU1vY2vnlLXllYbmlK/ku5jpgIDmrL7mtYHnqIs="
$folderName = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($folderNameBase64))

$newmanArgs = @(
  "run",
  ".\collections\mockTest.postman_collection.json",
  "-e",
  ".\environments\JSONPlaceholder-Test.postman_environment.json",
  "--folder",
  $folderName,
  "-r",
  "cli,htmlextra",
  "--reporter-htmlextra-export",
  ".\reports\mock-payment-refund-report.html"
)

& newman.cmd @newmanArgs
