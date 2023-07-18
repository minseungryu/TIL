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

```python
a3 = np.array([[[1, 2],
                [3, 4]],
               [[5, 6],
                [7, 8]],
               [[9, 10],
                [11, 12]]])
```

▶︎ "축, 행, 열" 순으로 우선함

