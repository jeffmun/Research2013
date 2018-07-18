<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MeasureInfo.aspx.cs" AutoEventWireup="true"
 Inherits="Info_MeasureInfo" Title="Measure Info/Data Dictionary" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

 
<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>


	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:HiddenField ID="hidMeasureID" runat="server"  />
	<asp:HiddenField ID="hidMeasName" runat="server"  />

	<br /> 
 <asp:UpdatePanel ID="UpdatePanel_MainControls" runat="server" UpdateMode="Conditional">
	<ContentTemplate>

	<table>
	<tr><td width="370px">
			<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
			<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
		</td>
		<td width="200px"> </td>
		<td width="400px">
		</td>

	</tr>
	<tr style="vertical-align:top"><td>
			<asp:DropDownList ID="DDL_SelectMeasureID" runat="server"  
						 DataTextField="Measname" DataValueField="measureID" Width="300px" 
						 OnSelectedIndexChanged="DDL_SelectMeasureID_SelectedIndexChanged"  AutoPostBack="true" ViewStateMode="Enabled" >
			</asp:DropDownList>    </td>
		<td>
		<asp:Button ID="btnShow_MeasInfo" runat="server" Text="Show Measure Info" OnCommand="Show_Stuff" CommandArgument="viewing_measinfo" Font-Size="Smaller" ForeColor="RoyalBlue" Visible="false"/> 
		
		<br />

			</td>
		<td>
		<asp:Button ID="btnShow_TableInfo" runat="server" Text="Show DataTable Info"  OnCommand="Show_Stuff" CommandArgument="viewing_tableinfo"  Font-Size="Smaller" ForeColor="RoyalBlue" Visible="false"/> 
	   
		
			</td>    
		<td>
		<asp:Button ID="btnCreateMeas_Begin" runat="server" Text="Create New Measure" Font-Size="Smaller" OnClick="CreateNewMeasure_Begin" Visible="false" /><br />
		<asp:Button ID="btnCreateTable_Begin" runat="server" Text="Create New Data Table"  Font-Size="Smaller" OnClick="CreateNewTable_Begin" Visible="false" />

	</td>
	
	</tr>
	</table>



	 <table id="tblmyinfo" runat="server" width="100%">
	 <tr><td font-color="red"></td></tr>
	 </table>
	 <table id="tblmyerror" runat="server" width="100%">
	 <tr><td>
		 <asp:Label ID="lblMyError" runat="server" Text="" CssClass="ErrorCell" ></asp:Label>
		 <asp:Label ID="lblMyInfo" runat="server" Text="" CssClass="InfoCell" ></asp:Label>
	 </td></tr>
	 </table>
	 </ContentTemplate>

	 <Triggers>
	 <asp:PostBackTrigger ControlID="btnShow_MeasInfo" />
	 <asp:PostBackTrigger ControlID="btnShow_TableInfo" />
	 <asp:PostBackTrigger ControlID="btnCreateMeas_Begin" />
	 <asp:PostBackTrigger ControlID="btnCreateTable_Begin" />
	 <asp:PostBackTrigger ControlID="DDL_SelectMeasureID"/>
	 </Triggers>

 </asp:UpdatePanel>


 
	<asp:UpdatePanel ID="UpdatePanel_CreateNewMeasure" runat="server" Visible="false">
	<ContentTemplate>
	
	<br />
	<asp:Label ID="Label4" runat="server" Text="Create New Measure" Font-Underline="true"  Font-Bold="true"/><br />
	<table>
	<tr>
	<td>
		<asp:Label ID="lblMeasName" runat="server" Width="100px" Text="Name:"></asp:Label><asp:TextBox ID="txtCNM_Name" runat="server" AutoPostBack="true"  Width="250px"></asp:TextBox><br />
		<br />
		<asp:Label ID="Label17" runat="server" Width="100px" Text="Name (full):"></asp:Label><asp:TextBox ID="txtCNM_NameFull" runat="server"  AutoPostBack="true"  Width="400px"></asp:TextBox>
	</td>
	</tr>

	
	</table>
		<asp:Button ID="btn_CreateMeas_submit" runat="server" Text="Submit New Measure" OnClick="CreateNewMeasure_submit" />
	
	</ContentTemplate>

	<Triggers>
	<asp:PostBackTrigger ControlID="btn_CreateMeas_submit" />
	</Triggers>
	</asp:UpdatePanel>



 
	<%-- Setup New Data Table--%>
		<asp:UpdatePanel ID="Panel_NewTable" runat="server" Visible="false" UpdateMode="Conditional">
		<ContentTemplate>

		<table><tr>
		<td>
		<asp:Label ID="Label25" runat="server" width="120px" Text="Table name:  ALL_"></asp:Label><asp:TextBox ID="txtTblName" runat="server" Text=""></asp:TextBox>
		<%--<asp:Button ID="btn_LookupInProgress" runat="server" Text="Lookup" OnClick="Lookup_Table_InProgress" AutoPostBack="true" Font-Size="Smaller" />--%>
		<br />
		<asp:Label ID="Label32" runat="server" width="120px"  Text="Table abbr:"></asp:Label><asp:TextBox ID="txtTblAbbr" runat="server" Text=""></asp:TextBox><br />
		<br /><br />

		<asp:Button ID="btnInsertTableInfo_Submit" runat="server" AutoPostBack="true" OnClick="InsertTableInfo_Submit" Text="Insert New Table Info" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnInsertTableInfo_Cancel" runat="server" AutoPostBack="true" OnClick="InsertTableInfo_Cancel" Text="Cancel" ForeColor="Red" />
		
		</td>
			<td style="width:50px"></td>
		<td>
	<asp:Label ID="lblX" runat="server" Text="..."></asp:Label> <br />

	<asp:Button ID="btnDownloadExcelTemplate" runat="server" Text="Download Excel Template" OnClick="DownloadExcelTemplate" />

	<asp:Label ID="lblFileUpload" runat="server" Text="..."></asp:Label>
	<asp:FileUpload ID="FileUpload1" runat="server"  />

	<br /><br />
	<asp:Button ID="btnUploadExcelTemplate" runat="server" Text="Upload Excel Template" OnClick="UploadExcelTemplate" />
	</td>
	</tr>
	</table>

		</ContentTemplate>
		<Triggers>
		<asp:PostBackTrigger ControlID="btnInsertTableInfo_Submit" />
		<asp:PostBackTrigger ControlID="btnInsertTableInfo_Cancel" />
		<asp:PostBackTrigger ControlID="btnDownloadExcelTemplate" />
		</Triggers>
		</asp:UpdatePanel>



	<%--Batch Edit Fields :  Setup New Data Table--%>
	<asp:UpdatePanel ID="Panel_BatchEditFields" runat="server" Visible="false" UpdateMode="Conditional" ChildrenAsTriggers="true">
	<ContentTemplate>

		<asp:HiddenField ID="hidTblName" runat="server" Value=""/>
		<table>
		<tr>

		<td colspan="3">
			<asp:Label ID="lblNewTableInfo" runat="server" Text=""></asp:Label>
			</tr>
		</td>

<%--ROW 1--%>

		<tr>

