
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Household.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_Household" Title="Household Info"   Theme="Skin1" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

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
			<asp:Button ID="btnOld" runat="server" Text="Goto Old Household Page" OnClick="btnOld_Click" Font-Bold="true" ForeColor="DeepSkyBlue" />
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

<%--		<table>
			<tr>
				<td style="vertical-align:top">

				

				</td>
				<td style="width:20px">

				</td>
				<td style="vertical-align:top">
				</td>
			</tr>
		</table>--%>

	<asp:Label ID="lblHHname" runat="server" Text="" Font-Bold="true" Font-Size="X-Large"  ></asp:Label>
	<br />
	<br />
	<asp:Label ID="lblP" runat="server" Text="Persons" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>
	<asp:Button ID="btnP" runat="server" Text="Hide"  ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None" Font-Size="XX-Small" OnClick="btnP_Click" ></asp:Button>
	
		
		<input id="btnShowSubjects" type="button" value="Show subjects" onclick="toggleDetailLevel(0, true)" style="color:Navy;background-color:WhiteSmoke;border-style:None;font-size:X-Small;" /> 
		<input id="btnHideSubjects" type="button" value="Hide subjects" onclick="toggleDetailLevel(0, false)" style="color:Navy;background-color:WhiteSmoke;border-style:None;font-size:X-Small;" /> 
<%--		<obout:OboutButton ID="btnShowSubjects" runat="server" Text="Show Subjects"   OnClientClick="toggleDetailLevel(0, true)" Visible="true"></obout:OboutButton>
		<obout:OboutButton ID="btnHideSubjects" runat="server" Text="Hide Subjects"   OnClientClick="toggleDetailLevel(0, false)" Visible="true"></obout:OboutButton>--%>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Reload page" onclick="location.reload(true);" style="color:forestgreen;background-color:WhiteSmoke;border-style:None;font-size:X-Small;" /> 



	<obout:Grid ID="gridP" runat="server"   
		CallbackMode="true" Serialize="true" ViewStateMode="Enabled"  ShowLoadingMessage="true" PageSize="-1"        
		AllowPageSizeSelection="false"  AllowAddingRecords="true"  AutoGenerateColumns="false" AllowPaging="false"
		AllowRecordSelection="true" AllowFiltering="false"    
		OnRebind="gridP_Rebind" OnRowDataBound="gridP_RowDataBound"  OnDeleteCommand="gridP_DeleteCommand" 		>
		
		<TemplateSettings RowEditTemplateId="tpl_P_rowedit"        /> 
		<ClientSideEvents   OnClientPopulateControls="OnClientPopulateControls_P"  OnBeforeClientInsert="OnBeforeClientInsert_P"  OnBeforeClientUpdate="OnBeforeClientUpdate_P"  OnBeforeClientDelete="OnBeforeClientDelete_P"
			OnClientCallbackError="onCallbackError"    ExposeSender="true" />
		
		<Columns>
			<obout:Column HeaderText=" " Width="15px"></obout:Column>
			<obout:Column DataField="LastName" HeaderText="Last" Width="120px" Wrap="true" ><TemplateSettings  RowEditTemplateControlId="txt_last" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="FirstName" HeaderText="First" Width="100px" Wrap="true"><TemplateSettings RowEditTemplateControlId="txt_first" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="NickName" HeaderText="NickName" Width="80px"><TemplateSettings RowEditTemplateControlId="txt_nickname" RowEditTemplateControlPropertyName="value" /></obout:Column>
			
			<obout:Column DataField="Sex" HeaderText="Sex" Width="50px"><TemplateSettings RowEditTemplateControlId="txt_sex" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="dob" HeaderText="DOB" Width="100px"><TemplateSettings RowEditTemplateControlId="txt_dob" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="currageYM" HeaderText="Age (Y:M)" ReadOnly="true" Width="60px"></obout:Column>



			<obout:Column DataField="PersonRole" HeaderText="Role" ReadOnly="true"  Width="90px"></obout:Column>
			<obout:Column DataField="ethnicitydesc" HeaderText="Race"  ReadOnly="true" Width="100px"></obout:Column>
			<obout:Column DataField="hispanicdesc" HeaderText="Ethnicity"  ReadOnly="true" Width="110px"></obout:Column>

			<obout:Column DataField="notes" HeaderText="Notes" Wrap="true" Width="230px" Visible="false"  >
				<TemplateSettings RowEditTemplateControlId="txt_P_notes" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="notesOtherID" HeaderText="Notes/OtherID's" HtmlEncode="true" ParseHTML="true"  ReadOnly="true" Width="230px" Wrap="true"></obout:Column>

			<obout:Column DataField="MiddleName" HeaderText="Middle" Visible="false" Width="90px"><TemplateSettings RowEditTemplateControlId="txt_middle" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="LastNameOnBC" HeaderText="LastNameOnBC" Visible="false" Width="60px"><TemplateSettings RowEditTemplateControlId="txt_lastBC" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="CityOfBirth" HeaderText="CityOf" Visible="false" Width="60px"><TemplateSettings RowEditTemplateControlId="txt_city" RowEditTemplateControlPropertyName="value" /></obout:Column>
			<obout:Column DataField="StateOfBirth" HeaderText="StateOf" Visible="false" Width="60px"><TemplateSettings RowEditTemplateControlId="txt_state" RowEditTemplateControlPropertyName="value" /></obout:Column>

			<obout:Column DataField="role" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_PersonRoleID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>

			<obout:Column DataField="EthnicityID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_EthnicityID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>

			<obout:Column DataField="HispanicID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_HispanicID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>

			<obout:Column DataField="personID" Visible="false" ReadOnly="true" HeaderText="personID" >
				<TemplateSettings RowEditTemplateControlId="txt_personID" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
