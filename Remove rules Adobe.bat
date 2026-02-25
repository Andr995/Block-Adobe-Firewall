@echo off
title Rimozione Blocco Adobe Firewall Rules
echo Rimozione delle regole di blocco per Adobe in corso...
echo.

:: Rimuove le regole create con lo script Batch originale (nome: "NomeProgramma - Adobe Block")
echo Rimozione regole con nome: * - Adobe Block
netsh advfirewall firewall delete rule name=all program="C:\Program Files\Adobe\*" | findstr /i "Adobe Block"
netsh advfirewall firewall delete rule name=all program="C:\Program Files (x86)\Adobe\*" | findstr /i "Adobe Block"
netsh advfirewall firewall delete rule name=all program="C:\Program Files (x86)\Common Files\Adobe\*" | findstr /i "Adobe Block"

:: Metodo alternativo: rimuove TUTTE le regole che contengono la frase "Adobe Block" nel nome.
:: Questo è più efficace perchè non dipende dal percorso del programma.
for /f "tokens=*" %%a in ('netsh advfirewall firewall show rule name=all ^| findstr /i "Adobe Block"') do (
    echo Rimozione regola: %%a
    netsh advfirewall firewall delete rule name="%%a"
)

:: Rimuove le regole create con lo script PowerShell (nome: "BLOCK ADobe - ...")
for /f "tokens=*" %%a in ('netsh advfirewall firewall show rule name=all ^| findstr /i "BLOCK ADobe"') do (
    echo Rimozione regola: %%a
    netsh advfirewall firewall delete rule name="%%a"
)

echo.
echo Operazione di rimozione completata.
echo Controlla nel firewall se le regole sono state rimosse.
pause