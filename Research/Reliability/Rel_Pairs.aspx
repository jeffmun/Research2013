<%@ Page Language="C#" Debug="true" EnableEventValidation="false" AutoEventWireup="true"  MasterPageFile="~/UWAC.master" CodeFile="Rel_Pairs.aspx.cs" Title="Reliabilty - Coder Pairs" Inherits="Reliability_Rel_Pairs" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<%--<asp:ContentPlaceHolder id="PlaceHolderAdditionalPageHead" runat="server">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
</asp:ContentPlaceHolder>--%>




	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
   

<%--<script language="javascript" type="text/javascript">
	$(document).ready(function () {
		//For navigating using left and right arrow of the keyboard
		var gridview = $("#gv_Randomization_Tadpole");
		$.keynavigation(gridview);
	});
</script>--%>


<br />    
<asp:Label ID="Label1" runat="server" Text="Reliability Tracking: Coder Pairs" Font-Bold="true" Font-Size="Medium"></asp:Label>
<br />
<asp:Literal ID="myinfo" runat="server" Text=""  ></asp:Literal>
<br />

<asp:UpdatePanel ID="UpdatePanel_Overview" runat="server"   UpdateMode="Conditional" ChildrenAsTriggers="true" >
	<ContentTemplate>
	<asp:Label ID="jminfo" runat="server" Text="" Visible="true" Font-Size="Smaller"></asp:Label>
		<br />
	<asp:Label ID="lbl_StudyName" runat="server" Text="" Visible="true" Font-Size="Large" ForeColor="Navy" Font-Bold="true"></asp:Label>
		<br /><br />
	<asp:GridView ID="gv_measures" runat="server" Visible="true" AutoGenerateColumns="false" AutoGenerateEditButton="false"  EnableViewState="true" 
		OnRowDataBound="gv_measures_RowDataBound" OnRowCommand ="gv_measures_RowCommand" >      
	<Columns>

		

	<asp:TemplateField ItemStyle-HorizontalAlign="Center">       
		<HeaderTemplate><asp:Label ID="Label57b1" runat="server" Text="MeasureID"/></HeaderTemplate>
		<ItemTemplate>
			<asp:Label ID="lblMeasureID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "measureID") %>'  Font-Size="Medium"  CssClass="gvBlack"/>
		</ItemTemplate>      
	</asp:TemplateField>

	<asp:TemplateField ItemStyle-HorizontalAlign="Center">       
		<HeaderTemplate><asp:Label ID="Label57b" runat="server" Text="Measure"/></HeaderTemplate>
		<ItemTemplate>
			<asp:Label ID="lblMeasname" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "measname") %>'  Font-Size="Medium"  CssClass="gvBlack"/>
		</ItemTemplate>      

	</asp:TemplateField>

			<asp:TemplateField ItemStyle-HorizontalAlign="Center">       
		<HeaderTemplate><asp:Label ID="lblAdminErr" runat="server" Text="# cases with<br/>Admin Errors"/></HeaderTemplate>
		<ItemTemplate>
			<asp:Label ID="lbln_cases_with_adminerr" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_cases_with_adminerr") %>'  Font-Size="Medium"  CssClass="gvBlack"/>
		</ItemTemplate>      

	</asp:TemplateField>

	<asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="Label57c" runat="server" Text="Pct Coded"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label58c" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Pct_Coded") %>'  Font-Size="Medium"  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	
	
	<asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="lblPct1_GTE80_text_header" runat="server" Text="Pct of cases with<br/>80+% item agreement"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="lblPct1_GTE80_text" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Pct1_GTE80_text") %>'  Font-Size="Medium"  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
		
	<asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="Label44alg" runat="server" Text="Pct of cases with<br/>80+% item agreement<br/>(ALGORITHM items)"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label45alg" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Pct1_GTE80_text_alg") %>'  Font-Size="Medium"  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>


	<asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="Label57c" runat="server" Text="View<br/>Summary"/></HeaderTemplate>
		<ItemTemplate>
			<asp:Button ID="btnGetMeasureDetails" runat="server" Text="Summary" CommandName="measure_details" 
				CommandArgument='<%# DataBinder.Eval(Container.DataItem, "measureID") %>' AutoPostback="true" Font-Size="X-Small" /></ItemTemplate>
			</asp:TemplateField>

			<asp:TemplateField ItemStyle-HorizontalAlign="Center">       <HeaderTemplate><asp:Label ID="Label57d" runat="server" Text="View Coder Pairs"/></HeaderTemplate>
		<ItemTemplate>
			<asp:Button ID="btnGetCoderPairs" runat="server" Text="Coder pairs" CommandName="coder_pairs" 
				CommandArgument='<%# DataBinder.Eval(Container.DataItem, "measureID") %>' AutoPostback="true" Font-Size="X-Small" /></ItemTemplate>
	</asp:TemplateField>

	<asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Data<br/>last updated">     
		<ItemTemplate><asp:Label ID="lbl_time3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "data_lastupdated") %>'  Font-Size="X-Small"  CssClass="gvBlack"/>
		</ItemTemplate>      
		</asp:TemplateField>
	<asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Coder pairs<br/>last processed">     
		<ItemTemplate><asp:Label ID="lbl_time2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoderPair_last_processed") %>'  Font-Size="X-Small"  CssClass="gvBlack"/>
			<asp:Button ID="btnUpdateMeasureStats" runat="server" Text="Update" CommandName="update_measure_stats" Visible="false" 
					CommandArgument='<%# DataBinder.Eval(Container.DataItem, "measureID") %>' AutoPostback="true" Font-Size="X-Small" />
		</ItemTemplate>      </asp:TemplateField>

	</Columns>
	</asp:GridView>
	
	</ContentTemplate>
	<Triggers>
	</Triggers>


