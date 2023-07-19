# Pandas_DataFrame & Series

## DataFrame

- Label Index를 가진 2차원 구조

- 일반적으로 다양한 데이터 타입의 열들로 구성

  ```python
  import pandas as pd
  pd.__version__ #버전 확인
  ```

  

### 데이터 파일 불러오기

```python
#파일 불러오기 (excel, csv 동일하게)
DF1 = pd.read_csv(’경로’)

#파일 저장하기 (틈틈히 저장할 때 유용)
DF[1:3].to_csv('file_name.csv', index = None)

#생성된 파일 확인
! ls -l
```



### 데이터 정보 확인하기

```python
#기본 정보 체크
DF1.info( )
DF1.index
DF1.columns  #list로 반환
DF1.values   #2차원 array
DF1.head( )
DF1.tail( )
DF1.sort_values(by = '기준컬럼명', ascending = False) #특정 컬럼 기준, 내림차순하기
---
#숫자 데이터 통계랑 체크
DF1.describe( )
mean, median, var, std 등이 있음
```



### indexing & slicing

- loc(Location) : Label 값 기준 ->> 보이는 그대로 쓰고 싶을 때 (이상 ~ 이하) 
  - indexing : `.loc[행_label, 열_label]`
    - ex) `DF1.loc['no_3', 'age']`
  - slicing : `.loc[행_label_시작:행_label_끝, 열_label_시작:열_label_끝]`
    - ex) `DF1.loc['No_3':'No_6', 'Age':'BloodType']`

- iloc(integer Location) : index 값 기준 (이상 ~ 미만)
  - indexing 예) `DF1.iloc[2, 2]`
  - slicing 예) `DF1.iloc[2:5, 2:5]`



## Series

- label index를 가지는 1차원 구조

- 일반적으로 동일한 데이터 타입으로 구성

  

  

### 특정 컬럼 불러오기 

(예) `DF1[’height’]` 또는 `DF1[[’height’, ‘weight’]]`



### 함수

- `.sum()`, `.median()`, `.std()` 등 기본 연산 
- `DF1.height.idxmin` : 값이 제일 작은 value(최솟값)의 index 주소를 반환
- `DF1.Height.idxmax()` : 최댓값의 인덱스 주소를 반환



### Indexing & Slicing

- loc : label 값 기준
  - `DF1.Height.loc['No_6']`

- iloc(Integer Location) : Index 값 기준
  - `DF1.Height.iloc[5]`