<%@ Page Language="c#"  Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MIND_IntHx_v2stack.aspx.cs" AutoEventWireup="True" 
	Inherits="DataEntryForms_Common_MIND_IntHx_v2stack" Title="MIND_IntHx v2 Data Entry"   EnableEventValidation="false"  %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

	
		<asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
	 
	<table>
		<tr>
			<td style="width:400px">
					<asp:Label ID="Label1" runat="server" Text="MIND Intervention History vers 2" Font-Bold="true" Font-Size="12"></asp:Label>
			</td>
			<td style="width:300px">
				<asp:HyperLink ID="LinkButton1" runat="server" Target="_blank" NavigateUrl="../Mind_IntHx_v2stack/WeeksGTE40.aspx" Text="View List of ID's with weeks >= 40 hrs"></asp:HyperLink>
			</td>
			<td>
				<asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="../Mind_IntHx_v2stack/IntHxCat.aspx" Text="IntHx Category Definitions"></asp:HyperLink>
			</td>
			<td style="width:30px"></td>
			<td>
				<asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" NavigateUrl="~/stats/IntHxCharts.aspx" Text="IntHx Charts for All Subjects"></asp:HyperLink>
			</td>
			<td style="width:30px"></td>
			<td>

				<asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" Visible="false" NavigateUrl="~/stats/GetIntHxData.aspx" Text="Download IntHx Data"></asp:HyperLink>
			</td>

		</tr>
	</table>
	<br /><br />


	<asp:Label ID="Label7" runat="server" Text=""></asp:Label>


	<asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>



	   
	<table>

		<tr>
			<td style="width:600px" style="vertical-align:top">
				
	<table>
		<tr>
			<td>
				<asp:Label ID="Label2" runat="server" Text="Study: " Visible="false"></asp:Label>
				<asp:Label ID="lblStudy" runat="server" Text="" Font-Bold="true" Font-Size="12pt" ></asp:Label>
			</td>
			<td>
				<asp:Label ID="Label4" runat="server" Text="ID: "></asp:Label>
				<asp:Label ID="lblID" runat="server" Text="" Font-Bold="true" Font-Size="12pt"></asp:Label>
				<br />
				<asp:Label ID="Label8" runat="server" Text="Group: "></asp:Label>
				<asp:Label ID="lblGroup" runat="server" Text="" Font-Bold="true" Font-Size="12pt"></asp:Label>
				<br />
				<asp:HyperLink ID="linkRawData" runat="server" Text="Link to scans of UW method raw data" Target="_blank" Visible="false"></asp:HyperLink>


			</td>
			<td style="width: 50px">

			</td>
			<td>
				<asp:DropDownList ID="ddlNewID" runat="server" DataTextField="IDtxt" DataValueField="ID" OnSelectedIndexChanged="ddlNewID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
			</td>
		</tr>
	</table>

	<br />
	<br />


	<asp:Panel ID="PanelHeader" runat="server" Visible="true" BackColor="AliceBlue" Width="600px" >
		<table width="600px" >
			<tr>
				<td  align="left">
					<asp:Label ID="Label3" runat="server" Text="Select study measure:" Font-Size="X-Small" />
					<asp:DropDownList ID="ddlStudymeas" runat="server" DataTextField="studymeasname" DataValueField="studymeasID"  Font-Size="10pt"></asp:DropDownList>
				</td>
				<td >
					<asp:Label ID="Label5" runat="server" Text="Date of Interview:" Font-Size="X-Small" />
					<asp:TextBox ID="txtDate" runat="server" Text="" ></asp:TextBox>

					<asp:RangeValidator ID ="rvDate" runat ="server" ControlToValidate="txtDate" ErrorMessage="Invalid Date" Type="Date" 
						MinimumValue="01/01/2005" MaximumValue="01/01/2020" Display="Dynamic"></asp:RangeValidator>


				</td>
				<td >
					<asp:Label ID="Label6" runat="server" Text="Interviewer:" Font-Size="X-Small" />
					<asp:TextBox ID="txtInterviewer" runat="server" Text="" ></asp:TextBox>
				</td>
			</tr>
			</table>
		</asp:Panel>
   
	<asp:Panel ID="Panel1" runat="server" Visible="true" BackColor="AliceBlue" >
		
		<table>
			<tr>
				<td></td>
				<td>Type</td>
				<td>Name</td>
				<td>Setting</td>

			</tr>
			<tr>
				<td style="vertical-align:top"><asp:Label ID="txtpk" runat="server" Text="" Width="50px"  Font-Size="X-Small" Visible="false"/></td>
				<td style="vertical-align:top"><asp:DropDownList ID="ddl1" runat="server" DataSourceID="Sql_ddl1" DataTextField="ihtype" DataValueField="txtypeID"  Font-Size="X-Small"></asp:DropDownList></td>
				<td style="vertical-align:top"><asp:TextBox ID="txtihname" runat="server" Text="" Width="200px" Font-Size="X-Small"/></td>
				<td style="vertical-align:top"><asp:TextBox ID="txtihsetting" runat="server" Text="" Width="120px" Font-Size="X-Small"/></td>
				</tr>
			</table>
		<table>
			<tr>
				<td>Date Began</td>
				<td>Date End</td>
				<td>Num Units</td>
				<td>Units</td>
			</tr>
			<tr>
				<td style="vertical-align:top"><asp:TextBox ID="txtihdatebeg" runat="server" Text=""  Width="80px" Font-Size="X-Small"/>
					<br />
						<asp:RangeValidator ID ="rvBeg" runat ="server" ControlToValidate="txtihdatebeg" ErrorMessage="Invalid Date" Type="Date" 
						MinimumValue="01/01/1980" MaximumValue="01/01/2020" Display="Dynamic"></asp:RangeValidator>

				</td>
				<td><asp:TextBox ID="txtihdateend" runat="server" Text=""  Width="80px" Font-Size="X-Small"/>
					<br />
						<asp:RangeValidator ID ="rvEnd" runat ="server" ControlToValidate="txtihdateend" ErrorMessage="Invalid Date" Type="Date" 
						MinimumValue="01/01/1980" MaximumValue="01/01/2020" Display="Dynamic"></asp:RangeValidator>
					<asp:CompareValidator ID="CompareValidator1" runat="server" 
						ControlToCompare="txtihdatebeg" ControlToValidate="txtihdateend" 
						CultureInvariantValues="True" 
						ErrorMessage="Begin date must precede End date." 
						Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date"></asp:CompareValidator>

				</td>
				<td style="vertical-align:top"><asp:TextBox ID="txtnumunits" runat="server" Text=""  Width="80px" Font-Size="X-Small"/></td>
				<td style="vertical-align:top"><asp:DropDownList ID="ddl2" runat="server" DataSourceID="Sql_ddl2" DataTextField="fieldvaluelabel" DataValueField="fieldvalue"  Font-Size="X-Small"></asp:DropDownList></td>

			</tr>
		</table>
		<asp:Label ID="lblValidate" runat ="server" ForeColor="Red"></asp:Label>
		<table>
			<tr>
				<td>Group vs. Indiv</td>
				<td># Adults</td>
				<td># Children</td>
				<td>Provider type</td>
			</tr>
			<tr>
				<td style="vertical-align:top"><asp:DropDownList ID="ddl3" runat="server" Font-Size="X-Small">
					<asp:ListItem Text="Group" Value="G"></asp:ListItem>
					<asp:ListItem Text="Individual" Value="I"></asp:ListItem>
					</asp:DropDownList></td>
				<td style="vertical-align:top"><asp:TextBox ID="txtihclassa" runat="server" Text=""  Width="60px" Font-Size="X-Small"/></td>
				<td style="vertical-align:top"><asp:TextBox ID="txtihclassc" runat="server" Text=""  Width="60px" Font-Size="X-Small"/></td>
				<td style="vertical-align:top"><asp:DropDownList ID="ddl4" runat="server" Font-Size="X-Small">
					<asp:ListItem Text="--select--" Value="0"></asp:ListItem>
					<asp:ListItem Text="Specialist" Value="1"></asp:ListItem>
					<asp:ListItem Text="Paraprofessional" Value="2"></asp:ListItem>
					<asp:ListItem Text="Unpaid parent/volunteer" Value="3"></asp:ListItem>
					</asp:DropDownList></td>
			</tr>
		</table>
		<asp:Label ID="lblDetails" runat="server" Text="Details" Font-Size="X-Small" /><br />
		<asp:TextBox ID="txtdetails" runat="server" Text="" Width="600px" Height="30px" TextMode="MultiLine" Wrap="true" Font-Names="Arial" Font-Size="X-Small"/>

		
		
		<asp:Button ID="btnAddNew" runat="server" Text="Insert New" Visible="true" OnClick="btnAddNew_Click"/> 
		<asp:Button ID="btnUpdate" runat="server" Text="Update" BorderStyle="Groove" BackColor="SpringGreen"  Visible="false" OnClick="btnUpdate_Click" /> &nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnCancel" runat="server" Text="Cancel" BorderStyle="Groove" BackColor="Red" Visible="false" OnClick="btnCancel_Click" /> 

		<br />
		<br />
		   

	</asp:Panel>


			</td>
			<td  style="vertical-align:top">
				
				<table>
					<tr>
						<td colspan="2" style="vertical-align:top; width: 400px">
							<asp:Label ID="l1" runat="server" Text ="Charts" Font-Underline="true"></asp:Label><br />
							<asp:RadioButtonList ID="rblPeriodType" runat="server" Visible="true" Font-Size="XX-Small" RepeatDirection="Horizontal"  >
								<asp:ListItem Value="Timepoint" Text="Timepoint" Selected="True"></asp:ListItem>
								<asp:ListItem Value="TxStart" Text="TxStart"></asp:ListItem>
								<asp:ListItem Value="Both" Text="Both"></asp:ListItem>
							</asp:RadioButtonList>
							<br />
							<asp:CheckBoxList ID="cblCHARTS"  runat="server" Font-Size="XX-Small" Visible="true" RepeatDirection="Horizontal" RepeatColumns="3" EnableViewState="true" >
								<asp:ListItem Value="_type_wk.png" Text="Week by TYPE" Selected="True" ></asp:ListItem>
								<asp:ListItem Value="_cat_wk.png" Text="Week by CATEGORY" ></asp:ListItem>
								<asp:ListItem Value="_all_wk.png" Text="Week by ALL" ></asp:ListItem>
								<asp:ListItem Value="_type_period.png" Text="Period by TYPE" ></asp:ListItem>
								<asp:ListItem Value="_cat_period.png" Text="Period by CATEGORY" ></asp:ListItem>
								<asp:ListItem Value="_all_period.png" Text="Period by ALL" ></asp:ListItem>
								<asp:ListItem Value="_type_periodACTIVE.png" Text="Period by TYPE *Active*" Selected="False"></asp:ListItem>
								<asp:ListItem Value="_cat_periodACTIVE.png" Text="Period by CATEGORY *Active*" Selected="False"></asp:ListItem>
								<asp:ListItem Value="_all_periodACTIVE.png" Text="Period by ALL *Active*" Selected="False"></asp:ListItem>
							</asp:CheckBoxList>

						</td>
						<td style="vertical-align:top">
							<asp:Button ID="btnRefreshCharts" runat="server" OnClick="btnRefreshCharts_Click" Text ="Reload Charts" Font-Size="XX-Small"/>
							<br /><br />
							<asp:Button ID="btnRecreateCharts" runat="server" OnClick="btnRecreateCharts_Click" Text ="Recreate Charts" Font-Size="XX-Small"/>
						</td>
					</tr>
				<tr>
					<td colspan="3" style="vertical-align: top">
						<br /><br />
						<asp:Label ID="labelSMS" runat="server" Text="Tracking Info" Font-Bold="true" Font-Underline="true"></asp:Label>

						<obout:Grid ID="ogridSMS" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" ShowFooter="false" FolderStyle="~/App_Obout/Grid/styles/gray_glass"  
							 OnRowDataBound="ogridSMS_OnRowDataBound">
							<Columns>
								<obout:CheckBoxSelectColumn ></obout:CheckBoxSelectColumn>
								<obout:Column DataField="studyname" HeaderText="Study" Width="80px"  />
								<obout:Column DataField="studymeasname" HeaderText="Measure"  Width="120px"/>
								<obout:Column DataField="measstatus" HeaderText="Status"  Width="100px"/>
								<obout:Column DataField="measstatusdetail"  HeaderText="Status Detail"  Width="120px"/>
								<obout:Column DataField="date" HeaderText="DateDone"  Width="100px" />
								<obout:Column DataField="studymeassubjID" Visible="false" />
								
							</Columns>
						</obout:Grid>



					</td>
				</tr>
				<tr>
					<td style="vertical-align: top; width: 150px">
						Measure Status:<br />
						<asp:DropDownList ID="ddlMS" runat="server" DataSourceID="sqlMS" DataTextField="measstatus" DataValueField="measstatusID"
							 OnSelectedIndexChanged="ddlMS_OnSelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
					</td>
					<td style="vertical-align: top">
						Measure Status Detail:<br />
						<asp:DropDownList ID="ddlMSD" runat="server"  DataSourceID="sqlMSD" DataTextField="measstatusdetail" DataValueField="measstatusdetailID" ></asp:DropDownList>
					</td>
					<td style="vertical-align: top">
						Date Done:<br />
						<asp:Textbox ID="txtSMSdate" runat="server" Text='<% System.DateTime.Now.ToShortDateString() %>' Width="120px"   ></asp:Textbox>
						<obout:Calendar runat="server"  StyleFolder = "~/App_Obout/Calendar/styles/Default" DatePickerImagePath="~/App_Obout/Calendar/styles/icon2.gif"
							 DatePickerMode="true" 
							 TextBoxId="txtSMSdate"
							 DatePickerSynchronize="true">
						</obout:Calendar>    


					</td>
				</tr>
					<tr>
						<td colspan="3" style="align-content: center">
							<asp:Button ID="btnUpdateSMS" runat="server" Text="Updated Tracking Status of Selected Measures" OnClick="btnUpdateSMS_OnClick"  />
						</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>      

	<br />
	<%--Chart holders--%> 
	<table>
			<tr>
						<td>
							<asp:Panel ID="panelChart" runat="server"></asp:Panel>
						</td>
						<td colspan="2">
							<asp:Panel ID="panelChart2" runat="server"></asp:Panel>
						</td>
					</tr>
	</table>
	<br />
	<asp:Label ID="lblRawData_nrecs" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
	<br />

	<asp:GridView ID="gvRawData" runat="server" AutoGenerateColumns="false"  AllowSorting="true" 
		OnSorting="gvRawData_Sorting" OnRowDataBound="gvRawData_RowDataBound" >
