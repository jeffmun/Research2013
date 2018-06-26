<%@ Page Language="C#" Debug="true" EnableEventValidation="false" AutoEventWireup="true"  MasterPageFile="~/UWAC.master" CodeFile="Rel_Tracking.aspx.cs" 
	Title="Reliabilty Tracking" Inherits="Reliability_Rel_Tracking" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<%--<asp:ContentPlaceHolder id="PlaceHolderAdditionalPageHead" runat="server">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
</asp:ContentPlaceHolder>--%>




	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" EnableViewState="true" ViewStateMode="Disabled" ></asp:ScriptManager>
   
	<%--Load javascript libraries needed for the charts--%>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery.plugin.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/Scripts/highcharts/4.2.0/highcharts.js"></script>



	<%--<asp:Timer runat="server" ID="Timer1" Interval="1000" Enabled="false" ontick="Timer1_Tick" />--%>

<%--<script language="javascript" type="text/javascript">
	$(document).ready(function () {
		//For navigating using left and right arrow of the keyboard
		var gridview = $("#gv_Randomization_Tadpole");
		$.keynavigation(gridview);
	});
</script>--%>


<br />    
<asp:Label ID="Label1" runat="server" Text="Reliability Tracking: Summary Statistics" Font-Bold="true" Font-Size="Medium"></asp:Label>
<br />
<asp:Literal ID="myinfo" runat="server" Text=""  ></asp:Literal>
<br />
		<table>
		<tr>
			<td>
				<asp:UpdatePanel ID="UpdatePanel_Overview" runat="server"   UpdateMode="Conditional" ChildrenAsTriggers="true" EnableViewState="true" >
					<ContentTemplate>
					<asp:Label ID="jminfo" runat="server" Text="" Visible="true" Font-Size="Smaller"></asp:Label>
						<br />
					<asp:Label ID="lbl_StudyName" runat="server" Text="" Visible="true" Font-Size="Large" ForeColor="Navy" Font-Bold="true"></asp:Label>
						<br /><br />
						<asp:CheckBox id="chk_ShowNA" runat="server" Text ="Include cases where REL status is N/A"></asp:CheckBox>
						<br />


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
							<asp:Button ID="btnGetMeasureDetail" runat="server" Text="Summary" CommandName="measure_summary" 
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
									CommandArgument='<%# DataBinder.Eval(Container.DataItem, "measureID") %>' AutoPostback="false" Font-Size="X-Small" />
						</ItemTemplate>      </asp:TemplateField>

					</Columns>
					</asp:GridView>

			
	
					</ContentTemplate>
					<Triggers>
		
					</Triggers>




				</asp:UpdatePanel>
			</td>
			<td style="vertical-align:top">
				<br /><br /><br /><br />
				<asp:UpdatePanel ID="UpdatePanel_Progress" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="true" >
					<ContentTemplate>
						<asp:Label ID="lblProgress" runat="server"  ></asp:Label>
					</ContentTemplate>

				</asp:UpdatePanel>
				
			</td>
		</tr>
	</table>
<br /><br />



<asp:UpdatePanel ID="UpdatePanel_ICC" runat="server" Visible="false"  UpdateMode="Conditional" ChildrenAsTriggers="true"  >
	
		<ContentTemplate>
			<asp:Label ID="lblPctCoded" runat="server" font-size="Medium" font-bold="true" Forecolor="Navy"></asp:Label>
			<br />
			<asp:Label ID="lblinfo" runat="server" font-size="X-Small" font-bold="false" Forecolor="Navy"></asp:Label>


			<br/> 
			<asp:Label ID="Label12" runat="server" Text = "Pct Agreement by Subscale" font-size="Small" font-bold="true" Forecolor="Navy"></asp:Label>
			<br/>

			<%--Pct Agree--%>
			<asp:GridView ID="gv_PctAgree_by_subscale" runat="server" DataSourceID="" AutoGenerateColumns="false" AutoGenerateEditButton="false" EnableViewState="true" EmptyDataText="No item subscales defined.">

				<Columns>

					<asp:TemplateField HeaderText="Subscale">
						<ItemTemplate><asp:Label ID="Label13" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subscale") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# Coder Pairs" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label6" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_coderpairs") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# Items" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Avg Pct<br/>Agreement"  ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label21" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "avg_pct_agree", "{0:f1}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Min Pct<br/>Agreement"  ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label23" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "min_pct_agree", "{0:f1}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Max Pct<br/>Agreement" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label24" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "max_pct_agree", "{0:f1}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# of coder pairs<br/>>= 80%" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label44" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NGTE80" ) %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="% of coder pairs<br/>>= 80%" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="Label40" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pctGTE80", "{0:f1}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>


				</Columns>

			</asp:GridView>


			<br/> 
