
--Sub fuction query for counts

Select CNT, Count(*) from (
Select Acct_Key, Count(*) As CNT from STG.Wlns_Raw_Results
Group by Acct_Key) As A
Group by CNT
SELECT CNT, COUNT(*) FROM (
SELECT CALENDAR_YR, COUNT(*) AS CNT FROM STG.STAR_CPI
GROUP BY CALENDAR_YR) AS A
GROUP BY CNT;


--Duplicate counts

Select ValidationData
from cn0027.v45_eligibility
Group By ValidationData
Having Count(ValidationData>1);