<%--1 Left Column--%>
			<td width = "480px" style="vertical-align:top">
				
				<asp:Label ID="lblCurrentTable" runat="server" width="400px" Font-Size="Medium" Text="" Font-Bold="true"></asp:Label><br /><br />

			<asp:UpdatePanel ID="Panel_InsertField_Controls" runat="server" Visible="true" UpdateMode="Conditional" ChildrenAsTriggers="true">
			   <ContentTemplate>

					<asp:Label ID="lblBatchInfo" runat="server" Text="" Font-Size="X-Small" Font-Color="DarkGreen"></asp:Label>

				   <br />
			   <asp:Label ID="Label68" runat="server" Font-Underline="true" Font-Bold="true" Text="Define Field Type:"></asp:Label><br />
					<asp:Label ID="Label27" runat="server" width="65px"  Text="Data type:"></asp:Label>
					<asp:DropDownList ID="ddlDataType" runat="server">
						<asp:ListItem Text="..select.." Value="NULL" />
						<asp:ListItem Text="int" Value="int" />
						<asp:ListItem Text="float" Value="float" />
						<asp:ListItem Text="varchar" Value="varchar" />
						<asp:ListItem Text="datetime" Value="datetime" />
					</asp:DropDownList>
					<asp:Label ID="Label35" runat="server" width="45px"  Text="Length:"></asp:Label><asp:TextBox ID="txtDataTypeLength" runat="server" Width="70px" Text="50"></asp:TextBox><br />

					<br />

			<table>
			<tr><td colspan="3"><asp:Label ID="Label67" runat="server" Font-Underline="true" Font-Bold="true" Text="Define Field Names:"></asp:Label></td></tr>
			<tr>
				<td><asp:Label ID="Label28" runat="server" Font-Underline="true" Font-Bold="false" Text="Part"></asp:Label></td>
				<td><asp:Label ID="Label34" runat="server" Font-Underline="true" Font-Bold="false" Text="Text/CSV"></asp:Label></td>
				<td><asp:Label ID="Label36" runat="server" Font-Underline="true" Font-Bold="false" Text="Sequence"></asp:Label></td>
			</tr>
			<tr>
			<td><asp:Label ID="Label37" runat="server" Text="Main:"></asp:Label></td>
			<td><asp:TextBox ID="txtMain" runat="server" Text=""></asp:TextBox></td>
			<td><asp:Label ID="Label29" runat="server" width="50px"  Text="---"></asp:Label>
						</td>
			</tr>

			<tr>
			<td><asp:Label ID="Label24" runat="server" Text="#1:"></asp:Label></td>
			<td><asp:TextBox ID="txtText1" runat="server" Text="" OnTextChanged="TextChanged1" AutoPostBack="true"></asp:TextBox></td>
			<td><asp:Label ID="Label40" runat="server" Text="Start:"></asp:Label><asp:TextBox ID="txtFrom1" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged1s" AutoPostBack="true"></asp:TextBox>
			<asp:Label ID="Label41" runat="server"     Text="End:"></asp:Label><asp:TextBox ID="txtTo1" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged1e" AutoPostBack="true"></asp:TextBox>
						<asp:DropDownList ID="ddlIncrementType1" runat="server">
							<asp:ListItem Text="..type.." Value="..type.." />
							<asp:ListItem Text="numeric" Value="numeric" />
							<asp:ListItem Text="UPPER" Value="UPPER" />
							<asp:ListItem Text="lower" Value="lower" />
						</asp:DropDownList><br />
						</td>
			</tr>

			<tr>
			<td><asp:Label ID="Label43" runat="server" Text="#2:"></asp:Label></td>
			<td><asp:TextBox ID="txtText2" runat="server" Text="" OnTextChanged="TextChanged2" AutoPostBack="true"></asp:TextBox></td>
			<td><asp:Label ID="Label44" runat="server" Text="Start:"></asp:Label><asp:TextBox ID="txtFrom2" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged2s" AutoPostBack="true"></asp:TextBox>
			<asp:Label ID="Label45" runat="server"     Text="End:"></asp:Label><asp:TextBox ID="txtTo2" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged2e" AutoPostBack="true"></asp:TextBox>
						<asp:DropDownList ID="ddlIncrementType2" runat="server">
							<asp:ListItem Text="..type.." Value="..type.." />
							<asp:ListItem Text="numeric" Value="numeric" />
							<asp:ListItem Text="UPPER" Value="UPPER" />
							<asp:ListItem Text="lower" Value="lower" />
						</asp:DropDownList><br />
						</td>
			</tr>

			<tr>
			<td><asp:Label ID="Label47" runat="server" Text="#3:"></asp:Label></td>
			<td><asp:TextBox ID="txtText3" runat="server" Text="" OnTextChanged="TextChanged3" AutoPostBack="true"></asp:TextBox></td>
			<td><asp:Label ID="Label48" runat="server"  Text="Start:"></asp:Label><asp:TextBox ID="txtFrom3" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged3s" AutoPostBack="true"></asp:TextBox>
			<asp:Label ID="Label49" runat="server"      Text="End:"></asp:Label><asp:TextBox ID="txtTo3" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged3e" AutoPostBack="true"></asp:TextBox>
						<asp:DropDownList ID="ddlIncrementType3" runat="server">
							<asp:ListItem Text="..type.." Value="..type.." />
							<asp:ListItem Text="numeric" Value="numeric" />
							<asp:ListItem Text="UPPER" Value="UPPER" />
							<asp:ListItem Text="lower" Value="lower" />
						</asp:DropDownList><br />
						</td>
			</tr>

						<tr>
			<td><asp:Label ID="Label30" runat="server" Text="#4:"></asp:Label></td>
			<td><asp:TextBox ID="txtText4" runat="server" Text="" OnTextChanged="TextChanged4" AutoPostBack="true"></asp:TextBox></td>
			<td><asp:Label ID="Label31" runat="server"  Text="Start:"></asp:Label><asp:TextBox ID="txtFrom4" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged4s" AutoPostBack="true"></asp:TextBox>
			<asp:Label ID="Label38" runat="server"      Text="End:"></asp:Label><asp:TextBox ID="txtTo4" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged4e" AutoPostBack="true"></asp:TextBox>
						<asp:DropDownList ID="ddlIncrementType4" runat="server">
							<asp:ListItem Text="..type.." Value="..type.." />
							<asp:ListItem Text="numeric" Value="numeric" />
							<asp:ListItem Text="UPPER" Value="UPPER" />
							<asp:ListItem Text="lower" Value="lower" />
						</asp:DropDownList><br />
						</td>
			</tr>

						<tr>
			<td><asp:Label ID="Label39" runat="server" Text="#5:"></asp:Label></td>
			<td><asp:TextBox ID="txtText5" runat="server" Text="" OnTextChanged="TextChanged5" AutoPostBack="true"></asp:TextBox></td>
			<td><asp:Label ID="Label42" runat="server"  Text="Start:"></asp:Label><asp:TextBox ID="txtFrom5" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged5s" AutoPostBack="true"></asp:TextBox>
			<asp:Label ID="Label46" runat="server"      Text="End:"></asp:Label><asp:TextBox ID="txtTo5" runat="server" Text="" Width="40px"  OnTextChanged="TextChanged5e" AutoPostBack="true"></asp:TextBox>
						<asp:DropDownList ID="ddlIncrementType5" runat="server">
							<asp:ListItem Text="..type.." Value="..type.." />
							<asp:ListItem Text="numeric" Value="numeric" />
							<asp:ListItem Text="UPPER" Value="UPPER" />
							<asp:ListItem Text="lower" Value="lower" />
						</asp:DropDownList><br />
						</td>
			</tr>

			<tr><td colspan=3 align="right">
				<asp:Button ID="btnResetFields" runat="server" Text="Reset" OnClick="ResetFields" ForeColor="Indigo" Font-Size="Smaller" />
			</td></tr>

			</table>

					<br />
						<asp:Label ID="Label50" runat="server" Text="Insert after position:"></asp:Label>
						<asp:TextBox ID="txtInsertAtPos" runat="server" Width = "40px" Text = ""></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
					<asp:Button ID="btnAddFields" runat="server" AutoPostBack="true" OnClick="BatchAddFields" Text="Add Fields" />
				   </ContentTemplate>

				<Triggers>
					<asp:AsyncPostBackTrigger ControlID="txtText1" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtText2" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtText3" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtText4" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtText5" EventName="TextChanged" />

					<asp:AsyncPostBackTrigger ControlID="txtFrom1" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtFrom2" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtFrom3" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtFrom4" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtFrom5" EventName="TextChanged" />

					<asp:AsyncPostBackTrigger ControlID="txtTo1" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtTo2" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtTo3" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtTo4" EventName="TextChanged" />
					<asp:AsyncPostBackTrigger ControlID="txtTo5" EventName="TextChanged" />


				</Triggers>
			 </asp:UpdatePanel>

			</td>


