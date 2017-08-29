# 목적
- form 을 만들 때 model 을 참고하지 않고 form class 활용하기
- 참고 : https://stackoverflow.com/questions/17754295/can-i-have-a-django-form-without-model

# 구현
## forms.py
```python
class MyForm(forms.Form)
    hashtag = forms.CharField(max_length=20)
```

## template (ex: test.html)
```html
<form action="#" method="POST">{% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Submit</button>
</form>
```

## view.py
```python
def hashtag_find(request):
    form = MyForm()
    if request.method == 'POST':
        form = MyForm(request.POST)
        if form.is_valid():
            hashtag = form.cleaned_data
```