</asp:UpdatePanel>
<br /><br />


			<br />
			<br />
		<asp:Label ID="lblMeasName" runat="server" Text = "" font-size="Large"  font-bold="true" Forecolor="Navy"></asp:Label><br />
			<br />
			<br />




<asp:UpdatePanel ID="UpdatePanel_coderpairs_list" runat="server"  Visible="false" UpdateMode="Conditional" ChildrenAsTriggers="true"  >
	
		<ContentTemplate>

		<asp:Label ID="Label4coderpairs" runat="server" Text = "List of individual coder pairs" font-size="Medium" Font-Underline="true" font-bold="true" Forecolor="Navy"></asp:Label>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label8" runat="server" Text = "Select groups view:" font-size="X-Small" Font-Underline="false" font-bold="false" Forecolor="Navy"></asp:Label>
			<select id="selGroups" runat="server" multiple="true" style="width:200px" class="select2class" ></select>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" Visible="true" Font-Size="XX-Small"   /> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:CheckBox id="chk_ShowNA" runat="server" Text ="Include cases where REL status is N/A"></asp:CheckBox>

			<br />

			<%--coderpairs_list--%>
			<asp:GridView ID="gv_coderpairs_list" runat="server" DataSourceID="" AutoGenerateColumns="false" AutoGenerateEditButton="false"
				OnRowDataBound="gv_coderpairs_list_RowDataBound" OnRowCommand="gv_coderpairs_list_RowCommand" EnableViewState="true" 
				AllowSorting="true" OnSorting="gv_coderpairs_list_Sorting" >
				<Columns>
					<asp:TemplateField HeaderText="Group Name" SortExpression="GroupName">
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "GroupName") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label46" runat="server" Text="View<br/>Details" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Button ID="btnGetCoderDetails" runat="server" Text="Details" CommandName="coderpair_details" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "sql_getdetails") %>' AutoPostback="true" Font-Size="X-Small" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center" SortExpression="ID">
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="idx num" ItemStyle-HorizontalAlign="Center" SortExpression="orig_indexnum">
						<ItemTemplate>
							<asp:Label ID="Label9z" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_indexnum") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField  HeaderText="# SCORES" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label5scores" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items2" , "{0:f0}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField  HeaderText="# DISCRETE<br/>ITEMS" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label5discrete" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items3" , "{0:f0}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField  HeaderText="# ITEMS" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items1") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="# Admin<br/>Errors<br/>ITEMS" ItemStyle-HorizontalAlign="Center" SortExpression="n_adminerr">
						<ItemTemplate>
							<asp:Label ID="Label3adminerr" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_adminerr") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField HeaderText="% agree across<br/>ITEMS" ItemStyle-HorizontalAlign="Center" SortExpression="pctagree_items1">
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pctagree_items1", "{0:f1}") %>' CssClass="gvBlue"  /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Avg % diff across<br/>SCORES" ItemStyle-HorizontalAlign="Center" SortExpression="avg_items2_pctdiff">
						<ItemTemplate>
							<asp:Label ID="Label3zz" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "avg_items2_pctdiff", "{0:f1}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Avg % similar across<br/>SCORES" ItemStyle-HorizontalAlign="Center" SortExpression="avg_items2_pctagree">
						<ItemTemplate>
							<asp:Label ID="Label3zzz" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "avg_items2_pctagree", "{0:f1}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField ItemStyle-HorizontalAlign="Center">
						<HeaderTemplate>
							<asp:Label ID="Label39" runat="server" Text="# ALG<br/>ITEMS" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label41" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items_alg") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="% agree across<br/>ALG ITEMS" ItemStyle-HorizontalAlign="Center" SortExpression="pctagree_alg">
						<ItemTemplate>
							<asp:Label ID="Label38" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pctagree_alg", "{0:f1}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField HeaderText="Study Meas Name" SortExpression ="StudyMeasName">
						<HeaderTemplate>
							<asp:Label ID="Label10" runat="server" Text="Study Meas Name" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label11" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StudyMeasName") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label12_sms" runat="server" Text="Meas Status" /></HeaderTemplate>
						<ItemTemplate>
							<asp:HyperLink ID="Hyperlink_sms" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "sms_URL") %>'
								Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatus") %>' />
						</ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label14" runat="server" Text="Meas Status Detail" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label15" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatusDetail") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Orig Clin" ItemStyle-HorizontalAlign="Center" SortExpression="orig_clin">
						<ItemTemplate>
							<asp:Label ID="Label17" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_clin") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Orig Coder" ItemStyle-HorizontalAlign="Center" SortExpression="orig_coder">
						<ItemTemplate>
							<asp:Label ID="Label17aa" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_coder") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Measure Date Done" SortExpression="MeasureDateDone">
						<ItemTemplate>
							<asp:Label ID="Label17a" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasureDateDone", "{0:d}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label18" runat="server" Text="Data status" /></HeaderTemplate>
						<ItemTemplate>
							<asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "DataEntryURL") %>'
								Text='<%# DataBinder.Eval(Container.DataItem, "sms_dd_status") %>' />
						</ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField Visible="false">
						<HeaderTemplate>
							<asp:Label ID="Label19" runat="server" Text="Reliability StudyMeas ID" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label20" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ReliabilityStudyMeasID") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Study Meas Name REL"  ItemStyle-BackColor="Gainsboro" SortExpression ="StudyMeasName_REL">
						<ItemTemplate>
							<asp:Label ID="Label22" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StudyMeasName_REL") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField  ItemStyle-BackColor="Gainsboro">
						<HeaderTemplate>
							<asp:Label ID="Label_sms_REL" runat="server" Text="Meas Status REL" /></HeaderTemplate>
						<ItemTemplate>
							<asp:HyperLink ID="Hyperlink_sms_REL" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "sms_REL_URL") %>'
								Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatus_REL") %>' />
						</ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField ItemStyle-BackColor="Gainsboro">
						<HeaderTemplate>
							<asp:Label ID="Label25" runat="server" Text="Meas Status Detail REL" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label26" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatusDetail_REL") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="REL Coder" ItemStyle-HorizontalAlign="Center"  ItemStyle-BackColor="Gainsboro" SortExpression="rel_coder">
						<ItemTemplate>
							<asp:Label ID="Label17c" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rel_coder") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Measure Date Done REL" SortExpression="MeasureDateDone" ItemStyle-BackColor="Gainsboro">
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasureDateDone", "{0:d}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label27" runat="server" Text="Data status REL" /></HeaderTemplate>
						<ItemTemplate>
							<asp:HyperLink ID="Hyperlink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "DataEntryURL_REL") %>'
								Text='<%# DataBinder.Eval(Container.DataItem, "sms_dd_status_REL") %>' />
						</ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label28" runat="server" Text="Coder Site" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label29" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoderSite") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<%--        BackColor='<%# DataBinder.Eval(Container.DataItem, "sms_dd_color") %>' 
					--%>
					<%--<asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_DataEntryURL_REL" runat="server" Text="DataEntryURL_REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblDataEntryURL_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DataEntryURL_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
					--%>

					<asp:TemplateField Visible="false">
						<HeaderTemplate>
							<asp:Label ID="Label30" runat="server" Text="studymeasID" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label31" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeasID") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField Visible="false">
						<HeaderTemplate>
							<asp:Label ID="Label32" runat="server" Text="studymeasID_REL" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label33" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeasID_REL") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField Visible="false">
						<HeaderTemplate>
							<asp:Label ID="Label34" runat="server" Text="studymeassubjID" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label35" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeassubjID") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField Visible="false">
						<HeaderTemplate>
							<asp:Label ID="Label36" runat="server" Text="studymeassubjID_REL" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label37" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeassubjID_REL") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>




		</ContentTemplate>
		<Triggers>
		<asp:AsyncPostBackTrigger ControlID="gv_coderpairs_list" EventName="Sorting" />
		</Triggers>

		</asp:UpdatePanel>
