# Correlation Analysis

## 1. 상관관계와 인과관계

- **상관관계** : 원인과 결과가 불분명 -> 순서가 없음
  - 연속형(수치형) 데이터에 적용
  - 양의 상관관계 & 음의 상관관계
  - 상관계수(r) : 얼마나 관계가 있는지 나타내는 수치 (-1 ~ +1)
  - 일반적으로 표본의 상관계수를 구함
- **인과관계** : 선행하는 변수의 변화가 다른 변수의 원인으로 작용
  - 3가지 조건을 충족해야 함
    1. 상관관계가 존재 : +, -
    2. 시간의 순서 존재 : 원인 -> 결과
    3. 제 3의 변수 존재하지 않는 경우

## 2. 상관분석

- 연속형(수치형) 데이터에 적용
- 양의 상관관계 vs. 음의 상관관계
- 상관계수 : 관계가 있는 경우 **<u>얼마나 관계가 있는지</u>** 나타내는 수치
  - 일반적으로 모집단이 아닌 표본의 상관계수를 구함
  - 상관계수(r) : 두 변수가 함께 변하는 정도를 `-1 ~ +1` 의 범위로 설명
  - 상관계수만으로 충분하지 않으며, 시각화하여 패턴 분석도 필요함
  
  

## 3. 공분산(Covariance)

- **<u>두 변수가 함께 변화하는 정도</u>**를 나타내는 지표
- 공분산 부호

  - 공분산이 '+' : 두 변수가 같은 방향으로 변화
  - 공분산이 '-' : 두 변수가 반대 방향으로 변화

- 공분산의 크기

  - 공분산 = 0 : 두 변수가 독립(상관관계가 없음)
  - 공분산의 크기가 클수록 두 변수는 함께 많이 변화
  - 단, 단위에 따라 크기가 달라져 **절대적 크기로 판단이 어려움**
  - 공분산을 -1 ~ 1 범위로 **표준화** 시킨 것이 **상관계수**

  

## 4. 상관계수(Correlation Coefficient)

- 공분산을 두 변수의 표준편차의 곱으로 나눈 값

- 두 변수의 연관성을 보여줌

- -1부터 1 사이의 값을 가짐 ``-1 <= r <= 1`

  |   상관계수   |        상관관계        |
  | :----------: | :--------------------: |
  | +- 0.9 이상  |  상관관계가 아주 높다  |
  | +- 0.7 ~ 0.9 |  상관관계가 아주 높다  |
  | +- 0.4 ~ 0.7 |    상관관계가 있다     |
  | +- 0.2 ~ 0.4 | 상관관계가 있으나 낮다 |
  | +- 0.2 미만  |  상관관계가 거의 없다  |