<%--1 Middle column--%>
			<td   width = "480px" style="vertical-align:top">

			 <br /><br />

				<asp:UpdatePanel ID="Panel_UpdateField_Controls" runat="server" Visible="true" UpdateMode="Conditional" ChildrenAsTriggers="true">
				<ContentTemplate>
				 <br />
				<asp:Label ID="Label69" runat="server" Text="Define Field Metadata:" Font-Bold="true" Font-Underline="true" ></asp:Label>
				<br />
												
				<asp:Label ID="lblMin" runat="server" Text="Min:" Width="40px"></asp:Label><asp:TextBox ID="txtMin" runat="server"  Width="40px"></asp:TextBox>
				<asp:Label ID="lblMax" runat="server" Text="Max:" Width="40px"></asp:Label><asp:TextBox ID="txtMax" runat="server" Width="40px"></asp:TextBox>
			   <asp:CheckBox ID="chkClear_MinMax" runat="server" ForeColor="DarkRed" Text="Clear Min/Max" Font-Size="X-Small" />
					 <br />

				<asp:Label ID="Label53" runat="server" Width="80px" Text="Valid List:"></asp:Label><asp:TextBox ID="txtValidList" runat="server" Width="120px"></asp:TextBox>
					<asp:CheckBox ID="chkClear_ValidList" runat="server" ForeColor="DarkRed" Text="Clear ValidList" Font-Size="X-Small" /><br />
				<asp:Label ID="Label54" runat="server" Width="80px" Text="Missing Vals:"></asp:Label><asp:TextBox ID="txtMissVal" runat="server" Width="120px"></asp:TextBox>
					 <asp:CheckBox ID="chkClear_MissVal" runat="server" ForeColor="DarkRed" Text="Clear Miss Val" Font-Size="X-Small" /><br />
				<asp:Label ID="Label55" runat="server" Width="80px" Text="Value Set ID:"></asp:Label><asp:TextBox ID="txtValueSetID" runat="server" Width="50px"></asp:TextBox>
					<asp:CheckBox ID="chkClear_ValueSetID" runat="server" ForeColor="DarkRed" Text="Clear Value Set" Font-Size="X-Small" /><br />
				<asp:Label ID="Label64" runat="server" Width="140px" Text="Field in analysis set?:" />
				<asp:DropDownList ID="ddl_InAnalysis" runat="server">
					<asp:ListItem Value="-98765" Text="..Select.."></asp:ListItem>
					<asp:ListItem Value="0" Text="No"></asp:ListItem>
					<asp:ListItem Value="1" Text="In Analysis set only"></asp:ListItem>
					<asp:ListItem Value="2" Text="Analysis Var - Continuous"></asp:ListItem>
					<asp:ListItem Value="3" Text="Analysis Var - Categorical"></asp:ListItem>
				</asp:DropDownList>


				<br /><br />
								<asp:Label ID="Label65" runat="server" Width="160px" Font-Italic="true" Text="Enter fields to update" ForeColor="DarkBlue" /><br />
				<asp:Label ID="Label58" runat="server" Width="160px" Text="Field List (CSV of pos):" ForeColor="DarkBlue" ></asp:Label><asp:TextBox ID="txtUpdateList" runat="server" ForeColor="DarkBlue"  Width="200px"></asp:TextBox><br />
				<br />
				<asp:Label ID="Label66" runat="server" width="60px"  ForeColor="DarkBlue"  Text="OR"></asp:Label>
				<asp:Label ID="Label56" runat="server" width="100px" ForeColor="DarkBlue"  Text="From:"></asp:Label><asp:TextBox ID="txtFromUpdate" runat="server"  ForeColor="DarkBlue" Text="" Width="40px"></asp:TextBox>
				<asp:Label ID="Label57" runat="server" width="30px"  ForeColor="DarkBlue" Text="To:"></asp:Label><asp:TextBox ID="txtToUpdate" runat="server" Text=""  ForeColor="DarkBlue" Width="40px"></asp:TextBox><br />
						  <br /><br />
					
				 <asp:Button ID="btnUpdateFields" runat="server" AutoPostBack="true" OnClick="BatchUpdateFields" Text="Batch Update Fields" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <asp:Button ID="btnClearFields" runat="server" AutoPostBack="true" OnClick="BatchClearFields" Text="Clear Checked Fields" />
				<br />
				</ContentTemplate>
				<Triggers>
				<asp:AsyncPostBackTrigger ControlID="txtMin" EventName="TextChanged" />
				<asp:AsyncPostBackTrigger ControlID="txtMax" EventName="TextChanged" />
				<asp:AsyncPostBackTrigger ControlID="txtFromUpdate" EventName="TextChanged" />
				<asp:AsyncPostBackTrigger ControlID="txtToUpdate" EventName="TextChanged" />
				<asp:PostBackTrigger ControlID="btnUpdateFields" />
				<asp:PostBackTrigger ControlID="btnClearFields" />
				</Triggers>
				</asp:UpdatePanel>

			</td>

	   
	   <%-- 1 Right column--%>
			<td style="vertical-align:top">

				<asp:UpdatePanel ID="Panel_FieldDelete_TableCreate_Controls" runat="server" Visible="true" ChildrenAsTriggers="true" UpdateMode="Conditional">
			   <ContentTemplate>
					<asp:Label ID="Label26" runat="server" width="100px" ForeColor="DarkRed"  Text="Delete From:"></asp:Label><asp:TextBox ID="txtDelFrom" runat="server"  ForeColor="DarkRed" Text="" Width="40px"></asp:TextBox>
					<asp:Label ID="Label33" runat="server" width="30px"  ForeColor="DarkRed" Text="To:"></asp:Label><asp:TextBox ID="txtDelTo" runat="server" Text=""  ForeColor="DarkRed" Width="40px"></asp:TextBox>
 
					<asp:Button ID="btnDeleteFields" runat="server" OnClick="DeleteFields_Submit" AutoPostBack="true" Text="Delete Fields"  ForeColor="DarkRed" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
					<br />
					<br />
					<br />
					<br />

					<asp:Button ID="btnCopyFieldLabels" runat="server" OnClick="Copy_FieldLabels_to_ASPXLabels" Text="Copy Field Labels to DE Form Labels (aspx)" Font-Size="X-Small" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
					<br />
					<br />

					<asp:Button ID="btnBatchEditFields_Cancel" runat="server" OnClick="BatchEditFields_Cancel" Text="Cancel" ForeColor="Red" />

				  </ContentTemplate>
					<Triggers>
						<asp:PostBackTrigger ControlID="btnDeleteFields" />
					</Triggers>
				 </asp:UpdatePanel>
			</td>
	   </tr>

<%--ROW 2--%>       
	<tr>
		<td colspan="3">
		</td>
		</tr>

		</table> 
		</ContentTemplate>
		<Triggers>
<%--        <asp:PostBackTrigger ControlID="btn_LookupInProgress" />--%>        
		<asp:PostBackTrigger ControlID="btnInsertTableInfo_Submit" />
		<asp:PostBackTrigger ControlID="btnCopyFieldLabels" />
		<asp:PostBackTrigger ControlID="btnBatchEditFields_Cancel" />
		<asp:PostBackTrigger ControlID="btnAddFields" />
		<asp:PostBackTrigger ControlID="btnDeleteFields" />
		<asp:PostBackTrigger ControlID="btnUpdateFields" />
		<asp:AsyncPostBackTrigger ControlID="btnResetFields" EventName="Click" />
		</Triggers>

	</asp:UpdatePanel>



	<%--View Measure Info--%>
	<asp:UpdatePanel ID="Panel_ViewMeasInfo" runat="server" UpdateMode="Conditional" Visible="false" EnableViewState="true"  >
	<ContentTemplate>
	   
	<table> 
	<tr><td>
		<asp:Label ID="Label62" runat="server" Text="Measure Info" Font-Bold="true" Font-Underline="true"></asp:Label>


		</td>
		<td align="right">                
		<asp:Button ID="btnHide_MeasInfo" runat="server" Text="Hide" AutoPostBack="true"  OnCommand="Show_Stuff" CommandArgument="hiding_measinfo" Font-Size="X-Small" Visible="false"/>   
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnEdit_MeasInfo" runat="server" Text="Edit"   OnCommand="Show_Stuff" CommandArgument="editing_measinfo"  Font-Size="X-Small" Visible="false"/> 
		
<%--        <asp:Button ID="btnEdit_MeasInfo_Cancel" runat="server" Text="Cancel" OnClick="Cancel_EditMeasureInfo" Font-Size="X-Small" Visible="false" ForeColor="Red" /><br /><br />--%>        
		
		</td>
		</tr>

	<tr>   
		<td style="vertical-align:top"><!-- View MEASINFO LEFT -->
		<asp:Panel ID="Panel_MeasInfo_L" runat="server" Visible="true"> 
		<table>
