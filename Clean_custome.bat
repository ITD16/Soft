echo Đóng các ứng dụng được chỉ định...

:: A. Đóng
:: 1. OBS
	echo [1/11] Đóng OBS.....
	taskkill /F /IM obs64.exe >nul 2>&1
	taskkill /F /IM obs.exe >nul 2>&1

:: 2. Studio Monitor (phiên bản khác nhau có thể tên khác)
	echo [2/11] Đóng Studio Monitor.....
	taskkill /F /IM StudioMonitor.exe >nul 2>&1
	taskkill /F /IM Application.Network.StudioMonitor.x64.exe >nul 2>&1

:: 3. NDI Launcher
	echo [3/11] Đóng NDI Launcher.....
	taskkill /F /IM "NDI Launcher.exe" >nul 2>&1
	taskkill /F /IM Launcher.exe >nul 2>&1

:: Dự phòng: tắt theo tên cửa sổ có chữ "NDI"
	powershell -Command "Get-Process | Where-Object { $_.MainWindowTitle -like '*NDI*' } | Stop-Process -Force"

:: 4. Telegram
	echo [4/11] Đóng Telegram.....
	taskkill /F /IM Telegram.exe >nul 2>&1

:: 5. Chrome & Firefox
	echo [5/11] Đóng Chrome và Firefox.....
	taskkill /F /IM chrome.exe >nul 2>&1
	taskkill /F /IM firefox.exe >nul 2>&1

:: 6. Notepad
	echo [6/11] Đóng Notepad.....
	taskkill /F /IM notepad.exe >nul 2>&1

:: 7. xVmix
	echo [7/11] Đóng xVmix.....
	taskkill /F /IM xVmix.exe >nul 2>&1
	taskkill /F /IM xVmix64.exe >nul 2>&1

:: 8. Đóng Microsoft Edge
	echo [8/11] Đóng Edge.....
	taskkill /F /IM msedge.exe >nul 2>&1

:: 9. Đóng cửa sổ File Explorer
	echo [9/11] Đóng cửa sổ File Explorer người dùng mở....
	powershell -Command "Get-Process | Where-Object { $_.ProcessName -eq 'explorer' -and $_.MainWindowHandle -ne 0 } | Stop-Process -Force"

:: 10. Xem ảnh
	echo [10/11] Đóng Xem ảnh.....
	taskkill /F /IM PhotosApp.exe >nul 2>&1
	taskkill /F /IM dllhost.exe >nul 2>&1

:: 11. Xem video
	echo [11/11] Đóng xem video.....
	taskkill /F /IM Video.UI.exe >nul 2>&1
	taskkill /
==============

:: B. Xoá
::1. Xoá toàn bộ dữ liệu người dùng Chrome

	echo [1/7] Xoá toàn bộ dữ liệu người dùng Chrome...
		for /d %%u in (C:\Users\*) do (
 		   if exist "%%u\AppData\Local\Google\Chrome\User Data" (
    		    echo     -> Đang xoá dữ liệu của: %%u
    		    rd /s /q "%%u\AppData\Local\Google\Chrome\User Data"
 		   )
		)

:: 2. Xoá toàn bộ dữ liệu Firefox
	echo [2/7] Đang xoá toàn bộ dữ liệu Firefox...
		for /d %%u in (C:\Users\*) do (
  		  if exist "%%u\AppData\Roaming\Mozilla\Firefox" (
   		     echo     -> Firefox: Xoá dữ liệu của %%u
   		     rd /s /q "%%u\AppData\Roaming\Mozilla\Firefox"
  		  )
  		  if exist "%%u\AppData\Local\Mozilla\Firefox" (
   		     rd /s /q "%%u\AppData\Local\Mozilla\Firefox"
   		 )
		)
:: 3. Xoá dữ liệu Edge
	echo [3/7] Xoá dữ liệu Microsoft Edge...
		for /d %%u in (C:\Users\*) do (
 		   if exist "%%u\AppData\Local\Microsoft\Edge\User Data" (
     		   echo     → Edge: %%~nxu
     		   rd /s /q "%%u\AppData\Local\Microsoft\Edge\User Data"
   		 )
		)
