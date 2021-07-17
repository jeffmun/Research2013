<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="SleepMeasures.aspx.cs" Inherits="Reports_SleepMeasures"  Title ="Sleep data status"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v19.2.Web, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<asp:Label ID="lbl1" runat="server" Text="Sleep Data Measure Status" Font-Size="Medium" Font-Bold="true"></asp:Label>

	<br /><br />
	<dx:ASPxGridView ID="gv" runat="server" Visible="true" DataSourceID="sql_sleepmeasures" AutoGenerateColumns="true">
		<SettingsPager Mode="ShowAllRecords"></SettingsPager>
<%--		<Settings VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />--%>
	</dx:ASPxGridView>


		<asp:SqlDataSource ID="sql_sleepmeasures" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from vwSleepMeasuresStatus order by id "
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

</asp:Content>