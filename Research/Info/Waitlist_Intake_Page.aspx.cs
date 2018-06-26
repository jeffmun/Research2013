using System;
using System.Drawing;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

/* TODO:  
 * 1) 
 */

public partial class Info_Waitlist_Intake_Page : System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();
    //private SqlConnection oConnData = new SqlConnection();
    private ReadConfig oConfig = new ReadConfig();

    protected void Page_Load(object sender, EventArgs e)
    {
        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["waitlistConnectionString"].ConnectionString;
        oConn.Open();

        if (!IsPostBack)
        {
            populate_DropDownList1(0);
        }
    }

    protected void populate_intake_page(int ID)
    {
        SqlCommand sqlCmd = new SqlCommand();
        SqlDataReader sqlRead;
        sqlCmd.Connection = oConn;
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.CommandText = "SELECT " +

        #region Read Query
            "b.ContactDate, " +                        //0
            "b.FName, " +                              //1
            "b.LName, " +                              //2
            "b.GuardianLN, " +                         //3
            "b.GuardianFN, " +                         //4
            "b.Relationship, " +                       //5
            "b.Phone, " +                              //6
            "b.[Phone 2], " +                          //7
            "b.[Phone 3], " +                          //8
            "b.PCP, " +                                //9
            "b.[Add], " +                              //10
            "b.City, " +                               //11
            "b.State, " +                              //12
            "b.Zip, " +                                //13
            "convert(varchar, b.DOB , 101),  " +       //14
            "b.Age,  " +                               //15
            "b.Gender,  " +                            //16
            "b.Ins,  " +                               //17
            "b.Facility,  " +                          //18
            "e.DX, " +                                 //19
            "e.DXBy, " +                               //20
            "e.Position,  " +                          //21
            "e.RefSource, " +                          //22
            "e.RefPosition, " +                        //23
            "i.SvcReq, " +                             //24
            "i.SvcReq2, " +                            //25
            "i.SvcReq3,  " +                           //26
            "c.[Initial Comment],  " +                 //27
            "c.[Final Comment],  " +                   //28
            "g.Staff,  " +                             //29
            "g.Site,  " +                              //30
            "convert(varchar, g.Mailed , 101), " +     //31
            "convert(varchar, g.InfoRtn , 101), " +    //32
            "e.DX2,  " +                               //33
            "e.DX3, " +                                //34
            "b.SecondaryIns,  " +                      //35
            "g.CType  " +                              //36
            
            "FROM Clients b LEFT OUTER JOIN " +
            "Intakes g ON g.ClientID = b.ClientID LEFT OUTER JOIN " +
            "DXs e ON e.ClientID = b.ClientID LEFT OUTER JOIN " +
            "UWACServices i ON i.ClientID = b.ClientID LEFT OUTER JOIN " +
            "Comments c ON c.ClientID = b.ClientID  " +
        #endregion

        "WHERE b.ClientID = @Client_ID";
        sqlCmd.Parameters.Add(new SqlParameter("@Client_ID", ID));
        sqlRead = sqlCmd.ExecuteReader();
        if (sqlRead.Read())
        {
            #region Populate Text Boxes
            TextBox1.Text = sqlRead[0].ToString();
            TextBox2.Text = sqlRead[10].ToString();
            TextBox3.Text = sqlRead[1].ToString() + " "+ sqlRead[2].ToString();
            TextBox4.Text = sqlRead[11].ToString();
            TextBox5.Text = sqlRead[3].ToString() + " " + sqlRead[4].ToString();
            TextBox6.Text = sqlRead[12].ToString();
            TextBoxZip.Text = sqlRead[13].ToString();
            TextBox7.Text = sqlRead[5].ToString();
            TextBox8.Text = sqlRead[14].ToString();
            TextBox9.Text = sqlRead[6].ToString();
            TextBox10.Text = sqlRead[15].ToString();
            TextBox11.Text = sqlRead[7].ToString();
            TextBox12.Text = sqlRead[16].ToString();
            TextBox13.Text = sqlRead[8].ToString();
            TextBox14.Text = sqlRead[17].ToString();
            TextBox15.Text = sqlRead[9].ToString();
            TextBox16.Text = sqlRead[18].ToString();
            TextBox17.Text = sqlRead[19].ToString();
            TextBox18.Text = sqlRead[22].ToString();
            TextBox19.Text = sqlRead[20].ToString();
            TextBox20.Text = sqlRead[23].ToString();
            TextBox21.Text = sqlRead[21].ToString();
            TextBox22.Text = sqlRead[24].ToString();
            TextBox23.Text = sqlRead[25].ToString();
            TextBox24.Text = sqlRead[26].ToString();
            TextBox25.Text = sqlRead[27].ToString();
            TextBox26.Text = sqlRead[28].ToString();
            TextBox27.Text = sqlRead[29].ToString();
            TextBox28.Text = sqlRead[33].ToString();
            TextBox29.Text = sqlRead[30].ToString();
            TextBox30.Text = sqlRead[34].ToString();
            TextBox31.Text = sqlRead[31].ToString();
            TextBox32.Text = sqlRead[35].ToString();
            TextBox33.Text = sqlRead[32].ToString();
            TextBox34.Text = sqlRead[36].ToString();        
            #endregion
        }
        sqlRead.Close();
    }

    protected void populate_DropDownList1(int index)
    {
        SqlCommand sqlCmd2 = new SqlCommand();
        sqlCmd2.Connection = oConn;
        sqlCmd2.CommandType = System.Data.CommandType.Text;

        sqlCmd2.CommandText =
            "SELECT a.ClientID, a.Archive, a.Name " +
            "FROM ( " +
            "   SELECT ClientID, Archive, (LName + ', '+ FName) "+
            "   AS Name from Clients " +
            ") a WHERE (a.Name <> '' AND a.Name <> ',')" +
            " AND a.Archive = 'False' " +
            "ORDER BY a.Name ";

        DataTable dt2 = new DataTable();
        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
        sqlAdapter2.Fill(dt2);

        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "ClientID";
        DropDownList1.DataSource = dt2;
        DropDownList1.DataBind();
        DropDownList1.SelectedIndex = index;
    }
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblInfo.Text = "";
        populate_intake_page(Convert.ToInt16(DropDownList1.SelectedValue));
    }
}
