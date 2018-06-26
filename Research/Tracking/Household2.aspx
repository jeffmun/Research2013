
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Household2.aspx.cs" AutoEventWireup="true" EnableEventValidation="true"
 Inherits="Tracking_Household2" Title="Household Info"  %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	
<style type="text/css"> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style type="text/css"> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style type="text/css"> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style type="text/css"> .rowstyleAction   {   background-color:gray;  } </style>  
<style type="text/css"> .right_align { text-align: right; }  </style>
<style type="text/css">  p {color: DarkBlue; }
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
<style type="text/css">
	.custom-validator
	{
		position: relative !important;
		top:-2px !important;
		left: -2px !important;
	}
</style>


	<style type="text/css">
	.container-red input
	{
		color: #FF0000 !important;
	}

	.container-blue input
	{
		color: #0000FF !important;
	}
</style>


	
<%--from :  http://stackoverflow.com/questions/14746564/asp-net-get-screen-width?rq=1--%>
<input type="hidden" value="" name="clientScreenHeight" id="clientScreenHeight" />
<input type="hidden" value="" name="clientScreenWidth" id="clientScreenWidth" />

<asp:HiddenField ID="hidHouseholdID" runat="server" />
<asp:HiddenField ID="hidPersonID" runat="server" />



	
<%--GENERAL FUNCTIONS FOR OBOUT--%>
<script type="text/javascript">
	function onFailedAction(error) {
		alert(error.get_message());
	}

	function SyncDDL(ddl, val)
	{
		var numopts = ddl.options.length;
		for (var opts = 0; opts < numopts; opts++) {
			var optval = ddl.options[opts].value;
			if (ddl.options[opts].value == val) {
				ddl.value(ddl.options[opts].value);
				flag = true;
				break;
			}
		}
	}


	function SyncTextBox(txt, val) {
		var numopts = ddl.options.length;
		for (var opts = 0; opts < numopts; opts++) {
			var optval = ddl.options[opts].value;
			if (ddl.options[opts].value == val) {
				ddl.value(ddl.options[opts].value);
				flag = true;
				break;
			}
		}
	}


	function validate() {
		if (!Page_ClientValidate()) {
			alert('Error: Mandantory fields required');
			return false;
		}
		alert('here');
		return true;
	}
</script>

<%--TOGGLE VISIBILITY OF DETAILS--%>
<script type="text/javascript">
	var elementsToExpand;
	function toggleDetailLevel(level, expand) {

		var elements = document.getElementsByTagName('IMG');
		elementsToExpand = new Array();
		for (var i = 0; i < elements.length; i++) {
			try {
				if (elements[i].parentNode.className == 'ob_gDGEB') {
					var isExpanded = false;
					if (elements[i].src.toString().indexOf('details_btn_open.gif') == -1) {
						isExpanded = true;
					}

					if (isExpanded != expand && level == getDetailGridLevel(elements[i])) {
						elementsToExpand.push(elements[i]);
						window.setTimeout('toggleDetailGrid(' + (elementsToExpand.length - 1) + ')', 250);
					}
				}
			} catch (ex) { };
		}
	}

	function toggleDetailGrid(i) {
		try {
			elementsToExpand[i].onclick();
		} catch (ex) { };
	}

	function getDetailGridLevel(element) {
		var level = 0;
		while (element.parentNode && element.id != gridP.GridBodyContainer.id) {
			element = element.parentNode;

			if (element.className == 'ob_gDGCCT') {
				level++;
			}
		}

		return level;
	}
	</script>



	<%--PERSONS--%>
<script type="text/javascript">
	

	function OnClientPopulateControls_P(sender, record, type) {
		//alert("setupP_step1");
		//update the controls in the row edit template
		try {

			var btnP_Update = document.getElementById("btnP_UpdateContainer");
			var btnP_Insert = document.getElementById("btnP_InsertContainer");
			var btnNewSubjectContainer = document.getElementById("btnNewSubjectContainer");


			if (type == "add") {
				btnP_Update.style.display = 'none';
				btnP_Insert.style.display = '';
			}
			else if (type == "edit") {
				btnP_Update.style.display = '';
				btnP_Insert.style.display = 'none';
			}

			if (record.Sex == "" | record.dob == "")
			{
				btnNewSubjectContainer.style.display = '';
				divNEEDINFO.style.display = '';
			}
			else {
				btnNewSubjectContainer.style.display = '';
				divNEEDINFO.style.display = 'none';
			}

			var hid = document.getElementById("<%= hidHouseholdID.ClientID %>");
			record.HouseholdID = hid.value;

			var hidPersonID = document.getElementById("<%= hidPersonID.ClientID %>");
			hidPersonID.value = record.personID;

			if (record.personID == "") {
				record.role = "15";
				record.EthnicityID = "7";
				record.HispanicID = "3";
			}

			SyncDDL(ddl_EthnicityID, record.EthnicityID);
			SyncDDL(ddl_HispanicID, record.HispanicID);
			SyncDDL(ddl_PersonRoleID, record.role);

			if (record.MainContact != "0") {
				chkMainContact.checked(true);
			}
			else {
				chkMainContact.checked(false);
			}

			//txt_P_notes.value = record.notes;
			txt_P_notes.TextBox.value = record.notes;


			//prepopulate for inserting new records
			//txt_HouseholdID.TextBox.value = record.HouseholdID;

		}
		catch (err) {
			alert("Error.  " + err.message);
		}

	}


	function OnBeforeClientUpdate_P(sender, record) {

		//alert("onSaving_P_2");
		var personID = "";
		
		if (record.personID) {
			if (personID == "") {
				personID = record.personID;
			}
			if (record.personID) {
				PageMethods.UpdateP("update", record.HouseholdID, record.personID, record.LastName, record.FirstName, record.MiddleName, record.NickName, record.LastNameOnBC, record.CityOfBirth, record.StateOfBirth, record.Sex,
					record.dob, record.role, record.EthnicityID, record.HispanicID, record.MainContact, "-999", "-999", record.notes, onSucceeded_P, onFailedAction);
			}
		}

		
		return false;
	}

	function OnBeforeClientInsert_P(sender, record) {

		//alert("OnBeforeClientInsert_P");

		var hid = document.getElementById("<%= hidHouseholdID.ClientID %>");

		PageMethods.UpdateP("insert", hid.value, "0", record.LastName, record.FirstName, record.MiddleName, record.NickName, record.LastNameOnBC, record.CityOfBirth, record.StateOfBirth, record.Sex,
			record.dob, record.role, record.EthnicityID, record.HispanicID, record.MainContact, "-999", "-999", record.notes, onSucceeded_P_INSERT, onFailedAction);


		//location.reload(true);

		return false;
	}



	function OnBeforeClientDelete_P(sender, record) {

		//alert("OnBeforeClientDelete_P");
		var nsubj = record.nsubj;
		var hid = document.getElementById("<%= hidHouseholdID.ClientID %>");

		if (nsubj > 0)
		{
			alert("This person is a subject in one or more studies.  If a person is a subject, they cannot be deleted.  Contact Jeff Munson with questions.")
		}
		else
		{
			if (confirm("Are you sure you want to delete this person?") == false) { return false; }
			else { return true; }
		}

		//return false because the actual deleting is done by the web method.
		//return false;
	}

	function onSucceeded_P() {
		//alert("onSucceeded_P");
		gridP.refresh();
	}

	function onSucceeded_P_INSERT() {
		//alert("onSucceeded_P_INSERT");
		//gridP.refresh();
		location.reload(true);
	}



