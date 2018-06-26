<%@ Page Language="c#"  validateRequest="false" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="IntHxCharts.aspx.cs" AutoEventWireup="True" 
	Inherits="stats_IntHxCharts" Title="IntHx v2 View Charts"   EnableEventValidation="false"  EnableSessionState="ReadOnly"  %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<%--	
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"  ></asp:ScriptManager>--%>



	<script type="text/javascript">
		//<!--JS_SAMPLE_BEGIN-->
		<%--function Start() {
			//Trigger AJAX callback with "start" parameter
			eo_Callback("<%=CallbackPanel1.ClientID%>", "start");
}

function AfterCallbackUpate(callback, extraData) {
	if (extraData == "start") {
		//Now start the progress bar
		var progressBar = eo_GetObject("<%=ProgressBar1.ClientID%>");
		progressBar.startTask();
	}
}

function OnProgress(progressBar) {
	var extraData = progressBar.getExtraData();
	if (extraData) {
		//The following code demonstrates how to update
		//client side DHTML element based on the value
		//RunTask passed to us with e.UpdateProgress
		var div = document.getElementById("divStatus");
		div.innerHTML = extraData;

		if (extraData == "Complete.") {
			//Trigger an AJAX callback using the CallbackPanel
			//control. This will trigger the server side
			//CallbackPanel1_Execute event handler. See the 
			//documentation for more details on how to use the 
			//CallbackPanel control. Note we must use setTimeout 
			//here to make sure our code is run after the progress
			//bar has finished updating its internal states
			window.setTimeout(
				"eo_Callback('<%=CallbackPanel1.ClientID%>', 'done')",
				10);
		}
	}
}--%>
//<!--JS_SAMPLE_END-->
	</script>



<%--    LINKS--%>
	<table>
		<tr>
			<td style="width:400px">
					<asp:Label ID="Label1" runat="server" Text="MIND Intervention History vers 2" Font-Bold="true" Font-Size="12"></asp:Label>
			</td>
			<td>
				<table>
					<tr>
						<td style="width:250px; vertical-align: top">
							<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/dataentryforms/common/MIND_IntHx_v2stack/WeeksGTE40.aspx">View List of ID's with weeks >= 40 hrs</asp:LinkButton>
						</td>
						<td style="width:30px"></td>
						<td style="vertical-align: top">
							<asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="~/DataProject/IntHxTxCat.aspx" Text="IntHx Category Definitions"></asp:HyperLink>
						</td>
						<td style="width:30px"></td>
						<td style="vertical-align: top">

							<asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" Visible="true" NavigateUrl="~/tracking/TimepointSubj.aspx" Text="Timepoint Dates"></asp:HyperLink>
							<br />
							<asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" Visible="false" NavigateUrl="~/stats/GetIntHxData.aspx" Text="Download IntHx Data"></asp:HyperLink>
						</td>

					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
					<asp:Label ID="lblStudy" runat="server" Text="" Font-Bold="true" Font-Size="16"></asp:Label>
			</td>
		</tr>
	</table>
	<br /><br />

	<asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>


	<%--Once loaded, these graphs can be saved to a PDF file.--%>
	<asp:Label ID="Label2" runat="server" Text="This page will display plots for all intervention history data in this study.<br/>"></asp:Label><br />
	<br />

	<asp:Panel ID="panelButtons" runat="server" Visible="true">
	<table>
		<tr>
			<td style="vertical-align:top"   style="width:500px">
				<table>
					<tr>
						<td style="vertical-align:top">
							<asp:Button ID="btnLoad" runat="server" Text="Display Charts" CommandName="DisplayAll" OnCommand="Button_Command" />

						</td>
						<td style="vertical-align:top">
							<asp:RadioButtonList ID="rblPeriodType" runat="server" Visible="true" Font-Size="XX-Small" RepeatDirection="Horizontal"  >
								<asp:ListItem Value="Timepoint" Text="Timepoint" Selected="True"></asp:ListItem>
								<asp:ListItem Value="TxStart" Text="TxStart"></asp:ListItem>
								<asp:ListItem Value="Both" Text="Both"></asp:ListItem>
							</asp:RadioButtonList>

						</td>
					</tr>
				</table>
				<br />
					<asp:Label ID="l1" runat="server" Text ="Select the charts to display:" Font-Underline="true"></asp:Label><br />
				<asp:CheckBoxList ID="cblCHARTS"  runat="server" Font-Size="XX-Small" Visible="true"  RepeatDirection="Horizontal" RepeatColumns="3">
					
					<asp:ListItem Value="_type_wk.png" Text="Week by TYPE" Selected="True"></asp:ListItem>
					<asp:ListItem Value="_cat_wk.png" Text="Week by CATEGORY" Selected="False"></asp:ListItem>
					<asp:ListItem Value="_all_wk.png" Text="Week by ALL" Selected="False"></asp:ListItem>
					<asp:ListItem Value="_type_period.png" Text="Period by TYPE" Selected="True"></asp:ListItem>
					<asp:ListItem Value="_cat_period.png" Text="Period by CATEGORY" Selected="False"></asp:ListItem>
					<asp:ListItem Value="_all_period.png" Text="Period by ALL" Selected="False"></asp:ListItem>
					<asp:ListItem Value="_type_periodACTIVE.png" Text="Period by TYPE *Active*" Selected="True"></asp:ListItem>
					<asp:ListItem Value="_cat_periodACTIVE.png" Text="Period by CATEGORY *Active*" Selected="False"></asp:ListItem>
					<asp:ListItem Value="_all_periodACTIVE.png" Text="Period by ALL *Active*" Selected="False"></asp:ListItem>

				</asp:CheckBoxList>
				<asp:Label ID="Label3" runat="server" Text ="*Active* = avg weekly hrs only when the tx is actively received." Font-Italic="true"></asp:Label><br />

			</td>
			<td></td>
			<td style="vertical-align:top">

				<asp:Button ID="btnRecreate" runat="server" Text="Click here to recreate charts / rescore data" OnClick="btnRecreate_Click"/>
				<asp:Panel ID="panelProgressBar" runat="server" Visible="false">
					
						<asp:Button ID="btnSaveAllPNG" runat="server" Text="Recreate All Charts" CommandName="SaveAllPNG" OnCommand="Button_Command" />
						<asp:Label ID="lblmaxy" runat="server" Text="Max Y value:" Font-Size="XX-Small"></asp:Label>
						<asp:TextBox ID="txtMaxY" runat="server" Font-Size="X-Small" Width="50px"></asp:TextBox>
						<br />

						 <eo:ProgressBar ID="ProgressBar1" runat="server" Width="200px" Height="15px" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"
							 BackColor="White" IndicatorColor="SkyBlue" ShowPercentage="true"
							 StartTaskButton="btnSaveAllPNG"  OnRunTask="SaveIntHxCharts_for_study"  
							  ></eo:ProgressBar>

						<br /><br />
				<asp:Button ID="btnRescore" runat="server" Text="Rescore all weekly data" CommandName="RescoreAll" OnCommand="Button_Command" />

				</asp:Panel>
		<%--		<asp:LinkButton ID="btnStop" runat="server" Visible="false"></asp:LinkButton>
				<div id="divStatus"></div>
				<eo:CallbackPanel runat="server" ID="CallbackPanel1" ClientSideAfterUpdate="AfterCallbackUpate"
					OnExecute="CallbackPanel1_Execute">
					<asp:Label ID="Label4" runat="server"></asp:Label>
				</eo:CallbackPanel>--%>

				<br /><br />
				
