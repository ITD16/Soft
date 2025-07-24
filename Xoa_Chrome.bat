@echo off
echo =========== D?N D?P CHROME TOÀN DI?N ==========

:: T?t Chrome
echo Ðóng Chrome...
taskkill /F /IM chrome.exe >nul 2>&1

:: Xoá toàn b? User Data c?a Chrome
echo Xoá toàn b? profile Chrome...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data"