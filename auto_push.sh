#!/bin/bash

WATCH_DIR="."  # 현재 디렉토리를 감시
BRANCH="main"  # 사용할 브랜치

echo "🛠 자동 감지 시작... 변경 사항이 생기면 자동으로 푸시됩니다."

while fswatch -1 -r "$WATCH_DIR"; do
    git add .
    commit_message="Auto commit on $(date +"%Y-%m-%d %H:%M:%S")"
    git commit -m "$commit_message"
    git push origin $BRANCH
    echo "✅ 자동 업로드 완료! ($commit_message)"
done

