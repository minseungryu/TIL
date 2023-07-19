# Data Preprocessing_결측치

> 데이터 전처리

### 실습용 dataset 다운로드

```python
import seaborn as sns
TD = sns.load_dataset('titanic')
```



### 결측치 존재 체크

1. `TD.info( )` : 전체 entries 값과 non-null count 비교
2. `TD.head( )` : 간단히 첫 5줄 확인
3. `TD[’deck’].value_counts(dropna = False)`
   - 결측치(NaN)를 포함하여 빈도분석 결과 출력 (값의 개수 확인)
   - **dropna = False** :결측치 포함
4. `TD.isnull( )` : 결측치를 True로 출력

5. `isnull( ).sum(axis = 0)` : **각 열(Column)별로** 결측치(NaN) 개수 확인
   - axis = 0: 행(Row)
   - axis = 1: 열(Column)

6. `TD.isnull().sum(axis = 1).value_counts()` : **각 행(Row)별로** 결측치(NaN) 개수 확인

7. `.notnull( )` : 결측치(NaN)를 'False'로 출력

---

**[결측치를 그래프로 확인 : 막대그래프]**

```python
import missingno as msno

msno.bar(TD,
         figsize = (15, 7),
         color = (0.2, 0.2, 0.8));
```

**[결측치 Matrix]**

```python
msno.matrix(TD,
            figsize = (15, 7),
            color = (0.8, 0.2, 0.2));
```



### 결측치 삭제 (예시)

1. 열 별로 측정값(Non-NaN) 개수 확인

   `TD.notnull().sum(axis = 0)`

2. 300개 이하 측정값이 있는 열을 아예 삭제 💡

   `TD.dropna(thresh = 300, axis = 1)`

3. 특정 컬럼(age) 기준으로 결측치가 있는 행을 삭제 💡

   `TD.dropna(subset =[’age’], how = ‘any’, axis = 0)`

    ▶︎ how = 'all' : 모든 값이 결측치인 경우 삭제



### 결측치 치환

1. 연속형 데이터 치환

   - 평균값으로 치환하는 경우 예시 
     - `TD[’age’].fillna(int(TD[’age’].mean(axis = 0), inplace = True)` 
     - 함수 적용 후 결과가 반영된 데이터프레임 반환: inplace = True

2. 명목형(문자) 데이터 치환

   - 최빈값으로 치환하는 경우 예시

     ```python
     most_freq = TD['embark_town'].value_counts(dropna = True).idxmax()
     
     most_freq # 최빈값 확인
     ---
     TD['embark_town'].fillna(most_freq, inplace = True) #최빈값으로 치환
     ```

     

3. 이전 데이터포인트로 치환

   - `.fillna(method = 'ffill', inplace = True)`

   ```python
   TD['embark_town'].fillna(method = 'ffill', inplace = True)
   ```

   

4. 다음 데이터 포인트로 치환

   - `.fillna(method = 'bfill', inplace = True)`

   ```python
   TD['embark_town'].fillna(method = 'bfill', inplace = True)
   ```

   