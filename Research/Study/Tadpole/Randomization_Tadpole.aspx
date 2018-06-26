<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Randomization_Tadpole.aspx.cs" AutoEventWireup="true" Inherits="Study_Tadpole_Randomization_Tadpole"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        //For navigating using left and right arrow of the keyboard
        var gridview = $("#gv_Randomization_Tadpole");
        $.keynavigation(gridview);
    });
</script>





<br />
<br />    
<asp:Label ID="Label1" runat="server" Text="Tadpole TxGroup Descriptives Table" Font-Bold="true" Font-Size="Medium"></asp:Label>
<br />
    <asp:Panel ID="Panel_info" runat="server"></asp:Panel>
<br />    
<asp:Label ID="lblError" runat="server" Text="" Font-Bold="false" Font-Size="Medium" ForeColor="DarkRed"></asp:Label>

<table>
<tr>
<td style="vertical-align:top" align="center" Width="500px"><asp:Panel ID="Panel_Cross" runat="server" ></asp:Panel><br /></td>
<td style="vertical-align:top" align="center" Width="500px"><asp:Panel ID="Panel_Cross2" runat="server" ></asp:Panel><br /></td>
</tr>
<tr>
<td style="vertical-align:top" Width="500px"><asp:Panel ID="Panel_Sites" runat="server" ></asp:Panel></td>
<td style="vertical-align:top"><asp:Panel ID="Panel_Groups" runat="server" ></asp:Panel></td>
</tr>
<tr><td><br /></td></tr>

<tr>
<td style="vertical-align:top" Width="500px"><asp:Panel ID="Panel3a" runat="server" ></asp:Panel></td>
<td style="vertical-align:top"><asp:Panel ID="Panel3b" runat="server" ></asp:Panel></td>
</tr>


</table>

<br /><br />    
 
    <asp:Button ID="btnDownload_file" runat="server" Text="Download Tab-Delim Data File" OnClick="GetTabDelimData"/>

    <br />
    <br />


    <asp:UpdatePanel ID="UpdatePanel_insert" runat="server" Visible="true" UpdateMode="Conditional">
    <ContentTemplate>
       <asp:Button ID="btnShowInsertForm" runat="server" Text="Add Subject" OnClick="ShowInsertForm" Visible="false" />

    <br />
    <br />

    <asp:FormView ID="fv_NewRecord" runat="server" DefaultMode="Insert" Visible="false">
<%--    <HeaderTemplate>
    <table><tr>
    <td align="left"><asp:Label ID="fvLabel1" runat="server" Text="ID" Width="100px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel3" runat="server" Text="Site" Width="80px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel4" runat="server" Text="Sex" Width="80px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel5" runat="server" Text="Time1a_agemos" Width="150px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel6" runat="server" Text="FullScaleDQ" Width="150px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel7" runat="server" Text="Time1a_date" Width="150px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel8" runat="server" Text="Assignment_date" Width="150px"></asp:Label></td>
    <td align="left"><asp:Label ID="fvLabel9" runat="server" Text="Notes" Width="250px"></asp:Label></td>

    </tr></table>
    </HeaderTemplate>--%>
    
    <InsertItemTemplate>
    <table ><tr>
    
    <td style="vertical-align:top">ID:<br /><asp:TextBox ID="txtID" runat="server" Text=""  Width="100px"></asp:TextBox> </td>
<%--    <td>     <asp:TextBox ID="fvTextBox2" runat="server" Text=""  Width="50px"></asp:TextBox> </td>--%>

       <td style="vertical-align:top"  >Site:<br /><asp:DropDownList ID="ddlSite" runat="server"  Width="80px" >
            <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
            <asp:ListItem Text="MIND" Value="MIND"></asp:ListItem>
            <asp:ListItem Text="UW" Value="UW"></asp:ListItem>
            <asp:ListItem Text="VU" Value="VU"></asp:ListItem>
        </asp:DropDownList>
        <br />
                         <asp:RegularExpressionValidator ID="RegExp1" runat="server" ControlToValidate="ddlSite" ValidationExpression= "MIND|UW|VU" 
            ErrorMessage="Must be MIND, UW, or VU." ></asp:RegularExpressionValidator>
        </td>
       <td style="vertical-align:top">Sex:<br /><asp:DropDownList ID="ddlSex" runat="server"  Width="80px">
            <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
            <asp:ListItem Text="M" Value="M"></asp:ListItem>
            <asp:ListItem Text="F" Value="F"></asp:ListItem>
        </asp:DropDownList><br />
            <asp:RegularExpressionValidator ID="RegEx2" runat="server" ControlToValidate="ddlSex" ValidationExpression= "[M|F]" 
            ErrorMessage="Must be M or F."  ></asp:RegularExpressionValidator>
        </td>

    <td style="vertical-align:top">Time1a_agemos:<br /><asp:TextBox ID="txtTime1a_agemos"   runat="server" Text=""  Width="150px"></asp:TextBox> </td>
    <td style="vertical-align:top">FullScaleDQ:<br /><asp:TextBox ID="txtFullScaleDQ"     runat="server" Text=""  Width="150px"></asp:TextBox> </td>
    <td style="vertical-align:top">Time1a_date:<br /><asp:TextBox ID="txtTime1a_date"     runat="server" Text=""  Width="150px"></asp:TextBox> <br />
        <asp:CompareValidator   id="val_txtTime1a_date" runat="server"  Type="Date"  Operator="DataTypeCheck"   ControlToValidate="txtTime1a_date" 
             ErrorMessage="Please enter a valid date." Width="150px">  </asp:CompareValidator></td>
    <td style="vertical-align:top">Assignment_date:<br /><asp:TextBox ID="txtAssignment_date" runat="server" Text=""  Width="150px"></asp:TextBox> <br />
        <asp:CompareValidator   id="val_txtAssignment_date" runat="server"  Type="Date"  Operator="DataTypeCheck"   ControlToValidate="txtAssignment_date" 
             ErrorMessage="Please enter a valid date." Width="150px">  </asp:CompareValidator></td>
    <td style="vertical-align:top">Notes:<br /><asp:TextBox ID="txtNotes"           runat="server" Text=""  Width="250px"></asp:TextBox> </td>
    </tr>
    </table>             
    </InsertItemTemplate>

    </asp:FormView>
