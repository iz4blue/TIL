# 개요
- vaultwarden 을 이용하면서 알게된 지식

## IPv6 허용을 위해서는
- `ROCKET_ADDRESS` 의 환경 변수를 설정해야 함
  - Rust 웹 프레임워크로 만들어져서 그럼
- `/opt/vaultwarden/.env` 파일을 수정하여 `ROCKET_ADDRESS=::` 으로 수정하면 됨

## 회원가입을 막으려면
- ADMIN_TOKEN 을 설정한 이후 admin 페이지에서 설정을 변경해야 함 ( Default URL + /admin )
- `/opt/vaultwarden/bin/vaultwarden hash` 와 같은 형태로 암호를 생성하고
- `/opt/vaultwarden/.env` 에서 ADMIN_TOKEN 에 값을 설정하고
- 'Allow new signups' 의 값을 false
- 하지만 가입하기 버튼과 페이지는 예전 그대로 보이나 실제 가입은 되지 않음

## SSH-Key 를 보관하려면
- Web 버전의 경우 2026.1.1 에서도 막혀 있음
- macOS 버젼의 클라이언트인 경우 생성 후 수정으로 받아올 수 있음


