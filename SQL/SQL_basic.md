# SQL

1. 전체 테이블 보기

```sql
SELECT * FROM table_name
=> table_name으로부터 *(전체 컬럼을 보겠다)
```



2. WHERE 조건구문

- and , or 연산으로 다양한 조건 적용 가능
- `where [조건]`

```sql
SELECT * FROM TB 
WHERE Height > 175
=> 키가 175보다 큰 사람만 보기
```

```sql
select * from TB
where Height > 175 or Grade = 3
```



3. 명목형 연산

- ` '' ` single quotation 필요

```sql
select * from TB
where Height > 175 and BloodType = 'B'
```



4. `in` 연산자

- 의미상 'or' 과 유사하나, 더 간편하게 표현

```sql
SELECT * from TB
where Grade in ('2', '4')
```



5. `like` 연산자

- `WHERE` 절에서 사용되며, 특정 **패턴과 일치**하는 문자열을 검색함
- weight 가 5로 시작하는 경우를 필터링

```sql
select * from TB
where Weight Like '5%'
```

- weight 가 9로 끝나는 경우를 필터링

```sql
select * from TB
where Weight like '%9'
```



6. `group by` 연산자

- 중복값을 제외하고 1개의 고유값만 출력
- `sum()`, `avg()` 등 다양한 연산 수행 가능

```sql
select Grade, sum(Age), sum(Height), sum(Weight)
from TB
group by Grade
```



7. `having` 연산자

- group by 후 추가 연산(필터링)

```sql
select Grade, avg(Age), avg(Height), avg(Weight)
from TB
group by Grade
having avg(Height) > 170
```



8. `order by` 연산자

- order by **asc**(오름차순), **desc**(내림차순)

```sql
select * from TB
where Height > 170
order by Weight Asc (오름차순)
```



9. `as` 연산자

- 출력되는 column name 변경

```sql
select avg(Height) as avg_Height, 
				avg(Weight) as avg_Weight
from TB
```