</script>


	<%--EMAIL PHONE ADDRESS EMERCONTACT--%>
	<script type="text/javascript">
	

	function onDeleting_Email(sender, record)
	{
		if (confirm("Are you sure you want to delete '" + sender.emailaddress + "'?") == false) {return false; }
		else { return true; }
	}

	function onDeleting_Phone(sender, record) {
		if (confirm("Are you sure you want to delete '" + sender.PhoneNum + "'?") == false) { return false; }
		else { return true; }
	}

	function onDeleting_Address(sender, record) {
		if (confirm("Are you sure you want to delete '" + sender.addresstext + "'?") == false) { return false; }
		else { return true; }
	}

	function onDeleting_LogContact(sender, record) {
		if (confirm("Are you sure you want to delete contact from '" + record.logdate + "'?") == false) { return false; }
		else { return true; }
	}

	function onDeleting_loginfo(sender, record) {
		if (confirm("Are you sure you want to delete info from '" + record.loginfodate + "'?") == false) { return false; }
		else { return true; }
	}

	function onDeleting_EmerContact(sender, record) {
		if (confirm("Are you sure you want to delete emergency contact '" + sender.Firstname + " " + sender.LastName + "'?") == false) { return false; }
		else { return true; }
	}

	function saveChanges_P_1(btnObj) {
		//alert("saveChanges_P_1");
		gridP.save();
		return false;
	}

	function saveChanges_Address(btnObj) {
		//alert("saveChanges_Address");
		gridAddress.save();
		return false;
	}



	

	function setup_LogContact(sender, record) {
		//alert("setupP_step1");
		//update the controls in the templates
		try {

			SyncDDL(ddl_logcontactpurposeID, record.logcontactpurposeID);
			SyncDDL(ddl_logpriorityID, record.logpriorityID);
			SyncDDL(ddl_logcontacttypeID, record.logcontacttypeID);
			txt_lognotes.TextBox.value = record.lognotes;

		}
		catch (err) {
			alert("Error.  " + err.message);
		}

	}


	function setup_loginfo(sender, record) {
		//alert("setupP_step1");
		//update the controls in the templates
		try {

			SyncDDL(ddl_loginfocatID, record.loginfocatID);
			SyncDDL(ddl_loginfopriorityID, record.logpriorityID);
			txt_loginfonotes.TextBox.value = record.loginfonotes;

		}
		catch (err) {
			alert("Error.  " + err.message);
		}

	}

	function onInserting_LogContact(sender, record) {
		//alert("onInserting_LogContact");
		var hid = document.getElementById("<%= hidHouseholdID.ClientID %>");
		record.HouseholdID = hid.value;
		return true;
	}

	function onInserting_loginfo(sender, record) {
		//alert("onInserting_LogContact");
		var hid = document.getElementById("<%= hidHouseholdID.ClientID %>");
		record.HouseholdID = hid.value;
		return true;
	}



	function onCallbackError(errorMessage, commandType, recordIndex, data) {
		alert(errorMessage);
		if (commandType != "Delete") {
			errorData = data;
			window.setTimeout('restoreGridState("' + commandType + '", ' + recordIndex + ');', 250);
		}

	}


	function ShowPersonMessage(msg)
	{
		alert(msg);

	}

	function NewSubject_Click(btnObj)
	{
		var pID = record.personID;
		window.location.assign("~/Household/CreateSubject.aspx?personID=" + record.personID);
		return false;
	}

	function gridDetail_OnCustomButtonClick(s, e) {

		//window.open('~/Track/Subject.aspx');
		window.location.assign('~/Track/Subject.aspx');
		//if (e.visibleIndex % 2 === 0)
		//    alert("You cannot edit this row!");
		//else
		//    s.StartEditRow(e.visibleIndex);
	}
	</script>



 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

