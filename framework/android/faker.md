# 목적
- Android 에서 Faker 를 쓰자.
- 참고 : https://github.com/thiagokimo/Faker

# 구현
- app > build.gradle 파일에 아래의 내용을 추가

```
repositories {
    maven { url 'https://jitpack.io' }
}

dependencies {
    // ... 생략 ... ///
    compile 'com.github.thiagokimo:faker:1.4.3'
}
```

- 필요한 곳에서 다음과 같이 사용

```java
Context context = getApplicationContext();
String name = Faker.with(context).Name.firstName();
String phone_number = Faker.with(context).Phone.phoneWithAreaCode();
```
