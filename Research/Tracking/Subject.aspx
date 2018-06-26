
<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Subject.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_Subject" Title="Subject Info"   Theme="Skin1" EnableEventValidation="false"   %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<%-- THIS WAS IN THE SCRIPTMANAGER TAG BUT GIVES ERROR WHEN BUILDING WEBSITE:   ValidateRequestMode="Enabled" --%>
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

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


<%--    //ob_post.post(null, "<%= this.ID %>:GetDDLcontents", setupDDL_measstatusdetailID);  //call the method in code behind--%>
<%--	<script type="text/javascript">
		function editM(record) {
			ob_post.AddParam("measstatusID", record.studymeassubjID);       //pass the measstatusID to limit the choices in the DDL
			//ob_post.AddParam("measstatusdetailID", record.measstatusdetailID);      // pass the measstatusID to set the selected value
			ob_post.post(null, "<%= this.ID %>:loadMdetails"); //, processAjaxResult);  //call the method in code behind
		}
	</script>--%>



<script type="text/javascript">


	

	function setup_changed_subjstatusID(sender, index) {

		var ddlSS = document.getElementById('<%= ddlSS.ClientID %>');
		//ddlSSD.onchange = null;
		//only proceed if the value is not null
		try
		{
			if (ddlSS.value != null) {
				if (ddlSS.value != "") {
					ob_post.AddParam("ctlname", "ddlSSD");       //pass the measstatusID to limit the choices in the DDL
					//ob_post.AddParam("subjstatusID", this._value);      // pass the measstatusID to filter the available options
					ob_post.AddParam("subjstatusID", ddlSS.value);      // pass the measstatusID to filter the available options

					ob_post.post(null, "<%= this.ID %>:GetDDLcontentsSSD", setup_SSD_step2);  //call the method in code behind
				}
			}
		}
		catch (err) {
			//alert("foo"+err.message);
		}
	}

	function setup_changed_subjstatusdetailID(sender, index) {

		var ddlSSD = document.getElementById('<%= ddlSSD.ClientID %>');
		var hidSSD = document.getElementById('<%= hidSSD.ClientID %>');

		//only proceed if the value is not null
		try {
			if (ddlSSD.value != null) {
				if (ddlSSD.value != "") {
					hidSSD.value = ddlSSD.value;
				}
			}
		}
		catch (err) {
			alert("foo  "+err.message);
		}
	}


	function setup_SSD_step2(sData) {
		if (sData == null || sData == "") return;

		//var responseContent = sData.split('|');li
		//var ctlname = responseContent[2]

		var ddlSSD = document.getElementById('<%= ddlSSD.ClientID %>');

		ddlSSD.options.length = 0;
		//ddlSSDx.value('');

		var options = sData.split(';');

		var opt0 = document.createElement("option");
		opt0.text = '--select new detail--';
		opt0.value = '-1';
		ddlSSD.options.add(opt0);

		for (var i = 0; i < options.length; i++) {
			var data = options[i].split('^');

			if (data.length > 1) {
				var opt = document.createElement("option");
				opt.text = data[1];
				opt.value = data[0];
				ddlSSD.options.add(opt);
			}
		}

	}



	function setupM_changed_measstatusID() {

		if (this._value != "") {
			ob_post.AddParam("ctlname", "measstatusdetailID");       //pass the measstatusID to limit the choices in the DDL
			ob_post.AddParam("measstatusID", this._value);      // pass the measstatusID to filter the available options

			ob_post.AddParam("measstatusdetailID", "-1");      // the selected value

			ob_post.post(null, "<%= this.ID %>:GetDDLcontents", setupM_step2);  //call the method in code behind
		}
	}



	function setupM_step1(sender, record) {

		//turn off onchange initially until everything is populated.
		ddl_measstatusID.onchange = null;

		//update the controls in the row edit template
		try {

			//set the value of the DLL
			for (var opts = 0; opts < ddl_measstatusID.options.length; opts++) {
				if (ddl_measstatusID.options[opts].value == record.measstatusID) {
					ddl_measstatusID.value(ddl_measstatusID.options[opts].value);
					flag = true;
					break;
				}
			}

			//set the value of the DLL
			for (var opts = 0; opts < ddl_clinician.options.length; opts++) {
				if (ddl_clinician.options[opts].value == record.clinician) {
					ddl_clinician.value(ddl_clinician.options[opts].value);
					flag = true;
					break;
				}
			}


			if (record.date_text != "") {
				var datepickM = document.getElementById('datepickM');
				datepickM.value = record.date_text;
			}

			if (record.notes != "") {
				txt_M_notes.value = record.notes;
				txt_M_notes.TextBox.value = record.notes;
			}
			else {
				txt_M_notes.value = "";
				txt_M_notes.TextBox.value = "";
			}

		}
		catch (err) {
			//alert("foo"+err.message);
		}

		//get the data needed to properly populate the DDL
		ob_post.AddParam("ctlname", "measstatusdetailID");       //pass the measstatusID to limit the choices in the DDL
		ob_post.AddParam("measstatusID", record.measstatusID);      // pass the measstatusID to filter the available options
		ob_post.AddParam("measstatusdetailID", record.measstatusdetailID);      // the selected value
		ob_post.post(null, "<%= this.ID %>:GetDDLcontents", setupM_step2);  //call the method in code behind

	}



	function setupM_step2(sData) {
		if (sData == null || sData == "") return;

		var responseContent = sData.split('|');
		var ctlname = responseContent[2]


		ddl_measstatusdetailID.options.clear();
		ddl_measstatusdetailID.value('');

		var options = responseContent[0].split(';');

		for (var i = 0; i < options.length; i++) {
			var data = options[i].split('^');
			if (data.length > 1) {
				ddl_measstatusdetailID.options.add(data[0], data[1]);
			}
		}

		//set the value of the DLL
		for (var opts = 0; opts < ddl_measstatusdetailID.options.length; opts++) {
			if (ddl_measstatusdetailID.options[opts].value == responseContent[1]) {
				ddl_measstatusdetailID.value(ddl_measstatusdetailID.options[opts].value);
				flag = true;
				break;
			}
		}

		ddl_measstatusID.onchange = setupM_changed_measstatusID;
		//alert('changes will now update ddl');

	}


	function exportToExcel() {
		gridM.exportToExcel();
	}


	function saveChanges_M(btnObj) {
	  
		//alert("saveChanges_M_enter");

		gridM.save();

		//alert("saveChanges_M_exit");

		return false;
	}

	function onSaving_M(sender, record) {

		//alert("onSaving_M_enter");
		//var Mdata = new Object();

		//Mdata.subjID = ddlID.value();
		//Mdata.studymeassubjID = record.studymeassubjID;
		//etc.

		var smsIDs = "";
		//Check if multiple records are selected
		if (sender.SelectedRecords.length>1)
		{
			for (var i = 0; i < sender.SelectedRecords.length; i++) {
				if (i > 0)
				{
					smsIDs = smsIDs + ",";
				}
				var tmp = sender.SelectedRecords[i];
				smsIDs = smsIDs + tmp.studymeassubjID;
			}
		}


		if (record.studymeassubjID)
		{
			if (smsIDs == "")
			{
				smsIDs = record.studymeassubjID;
			}
			PageMethods.UpdateM(ddlID.value(), smsIDs, record.measstatusID, record.measstatusdetailID,
				datepickM.value, record.clinician, txt_M_notes.TextBox.value, onSucceeded_M, onFailedAction);
		} 

		//alert("onSaving_M_exit");

		return false;
	}

	function onSucceeded_M() {
		gridM.refresh();
	}

	function onFailedAction(error) {
		alert(error.get_message());
	}



	function onSaving_A(sender, record) {



		//(@actionID int, @actionstatusID int, @respforID int, @CompletedBy int, @datedone date, @notes varchar(1000))
		//txt_A_notes.TextBox.value
		var actionIDs = "";
		//Check if multiple records are selected
		if (sender.SelectedRecords.length > 1) {
			for (var i = 0; i < sender.SelectedRecords.length; i++) {
				if (i > 0) {
					actionIDs = actionIDs + ",";
				}
				var tmp = sender.SelectedRecords[i];
				actionIDs = actionIDs + tmp.actionID;
			}
		}

		var appttimes = document.getElementById('ApptTimes');
		var timepair = new Datepair(appttimes);

		var starttime = timepair.startTimeInput.value;
		var endtime = timepair.endTimeInput.value;

		var datepickA = document.getElementById('datepickA');
		var txt_location = document.getElementById('<%= GetControlClientIdFromTemplate("gridA","txt_location", 0) %>');

		if (record.actionID) {
			if (actionIDs == "") {
				actionIDs = record.actionID;
			}
			if (record.actionID) {
				PageMethods.UpdateA(actionIDs, record.actionstatusID, record.respforID, record.CompletedBy,
					datepickA.value, starttime, endtime, txt_location.value, txt_A_notes.TextBox.value, onSucceeded_A, onFailedAction);
			}
		}

		return false;
	}


	function saveChanges_A(btnObj) {

		gridA.save();

		return false;
	}

	function onSucceeded_A() {
		gridA.refresh();
	}


	function setupA_step1(sender, record) {


		//update the controls in the row edit template
		try {
			//get the controls
			var datepickA = document.getElementById('datepickA');
			var txt_location = document.getElementById('<%= GetControlClientIdFromTemplate("gridA","txt_location", 0) %>');
			var lbllocation = document.getElementById('<%= GetControlClientIdFromTemplate("gridA","lblLocation", 0) %>');
			var appttimes = document.getElementById('ApptTimes');
			var timepair = new Datepair(appttimes);

			

			if (record.datedone_text != "") {
				datepickA.value = record.datedone_text;
			}
			else
			{
				datepickA.value = "";
			}

			if (record.notes != "") {
				txt_A_notes.value = record.notes;
				txt_A_notes.TextBox.value = record.notes;
			}
			else {
				txt_A_notes.value = "";
				txt_A_notes.TextBox.value = "";
			}

			if (record.location != "") {
				txt_location.value = record.location;
				//txt_location.TextBox.value = record.location;
			}
			else {
				txt_location.value = "";
				//txt_location.TextBox.value = "";
			}


			if (record.actiontype == "Session" | record.actiontype == "Phone Call")
			{
				if (record.starttime != "")
				{
					timepair.startTimeInput.value = record.starttime;
				}
				else
				{
					timepair.startTimeInput.value = "";
				}
				if (record.endtime != "") {
					timepair.endTimeInput.value = record.endtime;
				}
				else {
					timepair.endTimeInput.value = "";
				}
			}
			else
			{  //Hide the stuff that is only for sessions and phone calls

				//datepickA.display = 'None';
				$(appttimes).hide();
				$(lbllocation).hide();
				$(txt_location).hide();
				//txt_location.visible = false;
				//txt_location.TextBox.visible = false;
				//location.visible = false;

			}



		}
		catch (err) {
			//alert("foo"+err.message);
		}

		//get the data needed to properly populate the DDL
		ob_post.AddParam("ctlname", "actionstatusID");       //pass the measstatusID to limit the choices in the DDL
		ob_post.AddParam("actiontypeID", record.actiontypeID);      // pass the actiontypeID to filter the available options
		ob_post.AddParam("actionstatusID", record.actionstatusID);      // pass the actiontypeID to filter the available options
		ob_post.post(null, "<%= this.ID %>:GetDDLcontents_A", setupA_step2);  //call the method in code behind


	}



	function setupA_step2(sData) {
		if (sData == null || sData == "") return;

		var responseContent = sData.split('|');
		var ctlname = responseContent[2]


		ddl_actionstatusID.options.clear();
		ddl_actionstatusID.value('');

		var options = responseContent[0].split(';');

		for (var i = 0; i < options.length; i++) {
			var data = options[i].split('^');
			if (data.length > 1) {
				ddl_actionstatusID.options.add(data[0], data[1]);
			}
		}

		//set the value of the DLL
		for (var opts = 0; opts < ddl_actionstatusID.options.length; opts++) {
			if (ddl_actionstatusID.options[opts].value == responseContent[1]) {
				ddl_actionstatusID.value(ddl_actionstatusID.options[opts].value);
				flag = true;
				break;
			}
		}


	}