<table width="90%">
	
	<tr>
		<td  Width="20%">
			<asp:Label ID="Label1" runat="server" Text="Household Information" Font-Size="Medium" Font-Bold="false"></asp:Label>
		</td>
		<td  Width="60%" colspan="2">
			<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
			<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

		</td>
		<td  Width="20%">

		</td>
	</tr>
	<tr>
		<td >
		</td>  
		<td>
			<obout:OboutDropDownList ID="ddlID" runat="server" OnSelectedIndexChanged="ddlID_SelectedIndexChanged" Width="210px" Height="200px"  AutoPostBack="true"></obout:OboutDropDownList>

		</td>
		<td>
			<asp:Button ID="btnOld" runat="server" Text="Goto Old Household Page" OnClick="btnOld_Click" Font-Bold="true" ForeColor="DeepSkyBlue" Visible="false" />
		</td>
		<td align="right">
<%--			<asp:RequiredFieldValidator EnableClientScript="true"  ID="RequiredFieldValidator_HHname" runat="server" ControlToValidate="txtNewHHname" ErrorMessage="Enter a name for the new household." InitialValue="New Household Name"
				Display="Dynamic" CssClass="custom-validator" ValidationGroup="NewHH" />
			<obout:OboutTextBox ID="txtNewHHname" runat="server" WatermarkText="New Household Name"  ></obout:OboutTextBox><br />

			<obout:OboutButton ID="btnHouseholdINSERT" runat="server" Text="Create New Household" 
				CausesValidation="true" ValidationGroup="NewHH" OnClick="btnHouseholdINSERT_Click" ></obout:OboutButton>--%>
			<obout:OboutButton ID="btnGotoCreate" runat="server" Text="Create New Household"
				OnClick="btnGotoCreate_OnClick"></obout:OboutButton> 

			<br />
			<asp:Label ID="lblEnterName" runat="server" Text="" ForeColor="Blue" Font-Size="XX-Small"></asp:Label>
		</td>
	</tr>
</table>

<%--    OnClick="btnHouseholdINSERT_Click" --%>

<table>
	<tr>
		<td>

		</td>
		<td style="vertical-align:top">
			<asp:Panel  ID="p_timepoint" runat="server"  Visible="true"></asp:Panel>
		</td>
		<td style="width:100px">

		</td>
		<td>
			<obout:OboutButton runat="server" Text="Excel" Visible="false" OnClientClick="exportToExcel();return false;" />
		</td>
	</tr>
</table>




<br />


