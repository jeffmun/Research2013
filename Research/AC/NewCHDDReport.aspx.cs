using System;
using System.Drawing;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

public partial class NewCHDDReport : System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();
    private ReadConfig oConfig = new ReadConfig();
    private double numCRClients = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValantTJ"].ConnectionString;
        oConn.Open();
        
        if (!IsPostBack)
        {
            vwGetVisitStats();
            numCRClients = vwGetVisitClientStats();
            vwGetUnscaledClientDemog();
            vwGetUnscaledClientCareAndRefer();
            vwGetDxCounts();
        }
    }

    protected void vwGetVisitStats()
    {
        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText =

      "SELECT [NumVisits]            " +
      ",[PurpDx]                               " +
      ",[PurpReEval]                           " +
      ",[PurpTreat]                            " +
      ",[DiscPsych]                            " +
      ",[DiscSLP]                              " +
      ",[DiscABA]                              " +
      "FROM[ValantTJ].[dbo].[vwGetVisitStats]  ";

        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            TextBox1.Text = sqlRead[0].ToString();
            TextBox2.Text = sqlRead[1].ToString();
            TextBox3.Text = sqlRead[2].ToString();
            TextBox4.Text = sqlRead[3].ToString();
            TextBox5.Text = sqlRead[4].ToString();
            TextBox6.Text = sqlRead[5].ToString();
            TextBox7.Text = sqlRead[6].ToString();
        }
        sqlRead.Close();
    }

    protected double vwGetVisitClientStats()
    {
        double n = 0;
        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText =

      "SELECT [NumClients]        " +
      ",[EstDis]                  " +
      ",[AtRiskBio]               " +
      ",[PayorComm]               " +
      ",[PayorMedicaid]           " +
      ",[PayorMedicare]           " +
      ",[PayorOther]              " +
      ",[PayorSelf]               " +
      ",[PayorTri]                " +
      "FROM[ValantTJ].[dbo].[vwGetVisitClientStats]  ";

        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            TextBox8.Text = sqlRead[0].ToString();
            n = Convert.ToInt32(sqlRead[0]);
            TextBox9.Text = sqlRead[1].ToString();
            TextBox10.Text = sqlRead[2].ToString();
            TextBox11.Text = sqlRead[3].ToString();
            TextBox12.Text = sqlRead[4].ToString();
            TextBox13.Text = sqlRead[5].ToString();
            TextBox14.Text = sqlRead[6].ToString();
            TextBox15.Text = sqlRead[7].ToString();
            TextBox16.Text = sqlRead[8].ToString();
        }
        sqlRead.Close();
        return n;
    }

    protected void vwGetUnscaledClientDemog()
    {
        double n = 0;
        double ratio = 0;
        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText =

      "SELECT [NumClients]   "+
      ",[male]               "+
      ",[female]             "+
      ",[other]              "+
      ",[EthNatAmer]         "+
      ",[EthAsian]           "+
      ",[EthHisp]            "+
      ",[EthPacIs]           "+
      ",[EthCaucas]          "+
      ",[EthAfric]           "+
      ",[EthUnk]             "+
      ",[EthOth]             "+
      ",[Age0to3]            "+
      ",[Age4to5]            "+
      ",[Age6to9]            "+
      ",[Age10to14]          "+
      ",[Age15to19]          "+
      ",[Age20to24]          "+
      ",[Age25to29]          "+
      ",[Age30to54]          "+
      ",[Age55plus]          "+                    
      "FROM[ValantTJ].[dbo].[vwGetUnscaledClientDemog]  ";

        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            TextBox17.Text = sqlRead[0].ToString();
            n = Convert.ToDouble(sqlRead[0]);
            if (n > 0) { ratio = numCRClients / n; }
            TextBox18.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[1])).ToString();
            TextBox19.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[2])).ToString();
            TextBox20.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[3])).ToString();
            TextBox21.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[4])).ToString();
            TextBox22.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[5])).ToString();
            TextBox23.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[6])).ToString();
            TextBox24.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[7])).ToString();
            TextBox25.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[8])).ToString();
            TextBox26.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[9])).ToString();
            TextBox27.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[10])).ToString();
            TextBox28.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[11])).ToString();
            TextBox29.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[12])).ToString();
            TextBox30.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[13])).ToString();
            TextBox31.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[14])).ToString();
            TextBox32.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[15])).ToString();
            TextBox33.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[16])).ToString();
            TextBox34.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[17])).ToString();
            TextBox35.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[18])).ToString();
            TextBox36.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[19])).ToString();
            TextBox37.Text = Convert.ToInt32(ratio*Convert.ToInt32(sqlRead[20])).ToString();
        }
        sqlRead.Close();
    }

    protected void vwGetUnscaledClientCareAndRefer()
    {
        double n = 0;
        double ratio = 0;
        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText =

      "SELECT [NumClients] "+
      ",[CareAdopt]        "+
      ",[CareBio]          "+
      ",[CareFoster]       "+
      ",[CareGrand]        "+
      ",[CareLegal]        "+
      ",[CareOthRel]       "+
      ",[CareOther]        "+
      ",[CareNone]         "+
      ",[CareNull]         "+
      ",[ReferPCP]         "+
      ",[ReferSelf]        "+
      ",[ReferHosp]        "+
      ",[ReferPhysSpec]    "+
      ",[ReferPHA]         "+
      ",[ReferSchool]      "+
      ",[ReferOHP]         "+
      ",[ReferUnk]         "+                   
      "FROM[ValantTJ].[dbo].[vwGetUnscaledClientCareAndRefer]  ";

        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            TextBox38.Text = sqlRead[0].ToString();
            n = Convert.ToDouble(sqlRead[0]);
            if (n > 0) { ratio = numCRClients / n; }
            TextBox39.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[1])).ToString();
            TextBox40.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[2])).ToString();
            TextBox41.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[3])).ToString();
            TextBox42.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[4])).ToString();
            TextBox43.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[5])).ToString();
            TextBox44.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[6])).ToString();
            TextBox45.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[7])).ToString();
            TextBox46.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[8])).ToString();
            TextBox47.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[9])).ToString();
            TextBox48.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[10])).ToString();
            TextBox49.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[11])).ToString();
            TextBox50.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[12])).ToString();
            TextBox51.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[13])).ToString();
            TextBox52.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[14])).ToString();
            TextBox53.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[15])).ToString();
            TextBox54.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[16])).ToString();
            TextBox55.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[17])).ToString();
        }
        sqlRead.Close();
    }

    protected void vwGetDxCounts()
    {
        double n = 0;
        double ratio = 0;
        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText =

      "SELECT [NumDx]          "+
      ",[ADDOrADHD]            "+
      ",[AutismOrPDD]          "+
      ",[CommDisord]           "+
      ",[IntDisabil]           "+
      ",[Other]                "+
      ",[SocEmotOrBehDisord]   "+                    
      "FROM[ValantTJ].[dbo].[vwGetDxCounts]  ";

        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            TextBox56.Text = sqlRead[0].ToString();
            n = Convert.ToDouble(sqlRead[0]);
            if (n > 0) { ratio = numCRClients / n; }
            TextBox57.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[1])).ToString();
            TextBox58.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[2])).ToString();
            TextBox59.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[3])).ToString();
            TextBox60.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[4])).ToString();
            TextBox61.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[5])).ToString();
            TextBox62.Text = Convert.ToInt32(ratio *Convert.ToInt32(sqlRead[6])).ToString();
        }
        sqlRead.Close();
    }
}
