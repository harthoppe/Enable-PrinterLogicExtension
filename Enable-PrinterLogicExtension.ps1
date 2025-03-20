$chromePath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
if (Test-Path $chromePath) {
    Write-Host "Google Chrome is installed. Enabling PrinterLogic Extension in Chrome."
    try {
        REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "1" /t REG_SZ /d "bfgjjammlemhdcocpejaompfoojnjjfn;https://clients2.google.com/service/update2/crx" /f
        Write-Host "Chrome registry update succeeded."
    } catch {
        Write-Error "Error updating Chrome registry: $_"
    }
} else {
    Write-Host "Google Chrome is not installed, cannot enable PrinterLogic Extension in Chrome."
    return
}
Write-Host "Enabling PrinterLogic Extension in Microsoft Edge."
try {
    REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /v "1" /t REG_SZ /d "cpbdlogdokiacaifpokijfinplmdiapa;https://edge.microsoft.com/extensionwebstorebase/v1/crx" /f
    Write-Host "Edge registry update succeeded."
} catch {
    Write-Error "Error updating Edge registry: $_"
}