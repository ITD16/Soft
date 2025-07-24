@echo off
echo =========== DỌN DẸP CHROME TOÀN DIỆN ==========

:: Tắt Chrome
echo Đóng Chrome...
taskkill /F /IM chrome.exe >nul 2>&1

:: Xoá toàn bộ User Data của Chrome
echo Xoá toàn bộ profile Chrome...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data"