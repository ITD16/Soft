@echo off
echo ========== XOA TOAN BO DULIEU CHROME ==========

:: 1. Tắt Chrome
echo Đóng Chrome...
taskkill /F /IM chrome.exe >nul 2>&1

:: 2. Xóa toàn bộ dữ liệu user của Chrome
echo Xóa thư mục: %LOCALAPPDATA%\Google\Chrome\User Data
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data"

:: 3. Xóa backup session còn sót ở AppData\Roaming
echo Xóa %APPDATA%\Google\Chrome
rd /s /q "%APPDATA%\Google\Chrome"

:: 4. Xóa thư mục crash restore Chrome nếu có
rd /s /q "%LOCALAPPDATA%\CrashDumps" >nul 2>&1

:: 5. Xóa thư mục Chrome profile "System Profile" nếu tồn tại
rd /s /q "C:\Windows\System32\config\systemprofile\AppData\Local\Google\Chrome" >nul 2>&1

:: 6. Xóa thư mục Session Restore dạng thô
del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\*Session*" >nul 2>&1
del /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\*Tabs*" >nul 2>&1

echo ✅ Đã xóa sạch dữ liệu và cache Chrome.
pause
