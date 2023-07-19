# git add, git commit, git push

> 파일 생성부터 push 까지 단계별 정리



### 파일추가

`d.txt` 파일 생성

```
% touch d.txt
```

파일 추가 결과 체크

```
% ls
a.txt	b.txt	c.txt	d.txt
```

`git status`

```
% git status

On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	d.txt

nothing added to commit but untracked files present (use "git add" to track)
```



### git add [파일명]

`git add d.txt` 결과 git status

```
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   d.txt
```



### git commit -m "커밋 메시지"

```
git commit -m "Add d"
```

-> git log 생성

```
On branch main
nothing to commit, working tree clean
```



### git push origin main

-> github repository 에 결과 확인

![스크린샷 2023-07-14 오전 11.04.39](/Users/angela/Library/Application Support/typora-user-images/스크린샷 2023-07-14 오전 11.04.39.png)