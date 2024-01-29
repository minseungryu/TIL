USE classicmodels;
-- 매출액(일자별, 월별, 연도별)
-- 일별 매출액 조회

SELECT A.orderdate, B.priceEach * B.quantityOrdered as daily_sales
FROM orders as A
LEFT JOIN orderdetails as B on A.ordernumber = B.ordernumber
ORDER BY 1;

SELECT A.orderdate, SUM(B.priceEach * B.quantityOrdered) as total_sales
FROM orders as A
LEFT JOIN orderdetails as B on A.ordernumber = B.ordernumber
GROUP BY 1
ORDER BY 1;

-- 월별 매출액 조회
SELECT SUBSTR(A.orderdate, 1, 7) as MM, 
		SUM(B.priceEach * B.quantityOrdered) as total_sales
FROM orders as A
LEFT JOIN orderdetails as B on A.ordernumber = B.ordernumber
group by 1
order by 1;

-- 연도별 매출액 조회
SELECT substr(A.orderdate, 1, 4) as YY,
		sum(B.priceEach * B.quantityOrdered) as total_sales
FROM orders as A
LEFT JOIN orderdetails as B on A.ordernumber = B.ordernumber
group by 1
order by 1;

-- 구매자 수, 구매 건수(일, 월, 연)
SELECT orderDate
		, count(distinct customerNumber)
        , count(OrderNumber)
FROM orders
group by 1
order by 1;

-- 인당 매출액(연도별) : 고객 로열티 측정
select substr(orderdate, 1, 4) as YY
		,count(distinct customerNumber) as N_customers
        ,sum(priceEach * quantityordered) as Sales
        ,sum(priceEach * quantityordered) / count(distinct customerNumber) as 인당_매출액
from orders as a
left join orderdetails as b on a.ordernumber = b.ordernumber
group by 1
order by 1;

-- 건당 구매 금액(연도별)
select substr(orderdate, 1, 4) as YY
		,sum(priceEach * quantityordered) as total_Sales
		,sum(priceEach * quantityordered) / count(distinct a.ordernumber) as 건당구매금액
from orders as a
left join orderdetails as b on a.ordernumber = b.ordernumber
group by 1
order by 1;

-- 그룹별 구매 지표 구하기
select country, city, priceEach * quantityordered
from orders as a
left join orderdetails as b on a.ordernumber = b.ordernumber
left join customers as c on c.customerNumber = a.customerNumber;

-- 국가별/도시별 매출액
select country
		, city
		, sum(priceEach * quantityordered) as sales
from orders as a
left join orderdetails as b on a.ordernumber = b.ordernumber
left join customers as c on c.customerNumber = a.customerNumber
group by 1, 2
order by 1, 2
; 

-- 북미/비북미 매출비교
select case when country in ('USA', 'Canada') then '북미' else '비북미' end as country_group
		, sum(priceEach * quantityordered) as sales
from orders as a
left join orderdetails as b on a.ordernumber = b.ordernumber
left join customers as c on c.customerNumber = a.customerNumber
group by 1;

-- 매출 탑5 국가와 매출
create table STATS as
select country, sum(priceEach * quantityordered) as sales
from orders as a
left join orderdetails as b on a.ordernumber = b.ordernumber
left join customers as c on c.customerNumber = a.customerNumber
group by 1
order by 2 desc;

select country, sales
			, dense_rank() over (order by sales desc) as sales_rank
from STATS
limit 5;

-- 서브쿼리로 더욱 간단하게 ------------------------------------------------------------------------------------------
select *
from (
	select country, sales, dense_rank() over(order by sales desc) as sales_rank
	from (
			select country, sum(priceEach * quantityordered) as sales
            from orders as a
			left join orderdetails as b on a.ordernumber = b.ordernumber
			left join customers as c on c.customerNumber = a.customerNumber
            group by 1) A
) A
where sales_rank <= 5
;

-- 복습
select *
from(
	select country, sales, dense_rank() over (order by sales desc) as sales_rank
	from (
		select country
				, sum(priceEach * quantityordered) as sales
		from orders as a
		left join customers as b on b.customerNumber = a.customerNumber
		left join orderdetails as c on a.ordernumber = c.ordernumber
		group by 1
	) a
) b
where sales_rank <= 5;