<%--				<asp:Panel ID="panelProgressBar2" runat="server" Visible="false">
					
						<asp:Button ID="btnRescoreAll" runat="server" Text="Rescore all weekly data" CommandName="RescoreAll" OnCommand="Button_Command" />

						 <eo:ProgressBar ID="ProgressBar2" runat="server" Width="200px" Height="15px" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"
							 BackColor="White" IndicatorColor="SkyBlue" ShowPercentage="true"
							 StartTaskButton="btnRescoreAll" StopTaskButton="btnStop2" OnRunTask="RescoreWeeklyData_for_study"  
							 ClientSideOnValueChanged="OnProgress2" ></eo:ProgressBar>
				</asp:Panel>
				<asp:LinkButton ID="btnStop2" runat="server" Visible="false"></asp:LinkButton>
				<div id="divStatus2"></div>
				<eo:CallbackPanel runat="server" ID="CallbackPanel2" ClientSideAfterUpdate="AfterCallbackUpate"
					OnExecute="CallbackPanel2_Execute">
					<asp:Label ID="Label5" runat="server"></asp:Label>
				</eo:CallbackPanel>
--%>

			</td>
			</tr>
		<tr>
			<td>
				<br />
				<asp:Button ID="btnStats" runat="server" Text="Display Stats" OnCommand="Button_Command" CommandName="Stats" />
			
				<asp:RadioButtonList ID="rblLevel" runat="server">
					<asp:ListItem Value="txcat" Text="Category" Selected="True"></asp:ListItem>
					<asp:ListItem Value="txall" Text="All"></asp:ListItem>
				</asp:RadioButtonList>

			</td>
			<td style="vertical-align:top; width: 100px">
								
			</td>
			<td>
			
			</td>
		</tr>
	</table>


		<br />
	<asp:Label ID="lblNORECS" runat="server" Text="" Font-Size="Medium"></asp:Label>


		<br />
				<asp:Label ID="lblTitleTable" runat="server" Text="Summary of Weeks of IntHx Data" Font-Bold="true" Font-Size="Small" ></asp:Label>
		<asp:Label ID="Label4" runat="server" Text="(Cell counts = # weeks with a treatment recorded within a calendar year)" Font-Bold="false" Font-Size="XX-Small" ></asp:Label>
		<br />	<br />
