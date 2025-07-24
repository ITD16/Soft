@echo off
echo =====================

echo Dong Chrome...
taskkill /F /IM chrome.exe >nul 2>&1

:: dell all data user
echo Dell all profile Chrome...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data"
