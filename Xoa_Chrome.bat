@echo off
echo =========== D?N D?P CHROME TO�N DI?N ==========

:: T?t Chrome
echo ��ng Chrome...
taskkill /F /IM chrome.exe >nul 2>&1

:: Xo� to�n b? User Data c?a Chrome
echo Xo� to�n b? profile Chrome...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data"