<%--            <asp:Label ID="Label8" runat="server" Text = "Intraclass Correlation for Scores" font-size="Small" font-bold="true" Forecolor="Navy"></asp:Label>
			&nbsp;&nbsp;&nbsp;
			<asp:HyperLink ID="hyp1" runat="server" Text="Click here for R code creating ICC, Kappa & plots" NavigateUrl="http://faculty.washington.edu/jeffmun/R/jm_ICC.R" ForeColor="Gray"></asp:HyperLink>--%>


			<br/> 
			<br/> 
			<asp:Label ID="Label4" runat="server" Text = "Intraclass Correlation for Scores" font-size="Small" font-bold="true" Forecolor="Navy"></asp:Label>

			<%--ICC--%>
								   

			<asp:GridView ID="gv_icc" runat="server" DataSourceID="" AutoGenerateColumns="false" AutoGenerateEditButton="false"
				EnableViewState="true">

				<Columns>
<%--                    <asp:TemplateField>
						<HeaderTemplate>
							<asp:Label ID="Label6" runat="server" Text="Measure" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "measureID") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>--%>
					<asp:TemplateField HeaderText="Variable" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a1a" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "variable") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Label" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "varlabel") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="Pearson r" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label_pearson_r" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "r", "{0:f3}") %>'  CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Pearson p" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label_pearson_p" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "p", "{0:f4}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>


					<asp:TemplateField HeaderText="ICC (type2)" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ICC", "{0:f3}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="F" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ICC_F", "{0:f2}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="df1" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ICC_df1") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField  HeaderText="df2" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ICC_df2") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="p value" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label7a3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ICC_p", "{0:f4}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Last Run" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:Label ID="Label12q" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lastrun") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
			
			<br/> 
			


			</ContentTemplate>
		</asp:UpdatePanel>

<%--PLOTS--%>
<asp:UpdatePanel ID="UpdatePanel_plotsX" runat="server" UpdateMode="Conditional"    >
				<ContentTemplate>
<%--<asp:Label ID="lblChrome" runat="server" Text="Plots may not be visible with IE.  Try Chrome. (sorry!)" Font-Size="XX-Small"></asp:Label><br />--%>
<%--<table>


	<tr>
		<td align="center"> <asp:Image ID="Image0" runat="server"  /> <asp:Image ID="Image0big" runat="server"  /> <br/> <asp:Button ID="btnImg0" runat="server" Visible="false" Text="grow #1" BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="0" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image1" runat="server"  /> <asp:Image ID="Image1big" runat="server"  /> <br/> <asp:Button ID="btnImg1" runat="server" Visible="false" Text="grow #2" BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="1" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image2" runat="server"  /> <asp:Image ID="Image2big" runat="server"  /> <br/> <asp:Button ID="btnImg2" runat="server" Visible="false" Text="grow #3" BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="2" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image3" runat="server"  /> <asp:Image ID="Image3big" runat="server"  /> <br/> <asp:Button ID="btnImg3" runat="server" Visible="false" Text="grow #4" BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="3" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image4" runat="server"  /> <asp:Image ID="Image4big" runat="server"  /> <br/> <asp:Button ID="btnImg4" runat="server" Visible="false" Text="grow #5" BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="4" Font-Size="XX-Small"   /> </td>

	</tr>
	<tr>
		<td align="center"> <asp:Image ID="Image5" runat="server"  /> <asp:Image ID="Image5big" runat="server"  /> <br/> <asp:Button ID="btnImg5" runat="server" Visible="false" Text="grow #6"  BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="5" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image6" runat="server"  /> <asp:Image ID="Image6big" runat="server"  /> <br/> <asp:Button ID="btnImg6" runat="server" Visible="false" Text="grow #7"  BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="6" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image7" runat="server"  /> <asp:Image ID="Image7big" runat="server"  /> <br/> <asp:Button ID="btnImg7" runat="server" Visible="false" Text="grow #8"  BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="7" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image8" runat="server"  /> <asp:Image ID="Image8big" runat="server"  /> <br/> <asp:Button ID="btnImg8" runat="server" Visible="false" Text="grow #9"  BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="8" Font-Size="XX-Small"   /> </td>
		<td align="center"> <asp:Image ID="Image9" runat="server"  /> <asp:Image ID="Image9big" runat="server"  /> <br/> <asp:Button ID="btnImg9" runat="server" Visible="false" Text="grow #10" BackColor="#FFFFFF" BorderStyle="Solid" BorderColor="WhiteSmoke" ForeColor="#CCCCCC" OnCommand="btnImage_click" CommandName="toggle_size" CommandArgument="9" Font-Size="XX-Small"   /> </td>

	</tr>
		
</table>--%>

	  


			</ContentTemplate>
		<Triggers>
<%--        <asp:AsyncPostBackTrigger ControlID="btnImg0" />
		<asp:AsyncPostBackTrigger ControlID="btnImg1" />
		<asp:AsyncPostBackTrigger ControlID="btnImg2" />
		<asp:AsyncPostBackTrigger ControlID="btnImg3" />
		<asp:AsyncPostBackTrigger ControlID="btnImg4" />
		<asp:AsyncPostBackTrigger ControlID="btnImg5" />
		<asp:AsyncPostBackTrigger ControlID="btnImg6" />
		<asp:AsyncPostBackTrigger ControlID="btnImg7" />
		<asp:AsyncPostBackTrigger ControlID="btnImg8" />
		<asp:AsyncPostBackTrigger ControlID="btnImg9" />--%>
	</Triggers>
			</asp:UpdatePanel>
