@echo off
echo ======== XOA DU LIEU CHROME - AUTO USER DETECT ========

:: 1. Tắt Chrome
taskkill /F /IM chrome.exe >nul 2>&1

:: 2. Tìm user đang login (bỏ qua SYSTEM)
for /f "tokens=1,*" %%a in ('query user ^| findstr /i "active"') do set realuser=%%a

:: 3. Gán đường dẫn user profile
set "ChromePath=C:\Users\%realuser%\AppData\Local\Google\Chrome\User Data"

:: 4. Xoá nếu có
if exist "%ChromePath%" (
    echo Dang xoa Chrome profile cua user: %realuser%
    rd /s /q "%ChromePath%"
) else (
    echo ❗ Khong tim thay du lieu Chrome cho user %realuser%.
)

echo ✅ Hoan tat.