<%--            <tr><td style="vertical-align:top"><asp:Label ID="Label3" runat="server" Text="studymeasID:" Width="120px"></asp:Label>             </td><td style="vertical-align:top"><asp:Label ID="lbl_studymeasID" runat="server"  Text=""></asp:Label><br/></td></tr>
--%>
			<tr><td style="vertical-align:top"><asp:Label ID="static_measureID" runat="server" Text="measureID:" Width="120px"></asp:Label>             </td><td style="vertical-align:top"><asp:Label ID="lbl_measureID" runat="server"  Text=""></asp:Label><br/></td></tr>
			<tr><td style="vertical-align:top"><asp:Label ID="static_MeasName" runat="server" Text="MeasName:" Width="120px"></asp:Label>	             </td><td style="vertical-align:top"><asp:Label ID="lbl_MeasName" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label><br/></td></tr>
			<tr><td style="vertical-align:top"><asp:Label ID="static_MeasFullName" runat="server" Text="MeasFullName:" Width="120px"></asp:Label>   	 </td><td style="vertical-align:top"><asp:Label ID="lbl_MeasFullName" runat="server" Text="" Font-Bold="true"></asp:Label><br/></td></tr>
			<tr><td style="vertical-align:top"><asp:Label ID="static_CitationText" runat="server" Text="CitationText:" Width="120px" ></asp:Label>	     </td><td style="vertical-align:top"><asp:Label ID="lbl_CitationText" runat="server" Text="" Width = "600px"></asp:Label><br/> <br /></td></tr>
			<tr><td style="vertical-align:top"><asp:Label ID="static_DescriptionText" runat="server" Text="DescriptionText:" Width="120px" ></asp:Label></td><td style="vertical-align:top"><asp:Label ID="lbl_DescriptionText" runat="server" Text="" Width = "600px"></asp:Label><br/> <br /></td></tr>
			<tr><td style="vertical-align:top"><asp:Label ID="static_CopyrightInfo" runat="server" Text="CopyrightInfo:" Width="120px"></asp:Label>	 </td><td style="vertical-align:top"><asp:Label ID="lbl_CopyrightInfo" runat="server" Text="" Width = "600px"></asp:Label><br/> <br /></td></tr>
			<tr><td style="vertical-align:top"><asp:Label ID="static_OrderingInfo" runat="server" Text="OrderingInfo:" Width="120px"></asp:Label>	     </td><td style="vertical-align:top"><asp:Label ID="lbl_OrderingInfo" runat="server" Text="" Width = "600px"></asp:Label><br/> <br /></td></tr>
		   
		</table> 
		</asp:Panel>

		<asp:Panel ID="Panel_MeasInfo_TimeEst" runat="server">
			<asp:Label ID="lblTimeEstTotal" runat="server" Text="Time Estimates" Font-Bold="true" Font-Underline="true" Width="420px"></asp:Label>
			<asp:Label ID="lblNoTimeEst" runat="server" Text="** No Time Estimates Entered**" ForeColor="Red" Font-Bold="true" Width="420px"></asp:Label><br/>
	
			<asp:Label ID="lbl_Admin_desc" runat="server" Text="" Width="420px"></asp:Label>
			<asp:Label ID="lbl_Admin_time" runat="server" Text="" ></asp:Label><br/>
			<asp:Label ID="lbl_Subject_desc" runat="server" Text="" Width="420px"></asp:Label>
			<asp:Label ID="lbl_Subject_time" runat="server" Text="" ></asp:Label><br/>
			<asp:Label ID="lbl_DataEntry_desc" runat="server" Text="" Width="420px"></asp:Label>
			<asp:Label ID="lbl_DataEntry_time" runat="server" Text=""></asp:Label><br/>
			<asp:Label ID="lbl_Process_desc" runat="server" Text="" Width="420px"></asp:Label>
			<asp:Label ID="lbl_Process_time" runat="server" Text=""></asp:Label><br/>
		</asp:Panel>


		</td>

	
		<td style="vertical-align:top"><!-- View MEASINFO RIGHT -->
		<asp:Panel ID="Panel_OtherStudies" runat="server" Visible="true">
			<asp:Label ID="Label2" runat="server" Text="Other studies using this measure:" Font-Bold="true" Font-Underline="true"></asp:Label>
			<asp:GridView ID="gv_OtherStudies" runat="server" DataSourceID="sql_OtherStudies" Visible="true">
			</asp:GridView>
		</asp:Panel>
	
		<br/><br/>
		<asp:Panel ID="Panel_MeasInfo_R" runat="server" Visible = "true">
			<asp:Label ID="Label1" runat="server" Text="Data Characteristics:" Width="130px" Font-Underline="true"></asp:Label> <br /> 	
			<asp:Label ID="static_DataCategory" runat="server" Text="Category:" Width="110px"></asp:Label>  	<asp:Label ID="lbl_DataCategory" runat="server" Text="" Font-Bold="true"></asp:Label><br/>
			<asp:Label ID="static_DataFocus" runat="server" Text="Focus:" Width="110px"></asp:Label>	        <asp:Label ID="lbl_DataFocus" runat="server" Text="" Font-Bold="true"></asp:Label><br/>
			<asp:Label ID="static_DataMethod" runat="server" Text="Method:" Width="110px"></asp:Label>	        <asp:Label ID="lbl_DataMethod" runat="server" Text="" Font-Bold="true"></asp:Label><br/>
			<asp:Label ID="static_DataRespondent" runat="server" Text="Respondent:" Width="110px"></asp:Label>	<asp:Label ID="lbl_DataRespondent" runat="server" Text="" Font-Bold="true"></asp:Label><br/><br/>
			<asp:Label ID="static_MeasSource" runat="server" Text="Source:" Width="110px"></asp:Label>	        <asp:Label ID="lbl_meassource" runat="server" Text="" Font-Bold="true"></asp:Label><br/><br/>
			<asp:Label ID="static_MeasSource_desc" runat="server" Text="Source details:" Width="110px"></asp:Label>	        <asp:Label ID="lbl_MeasSource_desc" runat="server" Text="" Font-Bold="true"></asp:Label><br/><br/>
			<asp:Label ID="lbl_NoDataTable" runat="server" Text="** Data Table Not Created **" ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label><br/>
			<asp:Label ID="lbl_DElink" runat="server" Text="** Data Entry Form Not Linked **" ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label><br/>
			<asp:HyperLink ID="hyp_DElink" runat="server" Text="Open Data Entry Form"  Visible = "true" Target="_blank"  Font-Bold="true" ForeColor="Blue"   /><br/><br />
			<asp:Label ID="lbl_SPlink" runat="server" Text="** No scoring procedure **"  Visible = "true"   Font-Bold="true" ForeColor="Red"   />
			<asp:HyperLink ID="hyp_SPlink" runat="server" Text=""  Visible = "true" Target="_blank"  Font-Bold="true" ForeColor="Blue"   /><br/><br />

		</asp:Panel>

			   
		</td>
		</tr></table>

			</ContentTemplate>
	<Triggers>
	 <asp:PostBackTrigger ControlID="btnHide_MeasInfo"  />
	 <asp:PostBackTrigger ControlID="btnEdit_MeasInfo" /> 

	</Triggers>
	</asp:UpdatePanel>


	<%--Edit Measure Info--%>
			<asp:UpdatePanel ID="Panel_EditMeasInfo" runat="server" UpdateMode="Conditional" Visible="false">
			<ContentTemplate>
			<table>
			<tr>
			<td>
				<asp:Panel ID="Panel_MeasInfo_L_Edit" runat="server" Visible="true"> 
				<table> 
					<tr><td style="vertical-align:top"><asp:Label ID="Label7" runat="server" Text="measureID:" Width="120px"></asp:Label>             </td><td style="vertical-align:top"><asp:Label ID="txt_measureID" runat="server"  Text=""></asp:Label><br/></td></tr>
					<tr><td style="vertical-align:top"><asp:Label ID="Label11" runat="server" Text="MeasName:" Width="120px"></asp:Label>	             </td><td style="vertical-align:top"><asp:TextBox ID="txt_MeasName" runat="server" Text="" Font-Bold="true"  Width = "400px"></asp:TextBox><br/></td></tr>
					<tr><td style="vertical-align:top"><asp:Label ID="Label14" runat="server" Text="MeasFullName:" Width="120px"></asp:Label>   	 </td><td style="vertical-align:top"><asp:TextBox ID="txt_MeasFullName" runat="server" Text="" Font-Bold="true"  Width = "600px"></asp:TextBox><br/></td></tr>
					<tr><td style="vertical-align:top"><asp:Label ID="Label16" runat="server" Text="CitationText:" Width="120px" ></asp:Label>	     </td><td style="vertical-align:top"><asp:TextBox ID="txt_CitationText" runat="server" Text="" Width = "600px" Height="100px" Font-Size="Small" TextMode="MultiLine"  Wrap="true"></asp:TextBox><br/> <br /></td></tr>
					<tr><td style="vertical-align:top"><asp:Label ID="Label18" runat="server" Text="DescriptionText:" Width="120px" ></asp:Label></td><td style="vertical-align:top"><asp:TextBox ID="txt_DescriptionText" runat="server" Text="" Width = "600px" Height="300px" Font-Size="Small" TextMode="MultiLine"  Wrap="true"></asp:TextBox><br/> <br /></td></tr>
					<tr><td style="vertical-align:top"><asp:Label ID="Label20" runat="server" Text="CopyrightInfo:" Width="120px"></asp:Label>	 </td><td style="vertical-align:top"><asp:TextBox ID="txt_CopyrightInfo" runat="server" Text="" Width = "600px" Height="60px" Font-Size="Small" TextMode="MultiLine"   Wrap="true"></asp:TextBox><br/> <br /></td></tr>
					<tr><td style="vertical-align:top"><asp:Label ID="Label22" runat="server" Text="OrderingInfo:" Width="120px"></asp:Label>	     </td><td style="vertical-align:top"><asp:TextBox ID="txt_OrderingInfo" runat="server" Text="" Width = "600px" Height="60px" Font-Size="Small" TextMode="MultiLine"   Wrap="true"></asp:TextBox><br/> <br /></td></tr>
				</table> 
			 </asp:Panel>
				<br />
					<asp:Panel ID="Panel_MeasInfo_TimeEst_Edit" runat="server">
							<!-- GridView?? -->
					</asp:Panel>
			</td>
			<td style="vertical-align:top">
			<br /> 
			<asp:Button ID="btnEdit_MeasInfo_Submit" runat="server" Text="Submit" AutoPostBack="true" OnClick="Submit_EditMeasureInfo" Font-Size="X-Small" Visible="false"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnEdit_MeasInfo_Cancel" runat="server" Text="Cancel" OnCommand="Show_Stuff" CommandArgument="viewing_measinfo"  Font-Size="X-Small" Visible="false" ForeColor="Red" /><br /><br />

			<br /><br /><br />
		 <asp:Panel ID="Panel_MeasInfo_R_Edit" runat="server" Visible = "true"><br />
			<asp:Label ID="Label5" runat="server" Text="Data Characteristics:" Width="130px" Font-Underline="true"></asp:Label> <br /> 	
			<asp:Label ID="Label6" runat="server" Text="Category:" Width="120px"></asp:Label>      <asp:DropDownList ID="ddl_cat" runat="server" DataSourceID="sql_cat" DataValueField="meascatID" DataTextField="meascat" Font-Bold="true" ></asp:DropDownList>  <br/>
			<asp:Label ID="Label8" runat="server" Text="Focus:" Width="120px"></asp:Label>	       <asp:DropDownList ID="ddl_focus" runat="server" DataSourceID="sql_focus" DataValueField="measfocusID" DataTextField="measfocus" Font-Bold="true"></asp:DropDownList>  <br/>
			<asp:Label ID="Label10" runat="server" Text="Method:" Width="120px"></asp:Label>       <asp:DropDownList ID="ddl_meth" runat="server" DataSourceID="sql_meth" DataValueField="measmethodID" DataTextField="measmethod" Font-Bold="true"></asp:DropDownList>  <br/>
			<asp:Label ID="Label12" runat="server" Text="Respondent:" Width="120px"></asp:Label>   <asp:DropDownList ID="ddl_resp" runat="server" DataSourceID="sql_resp" DataValueField="measrespID" DataTextField="measresp" Font-Bold="true"></asp:DropDownList>  <br/>
			<asp:Label ID="Label9" runat="server" Text="Source:" Width="120px"></asp:Label>        <asp:DropDownList ID="ddl_source" runat="server" DataSourceID="sql_source" DataValueField="meassourceID" DataTextField="meassource" Font-Bold="true"></asp:DropDownList>  <br />
			<asp:Label ID="Label15" runat="server" Text="Source (description):"> </asp:Label> <br /> <asp:TextBox ID="txt_MeasSource_desc" runat="server" Width="300px"></asp:TextBox>

			<br /><br />
			<asp:Label ID="Label13" runat="server" Text="DE Form Name:" Width="120px"></asp:Label> <br /> <asp:TextBox ID="txt_DEformname" runat="server"></asp:TextBox><br />
			<br />
			<br />