<table>
	<tr>
		<td style="vertical-align: top">

	<asp:Panel ID="panel1" runat="server" Visible ="true" >
		<asp:GridView ID="gvByYearTadpole" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvByYear_RowDataBound">
			<Columns>
				<asp:HyperLinkField DataTextField="ID" DataNavigateUrlFields="link" HeaderText="Click to edit" Target="_blank" />
				<asp:BoundField DataField="Groupname" HeaderText="Group"/>
				<asp:BoundField DataField="Subjstatus" HeaderText="Subject Status"/>
				<asp:BoundField DataField="sms1" HeaderText="T1"/>
				<asp:BoundField DataField="sms2" HeaderText="T2"/>
				<asp:BoundField DataField="sms3" HeaderText="T3"/>
				<asp:BoundField DataField="sms3_5" HeaderText="T3_5"/>
				<asp:BoundField DataField="sms4" HeaderText="T4"/>
				<asp:BoundField DataField="sms4_5" HeaderText="T4_5"/>
				<asp:BoundField DataField="sms5" HeaderText="T5"/>
				<asp:BoundField DataField="MinDate" HeaderText="MinDate" DataFormatString="{0:d}" />
				<asp:BoundField DataField="MaxDate" HeaderText="MaxDate" DataFormatString="{0:d}" />
				<asp:BoundField DataField="nrecs" HeaderText="# Recs" />
				<asp:BoundField DataField="n2000" HeaderText="2000" />
				<asp:BoundField DataField="n2001" HeaderText="2001" />
				<asp:BoundField DataField="n2002" HeaderText="2002" />
				<asp:BoundField DataField="n2003" HeaderText="2003" />
				<asp:BoundField DataField="n2004" HeaderText="2004" />
				<asp:BoundField DataField="n2005" HeaderText="2005" />
				<asp:BoundField DataField="n2006" HeaderText="2006" />
				<asp:BoundField DataField="n2007" HeaderText="2007" />
				<asp:BoundField DataField="n2008" HeaderText="2008" />
				<asp:BoundField DataField="n2009" HeaderText="2009" />
				<asp:BoundField DataField="n2010" HeaderText="2010" />
				<asp:BoundField DataField="n2011" HeaderText="2011" />
				<asp:BoundField DataField="n2012" HeaderText="2012" />
				<asp:BoundField DataField="n2013" HeaderText="2013" />
				<asp:BoundField DataField="n2014" HeaderText="2014" />
				<asp:BoundField DataField="n2015" HeaderText="2015" />
				<asp:BoundField DataField="n2016" HeaderText="2016" />
				<asp:BoundField DataField="n2017" HeaderText="2017" />
				<asp:BoundField DataField="n2018" HeaderText="2018" />
				<asp:BoundField DataField="n2019" HeaderText="2019" />
				<asp:BoundField DataField="n2020" HeaderText="2020" />

			</Columns>
		</asp:GridView>
				<asp:GridView ID="gvByYear" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvByYear_RowDataBound">
			<Columns>
				<asp:HyperLinkField DataTextField="ID" DataNavigateUrlFields="link" HeaderText="Click to edit" Target="_blank" />
				<asp:BoundField DataField="Groupname" HeaderText="Group"/>
				<asp:BoundField DataField="Subjstatus" HeaderText="Subject Status"/>
				<asp:BoundField DataField="MinDate" HeaderText="MinDate" DataFormatString="{0:d}" />
				<asp:BoundField DataField="MaxDate" HeaderText="MaxDate" DataFormatString="{0:d}" />
				<asp:BoundField DataField="nrecs" HeaderText="# Recs" />
				<asp:BoundField DataField="n2000" HeaderText="2000" />
				<asp:BoundField DataField="n2001" HeaderText="2001" />
				<asp:BoundField DataField="n2002" HeaderText="2002" />
				<asp:BoundField DataField="n2003" HeaderText="2003" />
				<asp:BoundField DataField="n2004" HeaderText="2004" />
				<asp:BoundField DataField="n2005" HeaderText="2005" />
				<asp:BoundField DataField="n2006" HeaderText="2006" />
				<asp:BoundField DataField="n2007" HeaderText="2007" />
				<asp:BoundField DataField="n2008" HeaderText="2008" />
				<asp:BoundField DataField="n2009" HeaderText="2009" />
				<asp:BoundField DataField="n2010" HeaderText="2010" />
				<asp:BoundField DataField="n2011" HeaderText="2011" />
				<asp:BoundField DataField="n2012" HeaderText="2012" />
				<asp:BoundField DataField="n2013" HeaderText="2013" />
				<asp:BoundField DataField="n2014" HeaderText="2014" />
				<asp:BoundField DataField="n2015" HeaderText="2015" />
				<asp:BoundField DataField="n2016" HeaderText="2016" />
				<asp:BoundField DataField="n2017" HeaderText="2017" />
				<asp:BoundField DataField="n2018" HeaderText="2018" />
				<asp:BoundField DataField="n2019" HeaderText="2019" />
				<asp:BoundField DataField="n2020" HeaderText="2020" />

			</Columns>
		</asp:GridView>
	</asp:Panel>


	
		</td>
		<td style="vertical-align: top">
			<%--<asp:GridView ID="gvSMS" runat="server" OnRowDataBound="gvSMS_OnRowDataBound" ></asp:GridView>--%>

		</td>
	</tr>
