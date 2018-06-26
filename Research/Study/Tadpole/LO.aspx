<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="LO.aspx.cs" Inherits="Study_Tadpole_LO" 
    Title="Tadpole Learning Opps" %>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <style type="text/css">
        lo_edit {
            color: rebeccapurple
        }
    </style>

    <br />
    <h3>Tadpole Learning Opportunities</h3>

    <table>
        <tr>
            <td style="vertical-align:top">
    <h4>Summary</h4>
    <asp:GridView ID="gv1" runat="server"  AutoGenerateColumns="false" Width ="400px"  OnRowDataBound="gv1_RowDataBound">
        <Columns>
            <asp:HyperLinkField   DataNavigateUrlFields="link" DataTextField="id"  HeaderText="ID" ItemStyle-Width="50px" />
             <asp:BoundField DataField="n_clips" HeaderText="Total Number of clips" ItemStyle-Width="30px" />
             <asp:BoundField DataField="n_coded" HeaderText="Number of Coded clips" ItemStyle-Width="30px"/>
             <asp:BoundField DataField="n_missing_dates" HeaderText="Number of Missing Dates" ItemStyle-Width="30px" ItemStyle-ForeColor="Crimson"/>
             <asp:BoundField DataField="avg_coded_score" HeaderText="Avg Coded Score" DataFormatString="{0:f2}" ItemStyle-Width="40px"/>
             <asp:BoundField DataField="min_coded_score" HeaderText="Min Coded Score" ItemStyle-Width="40px"/>
             <asp:BoundField DataField="max_coded_score" HeaderText="Max Coded Score" ItemStyle-Width="40px"/>
 


        </Columns>
    </asp:GridView>
            </td>
            <td style="vertical-align:top">
    <h4>Individual Clips</h4>

        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtclipname" runat="server" ></asp:TextBox> 
                <asp:Button ID="btnSearch" runat="server" Text="Search"   /> 
                &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" Text="Clear" PostBackUrl="https:\\autism.washington.edu\research\study\tadpole\lo.aspx"   />


                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnNew" runat="server" Text="Add New Row" Visible="false" OnClick="btnNew_Click" /> 


                <br /><br />
    <asp:GridView ID="gv2" runat="server" DataSourceID="sql2"  AutoGenerateEditButton="true" AutoGenerateColumns="false" AllowSorting="true"  
        DataKeyNames="tadlo_pk"
        OnRowDataBound="gv2_RowDataBound" >
        <Columns>
             <asp:BoundField DataField="tadlo_pk" HeaderText="tadlo_pk" ReadOnly="true" ItemStyle-Width="40px"/>
             <asp:BoundField DataField="id" HeaderText="id"  ReadOnly="true" ItemStyle-Width="40px" />
             <asp:BoundField DataField="lo_date" HeaderText="lo_date" DataFormatString="{0:d}" ControlStyle-Width="80px" ApplyFormatInEditMode="true"  ControlStyle-BackColor="PaleGreen" />
             <asp:BoundField DataField="Month" HeaderText="Month" ControlStyle-Width="30px"  ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="ClipName" HeaderText="ClipName" ControlStyle-Width="150px"  ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="DeidentifiedName" HeaderText="DeidentifiedName"  ControlStyle-Width="110px"  ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="Activity" HeaderText="Activity"  ControlStyle-Width="40px" ControlStyle-BackColor="PaleGreen" />
             <asp:BoundField DataField="Codeable" HeaderText="Codeable"  ControlStyle-Width="60px" ControlStyle-BackColor="PaleGreen"  />
             <asp:BoundField DataField="TimesCoded" HeaderText="TimesCoded"  ControlStyle-Width="140px"   ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="Assignedto" HeaderText="Assignedto"  ControlStyle-Width="40px"  ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="Coded" HeaderText="Coded"  ControlStyle-Width="40px"  ControlStyle-BackColor="Yellow"/>
             <asp:BoundField DataField="ReliabilityChecked" HeaderText="ReliabilityChecked"  ControlStyle-Width="50px"  ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="LCRate" HeaderText="LCRate" ControlStyle-Width="40px"  ControlStyle-BackColor="PaleGreen"/>
             <asp:BoundField DataField="Updated" HeaderText="Updated"  ReadOnly="true" ItemStyle-Width="40px" />
             <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy"  ReadOnly="true" ItemStyle-Width="40px" />

        </Columns>
    </asp:GridView>

            </td>
        </tr>
    </table>

    <br />
    <br />


<%--            SelectCommand="select tadlo_pk, id, lo_date, Month, ClipName, DeidentifiedName, Activity, Codeable, TimesCoded, AssignedTo, Coded, ReliabilityChecked, LCRate, rownum, updated, updatedBy from all_lo_tadpole" --%>

    <asp:SqlDataSource ID="sql2" runat="server" EnableViewState="true"    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>" 
        SelectCommandType="Text"  
        SelectCommand="exec spGet_ALL_LO_Tadpole @id, @clipname" 
        InsertCommandType ="Text"  
        InsertCommand="insert into all_lo_tadpole (id, lo_date, [Month], ClipName, DeidentifiedName,  Activity,  Codeable, TimesCoded,  Assignedto, Coded,  ReliabilityChecked,  LCRate ) values ( @id, @lo_date, @Month, @ClipName, @DeidentifiedName,  @Activity,  @Codeable, @TimesCoded,  @Assignedto, @Coded,  @ReliabilityChecked,  @LCRate )"  
        UpdateCommandType ="Text"  
        UpdateCommand="update all_lo_tadpole set lo_date=@lo_date,   [Month]=@Month,  ClipName=@ClipName,  DeidentifiedName=@DeidentifiedName,  Activity=@Activity,  Codeable=@Codeable, TimesCoded=@TimesCoded,  Assignedto=@Assignedto,  Coded=@Coded,  ReliabilityChecked=@ReliabilityChecked,  LCRate=@LCRate where tadlo_pk=@tadlo_pk "  
         OnUpdated="sql2_Updated"
        >
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id"  ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtclipname" Name="clipname" PropertyName="Text" ConvertEmptyStringToNull="false" />

        </SelectParameters>
        <UpdateParameters>
             <asp:Parameter Name="tadlo_pk" type="Int32" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="lo_date" type="DateTime" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Month" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="ClipName" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="DeidentifiedName" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Activity" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Codeable" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="TimesCoded" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Assignedto" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Coded" type="Decimal" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="ReliabilityChecked" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="LCRate" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Updated" type="DateTime" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="UpdatedBy" type="String" ConvertEmptyStringToNull="true"/>
        </UpdateParameters>
        <InsertParameters>
             <asp:Parameter Name="tadlo_pk" type="Int32" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="id" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="lo_date" type="DateTime" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Month" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="ClipName" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="DeidentifiedName" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Activity" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Codeable" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="TimesCoded" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Assignedto" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Coded" type="Decimal" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="ReliabilityChecked" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="LCRate" type="String" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="Updated" type="DateTime" ConvertEmptyStringToNull="true"/>
             <asp:Parameter Name="UpdatedBy" type="String" ConvertEmptyStringToNull="true"/>
        </InsertParameters>
   </asp:SqlDataSource>  



</asp:Content>
