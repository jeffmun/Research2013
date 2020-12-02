<%@ Page Language="c#" Debug="true" MasterPageFile="../UWAC.master"
    CodeFile="NewCHDDReport.aspx.cs" AutoEventWireup="true" Inherits="NewCHDDReport" Title="Waitlist" %>

<%@ MasterType VirtualPath="../UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>

    <table>
        <tr >
            <td style="text-align: right"  >
                <asp:Label ID="Label3" runat="server" Text="Total Clients"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox8" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Total Visits"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                 ______________________<br />
                <br />


                <asp:Label ID="Label28" runat="server" Text="Age 0 to 3"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox29" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label29" runat="server" Text="Age 4 to 5"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox30" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label30" runat="server" Text="Age 6 to 9"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox31" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label31" runat="server" Text="Age 10 to 14"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox32" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label32" runat="server" Text="Age 15 to 19"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox33" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label33" runat="server" Text="Age 20 to 24"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox34" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label34" runat="server" Text="Age 25 to 29"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox35" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label35" runat="server" Text="Age 30 to 54"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox36" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label36" runat="server" Text="Age 55+"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox37" runat="server"></asp:TextBox>
                
                <br />
                <br />______________________<br />
                <asp:Label ID="Label20" runat="server" Text="Ethnicity Native Amer."></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox21" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label21" runat="server" Text="Ethnicity Asian"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox22" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label22" runat="server" Text="Ethnicity Hispanic"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox23" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label23" runat="server" Text="Ethnicity Pacific Islander"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox24" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label24" runat="server" Text="Ethnicity Caucasian"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox25" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label25" runat="server" Text="Ethnicity African Amer."></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox26" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="Label26" runat="server" Text="Ethnicity Unknown"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox27" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label27" runat="server" Text="Ethnicity Other"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox28" runat="server"></asp:TextBox>
                <br />
            </td>
            <td style="text-align: right" >
                <asp:Label ID="Label18" runat="server" Text="Male"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox18" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label19" runat="server" Text="Female"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox19" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label38" runat="server" Text="Other"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox20" runat="server"></asp:TextBox>
                <br />
                
                <br />______________________<br />
                <asp:Label ID="Label39" runat="server" Text="Caregiver Adoptive"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox39" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label40" runat="server" Text="Caregiver Biological"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox40" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label41" runat="server" Text="Caregiver Foster"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox41" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label42" runat="server" Text="Caregiver Grandparent"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox42" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label43" runat="server" Text="Caregiver Legal"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox43" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label44" runat="server" Text="Caregiver Other Relative"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox44" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label45" runat="server" Text="Caregiver Other"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox45" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label46" runat="server" Text="Caregiver None"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox46" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label47" runat="server" Text="Caregiver Null"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox47" runat="server"></asp:TextBox>
                <br />
               
                ______________________<br /> <br />


                <asp:Label ID="Label48" runat="server" Text="Referrer PCP"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox48" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label49" runat="server" Text="Referrer Self"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox49" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label50" runat="server" Text="Referrer Hospital"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox50" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label51" runat="server" Text="Referrer Phys. Specialist"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox51" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label52" runat="server" Text="Referrer PHA"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox52" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label53" runat="server" Text="Referrer School"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox53" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label54" runat="server" Text="Referrer OHP"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox54" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label55" runat="server" Text="Referrer Unk."></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox55" runat="server"></asp:TextBox>
                <br />

            </td>
            <td style="text-align: right" >
                <asp:Label ID="Label4" runat="server" Text="Visit Purpose: Dx"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Visit Purpose: Re-Eval"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Visit Purpose: Treatment"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox4" runat="server"></asp:TextBox>
                
                <br />______________________<br />


                <asp:Label ID="Label7" runat="server" Text="Visit Disc.: Psych"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox5" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label8" runat="server" Text="Visit Disc.: SLP"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox6" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Visit Disc.: ABA"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox7" runat="server"></asp:TextBox>
                
                <br />______________________<br />

                <asp:Label ID="Label11" runat="server" Text="Payor: Commercial"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox11" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label12" runat="server" Text="Payor: Medicaid"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox12" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label13" runat="server" Text="Payor: Medicare"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox13" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label14" runat="server" Text="Payor: Other"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox14" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label15" runat="server" Text="Payor: Self"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox15" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label16" runat="server" Text="Payor: Tricare"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox16" runat="server"></asp:TextBox>
                
                <br />______________________<br />


                <asp:Label ID="Label9" runat="server" Text="Established disability"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox9" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label10" runat="server" Text="At-risk: Biological"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox10" runat="server"></asp:TextBox>
                
              <br />______________________<br />
                <asp:Label ID="Label57" runat="server" Text="ADD Or ADHD"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox57" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label58" runat="server" Text="Autism Or PDD"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox58" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label59" runat="server" Text="Commun. Disorder"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox59" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label60" runat="server" Text="Intellectual Disability"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox60" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label61" runat="server" Text="Other"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox61" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label62" runat="server" Text="Soc/Emot/Behav. Disorder"></asp:Label>
                &nbsp;<asp:TextBox width="40" ID="TextBox62" runat="server"></asp:TextBox>

            </td>
        </tr>
    </table>
    <asp:Label ID="Label17" runat="server" Text="clients" Visible="false"></asp:Label>
    &nbsp;<asp:TextBox width="40" ID="TextBox17" runat="server" Visible="false"></asp:TextBox>
    <br />

    <asp:Label ID="Label37" runat="server" Text="Clients" Visible="false"></asp:Label>
    &nbsp;<asp:TextBox width="40" ID="TextBox38" runat="server" Visible="false"></asp:TextBox>
    <br />

    <asp:Label ID="Label56" runat="server" Text="Diagnoses" Visible="false"></asp:Label>
    &nbsp;<asp:TextBox width="40" ID="TextBox56" runat="server" Visible="false"></asp:TextBox>
    <br />

</asp:Content>