<%--	function EditSS()
	{
		var panel = document.getElementById('<%= panelEditSS.ClientID %>');
		panel.visible = true;
	}--%>


	function cancelA()
	{
		gridA.cancel();
		return false;
	}




	function setup_C(sender, record) {


		//update the controls in the row edit template
		try {
			//get the controls
			var datepickC = document.getElementById('datepickC');

			if (record.datesigned != "") {
				datepickC.value = record.datesigned;
			}
			else {
				datepickC.value = "";
			}

		}
		catch (err) {
			//alert("foo"+err.message);
		}
	}
	
	function saveChanges_C(btnObj) {
		//alert("saveChanges_C_enter");
		gridC.save();
		//alert("saveChanges_C_exit");
		return false;
	}

	</script>


<script type="text/javascript">
			function show_hide_A() {

				//var gridA = document.getElementById("gridA");

				gridA.style.display = 'none';
			}

</script>
	


	<script type="text/javascript">

		//ATTACH THE DATE AND TIME PICKERS


		$(function () 
		{
			$('#datepickA,#defaultInline').datepick({
				 monthsToShow: 3, monthsToStep: 3,
				prevText: 'Prev months', nextText: 'Next months'
			});
		});

		$(function () {
			$('#datepickM,#defaultInline').datepick();
		});
		$(function () {
			$('#datepickC,#defaultInline').datepick();
		});

		$(function () {
		    $('#ApptTimes .time').timepicker({
		        'showDuration': true,
		        'timeFormat': 'g:ia',
		        'scrollDefault': '8:00AM', 'mintime': '6:00AM'
		    });

		    var timeOnlyExampleEl = document.getElementById('ApptTimes');
		    var timeOnlyDatepair = new Datepair(timeOnlyExampleEl);


		    //$('#time start').timepicker({ 'scrollDefault': '8:00AM', 'mintime':'6:00AM' });
		});


	</script>


	<script type="text/javascript">
		function btnEditSS_Click()
		{
			if(clientSubjStatusState.value=="view")
			{

				document.getElementById('btnUpdateSSContainer').style.display = '';

				document.getElementById('SubjNotesContainer').style.display = 'none';
				document.getElementById('EditSubjNotesContainer').style.display = '';

				document.getElementById('ddlSSContainer').style.display = '';
				document.getElementById('ddlSSDContainer').style.display = '';

				document.getElementById('btnEditSSContainer').style.display = 'none';

				clientSubjStatusState.value = "edit";
			}
			return false;
		}

		function btnCancelSS_Click() {
			if (clientSubjStatusState.value == "edit") {

				document.getElementById('btnUpdateSSContainer').style.display = 'none';

				document.getElementById('SubjNotesContainer').style.display = '';
				document.getElementById('EditSubjNotesContainer').style.display = 'none';

				document.getElementById('ddlSSContainer').style.display = 'none';
				document.getElementById('ddlSSDContainer').style.display = 'none';

				document.getElementById('btnEditSSContainer').style.display = '';

				clientSubjStatusState.value = "view";
			}
			return false;
		}



	</script>

		<style>
			.time
			{
				font-family: Verdana;
				font-size: 12px;
				font-weight:bold;
				color:#494900;
				background-color:#FFFFFF;
				width:100px;
			}
		</style>





