# Git 시작하기

(버전을 통해) 코드를 관리하는 도구

> version & backup & collaborate

- 코드 관리 도구

- 코드 협업 도구

- 코드 배포 도구

  

### SCM & VCS

- Source Code Management : (소스)코드 관리 도구

- Version Control System : 버전 관리 도구
- Distributed Version Control System : 분산 버전 관리 도구



## Git 명령어

###### `git [명령어]`



### (1) `git init`

Git으로 코드 관리를 시작

- 코드 관리 단위(기준) : 폴더 -> `cd [폴더명]` 으로 해당 폴더 내에 들어와서 `git init 실행`
- `(master)` : ~~현재 브랜치명~~
- `.git` 폴더 생성 : Git의 관리와 관련된 파일



### (2) `git status`

현재 상태를 출력(Git에게 현재 상태를 물어봄)

- `git init` 직후,

```
On branch main 
-> main이라는 브랜치 위에 있어요.

No commits yet
-> 아직 commit이 없어요.

nothing to commit (create/copy files and use "git add" to track)
-> commit 할 것이 없어요.
```



- `test.txt` 파일 생성 후,

```
On branch main
No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	test.txt
-> 추적되지 않은 파일명이 있어요.
nothing added to commit but untracked files present (use "git add" to track)
-> commit 하기 위해 add된 것이 없어요. 그러나 추적되지 않은 파일은 있어요.
```



- `git add test.txt` 직후

  ```
  Changes to be committed:
    (use "git rm --cached <file>..." to unstage)
  	new file:   test.txt
  	
  -> commit할 변경들이 있어요.
  ```



- `git commit -m "커밋메시지"`이후,

  ```
  nothing to commit, working tree clean
  -> commit 할 게 없어요. 작업 폴더는 깔끔해요.
  ```

- 파일 수정 후.

  ```
  On branch master
  Changes not staged for commit:
  -> commit하기 위해 stage 되지 않은 변경 사항이 있어요.
  
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  
  modified: test.txt
  no changes added to commit (use "git add" and/or "git commit -a")
  ```

  

### (3) git add [파일명]

commit을 위한 stage(올리기)

- `git add .` : 현재 폴더의 모든 변경 사항 stage



### (4) git commit -m "커밋메시지"

> commit == 버전을 생성 == 현재상태의 스냅샷 촬영
>
> **<u>git commit -am "version name" : stage add & commit 한번에!</u>**

- 처음으로 commit을 할 경우,

```
Author identity unknown
-> 작자미상

*** Please tell me who you are.
-> 당신이 누군지 알려주세요.

Run
-> 아래의 명령어를 실행주세요.

git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```



- `git config` 설정 후(vim 에디터 창),

  ```
  # Please enter the commit message for your changes.
  -> 변경사항에 대한 commit message를 입렵해주세요.
  # Lines starting with '#' will be ignored, and an empty message aborts the
  commit.
  -> #로 시작하는 라인은 무시됩니다. 아무것도 없는 메시지는 종료됩니다.
  # On branch master
  #
  # Initial commit
  #
  # Changes to be committed:
  # new file: test.txt
  ```

  

### (5) `git config`

Git에 관한 설정(최초 commit 실행시)

- `git config --global user.email "이메일"` : global(전역으로) user의 email을 설정

- `git config --global user.email` : 설정값 확인



### (6) `git log`

현재까지의 commit을 출력 (스냅샷 확인)

- `git log` 출력 화면

  ```
  commit 4541866a1851d66616e100e99df263ebafe14527 (HEAD -> main)
  Author: 류민승 <angela@lyuminseung-ui-MacBookAir.local>
  -> 작성자
  
  Date:   Thu Jul 13 17:02:58 2023 +0900
  -> 날짜
      first
      -> 커밋 메시지
  ```

- `git log --oneline` : 한줄로 출력

  ```
  4541866 (HEAD -> main) first
  ```

  

### (7) `git remote`

- `git remote add [저장소이름] [저장소주소]` : git remote add origin https://github.com/hkeryf
  onttlxisdrlw/basic_git
  - git에게 원격저장소(remote) 추가(add)를 명령
- 저장소이름: `origin`
- 저장소주소: https://github.com/hkeryfonttlxisdrlw/basic_git



[참고]

`git rm --cached [파일/폴더]` : Git에서 파일 또는 폴더를 추적 중지하고 인덱스에서만 해당 파일 또는 폴더를 제거



### (8) `git diff`

stage로 버전을 넘기기 전에 작업(변경)된 부분을 확인할 수 있음 = show changes

> 각 버전에 뭐가 들어있는지 확인 ; `git log --stat`



### (9) `git checkout`

특정 버전(commit)으로 이동가능 => 돌아올 땐, `git checkout main`

```
git checkout [commit번호]
```



### (10) `git reset --hard`

특정 버전 '으로' 리셋(돌아가기)

```
% git reset --hard 6e9880c854756dd4b04e8152a4ccf76a66fa3879
HEAD is now at 6e9880c message 2
-----
(base) angela@lyuminseung-ui-MacBookAir hello-git-cli % git log
commit 6e9880c854756dd4b04e8152a4ccf76a66fa3879 (HEAD -> main)
Author: 류민승 <angela@lyuminseung-ui-MacBookAir.local>
Date:   Thu Jul 13 23:11:27 2023 +0900

    message 2

commit 7714c041d971ad50bee6ee9cb1132cf426c062ce
Author: 류민승 <angela@lyuminseung-ui-MacBookAir.local>
Date:   Thu Jul 13 23:08:54 2023 +0900

    message 1
```



### (11) `git revert`

한 버전씩 전 단계로 되돌아가기 위함 (2버전을 리버트 하면 1로 감!)

즉, 역순으로 진입!

---

### 유의

Git project 위에 다른 상위 Git 폴더가 생기면 안됨!

main이 홈 디렉토리에 생겨버렸을 때 (홈에 git 시작해버렸을 때)

`rm -r .git`
