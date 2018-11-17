<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="Bal4.aspx.cs" Inherits="AC_Bal" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="Server">


	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" />





	 

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


	<%--  Month--%>

	<%--<asp:DropDownList ID="ddlMonth" runat="server" DataSourceID="sql_mv_months" Visible="false"
		DataValueField="Month" DataTextField="Month" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true">
	</asp:DropDownList>--%>

	<br />
	<br />

	<asp:Label ID="importDate" runat="server" Text="Imported on " Font-Size="Medium" Font-Bold="true"></asp:Label>

	<div style="background-color: #f8f8ff; border: 2px solid black; margin: 10px">
				<asp:Label ID="l1" runat="server" Text="Core Clinic" Font-Size="Medium" Font-Bold="true">              </asp:Label>

		
	<dx:ASPxCallbackPanel ID="callbackCharts" runat="server"></dx:ASPxCallbackPanel>   
	 
<br />


		<asp:Panel ID="panel1" runat="server"></asp:Panel>
	</div>


	<br />
	<br />

	


	<%--<asp:SqlDataSource ID="sql_mv_months" runat="server"
		SelectCommandType="Text"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="select top 100 percent [Month] from ac.vwGetMonthlyVarianceMonths order by [Month] desc"
		UpdateCommand="select top 100 percent [Month] from ac.vwGetMonthlyVarianceMonths order by [Month] desc"></asp:SqlDataSource>--%>



	<asp:GridView ID="grid1" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid_RowDataBound">
		<Columns>
			<asp:BoundField DataField="Budgetnbr" HeaderText="Budget #" />
			<asp:BoundField DataField="BudgetName" HeaderText="Budget Name" />
			<asp:BoundField DataField="RevenueAmount" HeaderText="Revenue" DataFormatString="{0:c}" />
			<asp:BoundField DataField="ExpenseAmount" HeaderText="Expenses" DataFormatString="{0:c}" />
			<asp:BoundField DataField="EXP_SALARY" HeaderText="Exp: Salary" DataFormatString="{0:c}" />
			<asp:BoundField DataField="EXP_Non_SALARY" HeaderText="Exp: Other" DataFormatString="{0:c}" />
			<asp:BoundField DataField="Rev/Sal" HeaderText="Rev/Sal" DataFormatString="{0:c}" />
			<asp:BoundField DataField="RemainingBal" HeaderText="Balance" DataFormatString="{0:c}" />
			<asp:BoundField DataField="yrmo" HeaderText="Year_Mo" />
			<asp:BoundField DataField="imported_from_EDW" HeaderText="Data retrieved on:" />

		</Columns>
	</asp:GridView>

	<br />
	<br />



	<asp:GridView ID="grid2" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid_RowDataBound">
		<Columns>
			<asp:BoundField DataField="Budgetnbr" HeaderText="Budget #" />
			<asp:BoundField DataField="BudgetName" HeaderText="Budget Name" />
			<asp:BoundField DataField="RevenueAmount" HeaderText="Revenue" DataFormatString="{0:c}" />
			<asp:BoundField DataField="ExpenseAmount" HeaderText="Expenses" DataFormatString="{0:c}" />
						<asp:BoundField DataField="Rev/Sal" HeaderText="Rev/Sal" DataFormatString="{0:c}" />
			<asp:BoundField DataField="RemainingBal" HeaderText="Balance" DataFormatString="{0:c}" />
			<asp:BoundField DataField="yrmo" HeaderText="Year_Mo" />
			<asp:BoundField DataField="imported_from_EDW" HeaderText="Data retrieved on:" />

		</Columns>
	</asp:GridView>


	<br />
	<br />
	<asp:Label ID="Label2" runat="server" Text="Research" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>


	<asp:GridView ID="grid3" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid_RowDataBound" Visible="false">
		<Columns>
			<asp:BoundField DataField="Budgetnbr" HeaderText="Budget #" />
			<asp:BoundField DataField="BudgetName" HeaderText="Budget Name" />
			<asp:BoundField DataField="RevenueAmount" HeaderText="Revenue" DataFormatString="{0:c}" />
			<asp:BoundField DataField="ExpenseAmount" HeaderText="Expenses" DataFormatString="{0:c}" />
						<asp:BoundField DataField="Rev/Sal" HeaderText="Rev/Sal" DataFormatString="{0:c}" />
			<asp:BoundField DataField="RemainingBal" HeaderText="Balance" DataFormatString="{0:c}" />
			<asp:BoundField DataField="yrmo" HeaderText="Year_Mo" />
			<asp:BoundField DataField="imported_from_EDW" HeaderText="Data retrieved on:" />

		</Columns>
	</asp:GridView>





		<div style="background-color: #f8fff8; border: 2px solid black; margin: 10px">
		<asp:Label ID="Label3" runat="server" Text="Gift" Font-Size="Medium" Font-Bold="true"></asp:Label>
		<asp:Panel ID="panel2" runat="server"></asp:Panel>
	</div>


	<div style="background-color: #fffff8; border: 2px solid black; margin: 10px">

	   


	<asp:SqlDataSource ID="sql_mv_658823" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="658823" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_653977" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="653977" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_653920" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="653920" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_sum_over_clinic" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetSummedMonth"
		UpdateCommand="fin.spGetSummedMonth">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_631370" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="631370" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_634035" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="634035" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_633383" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="633383" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="sql_mv_655411" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="655411" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_656876" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="656876" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_631369" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="631369" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_630120" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="630120" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_630555" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="630555" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_095001" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="095001" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_095002" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="095002" />
		</SelectParameters>
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_mv_640259" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="640259" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_mv_099877" runat="server"
		SelectCommandType="StoredProcedure"
		ConnectionString="<%$ ConnectionStrings:FinMart_ConnectionString %>"
		SelectCommand="fin.spGetBudgetMonth"
		UpdateCommand="fin.spGetBudgetMonth">
		<SelectParameters>
			<asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="099877" />
		</SelectParameters>
	</asp:SqlDataSource>


	<table>
		<tr>
			<td>
				<asp:Panel ID="panelCharts" runat="server" Visible="false"></asp:Panel>
			</td>
			<td>
				<asp:Panel ID="panelCharts2" runat="server" Visible="false"></asp:Panel>
			</td>

		</tr>
	</table>

</asp:Content>

