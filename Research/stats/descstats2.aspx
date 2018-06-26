<%@ Page Title="DescStats" Language="C#" Debug="true" EnableEventValidation="false" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="descstats2.aspx.cs" Inherits="stats_descstats2" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<%--    TODO:
 <br/>  Discrete vars
 <br/>  Google charts, Distibution plots
 <br/>  define grouping var for meas collected more than 1x per timepoint
 <br/>  Correlation matrices? ANOVA?
<br/>--%>

<%-- ToDo: display just the 1 per timepoint measures (Optionally display those collected repeatedly within a timepoint)<br />--%>


	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

<%--        <script type="text/javascript" src="<% =Request.ApplicationPath %>/js/checkbox.js"></script>--%>

	<style type="text/css">
		
.container{
	width:100px;
	height:20px;
	position:relative;
}

.graph, .datavalue{
	width:100%;
	height:100%;
	top:0;
	left:0;
	/*position:absolute;  /* for making 2 div overlap */
	text-align:right;
	color:black;
	font-weight:bold;
}

.graph{
	width:95%; /* same look as in Excel */
}
.datavalue{
	z-index:10; /* Place on top of graph div*/
}

.databar {
	background-image:url('~/images/yellow.png');
	background-repeat:repeat-y;
	background-position:right center;
	height:96%;
	background-color:rgb(16,145,240);
}

	</style>

<%--    from: https://gist.github.com/battlehorse/1333906--%>
		<script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/rgbcolor.js"></script> 
	<script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/canvg.js"></script>
	<script>
	  function getImgData(chartContainer) {
		var chartArea = chartContainer.getElementsByTagName('iframe')[0].
		  contentDocument.getElementById('chartArea');
		var svg = chartArea.innerHTML;
		var doc = chartContainer.ownerDocument;
		var canvas = doc.createElement('canvas');
		canvas.setAttribute('width', chartArea.offsetWidth);
		canvas.setAttribute('height', chartArea.offsetHeight);
		
		
		canvas.setAttribute(
			'style',
			'position: absolute; ' +
			'top: ' + (-chartArea.offsetHeight * 2) + 'px;' +
			'left: ' + (-chartArea.offsetWidth * 2) + 'px;');
		doc.body.appendChild(canvas);
		canvg(canvas, svg);
		var imgData = canvas.toDataURL("image/png");
		canvas.parentNode.removeChild(canvas);
		return imgData;
	  }
	  
	  function saveAsImg(chartContainer) {
		var imgData = getImgData(chartContainer);
		
		// Replacing the mime-type will force the browser to trigger a download
		// rather than displaying the image in the browser window.
		window.location = imgData.replace("image/png", "image/octet-stream");
	  }
	  
	  function toImg(chartContainer, imgContainer) { 
		var doc = chartContainer.ownerDocument;
		var img = doc.createElement('img');
		img.src = getImgData(chartContainer);
		
		while (imgContainer.firstChild) {
		  imgContainer.removeChild(imgContainer.firstChild);
		}
		imgContainer.appendChild(img);
	  }
	</script>

		<div id="img_div" style="position: fixed; top: 0; right: 0; z-index: 10; border: 1px solid #b9b9b9">
	  Image will be placed here
	</div>

	<button onclick="saveAsImg(document.getElementById('foo12'));">Save as PNG Image</button>
	<button onclick="toImg(document.getElementById('pie_div'), document.getElementById('img_div'));">Convert to image</button>
	<div id="pie_div"></div>


<%--    <script type="text/javascript">
		$(function () {
			$("#Panel_Controls").click(function () { $(this).hide(3000); });
			$("#btnCOUNT").click(function () { $("#Panel_Controls").show(); });
		})
	</script>--%>






	<asp:Label ID="Label1" runat="server" Text="Data Viewer:" Font-Size="10pt" Font-Bold="true" ></asp:Label>&nbsp;&nbsp;&nbsp;
	<asp:Label ID="lblStudyName" runat="server" Text="Data Viewer" Font-Size="12pt" Font-Bold="true" ForeColor="Navy" ></asp:Label>
	<br />
	<asp:Label ID="lblInfo" runat="server" ></asp:Label>    
<%--    <asp:Label ID="lblCount" runat="server" ></asp:Label>    

		<br />

	<script type="text/javascript">
		function Validate() {
			if (1==1)
				return true;
			return false;
		}
	</script>
	<asp:Button ID="btnCOUNT" runat="server" Text="Count Checks"  Font-Size="8pt"  />--%>
	
	<br />
	<br />

	
<%--<script type="text/javascript">
	$(function () {
		$("##ctl00$oBodyPlaceHolder$btnX2").click(function () { $("#oBodyPlaceHolder_Panel_Measures").fade(1000); $("#oBodyPlaceHolder_Panel_descstats").show(2000); });
		$("#btnCOUNT").click(function () { $("#oBodyPlaceHolder_Panel_Measures").show(); });


	})
