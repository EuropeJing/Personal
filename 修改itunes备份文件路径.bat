@echo off
:BACK
color 0F
cls
echo �޸�itunes�����ļ�·��
echo PS:win7�������ù���Ա�������

set path=D:\iTunes Backup
set pathcheck=D:\iTunes Backup

echo.
echo Ĭ���޸ĺ�·��Ϊ"D:\iTunes Backup"
echo �س�����Ĭ��·��
set /P path=[�������޸ĺ��·�������ü�����]
echo.
echo �޸ĺ�·��Ϊ"%path%"
set /P pathcheck=[���ظ�һ���޸ĺ��·�������ü�����]

if /i "%path%" == "%pathcheck%" (goto NEXT) else (
color 4F
echo ����·����һ��
pause
goto BACK
)

:NEXT
color 0A
echo.
MD "%path%\Backup"
copy "C:\Users\%username%\AppData\Roaming\Apple Computer\MobileSync\Backup" "%path%\Backup"
if ERRORLEVEL 1 (
  RD /S /Q "%path%\Backup"
  echo �޸�ʧ�ܣ��볢�����������ļ�
) Else (
  RD /S /Q "C:\Users\%username%\AppData\Roaming\Apple Computer\MobileSync\Backup"
  mklink /J "C:\Users\%username%\AppData\Roaming\Apple Computer\MobileSync\Backup" "%path%\Backup"
)
pause