<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master"
    CodeFile=" waitlist_Intake_Page.aspx.cs" AutoEventWireup="true" Inherits="Info_Waitlist_Intake_Page" Title=" waitlist" %>

<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
          
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:waitlistConnectionString %>"> </asp:SqlDataSource>

        <br />
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" EnableViewState="true"   ChildrenAsTriggers="true">
        <ContentTemplate>
              <h1>
        <asp:Label ID="LabelTitle" runat="server"
            Text="University of Washington Autism Center Initial Intake Form">
        </asp:Label>
    </h1>  
             <h3>
                      <br/><hr /><br/>
        <%-- demographics --%>
    <table style="vertical-align: top; width: 100%; text-align: right">
        <tr>
            <td>               
                <asp:Label ID="Label1" runat="server" Text="Contact Date"></asp:Label>
                
                &nbsp;<asp:TextBox ID="TextBox1" runat="server"  width ="300px" height="30px" ></asp:TextBox>
                <br />
            </td>

            

            <td>                
                <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox2" runat="server" width ="300px" height="30px" ></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label3" runat="server" Text="Child's Name"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" width ="300px" height="30px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  DataTextField="FName" DataValueField="ClientID"></asp:DropDownList>
  
                &nbsp;<asp:TextBox ID="TextBox3" runat="server" visible ="False"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox4" runat="server" width ="300px" height="30px" ></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label5" runat="server" Text="Guardian"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox5" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label6" runat="server" Text="State"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox6" runat="server" width ="130px" height="30px"></asp:TextBox>

                <asp:Label ID="LabelZip" runat="server" Text="Zip"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBoxZip" runat="server" width ="130px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label7" runat="server" Text="Relationship"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox7" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label8" runat="server" Text="DOB"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox8" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label9" runat="server" Text="Home Phone"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox9" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label10" runat="server" Text="Age"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox10" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label11" runat="server" Text=" work Phone"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox11" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label12" runat="server" Text="Gender"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox12" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label13" runat="server" Text="Cell Phone"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox13" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label14" runat="server" Text="Insurance"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox14" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label15" runat="server" Text="PCP"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox15" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label16" runat="server" Text="PCP Facility"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox16" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>

    </table>

    <br/><hr /><br/>
        <%-- diagnoses--%>
    <table style="vertical-align: top; width: 100%; text-align: right"> 
        <tr>
            <td>               
                <asp:Label ID="Label17" runat="server" Text="Diagnosis"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox17" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label18" runat="server" Text="Referred By"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox18" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label19" runat="server" Text="Diagnosis By"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox19" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label20" runat="server" Text="Referral Position"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox20" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label21" runat="server" Text="Diagnostician's Position"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox21" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                

            </td>
        </tr>

    </table>

    <br/><hr /><br/>
    <%-- services required --%>
    <table style="vertical-align: top; width: 100%; text-align: right"> 
        <tr>
            <td>               
                <asp:Label ID="Label22" runat="server" Text="Service Required"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox22" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label23" runat="server" Text="Other Service"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox23" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label24" runat="server" Text="Other Service"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox24" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>       
    </table>

    <br/><hr /><br/>
    
        <%-- comments --%>
    <table style="vertical-align: top; width: 100%; text-align: right">
            <tr>
            <td>               
                <asp:Label ID="Label25" runat="server" Text="Comments"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox25" runat="server" Wrap="True" Rows="100" TextMode="multiline" Height="300px" Width="500px"></asp:TextBox>
                    <br />
            </td>
            <td>                
                <asp:Label ID="Label26" runat="server" Text="Clinician's Comments"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox26" runat="server" Wrap="True" Rows="100" TextMode="multiline" Height="300px" Width="500px"></asp:TextBox>
        <br />
            </td>
        </tr>
    </table>

    <br/><hr /><br/>

        <%-- intake other --%>
    <table style="vertical-align: top; width: 100%; text-align: right">
        <tr>
            <td>               
                <asp:Label ID="Label27" runat="server" Text="Intake Staff"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox27" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label28" runat="server" Text="Diagnosis 2"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox28" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label29" runat="server" Text="Site Requested"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox29" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label30" runat="server" Text="Diagnosis 3"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox30" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label31" runat="server" Text="Packet Mailed"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox31" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label32" runat="server" Text="Secondary Insurance"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox32" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>               
                <asp:Label ID="Label33" runat="server" Text="Client Info Returned"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox33" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
            <td>                
                <asp:Label ID="Label34" runat="server" Text="Chart Status"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox34" runat="server" width ="300px" height="30px"></asp:TextBox>
                <br />
            </td>
        </tr>
        </table>
                     
                    </h3>


  
   
        </ContentTemplate>

        <Triggers>
            

            <asp:PostBackTrigger ControlID="DropDownList1"   />
            


        </Triggers>
    </asp:UpdatePanel>



    </asp:Content>

