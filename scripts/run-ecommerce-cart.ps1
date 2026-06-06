# Run the ecommerce cart Postman folder with Newman and export an HTML report.

$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

$newman = Get-Command "newman.cmd" -ErrorAction SilentlyContinue
if (-not $newman) {
    $newmanPath = Join-Path $env:APPDATA "npm\newman.cmd"
    if (Test-Path $newmanPath) {
        $newman = $newmanPath
    }
}

if (-not $newman) {
    throw "newman.cmd was not found. Install Newman with: npm.cmd install -g newman"
}

if (-not (Test-Path "reports")) {
    New-Item -ItemType Directory -Path "reports" | Out-Null
}

# UTF-8 Base64 for: Project02-<Chinese ecommerce cart folder name>
$folderName = [System.Text.Encoding]::UTF8.GetString(
    [Convert]::FromBase64String("UHJvamVjdDAyLeeUteWVhui0reeJqei9pua1geeoiw==")
)

& $newman run "collections\mockTest.postman_collection.json" `
    -e "environments\JSONPlaceholder-Test.postman_environment.json" `
    --folder $folderName `
    -r "cli,htmlextra" `
    --reporter-htmlextra-export "reports\ecommerce-cart-report.html"
