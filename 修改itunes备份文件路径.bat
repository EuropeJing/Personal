@echo off
:BACK
color 0F
cls
echo 修改itunes备份文件路径
echo PS:win7以上请用管理员身份运行

set path=D:\iTunes Backup
set pathcheck=D:\iTunes Backup

echo.
echo 默认修改后路径为"D:\iTunes Backup"
echo 回车输入默认路径
set /P path=[请输入修改后的路径，不用加引号]
echo.
echo 修改后路径为"%path%"
set /P pathcheck=[请重复一次修改后的路径，不用加引号]

if /i "%path%" == "%pathcheck%" (goto NEXT) else (
color 4F
echo 两次路径不一致
pause
goto BACK
)

:NEXT
color 0A
echo.
MD "%path%\Backup"
%SystemRoot%\system32\xcopy "C:\Users\%username%\AppData\Roaming\Apple Computer\MobileSync\Backup" "%path%\Backup" /E /K /O /Y
if ERRORLEVEL 1 (
  RD /S /Q "%path%\Backup"
  echo 修改失败，请尝试重新运行文件
) Else (
  RD /S /Q "C:\Users\%username%\AppData\Roaming\Apple Computer\MobileSync\Backup"
  mklink /J "C:\Users\%username%\AppData\Roaming\Apple Computer\MobileSync\Backup" "%path%\Backup"
)
pause
