# Create ArrayList from array
- array 에서 ArrayList 로 변환할 때 java 내장 함수를 쓰자.
- 그냥 직접 카피하면 lint 의 안내로 경고문을 만나게 된다.

# 예시
- 아래와 같이 array 를 ArrayList 로 변환할 때 다음과 같이 한다.
```
	gItems = new ArrayList<>();

	for (WebItem i : items) {
		gItems.add(i);
	}
```
- 다음과 같이 수정할 수 있음

```
	gItems = new ArrayList<>(Arrays.asList(items))
```

# 인터넷 참고
- https://stackoverflow.com/questions/157944/create-arraylist-from-array