<%--from :  http://stackoverflow.com/questions/14746564/asp-net-get-screen-width?rq=1--%>
	<input type="hidden" value="" name="clientScreenHeight" id="clientScreenHeight" />
	<input type="hidden" value=""  name="clientScreenWidth" id="clientScreenWidth" />

	<input type="hidden" value="view" name="clientSubjStatusState" id="clientSubjStatusState" />

	<asp:HiddenField ID="hidSSD" runat="server" />
<%--	<input type="hidden" value="" name="hidSSD" id="hidSSD" />--%>

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>


<table width="90%">
	
	<tr>
		<td  Width="20%">
			<asp:Label ID="Label3" runat="server" Text="Subject Tracking" Font-Size="Medium" Font-Bold="false"></asp:Label>
		</td>
		<td  Width="60%">
			<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
			<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

		</td>
		<td  Width="20%">
		</td>
	</tr>
	<tr>
		<td >
			<obout:OboutButton ID="btnReturnToHousehold" runat="server" Text="View Household" OnClick="btnReturnToHousehold_Click" Visible="false"/>
			<obout:OboutButton ID="btnViewDataValues" runat="server" Text="View Data Charts" OnClick="btnViewDataValues_Click" Visible="false"/>
		</td>  
		<td>
			<obout:OboutDropDownList ID="ddlID" runat="server" OnSelectedIndexChanged="ddlID_SelectedIndexChanged" Width="210px" Height="200px"  AutoPostBack="true"></obout:OboutDropDownList>
		</td>
		<td align="right">
			<obout:OboutButton runat="server" Text="Save to Excel" OnClientClick="exportToExcel();return false;" Visible="false" />
		</td>
	</tr>
