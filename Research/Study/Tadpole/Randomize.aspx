<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Randomize.aspx.cs" AutoEventWireup="true" Inherits="Study_Tadpole_Randomize" 
    Title="Tadpole Randomization"   EnableEventValidation="false"   %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <br />

    <table>
        <tr>
            <td style="vertical-align:top">
    <asp:Label ID="lblTitle" runat="server" Text="Tadpole Randomization Algorithm" Font-Bold="true" Font-Underline="true" ></asp:Label>
    <br />
                    <asp:DropDownList ID="ddlPotSubj" runat="server"  DataTextField = "ID"
                        DataValueField = "subjID"    ></asp:DropDownList>
    <asp:Button ID="btnGetSubj" runat="server" Text="Load Subject" OnClick="btnGetSubj_Click" Font-Size="XX-Small" />

            </td>

            <td width="50px"></td>
            <td style="vertical-align:top"> 
                <asp:Label ID="Label7" runat="server" Text="Current Distribution from the DB" Font-Underline="true" Font-Size="X-Small"></asp:Label>
                <br />
                <asp:Panel ID="panelCurrentDB" runat="server"></asp:Panel>
            </td>
            <td width="15px"></td>
            <td style="vertical-align:top"> 

                <table>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblNs" runat="server" Text="N's of the various strata by Site (# in ABCD)" Font-Underline="true" Font-Size="X-Small"></asp:Label>
                            <br />
                            <asp:GridView ID="gvNs_Strata" runat="server" OnRowDataBound="gvNs_Strata_RowDataBound"></asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top"> 
                            <asp:Label ID="Label4" runat="server" Text="N's by Sex & Site & Group" Font-Underline="true" Font-Size="X-Small"></asp:Label>
                            <br />
                            <asp:GridView ID="gvSexSiteGroup" runat="server" OnRowDataBound="gvSexSiteGroup_RowDataBound" ></asp:GridView>
                        </td>
                        <td width="15px"></td>
                        <td style="vertical-align:top"> 
                            <asp:Label ID="Label3" runat="server" Text="N's by Site & Group" Font-Underline="true" Font-Size="X-Small"></asp:Label>
                            <br />
                            <asp:GridView ID="gvSiteGroup" runat="server" OnRowDataBound="gvSiteGroup_RowDataBound" ></asp:GridView>
                        </td>


                    </tr>
                </table>

            </td>            
            
            <td width="15px"></td>
            <td style="vertical-align:top"> 
                <asp:Label ID="Label5" runat="server" Text="Mean(SD) Age by Site & Group" Font-Underline="true" Font-Size="X-Small"></asp:Label>
                <br />
                <asp:GridView ID="gvMeanAge" runat="server" OnRowDataBound="gvSiteGroup_RowDataBound" ></asp:GridView>
            </td>
            <td width="15px"></td>
            <td style="vertical-align:top"> 
                <asp:Label ID="Label6" runat="server" Text="Mean(SD) DQ by Site & Group" Font-Underline="true" Font-Size="X-Small"></asp:Label>
                <br />
                <asp:GridView ID="gvMeanDQ" runat="server" OnRowDataBound="gvSiteGroup_RowDataBound" ></asp:GridView>
            </td>
        </tr>
    </table>

    <br />
    <br />
    <asp:Panel ID="panel0" runat="server" Visible="false">


    <table>
        <tr>
            <td>
                <asp:Label ID="l1" runat="server" Text="Current Distribution (in table)" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>
            </td>
            <td width="50px"></td>
            <td align="left">
                <asp:Label ID="l2" runat="server" Text="Current Imbalance" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>
            </td>
            <td width="50px"></td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="New subject profile" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>
            </td>
            <td width="50px"></td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Decision Functions" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>
            </td>

        </tr>
                <tr>
            <td style="vertical-align:top">
                    <asp:Panel ID="panel1" runat="server"></asp:Panel>
            </td>
            <td width="50px"></td>
            <td style="vertical-align:top">
                    <asp:Panel ID="panel2" runat="server"></asp:Panel>
            </td>
            <td width="50px"></td>
            <td  style="vertical-align:top">

                <asp:HiddenField ID="hidsubjID" runat="server" Value="-1" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblID" runat="server" Font-Size="Large"></asp:Label>
                <br />
                <table>
                    <tr height="40px">
                        <td>
                            <asp:Label ID="lblAge" runat="server"></asp:Label>
                        </td><td><asp:TextBox ID="txtAge" runat="server" Width="40px"></asp:TextBox></td>
                    </tr>
                    <tr height="40px">
                        <td><asp:Label ID="lblDQ" runat="server"></asp:Label></td><td><asp:TextBox ID="txtDQ" runat="server"  Width="40px"></asp:TextBox></td>
                    </tr>
                    <tr height="40px">
                        <td><asp:Label ID="lblGender" runat="server"></asp:Label></td><td><asp:TextBox ID="txtGender" runat="server" Width="40px"></asp:TextBox></td>
                    </tr>
                    <tr height="40px">
                        <td><asp:Label ID="lblUW" runat="server"></asp:Label></td><td><asp:TextBox ID="txtUW" runat="server" Width="40px"></asp:TextBox></td>
                    </tr>
                    <tr height="40px">
                        <td><asp:Label ID="lblUCD" runat="server"></asp:Label></td><td><asp:TextBox ID="txtUCD" runat="server" Width="40px"></asp:TextBox></td>
                    </tr>
                    <tr height="40px">
                        <td></td><td><asp:TextBox ID="txtTOT" runat="server" Text="1" Width="30px"  Visible="false"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblManualSubmit" runat="server" Text="Click here to submit profile after manual edits." Font-Size="XX-Small"></asp:Label>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit this profile for randomization" OnClick="btnSubmit_Click"  Visible="true"/>
                <br />
                <br />
                <asp:Label ID="lblAddSub" runat="server" Text="Add/Subtract this profile to current distribution table" OnClick="btnAdd_Click"  Visible="true"/>
                <br />
                <asp:DropDownList ID="ddlGRP" runat="server" >
                    <asp:ListItem Value="--Select group--" ></asp:ListItem>
                    <asp:ListItem Value="A"></asp:ListItem>
                    <asp:ListItem Value="B"></asp:ListItem>
                    <asp:ListItem Value="C"></asp:ListItem>
                    <asp:ListItem Value="D"></asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"  Visible="true" Font-Size="XX-Small"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSubtract" runat="server" Text="Subtract" OnClick="btnSubtract_Click"  Visible="true"  Font-Size="XX-Small"/>
                <br />
                 <asp:Label ID="lblInfo" runat="server" Text="" Forecolor="Red"></asp:Label>
                

            </td>
            <td width="50px"></td>
            <td style="vertical-align:top">
                    <asp:Panel ID="panel3" runat="server"></asp:Panel>
            </td>

        </tr>

    </table>

    <br />
    <br />

    <table>
        <tr>
            <td>
                <asp:Panel ID="panel4a" runat="server"></asp:Panel>
            </td>
            <td width="30px"></td>
            <td>
                <asp:Panel ID="panel4b" runat="server"></asp:Panel>
            </td>
            <td width="30px"></td>
                        <td>
                <asp:Panel ID="panel4c" runat="server"></asp:Panel>
            </td>
            <td width="30px"></td>
                        <td>
                <asp:Panel ID="panel4d" runat="server"></asp:Panel>
            </td>


        </tr>
    </table>

            </asp:Panel>


</asp:Content>



