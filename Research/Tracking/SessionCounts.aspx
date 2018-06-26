
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="SessionCounts.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_SessionCounts" Title="Session Counts"   Theme="Skin1" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style>  p {color: DarkBlue; }
  .fs14 {    font-size: 12px;  }
</style>
	 
<style> big {font-size:14pt; }</style>

<style type="text/css">
	foo
	{
		color: red;
		position: relative !important;
		top:-2px !important;
		left: -2px !important;
	}
</style>


<%--    //ob_post.post(null, "<%= this.ID %>:GetDDLcontents", setupDDL_measstatusdetailID);  //call the method in code behind--%>
<%--	<script type="text/javascript">
		function editM(record) {
			ob_post.AddParam("measstatusID", record.studymeassubjID);       //pass the measstatusID to limit the choices in the DDL
			//ob_post.AddParam("measstatusdetailID", record.measstatusdetailID);      // pass the measstatusID to set the selected value
			ob_post.post(null, "<%= this.ID %>:loadMdetails"); //, processAjaxResult);  //call the method in code behind
		}
	</script>--%>


<script type="text/javascript">


</script>
	


	<br />

	<asp:Label ID="Label1" runat="server" Text="Session Counts (limited only to subjects at UW)" Font-Size="Medium" Font-Bold="false"></asp:Label>

		<br />
		<br />
	<table>
		<tr>
			<td colspan="2"> 	<asp:Panel ID="panelChk" EnableViewState="true" runat="server"></asp:Panel>  </td>
			<td style="vertical-align:top">
				<table>
					<tr>
						<td style="vertical-align:top">
							<asp:Label ID="Label2" runat="server" Text =" Dates from: " ></asp:Label>

							<asp:TextBox ID="txtD1" runat="server" Text="1/1/2015"></asp:TextBox>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Label ID="l1" runat="server" Text =" to:" ></asp:Label>
							<asp:TextBox ID="txtD2" runat="server"  Text="12/31/2015"></asp:TextBox>

							<br /><br />

							<asp:Button ID="btnGetCounts" runat="server" Text="Get Session Counts" OnClick="btnGetCounts_Click"/>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<asp:Panel ID="panel" runat="server">
<br /><br />
								<asp:GridView ID="gv" runat="server" AutoGenerateColumns="false">
									<Columns>
										<asp:BoundField DataField="studyname" HeaderText="Study" />
										<asp:BoundField DataField="N_sessions" HeaderText="# sessions" />
										<asp:BoundField DataField="N_unq_persons" HeaderText="# unq persons" />
										<asp:BoundField DataField="N_unq_persons_LT2yo" HeaderText="# unq pers<br/>(<2yo)"      HeaderStyle-ForeColor="Blue" ItemStyle-ForeColor="Blue" HtmlEncode="false"/>
										<asp:BoundField DataField="N_unq_persons_2to5yo" HeaderText="# unq pers<br/>(2-5yo)"    HeaderStyle-ForeColor="Blue" ItemStyle-ForeColor="Blue" HtmlEncode="false"/>
										<asp:BoundField DataField="N_unq_persons_5to12yo" HeaderText="# unq pers<br/>(5-12yo)"  HeaderStyle-ForeColor="Blue" ItemStyle-ForeColor="Blue" HtmlEncode="false"/>
										<asp:BoundField DataField="N_unq_persons_GT12yo" HeaderText="# unq pers<br/>(>= 12yo)"  HeaderStyle-ForeColor="Blue" ItemStyle-ForeColor="Blue" HtmlEncode="false" />
										<asp:BoundField DataField="Date_From" HeaderText="From" DataFormatString="{0:d}" />
										<asp:BoundField DataField="Date_To" HeaderText="To"  DataFormatString="{0:d}"/>
									</Columns>
								</asp:GridView>

								<br /><br />
								<asp:GridView ID="gvTadpole" runat="server" AutoGenerateColumns="false">
									<Columns>
										<asp:BoundField DataField="studyname" HeaderText="Study" />
										<asp:BoundField DataField="sum_txhrs" HeaderText="# tx hours" />
										<asp:BoundField DataField="N_unq_persons" HeaderText="# unq persons" />
										<asp:BoundField DataField="Date_From" HeaderText="From" DataFormatString="{0:d}" />
										<asp:BoundField DataField="Date_To" HeaderText="To"  DataFormatString="{0:d}"/>
									</Columns>
								</asp:GridView>


							</asp:Panel>
						</td>
					</tr>

				</table>


			</td>
		</tr>

	</table>

		<br />

		<br />


</asp:Content>