</table>


	<asp:HiddenField ID="hidHouseholdID" runat="server" />



	<br /><br />

	<asp:Panel ID="panelSubjectInfo" runat="server">
	
			
	<table> 
		<tr>
			<td width="170px">
				<asp:Label ID="Label1" runat="server" Text="ID" Font-Bold="true" Font-Size="XX-Small" ForeColor="GrayText"  ></asp:Label>
			</td>
			<td width="120px">
				<asp:Label ID="Label4" runat="server" Text="Group" Font-Bold="true" Font-Size="XX-Small" ForeColor="GrayText"  ></asp:Label>
			</td>
			<td width="160px">
				<asp:Label ID="Label5" runat="server" Text="Subject Status" Font-Bold="true" Font-Size="XX-Small"  ForeColor="GrayText" ></asp:Label>
			</td>
			<td width="170px">
				<asp:Label ID="Label6" runat="server" Text="Subject Status Detail" Font-Bold="true" Font-Size="XX-Small" ForeColor="GrayText" ></asp:Label>
			</td>
			<td width="250px">
					<asp:Label ID="Label9" runat="server" Text="Subject Notes" Font-Bold="true" Font-Size="XX-Small" ForeColor="GrayText" ></asp:Label>

			</td>
			<td style="vertical-align:top" rowspan="2">
				<asp:Panel  ID="p_timepoint" runat="server"  Visible="false"></asp:Panel>
			</td>


		</tr>
		<tr>
			<td width="170px" style="vertical-align:top">
				<asp:Label ID="lblID" runat="server" Text="" Font-Bold="true" Font-Size="14"  ></asp:Label>
			</td>
			<td width="120px" style="vertical-align:top">
				<asp:Label ID="lblGroupName" runat="server" Text="" Font-Bold="true" Font-Size="11"  ></asp:Label>
			</td>
			<td  style="vertical-align:top" Width="160px">
				<asp:Label ID="lblSS" runat="server" Text="" Font-Bold="true" Font-Size="11"  ></asp:Label>
				<br />
					<div ID="ddlSSContainer" style="display:none;">
						<asp:DropDownList ID="ddlSS" runat="server"  DataSourceID="sqlSS" AutoPostBack="false"   DataTextField="subjstatus" DataValueField="subjstatusID" Width="160px" onchange="setup_changed_subjstatusID()"/>
					</div>
			</td>
			<td  style="vertical-align:top"  Width="180px">
				<asp:Label ID="lblSSD" runat="server" Text="" Font-Bold="true" Font-Size="11"  ></asp:Label>
				<br />
					<div ID="ddlSSDContainer" style="display:none;">
						<asp:DropDownList ID="ddlSSD" runat="server" AutoPostBack="false"  Width="180px"  onchange="setup_changed_subjstatusdetailID()" />
					</div>

			</td>
			<td  style="vertical-align:top" >

				<div id="SubjNotesContainer">
					<asp:Label ID="lblNotes" runat="server" TextMode="MultiLine" Width="290px" Height="60px" Font-Size="10" ></asp:Label>
				</div>
				<div id="EditSubjNotesContainer" style=" display: none;">
					<asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="230px" Height="60px" Font-Size="10" ></asp:TextBox>
				</div>

</td>
			<td style="vertical-align:top">				
				
				<div id="btnEditSSContainer">
					<obout:OboutButton ID="btnEditSS" runat="server" Text="Edit Subject Status" OnClientClick="return btnEditSS_Click('btnEditSS')"     Visible="true"></obout:OboutButton>
				</div>
				<div id="btnUpdateSSContainer" style="display: none;">
					<obout:OboutButton ID="btnUpdateSS" runat="server" Text="Update Subject Status" OnClick="btnUpdateSS_Click"  Visible="true"></obout:OboutButton>
					<br /><br />
					<obout:OboutButton ID="btnCancelSS" runat="server" Text="Cancel" ForeColor="DarkRed" OnClientClick="return btnCancelSS_Click('btnCancelSS')"  Visible="true"></obout:OboutButton>
					<%--OnClick="btnCancelSS_Click"  --%>

				</div>

			</td>   
		</tr>

	</table>
		

	</asp:Panel>


	<asp:Label ID="lblViewState" runat="server" Visible="false"></asp:Label>

	<asp:UpdatePanel ID="panelSubjectInfo2" runat="server" Visible="false" ChildrenAsTriggers="true" >
	 <ContentTemplate>

		 </ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="ddlSSD" EventName="SelectedIndexChanged" />
		</Triggers>
	</asp:UpdatePanel>


	<br />
	<asp:Label ID="lblA" runat="server" Text="Actions" Font-Bold="true" Font-Size="Medium" ForeColor="GrayText" ></asp:Label>
	<asp:Button ID="btnA" runat="server" Text="Hide"  ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None" Font-Size="XX-Small" OnClick="btnA_Click" ></asp:Button>


	<obout:Grid ID="gridA" runat="server"   
		CallbackMode="true" Serialize="true" ViewStateMode="Enabled" HideColumnsWhenGrouping="true" ShowLoadingMessage="true" PageSize="-1"        
		AllowPageSizeSelection="false"  AllowAddingRecords="false"  AutoGenerateColumns="false" AllowPaging="false"
		AllowRecordSelection="true"  AllowFiltering="true"   AllowGrouping="true" GroupBy="timepoint_text" ShowGroupsInfo="true"
		OnRebind="gridA_Rebind" OnRowDataBound="gridA_RowDataBound">
		<GroupingSettings AllowChanges="true" />
		<TemplateSettings RowEditTemplateId="tpl_A_rowedit"      /> 
		<ClientSideEvents   OnClientPopulateControls="setupA_step1"  OnBeforeClientUpdate="onSaving_A" ExposeSender="true" />
		<FilteringSettings FilterLinksPosition="Top" FilterPosition="Top" MatchingType="AllFilters" />
		<Columns>
			<obout:CheckBoxSelectColumn ShowHeaderCheckBox="true"  ControlType="Standard" Width="50px" />

			<obout:Column AllowEdit="true" Width="50px"><TemplateSettings EditTemplateId="tplA_1" /></obout:Column>
			<obout:Column DataField="timepoint_text" HeaderText="TP" Width="60px"></obout:Column>


			<obout:Column DataField="actiontypeID" HeaderText="TypeID" Visible="false"></obout:Column>
			<obout:Column DataField="actiontype" HeaderText="Type"  Width="100px"></obout:Column>
			<obout:Column DataField="actiontext" HeaderText="Action"  Width="150px"></obout:Column>
			
			<obout:Column DataField="actionstatusID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_actionstatusID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			
			<obout:Column DataField="ActionStatusShort" HeaderText=" "  Width="60px"></obout:Column>
			<obout:Column DataField="actionstatuscolor" Visible="false"></obout:Column>

			<obout:Column DataField="actionstatus" HeaderText="Status"  Width="150px"></obout:Column>
			<obout:Column DataField="datedone_text" HeaderText="Date"  Width="90px"  ></obout:Column>
			<obout:Column DataField="apptinfo" HeaderText="Appt" ReadOnly="true" Width="100px"  ></obout:Column>