<br />
<br />

	<asp:UpdatePanel ID="UpdatePanel_coderpair_single" runat="server" visible="false"  UpdateMode="Conditional" >
<ContentTemplate>
	
   <asp:Button ID="btnShowAll" runat="server" Text="Back to full list" OnClick="btnShowAll_Click" Visible="true"   /> 
	 <br /> <br />

	<asp:Label ID="lbl_items1" runat="server" Text="Item Agreement" Font-Size="Small" Font-Bold="true"/><br />

<asp:GridView ID="gv_coderpair_details0" runat="server" Visible="true" AutoGenerateColumns="false" AutoGenerateEditButton="false"   OnRowDataBound="gv_coderpair_detail_RowDataBound" >      
	<Columns>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label47" runat="server" Text="ID"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label48" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label49" runat="server" Text="Var"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "var") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label51" runat="server" Text="Var Label"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label52" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "varlabel") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label53" runat="server" Text="Orig<br/>Value"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label54" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_val") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label55" runat="server" Text="Rel<br/>Value"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label56" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rel_val") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>

	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label77" runat="server" Text="Match<br/>Status"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label78" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "match_text") %>'  /></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label87" runat="server" Text="Match<br/>Condition"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label88" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rat_desc") %>'  /></ItemTemplate>      </asp:TemplateField>

	</Columns>
	</asp:GridView> 
	
	<br /><br />
	<asp:Label ID="Label42" runat="server" Text="Score Agreement" Font-Size="Small" Font-Bold="true"/><br />

	<asp:GridView ID="gv_coderpair_details1" runat="server"  AutoGenerateColumns="false" AutoGenerateEditButton="false"  EnableViewState="true" OnRowDataBound="gv_coderpair_detail_RowDataBound" >      
	<Columns>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label57" runat="server" Text="ID"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label58" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label59" runat="server" Text="Var"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label60" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "var") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label61" runat="server" Text="Var Label"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label62" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "varlabel") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label63" runat="server" Text="Orig<br/>Value"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label64" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_val") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label65" runat="server" Text="Rel<br/>Value"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label66" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rel_val") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label79" runat="server" Text="Match<br/>Status"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label80" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "match_text") %>'  /></ItemTemplate>      </asp:TemplateField>

	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label85" runat="server" Text="Match<br/>Condition"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label86" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rat_desc") %>'  /></ItemTemplate>      </asp:TemplateField>

	</Columns>
	</asp:GridView> 
	<br/>

