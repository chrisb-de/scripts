@call :GetPw NewPassword
for %%I in (.) do set CurrDirName=%%~nxI

dotnet dev-certs https --trust
dotnet dev-certs https --trust --check

set certPath=%APPDATA%\ASP.NET\https\%CurrDirName%.pfx

dotnet dev-certs https --trust -ep %certPath% -p %NewPassword%
dotnet user-secrets set Kestrel:Certificates:Development:Password %NewPassword%

@goto :eof
:GetPw
 @set _pw=%computername%%date%%time%
 @set _pw=%_pw:/=%
 @set _pw=%_pw:.=%
 @set _pw=%_pw: =%
 @set _pw=%_pw:,=%
 @set _pw=%_pw::=%
 @set _pw=%_pw:-=%
 @set %1=%_pw%
@goto :eof