<%--			<obout:Column DataField="ApptStartTime" Visible="false">
				<TemplateSettings RowEditTemplateControlId="txt_ApptStart" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="ApptEndTime" Visible="false">
				<TemplateSettings RowEditTemplateControlId="txt_ApptEnd" RowEditTemplateControlPropertyName="value" />
			</obout:Column>--%>

			<obout:Column DataField="location" Visible="false" >
				<TemplateSettings RowEditTemplateControlId="txt_location" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="respforID" Visible="false" >
				<TemplateSettings RowEditTemplateControlId="ddl_respforID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="CompletedBy" Visible="false" >
				<TemplateSettings RowEditTemplateControlId="ddl_CompletedBy" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="Staff_RespFor" HeaderText="Responsible For" Width="110px"/>
			<obout:Column DataField="Staff_CompBy" HeaderText="Completed By"  Width="110px"/>


			<obout:Column DataField="notes" HeaderText="Notes"   >
				<TemplateSettings RowEditTemplateControlId="txt_A_notes" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="actionID" Visible="false" ReadOnly="true" HeaderText="actionID" >
				<TemplateSettings RowEditTemplateControlId="txt_actionID" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="starttime" Visible="false" ReadOnly="true"/>
			<obout:Column DataField="endtime" Visible="false" ReadOnly="true"/>


		</Columns>

		<Templates>
			<obout:GridTemplate ID="tpl_A_rowedit" runat="server"  >
				
				<Template >
				
							<table>
								<tr>
									<td></td>
									<td style="vertical-align:top">Status:<br />
										<obout:OboutTextBox runat="server" ID="txt_actionID" Visible="false"></obout:OboutTextBox>
										<obout:OboutDropDownList runat="server" ID="ddl_actionstatusID"  
											DataValueField="actionstatusID" DataTextField="actionstatus" >
										</obout:OboutDropDownList>
										</td>
									<td style="vertical-align:top">Resp for:<br />	

										<obout:OboutDropDownList runat="server" ID="ddl_respforID"  DataSourceID="sql_Staff"
											DataValueField="staffID" DataTextField="staffname" ></obout:OboutDropDownList>

									</td>
									<td style="vertical-align:top">Date:<br /><input type="text" id="datepickA" style=" { width: 100px; }" />

<%--										<asp:TextBox runat="server" ID="txt_A_datedone" Width="90px"   ></asp:TextBox>
										<obout:Calendar ID="cal_A_datedone" runat="server" DatePickerImagePath="~/App_Obout/Calendar/styles/icon2.gif" 
																 DatePickerMode="true"
																 TextBoxId="txt_A_datedone" 
																 DatePickerSynchronize="true" DateFormat="MM/dd/yyyy" SelectedDate='<%#  DataBinder.Eval(Container.DataItem, "[datedone]") %>' >
										</obout:Calendar>    --%>

										</td>
									<td style="vertical-align:top">Completed by:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_CompletedBy"  DataSourceID="sql_Staff"
											DataValueField="staffID" DataTextField="staffname" ></obout:OboutDropDownList>

									</td>
									<td width="50px"></td>
									<td>

										<obout:OboutButton runat="server" ID="btnA_Update" Text="Update"  OnClientClick="return saveChanges_A('btnA_Update')"></obout:OboutButton>


<%--										<obout:OboutButton runat="server" ID="btnM_Update" Text="Update" OnClientClick="gridM.save()" ></obout:OboutButton>--%>

									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>
										<asp:Label ID="lblLocation" runat="server" Text="Location:" Font-Size="XX-Small"  /><br /><%--<input type="text" id="room" class="time" />--%>
										<%--<obout:OboutTextBox runat="server" ID="txt_location"  Width="120px" ></obout:OboutTextBox>--%>
										<asp:TextBox ID="txt_location" runat="server"   Width="120px" ></asp:TextBox>
									</td>
									<td align="right">
										<p id="ApptTimes">
											<asp:Label ID="l1" runat="server" Width="65px" Text="Start time:"></asp:Label>
											<input type="text" class="time start" style=" { width: 100px; }"  />
										<br />
											<asp:Label ID="Label8" runat="server" Width="65px" Text="End time:"></asp:Label>
											<input type="text" class="time end" />
											</p>    
									</td>
								</tr>
								<tr>
									<td></td>
										<td colspan="4" style="vertical-align:top">Notes:<br />


										<obout:OboutTextBox runat="server" ID="txt_A_notes" TextMode="MultiLine" Width="500px" Height="80px"   ></obout:OboutTextBox>

										</td>
										 <td width="50px"></td>
									<td>
											<obout:OboutButton runat="server" ID="btnA_Cancel" OnClientClick="return (cancelA();)" Text="Cancel"></obout:OboutButton>

