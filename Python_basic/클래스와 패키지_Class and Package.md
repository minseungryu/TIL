# Class and Package

## Class

- class : 개발자에 의해 지정된 독립된 메모리 공간(구조)
  - 함수와 변수를 하나의 객체(Object)로 묶어서 관리
  - 선언된 Class 사용을 위해 Instance 생성 필요(바로 class 이름으로 접근 불가)

- Class **Method**: Class 내에 선언된 **함수**
- Class **Member**: Class 내에 선언된 **변수**



### Class 선언

- **self**: 첫 번째 매개변수 **self**는 Class로 생성한 Instance 자체를 지정
  - Class로 생성된 Object(객체) 자신을 참조하는 매개변수
  - self를 사용하여 Class Member에 접근

```python
class myClass:
    var_1 = "'Hello Class >>> Class Member'"
    
    def func_1(self):
        var_2 = "'Method >>> Instance Member'"
        print(self.var_1, 'AND', var_2)
```

```python
obj = myClass() #인스턴스 생성
obj.var_1				#class member 호출
obj.func_1()		#class method 호출
```



- 예시 :  'Calculator' Class 선언

```python
class Calculator:
    def inputData(self, m, n):
        self.m = m
        self.n = n
    def addtion(self):
        result = self.m + self.n
        return result
```



### Class 생성자(constructor)

- `__init__()` 예약어 : 인스턴스 생성시 초기값을 지정함

```python
class Calculator_2:
    def __init__(self, m, n):
        self.m = m
        self.n = n
        print('메모리에 인스턴스가 %d, %d 값과 함께 생성되었습니다.' % (m, n))
    def inputData_2(self, m, n):
        self.m = m
        self.n = n
    def subtraction(self):
        result = self.m - self.n
        return result
      
---
cal_4 = Calculator_2(4, 8)
#메모리에 인스턴스가 4, 8 값과 함께 생성되었습니다.

cal_4.subtraction()
# -4
```



### Class 상속(inheritance)

- 예시
  - Class Calculator, Calculator_2에 선언된 Method를 상속받아 사용 가능
  - Class myComputer 내에 추가 Method를 선언하여 사용

```python
class myComputer(Calculator, Calculator_2):
    def multiplication(self):
        result = self.m * self.n
        return result
    def division(self):
        result = self.m / self.n
        return result
```



## Package

- 관련된 모듈을 **디렉토리 구조를 사용하여 계층적으로** 관리
  - `Package_Name.Module_name.Function_Name( )`
  - `__init__.py` 파일을 사용하여 해당 디렉토리가 Package에 사용됨을 알려줌

- import 또는 from ~ import 구문으로 호출하여 사용