<%--			<obout:Column DataField="FapersonID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_FapersonID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="MopersonID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_MopersonID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>--%>


			<obout:Column DataField="HouseholdID" Visible="false" ReadOnly="true" HeaderText="HouseholdID" >
				<TemplateSettings RowEditTemplateControlId="txt_HouseholdID" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="nsubj" HeaderText="nsubj" ReadOnly="true" Visible="false" >
				<TemplateSettings RowEditTemplateControlId="txt_nsubj" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="MainContact" Visible="false"  >
				<TemplateSettings RowEditTemplateControlId="chkMainContact" RowEditTemplateControlPropertyName="checked" />
			</obout:Column>

			<obout:Column AllowEdit="true" AllowDelete="true" Width="90px"><TemplateSettings EditTemplateId="tplP_1"  /></obout:Column>

		</Columns>

		<Templates>
			<obout:GridTemplate ID="tpl_P_rowedit" runat="server"  >
				
				<Template >
				
							<table>
								<tr>
									<td colspan="2" align="center">
										<asp:Label ID="c1" runat="server" Text="Required Information" Font-Italic="true" Font-Size="Smaller"></asp:Label>
									</td>
									<td colspan="1">
										<asp:Label ID="Label3" runat="server" Text="Info for NDAR GUID" Font-Italic="true" Font-Size="Smaller"></asp:Label>
									</td>

								</tr>
								<tr>
									
									<td style="vertical-align:top">
										<obout:OboutTextBox runat="server" ID="txt_personID" Visible="false"></obout:OboutTextBox>
										<obout:OboutTextBox runat="server" ID="txt_HouseholdID" Visible="false"></obout:OboutTextBox>
										<obout:OboutTextBox runat="server" ID="txt_nsubj" Visible="false"></obout:OboutTextBox>
										Last:<br /><obout:OboutTextBox runat="server" ID="txt_last" Visible="true"></obout:OboutTextBox><br />
										First:<br /><obout:OboutTextBox runat="server" ID="txt_first"  Visible="true" ></obout:OboutTextBox><br />
										Nickname:<br /><obout:OboutTextBox runat="server" ID="txt_nickname"  Visible="true" ></obout:OboutTextBox><br />
										Role in family:<br />
											<obout:OboutDropDownList runat="server" ID="ddl_PersonRoleID" DataSourceID="sql_PersonRole"  Width="180px"
												DataValueField="personroleID" DataTextField="personrole" ></obout:OboutDropDownList><br/>
										Main Contact:<obout:OboutCheckBox ID="chkMainContact" runat="server"  />
										</td>
									<td style="vertical-align:top">
										Sex:<br /><obout:OboutTextBox runat="server" ID="txt_sex" Width="60px"  ></obout:OboutTextBox><br />
										DOB:<br /><obout:OboutTextBox runat="server" ID="txt_dob" Width="120px" ></obout:OboutTextBox><br />
										<ASP:RegularExpressionValidator ID="DateValidator" ControlToValidate="txt_dob" 
											 Display="Dynamic" EnableClientScript="true" runat="server" 
											 ValidationExpression="^(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/](19|20)\d\d$" 
											 SetFocusOnError="true">
											 Please enter date in MM/dd/yyyy format
										</ASP:RegularExpressionValidator>    
									Race:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_EthnicityID"  DataSourceID="sql_Ethnicity" Width="180px"
											DataValueField="EthnicityID" DataTextField="EthnicityDesc" ></obout:OboutDropDownList><br />

									Ethnicity:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_HispanicID"  DataSourceID="sql_Hispanic" Width="180px"
											DataValueField="HispanicID" DataTextField="HispanicDesc" ></obout:OboutDropDownList>

									</td>
									<td style="vertical-align:top">
										Last on Birth Cert.:<br /><obout:OboutTextBox runat="server" ID="txt_lastBC" Visible="true"></obout:OboutTextBox><br />
										Middle:<br /><obout:OboutTextBox runat="server" ID="txt_middle"  Visible="true" ></obout:OboutTextBox><br />
										<br />
										City of Birth:<br /><obout:OboutTextBox runat="server" ID="txt_city" Visible="true"></obout:OboutTextBox><br />
										State of Birth:<br /><obout:OboutTextBox runat="server" ID="txt_state" Visible="true"></obout:OboutTextBox><br />
									</td>

									<td style="vertical-align:top">
										<br />