<%--										<obout:OboutButton runat="server" ID="btnA_Cancel" OnClientClick="gridA.cancel()" Text="Cancel"></obout:OboutButton>--%>
<%--										<input type="button" value="Cancel2" onclick="gridM.cancel()" class="tdText" /> --%>

									</td>

								</tr>
							</table>

				</Template>
			</obout:GridTemplate>

			<obout:GridTemplate ID="tplA_1">
			 <Template>&#160;</Template>
			</obout:GridTemplate>

		</Templates>
			</obout:Grid>

	<br />
	<asp:Label ID="Label2" runat="server" Text="Measures" Font-Bold="true" Font-Size="Medium"  ForeColor="GrayText"></asp:Label>
	<asp:Button ID="btnM" runat="server" Text="Hide" ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None" Font-Size="XX-Small" OnClick="btnM_Click" ></asp:Button>





					 
	<obout:Grid ID="gridM" runat="server" 
		CallbackMode="true" Serialize="true" ViewStateMode="Enabled" HideColumnsWhenGrouping="true" ShowLoadingMessage="true" PageSize="-1"        
		AllowPageSizeSelection="false"  AllowAddingRecords="false"  AutoGenerateColumns="false" AllowPaging="false"
		AllowRecordSelection="true" AllowFiltering="true"   AllowGrouping="true" GroupBy="timepoint_text,actiontext" ShowGroupsInfo="true"
		OnRowDataBound="gridM_RowDataBound" OnRowCreated="gridM_RowCreated" OnRebind="gridM_Rebind" >
		<GroupingSettings AllowChanges="true" />
		<TemplateSettings RowEditTemplateId="tpl_M_rowedit"      /> 
		<ExportingSettings FileName="TrackingMeasures" AppendTimeStamp="true"  />
		<ClientSideEvents   OnClientPopulateControls="setupM_step1"  OnBeforeClientUpdate="onSaving_M" ExposeSender="true" />
		<FilteringSettings FilterLinksPosition="Top" FilterPosition="Top"   />
		
		<Columns>
<%--			<obout:Column DataField="studymeassubjID" ReadOnly="true" HeaderText="SELECT" Width="100" runat="server">
					<TemplateSettings TemplateId="TemplateWithCheckbox"  />
			</obout:Column>--%>
			<obout:CheckBoxSelectColumn ShowHeaderCheckBox="true" ControlType="Standard" Width="50px" />

			<obout:Column AllowEdit="true" Width="50px">
				<TemplateSettings EditTemplateId="tplM_1" />
			</obout:Column>
			<obout:Column DataField="timepoint_text" HeaderText="TP" Width="60px"></obout:Column>
			<obout:Column DataField="actiontext" HeaderText="Action" Width="100px" DataFormatString_GroupHeader=""></obout:Column>
			<obout:Column DataField="studymeassubjID" Visible="false" ReadOnly="true" HeaderText="smsID" runat="server">
				<TemplateSettings RowEditTemplateControlId="txt_M_studymeassubjID" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="studymeasname" HeaderText="Measure" ></obout:Column>
			<obout:Column DataField="delink" HeaderText="DE status" Width="80px" ParseHTML="true" ></obout:Column>
			<obout:Column DataField="sms_dd_color"  HeaderText="Color" Visible="false"></obout:Column>

			
			<obout:Column DataField="measstatusID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_measstatusID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="measstatusdetailID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_measstatusdetailID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="measstatus"   HeaderText="Status" ShowFilterCriterias="false" Width="100px" >
				<TemplateSettings  FilterTemplateId="tpl_M_filter_measstatus" />
			</obout:Column>
			<obout:Column DataField="measstatusdetail" HeaderText="Status Detail"></obout:Column>
			<obout:Column DataField="date_text" HeaderText="Date" ReadOnly="true" Width="90px" ></obout:Column>
			<obout:Column DataField="clinician"   HeaderText="Clin" Visible="false" >
				<TemplateSettings RowEditTemplateControlId="ddl_clinician" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="clinname"   HeaderText="Clin" ></obout:Column>
			<obout:Column DataField="notes" HeaderText="Notes"   >
				<TemplateSettings RowEditTemplateControlId="txt_M_notes" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
		</Columns>


		<Templates>
			<obout:GridTemplate ID="tpl_M_rowedit" runat="server"  >
				
				<Template >
				
							<table>
								<tr>
									<td></td>
									<td style="vertical-align:top">Status:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_measstatusID" DataSourceID="sql_MeasStatus" 
											DataValueField="measstatusID" DataTextField="measstatus" >
											<ClientSideEvents OnSelectedIndexChanged="setupM_changed_measstatusID" />
										</obout:OboutDropDownList>
										</td>
									<td style="vertical-align:top">Status Detail:<br />	
										<obout:OboutDropDownList runat="server" ID="ddl_measstatusdetailID"  
											DataValueField="measstatusdetailID" DataTextField="measstatusdetail" />
									</td>
									<td style="vertical-align:top">Date Completed:<br />
										<input type="text" id="datepickM" style=" { width: 100px; }" />

<%--										<asp:TextBox runat="server" ID="txt_M_datedone" Width="90px"   ></asp:TextBox>
										<obout:Calendar ID="cal_M_datedone" runat="server" DatePickerImagePath="~/App_Obout/Calendar/styles/icon2.gif" 
																 DatePickerMode="true"
																 TextBoxId="txt_M_datedone" 
																 DatePickerSynchronize="true" DateFormat="MM/dd/yyyy" SelectedDate='<%#  DataBinder.Eval(Container.DataItem, "[date]") %>' >
										</obout:Calendar>    --%>
										<obout:OboutTextBox runat="server" ID="txt_M_studymeassubjID" Visible="false"></obout:OboutTextBox>

										</td>
									<td style="vertical-align:top">Completed by:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_clinician"  DataSourceID="sql_Staff"
											DataValueField="staffID" DataTextField="staffname" ></obout:OboutDropDownList>

									</td>
									<td width="50px"></td>
									<td>

										<obout:OboutButton runat="server" ID="btnM_Update" Text="Update"  OnClientClick="return saveChanges_M('btnM_Update')"></obout:OboutButton>