<%--	<asp:UpdatePanel ID="panel" runat="server" Visible="false" UpdateMode="Conditional" >
		<ContentTemplate>--%>

	<asp:Panel ID="panelMAIN" runat="server" Visible="false" >


	<asp:Label ID="lblHHname" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"  ></asp:Label>

		<dx:ASPxButton ID="btnShowAll" runat="server" ClientInstanceName="btnShowAll"  Text="+" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
			<ClientSideEvents Click="function() { dxgridPeople.ExpandAllDetailRows(); }" />
		</dx:ASPxButton>
		<dx:ASPxButton ID="btnCollapseAll" runat="server" ClientInstanceName="btnCollapseAll"  Text="-" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
			<ClientSideEvents Click="function() { dxgridPeople.CollapseAllDetailRows(); }" />
		</dx:ASPxButton>

	<table>
		<tr>
			<td >
				<dx:ASPxGridView ID="dxgridPeople" runat="server" ClientInstanceName="dxgridPeople"  
					DataSourceID="sql__person" KeyFieldName="personID"   KeyboardSupport="true" AccessKey="D"
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"
					OnRowValidating="dxgridPeople_RowValidating"
					OnHtmlRowPrepared="dxgridPeople_OnHtmlRowPrepared" OnRowInserting="dxgridPeople_OnRowInserting" OnRowUpdating="dxgridPeople_OnRowUpdating">
					<SettingsEditing Mode="EditFormAndDisplayRow" />
					<SettingsPager Mode="ShowAllRecords" />
					<SettingsText ConfirmDelete="true" />
					<Columns>
						<dx:GridViewDataColumn FieldName="personID" Caption="" Visible="false" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="LastName" Caption="Last Name"  Width="120px" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="FirstName" Caption="First Name"  Width="100px"  CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="NickName" Caption="Nick Name"  Width="80px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="MiddleName" Caption="Middle Name"  Visible="false" Width="80px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Sex" Caption="Sex" Width="50px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="DOB" Caption="DOB" Width="100px"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="currageYM" Caption="Age (Y:M)" Width="60px"   ReadOnly="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="CityOfBirth" Caption="City of birth" Visible="false" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="StateOfBirth" Caption="State of birth" Visible="false" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="LastNameOnBC" Caption="Last Name on Birth Cert" Visible="false" ></dx:GridViewDataColumn>


						<dx:GridViewDataComboBoxColumn FieldName="Role" Caption="Role"  >
							<PropertiesComboBox TextField="PersonRole" ValueField="Role" DataSourceID='sql_Personrole'  />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataComboBoxColumn FieldName="EthnicityID" Caption="Race"  >
							<PropertiesComboBox TextField="EthnicityDesc" ValueField="EthnicityID" DataSourceID='sql_Ethnicity'  />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataComboBoxColumn FieldName="HispanicID" Caption="Ethnicity"  >
							<PropertiesComboBox TextField="HispanicDesc" ValueField="HispanicID" DataSourceID='sql_Hispanic'  />
						</dx:GridViewDataComboBoxColumn>


						<dx:GridViewDataTextColumn FieldName="notesOtherID" Caption="Notes/OtherID's" Width="250px" PropertiesTextEdit-EncodeHtml="false" ReadOnly="true"
							   EditFormSettings-Visible="false">

						</dx:GridViewDataTextColumn>
						<dx:GridViewDataColumn FieldName="MainContact" Caption="MainContact" Visible="false"></dx:GridViewDataColumn>


						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true" />

					</Columns>
					<%--<EditFormLayoutProperties ColCount="1">
						<Items>
							<dx:GridViewLayoutGroup ColCount="3" Caption="Personal Info">
								<Items>
									<dx:GridViewColumnLayoutItem ColumnName="LastName" Width="30%" />
									<dx:GridViewColumnLayoutItem ColumnName="FirstName" Width="30%"  />
									<dx:GridViewColumnLayoutItem ColumnName="NickName" Width="30%"/>
									<dx:GridViewColumnLayoutItem ColumnName="Sex" Width="20%"/>
									<dx:GridViewColumnLayoutItem ColumnName="DOB" Width="20%"/>

									<dx:GridViewColumnLayoutItem Caption="Role">
										<Template>
											<dx:ASPxComboBox ID="cboPersonRole" runat="server" FieldName="Role" Caption="" Width="150"   
												ValidationSettings-RequiredField-IsRequired="true"
												Value='<%# Bind("Role") %>'  TextField="personrole" ValueField="Role" 
												DataSourceID="sql_PersonRole" 
												OnInit="cboPersonRole_OnInit" >
											</dx:ASPxComboBox>
										</Template>
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem Caption="Race" >
										<Template>
											<dx:ASPxComboBox ID="cboRace" runat="server" FieldName="EthnicityID" Caption=""  
												ValidationSettings-RequiredField-IsRequired="true"
												Value='<%# Bind("EthnicityID") %>' TextField="EthnicityDesc" ValueField="EthnicityID"
												DataSourceID="sql_Ethnicity">
											</dx:ASPxComboBox>
										</Template>
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem  Caption="Ethnicity" >
										<Template>
											<dx:ASPxComboBox ID="cboEthnicity" runat="server" FieldName="HispanicID"  Caption=""  
												ValidationSettings-RequiredField-IsRequired="true"
												Value='<%# Bind("HispanicID") %>'   ValueField="HispanicID" 
												CellStyle-Font-Bold="true" TextField="HispanicDesc"  DataSourceID="sql_Hispanic" >
											</dx:ASPxComboBox>
										</Template>
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="personID" Width="20%" ClientVisible="false"/>

								</Items>
							</dx:GridViewLayoutGroup>
						

							<dx:GridViewLayoutGroup ColCount="2" Caption="NDAR Info">
								<Items>
									<dx:GridViewColumnLayoutItem ColumnName="MiddleName" Width="30%"/>

									<dx:GridViewColumnLayoutItem ColumnName="LastNameOnBC" Width="30%"/>
									<dx:GridViewColumnLayoutItem ColumnName="CityOfBirth" Caption="City of birth" Width="30%"/>
									<dx:GridViewColumnLayoutItem ColumnName="StateOfBirth" Caption="State of birth" Width="30%"/>

								</Items>
							</dx:GridViewLayoutGroup>
							<dx:GridViewLayoutGroup Caption="Notes">
								<Items>
									<dx:GridViewColumnLayoutItem Caption="Notes" Width="100%" VerticalAlign="Top">
										<Template>
											<dx:ASPxMemo ID="notesMemo" runat="server" Width="100%" Height="150" Text='<%# Bind("Notes") %>' />
										</Template>
									</dx:GridViewColumnLayoutItem>
								</Items>
							</dx:GridViewLayoutGroup>
							<dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right"  />
						</Items>
					</EditFormLayoutProperties>--%>

					<Templates>
						<EditForm>
							<b><i>Personal Info</i></b>
							<dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server">
							</dx:ASPxGridViewTemplateReplacement>

							<b><i>NDAR Info</i></b>
							<table>
								<tr>
									<td>
							<table>
								<td>Middle Name:</td>
									<td><dx:ASPxGridViewTemplateReplacement ID="rMiddleName" ColumnID="MiddleName" ReplacementType="EditFormCellEditor" runat="server"/></td>
									<td style="width:50px"></td>
									<td>Last Name on Birth Cert:</td>
									<td><dx:ASPxGridViewTemplateReplacement ID="rLastNameOnBC" ColumnID="LastNameOnBC" ReplacementType="EditFormCellEditor"  runat="server"/></td>
								<tr>
									<td>City of Birth:</td>
									<td><dx:ASPxGridViewTemplateReplacement ID="rCityOfBirth" ColumnID="CityOfBirth" ReplacementType="EditFormCellEditor"  runat="server"/></td>
									<td style="width:50px"></td>
									<td>State of Birth:</td>
									<td><dx:ASPxGridViewTemplateReplacement ID="rStateOfBirth" ColumnID="StateOfBirth" ReplacementType="EditFormCellEditor"  runat="server"/></td>
								</tr>
							</table>

									</td>
							<td style="width:150px"></td>
							<td>
								<dx:ASPxButton ID="btnCreateSubject" runat="server" OnInit="btnCreateSubject_OnInit" Text="Create Subject" Font-Size="12pt" ></dx:ASPxButton> 
							</td>
								</tr>
							</table>


							<dx:ASPxFormLayout ID="layout1" runat="server" ColCount="2">
							</dx:ASPxFormLayout>

							<br />
							<dx:ASPxMemo ID="ASPxMemo1" runat="server" Caption="Notes" Width="50%" Height="100" Text='<%# Bind("Notes") %>' />


							<div style="text-align: left; padding: 12px">
								<dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
									runat="server">
								</dx:ASPxGridViewTemplateReplacement>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
									runat="server">
								</dx:ASPxGridViewTemplateReplacement>
							</div>
						</EditForm>
						<DetailRow>
							Subject Details:
							<br /><br />
							<dx:ASPxGridView ID="dxgridSubjects" runat="server" ClientInstanceName="dxgridSubjects"
								DataSourceID="sql__subject"  EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_DataSelect"
								OnCustomButtonInitialize="detailGrid_CustomButtonInitialize" KeyFieldName="subjID"
								>
								 <Styles>
									<%--<CommandColumnItem ForeColor="Green"></CommandColumnItem>--%>
								</Styles>
								<Columns>
									<dx:GridViewDataColumn FieldName="subjID" Caption="" Visible="false"></dx:GridViewDataColumn>

									<dx:GridViewDataColumn FieldName="studyname" Caption="Study" Visible="true"></dx:GridViewDataColumn>
									<dx:GridViewDataTextColumn Name="IDcolumn">
										<DataItemTemplate>
											<dx:ASPxButton ID="btnID" runat="server" AutoPostBack="false" OnInit="btnID_Init" ClientInstanceName="btnFoo"
											   EnableClientSideAPI="true" Font-Bold="true"  ></dx:ASPxButton>
										</DataItemTemplate>
									</dx:GridViewDataTextColumn>
									<dx:GridViewDataColumn FieldName="groupname" Caption="Group" Visible="true" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="subjstatus" Caption="Subject Status" Visible="true"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="subjstatusdetail" Caption="Subject Status Detail" Visible="true"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="Notes" Caption="Notes" Visible="true"></dx:GridViewDataColumn>
								</Columns>
								<SettingsCommandButton>
									<EditButton>
									</EditButton>
								</SettingsCommandButton>
							</dx:ASPxGridView>
						</DetailRow>
					</Templates>