<%--            <asp:PlaceHolder ID="PlaceHolder_plots" runat="server" EnableViewState="true"></asp:PlaceHolder>--%>
			<br />
 
	<asp:Panel ID="UpdatePanel_plots" runat="server"></asp:Panel>


<%----KAPPA----%>
<asp:UpdatePanel ID="UpdatePanel_Kappa" runat="server" Visible="true"  UpdateMode="Conditional"  ChildrenAsTriggers="true" >
	<ContentTemplate>
		
		<asp:Label ID="Label45x" runat="server" Text = "Cohen's Kappa for Discrete Variables" font-size="Small" font-bold="true" Forecolor="Navy"></asp:Label><br />

				  <asp:GridView ID="GridView_Kappa" runat="server" DataSourceID="" AutoGenerateColumns="false" AutoGenerateEditButton="false" 
					  EnableViewState="true" EmptyDataText="No discrete items defined.">

				<Columns>


					<asp:TemplateField HeaderText="Variable">
						<ItemTemplate><asp:Label ID="kLabel13" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "variable") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Label" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel6" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "varlabel") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# Subjects" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel16" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_subjects") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# Raters"  ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel21" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_raters" ) %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Kappa"  ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel23" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Kappa", "{0:f3}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Z" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel24" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Z", "{0:f3}") %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="p value" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel44" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pvalue", "{0:f4}" ) %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Last run" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate><asp:Label ID="kLabel40" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LastRun" ) %>' CssClass="gvBlack" /></ItemTemplate>
					</asp:TemplateField>


				</Columns>

			</asp:GridView>


		<div id="divKappa" runat="server" class="xt_"></div>

	</ContentTemplate>
</asp:UpdatePanel>
			<br />
			<br />

<asp:Panel ID="panel_testICC" runat="server" ></asp:Panel>

			<br />
			<br />

<asp:UpdatePanel ID="UpdatePanel_coderpairs_list" runat="server"  Visible="false" UpdateMode="Conditional" ChildrenAsTriggers="true"  >
	
		<ContentTemplate>

		<asp:Label ID="Label4coderpairs" runat="server" Text = "List of individual coder pairs" font-size="Medium" Font-Underline="true" font-bold="true" Forecolor="Navy"></asp:Label>


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


<%--                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
						<HeaderTemplate>
							<asp:Label ID="Label42" runat="server" Text="# DISCRETE<br/>ITEMS" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label43" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items3") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField ItemStyle-HorizontalAlign="Center">
						<HeaderTemplate>
							<asp:Label ID="Label44" runat="server" Text="% agree across<br/>DISCRETE ITEMS" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label45" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "pctagree_items3", "{0:f1}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField ItemStyle-HorizontalAlign="Center">
						<HeaderTemplate>
							<asp:Label ID="Label38" runat="server" Text="# SCORES" /></HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="Label39" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "n_items2") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="% agree across SCORES" ItemStyle-HorizontalAlign="Center"  SortExpression="pctagree_items2">
						<ItemTemplate>
							<asp:Label ID="Label3a" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pctagree_items2", "{0:f1}") %>' CssClass="gvBlue" /></ItemTemplate>
					</asp:TemplateField>--%>


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

					<asp:TemplateField HeaderText="Meas Clin" ItemStyle-HorizontalAlign="Center" SortExpression="orig_clin">
						<ItemTemplate>
							<asp:Label ID="Label17" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orig_clin") %>' CssClass="gvBlack" /></ItemTemplate>
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

					<asp:TemplateField HeaderText="Meas Clin REL" ItemStyle-HorizontalAlign="Center"  ItemStyle-BackColor="Gainsboro" SortExpression="rel_clin">
						<ItemTemplate>
							<asp:Label ID="Label17b" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rel_clin") %>' CssClass="gvBlack" /></ItemTemplate>
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

<asp:GridView ID="gv_coderpair_details1" runat="server" Visible="true" AutoGenerateColumns="false" AutoGenerateEditButton="false"   OnRowDataBound="gv_coderpair_detail_RowDataBound" >      
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

	<asp:GridView ID="gv_coderpair_details2" runat="server"  AutoGenerateColumns="false" AutoGenerateEditButton="false"  EnableViewState="true" OnRowDataBound="gv_coderpair_detail_RowDataBound" >      
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

	<asp:GridView ID="gv_coderpair_details3" runat="server" Visible="true" AutoGenerateColumns="false" AutoGenerateEditButton="false"   OnRowDataBound="gv_coderpair_detail_RowDataBound" >      
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
		</Triggers>
	</asp:UpdatePanel>




	<br />



	<br />



</asp:Content>