<br />
		<asp:Label ID="Label43" runat="server" Text="Discrete Item Agreement" Font-Size="Small" Font-Bold="true"/><br />

	<asp:GridView ID="gv_coderpair_details2" runat="server" Visible="true" AutoGenerateColumns="false" AutoGenerateEditButton="false"   OnRowDataBound="gv_coderpair_detail_RowDataBound" >      
	<Columns>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label67" runat="server" Text="ID"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label68" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label69" runat="server" Text="Var"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label70" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "var") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label71" runat="server" Text="Var Label"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label72" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "varlabel") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label73" runat="server" Text="Orig<br/>Value"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label74" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_val") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label75" runat="server" Text="Rel<br/>Value"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label76" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rel_val") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label81" runat="server" Text="Match<br/>Status"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label82" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "match_text") %>'  /></ItemTemplate>      </asp:TemplateField>
	<asp:TemplateField>       <HeaderTemplate><asp:Label ID="Label83" runat="server" Text="Match<br/>Condition"/></HeaderTemplate>
		<ItemTemplate><asp:Label ID="Label84" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rat_desc") %>'  /></ItemTemplate>      </asp:TemplateField>

	</Columns>
	</asp:GridView> 

  </ContentTemplate>

		<Triggers>
					<asp:AsyncPostBackTrigger ControlID="btnShowAll" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
		</Triggers>
	</asp:UpdatePanel>

	<script type="text/javascript">

		function pageLoad(sender, args) {
			$(".select2class").select2();
		}

	</script>

	
	<br />



	<br />



</asp:Content>