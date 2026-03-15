# 개요
- vaultwarden 을 이용하면서 알게된 지식

## IPv6 허용을 위해서는
- `ROCKET_ADDRESS` 의 환경 변수를 설정해야 함
  - Rust 웹 프레임워크로 만들어져서 그럼
- `/opt/vaultwarden/.env` 파일을 수정하여 `ROCKET_ADDRESS=::` 으로 수정하면 됨


