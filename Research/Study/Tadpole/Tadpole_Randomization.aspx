<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Tadpole_Randomization.aspx.cs" AutoEventWireup="true" Inherits="Info_Tadpole_Randomization"  %>
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
<asp:Label ID="Label1" runat="server" Text="Tadpole Randomization Table" Font-Bold="true"></asp:Label>
<br />
<br />    

    
 
    <asp:UpdatePanel ID="UpdatePanel_insert" runat="server" Visible="true" UpdateMode="Conditional">
    <ContentTemplate>
       <asp:Button ID="btnShowInsertForm" runat="server" Text="Add Record" OnClick="ShowInsertForm" />

    <br />
    <br />

    <asp:FormView ID="fv_NewRecord" runat="server" DefaultMode="Insert" Visible="false">
    <HeaderTemplate>
    <table><tr>
    <td align="center"><asp:Label ID="fvLabel1" runat="server" Text="ID" Width="100px"></asp:Label></td>
<%--    <td align="center"><asp:Label ID="fvLabel2" runat="server" Text="TxGroup" Width="50px"></asp:Label></td>--%>
    <td align="center"><asp:Label ID="fvLabel3" runat="server" Text="Site" Width="80px"></asp:Label></td>
    <td align="center"><asp:Label ID="fvLabel4" runat="server" Text="Sex" Width="80px"></asp:Label></td>
    <td align="center"><asp:Label ID="fvLabel5" runat="server" Text="Time1a_agemos" Width="150px"></asp:Label></td>
    <td align="center"><asp:Label ID="fvLabel6" runat="server" Text="FullScaleDQ" Width="150px"></asp:Label></td>
    <td align="center"><asp:Label ID="fvLabel7" runat="server" Text="Time1a_date" Width="150px"></asp:Label></td>
    <td align="center"><asp:Label ID="fvLabel8" runat="server" Text="Assignment_date" Width="150px"></asp:Label></td>
    <td align="center"><asp:Label ID="fvLabel9" runat="server" Text="Notes" Width="250px"></asp:Label></td>

    </tr></table>
    </HeaderTemplate>
    
    <InsertItemTemplate>
    <table><tr>
    
    <td style="vertical-align:top">     <asp:TextBox ID="txtID" runat="server" Text=""  Width="100px"></asp:TextBox> </td>
<%--    <td>     <asp:TextBox ID="fvTextBox2" runat="server" Text=""  Width="50px"></asp:TextBox> </td>--%>

       <td style="vertical-align:top"> <asp:DropDownList ID="ddlSite" runat="server" >
            <asp:ListItem Text="..Site.." Value="..Site.." Selected="True"></asp:ListItem>
            <asp:ListItem Text="MIND" Value="MIND"></asp:ListItem>
            <asp:ListItem Text="UW" Value="UW"></asp:ListItem>
            <asp:ListItem Text="VU" Value="VU"></asp:ListItem>
        </asp:DropDownList></td>
       <td style="vertical-align:top"> <asp:DropDownList ID="ddlSex" runat="server">
            <asp:ListItem Text="..Sex.." Value="..Sex.." Selected="True"></asp:ListItem>
            <asp:ListItem Text="M" Value="M"></asp:ListItem>
            <asp:ListItem Text="F" Value="F"></asp:ListItem>
        </asp:DropDownList></td>

    <td style="vertical-align:top">     <asp:TextBox ID="txtTime1a_agemos"   runat="server" Text=""  Width="150px"></asp:TextBox> </td>
    <td style="vertical-align:top">     <asp:TextBox ID="txtFullScaleDQ"     runat="server" Text=""  Width="150px"></asp:TextBox> </td>
    <td style="vertical-align:top">     <asp:TextBox ID="txtTime1a_date"     runat="server" Text=""  Width="150px"></asp:TextBox> <br />
        <asp:CompareValidator   id="val_txtTime1a_date" runat="server"  Type="Date"  Operator="DataTypeCheck"   ControlToValidate="txtTime1a_date" 
             ErrorMessage="Please enter a valid date.">  </asp:CompareValidator></td>
    <td style="vertical-align:top">     <asp:TextBox ID="txtAssignment_date" runat="server" Text=""  Width="150px"></asp:TextBox> <br />
        <asp:CompareValidator   id="val_txtAssignment_date" runat="server"  Type="Date"  Operator="DataTypeCheck"   ControlToValidate="txtAssignment_date" 
             ErrorMessage="Please enter a valid date.">  </asp:CompareValidator></td>
    <td style="vertical-align:top">     <asp:TextBox ID="txtNotes"           runat="server" Text=""  Width="250px"></asp:TextBox> </td>
    </tr>
    </table>             
    </InsertItemTemplate>

    </asp:FormView>
<br />
<asp:Button ID="btn_InsertRecord" runat="server" Text="Submit New Record" OnClick="InsertRecord_Submit" Visible="false" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btn_InsertRecord_Cancel" runat="server" Text="Cancel" ForeColor="Red" OnClick="InsertRecord_Cancel" Visible="false" />

<br /><br /><br />
    </ContentTemplate>
    <Triggers>
     <asp:AsyncPostBackTrigger ControlID="btnShowInsertForm" EventName="Click" />
     <asp:PostBackTrigger ControlID="btn_InsertRecord" />
     <asp:PostBackTrigger ControlID="btn_InsertRecord_Cancel" />
     </Triggers>
    </asp:UpdatePanel>

<asp:Panel ID="Panel1" runat="server" >
</asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
    <Triggers></Triggers>
    </asp:UpdatePanel>


<br />
<br /><br /><br />