<%--										<obout:OboutButton runat="server" ID="btnM_Update" Text="Update" OnClientClick="gridM.save()" ></obout:OboutButton>--%>

									</td>
								</tr>
								<tr>
									<td></td>
										<td colspan="4" style="vertical-align:top">Notes:<br />


										<obout:OboutTextBox runat="server" ID="txt_M_notes" TextMode="MultiLine" Width="500px" Height="80px"   ></obout:OboutTextBox>

										</td>
										 <td width="50px"></td>
									<td>
										<obout:OboutButton runat="server" ID="btnM_Cancel" OnClientClick="gridM.cancel()" Text="Cancel"></obout:OboutButton>
<%--										<input type="button" value="Cancel2" onclick="gridM.cancel()" class="tdText" /> --%>

									</td>

								</tr>
							</table>

				</Template>
			</obout:GridTemplate>

			<obout:GridTemplate ID="tplM_1">
			 <Template>&#160;</Template>
			</obout:GridTemplate>

			<obout:GridTemplate runat="server" ID="tpl_M_filter_measstatus" ControlID="ddlFILTERmeasstatus" ControlPropertyName="value">
				<Template>
					<obout:OboutDropDownList runat="server" ID="ddlFILTERmeasstatus" ForeColor="Blue"
						DataSourceID="sql_MeasStatus" DataValueField="measstatus" DataTextField="measstatus" />
				</Template>
			</obout:GridTemplate>

		</Templates>
	</obout:Grid>



	<table>
		<tr>
			<td style="vertical-align:top">
	<asp:Label ID="lblC" runat="server" Text="Consents" Font-Bold="true" Font-Size="Medium"  ForeColor="GrayText"></asp:Label>
	<asp:Button ID="btnC" runat="server" Text="Hide" ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None"  Font-Size="XX-Small" OnClick="btnC_Click" ></asp:Button>


   

	<obout:Grid ID="gridC" runat="server" 
		CallbackMode="true" Serialize="true" ViewStateMode="Enabled" HideColumnsWhenGrouping="true" ShowLoadingMessage="true" PageSize="-1"        
		AllowPageSizeSelection="false"  AllowAddingRecords="false"  AutoGenerateColumns="false" AllowPaging="false"
		AllowRecordSelection="true" AllowFiltering="false"   AllowGrouping="true" GroupBy="timepoint_text" ShowGroupsInfo="true" OnUpdateCommand="gridC_UpdateCommand"
		 OnRebind="gridC_Rebind">
		<ClientSideEvents OnClientPopulateControls="setup_C"  ExposeSender="true" />
		<TemplateSettings RowEditTemplateId="tpl_C_rowedit" />
		<Columns>
			<obout:Column AllowEdit="true" Width="50px">
				<TemplateSettings EditTemplateId="tplC_1" RowEditTemplateControlId="tpl_C_rowedit" />
			</obout:Column>
			<obout:Column DataField="timepoint_text" HeaderText="TP" Width="60px"></obout:Column>
			<obout:Column DataField="consentformname" ReadOnly="true"></obout:Column>
			<obout:Column DataField="consentformversionname" ReadOnly="true"></obout:Column>
			<obout:Column DataField="datesigned" HeaderText="Date Signed">
				<TemplateSettings RowEditTemplateControlId="datepickC" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="SubjConsentID" ReadOnly="true" Visible="false"></obout:Column>

		</Columns>
		<Templates>
			<obout:GridTemplate ID="tpl_C_rowedit" runat="server">
				<Template>
				<table>
					<tr>
						<td>
							Date Signed:
							<br />
							<input type="text" id="datepickC" style=" { width: 100px; }" />
						</td>
						<td>
							<obout:OboutButton runat="server" ID="btnC_Update" Text="Update"  OnClientClick="return saveChanges_C('btnC_Update')"></obout:OboutButton>

							<br /><br />
							<obout:OboutButton runat="server" ID="btnC_Cancel" OnClientClick="gridC.cancel()" Text="Cancel"></obout:OboutButton>

						</td>
					</tr>
				</table>
				</Template>
			</obout:GridTemplate>
			<obout:GridTemplate ID="tplC_1">
			 <Template>&#160;</Template>
			</obout:GridTemplate>

		</Templates>
	</obout:Grid>
		

			</td>
			<td style="vertical-align:top">
	<asp:Label ID="Label7" runat="server" Text="Documents" Font-Bold="true" Font-Size="Medium"  ForeColor="GrayText"></asp:Label>
<%--	<asp:Button ID="Button1" runat="server" Text="Hide" ForeColor="Silver" BackColor="WhiteSmoke" BorderStyle="None"  Font-Size="XX-Small" OnClick="btnC_Click" ></asp:Button>--%>

<obout:OboutButton ID="btnAddDoc" runat="server" Text="Upload Document for this Subject" OnClick="btnAddDoc_Click"  ></obout:OboutButton>
   
<asp:Panel ID="panelDocs" runat="server"></asp:Panel>
				<asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="false" BorderColor="Silver">
					<Columns>
						<asp:TemplateField>
							<ItemTemplate>
						<asp:HyperLink ID="hyp1" runat="server"   NavigateUrl='<%# CreateHyperLinkUrl("~/Documents/ViewDoc.aspx?DocVersID=" ,  DataBinder.Eval(Container.DataItem, "[DocVersID]").ToString()) %>' 
							Text='<%# DataBinder.Eval(Container.DataItem, "DocTitle") %>' Target="_blank" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="DocTitle" HeaderText="Title" />
						<asp:BoundField DataField="DocDesc" HeaderText="Description" />
									<asp:BoundField DataField="TimeSinceUpload" HeaderText="Time since upload" ></asp:BoundField >
						<asp:BoundField DataField="staffshortname" HeaderText="Uploaded by"  ></asp:BoundField >

					</Columns>
				</asp:GridView>
