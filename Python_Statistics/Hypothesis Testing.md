# Hypothesis Testing(가설검정)

- 모집단 특징에 대한 여러 주장들 중 어떤 것을 받아들일지 결정하는 과정
- 가설검정 결과 우연에 의해 발생할 확률(p-value)이 기준(유의수준)보다 낮은 경우 기존의 주장을 버리고 새로운 주장을 받아들임
  - 유의확률(p-value): 귀무가설이 참이라고 가정할 때, 극단적인 또는 더 극단적인 결과가 나올 확률을 의미
- 가설검정 4단계
  - 1단계 : 가설 수립
  - 2단계 : 표본으로부터 검정을 위한 통계량 계산
  - 3단계 : 가설 선택의 기준 수립
  - 4단계 : 판정

---

### 1단계 : 가설수립

- 새롭게 확인하고자 하는 모집단 상태에 대한 가설
  - 귀무가설 : 영가설
  - 대립가설 : 연구가설 (새롭게 확인하고자 하는 가설)
- 가설검정에서는 귀무가설이 참이라는 가정하에 검정을 진행



### 2단계 : 표본으로부터 검정을 위한 통계량 계산

- 모수의 특성을 이루는 표본분포로부터 표본을 통해 관찰된 통계량

- 귀무가설 채택 및 기각 여부를 확인하기 위해 사용

- 판정 단계에서 이 가정을 유지할 것인지 여부를 결정

  - ‘귀무가설이 참’이라는 가정을 받아들일 수 없을 때 기각(Rejec)
  - ‘귀무가설이 참’이라는 가정을 받아들일 때 채택(Accept)

  

### 3단계 : 가설 선택의 기준 수립(유의수준과 기각역)

- 두 개의 가설 중 하나를 선택할 때 발생할 수 있는 오류

  - 제 1종 오류 : 귀무가설이 사설인데 대립가설을 선택하는 오류
  - 제 2종 오류 : 귀무가설이 거짓인데 귀무가설을 선택하는 오류

- 유의수준

  - 제 1종 오류를 범할 확률의 최대 허용 한계
  - 유의수준이 α인 검정 : 제 1종 오류를 범할 확률이 α이하인 검정

- 기각역

  - 기각역의 면적의 합은 유의수준 α가 됨

  

### 4단계 : 판정

- 검정통계량과 유의확률로 귀무가설의 채택 여부를 판정
- 검정 통계량이 기각역에 있으면 귀무가설 기각
- 유의확률(p-value, 일반적으로 0.05)이 유의수준보다 작다면 귀무가설 기각 ⇒ 대립가설 지지
  - 우연히 나올 확률이 매우 작다는 의미
- 유의확률이 유의수준보다 크면 귀무가설 채택
  - 결과는 우연히 발생할 가능성이 높음