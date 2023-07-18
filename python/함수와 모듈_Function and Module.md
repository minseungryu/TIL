# Function and Module

## Function : 함수

- 함수(Function)
  - 함수(Function): 지정된 <font color='red'>입력값</font>을 받아 처리 후 <font color='blue'>출력값</font> 리턴
  - 입력값 -> 함수(Function) -> 출력값

- 사용자 정의 함수 : `def`

  - 기본적으로 함수는 메모리에 저장됨 ⇒ 껐다 키면 사라짐

  ```python
  def addition(m, n):
    k = m + n
    return k
  
  addition(m = 3, n = 6)
  ---
  9
  ```

- lambda 사용자 정의 함수 : 한줄로 함수를 정의할 수 있음

```python
# def subtraction(m, n):
#   k = m - n
#   return k

subtraction = lambda m, n : m - n
```



- 입력값 개수 미지정인 경우
  - `*`기호가 입력값을 모아서 Tuple을 생성

```python
def add_all(*inputs):
    result = 0

    for i in inputs:
        result = result + i
    return result
  
add_all(1, 3, 5, 7, 9)
---
25
```



- 매개변수 초깃값 설정
  - 아래 예시에서, `operator = 'addition'`

```python
ef add_mul(*inputs, operator = 'addition'):
    if operator == 'addition':
        result = 0
        for i in inputs:
            result = result + i
    elif operator == 'multiplication':
        result = 1
        for i in inputs:
            result = result * i
    return result
```

- 초깃값 설정 : m = 3, n = 6

```python
def addition(m = 3, n = 6):
  k = m + n
  return k
```



## Module

- module(모듈) : 사용자 정의 함수를 포함하고 있는 파이썬 스크립트(*py)
- import : 파이썬 스크립트에 정의된 함수를 메모리로 호출
  - `from [모듈명] import [함수명`] : 특정 함수만 쓰고 싶을 때, 모듈명 없이 함수만 호출
  - `import [모듈명] as [alias;별명]` : 모듈 이름이 길 때 간소화

> **파이썬 내장 모듈 체크 (Built-in Module Path)** 
>
> `import sys`
>
> `sys.path `
>
> ⇒ 해당 경로 내에 각종 모듈이 있음을 확인 (여기서 path는 함수가 아니라 객체; 리스트)

- 사용자 모듈 만드는 법 

  1. myModule.py 스크립트 생성(UTF-8 Encoding)

  2. 스크립트에 사용자 함수 정의
  3. Colab에 myModule.py 업로드 후 실습 진행