<%--										Biological Father:<br />
											<obout:OboutDropDownList runat="server" ID="ddl_FapersonID"  Width="180px"
												DataValueField="FapersonID" DataTextField="Faname" ></obout:OboutDropDownList><br />
										Biological Mother:<br />
											<obout:OboutDropDownList runat="server" ID="ddl_MopersonID"  Width="180px"
												DataValueField="MopersonID" DataTextField="Moname" ></obout:OboutDropDownList><br />--%>

									</td>


									<td width="70px"></td>
									<td style="vertical-align:top" Width="150px">
										<div id="btnP_UpdateContainer">
											<obout:OboutButton runat="server" ID="btnP_Update" Text="Update Person Info"  OnClientClick="return saveChanges_P_1('btnP_Update')"	></obout:OboutButton>
										</div>
										
										<div id="btnP_InsertContainer">
											<obout:OboutButton runat="server" ID="btnP_Insert" Text="Insert New Person"  OnClientClick="return saveChanges_P_1('btnP_Insert')"	></obout:OboutButton>
										</div>
									</td>
									<td valign="middle">
										<div id="btnNewSubjectContainer">
										<obout:OboutButton ID="btnNewSubject" runat="server" Text="Create New Subject / OtherID" OnClick="btnNewSubject_Click"     ></obout:OboutButton>
<%--                                             OnCommand="ButtonCommand_Click" CommandName="NewSubject" Font-Size="Medium" CommandArgument='< %# Container.RecordIndex %>'  --%>
											</div>
										<div id="divNEEDINFO">
											<i>It is ideal to enter the Sex & DOB before creating a subject.</i>
										</div>

									</td>
								</tr>

								<tr>							
									<td colspan="4" style="vertical-align:top">
										<br />Notes:<br />
										<obout:OboutTextBox runat="server" ID="txt_P_notes"  TextMode="MultiLine" Width="500px" Height="80px"   ></obout:OboutTextBox>

										</td>
									<td width="70px"></td>
									<td>
										<div class="container-red">
										<obout:OboutButton runat="server" ID="btnP_Cancel" OnClientClick="gridP.cancel()" Text="Cancel" CssClass="container-red"    ></obout:OboutButton>
											</div>
										<br /><br />
										<br />



