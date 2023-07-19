# git에서 백업, 협업하기

- Local Repository <--(push/pull)---> **Remote Repository** 
- **Remote Repository** --(clone)---> Local Repository2

> Git Hosting : 원격저장소를 제공하는 서비스로, gitlab, github 등 다양한 종류가 있음



## 백업

### 1. 지역저장소와 원격저장소를 연결하기

- **github에 원격저장소를 생성**
  - 원격저장소 이름 : 지역저장소의 폴더명과 동일하게 붙이는 경우가 많음
  - 예 : TIL (today I learned)
- **지역저장소와 생성한 원격저장소 연결**
  1. `git remote add origin [원격저장소 주소; HTTPS]` 
  2. github 아이디와 비밀번호 입력

- 결과보기 : `git remote -v`

```
% git remote -v
origin	https://github.com/minseungryu/practice.git (fetch)
origin	https://github.com/minseungryu/practice.git (push)
```





## 협업

### 2. 원격저장소의 내용 > 새로운 지역저장소로 복제

- `git clone [url] [지정폴더명]`

  - 폴더명 별도 지정하지 않을 시, 현재 로컬 디렉토리에 원격저장소의 폴더가 생성됨
  - 따로 저정시, 지정된 이름의 디렉토리 생성됨 : 로컬 폴더명이랑 겹칠 때 특히 유의

- clone은 repository를 가져갈 사람만 할 수 있음

  - 사전에 권한 부여가 필요함

  ```
  cd ~
  git clone (주소) (지정폴더명)
  ```

  

### 3. 복제한 원격저장소의 내용 불러오기

- 상대방의 repository 내 파일을 수정하기 위해 가져오기 : `git pull origin main`
- 수정 결과를 push 하기 위해서는 repository 권한 부여 받>아야 함 (github에서 별도 설정 필요)



### 4. 지역저장소에서의 작업 내용 원격저장소로 넘기기

- `git push origin main`
- 상대방이 수정한 결과물을 내가 로컬로 가져와서 본 후, 다시 GIthub에 올리는 과정도 동일 