<%--	<obout:Grid ID="gridD" runat="server" 
		CallbackMode="true" Serialize="true" ViewStateMode="Enabled" HideColumnsWhenGrouping="true" ShowLoadingMessage="true" PageSize="-1"        
		AllowPageSizeSelection="false"  AllowAddingRecords="false"  AutoGenerateColumns="false" AllowPaging="false"
		AllowRecordSelection="true" AllowFiltering="false"   >

		<Columns>
			<obout:Column DataField="DocVersID" HeaderText="DocVersID" Visible="true"></obout:Column>
			
 
			<obout:Column DataField="doctitle" runat="server" HeaderText="Title" TemplateID="tpl_link" ></obout:Column>
			<obout:Column DataField="docdesc" HeaderText="Description" Wrap="true" ></obout:Column>
			<obout:Column DataField="TimeSinceUpload" HeaderText="Time since upload" ></obout:Column>
			<obout:Column DataField="staffshortname" HeaderText="Uploaded by"  ></obout:Column>

		</Columns>
		<Templates>
			<obout:GridTemplate ID="tpl_link" runat="server">
				<Template>
					<asp:HyperLink ID="hyp1" runat="server" ValidateRequestMode="Disabled"  
							NavigateUrl='<%# CreateHyperLinkUrl("~/Documents/ViewDoc.aspx?DocVersID=" , Container.DataItem["DocVersID"].ToString()) %>' 
							Text='<%# Container.DataItem["DocTitle"] %>' Target="_blank">
					</asp:HyperLink>
					</asp:Label>

				</Template>
			</obout:GridTemplate>
		</Templates>

	</obout:Grid>--%>
		
			</td>
		</tr>
	</table>
	<br />
</asp:Panel>




	<br/>
	<br/>


	<asp:Label ID="lblInfo" runat="server"></asp:Label>

	<br />
	<br />


				<asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select -1 subjstatusID, '--Select new status--' subjstatus union select subjstatusID, subjstatus from uwautism_research_backend..tblsubjectstatus_lkup where subjstatusID in (select subjstatusID from tblStudy_SubjStatus where studyID = dbo.fnDefaultStudyIDByCurrentUser())">
		</asp:SqlDataSource>

<%--		<asp:SqlDataSource ID="sqlSSD" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select subjstatusID, a.subjstatusdetailID, subjstatusdetail from uwautism_research_backend..tblsubjstatusdetail_lkup a
			join tblsubjstatusanddetail b ON a.subjstatusdetailID = b.subjstatusdetailID ">
			<SelectParameters>
				<asp:ControlParameter Name="subjstatusID" ControlID="ddlSS" PropertyName="SelectedValue"  />
			</SelectParameters>	     
		</asp:SqlDataSource>--%>



	<asp:SqlDataSource ID="sql_MeasStatus" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select measstatusID, measstatus from uwautism_research_backend..tblmeasstatus_lkup">
	</asp:SqlDataSource>

	



	<asp:SqlDataSource ID="sql_Staff" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="exec spTracking_Staff_byStudy">
	</asp:SqlDataSource>

<%--		<asp:SqlDataSource ID="sqlSUBJ" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select subjID, ID, GroupName, ID + '  ' + GroupName + '......' IDgroup, subjstatusID, subjstatus, SubjStatusDetailID, subjstatusdetail, notes 
				from vwMasterStatus_S where subjID = @subjID"
		 UpdateCommand="update tblSubject set subjstatusID=@subjstatusID, subjstatusdetailID=@subjstatusdetailID, notes=@notes where subjID=@subjID">
		<SelectParameters>
			<asp:ControlParameter Name="subjID" ControlID="ddlID" PropertyName="SelectedValue" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="subjstatusID"   DbType="Int16" />
			<asp:Parameter Name="subjstatusdetailID"   DbType="Int16" />
			<asp:Parameter Name="notes" DbType="String" />
		</UpdateParameters>
	</asp:SqlDataSource>--%>

		  <%--   	<asp:SqlDataSource ID="sql_ActionStatus" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select actionstatusID, actionstatus from uwautism_research_backend..tblactionstatus_lkupselect a.actionstatusID, actionstatus from uwautism_research_backend..tblactionstatus_lkup a
					join tblActionTypeStatus b ON a.actionstatusID = b.actionstatusID
					where actiontypeID = @actiontypeID
					order by b.sortorder">
		<SelectParameters>
			<asp:Parameter Name="actiontypeID" Type="Int32" />
		</SelectParameters>	    
	</asp:SqlDataSource>--%>




<%--<asp:SqlDataSource ID="sqlA" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
	SelectCommand="select a.subjID, ID, actiontype, a.studyactionID, action_actiontext actiontext, a.actionstatusID, actionstatus, a.datedone, location, asststatusID, asstnotes, actionNotes , timepoint_text, timepoint
	from vwMasterStatus_A a 
	join tblaction b ON a.actionID = b.actionID
	where a.subjID = @subjID order by timepoint">
	<SelectParameters>
		<asp:ControlParameter Name="subjID" ControlID="ddlID" PropertyName="SelectedValue" />
	</SelectParameters>
</asp:SqlDataSource>





	<asp:SqlDataSource ID="sqlM" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select * from vwTracking_SubjInfo_M where subjID = @subjID"
		 UpdateCommand="update tblStudyMeasSubj set measstatusID=@measstatusID, measstatusdetailID=@measstatusdetailID, notes=@notes, date=@date, clinician=@clinician
				 where studymeassubjID=@studymeassubjID">
		<SelectParameters>
			<asp:ControlParameter Name="subjID" ControlID="ddlID" PropertyName="SelectedValue" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="measstatusID"   DbType="Int16" />
			<asp:Parameter Name="measstatusdetailID"   DbType="Int16" />
			<asp:Parameter Name="date" DbType="Date" />
			<asp:Parameter Name="clinican" DbType="Int16" />
			<asp:Parameter Name="notes" DbType="String" />
		</UpdateParameters>
	</asp:SqlDataSource>--%>

</asp:Content>
