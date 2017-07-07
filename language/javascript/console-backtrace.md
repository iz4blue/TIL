# javascript 에서 backtrace 를 강제로 찍기

```
(function () { console.log(new Error().stack); })();
```
