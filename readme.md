## Usage

Run in powershell with *elevated* permissions: 
> `Set-ExecutionPolicy Bypass -Force -Scope Process; Invoke-WebRequest https://raw.githubusercontent.com/chrisb-de/scripts/master/SystemInstall.ps1 -UseBasicParsing | Invoke-Expression`