<%--            <asp:Panel ID="Panel_LinkToTable" runat="server" Visible="false">            
				<asp:Label ID="Label21" runat="server" Text="Table Name:" Width="120px"></asp:Label> <br /> 
				<asp:DropDownList ID="ddl_AllTablesToLink" runat="server" DataSourceID="sql_AllTablesToLink"  DataValueField="tableID" DataTextField="tblname">
				</asp:DropDownList><br />
				<asp:Button ID="btnLinkTable" runat="server" Text="Link to Table" OnClick="LinkMeasureToTable"  />
			</asp:Panel>
--%>
			<br />
	   </asp:Panel></td>
			</tr>
		
			</table>
			</ContentTemplate>
			<Triggers>
				 <asp:PostBackTrigger ControlID="btnEdit_MeasInfo_Submit" />
				<asp:PostBackTrigger ControlID="btnEdit_MeasInfo_Cancel" />
			</Triggers>
			</asp:UpdatePanel>


	<br />


 <%--Upload and Edit Docs--%>
	<asp:UpdatePanel ID="Panel_UploadDocs" runat="server" Visible="false" UpdateMode="Conditional">
	<ContentTemplate>
		
		<asp:HiddenField ID="hidDocID" runat="server" Value="0"/>
		<asp:HiddenField ID="hidDocVersID" runat="server" Value="0"/>

	<table style="background-color:#B0C4DE">
	<tr>
	<%--Left Col--%>
	<td style="vertical-align:top">
		<asp:Label ID="lblDocType" runat="server" Text="Document type:" Font-Size="X-Small" Width = "200px"></asp:Label>
		<asp:Label ID="Label60" runat="server" Text="Document status:" Font-Size="X-Small"></asp:Label><br /> 
			   
		<asp:DropDownList ID="ddl_DocType" runat="server" DataSourceID="sql_doctype" DataValueField="DocTypeID" DataTextField="DocType" Width="200px">        </asp:DropDownList>
		<asp:DropDownList ID="ddl_DocStatus" runat="server" DataSourceID="sql_docstatus" DataValueField="DocStatusID" DataTextField="DocStatus">        </asp:DropDownList><br />

		<asp:Label ID="Label21" runat="server" Text="Title:" Font-Size="X-Small"></asp:Label><br />
		<asp:TextBox ID="txtDocTitle" runat="server" Width = "450px"></asp:TextBox><br />
		<asp:Label ID="Label51" runat="server" Text="Description:" Font-Size="X-Small"></asp:Label><br />
		<asp:TextBox ID="txtDocDesc" runat="server" TextMode="MultiLine" Width="450px" Height="100px"></asp:TextBox><br /><br />
		
		

		</td>
	

	<%--Right Col--%>
	<td style="vertical-align:top">        
		<asp:Label ID="Label52" runat="server" Text="Select file:" Font-Size="X-Small"></asp:Label><br />
		<asp:FileUpload ID="FileUpload_Doc" runat="server" Font-Size="Smaller" Width="400px" />
		<br /><br />
		<asp:Button ID="btnUploadDoc" runat="server" AutoPostBack="true" Text="Upload Document" OnClick="UploadDoc" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnUploadDoc_Cancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="UploadDoc_Cancel" ForeColor="Red" />
		<br />
		<br />
		<asp:Label ID="lblDocUploadInfo" runat="server" Text="" Font-Size="Smaller"></asp:Label>

	</td>
	</tr>
	</table>
	</ContentTemplate>
	<Triggers>
	<asp:PostBackTrigger ControlID="btnUploadDoc" />
	<asp:PostBackTrigger ControlID="btnUploadDoc_Cancel" />
	</Triggers>
	</asp:UpdatePanel>   


 <%-- View Docs --%>
