# inject
- Enumerable 모듈이다.
- Collection closure Method 라고도 불리는 듯?
- each 보다 경우에 따라서는 더 편하게 쓸 수 있는 듯

# 예시
- 아래와 같은 반복문을 정말 편하게 변경할 수 있음

```
  def total_charge
    result = 0
    @rentals.each do |element|
      result += element.charge
    end

    result
  end
```
- 다음과 같이 수정할 수 있음

```
   def total_charge
     @rentals.inject(0) { |sum, rental| sum + rental.charge }
   end
```

# 인터넷 참고
- [루비 설명 원문](https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-inject)
- [여러 Enumerable 설명 중](http://blog.nacyot.com/articles/2014-04-19-ruby-enumerable/#toc-enumerableqinjectqqqenumerableqreduceq)
- [inject 메소드만 설명 됨](http://baccas300.tistory.com/14)
- [리팩터링:루비 에디션 에서 사용한 부분](https://github.com/iz4blue/Refactoring-Ruby-Edition/commit/eaaddeb0c296087bc672718850e16aeea608126c)

