## Django란?

- 파이썬 웹 프레임워크
- 주요핵심 기능
  - 주요 데이터 베이스 관리
  - 강력한 관리자 기능(조회, 추가, 수정, 삭제 기능 제공)
- 보안
  - 다양한 보안 장치를 기본적으로 탑재
  - 숙련자는 원하는 보안 요소를 쉽게 추가 가능



## Django가 요청에 응답하는 방법

1. URL로 사용자 요청이 전달됨
2. 요청에 응답할 수 있는 함수로 요청을 전달함 ⇒ 처리
3. View 함수는 요청을 처리한 후, 응답을 되돌려줌
4. 응답은 요청자의 브라우저로 전달되며, 브라우저는 응답을 해석해서 사용자에게 보여줌



## Django의 디자인 패턴

- MTV 패턴(Model-Template-View) ⇒ MVC 패턴이라고도 함
- MVC의 Controller(**Model** : [`models.py`](http://models.py) → **Controller** [`views.py](<http://views.py>)`  → **View** `templates` )

<img src="https://data-flair.training/blogs/wp-content/uploads/sites/2/2019/03/Django-Architecture-Diagram.jpg" alt="django flow" style="zoom:50%; float:left" />



### Model

✓ Django와 데이터베이스를 연결시켜주는 코드, 데이터의 형태를 나타냄

✓ 각각의 모델은 데이터베이스 테이블과 매핑됨

✓ 모든 Model 클래스는 **django.db.models.Model** 클래스 상속

✓ 각각의 모델 속성은 데이터베이스 필드를 나타냄

✓ 파일명은 기본값으로 [models.py](http://models.py/) 사용

```python
Class DjangoModel(models.Model):
	name = models.ChartField(“이름”)
```



### Template

✓ 템플릿(Template)은 웹 브라우저로 돌려줄 코드

✓ 사용자에게 제공될 결과물의 형태를 나타냄

✓ Django에서는 template 디렉터리 내에 HTML 파일을 사용



### View

✓ 사용자의 요청을 받아 처리하는 웹 사이트의 로직을 가지는 코드

✓ 파이썬의 함수(function)을 사용함

✓ [views.py](http://views.py/)

```python
def django_view(request):
	return HttpResponse(“View”)
```



### CRUD와 `SQL 조작어`

- Create : 데이터를 만드는 기능 → to do 입력 후, 메모하기 버튼 `insert`
- Read : 데이터를 읽도록 하는 기능 → 메인 페이지에서 사용자가 그동안 입력한 데이터 보여주기 `select`
- Update :  데이터 갱신, 일반적으로 글 수정 `update`
- Delete : 데이터를 지우는 기능 `delete`



------


### models 데이터 타입

| 종류         | 설명                                                         |
| ------------ | ------------------------------------------------------------ |
| CharField    | 일반적으로 문자열 정의, 옵션 값으로 max_length 지정하여 문자열의 최대 길이 지정 |
| DateField    | DateField는 날짜 양식에 맞게 저장되는 데이터 타입, python에서 제공되는 datetime 라이브러리 형태로 표현. 게시글의 등록 시간이나 수정 시간 등 기록 |
| EmailField   | 이메일 형식을 가지는 데이터 타입. 이는 EmaliValidatior라는 것을 통해 입력되는 문자열이 이메 일 형식인지 자동으로 체크.만약 문자열이 이메일 형식이 아니라면 데이터 저장 과정에서 오류가 발생함 |
| FileField    | 파일을 저장할 수 있는 데이터 타입 FileField에 실질적으로 저장되는 것은 저장되는 파일 이름 해당 파일은 upload_to라는 옵션에 지정되는 위치데 저장됨 |
| TextField    | SQL에서는 textarea 타입을 의미하며, CharField보다 더 많은 문자열 저장 가능 |
| IntegerField | 숫자를 저장하는 데이터 타입. 게시 글의 조회 수나 추천 수 등을 저장해 사용 |
| BooleanField | 참(True) 또는 거짓(False)을 저장하는 데이터 타입             |



### GET 과 POST

- 클라이언트가 요청하는 두가지 방식
  - POST : 새로운 데이터 발생, 기존 데이터 변경, 기존 데이터 삭제 행위 및 로직 존재 시
  - GET : 그 외의 모든 경우 GET 방식으로 처리
