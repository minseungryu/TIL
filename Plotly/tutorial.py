from dash import Dash, html, dash_table
import pandas as pd

#데이터 불러오기
df = pd.read_csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv')

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