</script>--%>

	<asp:Button ID="btnExportPDF" runat="server" Text="PDF"  OnClick="btnExportPDF_Click" />
	<asp:Panel ID="Panel1" runat="server"></asp:Panel>

	<table>
		<tr>
			<td>
				<asp:Button ID="btnReset" runat="server" Text="Reset Page"  OnClick="btnReset_Click" Font-Size="8pt" />
			</td>
			<td width="20px">
				
			</td>
			<td colspan="2">
				<asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="12pt"></asp:Label>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="vertical-align:top">
				<asp:HiddenField ID="hid_nSubj" runat="server"/>
				<asp:HiddenField ID="hid_nMeas" runat="server"/>
				<asp:GridView ID="gvSubjects" runat="server" OnRowDataBound="gvSubjects_RowDataBound" ></asp:GridView>
			</td>
			<td width="20px">
				
			</td>
			<td  style="vertical-align:top">   
			
			<asp:Panel ID="Panel_Controls" runat="server" Visible="false">
				<table>
					<tr>
						<td colspan="4">
							<asp:Label ID="lblDescStats" runat="server" Text="Descriptive Stats:" Font-Bold="true" Visible="false"  ></asp:Label>
							<asp:Button ID="btnGetStats" runat="server" Text="Descriptive Stats" OnClick="btnGetStats_Click"  ForeColor="ForestGreen" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Button ID="btnShowData" runat="server" Text="Show Data" OnClick="btnShowData_Click"   ForeColor="ForestGreen" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Label ID="Label2" runat="server" Text="Save Data To Excel:" Font-Bold="true" Visible="false"></asp:Label>
							<asp:Button ID="btnSaveToExcel" runat="server" Text="Data To Excel"  ForeColor="ForestGreen" OnClick="btnSaveToExcel_Click" />

							<asp:Button ID="testGetSubj" runat="server" Text="Test GetSubj" OnClick="testGetSubj_Click" Font-Size="9pt" Visible="false" />

						</td>


					</tr>
					<tr>
						<td>
							<asp:Label ID="lbl_rbl1" runat="server" Text="Level 1" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:RadioButtonList ID="rbl1" runat="server" RepeatDirection="Vertical" ForeColor="ForestGreen">
							</asp:RadioButtonList>
						</td>
						<td>
							<asp:Label ID="lbl_rbl2" runat="server" Text="Level 2" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:RadioButtonList ID="rbl2" runat="server" RepeatDirection="Vertical" ForeColor="ForestGreen">
							</asp:RadioButtonList>
						</td>
						<td>
							<asp:Label ID="lbl_rbl3" runat="server" Text="Level 3" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:RadioButtonList ID="rbl3" runat="server" RepeatDirection="Vertical" ForeColor="ForestGreen">
							</asp:RadioButtonList>
						</td>
						<td>
							<asp:RadioButtonList ID="rbl_stackwide" runat="server" RepeatDirection="Horizontal" BorderColor="Silver" BorderStyle="Solid" Visible="false">
								<asp:ListItem Text="stacked" Value="stacked" Selected="True"></asp:ListItem>
								<asp:ListItem Text="wide" Value="wide"></asp:ListItem>
							</asp:RadioButtonList>
							<asp:Label ID="Label5" runat="server" Text="Place variables:" Font-Bold="true" Font-Underline="true" Font-Size="8pt" ForeColor="ForestGreen"></asp:Label>
							<asp:RadioButtonList ID="rbl_varsfirstlast" runat="server" RepeatDirection="Horizontal" ForeColor="ForestGreen">
								<asp:ListItem Text="first" Value="first" Selected="True"></asp:ListItem>
								<asp:ListItem Text="last" Value="last"></asp:ListItem>
							</asp:RadioButtonList>

						</td>

					</tr>
				</table>

			</asp:Panel>
 
			</td>
		</tr>
	</table>
	<br />


 
	<br />
	<table>
		<tr>
			<td style="vertical-align:top">
				<asp:Panel ID="Panel_Measures" runat="server" Visible="true">
					<asp:CheckBox ID="chkShowREL" runat="server" Text="Include Reliability measures" />
					<asp:GridView ID="gvMeasures" runat="server" OnRowDataBound="gvMeasures_RowDataBound" OnDataBound="gvMeasures_DataBound" EnableViewState="true"  ></asp:GridView>
				</asp:Panel>
			</td>
			<td style="vertical-align:top">
				<asp:Panel ID="Panel_Vars" runat="server" Visible="false">
					<%--<ContentTemplate>--%>

					<table>
						<tr>
							<td width="300px">
								<asp:Label ID="lbl_gvVars" runat="server" Font-Size="10pt" Font-Bold="true"></asp:Label>
							</td>
							<td width="200px">
								<asp:Button ID="btn_CancelVars" runat="server" Text="Cancel" Font-Size="8pt" OnCommand="btn_Command" CommandName="CancelVars" CommandArgument="CancelVars" />    
							</td>
							<td>
								<asp:Button ID="btn_UpdateVars" runat="server" Text="Update Vars" Font-Size="8pt" OnCommand="btn_Command" CommandName="UpdateVars"   />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
								<asp:Button ID="btn_UpdateDefaults" runat="server" Text="Update Defaults" Font-Size="8pt" OnCommand="btn_Command" CommandName="UpdateDefaults" ForeColor="Green" Visible="false"  />    

							</td>
						</tr>
						<tr>
							<td colspan="3">
								<asp:Label ID="lbl_instruct1" runat="server" Text="Select the vars you wish to include. 1 = Stats Continuous, 2 = Stats Discrete, 3 = No stats, but in data"
									Font-Size="7pt"></asp:Label>
							</td>
						</tr>
					</table>
				
					<br /><br />
					<asp:Label ID="Label4" runat="server" Text="Numeric variables" Font-Bold="true" ForeColor="Navy" Font-Size="9pt"></asp:Label>

					<asp:GridView ID="gvVars" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvVars_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1C" runat="server" Text="Stats Cont.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVar2" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar2_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar2" runat="server" Text =""   />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1D" runat="server" Text="Stats Disc.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVar3" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar3_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar3" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l4" runat="server" Text="In Data<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVar4" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar4_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar4" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="Var" DataField="fld" />
						<asp:BoundField HeaderText="Default InAnal" DataField="Default_InAnalysis"  Visible="true"/>
						<asp:BoundField HeaderText="Label" DataField="fieldlabel" />
						<asp:BoundField HeaderText="Value Labels" DataField="valuelabels" />
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="lblMV" runat="server" Text="Missing Values" Font-Size="7pt"></asp:Label>
							</HeaderTemplate>
							<ItemTemplate>
								<asp:TextBox ID="txtmissval" runat="server" Width="100px"  Text='<%#  DataBinder.Eval(Container.DataItem, "[missval]") %>'  Font-Size="7pt"
									 BorderColor="Thistle" BorderStyle="Solid" BorderWidth="1" />
							</ItemTemplate>
						</asp:TemplateField>




					</Columns>
				</asp:GridView>

					<br />
					<asp:Label ID="lblTxt" runat="server" Text="Text variables" Font-Bold="true" ForeColor="Navy" Font-Size="9pt"></asp:Label>
					<asp:GridView ID="gvVars_text" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvVarsT_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1C" runat="server" Text="Stats Cont.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarT2" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar2T_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar2" runat="server" Text ="" Visible="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1D" runat="server" Text="Stats Disc.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarT3" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar3T_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar3" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l4" runat="server" Text="In Data<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarT4" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar4T_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar4" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="Var" DataField="fld" />
						<asp:BoundField HeaderText="Default InAnal" DataField="Default_InAnalysis"  Visible="true"/>
						<asp:BoundField HeaderText="Label" DataField="fieldlabel" />

					</Columns>
				</asp:GridView>

				 <br />
					<asp:Label ID="Label3" runat="server" Text="Date variables" Font-Bold="true" ForeColor="Navy" Font-Size="9pt"></asp:Label>
					<asp:GridView ID="gvVars_date" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvVarsD_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1C" runat="server" Text="Stats Cont.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarD2" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar2D_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar2" runat="server" Text ="" Visible="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1D" runat="server" Text="Stats Disc.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarD3" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar3D_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar3" runat="server" Text ="" Visible="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l4" runat="server" Text="In Data<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarD4" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar4D_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar4" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="Var" DataField="fld" />
						<asp:BoundField HeaderText="Default InAnal" DataField="Default_InAnalysis"  Visible="true"/>
						<asp:BoundField HeaderText="Label" DataField="fieldlabel" />


					</Columns>
				</asp:GridView>

	   <%--                                 </ContentTemplate>

					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="chkVar2" EventName="CheckedChanged" />
					</Triggers>--%>

					</asp:Panel>
			</td>
			<td>
			</td>
		</tr>
	</table>


	<br />
	<br />
	<asp:Label ID="lbl" runat="server"></asp:Label>


	<asp:Panel ID="Panel_descstats" runat="server" EnableViewState="true">
		   <asp:GridView ID="gv1" runat="server" OnRowDataBound="gvDescStats_RowDataBound"></asp:GridView>
	</asp:Panel>
	<asp:Panel ID="Panel_showdata" runat="server">

	</asp:Panel>

	<br />
	<br />
	<asp:Panel ID="Panel_Testing" runat="server"  EnableViewState="true"></asp:Panel>

   <%-- <br />    <br />    <br />    <br />
	<asp:Button ID="btnBuildBars" runat="server" Text="BuildBars" Visible="true"  OnClick="btnBuildBars_Click" Font-Size="7pt" />   --%>

</asp:Content>

