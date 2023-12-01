WITH MyCTe AS(
				SELECT ID ,
					   Name As Athelete_Name ,
					   CASE When Sex = 'M' Then 'Male' Else 'Female' End As Sex ,
					   Age ,
					   CASE When Age < 18 Then 'Below 18'
							When Age BETWEEN 18 And 25 Then '18-25'
							When Age BETWEEN 25 And 35 Then '25-35'
							When Age BETWEEN 35 And 45 Then '35-45'
							When Age BETWEEN 45 And 55 Then '45-55' Else 'Over 55' End As Age_Group ,
					   NOC As Nation_Code ,
					   LEFT(Games ,CHARINDEX(' ' ,Games)-1) As Year ,
					   RIGHT(Games ,(CHARINDEX(' ' ,Games)+1)) As Season ,
					   Sport ,
					   Event ,
					   CASE When Medal = 'NA' Then 'Not Registered' Else Medal End As Medal
				FROM athletes_event_results
				)
SELECT * FROM MyCTe
WHERE Season = 'Winter'