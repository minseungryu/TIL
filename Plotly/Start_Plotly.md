# plotly 시작하기

## Dash 설치

```python
pip install dash
```

- dash 라이브러리는 plotly의 그래프 그리는 라이브러리까지 모두 포함되어 있다
- 터미널에 Dash 를 설치한다
  - pandas 와 함께 사용하는 것을 추천한다 👉 `pip install pandas`
- 이제 파이썬이나 주피터노트북에서 샘플 앱을 실행시켜보자



## [app.py](http://app.py) 샘플코드

```python
from dash import Dash, html, dcc, callback, Output, Input
import plotly.express as px
import pandas as pd

df = pd.read_csv('<https://raw.githubusercontent.com/plotly/datasets/master/gapminder_unfiltered.csv>')

app = Dash(__name__)

app.layout = html.Div([
    html.H1(children='Title of Dash App', style={'textAlign':'center'}),
    dcc.Dropdown(df.country.unique(), 'Canada', id='dropdown-selection'),
    dcc.Graph(id='graph-content')
])

@callback(
    Output('graph-content', 'figure'),
    Input('dropdown-selection', 'value')
)
def update_graph(value):
    dff = df[df.country==value]
    return px.line(dff, x='year', y='pop')

if __name__ == '__main__':
    app.run(debug=True)
```

- [app.py](http://app.py) 라는 파이썬 파일을 만들고, 위의 샘플 코드를 붙여넣는다.

- 다음 명령어로 코드를 실행시킨다. `python app.py`

- 터미널에 다음과 같은 내용이 보이면, ctl(command) + 주소클릭
  
  ```bash
  Dash is running on <http://127.0.0.1:8050/>
  
   * Serving Flask app 'app'
  ```
  
  ⇒ 샘플 코드에서 구현한 선 그래프가 웹브라우저에서 보인다.