<br />
<asp:Button ID="btn_InsertRecord" runat="server" Text="Submit New Subject" OnClick="InsertRecord_Submit" Visible="false" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btn_InsertRecord_Cancel" runat="server" Text="Cancel" ForeColor="Red" OnClick="InsertRecord_Cancel" Visible="false" />

<br />
    </ContentTemplate>
    <Triggers>
     <asp:AsyncPostBackTrigger ControlID="btnShowInsertForm" EventName="Click" />
     <asp:PostBackTrigger ControlID="btn_InsertRecord" />
     <asp:PostBackTrigger ControlID="btn_InsertRecord_Cancel" />
     </Triggers>
    </asp:UpdatePanel>


    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>

<br /><br />

    <table>
        <tr>
            <td style="vertical-align:top">
        <asp:Panel ID="Panel_Details" runat="server"></asp:Panel>
            </td>
            <td width="50px"></td>
            <td style="vertical-align:top">
        <asp:Panel ID="Panel_Details2" runat="server"></asp:Panel>

            </td>
        </tr>
    </table>

<%-- FOR BINDING THE DDL
            <asp:DropDownList ID="ddlitm_FieldCodeID" runat="server" DataSourceID="sql_FieldCodes_for_DDL" DataTextField="fieldcode" DataValueField="fieldcodeID" 
                   SelectedValue = '<%# DataBinder.Eval(Container.DataItem, "fieldcodeID") %>'  ></asp:DropDownList>
--%>


