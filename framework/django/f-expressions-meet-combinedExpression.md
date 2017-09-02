# django model 에서 계산된 값이 갱신 안되는 경우
- <CombinedExpression: F('updated_count') + Value(1)> 와 같이 아직 계산이 안된 내용으로 객체의 값을 응답하는 경우

# 아래의 주소에서 답을 찾음
- https://simpleisbetterthancomplex.com/tips/2016/08/23/django-tip-13-f-expressions.html
- 간단히 정리하면 db 에 반영된 값으로 갱신 해주면 된다는 이야기 같음

# 예시코드
```python
product.price = F('price') + 1
product.save()
print(product.price)            # <CombinedExpression: F(price) + Value(1)>

product.refresh_from_db()
print(product.price)            # Decimal('13.00')
```