using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace StudyDesign.DataTableInfo
{
	public partial class EditDataTableFieldInfo : System.Web.UI.Page
	{
		private SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString());
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			if (!Master.AutismLogin.CheckGroupPermissions("IT Staff Group".Split(',')))
			{
				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "";

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "error";
				oTd.InnerHtml = "You do not have permission to view this page.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
			else
			{
				Form.Attributes["onsubmit"] = "return(DoSubmitVariableInfo());";

				if (IsPostBack)
					SaveChanges();

				int nTableID = Convert.ToInt32(Request["TableID"].ToString());
				hidTableID.Value = nTableID.ToString();

				oConn.Open();
				oDBLookup = new DBLookup(oConn);

				SqlCommand oCmd = new SqlCommand();
				oCmd.Connection = oConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetFieldInfoByDataTableID";
				oCmd.Parameters.AddWithValue("@DataTableID", nTableID);

				SqlDataReader oReader = oCmd.ExecuteReader();

				if (oReader.HasRows)
				{
					while (oReader.Read())
					{
						#region Display Each Field Info Item
//						tdTitle.InnerHtml = "Edit Variable Info. for " + oReader["MeasureName"].ToString();

						oTr = new HtmlTableRow();

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtFieldName\" value=\"" + oReader["DatabaseField"].ToString() + "\" id=\"txtFieldName\"" + oReader["PK"].ToString() + " style=\"width: 75px;\" />";
						oTd.InnerHtml += "<input type=\"hidden\" name=\"hidFieldID\" value=\"" + oReader["PK"].ToString() + "\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtLabel\" value=\"" + oReader["FieldLabel"].ToString() + "\" id=\"txtLabel\"" + oReader["PK"].ToString() + " style=\"width: 175px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtMinValue\" value=\"" + oReader["MinVal"].ToString() + "\" id=\"txtMinValue\"" + oReader["PK"].ToString() + " style=\"width: 30px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtMaxValue\" value=\"" + oReader["MaxVal"].ToString() + "\" id=\"txtMaxValue\"" + oReader["PK"].ToString() + " style=\"width: 30px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtValidList\" value=\"" + oReader["ValidList"].ToString() + "\" id=\"txtValidList\"" + oReader["PK"].ToString() + " style=\"width: 50px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtMissingValue\" value=\"" + oReader["MissVal"].ToString() + "\" id=\"txtMissingValue\"" + oReader["PK"].ToString() + " style=\"width: 20px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml += "<select name=\"selInAnalysis\" id-\"selInAnalysis" + oReader["PK"].ToString() + "\">";
						oTd.InnerHtml += "<option value=\"0\"";
						if (oReader["InAnalysis"].ToString() == "0") {oTd.InnerHtml += " selected=\"selected\"";}
						oTd.InnerHtml += ">Not in File</option>";
						oTd.InnerHtml += "<option value=\"1\"";
						if (oReader["InAnalysis"].ToString() == "1") {oTd.InnerHtml += " selected=\"selected\"";}
						oTd.InnerHtml += ">No Desc. Stats</option>";
						oTd.InnerHtml += "<option value=\"2\"";
						if (oReader["InAnalysis"].ToString() == "2") {oTd.InnerHtml += " selected=\"selected\"";}
						oTd.InnerHtml += ">Desc. Stats (cont)</option>";
						oTd.InnerHtml += "<option value=\"3\"";
						if (oReader["InAnalysis"].ToString() == "3") {oTd.InnerHtml += " selected=\"selected\"";}
						oTd.InnerHtml += ">Desc. Stats (cat)</option>";
						oTd.InnerHtml += "</select>";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<select name=\"selCalcSPSS\" id=\"selCalcSPSS" + oReader["PK"].ToString() + "\">";
						oTd.InnerHtml += "<option value=\"1\"";
						if (oReader["Calc_SPSS"].ToString() == "1") {oTd.InnerHtml += " selected=\"selected\"";}
						oTd.InnerHtml += ">Yes</option>";
						oTd.InnerHtml += "<option value=\"0\"";
						if (oReader["Calc_SPSS"].ToString() == "0") {oTd.InnerHtml += " selected=\"selected\"";}
						oTd.InnerHtml += ">No</option>";
						oTd.InnerHtml += "</select>";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"textbox\" name=\"txtScatterplot\" value=\"" + oReader["ScatterPlot"].ToString() + "\" id=\"txtScatterplot\"" + oReader["PK"].ToString() + " style=\"width: 50px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"textbox\" name=\"txtBoxPlot\" value=\"" + oReader["BoxPlot"].ToString() + "\" id=\"txtBoxPlot\"" + oReader["PK"].ToString() + " style=\"width: 50px;\" />";
						oTr.Cells.Add(oTd);

						oTd = new HtmlTableCell();
						oTd.InnerHtml = "<input type=\"text\" name=\"txtValueSetID\" value=\"" + oReader["FieldValueSetID"].ToString() + "\" id=\"txtValueSetID\"" + oReader["PK"].ToString() + " style=\"width: 50px;\" />";
						oTr.Cells.Add(oTd);

						tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
						#endregion
					}
				}
				else
				{
					HtmlGenericControl pMsg = new HtmlGenericControl("p");
					pMsg.Attributes["class"] = "pError";
					pMsg.Style["margin"] = "20px";
					pMsg.InnerHtml = "There are no variables defined for this measure.";
				}

				oReader.Close();
				oConn.Close();
			}
		}

		#region Save Changes
		private void SaveChanges()
		{
			//string sTableID = Request["hidTableID"].ToString();
            string sTableID = Request[hidTableID.UniqueID].ToString();
            string[] aFieldID = Request["hidFieldID"].ToString().Replace(", ", ",").Split(',');
			string[] aFieldName = Request["txtFieldName"].ToString().Replace(", ", ",").Split(',');
			string[] aMinValue = Request["txtMinValue"].ToString().Replace(", ", ",").Split(',');
			string[] aMaxValue = Request["txtMaxValue"].ToString().Replace(", ", ",").Split(',');
			string[] aValidList = Request["txtValidList"].ToString().Replace(", ", ",").Split(',');
			string[] aMissingValue = Request["txtMissingValue"].ToString().Replace(", ", ",").Split(',');
			string[] aLabel = Request["txtLabel"].ToString().Replace(", ", ",").Split(',');
			string[] aInAnalysis = Request["selInAnalysis"].ToString().Replace(", ", ",").Split(',');
			string[] aCalcSPSS = Request["selCalcSPSS"].ToString().Replace(", ", ",").Split(',');
			string[] aScatterplot = Request["txtScatterplot"].ToString().Replace(", ", ",").Split(',');
			string[] aBoxPlot = Request["txtBoxPlot"].ToString().Replace(", ", ",").Split(',');
			string[] aValueSetID = Request["txtValueSetID"].ToString().Replace(", ", ",").Split(',');

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateFieldInfo";

			oCmd.Parameters.AddWithValue("@TableID", sTableID);
			oCmd.Parameters.Add("@FieldID", SqlDbType.Int);
			oCmd.Parameters.Add("@DatabaseField", SqlDbType.VarChar);
			oCmd.Parameters.Add("@MinVal", SqlDbType.VarChar);
			oCmd.Parameters.Add("@MaxVal", SqlDbType.VarChar);
			oCmd.Parameters.Add("@ValidList", SqlDbType.VarChar);
			oCmd.Parameters.Add("@MissVal", SqlDbType.VarChar);
			oCmd.Parameters.Add("@FieldLabel", SqlDbType.VarChar);
			oCmd.Parameters.Add("@InAnalysis", SqlDbType.Int);
			oCmd.Parameters.Add("@Calc_SPSS", SqlDbType.Int);
			oCmd.Parameters.Add("@ScatterPlot", SqlDbType.VarChar);
			oCmd.Parameters.Add("@BoxPlot", SqlDbType.VarChar);
			oCmd.Parameters.Add("@FieldValueSetID", SqlDbType.Int);

			oConn.Open();

			for (int i=0;i<aFieldID.Length;i++)
			{
				oCmd.Parameters["@FieldID"].Value = aFieldID[i];
				oCmd.Parameters["@DatabaseField"].Value = aFieldName[i].Replace("%44;", ",");
				oCmd.Parameters["@FieldLabel"].Value = aLabel[i].Replace("%44;", ",");
				oCmd.Parameters["@MinVal"].Value = aMinValue[i].Replace("%44;", ",");
				oCmd.Parameters["@MaxVal"].Value = aMaxValue[i].Replace("%44;", ",");
				oCmd.Parameters["@ValidList"].Value = aValidList[i].Replace("%44;", ",");
				oCmd.Parameters["@MissVal"].Value = aMissingValue[i].Replace("%44;", ",");
				oCmd.Parameters["@InAnalysis"].Value = aInAnalysis[i];
				oCmd.Parameters["@Calc_SPSS"].Value = aCalcSPSS[i];
				oCmd.Parameters["@ScatterPlot"].Value = aScatterplot[i].Replace("%44;", ",");
				oCmd.Parameters["@BoxPlot"].Value = aBoxPlot[i].Replace("%44;", ",");
				oCmd.Parameters["@FieldValueSetID"].Value = aValueSetID[i];

				if (oCmd.Parameters["@FieldID"].Value.ToString() == "") {oCmd.Parameters["@FieldID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@FieldLabel"].Value.ToString() == "") {oCmd.Parameters["@FieldLabel"].Value = DBNull.Value;}
				if (oCmd.Parameters["@MinVal"].Value.ToString() == "") {oCmd.Parameters["@MinVal"].Value = DBNull.Value;}
				if (oCmd.Parameters["@MaxVal"].Value.ToString() == "") {oCmd.Parameters["@MaxVal"].Value = DBNull.Value;}
				if (oCmd.Parameters["@ValidList"].Value.ToString() == "") {oCmd.Parameters["@ValidList"].Value = DBNull.Value;}
				if (oCmd.Parameters["@MissVal"].Value.ToString() == "") {oCmd.Parameters["@MissVal"].Value = DBNull.Value;}
				if (oCmd.Parameters["@ScatterPlot"].Value.ToString() == "") {oCmd.Parameters["@ScatterPlot"].Value = DBNull.Value;}
				if (oCmd.Parameters["@BoxPlot"].Value.ToString() == "") {oCmd.Parameters["@BoxPlot"].Value = DBNull.Value;}
				if (oCmd.Parameters["@FieldValueSetID"].Value.ToString() == "") {oCmd.Parameters["@FieldValueSetID"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}

			oConn.Close();
		}
		#endregion

		#region Add Variables
		protected void AddVariables(object sender, System.EventArgs e)
		{
			int nNumVarsToAdd = Convert.ToInt32(Request["hidNumVarsToAdd"].ToString());
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			for (int i=0;i<nNumVarsToAdd;i++)
			{
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtFieldName\" value=\"\" id=\"txtFieldNameNEW\"" + i.ToString() + " style=\"width: 75px;\" />";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidFieldID\" value=\"\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtLabel\" value=\"\" id=\"txtLabelNEW\"" + i.ToString() + " style=\"width: 175px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtMinValue\" value=\"\" id=\"txtMinValueNEW\"" + i.ToString() + " style=\"width: 30px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtMaxValue\" value=\"\" id=\"txtMaxValueNEW\"" + i.ToString() + " style=\"width: 30px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtValidList\" value=\"\" id=\"txtValidListNEW\"" + i.ToString() + " style=\"width: 50px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtMissingValue\" value=\"\" id=\"txtMissingValueNEW\"" + i.ToString() + " style=\"width: 20px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml += "<select name=\"selInAnalysis\" id-\"selInAnalysisNEW" + i.ToString() + "\">";
				oTd.InnerHtml += "<option value=\"0\">Not in File</option>";
				oTd.InnerHtml += "<option value=\"1\">No Desc. Stats</option>";
				oTd.InnerHtml += "<option value=\"2\">Desc. Stats (cont)</option>";
				oTd.InnerHtml += "<option value=\"3\">Desc. Stats (cat)</option>";
				oTd.InnerHtml += "</select>";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<select name=\"selCalcSPSS\" id=\"selCalcSPSSNEW" + i.ToString() + "\">";
				oTd.InnerHtml += "<option value=\"1\">Yes</option>";
				oTd.InnerHtml += "<option value=\"0\">No</option>";
				oTd.InnerHtml += "</select>";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"textbox\" name=\"txtScatterplot\" value=\"\" id=\"txtScatterplotNEW\"" + i.ToString() + " style=\"width: 50px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"textbox\" name=\"txtBoxPlot\" value=\"\" id=\"txtBoxPlotNEW\"" + i.ToString() + " style=\"width: 50px;\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtValueSetID\" value=\"\" id=\"txtValueSetIDNEW\"" + i.ToString() + " style=\"width: 50px;\" />";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(2, oTr);
			}
		}
		#endregion
	}
}