-- ---------------------------------------------------------------------------------------------------------------------
-- 재구매율
select a.customernumber, a.orderDate, b.customernumber, b.orderDate
from orders as a
left join orders b on a.customernumber = b.customernumber
					and substr(a.orderDate, 1, 4) = substr(b.orderDate, 1, 4) -1
;

select country, substr(a.orderDate, 1, 4) as year
		,count(distinct a.customerNumber) as BU_1
        ,count(distinct b.customerNumber) as BU_2
        ,count(distinct b.customerNumber) / count(distinct a.customerNumber) as retention_rate
from orders as a
left join orders b on a.customernumber = b.customernumber
					and substr(a.orderDate, 1, 4) = substr(b.orderDate, 1, 4) -1
left join customers as c on c.customerNumber = a.customerNumber
group by 1, 2
;



-- 베스트 셀러 ( 미국, 연도별 탑5 차량 모델 : 모델별 매출 ) -- 그냥 하는 버전
select productName
		, sum(priceEach * quantityordered) as sales
        , dense_rank() over (order by sum(priceEach * quantityordered) desc) as sales_rank
from orders as a
left join orderdetails as b on a.orderNumber = b.orderNumber
left join products as c on b.productCode = c.productCode
left join customers as d on d.customerNumber = a.customerNumber
where country = 'USA'
group by 1
order by 2 desc;

-- 서브쿼리 버전 --
select * 
from (
	select *
		, row_number() over (order by sales desc) as ranking
    from    
		(select productName, sum(priceEach * quantityordered) as sales
		from orders as a
		left join orderdetails as b on a.orderNumber = b.orderNumber
		left join products as c on b.productCode = c.productCode
		left join customers as d on d.customerNumber = a.customerNumber
		where country = 'USA'
        group by 1) B
		) A
where ranking <= 5
order by ranking;

-- churn rate
select customerNumber, last_order_date, 
		datediff('2005-06-01', last_order_date) as diff
from (
	select customerNumber, max(orderdate) as last_order_date
    from orders
    group by 1
     ) a;
     
select customerNumber, last_order_date
		, '2005-06-01' as end_point
        , datediff('2005-06-01', last_order_date) as diff
from 
 ( select customerNumber
          , max(orderdate) as last_order_date
   from orders
   group by 1
 ) a;


select *,
		case when diff >= 90 then 'CHURN' else 'Non-churn' end as churn_type
from (
	select customerNumber, last_order_date
			, '2005-06-01' as end_point
            , datediff('2005-06-01', last_order_date) as diff
    from 
	 ( select customerNumber
				, max(orderdate) as last_order_date
	   from orders
       group by 1
     ) a
) a
;

select case when diff >= 90 then 'CHURN' else 'Non-churn' end as churn_type
		, count(DISTINCT customernumber) as N_cus
from (
	select customerNumber, last_order_date
			, '2005-06-01' as end_point
            , datediff('2005-06-01', last_order_date) as diff
    from 
	 ( select customerNumber
				, max(orderdate) as last_order_date
	   from orders
       group by 1
     ) a
) a
group by 1
;

-- churn 고객이 가장 많이 구매한 상품 --
-- -- 고객별 churn 타입 / 제품 / 구매자수

-- product별 구매자수
with products_temp as 
(
select productLine
		,count(distinct customerNumber)
from orderdetails as A
left join orders as B on A.orderNumber = B.orderNumber
left join products as C on C.productCode = A.productCode
group by 1
)

-- temp 이용 --

with churn_table as
(
select customerNumber, case when diff >= 90 then 'CHURN' else 'Non_CHURN' end as churn_type
from(
	select *, datediff('2005-06-01', max_date) as diff
	from (
		select customerNumber , max(orderDate) as max_date
		from orders as A
		group by 1
		) a
	) b
), 
temp2 as 
(
select productLine, customerNumber
from orderdetails as A
left join orders as B on A.orderNumber = B.orderNumber
left join products as C on C.productCode = A.productCode
)
select churn_type, productLine, count(distinct customerNumber)
from churn_table as A
left join temp2 as B on A.customerNumber = B.customerNumber
group by 1, 2
;

