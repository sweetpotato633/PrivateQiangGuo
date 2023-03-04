@echo off
goto start


:color_red
echo [31m[*] %1[0m
exit /b 0

:color_green
echo [32m[*] %1[0m
exit /b 0

:color_yellow
echo [33m[*] %1[0m
exit /b 0

:color_blue
echo [34m[*] %1[0m
exit /b 0

:replace_dir
call :color_yellow ��Ҫ��Ϣ��
echo ��Ŀ¼�����ϣ���ת�� TechXuexi-master-clone Ŀ¼
echo ���Զ�Ϊ������ user �ļ��к� chrome �ļ��У���Ϊ�û����ݣ�
echo Ϊ��֤����������ȷ��һ��Ŀ¼���Ƿ��Ѿ����������ļ���
echo ���ɽ� TechXuexi-master-clone ����������ݣ���.git�ļ��У��滻���ļ��е���������
exit /b 0


:start
set repo_url1=https://hub.fastgit.xyz/TechXueXi/TechXueXi.git
set repo_url2=https://hub.fastgit.org/TechXueXi/TechXueXi.git
set push_url=git@github.com:TechXueXi/TechXueXi.git

if exist "_unavailable_dir" (
	call :replace_dir
	goto end
)

:enter_file_path
set file_path=%~dp0
%file_path:~0,1%:
cd "%file_path%"

:test_have_git
call :color_green ���˵������ް�װgit
git --version
if %ERRORLEVEL% equ 0 (
    goto have_git
) else (
    goto not_have_git
)

:have_git
:test_is_git_repo
call :color_green �����ļ����Ƿ���git��
git remote -v
if %ERRORLEVEL% equ 0 (
    goto is_a_repo
) else (
    goto git_init
)

:is_a_repo
call :color_green ���ڼ��remote��ַ����
git remote -v >nul 2>nul
git config remote.origin.url %repo_url1%
git config remote.origin.pushurl %push_url%
git remote -v
call :color_green ��ȡԶ�̴��루���ڴ˿�ס10�����Ͽɹر����´򿪣�
git fetch
call :color_green �ݴ��޸�
git stash save "pull_auto_stash"
call :color_green ����...�����ڴ˿�ס10�����Ͽɹر����´򿪣�
git pull --rebase
call :color_green �ָ��޸�
git stash pop
git checkout windowsϵͳgit_pull_һ������.bat
call :color_green ���
goto end


:git_init
call :color_green �������´��뵽TechXuexi-master-clone�ļ���
git clone -b master %repo_url1% TechXuexi-master-clone
if %ERRORLEVEL% equ 0 (
	call :color_green �����û������ļ�...
	xcopy /E /V /K /I /Y /Q SourcePackages\user TechXuexi-master-clone\SourcePackages\user
	xcopy /E /V /K /I /Y /Q SourcePackages\chrome TechXuexi-master-clone\SourcePackages\chrome
	echo. >_unavailable_dir
	call :color_green ���.
	call :replace_dir
	goto end
) else (
	call :color_red ���ִ����뷴�������⣺git_clone_����
	goto end
)

:not_have_git
call :color_yellow �Ҳ���git��������������װgit���ٴ����С�
goto end




:end
set/p=���س����˳�����...