<%--        AutoGenerateEditButton="true" OnRowEditing="gv_RowEditing" OnRowCancelingEdit="gv_RowCancelingEdit">--%>
		<Columns>
			<asp:TemplateField HeaderText="Study"  SortExpression="studyname, studymeasname, ihdatebeg">
				<ItemTemplate><asp:Label ID="studyname" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[studyname]") %>' ForeColor="Navy"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Study Meas"  SortExpression="studymeasname, ihdatebeg">
				<ItemTemplate><asp:Label ID="studymeasname" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[studymeasname]") %>' ForeColor="Navy"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Date of Intrvw"  SortExpression="ihdate, ihdatebeg">
				<ItemTemplate><asp:Label ID="ihdate" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihdate]", "{0:MM/dd/yyyy}") %>' ForeColor="Navy"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Intervwr" >
				<ItemTemplate><asp:Label ID="ihintervwr" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihintervwr]") %>' ForeColor="Navy"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Edit">
				<ItemTemplate>
					<asp:Button ID="btnEdit" runat="server" Text="Edit" Font-Size="8pt" CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[mindinthxv2stackPK]") %>' CommandName="Edit" OnCommand="btnEdit_Command" /></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="pk" >
				<ItemTemplate><asp:Label ID="mindinthxv2stackPK" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[mindinthxv2stackPK]") %>' ForeColor="Gray"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="ID" >
				<ItemTemplate><asp:Label ID="id" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[id]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Type" SortExpression="txtype, ihdatebeg">
				<ItemTemplate><asp:Label ID="txtype" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[txtype]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Name" SortExpression="ihname, ihdatebeg">
				<ItemTemplate><asp:Label ID="ihname" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihname]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Setting" SortExpression="ihsetting, ihdatebeg">
				<ItemTemplate><asp:Label ID="ihsetting" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihsetting]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Date Began" SortExpression="ihdatebeg">
				<ItemTemplate><asp:Label ID="ihdatebeg" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihdatebeg]", "{0:MM/dd/yyyy}") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Date End" SortExpression="ihdateend">
				<ItemTemplate><asp:Label ID="ihdateend" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihdateend]", "{0:MM/dd/yyyy}") %>'  ></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Duration" >
				<ItemTemplate><asp:Label ID="duration" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Duration]") %>' ForeColor="Gray"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Num Units" SortExpression="ihnumunits">
				<ItemTemplate><asp:Label ID="ihnumunits" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihnumunits]", "{0:f2}") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Units" SortExpression="ihunits">
				<ItemTemplate><asp:Label ID="ihunits" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihunits]") %>' ForeColor="Gray"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Hrs / Week" SortExpression="ihhrsperwk">
				<ItemTemplate><asp:Label ID="ihhrsperwk" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihhrsperwk]", "{0:f2}") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Indiv/ Grp" >
				<ItemTemplate><asp:Label ID="ihGrpInd" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihGrpInd]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Adult/Ch Ratio" >
				<ItemTemplate><asp:Label ID="acratio_text" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[acratio_text]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>

