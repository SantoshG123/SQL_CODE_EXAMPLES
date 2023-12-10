--Group purchase table

select a.*, b.prgrm_cat_cd
from dba.whd_mbr_elig_dim a, dba.whd_grp_purchase_dim b
where a.whd_grp_purchase_dim_key = b.whd_grp_purchase_dim_key
and b.prgrm_cat_cd = ‘WSV’
and a.Cert_Num = "3232342";
and a. Mbr_First_Nm = "SAM";
and a.Mbr_Last_Nm ="RHINEHEART";

SELECT distinct
  DBA.Mbr_Dim.Birth_Date as Birthdate,
  DBA.Mbr_Dim.Social_Security_Num as SSN,
  DBA.Mbr_Dim.Mbr_Num,
  DBA.Mbr_Addr_Dim.Mbr_First_Name as FirstName,
  DBA.Mbr_Addr_Dim.Mbr_Last_Name as LastName,
  DBA.Mbr_Dim.Gender_Code as Gender,
  DBA.Mbr_Addr_Dim.Line_1_Addr as Address,
  DBA.Mbr_Addr_Dim.Line_2_Addr as Address2,
  DBA.Mbr_Addr_Dim.City,
  DBA.Mbr_Addr_Dim.State_Code as State,
  DBA.Mbr_Addr_Dim.ZIP_Code as ZipCode,
  DBA.Group_Dim.Account_Key
  
FROM
   DBA.Group_Underwriting_Dim
   INNER JOIN DBA.Mbr_Benefit_Year_Month_Fact ON
  
DBA.Mbr_Benefit_Year_Month_Fact.Group_Underwriting_Dim_Key=DBA.Group_Underwriting_Dim.Group_Under
writing_Dim_Key
   INNER JOIN DBA.Group_Dim ON
   DBA.Group_Dim.Group_Dim_Key=DBA.Mbr_Benefit_Year_Month_Fact.Group_Dim_Key
   INNER JOIN DBA.Mbr_Benefit_Dim ON
   DBA.Mbr_Benefit_Year_Month_Fact.Mbr_Benefit_Dim_Key=DBA.Mbr_Benefit_Dim.Mbr_Benefit_Dim_Key
   INNER JOIN DBA.Mbr_Addr_Dim ON
   DBA.Mbr_Addr_Dim.Mbr_Addr_Dim_Key=DBA.Mbr_Benefit_Dim.Mbr_Addr_Dim_Key
   INNER JOIN DBA.ULP_Dimension ON
   DBA.Mbr_Benefit_Dim.ULP_Dimension_Key=DBA.ULP_Dimension.ULP_Dimension_KEY
   INNER JOIN DBA.Age_Dim ON
   (DBA.Age_Dim.Age_Dim_Key=DBA.Mbr_Benefit_Year_Month_Fact.Age_Dim_Key)
WHERE
   DBA.Age_Dim.Age >  18
   AND  DBA.Mbr_Benefit_Dim.UA_Reportable_Flag  = "Y";
   AND  (DBA.Mbr_Dim.Mbr_Elig_Status_Code  IN  ("A",  "I") or
        (DBA.Mbr_Dim.Mbr_Elig_Status_Code = "C" and DBA.Mbr_Dim.Expiration_Date &gt; today() )
  GROUP BY
  DBA.Mbr_Dim.Birth_Date,
  DBA.Mbr_Dim.Social_Security_Num,
  DBA.Mbr_Dim.Mbr_Num;