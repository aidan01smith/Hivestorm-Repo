# Basic Initialization Script to run on a Windows AD box at the beginning of the competition
# - Locks down Group Policy + Enables Windows Defender, Windows Firewall, and Windows 

## How to use:
# On a windows system run the following command in Admin PS to retrive files --> Then run the script
#
# Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/aidan01smith/Hivestorm-Repo/refs/heads/main/Windows/basic-init.ps1' -OutFile .\basic-init.ps1

# Installs Malware Bytes
Invoke-WebRequest -Uri 'https://downloads.malwarebytes.com/file/mb-windows?_gl=1*1uvwrxs*_gcl_au*MTQ2NTMwMjMzMi4xNzI5MDk1MDk4*_ga*MTg2MTY2MTg2OC4xNzI5MDk1MDk4*_ga_K8KCHE3KSC*MTcyOTA5NTA5OC4xLjEuMTcyOTA5NTEwOS40OS4wLjA.&_ga=2.231879703.96926975.1729095099-1861661868.1729095098' -OutFile C:\mbytes.exe
C:\mbytes.exe /VERYSILENT /NORESTART

## ^^ Install should now be availabe to use, remove trial subscription --> then run scan
