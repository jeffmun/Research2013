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
    private double numCRVisits = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValantTJ"].ConnectionString;
        oConn.Open();
        
        if (!IsPostBack)
        {
            numCRVisits = vwGetVisitStats();
            numCRClients = vwGetVisitClientStats();
            vwGetUnscaledClientDemog();
            vwGetUnscaledClientCareAndRefer();
            vwGetDxCounts();
        }
    }
    protected double vwGetVisitStats()
    {
        int[] value;
        double visits = 0;
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
            visits = Convert.ToDouble(sqlRead[0]);

            value = ScaledValues(1, 3, sqlRead, visits);
            TextBox68.Text = value[0].ToString();
            TextBox2.Text =  value[1].ToString();
            TextBox3.Text =  value[2].ToString();
            TextBox4.Text =  value[3].ToString();

            value = ScaledValues(4, 6, sqlRead, visits);
            TextBox69.Text = value[0].ToString();//disciplines
            TextBox5.Text =  value[1].ToString();
            TextBox6.Text =  value[2].ToString();
            TextBox7.Text =  value[3].ToString();
        }
        sqlRead.Close();
        return visits;
    }
    protected double vwGetVisitClientStats()
    {
        int total = 0;
        int[] value;
        double ratio = 1;
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
            n = Convert.ToDouble(sqlRead[0]);
            value = ScaledValues(1, 2, sqlRead, n);
            TextBox71.Text = value[0].ToString(); //dx type
            TextBox9.Text =  value[1].ToString();
            TextBox10.Text = value[2].ToString();

            value = ScaledValues(3, 8, sqlRead, n);
            TextBox70.Text = value[0].ToString(); //payors
            TextBox11.Text = value[1].ToString();
            TextBox12.Text = value[2].ToString();
            TextBox13.Text = value[3].ToString();
            TextBox14.Text = value[4].ToString();
            TextBox15.Text = value[5].ToString();
            TextBox16.Text = value[6].ToString();
        }
        sqlRead.Close();
        return n;
    }
    protected void vwGetUnscaledClientDemog()
    {
        int[] value;
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
            value = ScaledValues(12, 20, sqlRead, numCRClients);
            TextBox63.Text = value[0].ToString(); //ages
            TextBox29.Text = value[1].ToString();
            TextBox30.Text = value[2].ToString();
            TextBox31.Text = value[3].ToString();
            TextBox32.Text = value[4].ToString();
            TextBox33.Text = value[5].ToString();
            TextBox34.Text = value[6].ToString();
            TextBox35.Text = value[7].ToString();
            TextBox36.Text = value[8].ToString();
            TextBox37.Text = value[9].ToString();

            value = ScaledValues(4, 11, sqlRead, numCRClients);
            TextBox64.Text = value[0].ToString(); //ethnicities
            TextBox21.Text = value[1].ToString();
            TextBox22.Text = value[2].ToString();
            TextBox23.Text = value[3].ToString();
            TextBox24.Text = value[4].ToString();
            TextBox25.Text = value[5].ToString();
            TextBox26.Text = value[6].ToString();
            TextBox27.Text = value[7].ToString();
            TextBox28.Text = value[8].ToString();

            value = ScaledValues(1, 3, sqlRead, numCRClients);
            TextBox65.Text = value[0].ToString(); //genders
            TextBox18.Text = value[1].ToString();
            TextBox19.Text = value[2].ToString();
            TextBox20.Text = value[3].ToString();
        }
        sqlRead.Close();
    }
    protected int[] ScaledValues(int start, int end, System.Data.SqlClient.SqlDataReader sr, double numClients)
    {
        double n = 0;
        int arraySize = end - start + 2;
        int[] values = new int[arraySize];
        double ratio = 0;
        for (int i = 1; i < arraySize; i++)
        {
            values[i] = Convert.ToInt32(sr[i+start-1]);
            n += values[i];
        }
        if (n > 0) { ratio = numClients / n; }
        for (int i = 1; i < arraySize; i++)
        {
            values[i] = Convert.ToInt32(ratio * values[i]);
            values[0] += values[i];
        }
        return TweakedValues(values,arraySize,numClients);
    }
    protected int[] TweakedValues(int[] values, int arraySize, double numClients)
    {
        int vmax = 0;
        int imax = 0;
        int n = Convert.ToInt32(numClients);

        for (int i=1 ; i< arraySize; i++)
        {
            if (values[i] > vmax)
            {
                vmax = values[i];
                imax = i;
            }
        }

        if (values[0] != n)
        {
            int tweak = n - values[0];
            values[imax] += tweak;
            values[0] += tweak;
        }
        return values;
    }
    protected void vwGetUnscaledClientCareAndRefer()
    {
        int[] value;
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
            value = ScaledValues(1, 9, sqlRead, numCRClients);
            //TextBox38.Text = sqlRead[0].ToString();
            TextBox66.Text = value[0].ToString(); //caregiver
            TextBox39.Text = value[1].ToString();
            TextBox40.Text = value[2].ToString();
            TextBox41.Text = value[3].ToString();
            TextBox42.Text = value[4].ToString();
            TextBox43.Text = value[5].ToString();
            TextBox44.Text = value[6].ToString();
            TextBox45.Text = value[7].ToString();
            TextBox46.Text = value[8].ToString();
            TextBox47.Text = value[9].ToString();

            value = ScaledValues(10, 17, sqlRead, numCRClients);
            TextBox67.Text = value[0].ToString();//referrer
            TextBox48.Text = value[1].ToString();
            TextBox49.Text = value[2].ToString();
            TextBox50.Text = value[3].ToString();
            TextBox51.Text = value[4].ToString();
            TextBox52.Text = value[5].ToString();
            TextBox53.Text = value[6].ToString();
            TextBox54.Text = value[7].ToString();
            TextBox55.Text = value[8].ToString();
        }
        sqlRead.Close();
    }
    protected void vwGetDxCounts()
    {
        int[] value;
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
            value = ScaledValues(1, 6, sqlRead, numCRClients);
            TextBox72.Text = value[0].ToString(); //dxs
            TextBox57.Text = value[1].ToString();
            TextBox58.Text = value[2].ToString();
            TextBox59.Text = value[3].ToString();
            TextBox60.Text = value[4].ToString();
            TextBox61.Text = value[5].ToString();
            TextBox62.Text = value[6].ToString();
        }
        sqlRead.Close();
    }
}
