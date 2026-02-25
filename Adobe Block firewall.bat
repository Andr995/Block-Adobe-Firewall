@echo off
title Blocco Adobe Firewall Rules
echo Ricerca e blocco degli eseguibili Adobe in corso...
echo.

:: Blocca file in Programmi e Programmi (x86)
if exist "C:\Program Files\Adobe" (
    for /R "C:\Program Files\Adobe" %%X in (*.exe) do (
        echo Blocco: %%~nX
        netsh advfirewall firewall add rule name="%%~nX - Adobe Block" dir=out program="%%X" action=block
        netsh advfirewall firewall add rule name="%%~nX - Adobe Block" dir=in program="%%X" action=block
    )
)

if exist "C:\Program Files (x86)\Adobe" (
    for /R "C:\Program Files (x86)\Adobe" %%X in (*.exe) do (
        echo Blocco: %%~nX
        netsh advfirewall firewall add rule name="%%~nX - Adobe Block" dir=out program="%%X" action=block
        netsh advfirewall firewall add rule name="%%~nX - Adobe Block" dir=in program="%%X" action=block
    )
)

if exist "C:\Program Files (x86)\Common Files\Adobe" (
    for /R "C:\Program Files (x86)\Common Files\Adobe" %%X in (*.exe) do (
        echo Blocco: %%~nX
        netsh advfirewall firewall add rule name="%%~nX - Adobe Block" dir=out program="%%X" action=block
        netsh advfirewall firewall add rule name="%%~nX - Adobe Block" dir=in program="%%X" action=block
    )
)

echo.
echo Operazione di blocco completata.
pause