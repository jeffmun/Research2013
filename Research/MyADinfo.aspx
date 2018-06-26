<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="MyADinfo.aspx.cs" AutoEventWireup="True" Inherits="AutismCenterResearch_MyADinfo" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
is something here now?
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="select top 10 studyID, studyname from vwMasterStatus_S" SelectCommandType="Text" DataSourceMode="DataSet" ></asp:SqlDataSource>


<asp:gridview ID="Gridview1" runat="server" DataSoureceID="SqlDataSource1" AutoGenerateColumns="false" >
<Columns>
 <asp:BoundField HeaderText="StudyID" DataField="studyID" />
 <asp:BoundField HeaderText="StudyName" DataField="StudyName" />

</Columns>
</asp:gridview>

foo
</asp:Content>
