<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="netid_request.aspx.cs" Inherits="Info_netid_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">




    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text ="Apply for a UW Sponsored NETID" Font-Bold="true" Font-Size="Small" /><br />
    <asp:Label ID="lbl1" runat="server" Text ="Please enter the following information.  This will enable us to submit an application for a sponsored UW NETID account." /><br />
    <asp:Label ID="lbl2" runat="server" Text ="Once this application is submitted you will be emailed additional information and we will immediately delete this infomation." /><br /><br />
    <asp:Label ID="Label2" runat="server" Text ="This is just the most secure way to accurately collect the information we need to submit the application." /><br /><br />
    <asp:Label ID="lbl3" runat="server" Text ="Call Jeff Munson office: 206-616-2378 or cell 425-478-0920 with questions." />

    <br />
    <br />
    <asp:Panel ID="panel_input" runat="server">
    <table>


        <tr>
            <td>ID type</td>
            <td>Issued by: State/Prov and/or Country</td>

        </tr>
        <tr>
            <td style="vertical-align:top">
                <asp:DropDownList ID="ddlIDtype" runat="server">
                    <asp:ListItem Value="Driver's License"></asp:ListItem>
                    <asp:ListItem Value="State ID"></asp:ListItem>
                    <asp:ListItem Value="Passport"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="txtIssuedBy" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server"
                  ControlToValidate="txtIDnumber"
                  ErrorMessage="Issued by is required."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>    
            </td>
        </tr>


        <tr>
            <td colspan="2">ID Number</td>

        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtIDnumber" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                  ControlToValidate="txtIDnumber"
                  ErrorMessage="ID number is required."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>            
            </td>
        </tr>


        
        <tr>
            <td colspan="2">ID Expiration Date (mm/dd/yyyy) 
                <%--<asp:RegularExpressionValidator runat="server" ControlToValidate="txtIDexpiredate" 
                    ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="Invalid date format."   />--%>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtIDexpiredate" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                  ControlToValidate="txtfirst"
                  ErrorMessage="Expiration date is required."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>            

            </td>
        </tr>
        </table>


    <table>
        
        <tr>
            <td >First name</td>
            <td >Middle name</td>
            <td >Last name</td>

        </tr>
        <tr>
            <td  style="vertical-align:top">
                <asp:TextBox ID="txtfirst" runat="server" Width="200"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                  ControlToValidate="txtfirst"
                  ErrorMessage="First name is required."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>
            </td>
            <td style="vertical-align:top" >
                <asp:TextBox ID="txtmiddle" runat="server" Width="200"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" Width ="200"
                  ControlToValidate="txtmiddle"
                  ErrorMessage="Middle name is required. Enter a space if you have no middle name."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>
            </td>
            <td  style="vertical-align:top">
                <asp:TextBox ID="txtlast" runat="server" Width="200"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                  ControlToValidate="txtlast"
                  ErrorMessage="Last name is required."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>

            </td>
        </tr>

        
        <tr>
            <td colspan="3">Date of Birth (mm/dd/yyyy)               
                <%-- <asp:RegularExpressionValidator runat="server" ControlToValidate="txtdob" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"
    ErrorMessage="Invalid date format."  />--%>

            </td>

        </tr>
        <tr>
            <td colspan="3">
                <asp:TextBox ID="txtdob" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                  ControlToValidate="txtdob"
                  ErrorMessage="DOB is required."
                  ForeColor="Red">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>

    <br />Current email address:
    <br />

        <asp:TextBox ID="txtemail" runat="server" Width ="200"></asp:TextBox><br />
        <asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server"
            ControlToValidate="txtdob"
            ErrorMessage="Current email address is required."
            ForeColor="Red">
        </asp:RequiredFieldValidator>

        
    <br />

    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </asp:Panel>

    <asp:Panel ID="panel_submitted" runat="server" Visible="false">

<asp:Panel ID="panel_ready" runat="server" Visible="false">

<h3>Register Your UW NetID</h3>
You are now eligible to register for a UW NetID. A UW NetID is required to access University of
Washington computing and networking resources.

<br />
        <h4>Registration Instructions</h4><br />
Note: You must register for a UW NetID within 60 days of submission.
<br />1. Direct your web browser to:
<a href="https://uwnetid.washington.edu/newid/?type=sponsored">https://uwnetid.washington.edu/newid/?type=sponsored</a>
<br />
<br />2. Choose the third option “I don't have a UW NetID (or I'm not sure)” and then use the
<br />following information to confirm your identity.
<br /><br />UW Registration ID: <b><i>see info in table below</i></b>
<br />Private Access Code: <b><i>see info in table below</i></b>
<br /><br /><b>Proper Use</b>
<br />You may not share your UW NetID password with anyone else. 
<br />When using your UW NetID you must follow the University of Washington's Ethics in
<br />Computer and Network Use policy, which can be found at: 
<br /><a href="http://www.washington.edu/itconnect/work/appropriate­use/"></a>
<br /><br />More information on UW NetIDs can be found at: 
<br /><a href="http://www.washington.edu/itconnect/security/uw­netids/about­uw­netids/">http://www.washington.edu/itconnect/security/uw­netids/about­uw­netids/ </a>
<br /><br />Need help? Call the UW­IT Service Center at 206­221­5000, Mon­Fri 8am­8pm, Sun 1pm­8pm
</asp:Panel>

        <asp:Panel ID="panel_notready" runat="server" Visible="false">

            <b>Once the application has been submitted, instructions for next steps will be placed on page 
            <br />and the "UW registration ID" and "Private Access Code" fields will be populated.
            <br />Try again later or contact Jeff with questions.</b>
        </asp:Panel>

        <br /><br />


        <asp:Label ID="lblVerify" runat="server" Text="The following info has been submitted.  Thanks!<br/><br/>"></asp:Label>
        


    </asp:Panel>


</asp:Content>

