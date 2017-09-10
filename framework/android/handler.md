# 목적
- handler 이해하기
- 참고 : http://arabiannight.tistory.com/entry/331

# 간단히
- 안드로이드에서는 메인스레드와 서브스레드 간의 통신을 위해 Handler를 사용하게 되는데 Handler는 메시지큐를 사용한 메시지 전달 방법을 사용하게 됩니다. Handler에 Message가 들어오면 순서대로 쌓여서 FIFO(First in First Out) 형태로 메시지를 처리하게 됩니다. 가장 처음 들어온 Message를 우선 처리하게 됩니다.