<%--										<obout:OboutButton runat="server" ID="btnP_Delete"  
											OnClientClick="return Delete_P_1('btnP_Delete')" Text="Delete" ForeColor="Red"></obout:OboutButton>
										<br />--%>
										<asp:Label ID="lblPersonInfo" runat="server" Text="" ForeColor="Red" Font-Size="XX-Small"
											 Visible="true"></asp:Label>
										


									</td>

								</tr>
							</table>

				</Template>
			</obout:GridTemplate>

			<obout:GridTemplate ID="tplP_1">
			 <Template>&#160;</Template>
			</obout:GridTemplate>


		</Templates>
	

		<MasterDetailSettings LoadingMode="OnLoad" ShowEmptyDetails="false" State="Expanded" />
		<DetailGrids>
				<obout:DetailGrid ID="gridS" runat="server" ForeignKeys="personID" DataSourceID="sql_Subjects_by_Person"
					CallbackMode="true" Serialize="true" ViewStateMode="Enabled" PageSize="-1"        
					AllowPageSizeSelection="false"  AllowAddingRecords="false"  AutoGenerateColumns="false" AllowPaging="false"
					AllowRecordSelection="false" AllowFiltering="false" AllowSorting="false"   
					 OnRowDataBound="gridS_RowDataBound"   
					 ShowFooter="false" ShowHeader="false"  >
					
					<Columns>
						<obout:Column HeaderText=" " Width="15px" ></obout:Column>
						<obout:Column DataField="studyname" HeaderText="Study" Width="160px"></obout:Column>
						<obout:Column DataField="ID" HeaderText="ID" Width="90px" ></obout:Column>
						<obout:Column DataField="groupname"   HeaderText="Group" Width="90px" ></obout:Column>
						<obout:Column DataField="subjstatus" HeaderText="Subject Status" Width="90px" ></obout:Column>
						<obout:Column DataField="subjstatusdetail" HeaderText="Subject Status Detail" Width="90px" ></obout:Column>
						<obout:Column DataField="notes" HeaderText="Notes" Wrap="true" Width="300px"  ></obout:Column>
						<obout:Column DataField="subjID" HeaderText="subjID" Visible="false"></obout:Column>
						<obout:Column DataField="personID" HeaderText="personID" Visible="false"></obout:Column>
					</Columns>
				</obout:DetailGrid>
		</DetailGrids>

	</obout:Grid>

	<asp:Button ID="btnMergeHousehold" runat="server" Text="Merge Duplicate Into This Household" OnCommand="ButtonCommand_Click" CommandName="MergeHousehold"   BackColor="LawnGreen" ForeColor="Blue" Visible="false" />
	<br />


	<br />
<b><i>Here is a list of the subjects for people in this household.</i></b><i> A temp fix! :)</i>
	<br />
<dx:ASPxGridView id="dxsubjects" runat="server" DataSourceID ="sql_subjects" AutoGenerateColumns="true" >
    
</dx:ASPxGridView>
	<br />

		
	<br />


	<asp:Label ID="Label2" runat="server" Text="Subjects" Font-Bold="true" Font-Size="Medium" Visible="false"></asp:Label>
	<asp:Button ID="btnS" runat="server" Text="Hide" ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None" Font-Size="XX-Small" OnClick="btnS_Click" Visible="false" ></asp:Button>



