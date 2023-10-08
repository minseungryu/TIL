use mydata;

select count(*) 
from dataset2;
-- Clothing ID, Age, Title, Review Text, Rating, Recommended IND, Positive Feedback Count, Division Name, `Department Name`, Class Name


-- 1) Division 별 평균 평점 계산
select `Division Name`
		, avg(Rating) as avg_rate
from dataset2
group by 1
order by 2 desc;

-- 2) department / 평균 평점
select `Department Name`, avg(rating) as avg_rate
from dataset2
group by 1
order by 2 desc;

-- 3) intimate의 3점 이하 평점 알아보기
select *
from dataset2
where `Department Name` = 'intimate' and rating <= 3;

-- 4) 나이대 구간화 (버림)
select FLOOR(age/10) * 10 as age_group, count(*) as cnt
from dataset2
where `Department Name` = 'intimate' and rating <= 3
group by 1;

-- 부서/연령별 리뷰 수 
select `Department Name`, FLOOR(age/10) * 10 as age_group
		, count(*) as cnt
from dataset2
group by 1, 2
order by 1, 2;

-- 50대가 3점이하 준 리뷰	
select *
from dataset2
where rating <= 3 and age between 50 and 59;

-- 평점이 낮은 상품의 주요 complain 
SELECT `Department Name`, `Clothing ID`
		,AVG(rating)
FROM dataset2
group by 1, 2;

SELECT *, row_number() over(partition by `Department Name` order by avg_rate) as RNK
from (
	SELECT `Department Name`, `Clothing ID`
		   ,AVG(rating) as avg_rate
	FROM dataset2
	group by 1, 2
	)a;
    
-- 1~ 10위
select *
from (
	SELECT *, row_number() over(partition by `Department Name` order by avg_rate) as RNK
	from (
		SELECT `Department Name`, `Clothing ID`
			   ,AVG(rating) as avg_rate
		FROM dataset2
		group by 1, 2
		)a
    ) b
where RNK <= 10;

-- 부서별 최하평점 받은 10개 상품
with temp1 as(
select *
from (
	select * , row_number() over(partition by `Department Name` order by `Clothing ID`) as RNK
	from 
			(
			select `Department Name`, `Clothing ID`
					, avg(rating) as avg_rate
			from dataset2
			group by 1, 2 
			) a)a
where RNK <= 10
)
-- select `Clothing ID`
-- from temp1
-- where `Department Name` = 'Bottoms';
select *
from dataset2
where `Clothing ID` in ( select `Clothing ID`
						 from temp1
                         where `Department Name` = 'Bottoms')
order by `Clothing ID`
;

-- 연령별 최악 부서 
select `Department Name`,
		FLOOR(age/10) * 10 as age_band,
        avg(Rating) as avg_rate
from dataset2
group by 1, 2
;
-- 순위 매기기 -> 1위만 보기
select *
from(
	select *, row_number() over (partition by age_band order by avg_rate ) as RNK
	from (
		 select `Department Name`,
			FLOOR(age/10) * 10 as age_band,
			avg(Rating) as avg_rate
		from dataset2
		group by 1, 2
		 )a)a
where RNK = 1;

-- size가 포함된 리뷰 수 구하기
select `Review Text`,
		case when `Review Text` LIKE '%size%' then 1 else 0 end as size_YN
from dataset2
;

select sum(case when `Review Text` LIKE '%size%' then 1 else 0 end) as N_size,
	   count(*) as N_total
from dataset2
;

select sum(case when `Review Text` LIKE '%size%' then 1 else 0 end) as N_size,
	   sum(case when `Review Text` LIKE '%Large%' then 1 else 0 end) as N_large,
       sum(case when `Review Text` LIKE '%Loose%' then 1 else 0 end) as N_Loose,
       sum(case when `Review Text` LIKE '%Small%' then 1 else 0 end) as N_Small,
       sum(case when `Review Text` LIKE '%Tight%' then 1 else 0 end) as N_Tight,
       sum(1) N_total
from dataset2
;

-- 카테고리별 사이즈 리뷰 체크
select `Department Name`,
		sum(case when `Review Text` LIKE '%size%' then 1 else 0 end) as N_size,
	   sum(case when `Review Text` LIKE '%Large%' then 1 else 0 end) as N_large,
       sum(case when `Review Text` LIKE '%Loose%' then 1 else 0 end) as N_Loose,
       sum(case when `Review Text` LIKE '%Small%' then 1 else 0 end) as N_Small,
       sum(case when `Review Text` LIKE '%Tight%' then 1 else 0 end) as N_Tight,
       sum(1) N_total
from dataset2
group by 1
;

-- 연령별로 나누어 비교
select floor(age/10)*10 as age_band,`Department Name`,
		sum(case when `Review Text` LIKE '%size%' then 1 else 0 end) as N_size,
	   sum(case when `Review Text` LIKE '%Large%' then 1 else 0 end) as N_large,
       sum(case when `Review Text` LIKE '%Loose%' then 1 else 0 end) as N_Loose,
       sum(case when `Review Text` LIKE '%Small%' then 1 else 0 end) as N_Small,
       sum(case when `Review Text` LIKE '%Tight%' then 1 else 0 end) as N_Tight,
       sum(1) N_total
from dataset2
group by 1, 2
order by 1, 2
;

-- 비중을 구하기
select floor(age/10)*10 as age_band,`Department Name`,
	   round(sum(case when `Review Text` LIKE '%size%' then 1 else 0 end)/sum(1) *100) as N_size,
	   round(sum(case when `Review Text` LIKE '%Large%' then 1 else 0 end)/sum(1) *100) as N_large,
       round(sum(case when `Review Text` LIKE '%Loose%' then 1 else 0 end)/sum(1) *100) as N_Loose,
       round(sum(case when `Review Text` LIKE '%Small%' then 1 else 0 end)/sum(1) *100) as N_Small,
       round(sum(case when `Review Text` LIKE '%Tight%' then 1 else 0 end)/sum(1) *100) as N_Tight,
       sum(1) N_total
from dataset2
group by 1, 2
order by 1, 2
;

-- 제품 아이디별 사이즈 리뷰
select `Clothing ID`,
	   sum(case when `Review Text` LIKE '%size%' then 1 else 0 end) as N_size,
       round(sum(case when `Review Text` LIKE '%size%' then 1 else 0 end)/sum(1) *100) as R_size,
	   round(sum(case when `Review Text` LIKE '%Large%' then 1 else 0 end)/sum(1) *100) as N_large,
       round(sum(case when `Review Text` LIKE '%Loose%' then 1 else 0 end)/sum(1) *100) as N_Loose,
       round(sum(case when `Review Text` LIKE '%Small%' then 1 else 0 end)/sum(1) *100) as N_Small,
       round(sum(case when `Review Text` LIKE '%Tight%' then 1 else 0 end)/sum(1) *100) as N_Tight
from dataset2
group by 1;