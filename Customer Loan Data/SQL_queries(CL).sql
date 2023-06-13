CREATE TABLE Sheet1(select_count_distinct_loan_type_from_CI_customer VARCHAR(10),Column_2 VARCHAR(10),Column_3 VARCHAR(10),Column_4 VARCHAR(10));
INSERT INTO Sheet1 (select_count_distinct_loan_type_from_CI_customer,Column_2,Column_3,Column_4) VALUES 
('select loan_type','count(total_loans) from CI_loan group by loan_type','',''),
('select account_no','loan_type','age from CI_customer where account_no="CI11"',''),
('select account_no','loan_type','age from CI_customer where age between 30 and 50',''),
('select loan_type','min(credit_score) from CI_loan where loan_type='HL'','',''),
('select avg(annual_income)','If_Default from CI_customer a JOIN CI_loan b ON a.account_no=b.account_no where credit_score > 700 group by If_Default','',''),
('select avg(credit_score)','marital_status from CI_customer a JOIN CI_loan b ON a.account_no=b.account_no group by  marital_status','',''),
('select education_level','If_Default','count(If_Default) from CI_customer a JOIN CI_loan b ON a.account_no=b.account_no group by education_level','If_Default'),
('select Report_Month','year(Report_Month) yearname','monthname(Report_Month) monthname','Unemp_Rate from CI_economics having yearname=2019 and monthname='February''),
('select account_no','loan_type','age from CI_customer where age > 50','');