<table>
	<tr>
		<td style="vertical-align:top">
			<asp:Label ID="Label4" runat="server" Text="Phone" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>
			<obout:Grid ID="gridPhone" runat="server" CallbackMode="true" Serialize="true" ViewStateMode="Enabled" 
				AutoGenerateColumns="false"  AllowPageSizeSelection="false"  AllowAddingRecords="true" 
				PageSize="-1" AllowFiltering="false" AllowPaging="false" AllowEdit="true"
				OnUpdateCommand="gridPhone_UpdateCommand" OnInsertCommand="gridPhone_InsertCommand" OnDeleteCommand="gridPhone_DeleteCommand" OnRebind="gridPhone_Rebind">
				<ClientSideEvents OnBeforeClientDelete="onDeleting_Phone" />
				<Columns>
					<obout:Column DataField="phoneID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="PhoneNum" HeaderText="Phone Number" Visible="true"></obout:Column>
					<obout:Column DataField="PhoneType" HeaderText="Phone Type" Visible="true"></obout:Column>
					<obout:Column AllowEdit="true" AllowDelete="true" Width="90px"></obout:Column>
				</Columns>
			</obout:Grid>


			<br /><br />
			<asp:Label ID="Label6" runat="server" Text="Email" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

		   <obout:Grid ID="gridEmail" runat="server" CallbackMode="true" Serialize="true" ViewStateMode="Enabled" 
				AutoGenerateColumns="false"  AllowPageSizeSelection="false"  AllowAddingRecords="true" 
				PageSize="-1" AllowFiltering="false" AllowPaging="false" AllowEdit="true" 
				OnUpdateCommand="gridEmail_UpdateCommand"  OnInsertCommand="gridEmail_InsertCommand" OnDeleteCommand="gridEmail_DeleteCommand" OnRebind="gridEmail_Rebind">
			   <ClientSideEvents OnBeforeClientDelete="onDeleting_Email" />
				<Columns>
					<obout:Column DataField="emailID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="emailaddress" HeaderText="Email" Visible="true"></obout:Column>
					<obout:Column DataField="emailType" HeaderText="Email Type" Visible="true"></obout:Column>
					<obout:Column AllowEdit="true" AllowDelete="true" Width="90px"></obout:Column>
				</Columns>
			</obout:Grid>


		</td>

		<td style="vertical-align:top">
			<asp:Label ID="Label5" runat="server" Text="Address" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>


			   <obout:Grid ID="gridAddress" runat="server" CallbackMode="true" Serialize="true"  
					AutoGenerateColumns="false"  AllowPageSizeSelection="false"  AllowAddingRecords="true" 
					PageSize="-1" AllowFiltering="false" AllowPaging="false" AllowEdit="true" 
					OnUpdateCommand="gridAddress_UpdateCommand"  OnInsertCommand="gridAddress_InsertCommand" OnDeleteCommand="gridAddress_DeleteCommand" OnRebind="gridAddress_Rebind">			
					<ClientSideEvents OnBeforeClientDelete="onDeleting_Address" />
					<TemplateSettings RowEditTemplateId="tpl_Address"        /> 
					<Columns>
						<obout:Column DataField="addresstext" HeaderText="Address" Visible="true" Width="350px"></obout:Column>
						<obout:Column DataField="notes" HeaderText="Notes" Visible="true" Width="250px"><TemplateSettings RowEditTemplateControlId="txt_addrnotes" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="address1" HeaderText="Address1" Visible="false"><TemplateSettings RowEditTemplateControlId="txt_address1" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="address2" HeaderText="2" Visible="false"><TemplateSettings RowEditTemplateControlId="txt_address2" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="city" HeaderText="2" Visible="false"><TemplateSettings RowEditTemplateControlId="txt_city" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="state" HeaderText="2" Visible="false"><TemplateSettings RowEditTemplateControlId="txt_state" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="zip" HeaderText="2" Visible="false"><TemplateSettings RowEditTemplateControlId="txt_zip" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="country" HeaderText="2" Visible="false"><TemplateSettings RowEditTemplateControlId="txt_country" RowEditTemplateControlPropertyName="value" /></obout:Column>
						<obout:Column DataField="addressID"  ReadOnly="true" Visible="false">
<%--                            <TemplateSettings RowEditTemplateControlId="txt_addressID" RowEditTemplateControlPropertyName="value" />--%>
						</obout:Column>
						<obout:Column DataField="householdID" ReadOnly="true" Visible="false">
