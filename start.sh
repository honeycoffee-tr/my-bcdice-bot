#!/bin/bash

# 현재 디렉토리로 이동
cd "$(dirname "$0")"

# 환경변수에서 토큰 확인
if [ -z "$DISCORD_BOT_TOKEN" ]; then
    echo "❌ DISCORD_BOT_TOKEN 환경변수가 설정되지 않았습니다."
    echo "Railway 배포 시에는 자동으로 설정됩니다."
    echo "로컬 테스트를 위해서는 환경변수에 토큰을 설정해주세요."
    echo ""
    echo "설정 방법:"
    echo "export DISCORD_BOT_TOKEN=여기에_토큰_입력"
    echo ""
    exit 1
fi

# 기타 설정들
export BCDICE_API_URL=${BCDICE_API_URL:-"https://bcdice.onlinesession.app/"}
export IGNORE_ERROR=${IGNORE_ERROR:-"1"}
export BCDICE_PASSWORD=${BCDICE_PASSWORD:-"gjslans0526o"}
export BCDICE_DEFAULT_SYSTEM=${BCDICE_DEFAULT_SYSTEM:-"DiceBot"}

echo "===================================="
echo "🎲 Discord BCDice Bot 시작"
echo "===================================="
echo "API URL: $BCDICE_API_URL"
echo "기본 시스템: $BCDICE_DEFAULT_SYSTEM"
echo "===================================="

# Java 애플리케이션 실행
java -jar discord-bcdicebot.jar "$DISCORD_BOT_TOKEN" "$BCDICE_API_URL" "$IGNORE_ERROR"

echo ""
echo "봇이 종료되었습니다."