<%-- FOR BINDING THE DDL
            <asp:DropDownList ID="ddlitm_FieldCodeID" runat="server" DataSourceID="sql_FieldCodes_for_DDL" DataTextField="fieldcode" DataValueField="fieldcodeID" 
                   SelectedValue = '<%# DataBinder.Eval(Container.DataItem, "fieldcodeID") %>'  ></asp:DropDownList>
--%>

<%--
    <asp:GridView ID="gv_tbl_Randomization_Tadpole" runat="server" DataSourceID="sql_tbl_Randomization_Tadpole" 
    AutoGenerateColumns="false" AutoGenerateEditButton="true" DataKeyNames="ID" >
   <EditRowStyle BackColor="Yellow" /> 
    <Columns>


    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_ID" runat="server" Text="ID"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_TxGroup" runat="server" Text="TxGroup"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblTxGroup" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TxGroup") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_TxGroup" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TxGroup") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Site" runat="server" Text="Site"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblSite" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Site") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_Site" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Site") %>'/>
        
            <asp:DropDownList ID="ddlSite1" runat="server"  DataTextField='<%# DataBinder.Eval(Container.DataItem, "Site") %>' DataValueField='<%# DataBinder.Eval(Container.DataItem, "Site") %>'>
            <asp:ListItem Text="MIND" Value="MIND"></asp:ListItem>
            <asp:ListItem Text="UW" Value="UW"></asp:ListItem>
            <asp:ListItem Text="VU" Value="VU"></asp:ListItem>
        </asp:DropDownList>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Sex" runat="server" Text="Sex"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblSex" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sex") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_Sex" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sex") %>'/>
    <asp:DropDownList ID="ddlSex1" runat="server" DataSourceID="sqlSex"  SelectedValue='<%# Bind(Container.DataItem, "Sex") %>' >
        </asp:DropDownList>


        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Time1a_agemos" runat="server" Text="Time1a_agemos"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblTime1a_agemos" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Time1a_agemos") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_Time1a_agemos" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Time1a_agemos") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_FullScaleDQ" runat="server" Text="FullScaleDQ"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblFullScaleDQ" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FullScaleDQ") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_FullScaleDQ" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FullScaleDQ") %>' Width= "70px"/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Time1a_date" runat="server" Text="Time1a_date"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblTime1a_date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Time1a_date") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_Time1a_date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Time1a_date") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_Assignment_date" runat="server" Text="Assignment_date"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblAssignment_date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assignment_date") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_Assignment_date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assignment_date") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_notes" runat="server" Text="notes"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblnotes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "notes") %>'/></ItemTemplate>
        <EditItemTemplate><asp:TextBox ID="txt_notes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "notes") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField ControlStyle-CssClass="gvGray">       <HeaderTemplate><asp:Label ID="hdrlbl_updated" runat="server" Text="updated"  CssClass="gvGray"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblupdated" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updated") %>'/></ItemTemplate>
        <EditItemTemplate><asp:Label ID="txt_updated" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updated") %>'/></EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField ControlStyle-CssClass="gvGray">       <HeaderTemplate><asp:Label ID="hdrlbl_updatedBy" runat="server" Text="updatedBy" CssClass="gvGray"/></HeaderTemplate>
        <ItemTemplate><asp:Label ID="lblupdatedBy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updatedBy") %>'/></ItemTemplate>
        <EditItemTemplate><asp:Label ID="txt_updatedBy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "updatedBy") %>'/></EditItemTemplate>
    </asp:TemplateField>

    
    </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="sql_tbl_Randomization_Tadpole" runat="server" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"
     
    SelectCommandType="Text" SelectCommand="select * from vw_Randomization_Tadpole order by site, ID" 
     UpdateCommandType="Text" UpdateCommand="update tbl_Randomization_Tadpole set Assignment_date=@Assignment_date,
                 FullScaleDQ=@FullScaleDQ,
                 notes=@notes,
                 Sex=@Sex,
                 Site=@Site,
                 Time1a_agemos=@Time1a_agemos,
                 Time1a_date=@Time1a_date,
                 TxGroup=@TxGroup where ID=@ID"     >
     <UpdateParameters>
      <asp:ControlParameter Name="Assignment_date" ControlID="gv_tbl_Randomization_Tadpole$txt_Assignment_date" propertyName="Text" />
      <asp:ControlParameter Name="FullScaleDQ" ControlID="gv_tbl_Randomization_Tadpole$txt_FullScaleDQ" propertyName="Text" />
      <asp:ControlParameter Name="ID" ControlID="gv_tbl_Randomization_Tadpole$txt_ID" propertyName="Text" />
      <asp:ControlParameter Name="notes" ControlID="gv_tbl_Randomization_Tadpole$txt_notes" propertyName="Text" />
      <asp:ControlParameter Name="Sex" ControlID="gv_tbl_Randomization_Tadpole$txt_Sex" propertyName="Text" />
      <asp:ControlParameter Name="Site" ControlID="gv_tbl_Randomization_Tadpole$txt_Site" propertyName="Text" />
      <asp:ControlParameter Name="Time1a_agemos" ControlID="gv_tbl_Randomization_Tadpole$txt_Time1a_agemos" propertyName="Text" />
      <asp:ControlParameter Name="Time1a_date" ControlID="gv_tbl_Randomization_Tadpole$txt_Time1a_date" propertyName="Text" />
      <asp:ControlParameter Name="TxGroup" ControlID="gv_tbl_Randomization_Tadpole$txt_TxGroup" propertyName="Text" />
    </UpdateParameters>
    </asp:SqlDataSource>

--%>
     <asp:SqlDataSource ID="sqlSex" runat="server" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"
        SelectCommandType="Text" SelectCommand="select 'M' as Sex union select 'F'" ></asp:SqlDataSource>



</asp:Content>