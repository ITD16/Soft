@echo off
echo ====== DANG TIM & XOA CHROME PROFILE CO THAT ======

:: Tắt Chrome nếu đang chạy
taskkill /F /IM chrome.exe >nul 2>&1

:: Quét các user folder
for /d %%u in (C:\Users\*) do (
    if exist "%%u\AppData\Local\Google\Chrome\User Data" (
        echo ➤ Tìm thấy: %%u\AppData\Local\Google\Chrome\User Data
        rd /s /q "%%u\AppData\Local\Google\Chrome\User Data"
        echo ✅ Đã xoá dữ liệu Chrome trong %%u
    )
)

echo ✅ Hoàn tất xoá Chrome từ mọi user đã login.