<asp:UpdatePanel ID="Panel_ViewDocs" runat="server" UpdateMode="Conditional" Visible="false">
				<ContentTemplate>
	<asp:Label ID="lblDocs" runat="server" Text="Documents associated with this measure:" Font-Bold="true"  Font-Underline="true"></asp:Label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:Button ID="btnShowUploadDocPanel" runat="server" Text="Upload Docs" Font-Size="X-Small" OnClick="ShowUploadDocPanel" />
					<br />
	<asp:Repeater ID="Repeater_Docs_Meas" runat="server"  Visible="true"  >
	<ItemTemplate> 
		<table>
		<tr>
			<td width="30px"> <asp:Label ID="Label74" runat="server" Text="v." ForeColor="Gray"></asp:Label>
				<asp:Label ID="Label73" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "version") %>' Visible="true" ForeColor="Gray"></asp:Label></td>
			<td width="400px"> <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Font-Size="Small" ForeColor="DarkBlue" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "DocLink") %>' Text='<%# DataBinder.Eval(Container.DataItem, "DocTitle") %>' ></asp:HyperLink></td>
			<td > <asp:Label ID="Label70" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "DocType") %>' ForeColor="SlateGray" Font-Italic="true"></asp:Label></td>
			<td width="100px"> <asp:Label ID="Label72" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "docstatus") %>' ForeColor="SlateGray" Font-Italic="true"></asp:Label></td>
			<td> <asp:Label ID="Label19" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "fileext") %>' ForeColor="SlateGray" Font-Italic="true"></asp:Label></td>
		</tr>
		<tr>
			<td width="30px"></td>
			<td  width="400px">        <asp:Label ID="Label71" runat="server"  Text= '<%# DataBinder.Eval(Container.DataItem, "DocDesc") %>'></asp:Label>
										<asp:Label ID="Label3" runat="server"  Text= '<%# DataBinder.Eval(Container.DataItem, "ChangesDesc") %>'></asp:Label></td>    
			<td>        <asp:Label ID="Label61" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "DateSubmitted") %>' ForeColor="Silver"></asp:Label></td>    
			<td><asp:Label ID="Label59" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "DocID") %>' Visible="true" ForeColor="Silver"></asp:Label></td>
			<td></td>
		</tr>
		</table>
	</ItemTemplate>
	<SeparatorTemplate>
	<br />
	</SeparatorTemplate>

	</asp:Repeater>
   <br />
   <br />
   </ContentTemplate>
   <Triggers>
   <asp:PostBackTrigger ControlID="btnShowUploadDocPanel" />
   </Triggers>
   </asp:UpdatePanel>

	<%--Table Info--%>
	<asp:UpdatePanel ID="Panel_TableInfo" runat="server" Visible="false" UpdateMode="Conditional" EnableViewState="true">
	<ContentTemplate>
		<asp:Label ID="lblINTRO_measname" runat="server" Text="Data Dictionary" Visible="True" Font-Bold="true" Font-Underline="true" ></asp:Label>
		<br />

		<table>
		<tr>
		<td style="vertical-align:top" Width="300px">
			<asp:Label ID="static_tableID" runat="server" Text="tableID:" Width="100px"></asp:Label>  	      <asp:Label ID="lbl_tableID" runat="server" Text=""></asp:Label><br/>
			<asp:Label ID="static_TableName" runat="server" Text="TableName:" Width="100px"></asp:Label>	  <asp:Label ID="lbl_TableName" runat="server" Text="" Font-Bold="true"></asp:Label><br/>
			<asp:Label ID="static_N_Fields" runat="server" Text="N_Fields:" Width="100px"></asp:Label>	      <asp:Label ID="lbl_N_Fields" runat="server" Text=""  Font-Bold="true" Width="190px"></asp:Label><br/>
			<asp:Label ID="Label75" runat="server" Text="Scoring Proc:" Width="100px"></asp:Label>	      <asp:HyperLink ID="link_ScoringProc" runat="server" Target="_blank"></asp:HyperLink>
			<br />
			<br />   
			<asp:Button ID="btnInsertIntoFieldInfo" runat="server" Text="Insert into Meta Data" AutoPostBack="true"  OnClick="InsertIntoFieldInfo" Font-Size="X-Small" Visible="false"/>               
			<asp:Button ID="btn_CreateTableFromMetaData" runat="server" Text="Create Table From Meta Data" AutoPostBack="true"  OnClick="CreateTableFromMetaData" Font-Size="X-Small" Visible="false"/>   
							
		 </td>
		
		<td style="vertical-align:top" align="right" Width="500px">


		<asp:Button ID="btnHide_TableInfo" runat="server" Text="Hide" AutoPostBack="true"  OnCommand="Show_Stuff" CommandArgument="hiding_tableinfo" Font-Size="X-Small" Visible="false"/>   
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnBatchEdit_TableInfo" runat="server" Text="Batch Edit Fields" AutoPostBack="true" OnClick="Begin_BatchEditTableInfo" Font-Size="X-Small" Visible="false"/> 
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td>
		<asp:Button ID="btn_editValueSet" runat="server" Width="100px" Text="Edit Value Set:" Font-Size="X-Small" OnClick="EditValueSet" />
			<asp:TextBox ID="txt_ValueSet_ToEdit" runat="server" Text=""  Font-Size="X-Small"   Width="60px"></asp:TextBox>
		<br /><br />
		<asp:Button ID="btn_createNewValueSet" runat="server" Width="140px" Text="Create New Value Set:" Font-Size="X-Small" OnClick="CreateNewValueSet" />
			<asp:DropDownList ID="ddl_ValueSetMode" runat="server" >
				<asp:ListItem Text="csv: auto assign 1,2,3,etc." Value="csv"  />            
				<asp:ListItem Text="enter values manually" Value="manual" />            
				<asp:ListItem Text="pairs: val1,lab1|val2,lab2" Value="pairs" />            
			</asp:DropDownList>
		<br />
			<asp:TextBox ID="txt_ValueSet_ToAdd" runat="server" Text=""  Font-Size="X-Small"   Width="200px"></asp:TextBox>
		<br />
			<asp:Label ID="lblnewValueSets" runat="server" Text=""  Font-Size="X-Small" Width="500px" ></asp:Label>

	   <%-- <asp:Button ID="btnEdit_TableInfo_Submit" runat="server" Text="Submit" OnClick="Submit_EditTableInfo" Font-Size="X-Small" Visible="false"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnEdit_TableInfo_Cancel" runat="server" Text="Cancel" OnClick="Cancel_EditTableInfo" Font-Size="X-Small" Visible="false" ForeColor="Red" /><br /><br />
