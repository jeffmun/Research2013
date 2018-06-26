using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;
using uwac_controls;

public partial class Tracking_BudgetInfo : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		getBudgetInfo();
	}


	protected void getBudgetInfo()
	{

		string sql_code = 
		@"select cast(fiscalyear as varchar) + '_' + cast(FiscalMonth as varchar) yrmo, * from 
		(
		select bi.fiscalyear
		, bi.budgetnbr
		, bi.budgetname
		, bi.OrgCode
		, bi.PrincipalInvestigator
		, bi.revenueclassdesc 'FundingSource'
		, bi.budgettypecode
		, bi.budgetclasscode
		, ats.FiscalMonth  /*comment this line out if you don't want it at the month level*/
		, ats.ObjSubObjCode
		, oso.Description 'ObjSubObjDesc'
		, Sum(case when trancode in ('20','23','24','25','28','29')
				and accountcode not like '9%'
				and BudgetPermTempCryfwdCode != 'C'
				then SummaryAmt*-1 else 0 end) as 'BudgetAmount'
		, Sum(Case when trancode = '32'
				and accountcode like '9%'
				then SummaryAmt*-1 else 0 end) as 'BalanceFromPriorBiennium'
		, Sum(case when trancode in ('30','35','36','44','50','52','60','61','62','65','70','73')
				and accountcode like '9%'
				then SummaryAmt*-1 else 0 end) as 'RevenueAmount'
		, Sum(case when trancode in ('30','35','36','44','50','52','60','61','62','65','70','73')
				and accountcode not like '9%'
				then SummaryAmt*-1 else 0 end) as 'ExpenseAmount'
		, Sum(case when trancode in ('40', '41', '42', '43', '51', '53')
				and accountcode not like '9%'
				then SummaryAmt*-1 else 0 end) as 'Encumbrances'
		FROM sec.AcctngMonthTransSum ats
		inner join sec.dimBudgetIndexFY bi
		on bi.fiscalyear = ats.fiscalyear
		and bi.budgetnbr = ats.budgetnbr
		left join ODS.sec.ObjectSubObject oso
		on ats.BienniumYear = oso.BienniumYear
		and ats.ObjSubObjCode = oso.ObjectSubObjectCode
		where bi.budgetnbr in ('095001', '095002', '653920', '655411', '099877','631370', '658823','658853', '657837','653977')
		and trancode in ('20','23','24','25','28','29','30','32','35','36','44','50','52','60','61','62','65','70','73')
		group by
		bi.fiscalyear
		, bi.budgetnbr
		, bi.budgetname
		, bi.OrgCode
		, bi.PrincipalInvestigator
		, bi.budgettypecode
		, bi.budgetclasscode
		, ats.FiscalMonth  /*comment this line out if you don't want it at the month level*/
		, ats.ObjSubObjCode
		, oso.Description
		, bi.revenueclassdesc
		) x
		order by budgetAmount desc
		where -- budgetAmount <> 0 or RevenueAmount <> 0 and 
		budgetnbr = 653920
		order by BudgetNbr, FiscalYear, FiscalMonth";


		SQL_utils sql = new SQL_utils("FinMart");

		DataTable dt = sql.DataTable_from_SQLstring(sql_code);

		GridView gv = new GridView();
		gv.DataSource = dt;
		gv.DataBind();

		panel1.Controls.Add(gv);

	}
}