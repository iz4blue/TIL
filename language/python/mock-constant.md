# python 에서 mock 으로 상수를 재정의 하는 방법

```
user = User.get_or_create(nickname='ianchoi', email='ianchoi@ms.com')

with patch('learn.models.POLICY_SERIAL_NUMBER', '00011231'):
    self.assertEqual(True, user.detail.is_agree_policy())

with patch('learn.models.POLICY_SERIAL_NUMBER', '99991231'):
    self.assertEqual(False, user.detail.is_agree_policy())
```

와 같이 patch 으로 mock 을 만들고 블록은 with 로 정의 해서 사용하면 된다.
