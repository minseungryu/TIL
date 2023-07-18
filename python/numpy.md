# Numpy

- 수학 및 과학적 연산을 쉽고 빠르게 지원
- 다차원 행렬(Array / Matrix)을 효과적으로 처리
- 일반적으로 같은 데이터 타입(숫자 데이터)으로 구성



### Array

- array는 쉽게 행렬이라고 생각 (=Tensor)

1. 0D Array(0차원) : Scalar 라고 하며, 방향성 없이 ‘값’만 존재 (Rank 0 Tensor)

   `a0 = np.array(9)`

2. 1D Array(1차원) : Vector 라고 하며 방향성 생김 (Rank 1 Tensor)

   `a1 = np.array([1, 3, 5, 7, 9])` ⇒ 리스트를 array로 casting

3. 2D Array (2차원) : Matrix 라고 함. (Rank 2 Tensor)

   `a2 = np.array([[1, 2, 3],[4, 5, 6]])`

4. 3D Array (3차원) : Array 라고 함. (Rank 3 Tensor)

​		▶︎ "축, 행, 열" 순으로 우선함

```python
a3 = np.array([[[1, 2],
                [3, 4]],
               [[5, 6],
                [7, 8]],
               [[9, 10],
                [11, 12]]])
```



### AR.shape

- 행렬의 크기 호출 : `AR.shape`
  - 1차원 : `(12, )`
- 행렬의 차원 호출 : `AR.ndim`
- 행렬의 원소 개수 : `AR.size`



### AR.reshape

- ``.reshape( 행, 열 )``
  - 이때 행과 열의 곱이 기존 원소 개수와 맞아야함
- **``.reshape( 축, 행, 열 )``**
- ``.reshape(-1, 1)`` : -1은 **<u>나머지 숫자(1)을 기준으로 행과 열이 맞춰짐</u>**
  - `AR.reshape(1, -1)` = (12 ; 원소 개수) = (-1 ; 1차원으로 표기) ⇒ 모두 1차원으로 표기하는 방법
  - `AR.flatten( )` : 1자로 모든 원소를 폄 (1차원)



### arange( ) : 범위 지정 함수

- `np.arange(10)` : 연속된 10개의 값 생성

- `np.arange(1, 10)` : 1부터 9까지 1간격으로 생성

- `np.arange(1, 10, 2)` : (시작, 미만, 간격) 1부터 9까지 2간격으로 생성

- `np.zeros( )` : 0으로만 구성

  ```python
  np.zeros([3, 4])
  ```

- `np.ones( )` : 1로만 구성

- np.eye( 3 ) : 대각선만 1인, 3 * 3 행렬 생성

  ```python
  np.eye(3)
  ---결과---
  array([[1., 0., 0.],
         [0., 1., 0.],
         [0., 0., 1.]])
  ```

  

- 난수 생성

  - `np.random.rand(축, 행, 열)` : 0 ~ 1 사이의 숫자 랜덤 생성

  - 1 ~ 44 중 정수 한정, 복원 추출 : 

    - `np.random.randint(1, 45, size = (5, 6))`

  - 의사 난수 생성 초기 값 지정 (처음 생성한 난수 계속 생성) :

    -  `np.random.seed(아무 숫자; 보통 0 또는 1 )`

  - `np.random.choice()`

    ```python
    np.random.seed(2045)
    
    np.random.choice(np.arange(1, 46), size = (5 ,6), replace = False)
    #replace = False : 복원 추출 안함
    ```

- 원소 섞기 : `np.random.shuffle(Data)`



### array 연산

- 각 열의 최소 값 : `A3.min(axis = 0)`
- 각 행의 최소 값 : 
  - `A3.max(axis = 1, keepdims = True)`
    - keepdims = True : 차원을 그대로 유지하여 출력
- 누적합 : `A1.cumsum( )`
- 누적곱 : `A1.cumprod( )`



### Matrix 연산

1. `dot.()` 함수 활용

- `np.dot(M1, M2)`
- `M1.dot(M2)`

2. 전치행렬

- 행과 열을 뒤집기
  - np.transpose(M1)
  - np.transpose(M2)

