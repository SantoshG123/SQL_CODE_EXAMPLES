
SELECT dbo.Region.RegionDescription AS Region, SUM (dbo.Orders.OrderID) As
Sales
From dbo.Orders, dbo.Employees, dbo.EmployeeTerritories, dbo.Territories,
dbo.Region
Where dbo.Orders.EmployeeID = dbo.Employees.EmployeeID
AND dbo.Employees.EmployeeID = dbo.EmployeeTerritories.EmployeeID
AND dbo.EmployeeTerritories.TerritoryID = dbo.Territories.TerritoryID
AND dbo.Territories.RegionID = dbo.Region.RegionID
Group by RegionDescription
select *
from (
select x.vld_data_txt,x.SBP_Dt,SBP_Lvl_Val,
x.SBP_Lvl_Val_Self_Rpt_Flg,
y.Prof_SBP_Lvl_Val, y.max_prof_SBP_Lvl_Dt
from DBA.Wlns_Raw_Results_Fact x,
(select distinct a.Vld_Data_Txt, a.Prof_SBP_Lvl_Val, b.max_prof_SBP_Lvl_Dt
from DBA.Wlns_Professional_Raw_Results_Fact a,
(
select max(SBP_Lvl_Dt) as max_prof_SBP_Lvl_Dt, vld_data_txt
from DBA.Wlns_Professional_Raw_Results_Fact
group by vld_data_txt
) b
where a.vld_data_txt=b.vld_data_txt and b.max_prof_SBP_Lvl_Dt=a.SBP_Lvl_Dt
) y
where x.vld_data_txt=y.vld_data_txt
order by x.vld_data_txt
) z
where (Prof_SBP_Lvl_Val &lt;&gt; SBP_Lvl_Val and SBP_Lvl_Val_Self_Rpt_Flg ='Y'; 