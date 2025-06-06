@echo off
cd /d %~dp0

REM 토큰을 환경변수에서 가져오기 (GitHub에 토큰이 노출되지 않음)
if "%DISCORD_BOT_TOKEN%"=="" (
    echo DISCORD_BOT_TOKEN 환경변수가 설정되지 않았습니다.
    echo Railway 배포 시에는 자동으로 설정됩니다.
    echo 로컬 테스트를 위해서는 시스템 환경변수에 토큰을 설정해주세요.
    pause
    exit /b 1
)

REM 기타 설정들
set BCDICE_API_URL=https://bcdice.onlinesession.app/
set IGNORE_ERROR=1
set BCDICE_PASSWORD=gjslans0526o
set BCDICE_DEFAULT_SYSTEM=DiceBot

echo ====================================
echo Discord BCDice Bot 시작
echo ====================================
echo API URL: %BCDICE_API_URL%
echo 기본 시스템: %BCDICE_DEFAULT_SYSTEM%
echo ====================================

java -jar discord-bcdicebot.jar %DISCORD_BOT_TOKEN% %BCDICE_API_URL% %IGNORE_ERROR%

echo.
echo 봇이 종료되었습니다.
pause