<%--                    <EditFormLayoutProperties>
						<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
					</EditFormLayoutProperties>
					<SettingsPopup>
						<EditForm Width="600">
							<SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
						</EditForm>
					</SettingsPopup>--%>
					<SettingsDetail ShowDetailRow="true" />
				</dx:ASPxGridView>
			</td>
		</tr>
	</table>

<table>
		<tr>
			<td>
				<br /><br />
				<asp:Label ID="Label12" runat="server" Text="Phone" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>


				<dx:ASPxGridView ID="dxgridPhone" runat="server" ClientInstanceName="dxgridPhone"  
					DataSourceID="sql__phone" KeyFieldName="phoneID" 
					OnRowInserting="dxgridPhone_OnRowInserting"  OnRowUpdating="dxgridPhone_OnRowUpdating" 

					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true">
					<Columns>
						<dx:GridViewDataColumn FieldName="phoneID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="PhoneNum" Caption="Phone Number"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="PhoneType" Caption="Phone Type"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" />
						<dx:GridViewDataTextColumn Name="Delete"   EditFormSettings-Visible="false">
							<DataItemTemplate>
								<a id="DeleteButton" href="javascript:dxgridPhone_Delete(<%# Container.KeyValue.ToString()%>, <%# Container.VisibleIndex.ToString()  %>);">
									Delete</a>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>
					</Columns>
				</dx:ASPxGridView>

				<br />
				<br />
				<asp:Label ID="Label13" runat="server" Text="Email" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

				<dx:ASPxGridView ID="dxgridEmail" runat="server" ClientInstanceName="dxgridEmail"  
					DataSourceID="sql__email" KeyFieldName="emailID" 
					OnRowInserting="dxgridEmail_OnRowInserting"  OnRowUpdating="dxgridEmail_OnRowUpdating" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true">
					<Columns>
						<dx:GridViewDataColumn FieldName="emailID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="emailaddress" Caption="Email"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="emailType" Caption="Email Type"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" />
						<dx:GridViewDataTextColumn Name="Delete"  EditFormSettings-Visible="false">
							<DataItemTemplate>
								<a id="DeleteButton" href="javascript:dxgridEmail_Delete(<%# Container.KeyValue.ToString()%>, <%# Container.VisibleIndex.ToString()  %>);">
									Delete</a>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>
					</Columns>
				</dx:ASPxGridView>


	

			</td>

			<td style="width: 50px"></td>

			<td style="vertical-align: top">
				 <br /><br />
				<asp:Label ID="Label14" runat="server" Text="Address" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

				<dx:ASPxGridView ID="dxgridAddress" runat="server" ClientInstanceName="dxgridAddress"  
					DataSourceID="sql__address" KeyFieldName="addressID" 
					OnRowInserting="dxgridAddress_OnRowInserting"  OnRowUpdating="dxgridAddress_OnRowUpdating" 

					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowDelete="true">
					<SettingsEditing Mode="Inline"></SettingsEditing>
					<Columns>
						<dx:GridViewDataColumn FieldName="addressID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="address1" Caption="Address1"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="address2" Caption="Address2"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="city" Caption="City"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="state" Caption="State"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="zip" Caption="Zip"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="country" Caption="Country"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" />
						<dx:GridViewDataTextColumn Name="Delete"  EditFormSettings-Visible="false">
							<DataItemTemplate>
								<a id="DeleteButton" href="javascript:dxgridAddress_Delete(<%# Container.KeyValue.ToString()%>, <%# Container.VisibleIndex.ToString()  %>);">
									Delete</a>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>
					</Columns>
				</dx:ASPxGridView>

				<br /><br />
				<asp:Label ID="Label15" runat="server" Text="Emergency Contact" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

				
				<dx:ASPxGridView ID="dxgridEmerContact" runat="server" ClientInstanceName="dxgridAddress"  
					DataSourceID="sql__emercontact" KeyFieldName="EmerID" 
					OnRowInserting="dxgridEmerContact_OnRowInserting"  OnRowUpdating="dxgridEmerContact_OnRowUpdating" OnRowDeleting="dxgridEmerContact_OnRowDeleting" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowDelete="true">
					<SettingsEditing Mode="Inline"></SettingsEditing>
					<SettingsText ConfirmDelete="true"  />
					<Columns>

						<dx:GridViewDataColumn FieldName="EmerID" Caption="" Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="LastName" Caption="Last"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Firstname" Caption="First"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Address" Caption="Address"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Phone1" Caption="Phone"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Notes" Caption="Notes"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" ShowDeleteButton="true"  />
						<%--<dx:GridViewDataTextColumn Name="Delete"  EditFormSettings-Visible="false">
							<DataItemTemplate>
								<a id="DeleteButton" href="javascript:dxgridEmerContact_Delete(<%# Container.KeyValue.ToString()%>, <%# Container.VisibleIndex.ToString()  %>);">
									Delete</a>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>--%>
					</Columns>
				</dx:ASPxGridView>
			</td>
		</tr>
	</table>

	<br />
	<br />

		<asp:Label ID="Label16" runat="server" Text="Contact Log" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>


	<dx:ASPxGridView ID="dxgridLogContact" runat="server" ClientInstanceName="dxgridLogContact"  
		DataSourceID="sql__logcontact" KeyFieldName="logcontactID" 
		SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true"
		>
		<Columns>
			<dx:GridViewDataColumn FieldName="logcontactID" Caption="" Visible="false"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="logdate" Caption="Date"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="logcontact_timesince" Caption="Time Since"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="logpriority" Caption="Priority"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="logcontacttype" Caption="Type"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="logcontactpurpose" Caption="Purpose"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="lognotes" Caption="Notes"></dx:GridViewDataColumn>
			<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" />
			<dx:GridViewDataTextColumn Name="Delete"   EditFormSettings-Visible="false">
				<DataItemTemplate>
					<a id="DeleteButton" href="javascript:dxgridLogContact_Delete(<%# Container.KeyValue.ToString()%>, <%# Container.VisibleIndex.ToString()  %>);">
						Delete</a>
				</DataItemTemplate>
			</dx:GridViewDataTextColumn>
		</Columns>
	</dx:ASPxGridView>


	<br />
	<br />
				
			<asp:Label ID="Label17" runat="server" Text="Information Log" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