--%>
		</td>
		
		</tr>
		</table>
		

		<%--<asp:Panel ID="Panel_DataDict_Edit" runat="server">    </asp:Panel>--%>
		</ContentTemplate>

		<Triggers>
		<asp:PostBackTrigger ControlID="btnHide_TableInfo" />
		<asp:PostBackTrigger ControlID="btnBatchEdit_TableInfo" />
		<asp:PostBackTrigger ControlID="btn_editValueSet" />
		<asp:PostBackTrigger ControlID="btn_CreateTableFromMetaData" />
		<asp:PostBackTrigger ControlID="btnInsertIntoFieldInfo" />
		</Triggers>
	</asp:UpdatePanel>


	<%--Edit Value Set--%>
	   <asp:UpdatePanel ID="Panel_ValueSet" runat="server"  Visible="false" UpdateMode="Conditional" ChildrenAsTriggers="true"> 
	   <ContentTemplate>
		<br />       <br />           
		<asp:Label ID="Label76" runat="server" Text="Edit Value Set" Font-Bold="true" ForeColor="Navy"></asp:Label><br />

		<table>
		<tr>
		<td><asp:Label ID="Label77" runat="server" Text="fvsID:" ForeColor="Gray"></asp:Label>          
		   <asp:Label ID="lbl_fvsID_main" runat="server" Text="" Font-Bold="true"></asp:Label>
		   <asp:Label ID="lbl_fvsLabel_main" runat="server" Text=""></asp:Label>

		 <br />
		 <br />
	   <asp:GridView ID="gv_ValueSet" runat="server" DataSourceID="sql_ValueSet" AutoGenerateColumns="false" AutoGenerateDeleteButton="true" 
		datakeynames="pk" ForeColor="Navy" >
	   <Columns>
	   <asp:TemplateField>
			<HeaderTemplate> </HeaderTemplate>
			<ItemTemplate>
				<asp:Button ID="btn_Edit_ValueSetItem" runat="server" Font-Size="X-Small" Text="Edit" OnCommand="ValueSet_RowCommand" CommandName="EditValueSetItem" 
				CommandArgument='<%# DataBinder.Eval(Container.DataItem, "pk") + "|" + DataBinder.Eval(Container.DataItem, "FieldValue")  + "|" + DataBinder.Eval(Container.DataItem, "FieldValueLabel")%>'  />
			</ItemTemplate>
			
	   </asp:TemplateField>

	   <asp:TemplateField>
			<HeaderTemplate>pk</HeaderTemplate>
			<ItemTemplate><asp:Label ID="lbl_fvs_pk" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "pk") %>' /></ItemTemplate>
			<EditItemTemplate><asp:Label ID="lbl_fvs_pk_forUpdate" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "pk") %>' /></EditItemTemplate>
			<InsertItemTemplate></InsertItemTemplate>
	   </asp:TemplateField>

	   <asp:TemplateField>
			<HeaderTemplate>Value</HeaderTemplate>
			<ItemTemplate><asp:Label ID="lbl_fvs_value" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldValue") %>' /></ItemTemplate>
			<EditItemTemplate><asp:TextBox ID="txt_fvs_value" runat="server" Width="80px"  Text= '<%# DataBinder.Eval(Container.DataItem, "FieldValue") %>' /></EditItemTemplate>
			<InsertItemTemplate></InsertItemTemplate>
	   </asp:TemplateField>

	   <asp:TemplateField>
			<HeaderTemplate>Label</HeaderTemplate>
			<ItemTemplate><asp:Label ID="lbl_fvs_valuelabel" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldValueLabel") %>' /></ItemTemplate>
			<EditItemTemplate><asp:TextBox ID="txt_fvs_valuelabel" runat="server" Width="250px" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldValueLabel") %>' /></EditItemTemplate>
			<InsertItemTemplate></InsertItemTemplate>
	   </asp:TemplateField>
	   </Columns>
	   </asp:GridView>
		</td>
				   <td>    

					<asp:HiddenField ID="hid_valueset_edittype" runat="server" Value=""/>
					<asp:HiddenField ID="hidpk" runat="server" Value=""/>
				<asp:Button ID="btnEdit_ValueSet_InsertNew" runat="server" Text="Insert New Label" AutoPostBack="true" OnClick="Edit_ValueSet_InsertNew" Font-Size="X-Small" ForeColor="Black" />

				<asp:Panel ID="Panel_ValueSet_Edits" runat="server" Visible="false">
					   
				<asp:Label ID="Label78" runat="server" Text="New Value" Font-Size="X-Small"></asp:Label>
				<asp:TextBox ID="txt_Insert_NewValue" runat="server" Width="70px"></asp:TextBox> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           
				<asp:Button ID="btnEdit_ValueSet_Update" runat="server" Text="Submit changes" AutoPostBack="true" OnClick="Edit_ValueSet_Submit" Font-Size="X-Small" ForeColor="Black" />
				<br />
				<asp:Label ID="Label79" runat="server" Text="New Label" Font-Size="X-Small"></asp:Label>
				<asp:TextBox ID="txt_Insert_NewValueLabel" runat="server" Width="300px"></asp:TextBox> 
				</asp:Panel>

			<br /><br />
		   <asp:Button ID="btnEdit_ValueSet_Cancel" runat="server" Text="Cancel Editing" OnClick="Edit_ValueSet_Cancel" ForeColor="Red"  Font-Size="Smaller"/>
		 </td>
 
		</tr>
		</table>
		   
	   </ContentTemplate>
	   <Triggers>
	   <asp:PostBackTrigger ControlID="btnEdit_ValueSet_Update" />
	   <asp:PostBackTrigger ControlID="btnEdit_ValueSet_Cancel" />
	   <asp:PostBackTrigger ControlID="btnEdit_ValueSet_InsertNew" />
	   </Triggers>
	   </asp:UpdatePanel>

	   <asp:SqlDataSource ID="sql_ValueSet" runat="server"
		ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>"
		SelectCommand="select pk,	FieldValueSetID,	FieldValue,	FieldValueLabel from datFieldValueSetItem where fieldvaluesetID = @fvsID"
		InsertCommand="INSERT INTO [datFieldValueSetItem] ([fieldvaluesetID], [FieldValue], [FieldValueLabel]) VALUES (@fvsID, @Value, @ValueLabel)"
		UpdateCommand="update datFieldValueSetItem  set FieldValue=@Value, FieldValueLabel=@ValueLabel   where pk = @pk"          
		DeleteCommand="delete from datFieldValueSetItem  where pk = @pk"          >
		 <SelectParameters>
		 <asp:ControlParameter ControlID="lbl_fvsID_main" Name="fvsID" Type="Int32" PropertyName="Text" />
		</SelectParameters>
		<InsertParameters>
		<asp:Parameter Name="Value" Type="String" />
		<asp:Parameter Name="ValueLabel" Type="String" />
		<asp:Parameter Name="fvsID" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="pk" Type="Int32" />
		<asp:Parameter Name="Value" Type="Int32" />
		<asp:Parameter Name="ValueLabel" Type="String" />
		</UpdateParameters>
		 <DeleteParameters>
		 <asp:Parameter Name="pk" Type="Int32" />
		</DeleteParameters>
		</asp:SqlDataSource>

		
	   <%--Field Info--%> 
		<asp:Panel ID="Panel_FieldInfo" runat="server"  Visible="false"> 
		
		
		<br /><br />
		<asp:GridView ID="gv_FieldInfo" runat="server" Visible="true" EmptyDataText="No fields defined for this table name." AutoGenerateColumns="false" EnableViewState="true" 
		   OnRowEditing="gv_FieldInfo_RowEditing" OnRowUpdating="gv_FieldInfo_RowUpdating" OnRowCancelingEdit="gv_FieldInfo_RowCancelingEdit" >
		<Columns>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_pos" runat="server" Font-Bold="true" Text="position"/>	</HeaderTemplate> <ItemTemplate>
			<asp:Label ID="lblitm_pos" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "position") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate><asp:Label ID="lblitm_pk" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "fieldinfo_pk") %>' Visible="false"></asp:Label>
				<asp:TextBox ID="txtitm_pos" runat="server" Width="40px" Text= '<%# DataBinder.Eval(Container.DataItem, "position") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_fldName" runat="server" Font-Bold="true" Text="FieldName"/>	</HeaderTemplate> <ItemTemplate>
			<asp:Label ID="lblitm_fldName" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldName") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate><asp:TextBox ID="txtitm_fldName" runat="server" Width="80px" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldName") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_dataType" runat="server" Font-Bold="true" Text="DataType"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_dataType" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "DataType") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate><asp:DropDownlist ID="ddlitm_dataType" runat="server" SelectedValue= '<%# DataBinder.Eval(Container.DataItem, "DataType_only") %>'>
								<asp:ListItem Text="int" Value="int" />
								<asp:ListItem Text="float" Value="float" />
								<asp:ListItem Text="varchar" Value="varchar" />
								<asp:ListItem Text="datetime" Value="datetime" />    
								</asp:DropDownlist>
			<asp:TextBox ID="txtitm_DatatypeLength" runat="server" Width="80px" Text= '<%# DataBinder.Eval(Container.DataItem, "DataTypeLength") %>'></asp:TextBox>
	
			</EditItemTemplate></asp:TemplateField>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_Label" runat="server" Font-Bold="true" Text="FieldLabel"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_Label" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldLabel_for_label") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate>
			<asp:Label ID="lbltxtitm_Label" runat="server" Font-Bold="false" Font-Size="X-Small" Text="Field Label:"/><br />
			<asp:Textbox ID="txtitm_Label" runat="server" Width="450px" Height="48px" TextMode="MultiLine" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldLabel") %>'></asp:TextBox><br />
			<asp:Label ID="lbltxtitm_DE_Form_Label" runat="server" Font-Bold="false" Font-Size="X-Small" Text="DE Form label:"/><br />
				<asp:Textbox ID="txtitm_DE_Form_Label" runat="server" Width="450px" Height="48px"  TextMode="MultiLine" Text= '<%# DataBinder.Eval(Container.DataItem, "ASPXFieldLabelText") %>'></asp:TextBox>
			</EditItemTemplate></asp:TemplateField>

	

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_Min" runat="server" Font-Bold="true" Text="Validation Rules"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_Min" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "ValidationRules") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate>
				<asp:Label ID="lbltxtitm_MinVal" runat="server" Font-Bold="true" Text="Min:"/>
				<asp:Textbox ID="txtitm_MinVal" runat="server" Width="40px"  Text= '<%# DataBinder.Eval(Container.DataItem, "MinVal") %>'/>
				<asp:Label ID="lbltxtitm_MaxVal" runat="server" Font-Bold="true" Text="Max:"/>
				<asp:Textbox ID="txtitm_MaxVal" runat="server" Width="40px"  Text= '<%# DataBinder.Eval(Container.DataItem, "MaxVal") %>' /><br />
		
				<asp:Label ID="lblhdr_VldLst" runat="server" Font-Bold="true" Text="ValidList:"/>
				<asp:TextBox ID="txtitm_ValdLst" runat="server" Width="120px" Text= '<%# DataBinder.Eval(Container.DataItem, "ValidList") %>'/><br />

				<asp:Label ID="lbltxtitm_RegEx" runat="server" Font-Bold="true" Text="RegEx:"/><br />
				<asp:TextBox ID="txtitm_RegEx" runat="server" Width="120px" Text= '<%# DataBinder.Eval(Container.DataItem, "RegEx") %>'/><br />
				<asp:Label ID="lbltxtitm_RegExDesc" runat="server" Font-Bold="true" Text="RegEx Desc:"/><br />
				<asp:TextBox ID="txtitm_RegExDesc" runat="server" Width="120px" Text= '<%# DataBinder.Eval(Container.DataItem, "RegExDescription") %>'/>

			   </EditItemTemplate></asp:TemplateField>

			   <%--       position TableName FieldName FieldStatus FieldLabel DataType InFieldInfo MISSVAL ValidationRules valuesetID Value Labels RelInfo FieldCodeID FieldCode --%>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_MissVal" runat="server" Font-Bold="true" Text="MissVal"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_MissVal" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "MissVal") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate><asp:TextBox ID="txtitm_MissVal" runat="server" Width="100px"  Text= '<%# DataBinder.Eval(Container.DataItem, "MissVal") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_fvsID" runat="server" Font-Bold="true" Text="Value Labels"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_fvsID" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "ValueLabels") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate>
				<asp:TextBox ID="txtitm_fvsID" runat="server" Width="40px"  Text= '<%# DataBinder.Eval(Container.DataItem, "fieldvaluesetID") %>'></asp:TextBox>
				</EditItemTemplate></asp:TemplateField>

		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_InAnalysis" runat="server" Font-Bold="true" Text="InAnalysis"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_InAnalysis" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "InAnalysis") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate>
			<asp:Label ID="lblhdr_InAnalysis" runat="server" Font-Bold="true" Text="InAnalysis: (0=NO, 1=Yes, "/><br />
			<asp:Label ID="Label63" runat="server" Font-Bold="true" Text=" 2=Contin. Var, 3=Categ. Var)"/>
				<asp:TextBox ID="txtitm_InAnalysis" runat="server" Width="40px" Text= '<%# DataBinder.Eval(Container.DataItem, "InAnalysis") %>'></asp:TextBox>
				</EditItemTemplate></asp:TemplateField>
		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_RelItem" runat="server" Font-Bold="true" Text="Rel Info"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_RelItem" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "RelInfo") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate>
			<asp:Label ID="lbltxtitm_RelItem" runat="server" Text= 'Item:'></asp:Label>
			<asp:TextBox ID="txtitm_RelItem" runat="server" Width="30px" Text= '<%# DataBinder.Eval(Container.DataItem, "RelItem") %>'></asp:TextBox><br />
			<asp:Label ID="lbltxtitm_RelScore" runat="server"  Text= 'Score:'></asp:Label>
			<asp:TextBox ID="txtitm_RelScore" runat="server" Width="30px" Text= '<%# DataBinder.Eval(Container.DataItem, "RelScore") %>'></asp:TextBox><br />
			<asp:Label ID="Label23" runat="server" Text= 'Agree Threshhold:'></asp:Label>
			<asp:TextBox ID="txtitm_RelAgreeThreshold" runat="server" Width="40px" Text= '<%# DataBinder.Eval(Container.DataItem, "RelAgreeThreshold") %>'></asp:TextBox>
			</EditItemTemplate></asp:TemplateField>
			   
		<asp:TemplateField><HeaderTemplate>
			<asp:Label ID="lblhdr_FieldCode" runat="server" Font-Bold="true" Text="Field Code"/>	</HeaderTemplate><ItemTemplate>
			<asp:Label ID="lblitm_FieldCode" runat="server" Text= '<%# DataBinder.Eval(Container.DataItem, "FieldCode") %>'></asp:Label></ItemTemplate>	
			<EditItemTemplate>
			<asp:DropDownList ID="ddlitm_FieldCodeID" runat="server" DataSourceID="sql_FieldCodes_for_DDL" DataTextField="fieldcode" DataValueField="fieldcodeID" 
				   SelectedValue = '<%# DataBinder.Eval(Container.DataItem, "fieldcodeID") %>'  ></asp:DropDownList>
				
				</EditItemTemplate></asp:TemplateField>
				
		</Columns>
		
		 </asp:GridView>


		
		 </asp:Panel>


