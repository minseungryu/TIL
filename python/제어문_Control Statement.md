# Control Statement : 제어문

⇒ 흐름을 제어하는 역할

⇒ 데이터 분석에서는 자주 쓰이지는 않음

## 조건문 : if else

- True / False 비교 연산
  - if : True 인 경우 ⇒ else : False 인 경우
- 조건문 뒤에 `:  `  붙이며, 들여쓰기(indentation) 주의
- 참고 : 사용자 입력 : `input( )`

```python
score = int(input(’점수 입력:’))
# input( )함수는 결과 기본형이 str 
---
점수를 입력하세요: 88
```



- if 중첩

```python
if score > 91:
    print('A')
else:
    if score > 81:
        print('B')
```

- elif

```python
if score > 91:
    print('A')
elif score > 81:
    print('B')
elif score > 71:
    print('C')
elif score > 61:
    print('D')
else:
    print('F')
```



## 반복문 : for in

- for ~ if : 일반적인 사용 형태

```python
score = [99, 88, 55, 77, 66, 55, 100]
num = 0

for s in score: 
    num = num + 1

    if s > 60: 
        print('%d번 수강생은 수료입니다.' % num)
    else: 
        print('%d번 수강생은 미수료입니다.' % num)
```

- `for ~  in range( )` : 리스트를 만들어줌 

  - range(이상, 미만, 간격)

  - 간격은 1이 디폴트로, 생략 가능



- `enumerate( 리스트 )`

  - 순서가 있는 자료형의 값을 인덱스와 함께 전달(열거) >>  index & value

  ```python
  for num, s in enumerate(score):
      num = num + 1
  
      if s > 60: 
          print('%d번 수강생은 수료입니다.' % num)
      else: 
          print('%d번 수강생은 미수료입니다.' % num)
  ```

  

- `break` 
  - 반복문 종료 : 리스트 길이가 길어도 특정 조건을 만족하면 반복문 ‘조기 종료’

```python
for i in range(1, 10) : 
	if i > 5 :
		break
	print(i)
```



- `continue`
  - (반복문 처음으로 돌아가) 반복문의 다음 조건을 실행 

```python
score = [99, 88, 55, 77, 66, 55, 100]

for num, s in enumerate(score):
    num = num + 1

    if s < 60:
        continue 
    print('%d번 수강생은 합격입니다.' % num)
---
1번 수강생은 합격입니다.
2번 수강생은 합격입니다.
4번 수강생은 합격입니다.
5번 수강생은 합격입니다.
7번 수강생은 합격입니다.
```