<%--  DxGrid etc. created with:  sp_CreateSqlDataSource 'tblName'   --%>

<%--  GridView for tblLogInfo  --%>
<dx:ASPxGridView ID="dxgridtblLogInfo" runat="server" ClientInstanceName="dxgridtblLogInfo" 
					DataSourceID="sql__tblLogInfo" KeyFieldName="loginfoID" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" SettingsDataSecurity-AllowDelete="true">
					<Columns>
	 <dx:GridViewDataColumn FieldName="loginfoID" Caption="loginfoID" Visible="false" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
	 <dx:GridViewDataColumn FieldName="loginfodate" Caption="Date" Visible="true" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
	 <dx:GridViewDataColumn FieldName="loginfo_timesince" Caption="Time Since" Visible="true" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
	 <dx:GridViewDataColumn FieldName="logpriorityID" Caption="Priority" Visible="true" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
	 <dx:GridViewDataColumn FieldName="loginfocatID" Caption="Type" Visible="true" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
	 <dx:GridViewDataColumn FieldName="loginfonotes" Caption="Notes" Visible="true" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
	 <dx:GridViewDataColumn FieldName="staffID" Caption="Staff" Visible="true" CellStyle-Font-Bold="false"> </dx:GridViewDataColumn> 
						<dx:GridViewCommandColumn ShowEditButton="true"  ShowNewButtonInHeader="true" />
						<dx:GridViewDataTextColumn Name="Delete"   EditFormSettings-Visible="false">
							<DataItemTemplate>
								<a id="DeleteButton" href="javascript:dxgridPerson_Delete(<%# Container.KeyValue.ToString()%>, <%# Container.VisibleIndex.ToString()  %>);">
									Delete</a>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>
					</Columns>
		</dx:ASPxGridView>



	<br />
	<br />
	
	<asp:Button ID="btnMergeHousehold" runat="server" Text="Merge Duplicate Into This Household" OnCommand="ButtonCommand_Click" CommandName="MergeHousehold"   BackColor="LawnGreen" ForeColor="Blue" Visible="false" />
	<br />








