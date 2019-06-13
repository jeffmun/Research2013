<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="SleepSummary.aspx.cs" Inherits="Reports_SleepSummary"  Title ="Summary of sleep data"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<asp:Label ID="lbl1" runat="server" Text="Sleep Data Summary" Font-Size="Medium" Font-Bold="true"></asp:Label>

	<table>
		<tr>
			<td style="padding: 10px">
				<dx:ASPxComboBox ID="cboSubject" ClientInstanceName="cboSubject" runat="server" Caption="Subject:" CaptionCellStyle-Width="90px" NullText="select subject"></dx:ASPxComboBox>

				<dx:ASPxComboBox ID="cboStudymeas" ClientInstanceName="cboStudymeas" runat="server" Caption="Measure:" CaptionCellStyle-Width="90px" NullText="select measure"
						 AutoPostBack="false" ></dx:ASPxComboBox>
			</td>
			<td style="padding: 10px; vertical-align: top">
				<dx:ASPxButton ID="btnLoad" runat="server" AutoPostBack="true" Text="Load Summary" OnClick="btnLoad_Click"></dx:ASPxButton>
			</td>
			<td>
				<dx:ASPxLabel ID="lblDaylight" runat="server" EncodeHtml="false"></dx:ASPxLabel>
			</td>
		</tr>
	</table>


	<dx:ASPxLabel ID="lblSetupInfo" runat="server" EncodeHtml="false"></dx:ASPxLabel>

	<asp:Panel ID="panel" runat="server">

	</asp:Panel>

	<br /><br />
	<dx:ASPxGridView ID="gridDaily" runat="server" Visible="false">
		<Columns>
				<dx:GridViewDataColumn FieldName="id" />
				<dx:GridViewDataColumn FieldName="report_date" />
				<dx:GridViewDataColumn FieldName="sleep_starttime" />
				<dx:GridViewDataColumn FieldName="sleep_endtime" />
				<dx:GridViewDataColumn FieldName="rest_starttime" />
				<dx:GridViewDataColumn FieldName="rest_endtime" />
				<dx:GridViewDataColumn FieldName="hrsinbed" />
				<dx:GridViewDataColumn FieldName="hrssleep" />
				<dx:GridViewDataColumn FieldName="avgacpermin_sleep" />
				<dx:GridViewDataColumn FieldName="avgacpermin_rest" />
				<dx:GridViewDataColumn FieldName="onsetlatency" />
				<dx:GridViewDataColumn FieldName="efficiency" />
				<dx:GridViewDataColumn FieldName="waso" />
				<dx:GridViewDataColumn FieldName="numwakebouts" />
				<dx:GridViewDataColumn FieldName="pctwake" />
				<dx:GridViewDataColumn FieldName="pctsleep" />
				<dx:GridViewDataColumn FieldName="fragmentation" />
				<dx:GridViewDataTimeEditColumn FieldName="sunset">
					<PropertiesTimeEdit DisplayFormatString="hh\:mm" />
				</dx:GridViewDataTimeEditColumn>    
				<dx:GridViewDataTimeEditColumn FieldName="sunrise">
					<PropertiesTimeEdit DisplayFormatString="hh\:mm" />
				</dx:GridViewDataTimeEditColumn>    

		</Columns>
	</dx:ASPxGridView>

</asp:Content>