<%--            <asp:TemplateField HeaderText="# Adults" >
				<ItemTemplate><asp:Label ID="ihclassa" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihclassa]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="# Children" >
				<ItemTemplate><asp:Label ID="ihclassc" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihclassc]") %>'></asp:Label></ItemTemplate>
			</asp:TemplateField>--%>
			<asp:TemplateField HeaderText="Provider Trning" >
				<ItemTemplate>
					<asp:HiddenField ID="ihprovid" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "[ihprovid]") %>'></asp:HiddenField>
					<asp:Label ID="provid_text" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[provid_text]") %>'></asp:Label>

				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Details" >
				<ItemTemplate><asp:Label ID="ihdetails" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ihdetails]") %>' Width="400px"></asp:Label></ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Delete">
				<ItemTemplate>
					<asp:Button ID="btnDelete" runat="server" Text="Del" Font-Size="8pt" ForeColor="DarkRed" CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[mindinthxv2stackPK]") %>' CommandName="Delete" OnCommand="btnEdit_Command" /></ItemTemplate>
			</asp:TemplateField>

		</Columns>
	</asp:GridView>

	<asp:SqlDataSource ID="Sql_ddl1" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select 0 txtypeID, '--select type--' ihtype  union select txtypeID, cast(txtypeID as varchar) + ') ' + txtype as ihtype  from const_MIND_IntHXv2_TxType y1 where txtypeID <> -9">
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="Sql_ddl2" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select fieldvalue, fieldvaluelabel from datfieldvaluesetitem where fieldvaluesetID = 715">
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="Sql_gv" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select * , dbo.fnElapTime_text(ihdatebeg, ihdateend) Duration from ALL_MIND_IntHx_vers2_stacked where ID = @id">
		<SelectParameters>
			<asp:QueryStringParameter Name="id" QueryStringField="id" Direction="Input" />
		</SelectParameters>
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlSMS" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select studymeassubj, measstatus, measstatusdetail from vwMasterStatus_M where measureID=749 and studyID=@studyID">
	</asp:SqlDataSource>

	

	<asp:SqlDataSource ID="sqlMS" runat="server" SelectCommandType="StoredProcedure"  
		SelectCommand="trk.spTracking_GetMeasStatus"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlMSD" runat="server" SelectCommandType="StoredProcedure"  
		SelectCommand="trk.spTracking_GetMeasStatusDetail"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:ControlParameter ControlID="ddlMS" PropertyName="SelectedValue" Name="measstatusID"  DbType="Int32"  />
		</SelectParameters>
	</asp:SqlDataSource>

</asp:Content>