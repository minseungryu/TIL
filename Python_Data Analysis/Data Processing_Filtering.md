# Filtering

### 실습용 dataset 가져오기

```python
import seaborn as sns
TD = sns.load_dataset('titanic')
```

### 실습 예

1. age가 10살 이상이면서 20살 미만

```python
Filter = (TD.age >= 10) & (TD.age < 20) 	#또는은 | 로 표시

TD.loc[Filter, :] #필터(조건) 걸기
```



2. age가 10살 미만 또는 60살 이상

```python
Filter2 = (TD.age < 10) | (TD.age >= 60)
TD.loc[Filter2, ['age', 'sex', 'alond']]	#원하는 칼럼만 지정해서 필터 결과를 보겠다.
```

