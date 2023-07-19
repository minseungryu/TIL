# pandas visualization

## 1. 선 그래프

- kind = 'line'

- style: '-','--','-.', 's-', 'o-', '^-'

- linewidth: 숫자

- color: 16진수 RGB

- figsize: inch

  > kind 디폴트는 라인그래프

```python
DF1[['Height']].plot(kind = 'line',
                     style = '-', 
                     linewidth = 2,
                     color = '#FF0000',
                     grid = True,
                     figsize = (10, 7))
```



### 2. 막대 그래프

- kind = 'bar'
- width: 0~1
- rot: 0~360
- fontsize: 숫자

```python
DF1[['Height', 'Weight']].plot(kind = 'bar', 
                               width = 0.5,
                               rot = 45,
                               fontsize = 15,
                               figsize = (10, 7))
```



### 3. 히스토그램

- kind = 'hist'

- bins: 구간 개수

- alpha: 0~1

  > 연속형 데이터의 빈도 분석에 많이 사용 (문자는 불가; 연속이 아님)

```python
DF1['Height'].plot(kind = 'hist', 
                   bins = 5, 
                   alpha = 0.5,
                   figsize = (10, 7))
```



### 4. 상자 그래프

- kind = 'box'

  > 연속형 데이터의 분포 분석시 사용

```python
DF1['Height'].plot(kind = 'box',
                   figsize = (7, 9))
```



### 5. 산점도

- kind = 'scatter'
- s: 숫자
- x, y 두 개의 값이 필요

```python
DF1[['Height', 'Weight']].plot(kind = 'scatter', 
                               x = 'Height', 
                               y = 'Weight', 
                               s = 50,
                               figsize = (10, 7))
```



### 6. 파이 그래프

- kind = 'pie'

  > 보통 가장 큰 값 / 작은 값을 강조하고 싶을 때 씀

```python
DF1.BloodType.value_counts().plot(kind = 'pie',
                                  autopct = '%.1f%%',
                                  fontsize = 15,
                                  figsize = (10, 10))
```

