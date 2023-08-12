## 

# 데이터 연결하기

- 데이터를 앱에 연결하는 법은 다양하다 : API, 외부 데이터베이스, 로컬의 txt 파일, JSON 파일 등
- 예시에서는 csv 데이터를 앱에 연결해본다.

```python
from dash import Dash, html, dash_table
import pandas as pd

#데이터 불러오기
df = pd.read_csv('<https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv>')

#앱 시작하기
app = Dash(__name__)

# 앱 레이아웃
app.layout = html.Div([
    html.Div(children='My First App with Data'),
    dash_table.DataTable(data=df.to_dict('records'), page_size=10)
])

# 앱 실행하기
if __name__ == '__main__':
    app.run(debug=True)
```

### 

### 코드 확인

- Dash DataTable에 데이터를 보여주기 위해 `dash_table` 이라는 모듈을 import
- csv 데이터를 읽기 위해 pandas 라이브러리를 Import
- 로컬에 있는 csv 파일을 읽어오고 싶다면, 현재 코드를 작성중인 파일의 위치와 동일한 위치에 csv파일 저장
  - 수정 예시 : `df = pd.read_csv('NameOfYourFile.csv')`
- 엑셀 파일을 사용하고 싶다면, `pip install openpyxl` 먼저 진행
  - 데이터프레임 읽어오는 코드 수정 : `df = pd.read_excel('NameOfYourFile.xlsx', sheet_name='Sheet1')`
- 앱 레이아웃에서, app title과 DataTable 구성요소를 추가
  
  
  
  

### 결과

레이아웃에 설정해준 앱 제목과 함께, 표 형식의 데이터프레임이 나타난다