<%--                            <TemplateSettings RowEditTemplateControlId="txtAddr_householdID" RowEditTemplateControlPropertyName="value" />--%>
						</obout:Column>
						<obout:Column AllowEdit="true"  AllowDelete="true" Width="100px">
							<%--<TemplateSettings EditTemplateId="tplAddr_1"  />--%>

						</obout:Column>
					</Columns>
						   
					<Templates>
					<obout:GridTemplate ID="tpl_Address" runat="server" >

						<table>
							<tr>
								<td style="vertical-align:top">
									Addr 1:<br /><obout:OboutTextBox runat="server" ID="txt_address1" Width="150px"  ></obout:OboutTextBox><br />
									Addr 2:<br /><obout:OboutTextBox runat="server" ID="txt_address2" Width="150px" ></obout:OboutTextBox><br />
								</td>
								<td>
									City:<br /><obout:OboutTextBox runat="server" ID="txt_city" Width="120px"  ></obout:OboutTextBox><br />
									State:<br /><obout:OboutTextBox runat="server" ID="txt_state" Width="120px" ></obout:OboutTextBox><br />
									Zip:<br /><obout:OboutTextBox runat="server" ID="txt_zip" Width="120px"  ></obout:OboutTextBox><br />
									Country:<br /><obout:OboutTextBox runat="server" ID="txt_country" Width="120px"  ></obout:OboutTextBox><br />
								</td>
								<td style="vertical-align:top" >
									Notes:<br /><obout:OboutTextBox runat="server" ID="txt_addrnotes" TextMode="MultiLine" Width="300px" Height="80px"   ></obout:OboutTextBox><br />

									<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;
									<obout:OboutButton runat="server" ID="btnAddress_Update" Text="Update"  OnClientClick="return saveChanges_Address('btnAddress_Update')"	></obout:OboutButton>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<obout:OboutButton runat="server" ID="btnAddress_Cancel" OnClientClick="gridAddress.cancel()" Text="Cancel" ForeColor="Red"></obout:OboutButton>

								</td>
							</tr>
						</table>
						<obout:OboutTextBox runat="server" ID="txt_addressID" Visible="false"  ></obout:OboutTextBox>
						<obout:OboutTextBox runat="server" ID="txtAddr_householdID" Visible="false"  ></obout:OboutTextBox>

					</obout:GridTemplate>

			<obout:GridTemplate ID="tplAddr_1">
			 <Template>&#160;</Template>
			</obout:GridTemplate>

					</Templates>
				



			</obout:Grid>

			<br />
			<br />
			<asp:Label ID="Label11" runat="server" Text="Emergency Contact" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>

		   <obout:Grid ID="gridEmerContact" runat="server" CallbackMode="true" Serialize="true" ViewStateMode="Enabled" 
				AutoGenerateColumns="false"  AllowPageSizeSelection="false"  AllowAddingRecords="true" 
				PageSize="-1" AllowFiltering="false" AllowPaging="false" AllowEdit="true" 
				OnUpdateCommand="gridEmerContact_UpdateCommand"  OnInsertCommand="gridEmerContact_InsertCommand" OnDeleteCommand="gridEmerContact_DeleteCommand" OnRebind="gridEmerContact_Rebind">
			   <ClientSideEvents OnBeforeClientDelete="onDeleting_EmerContact" />
				<Columns>
					<obout:Column DataField="EmerID" Visible="false"></obout:Column>
					<obout:Column DataField="LastName" HeaderText="Last" Visible="true" Width="80px"></obout:Column>
					<obout:Column DataField="Firstname" HeaderText="First" Visible="true" Width="80px"></obout:Column>
					<obout:Column DataField="Address" HeaderText="Address" Visible="true" Width="150px" Wrap="true"></obout:Column>
					<obout:Column DataField="Phone1" HeaderText="Phone" Visible="true" Width="100px" Wrap="true"></obout:Column>
					<obout:Column DataField="Notes" HeaderText="Notes" Visible="true" Width="200px" Wrap="true"></obout:Column>
					<obout:Column AllowEdit="true" AllowDelete="true" Width="90px"></obout:Column>
				</Columns>
			</obout:Grid>


			<br />
			<br />


			<asp:Label ID="Label9" runat="server" Text ="Still To Do" Font-Bold="true" ForeColor="DodgerBlue" Font-Size="Small" Font-Underline="true"></asp:Label>
			<br />
			<asp:Label ID="Label10" runat="server" Text ="* Indicator of which people live at which address" ForeColor="DodgerBlue" Font-Size="Small"></asp:Label>

		</td>
	</tr>
