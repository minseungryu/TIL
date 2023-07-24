# 회귀분석

- 과거의 결과값을 기준으로 미래의 결과값을 예측하는 방법
- 미래에 발생할 결과값이 '과거의 평균으로 돌아간다(회귀)'라는 의미

---

- **회귀식** : `y ~ ax + b` 에서 최소제곱법(= LSM : Least Squre Method)으로 회귀계수를 계산

  - 최소제곱법(= OLS : Ordinary Least Squares) : 회귀식의 파라미터값을 추정하는 방법 중 하나

- **결정계수** 

  - 머신러닝에서는 MSE(Mean Squared Error)라고 함
    - 여기서 Error는 실제값과 예측값의 차이 -> 이 값이 평균내서 작아지면 좋은 것
  - 통계학에서는 R²으로 표현하며, 설명력(0~1)을 의미
    - 설명력 : x로 설명할 수 있는 y의 변동  
    - R²이 1에 가까울수록 회귀식의 설명력이 높음을 의미

- **수정된 결정계수(Adjusted R²)**

  - 독립변수의 개수가 증가함에 따라 R²(설명력)이 증가하는 문제 발생
  - 따라서 다중회귀분석에서는 Adjusted R²값을 사용
  - 독립변수의 개수 p를 분모에 위치시켜 R²값이 증가되는 영향을 감소

- 종류
  - 단일 회귀 분석 : 종속변수에 영향을 주는 독립변수가 1개인 경우
  - 다중 회귀 분석 : 종속변수에 영향을 주는 독립변수가 여러 개인 경우

  

## 단일 회귀 분석

<img src="https://blog.kakaocdn.net/dn/lzFe6/btrAxGrUazC/jbFPTJiq5UTrZzkXDnGiB0/img.gif" alt="단일회귀분석" style="zoom:50%; float:left" />

- 독립 변수(또는 설명 변수)와 종속 변수(또는 반응 변수) 사이의 관계를 모델링하는데 사용됨
- 하나의 독립 변수와 하나의 종속 변수 사이의 선형적인 관계를 가정
- (위 그림에서) 점과 선 사이의 거리 최소화할 수 있는 parameter 값을 찾는 것

### 결정계수(R-square)

- 종속변수 예측값과 실제값의 상관계수 제곱값
- 회귀모델의 적합도 평가를 위해 사용
- 결정계수는 회귀식의 설명력
- 결정계수 범위 : `0 <= R² <= 1`



## 다중 회귀 분석

<img src="https://miro.medium.com/max/1120/0*AqzOn7p--nveVULA.png" alt="다중회귀" style="zoom:67%; float:left" />

- 수학적으로 다중 회귀 분석은 다음과 같은 선형 모델로 나타낼 수 있음

  `Y = β0 + β1*X1 + β2*X2 + ... + βn*Xn + ε`

  - Y :  종속 변수
  - X1, X2, ..., Xn : 각각 종속 변수에 영향을 미치는 독립 변수들
  - β0 : 절편(intercept)으로, 독립 변수들이 0일 때의 종속 변수의 예측값
  - β1, β2, ..., βn : 각 독립 변수들의 회귀 계수(coefficient)로, 해당 독립 변수들의 영향력을 나타냄
  - ε : 오차항(residuals)으로, 모델로 설명하지 못하는 잔차를 나타냄

- (위 그림에서) 점과 면 사이의 거리 최소화할 수 있는 parameter 값을 찾는 것



### 다중 공선성

- 독립변수 간의 강한 상관관계로 인하여 발생
- 회귀 분석 결과를 긴뢰할 수 없는 현상

- 분산팽창요인(VIF : Variation Inflation Factor)

  - VIF 값이 10 이상인 경우 다중공선성 문제 의심

- 다중공선성 문제 해결

  - 독립변수들 간에 강한 상관관계를 보이는 독립변수 제거 후 Modeling
  - 참고로, 머신러닝에서는 크게 신경쓰지 않음. MSE를 작게 만들기 위한 모델 최적화 정도만 함

  

## [참고] 머신러닝의 Predictive Model

- **Machine Learning의 Predictive Model**

  - y가 숫자 : 수치예측 ->> Regression `(y = wx + b)`

  - y가 문자 : 범주예측(분류) ->> Classification(Logistic Regression)

- sigmoid() => logistic 와 유사한 개념으로 이해
  - sigmoid 함수 결과값을 0.5를 기준으로 0과 1로 구분
  - sigmoid 함수 그래프

​	<img src="https://cloud2data.com/wp-content/uploads/2022/11/2560px-Sigmoid-function-2.svg_.png" alt="시그모이드함수" style="zoom:25%; float:left;" />

















### 분류_Classification

1. 이진분류 : Binary Classification

- 두 가지 범주로만 분류되는 것 : `0 과 1`

  - 예) 성별, 구매/비구매, 양성/음성, 정상/불량

  

2. 다중분류 : Categorical Classification

- 세 개 이상 범주로 분류되는 것