</table>

	<asp:Panel ID="panelLegend" runat="server" Visible ="false" >
	<asp:Label ID="lblTitle" runat="server" Text ="Legend for IntHx Categories" Font-Bold="true" Font-Underline="true" Font-Size="Medium" ></asp:Label>		
	<br /><br />
	<table>
		<tr>
			<td style="vertical-align:top">
			<%--<obout:Grid ID="GridTxCat" runat="server" DataSourceID="sqlTxCat" AutoGenerateColumns="true"   
				AllowEdit="false"   OnRowDataBound="GridTxCat_RowDataBound" 
				AllowPaging="false"  FolderStyle="~/App_Obout/Grid/styles/premiere_blue" PageSize="-1" Width="500px" >
				<Columns>
				</Columns>
			</obout:Grid>--%>

				<asp:GridView ID="gv1" runat="server" DataSourceID="sqlTxCat" AutoGenerateColumns="false" >
					<Columns>
						<asp:BoundField DataField="txcatID" HeaderText="txcatID" />
						<asp:TemplateField HeaderText="color">
							<ItemTemplate>
								<asp:Label ID="lbl1" runat="server"  Text="_____" BackColor='<%# System.Drawing.ColorTranslator.FromHtml(@"#" + Eval("txcatcolor")) %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>						<asp:BoundField DataField="txcat" HeaderText="txcat" />

					</Columns>
				</asp:GridView>

<%--								<asp:Label ID="lbl1" runat="server"  Text="_____" BackColor='<%# System.Drawing.ColorTranslator.FromHtml(@"#" + Eval("txcatcolor")) %>' ></asp:Label>--%>

			</td>
			<td style="width:50px"></td>
			<td style="vertical-align:top">


				
				<asp:GridView ID="gv2" runat="server" DataSourceID="sqlTxType" AutoGenerateColumns="false">
					<Columns>
						<asp:BoundField DataField="txtypeID" HeaderText="txtypeID" />
						<asp:TemplateField HeaderText="color">
							<ItemTemplate>
								<asp:Label ID="lbl1" runat="server" Text="_____"  BackColor='<%# System.Drawing.ColorTranslator.FromHtml(@"#" + Eval("txtypecolor")) %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>						<asp:BoundField DataField="txtype" HeaderText="txtype" />
						<asp:BoundField DataField="txcat" HeaderText="txcat" />

					</Columns>
				</asp:GridView>
			</td>
		</tr>
	</table>

	</asp:Panel>

<%--    BackColor='<%# System.Drawing.ColorTranslator.FromHtml(@"#" + Eval("txtypecolor")) %>'--%>



   <br />     
		<table>
		<tr>
			<td>
				<asp:Panel ID="panelMS" runat="server"></asp:Panel>
			</td>
			<td>
				<asp:Panel ID="panelMS2" runat="server"></asp:Panel>
			</td>
		</tr>
	</table>
	</asp:Panel>

  <br /><br />
	<br />


	<table>
		<tr>
			<td style="vertical-align:top">
				<asp:Panel ID="panelChart" runat="server"></asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel ID="panelChart2" runat="server"></asp:Panel>
			</td>
		</tr>
	</table>


	<asp:Panel ID="panelStats" runat="server" Visible="false"></asp:Panel>


	<asp:SqlDataSource ID="sqlTxCat" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommand="select * from const_MIND_IntHXv2_TxCat">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlTxType" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommand="select a.txtypeID, txtype, txcat, txtypecolor 
						from const_MIND_IntHXv2_TxType a join const_MIND_IntHXv2_TxCat b ON a.txcatID = b.txcatID
						order by txcat, txtypeID">
	</asp:SqlDataSource>

</asp:Content>