</table>




	<br />


	   


			<asp:Label ID="Label7" runat="server" Text="Contact Log" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>
			<obout:Grid ID="gridLogContact" runat="server" CallbackMode="true" Serialize="true" ViewStateMode="Enabled" 
				AutoGenerateColumns="false"  AllowPageSizeSelection="false"  AllowAddingRecords="true" 
				PageSize="-1" AllowFiltering="false" AllowPaging="false" AllowEdit="true" OnRowDataBound="gridLogContact_RowDataBound"
				OnUpdateCommand="gridLogContact_UpdateCommand" OnInsertCommand="gridLogContact_InsertCommand" OnDeleteCommand="gridLogContact_DeleteCommand" OnRebind="gridLogContact_Rebind">
				<ClientSideEvents OnClientPopulateControls="setup_LogContact" OnBeforeClientAdd="onInserting_LogContact" ExposeSender="true" OnBeforeClientDelete="onDeleting_LogContact"  />
				<TemplateSettings RowEditTemplateId="tbl_logcontact_rowedit"  />
				<Columns>
					<obout:Column DataField="logdate" HeaderText="Date/Time" ReadOnly="true" Visible="true" Width="120px" DataFormatString="{0:d} {0:t}"></obout:Column>
					<obout:Column DataField="logcontact_timesince" ReadOnly="true" HeaderText="Time Since" Width="90px" Visible="true"></obout:Column>
					<obout:Column DataField="logpriority" HeaderText="Priority"  Width="90px" Visible="true" ></obout:Column>
					<obout:Column DataField="logcontacttype" HeaderText="Type" Width="140px" Visible="true"  ></obout:Column>
					<obout:Column DataField="logcontactpurpose" HeaderText="Purpose" Width="160px" Visible="true"  ></obout:Column>
					<obout:Column DataField="lognotes" HeaderText="Contact Notes" Visible="true" Wrap="true"  Width="250px"  >
						<TemplateSettings RowEditTemplateControlId="txt_lognotes" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="staffshortname" HeaderText="Staff" ReadOnly="true" Visible="true"></obout:Column>
					<obout:Column DataField="logcontacttype" HeaderText="Type" Visible="true"></obout:Column>
					<obout:Column DataField="logpriorityID" Visible="false">
						<TemplateSettings RowEditTemplateControlId="ddl_logpriorityID" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="logcontactpurposeID" Visible="false">
						<TemplateSettings RowEditTemplateControlId="ddl_logcontactpurposeID" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="logcontacttypeID" Visible="false">
						<TemplateSettings RowEditTemplateControlId="ddl_logcontacttypeID" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="householdID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="logcontactID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="studyID" ReadOnly="true" Visible="false"></obout:Column>

					<obout:Column AllowEdit="true" AllowDelete="true" Width="120px"></obout:Column>
				</Columns>
				<Templates>
					<obout:GridTemplate ID="tbl_logcontact_rowedit" runat="server">
						<Template>
							<table>
								<tr>
									<td width="190px"></td>
									<td style="vertical-align:top">Priority:<br />
										<obout:OboutDropDownList ID="ddl_logpriorityID" runat="server" DataSourceID="sql_logpriority" Width="80px"
											DataValueField="logpriorityID" DataTextField="logpriority" /> 
									</td>
									<td style="vertical-align:top">Type:<br />
										<obout:OboutDropDownList ID="ddl_logcontacttypeID" runat="server" DataSourceID="sql_logcontacttype"  Width="160px"
											DataValueField="logcontacttypeID" DataTextField="logcontacttype"  />
									</td>
									<td style="vertical-align:top">Purpose:<br />
										<obout:OboutDropDownList ID="ddl_logcontactpurposeID" runat="server" DataSourceID="sql_logcontactpurpose"  Width="160px"
											DataValueField="logcontactpurposeID" DataTextField="logcontactpurpose"  />
									</td>
									<td style="vertical-align:top">Notes:<br />
										<obout:OboutTextBox ID="txt_lognotes" runat="server" TextMode="MultiLine" Height="40px" Width="250px" />
									</td>
								</tr>
							</table>
						</Template>
					</obout:GridTemplate>

				</Templates>
			</obout:Grid>

