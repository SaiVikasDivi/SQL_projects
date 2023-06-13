﻿CREATE TABLE Sheet1(select_*_from_cr_orders VARCHAR(10),Column_2 VARCHAR(10),Column_3 VARCHAR(10),Column_4 VARCHAR(10),Column_5 VARCHAR(10),Column_6 VARCHAR(10));
INSERT INTO Sheet1 (select_*_from_cr_orders,Column_2,Column_3,Column_4,Column_5,Column_6) VALUES 
('select count(*) from cr_orders where status='Shipped' and date(requiredDate)<=date(shippedDate);','','','','',''),
('select * from cr_products','','','','',''),
('select * from cr_products where quantityInStock>=1000 and productLine='Motorcycles' and MSRP>97.18 or productLine='Classic Cars' and MSRP<118.02 order by MSRP DESC','quantityInStock ASC;','','','',''),
('select productLine','productScale','sum(quantityInStock*MSRP) 'revenue' from cr_products group by productScale','productLine order by revenue DESC;','',''),
('select year(shippedDate) 'year'','monthname(shippedDate) 'month'','sum(quantityInStock*buyPrice) 'profit' from cr_orders A inner join cr_orderdetails B on A.orderNumber=B.orderNumber inner join cr_products C on B.productCode = C.productCode group by year','month order by profit desc','',''),
('select A.productCode','quantityOrdered from cr_products A left join cr_orderdetails B on A.productCode=B.productCode order by quantityOrdered;','','','',''),
('WITH customerorders AS ','','','','',''),
('(SELECT country','c.customernumber','customername','Sum(amount) AS 'customerOrderValue' FROM   cr_payments p JOIN cr_customers c ON p.customernumber = c.customernumber GROUP  BY country','customernumber','customername)'),
('SELECT a.country','customername','customerOrderValue','(customerOrderValue/year_rev)*100 'perc-of_rev' FROM  customerorders a join (select country','sum(customerOrderValue) 'year_rev' from customerorders GROUP by country) b',''),
('on a.country=b.country order by country','customername','','','',''),
('select * from pm_web_events','','','','',''),
('select count(*) from pm_web_events where channel in ('Facebook'',''Twitter') and monthname(occurred_at)='January' and year(occurred_at)=2015','','','',''),
('select location','count(id) from pm_accounts A right join pm_agents B on A.agent_id=B.agent_id group by location','','','',''),
('select *  from pm_accounts a join pm_agents b on a.agent_id=b.agent_id ','','','','',''),
('select name','count(order_id) 'orders' from pm_accounts A left join pm_orders B on A.id=B.account_id group by name order by 2','','','',''),
('select name','sum(total_amt_usd) 'Sales' from pm_accounts A left join pm_orders B on A.id=B.account_id where occurred_at between '2014-01-12' and '2015-11-15' group by name order by Sales DESC ','','','',''),
('select name','channel','count(channel) 'channel_count' from pm_accounts A left join pm_web_events B on A.id=B.account_id where channel='Twitter' group by channel','name having channel_count > 10','',''),
('WITH highest_avg AS','','','','',''),
('(select channel','monthname(occurred_at) 'months'','count(event_id) 'no of events' from pm_web_events group by channel','months)','',''),
('select channel','avg(events) 'events_avg' from highest_avg group by channel order by events_avg desc','','','',''),
('WITH annual_revenue AS ','','','','',''),
('(select account_id','year(occurred_at)'years'','SUM(total_amt_usd)'salesx' from pm_orders group by account_id','years)','',''),
('select account_id','a.years','salesx','(salesx/year_sales)*100 'perc_acc' from annual_revenue a join (select years','SUM(salesx) 'year_sales' from annual_revenue group by years)b ',''),
('on a.years=b.years order by perc_acc desc','','','','',''),
('WITH annual_revenue','','','','',''),
('     AS (SELECT Year(occurred_at)  AS years','','','','',''),
('                Sum(total_amt_usd) AS annual_rev','','','','',''),
('         FROM   pm_orders','','','','',''),
('         GROUP  BY Year(occurred_at))','','','','',''),
('SELECT b.account_id','','','','',''),
('       years','','','','',''),
('       b.acc_annu_rev','','','','',''),
('       annual_rev','','','','',''),
('       ( b.acc_annu_rev / annual_rev ) * 100 AS perc_rev','','','','',''),
('FROM   (SELECT account_id','','','','',''),
('               Year(occurred_at)  acc_annu_year','','','','',''),
('               Sum(total_amt_usd) AS acc_annu_rev','','','','',''),
('        FROM   pm_orders','','','','',''),
('        GROUP  BY acc_annu_year','','','','',''),
('                  account_id) b','','','','',''),
('       INNER JOIN annual_revenue c','','','','',''),
('               ON c.years = b.acc_annu_year','','','','',''),
('ORDER  BY perc_rev DESC','','','','',''),
('SELECT channel','','','','',''),
('       Avg(num_of_events)','','','','',''),
('FROM   (SELECT Month(occurred_at) AS month_num','','','','',''),
('               channel','','','','',''),
('               Count(event_id) AS num_of_events','','','','',''),
('        FROM   pm_web_events','','','','',''),
('        GROUP  BY 1','','','','',''),
('                  2) a','','','','',''),
('GROUP  BY channel','','','','',''),
('ORDER  BY 2 DESC','','','','',''),
('select a.id','a.agent_id from pm_accounts a inner join pm_agents b on a.agent_id=b.agent_id where location='Midwest';','','','','');