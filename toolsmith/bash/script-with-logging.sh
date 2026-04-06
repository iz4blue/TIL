#!/bin/bash

# 스크립트가 위치한 디렉토리의 절대 경로 추출
SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" &> /dev/null && pwd)

# 스크립트 파일명 및 로그 경로 설정
SCRIPT_NAME=$(basename "$0")
SCRIPT_BASE="${SCRIPT_NAME%.*}"

# 로그 디렉토리를 스크립트 위치 하위의 logs 폴더로 지정
LOG_DIR="${SCRIPT_DIR}/logs"
LOG_FILE="${LOG_DIR}/${SCRIPT_BASE}.log"

# 로그 디렉토리가 없으면 생성
mkdir -p "$LOG_DIR"

# 표준 출력(stdout) 자동 처리
# 초 단위가 바뀌었을 때만 헤더(시간)를 출력하고, 내용은 항상 들여쓰기함
exec > >(awk -v tag="INFO" '
    {
        current_time = strftime("%Y-%m-%d %H:%M:%S");
        if (current_time != last_time) {
            print "\n[" tag "] " current_time;
            last_time = current_time;
        }
        print "  " $0;
        fflush();
    }' >> "$LOG_FILE")

# 표준 에러(stderr) 자동 처리
exec 2> >(awk -v tag="ERROR" '
    {
        current_time = strftime("%Y-%m-%d %H:%M:%S");
        if (current_time != last_time) {
            print "\n[" tag "] " current_time;
            last_time = current_time;
        }
        print "  " $0;
        fflush();
    }' >> "$LOG_FILE")

# --- 아래부터는 기존 스크립트 내용을 그대로 두시면 됩니다 ---

echo "작업을 시작합니다."
sleep 1
echo -e "이것은\n여러 줄로 구성된\n출력 테스트입니다."
ls -al /root
cat /nonexistent_file  # 에러 발생 테스트