<br />
<br />

		
			<asp:Label ID="Label8" runat="server" Text="Information Log" Font-Bold="true" Font-Size="Small" ForeColor="GrayText" ></asp:Label>
			<obout:Grid ID="gridLogInfo" runat="server" CallbackMode="true" Serialize="true" ViewStateMode="Enabled" 
				AutoGenerateColumns="false"  AllowPageSizeSelection="false"  AllowAddingRecords="true" 
				PageSize="-1" AllowFiltering="false" AllowPaging="false" AllowEdit="true" OnRowDataBound="gridLogInfo_RowDataBound"
				OnUpdateCommand="gridloginfo_UpdateCommand" OnInsertCommand="gridloginfo_InsertCommand" OnDeleteCommand="gridloginfo_DeleteCommand" OnRebind="gridloginfo_Rebind">
				<ClientSideEvents OnClientPopulateControls="setup_loginfo" OnBeforeClientAdd="onInserting_loginfo" OnBeforeClientDelete="onDeleting_loginfo" ExposeSender="true"  />
				<TemplateSettings RowEditTemplateId="tbl_loginfo_rowedit"  />
				<Columns>
					<obout:Column DataField="loginfodate" HeaderText="Date/Time" ReadOnly="true" Visible="true" Width="120px" DataFormatString="{0:d} {0:t}"></obout:Column>
					<obout:Column DataField="loginfo_timesince" ReadOnly="true" HeaderText="Time Since" Width="90px" Visible="true"></obout:Column>
					<obout:Column DataField="logpriority" HeaderText="Priority"  Width="90px" Visible="true" ></obout:Column>
					<obout:Column DataField="loginfocat" HeaderText="Type" Width="140px" Visible="true"  ></obout:Column>
					<obout:Column DataField="loginfonotes" HeaderText="Info Notes" Visible="true" Width="410px" Wrap="true"  >
						<TemplateSettings RowEditTemplateControlId="txt_loginfonotes" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="staffshortname" HeaderText="Staff" ReadOnly="true" Visible="true"></obout:Column>
					<obout:Column DataField="logpriorityID" Visible="false">
						<TemplateSettings RowEditTemplateControlId="ddl_loginfopriorityID" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="loginfocatID" Visible="false">
						<TemplateSettings RowEditTemplateControlId="ddl_loginfocatID" RowEditTemplateControlPropertyName="value" />
					</obout:Column>
					<obout:Column DataField="householdID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="loginfoID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="studyID" ReadOnly="true" Visible="false"></obout:Column>

					<obout:Column AllowEdit="true" AllowDelete="true" Width="120px"></obout:Column>
				</Columns>
				<Templates>
					<obout:GridTemplate ID="tbl_loginfo_rowedit" runat="server">
						<Template>
							<table>
								<tr>
									<td width="190px"></td>
									<td style="vertical-align:top">Priority:<br />
										<obout:OboutDropDownList ID="ddl_loginfopriorityID" runat="server" DataSourceID="sql_logpriority" Width="80px"
											DataValueField="logpriorityID" DataTextField="logpriority" /> 
									</td>
									<td style="vertical-align:top">Type:<br />
										<obout:OboutDropDownList ID="ddl_loginfocatID" runat="server" DataSourceID="sql_loginfocat"  Width="160px"
											DataValueField="loginfocatID" DataTextField="loginfocat"  />
									</td>
<%--									<td style="vertical-align:top">Purpose:<br />
										<obout:OboutDropDownList ID="ddl_loginfopurposeID" runat="server" DataSourceID="sql_loginfopurpose"  Width="160px"
											DataValueField="loginfopurposeID" DataTextField="loginfopurpose"  />
									</td>--%>
									<td style="vertical-align:top">Notes:<br />
										<obout:OboutTextBox ID="txt_loginfonotes" runat="server" TextMode="MultiLine" Height="40px" Width="250px" />
									</td>
								</tr>
							</table>
						</Template>
					</obout:GridTemplate>

				</Templates>
			</obout:Grid>







</asp:Panel>

 


	<br/>
	<br/>


	<asp:Label ID="lblInfo" runat="server"></asp:Label>

	
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
			SelectCommand="select personroleID, personrole from uwautism_research_backend..tblPersonRole_lkup">
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


    	<asp:SqlDataSource runat="server" ID="sql_subjects"  ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	 SelectCommand="exec sec.spSetUserContext 'jeffmun'; select lastname, firstname, studyname, ID, groupname, subjstatus, subjstatusdetail  from vwmasterstatus_S a join tblperson b ON a.personID = b.personID where a.householdID=@householdID order by a.personID, studyname;">
			<SelectParameters>
                <asp:QueryStringParameter Name="householdID" QueryStringField="hhID" Type="Int32" />
			</SelectParameters>  
	</asp:SqlDataSource>



</asp:Content>