</asp:Panel>

 


	<br/>
	<br/>


	<asp:Label ID="lblInfo" runat="server"></asp:Label>

	<br />
	<hr />
	<br />

	<asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select subjstatusID, subjstatus from uwautism_research_backend..tblsubjectstatus_lkup">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlSSD" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select a.subjstatusdetailID, subjstatusdetail from uwautism_research_backend..tblsubjstatusdetail_lkup a
		join tblsubjstatusanddetail b ON a.subjstatusdetailID = b.subjstatusdetailID 
		where b.subjstatusID = @subjstatusID">
		<SelectParameters>
			<asp:Parameter Name="subjstatusID" Type="Int32" />
		</SelectParameters>	    
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_PersonRole" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select personroleID Role, personrole from uwautism_research_backend..tblPersonRole_lkup">
	</asp:SqlDataSource>
	

	<asp:SqlDataSource ID="sql_Ethnicity" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select EthnicityID, EthnicityDesc from uwautism_research_backend..tblethnicity">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_Hispanic" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select HispanicID, HispanicDesc from uwautism_research_backend..tblHispanic_lkup">
	</asp:SqlDataSource>
	

	<asp:SqlDataSource ID="sql_logpriority" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select logpriorityID, logpriority from uwautism_research_backend..tbllogpriority_lkup order by 2">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_logcontactpurpose" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select logcontactpurposeID	, logcontactpurpose, sortorder from tblLogContactPurpose_Lkup order by sortorder">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_logcontacttype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select logcontacttypeID	, logcontacttype, sortorder from tblLogContactType_Lkup order by sortorder">
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_loginfocat" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommand="select loginfocatID	, loginfocat from tblLogInfoCat_Lkup where loginfocat not like 'old:%' and loginfocat not in ('a','b','c')">
	</asp:SqlDataSource>

	


	<asp:SqlDataSource ID="sql_Staff" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="exec spTracking_Staff_byStudy">
	</asp:SqlDataSource>


<%--	<asp:SqlDataSource runat="server" ID="sql_Persons_by_Household"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="hh.spPerson_by_HouseholdID" SelectCommandType="StoredProcedure">
			<SelectParameters>
				<asp:Parameter Name="householdID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>--%>



	<asp:SqlDataSource runat="server" ID="sql_Subjects_by_Person"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="hh.spSubject_by_Person" SelectCommandType="StoredProcedure">
			<SelectParameters>
				<asp:Parameter Name="personID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>




	<%-- UpdateCommand="exec hh.spPerson_MODIFY_UPDATE @HouseholdID" --%>
	 <%--InsertCommand="exec hh.spPerson_MODIFY_INSERT @HouseholdID" --%>
	<asp:SqlDataSource runat="server" ID="sql__person"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" InsertCommandType="Text" UpdateCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="exec hh.spPerson_by_HouseholdID @HouseholdID" 
	
	 DeleteCommand="delete from tblperson where personID = @personID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="HouseholdID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  

		<DeleteParameters>
			<asp:Parameter Name="personID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>


		<asp:SqlDataSource runat="server" ID="sql__subject"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="exec hh.spSubject_by_Person @personID" SelectCommandType="Text">
			<SelectParameters>
				<asp:SessionParameter SessionField="personID" Name="personID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>



	<asp:SqlDataSource runat="server" ID="sql__phone"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text"  DeleteCommandType="Text"
	 SelectCommand="select phoneID, PhoneNum, PhoneType, householdID from tblPhoneNumber where HouseholdID = @hhID" 
	 DeleteCommand="delete from tblPhoneNumber where phoneID = @phoneID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="phoneID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>



		<asp:SqlDataSource runat="server" ID="sql__email"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select emailID, emailaddress, emailType, householdID from tblemail where HouseholdID = @hhID" 
	 DeleteCommand="delete from tblemail where emailID = @emailID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="emailID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>



	
		<asp:SqlDataSource runat="server" ID="sql__address"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select addressID, address1, address2, city, state, zip, country, householdID from tbladdress where HouseholdID = @hhID" 
	 DeleteCommand="delete from tbladdress where addressID = @addressID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="addressID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>


	
	<asp:SqlDataSource runat="server" ID="sql__emercontact"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select * from tblEmerContact where householdID = @hhID" 
	 DeleteCommand="delete from tblEmerContact where EmerID = @EmerID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<DeleteParameters>
			<asp:Parameter Name="EmerID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>


	
	<asp:SqlDataSource runat="server" ID="sql__logcontact"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		SelectCommandType="Text" InsertCommandType="Text" UpdateCommandType="Text" DeleteCommandType="Text"
	 SelectCommand="select logcontactID,logpriorityID,logcontacttypeID,logdate,logcontactpurposeID
			, dbo.fnElapTime_text(logdate, getdate()) as logcontact_timesince
			, (case when b.householdID is null then '**Notes from another study**' else  lognotes end) lognotes
			, (case when b.householdID is null then '**NO ACCESS**' else  studyname end) studyname
			, a.studyID, a.staffID
			, timestamp, a.HouseholdID, logcontactpurpose, logcontacttype, logpriority, staffshortname
			from vwLogContact a
			join tblStudy a1 ON a.studyID = a1.studyID
			left join (select * from dbo.fnSEC_Allowed_PHI_Households_by_User()) b ON a.HouseholdID = b.householdID 	
			where a.HouseholdID = @hhID
			order by logdate desc" 
	 InsertCommand="INSERT INTO [dbo].[tblLogContact] ([logpriorityID],[logcontacttypeID],[logdate],[logcontactpurposeID],[logcontactoutcomeID],[lognotes],[staffID],[HouseholdID]) VALUES( @logpriorityID , @logcontacttypeID , @logdate  , @logcontactpurposeID , @logcontactoutcomeID , @lognotes , @staffID , @hhID )" 
	 UpdateCommand="UPDATE [dbo].[tblLogContact]
			   SET [logpriorityID]       =  @logpriorityID 
				  ,[logcontacttypeID]    =  @logcontacttypeID 
				  ,[logdate]             =  @logdate  
				  ,[logcontactpurposeID] =  @logcontactpurposeID 
				  ,[logcontactoutcomeID] =  @logcontactoutcomeID 
				  ,[lognotes]            =  @lognotes 
				  ,[staffID]             =  @staffID 
				  ,[HouseholdID]         =  @hhID 
				where  logcontactID= @logcontactID" 
	 DeleteCommand="delete from tblLogContact where logcontactID= @logcontactID" 
		>
		<SelectParameters>
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />
		</SelectParameters>  
		<InsertParameters>
			<asp:Parameter Name="logpriorityID"  Type="Int32" />
			<asp:Parameter Name="logcontacttypeID"  Type="Int32" />
			<asp:Parameter Name="logdate"  Type="DateTime" />
			<asp:Parameter Name="logcontactpurposeID"  Type="Int32" />
			<asp:Parameter Name="logcontactoutcomeID"  Type="Int32" />
			<asp:Parameter Name="lognotes"  Type="String" />
			<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" />            
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="logcontactID"  Type="Int32" />
			<asp:Parameter Name="logpriorityID"  Type="Int32" />
			<asp:Parameter Name="logcontacttypeID"  Type="Int32" />
			<asp:Parameter Name="logdate"  Type="DateTime" />
			<asp:Parameter Name="logcontactpurposeID"  Type="Int32" />
			<asp:Parameter Name="logcontactoutcomeID"  Type="Int32" />
			<asp:Parameter Name="lognotes"  Type="String" />
		</UpdateParameters>
		<DeleteParameters>
			<asp:Parameter Name="phoneID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>



	<%--  SqlDataSource for tblLogInfo  --%>