::4. Xóa thư mục C:\Program Files\OBS...
	echo [4/7] Xóa thư mục C:\Program Files\OBS...
		:: Chiếm quyền thư mục nếu bị khóa (yêu cầu chạy bằng admin)
		takeown /F "C:\Program Files\OBS" /R /D Y >nul 2>&1
		icacls "C:\Program Files\OBS" /grant administrators:F /T >nul 2>&1

		:: Xóa thư mục
		rd /s /q "C:\Program Files\OBS"

:: 5. Xóa file trong các thư mục người dùng
	echo [5/7] XOÁ FILE + THƯ MỤC TRONG NGƯỜI DÙNG + QUICK ACCESS
	@echo off
	echo ========== XOÁ FILE + THƯ MỤC TRONG NGƯỜI DÙNG + QUICK ACCESS ==========

	:: Xoá trong Downloads, Documents, Pictures
		for /d %%u in (C:\Users\*) do (
   		 echo --- Xoá thư mục trong %%u\Downloads
  		  for /d %%d in ("%%u\Downloads\*") do rd /s /q "%%d"
  		  del /f /q "%%u\Downloads\*" >nul 2>&1

  		  echo --- Xoá thư mục trong %%u\Documents
  		  for /d %%d in ("%%u\Documents\*") do rd /s /q "%%d"
  		  del /f /q "%%u\Documents\*" >nul 2>&1

  		  echo --- Xoá thư mục trong %%u\Pictures
  		  for /d %%d in ("%%u\Pictures\*") do rd /s /q "%%d"
  		  del /f /q "%%u\Pictures\*" >nul 2>&1
		)

	:: Xoá Recent Files + JumpList (Quick Access)
		echo --- Xoá Quick Access (Recent Files, JumpList)
		for /d %%u in (C:\Users\*) do (
  		  del /f /q "%%u\AppData\Roaming\Microsoft\Windows\Recent\*" >nul 2>&1
   		 del /f /q "%%u\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
  		  del /f /q "%%u\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1
		)
	echo.
=============================
:: 6. XÓA FILE & FOLDER TRÊN DESKTOP
	echo [6/7] 5. XÓA FILE & FOLDER TRÊN DESKTOP
		@echo off
		echo ========== XÓA FILE & FOLDER TRÊN DESKTOP, GIỮ LẠI SHORTCUT ==========

			for /d %%u in (C:\Users\*) do (
   			 echo --- Đang xử lý Desktop của %%u

    			:: Xoá tất cả thư mục trên Desktop
   			 for /d %%d in ("%%u\Desktop\*") do (
    			    rd /s /q "%%d"
   			 )

   			 :: Xoá tất cả file KHÔNG PHẢI shortcut (.lnk) VÀ KHÔNG PHẢI Clean_custome.bat
   			 for %%f in ("%%u\Desktop\*") do (
     			   set "fname=%%~nxf"
      			  call :DeleteIfNotShortcutAndNotCustom "%%f"
  			  )
			)
		echo.
	echo ✅ Đã xoá xong, giữ shortcut và Clean_custome.bat.
		exit /b

			:DeleteIfNotShortcutAndNotCustom
			setlocal
			set "target=%~1"
			set "ext=%~x1"
			set "name=%~nx1"
			if /i "%ext%"==".lnk" exit /b
			if /i "%name%"=="Clean_custome.bat" exit /b
			del /f /q "%target%" >nul 2>&1
			endlocal
			exit /b

=============

echo [7/7] ĐÓNG TELEGRAM & GỠ CÀI ĐẶT TOÀN HỆ THỐNG
	@echo off
	echo ========== ĐÓNG TELEGRAM & GỠ CÀI ĐẶT TOÀN HỆ THỐNG ==========

		for /d %%u in (C:\Users\*) do (
 		   set "tele=%%u\AppData\Roaming\Telegram Desktop\unins000.exe"
 		   if exist "%%u\AppData\Roaming\Telegram Desktop\unins000.exe" (

    		    echo → Đóng Telegram của user %%~nxu...
    		    taskkill /F /IM Telegram.exe >nul 2>&1

   		     echo → Gỡ Telegram: %%~nxu
  		      start "" "%%u\AppData\Roaming\Telegram Desktop\unins000.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
   		 )
		)
	echo.
	echo ✅ Đã xử lý đóng và gỡ Telegram nếu có.