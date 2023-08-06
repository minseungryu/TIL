# dash 코드 기본 구성 익히기

아래 코드는 “Hello World”를 출력하기 위한 코드이다.

파이썬 IDE 에 다음 코드를 입력하고 터미널에서 실행시킨다.

```python
from dash import Dash, html

app = Dash(__name__)

app.layout = html.Div([
    html.Div(children='Hello World')
])

if __name__ == '__main__':
    app.run(debug=True)
```

주소를 클릭하면 다음과 같이 웹브라우저가 실행되며, HelloWorld 라는 문자열이 보인다.

```python
Hello World
```

## 

## 기본 코드 분석

### 1. 패키지와 라이브러리를 import 하기

```python
from dash import Dash, html
```

### 2. 앱 시작시키기

```python
app = Dash(__name__)
```

### 3. 앱 레이아웃 설정

- 웹브라우저에 표시될 앱 구성요소에 대한 레이아웃이다.
- 보통 `html.Div` 안에 정의된다.
  - 예시에서는 `html.Div` 안에 또다른 `html.Div` 를 넣었다.
  - 해당 Div 안에는 몇가지 속성을 넣을 수 있는데 여기서는 children을 쓰고, 텍스트 컨텐츠를 추가했다.

```python
app.layout = html.Div([
    html.Div(children='HelloWorld')
])
```

### 4, 앱 실행시키기

- 앱을 실행시키는 코드이며 어느 dash 앱에서나 동일하게 쓰인다.

```python
if __name__ == '__main__':
    app.run(debug=True)
```