<asp:SqlDataSource runat="server" ID="sql__tblLogInfo"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" SelectCommandType="Text" InsertCommandType="Text" UpdateCommandType="Text" DeleteCommandType="Text" 
SelectCommand="select loginfoID,logpriorityID,loginfocatID,loginfodate,actionadded,actionID
		, (case when b.householdID is null then '**Notes from another study**' else  loginfonotes end) loginfonotes
		, dbo.fnElapTime_text(loginfodate, getdate()) as loginfo_timesince
		, a.staffID
		, timestamp, a.HouseholdID, logpriority, loginfocat, staffshortname
		from vwLogInfo a
		left join (select * from dbo.fnSEC_Allowed_PHI_Households_by_User()) b ON a.HouseholdID = b.householdID 	
		where a.HouseholdID = @hhID
		order by loginfodate desc " 
InsertCommand="INSERT INTO tblLogInfo ( 
	   loginfoID
	 , HouseholdID
	 , loginfocatID
	 , loginfodate
	 , loginfonotes
	 , logpriorityID
	 , staffID
) values ( 
	  @loginfoID
	 ,@HouseholdID
	 ,@loginfocatID
	 ,@loginfodate
	 ,@loginfonotes
	 ,@logpriorityID
	 ,@staffID
)" 
UpdateCommand="update tblLogInfo set tblLogInfo
	   loginfoID = @loginfoID
	 , loginfocatID = @loginfocatID
	 , loginfodate = @loginfodate
	 , loginfonotes = @loginfonotes
	 , logpriorityID = @logpriorityID
	 , staffID = @staffID
 where loginfoID= @loginfoID" 
DeleteCommand="delete from tblLogInfo where loginfoID= @loginfoID" 
>
<SelectParameters>
   <%-- <asp:SessionParameter Name="hhID" SessionField="hhID"  Type="Int32" /> --%>
	<asp:QueryStringParameter Name="hhID" QueryStringField="hhID"  Type="Int32" /> 
</SelectParameters>
<InsertParameters>
<asp:Parameter Name="HouseholdID" Type="Int32" />
<asp:Parameter Name="loginfocatID" Type="Int32" />
<asp:Parameter Name="loginfodate" Type="DateTime" />
<asp:Parameter Name="loginfoID" Type="Int32" />
<asp:Parameter Name="loginfonotes" Type="String" />
<asp:Parameter Name="logpriorityID" Type="Int32" />
<asp:Parameter Name="staffID" Type="Int32" />
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="loginfocatID" Type="Int32" />
<asp:Parameter Name="loginfodate" Type="DateTime" />
<asp:Parameter Name="loginfoID" Type="Int32" />
<asp:Parameter Name="loginfonotes" Type="String" />
<asp:Parameter Name="logpriorityID" Type="Int32" />
<asp:Parameter Name="staffID" Type="Int32" />
</UpdateParameters>
<DeleteParameters>
<asp:Parameter Name="loginfoID" Type="Int32" />
</DeleteParameters>
</asp:SqlDataSource>




	<script type="text/javascript">
		function dxgridPerson_Delete(id, visibleIndex) {
			if (confirm('Do you wish to delete Person with ID = ' + id + '?'))
				dxgridPerson.DeleteRow(visibleIndex);
		}

		function dxgridPhone_Delete(id, visibleIndex) {
			if (confirm('Do you wish to delete Phone with ID = ' + id + '?'))
				dxgridPhone.DeleteRow(visibleIndex);
		}

		function dxgridEmail_Delete(id, visibleIndex) {
			if (confirm('Do you wish to delete Email with ID = ' + id + '?'))
				dxgridEmail.DeleteRow(visibleIndex);
		}

		function dxgridAddress_Delete(id, visibleIndex) {
			if (confirm('Do you wish to delete Address with ID = ' + id + '?'))
				dxgridAddress_Delete.DeleteRow(visibleIndex);
		}

		function dxgridEmerContact_Delete(id, visibleIndex) {
			if (confirm('Do you wish to delete Emergency Contact with ID = ' + id + '?'))
				dxgridEmerContact_Delete.DeleteRow(visibleIndex);
		}

	</script>

	

</asp:Content>
