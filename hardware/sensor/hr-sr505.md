# 개요
 - 휴먼감지센서인 SR505 제품을 사용할 때 주의 점
 - https://www.devicemart.co.kr/goods/view?no=1327425
 - https://static.rapidonline.com/pdf/78-4110_v1.pdf

## 내용
 - 내가 어디서 뭘 잘못 보았는지 모르겠으나 분명 시트에 4.5v ~ 20v 까지 사용이 가능하다고 되어있음
 - esp32 에서 제공되는 3.3v 에 vcc 를 연결했더니 계속 HIGH 상태였음
 - 정상 작동시에도 4초 정도 사람이 인식되는데 시간이 걸림 물론 사람이 빠져도 4초 정도는 필요함
 - 다시보자 메뉴얼