<!-- todo -->

	

	<asp:SqlDataSource ID="sql_AllTablesToLink" runat="server" SelectCommandType="Text" 
	SelectCommand="select 0 as tableID, '<..select table..>' as tblname  union select tableID, name as tblname from uwautism_research_data..dattable where name like 'all_%' and tableID not in  (select tableID from uwautism_research_data..dattable_measure)" 
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

<%--    <asp:SqlDataSource ID="sql_Fields" runat="server" SelectCommandType="Text" 
	SelectCommand="select  '<..select field..>' databasefield union select databasefield from dat FieldInfo where databasetable = @tablename order by databasefield" 
	ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>" >
	<SelectParameters><asp:ControlParameter ControlID="lbl_TableName" Name="tablename" /></SelectParameters>
	</asp:SqlDataSource>--%>

	<asp:SqlDataSource ID="sql_FieldCodes_for_DDL" runat="server" SelectCommandType="Text" 
	SelectCommand="select null fieldcodeID, '<..select code..>' fieldcode union select fieldcodeID, fieldcode from datFieldCode " 
	ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>" >
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_SpecFields" runat="server" SelectCommandType="Text" 
	SelectCommand="select a.FieldID, a.Name, a.fieldcodeID , fieldcode from datfield a join datFieldCode b ON a.fieldcodeID=b.fieldcodeID where tableID = @tableID " 
	UpdateCommand="update datFieldCode set name=@name, fieldcodeID=@fieldcodeID where fieldID=@fieldID"

	ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
	<SelectParameters><asp:ControlParameter ControlID="lbl_tableID" Name="tableID" /></SelectParameters>
	<UpdateParameters>
		<asp:ControlParameter ControlID="txt_fieldname" Name="name" Type="String" />
		<asp:ControlParameter ControlID="ddl_FieldCodeID" Name="fieldcodeID" Type="Int16" />
		<asp:Parameter Name="fieldID" Type="Int16"/>
	</UpdateParameters>

	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_OtherStudies" runat="server" SelectCommandType="Text" 
	SelectCommand="select StudyName, count(*) as [# times] from vwStudyMeas where measureID = @measureID group by studyname" 
	ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
	<SelectParameters><asp:ControlParameter ControlID="DDL_SelectMeasureID" Name="measureID" /></SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_cat"    runat="server" SelectCommandType="Text" SelectCommand="select 0 MeasCatID, '<select>' meascat       union select MeasCatID, meascat       from tblMeasureCat_lkup " ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>
	<asp:SqlDataSource ID="sql_focus"  runat="server" SelectCommandType="Text" SelectCommand="select 0 MeasFocusID, '<select>' MeasFocus   union select MeasFocusID, MeasFocus   from tblMeasFocus_lkup " ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>
	<asp:SqlDataSource ID="sql_meth"   runat="server" SelectCommandType="Text" SelectCommand="select 0 MeasMethodID, '<select>' MeasMethod union select MeasMethodID, MeasMethod from tblMeasMethod_lkup" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>
	<asp:SqlDataSource ID="sql_resp"   runat="server" SelectCommandType="Text" SelectCommand="select 0 MeasRespID, '<select>' MeasResp     union select MeasRespID, MeasResp     from tblMeasResp_lkup " ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>
	<asp:SqlDataSource ID="sql_source" runat="server" SelectCommandType="Text" SelectCommand="select 0 MeasSourceID, '<select>' MeasSource union select MeasSourceID, MeasSource from tblMeasSource_lkup" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>

   <asp:SqlDataSource ID="sql_doctype" runat="server" SelectCommandType="Text" SelectCommand="select 0 DocTypeID, '<..select..>' as DocType union select DocTypeID, DocType from tblDocType_lkup where DocTypeID in (2,21,10, 15,16) order by DocType" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>

   <asp:SqlDataSource ID="sql_docstatus" runat="server" SelectCommandType="Text" SelectCommand="select 0 DocStatusID, '<..select..>' DocStatus union select DocStatusID, DocStatus from tblDocStatus_lkup order by 1" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>
	
</asp:Content>