<%--    <asp:GridView ID="gv_tbl_Randomization_Tadpole" runat="server" Visible="false" DataSourceID="sql_tbl_Randomization_Tadpole" 
    AutoGenerateColumns="false" AutoGenerateEditButton="true" DataKeyNames="ID"
     OnRowUpdated="gv_tbl_Randomization_Tadpole_RowUpdated" OnRowDeleted="gv_tbl_Randomization_Tadpole_RowDeleted"   >
   <EditRowStyle BackColor="Yellow" /> 
    <Columns>

    <asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_ID" runat="server" Text="ID" Width="100px"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Width="100px"/></ItemTemplate>
        <EditItemTemplate><asp:Label ID="ID" runat="server" Text='<%# Bind(Container.DataItem, "ID") %>'/></EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_TxGroup" runat="server" Text="TxGroup"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="TxGroup" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TxGroup") %>'  Width="100px"/></ItemTemplate>
        <EditItemTemplate><asp:Label ID="TxGroup" runat="server" Text='<%# Bind(Container.DataItem, "TxGroup") %>'/></EditItemTemplate>
    </asp:TemplateField  >


            <asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_Txgrp" runat="server" Text="Tadpole_TX group"  ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Tadpole_TX_group" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tadpole_TX_group") %>' ForeColor="blue" Font-Bold="false"/></ItemTemplate>
    </asp:TemplateField>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_Txgrp" runat="server" Text="Subject status"  ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Tadpole_TX_subjstatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tadpole_TX_subjstatus") %>' ForeColor="blue" Font-Bold="false"/></ItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField ControlStyle-Width="70px" ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_Site" runat="server" Text="Site"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Site" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Site") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="Site" runat="server" Text='<%# Bind(Container.DataItem, "Site") %>'/>
        <br />
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Site" ValidationExpression= "MIND|UW|VU" 
            ErrorMessage="Must be MIND, UW, or VU."></asp:RegularExpressionValidator>
           
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField ControlStyle-Width="60px" ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_Sex" runat="server" Text="Sex"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Sex" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sex") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="Sex" runat="server" Text='<%# Bind(Container.DataItem, "Sex") %>'/>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Sex" ValidationExpression= "M|F" 
            ErrorMessage="Must be M or F."></asp:RegularExpressionValidator>
        </EditItemTemplate>
    </asp:TemplateField>


            <asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_DBsex" runat="server" Text="Sex (in DB)"  ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="DBsex" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DBsex") %>' ForeColor="blue" Font-Bold="false"/></ItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Status" runat="server" Text="Status"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Status" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status") %>'/></ItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Time1a_agemos" runat="server" Text="Time1a agemos"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Time1a_agemos" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Time1a_agemos") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="Time1a_agemos" runat="server" Text='<%# Bind(Container.DataItem, "Time1a_agemos") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_FullScaleDQ" runat="server" Text="FullScaleDQ"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="FullScaleDQ" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FullScaleDQ") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="FullScaleDQ" runat="server" Text='<%# Bind(Container.DataItem, "FullScaleDQ") %>' Width= "70px"/></EditItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_IQdiff" runat="server" Text="IQ Difference"  ForeColor="Red"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="IQdiff" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IQdiff") %>' ForeColor="Red" Font-Bold="true"/></ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_T1MullDQ" runat="server" Text="T1 Mullen<br/>Comp DQ"  ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Hyperlink ID="T1MullIQ" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "link") %>' Text='<%# DataBinder.Eval(Container.DataItem, "mucoiq") %>' Font-Bold="true" ForeColor="blue"/></ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_T1MullSS" runat="server" Text="T1 Mullen<br/>Comp SS" ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="T1MullSS" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "mucss") %>' ForeColor="blue"/></ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_T1MullAge" runat="server" Text="T1 Mullen<br/>Age (mos)" ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="T1MullAge" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "muagem") %>' ForeColor="blue"/></ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_T1MullAge" runat="server" Text="T1 Mullen<br/>Date" ForeColor="blue"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="T1MullDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "mudate") %>' ForeColor="blue"/></ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField   ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="hdrlbl_T1DaysDiff" runat="server" Text="Days<br/>Difference" ForeColor="darkred"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="daysdiff" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "daysdiff") %>' ForeColor="darkred"/></ItemTemplate>
    </asp:TemplateField>


    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Time1a_date" runat="server" Text="Time1a_date"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Time1a_date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Time1a_date") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="Time1a_date" runat="server" Text='<%# Bind(Container.DataItem, "Time1a_date") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Assignment_date" runat="server" Text="Assignment_date"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="Assignment_date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assignment_date") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="Assignment_date" runat="server" Text='<%# Bind(Container.DataItem, "Assignment_date") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_notes" runat="server" Text="notes"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="notes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "notes") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="notes" runat="server" Text='<%# Bind(Container.DataItem, "notes") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField ControlStyle-CssClass="gvGray">       <HeaderTemplate><asp:Label ID="hdrlbl_updated" runat="server" Text="updated"  CssClass="gvGray"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="updated" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updated") %>'/></ItemTemplate>
        <EditItemTemplate><asp:Label ID="updated" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updated") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField ControlStyle-CssClass="gvGray">       <HeaderTemplate><asp:Label ID="hdrlbl_updatedBy" runat="server" Text="updatedBy" CssClass="gvGray"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="updatedBy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updatedBy") %>'/></ItemTemplate>
        <EditItemTemplate><asp:Label ID="updatedBy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updatedBy") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:CommandField  ShowDeleteButton="true" />

    
    </Columns>
    </asp:GridView>
    

    



    <asp:SqlDataSource ID="sql_tbl_Randomization_Tadpole" runat="server" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"
     
    SelectCommandType="Text" SelectCommand="select * from vw_Randomization_Tadpole order by site, ID" 
    DeleteCommandType="Text" DeleteCommand="delete from tbl_Randomization_Tadpole where ID=@ID"
     UpdateCommandType="Text" UpdateCommand="update tbl_Randomization_Tadpole set Assignment_date=@Assignment_date,
                 FullScaleDQ=@FullScaleDQ,
                 notes=@notes,
                 Sex=@Sex,
                 Site=@Site,
                 Time1a_agemos=@Time1a_agemos,
                 Time1a_date=@Time1a_date,
                 TxGroup=@TxGroup where ID=@ID"     >
     <UpdateParameters>
      <asp:Parameter Name="ID"  />
      <asp:Parameter Name="Assignment_date" />
      <asp:Parameter Name="FullScaleDQ" />
      <asp:Parameter Name="notes" />
      <asp:Parameter Name="Sex" />
      <asp:Parameter Name="Site" />
      <asp:Parameter Name="Time1a_agemos"/>
      <asp:Parameter Name="Time1a_date" />
      <asp:Parameter Name="TxGroup" />
    </UpdateParameters>
    <DeleteParameters>
          <asp:Parameter Name="ID"  />
    </DeleteParameters>
    </asp:SqlDataSource>
--%>

  

</asp:Content>