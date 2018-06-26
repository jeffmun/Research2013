<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="EditPerson.aspx.cs" AutoEventWireup="true"
	Inherits="Info_Tracking_Subject" Title="Subject Info" %>

<%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="Obout_EasyMenu_Pro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>


	<style>
		.styleTBD {
			font: 8pt verdana;
			font-weight: 100;
			color: SteelBlue;
			outline-color: gray;
		}
	</style>
	<style>
		.styleData {
			font: 8pt verdana;
			font-weight: 100;
			color: Green;
			outline-color: gray;
		}
	</style>
	<style>
		.styleNA {
			font: 8pt verdana;
			font-weight: 100;
			color: gray;
			outline-color: gray;
		}
	</style>
	<style>
		.rowstyleAction {
			background-color: gray;
		}
	</style>

	<style>
		.right_align {
			text-align: right;
		}
	</style>

	<%--   <style>
		p {     
	color: DarkBlue;  
	}

		   
	.fs14 {
		   
		font-size: 12px;
		   
	}

		   
	</style > --%>

	<script type="text/javascript">

		function setupM_changed_measstatusID() {
			//var e = document.getElementById("ddl_measstatusID");
			//var value = e.options[e.selectedIndex].value;

			//var x = this.options[this.selectedIndex].value;
			if (this._value != "") {
				ob_post.AddParam("ctlname", "measstatusdetailID");       //pass the measstatusID to limit the choices in the DDL
				ob_post.AddParam("measstatusID", this._value);      // pass the measstatusID to filter the available options
				ob_post.AddParam("measstatusdetailID", "-1");      // the selected value
				ob_post.post(null, "<%= this.ID %>:GetDDLcontents", setupM_step2);  //call the method in code behind
			}
		}



		function setupM_step1(record) {

			//update the controls in the row edit template
			try {

				var txt_M_notes = document.getElementById('<%= GetControlClientIdFromTemplate("gridM","txt_M_notes", 0) %>');
				txt_M_notes.value = record.notes;

				//ddl_measstatusID.value = record.measstatusID;

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

				var txt_M_datedone = document.getElementById('<%= GetControlClientIdFromTemplate("gridM","txt_M_datedone", 0) %>');
				var cal_M_datedone = document.getElementById('_<%= GetControlClientIdFromTemplate("gridM","cal_M_datedone", 0) %>Button');

				var d = new Date(record.date);
				cal_M_datedone.SelectedDate = d;

				txt_M_datedone.value = (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear();

			}
			catch (err) {
				alert(err.message);
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
		}

		function exportToExcel() {
			gridM.exportToExcel();
		}

	</script>

	<%--from :  http://stackoverflow.com/questions/14746564/asp-net-get-screen-width?rq=1--%>
	<input type="hidden" value=""
		name="clientScreenHeight" id="clientScreenHeight" />
	<input type="hidden" value=""
		name="clientScreenWidth" id="clientScreenWidth" />

	<asp:Label ID="Label1" runat="server" Text="label1"></asp:Label>

	<table id="tblmyinfo" runat="server" width="100%">
		<tr>
			<td font-color="red"></td>
		</tr>
	</table>

	<table>
		<tr>
			<td colspan="4">
				<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
				<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

			</td>
		</tr>

	</table>

	<%-- <asp:TextBox ID="txtID" runat="server" Text="W001"></asp:TextBox>
	<asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" />--%>

	<asp:Label ID="lblDropDownList1" runat="server" Text="Client"></asp:Label>

	<obout:OboutDropDownList runat="server" ID="DropDownList1" AutoPostBack="True"
		DataSourceID="sql_vwDDLPeople" DataValueField="personID" 
		DataTextField="Name" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
	</obout:OboutDropDownList>

	<asp:TextBox ID="txtID0" runat="server" Text="W001" OnTextChanged="txtID0_TextChanged"></asp:TextBox>
	<asp:Button ID="btnLoad0" runat="server" Text="Load by phone number" OnClick="btnLoad_Click" />
	<br />

	<%--   <asp:Label ID="LabelCheckBox1" runat="server" Text="Include Archived Clients in Dropdown List"></asp:Label>
	<asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
	<br />
	<asp:Label ID="lblDropDownList1" runat="server" Text="Client"></asp:Label>
	<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>--%>


	<br />

	<asp:Panel ID="panel" runat="server" Visible="true">
		 
		<obout:SuperForm ID="superS" runat="server" AutoGenerateEditButton="true"
			AutoGenerateRows="false" DataSourceID="sql_vwGridPerson">

			<ClientSideEvents OnEditing="setupS" />

			<Fields>
				<obout:BoundField DataField="FirstName" HeaderText="FirstName"></obout:BoundField>
				<obout:BoundField DataField="LastName" HeaderText="LastName"></obout:BoundField>
				<obout:BoundField DataField="NickName" HeaderText="NickName"></obout:BoundField>
				<obout:BoundField DataField="MiddleName" HeaderText="MiddleName"></obout:BoundField>
				<obout:BoundField DataField="Affiliation" HeaderText="Affiliation"></obout:BoundField>
				<obout:BoundField DataField="Sex" HeaderText="Sex"></obout:BoundField>
				<obout:BoundField DataField="DOB" HeaderText="DOB"></obout:BoundField>
				<obout:BoundField DataField="raceID" HeaderText="race"></obout:BoundField>
				<obout:BoundField DataField="ethnID" HeaderText="Group"></obout:BoundField>
				<obout:BoundField DataField="MainContact" HeaderText="MainContact"></obout:BoundField>
				<obout:BoundField DataField="notes" HeaderText="notes"></obout:BoundField>
				<obout:BoundField DataField="IsDeceased" HeaderText="IsDeceased"></obout:BoundField>
				<obout:BoundField DataField="DoNotContact" HeaderText="DoNotContact"></obout:BoundField>

				<%--			<obout:TemplateField HeaderText="Status">

				<ItemTemplate>
					<%# Eval("subjstatus") %>
				</ItemTemplate>

				<EditItemTemplate>
					<obout:OboutDropDownList runat="server" ID="ddl_subjstatusID"   
						DataValueField="subjstatusID" DataTextField="subjstatus" 
						SelectedValue='<%# Eval("subjstatusID") %>' />
					</obout:OboutDropDownList>
				</EditItemTemplate>

			</obout:TemplateField>--%>

				<%--			<obout:BoundField DataField="subjstatus" HeaderText="Status" AllowEdit="true"></obout:BoundField>
			<obout:BoundField DataField="subjstatusdetail" HeaderText="Status Detail" AllowEdit="true"></obout:BoundField>
			<obout:BoundField DataField="notes" HeaderText="Notes" AllowEdit="true"></obout:BoundField>--%>
			</Fields>

		</obout:SuperForm>




		<asp:Label ID="lblContacts" runat="server" Text="Contacts by this family" Font-Bold="true" Font-Size="Medium"></asp:Label>

		<obout:Grid ID="gridContacts" runat="server" AllowPageSizeSelection="false" 
			AllowAddingRecords="true" AutoGenerateColumns="false" DataSourceID="sql_vwGridContacts"
			OnUpdateCommand="gridContacts_UpdateCommand" OnInsertCommand="gridContacts_InsertCommand">
			<Columns>
				<obout:Column AllowEdit="true"></obout:Column>
				<obout:Column DataField="FirstName" HeaderText="FirstName" ReadOnly="true"></obout:Column>
				<obout:Column DataField="LastName" HeaderText="LastName"  ReadOnly="true"></obout:Column>
				<obout:Column DataField="contactmethod" HeaderText="Contact Method"></obout:Column>
				<obout:Column DataField="contactReason" HeaderText="Contact Reason"></obout:Column>
				<obout:Column DataField="contactInfoGiven" HeaderText="Info Given"></obout:Column>
				<obout:Column DataField="followUpRequired" HeaderText="Follow-Up Required"></obout:Column>
				<obout:Column DataField="followUpDateDue" HeaderText="Follow-Up Date"></obout:Column>
				<obout:Column DataField="followUpStaffID" HeaderText="Follow-Up Staff"></obout:Column>
				<obout:Column DataField="contactID" HeaderText="Follow-Up Staff" Visible="false" ></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblClientInfo" runat="server" Text="Client Info" Font-Bold="true" Font-Size="Medium"></asp:Label>

		<obout:Grid ID="gridClientInfo" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridClient">
			<Columns>
				<obout:CheckBoxSelectColumn></obout:CheckBoxSelectColumn>
				<obout:Column DataField="insurance1" HeaderText="Insurance1"></obout:Column>
				<obout:Column DataField="insurance2" HeaderText="Insurance2"></obout:Column>
				<obout:Column DataField="pcp" HeaderText="PCP"></obout:Column>
				<obout:Column DataField="pcp_affiliation" HeaderText="PCPAffiliation"></obout:Column>
				<obout:Column DataField="school_district" HeaderText="SchoolDistrict"></obout:Column>
				<obout:Column DataField="intake_staffID" HeaderText="IntakeStaffID"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblFamilyMembers" runat="server" Text="Family Members" Font-Bold="true" Font-Size="Medium"></asp:Label>

		<obout:Grid ID="gridFamily" runat="server" AllowPageSizeSelection="false" 
			AllowAddingRecords="false" AutoGenerateColumns="false"
			CancelSelectOnNullParameter="false" DataSourceID="sql_vwGridFamily">
			<Columns>
				<obout:Column DataField="famRoleID -> enum" HeaderText="Role" ></obout:Column>
				<obout:Column DataField="FirstName" HeaderText="FirstName"></obout:Column>
				<obout:Column DataField="LastName" HeaderText="LastName"></obout:Column>
				<obout:Column DataField="Sex" HeaderText="Sex"></obout:Column>
				<obout:Column DataField="Notes" HeaderText="Notes"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblFamilyAttributes" runat="server" Text="Family Attributes" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridFamAttr" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridFamilyAttributes">
			<Columns>
				<obout:Column DataField="Attribute" HeaderText="Attribute"></obout:Column>
				<obout:Column DataField="IsSerious" HeaderText="IsSerious"></obout:Column>
				<obout:Column DataField="Value" HeaderText="Value"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblAddresses" runat="server" Text="Address(es)" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridAddress" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridAddresses">
			<Columns>
				<obout:Column DataField="Address1" HeaderText="Address1"></obout:Column>
				<obout:Column DataField="Address2" HeaderText="Address2"></obout:Column>
				<obout:Column DataField="City" HeaderText="City"></obout:Column>
				<obout:Column DataField="StateID -> enum" HeaderText="State"></obout:Column>
				<obout:Column DataField="RegionID -> enum" HeaderText="Region"></obout:Column>
				<obout:Column DataField="Zip -> enum" HeaderText="State"></obout:Column>
				<obout:Column DataField="Notes" HeaderText="notes"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblPhone" runat="server" Text="Phone Numbers" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridPhone" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridPhone">
			<Columns>
				<obout:CheckBoxSelectColumn></obout:CheckBoxSelectColumn>
				<obout:Column DataField="PhoneNum" HeaderText="PhoneNum"></obout:Column>
				<obout:Column DataField="PhoneType" HeaderText="PhoneType"></obout:Column>
				<obout:Column DataField="PhoneNotes" HeaderText="PhoneNotes"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblEmail" runat="server" Text="Emails" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridEmail" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridEmail">
			<Columns>
				<obout:CheckBoxSelectColumn></obout:CheckBoxSelectColumn>
				<obout:Column DataField="Email" HeaderText="Email"></obout:Column>
				<obout:Column DataField="EmailType" HeaderText="EmailType"></obout:Column>
				<obout:Column DataField="EmailNotes" HeaderText="EmailNotes"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblClientDiagnosis" runat="server" Text="Diagnoses" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridDiagnosis" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridDiagnosis">
			<Columns>
				<obout:CheckBoxSelectColumn></obout:CheckBoxSelectColumn>
				<obout:Column DataField="diag" HeaderText="Diagnosis"></obout:Column>
				<obout:Column DataField="diagBy" HeaderText="DiagnosedBy"></obout:Column>
				<obout:Column DataField="diagPosition" HeaderText="DiagnoserPosition"></obout:Column>
				<obout:Column DataField="referralSource" HeaderText="ReferralSource"></obout:Column>
				<obout:Column DataField="referralPosition" HeaderText="ReferralPosition"></obout:Column>
				<obout:Column DataField="notes" HeaderText="Notes"></obout:Column>

			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblClientEvents" runat="server" Text="Events" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridEvents" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridClientEvents">
			<Columns>
				<obout:CheckBoxSelectColumn></obout:CheckBoxSelectColumn>
				<obout:Column DataField="event" HeaderText="Event"></obout:Column>
				<obout:Column DataField="eventBeginDate" HeaderText="Event Begin Date"></obout:Column>
				<obout:Column DataField="eventCompleteDate" HeaderText="Event Complete Date"></obout:Column>
				<obout:Column DataField="eventStatus" HeaderText="Event Status"></obout:Column>
				<obout:Column DataField="eventNotes" HeaderText="EventNotes"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<asp:Label ID="lblServices" runat="server" Text="Services Requested" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<obout:Grid ID="gridServices" runat="server" AllowPageSizeSelection="false"
			AllowAddingRecords="false" AutoGenerateColumns="false" DataSourceID="sql_vwGridServices">
			<Columns>
				<obout:CheckBoxSelectColumn></obout:CheckBoxSelectColumn>
				<obout:Column DataField="UWACSite" HeaderText="UWAC Site"></obout:Column>
				<obout:Column DataField="ServiceType" HeaderText="Service Type"></obout:Column>
				<obout:Column DataField="ServReq_Status" HeaderText="Service Status"></obout:Column>
				<obout:Column DataField="internal" HeaderText="Internal"></obout:Column>
				<obout:Column DataField="onHold" HeaderText="OnHold"></obout:Column>
			</Columns>
		</obout:Grid>
		<br />

		<%-- 
	<asp:Label ID="Label2" runat="server" Text="Measures" Font-Bold="true" Font-Size="Medium"></asp:Label>

		<obout:OboutButton runat="server" Text="Excel" OnClientClick="exportToExcel();return false;" />
		--%>
		<%--	<obout:Grid ID="gridM" runat="server" AllowPageSizeSelection="false"  AllowAddingRecords="false"  AutoGenerateColumns="false" 
		 AllowRecordSelection="false" CallbackMode="true" Serialize="true" OnRebind="gridM_Rebind" ViewStateMode="Enabled" HideColumnsWhenGrouping="true" 
		AllowGrouping="true" GroupBy="timepoint_text" ShowGroupsInfo="true"    
		 OnUpdateCommand="gridM_UpdateCommand" ShowLoadingMessage="true" PageSize="100" AllowFiltering="true"  >
		<TemplateSettings RowEditTemplateId="tpl_M_rowedit"   /> 
		<ExportingSettings FileName="TrackingMeasures" AppendTimeStamp="true"  />
		<ClientSideEvents   OnClientPopulateControls="setupM_step1" />
		<FilteringSettings FilterLinksPosition="Top" FilterPosition="Top" MatchingType="AllFilters" />

		<Columns>
			<obout:CheckBoxSelectColumn Width="40px"></obout:CheckBoxSelectColumn>
			<obout:Column AllowEdit="true" Width="120px"></obout:Column>
			<obout:Column DataField="timepoint_text" HeaderText="TP" Width="60px"></obout:Column>
			<obout:Column DataField="studymeassubjID" Visible="false" ReadOnly="true" HeaderText="smsID" runat="server">
				<TemplateSettings RowEditTemplateControlId="txt_M_studymeassubjID" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="studymeasname" ></obout:Column>
			<obout:Column DataField="measstatusID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_measstatusID" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="measstatusdetailID" Visible="false">
				<TemplateSettings RowEditTemplateControlId="ddl_measstatusdetailID" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="measstatus"   HeaderText="Status" ></obout:Column>
			<obout:Column DataField="measstatusdetail" HeaderText="Status Detail"></obout:Column>
			<obout:Column DataField="date" HeaderText="Date" DataFormatString="{0:d}"  >
				<TemplateSettings RowEditTemplateControlId="txt_M_datedone" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
			<obout:Column DataField="clinician"   HeaderText="Clin" Visible="false" >
				<TemplateSettings RowEditTemplateControlId="ddl_clinician" RowEditTemplateControlPropertyName="value"  />
			</obout:Column>
			<obout:Column DataField="clinname"   HeaderText="Clin" ></obout:Column>
			<obout:Column DataField="notes" HeaderText="Notes"   >
				<TemplateSettings RowEditTemplateControlId="txt_M_notes" RowEditTemplateControlPropertyName="value" />
			</obout:Column>
		</Columns>


		<Templates>
			<obout:GridTemplate ID="tpl_M_rowedit" runat="server" >
				<Template>
				
							<table>
								<tr>
									<td></td>
									<td style="vertical-align:top">Status:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_measstatusID" DataSourceID="sql_MeasStatus" 
											DataValueField="measstatusID" DataTextField="measstatus">
											<ClientSideEvents OnSelectedIndexChanged="setupM_changed_measstatusID" />
										</obout:OboutDropDownList>
										</td>
									<td style="vertical-align:top">Status Detail:<br />	
										<obout:OboutDropDownList runat="server" ID="ddl_measstatusdetailID"  
											DataValueField="measstatusdetailID" DataTextField="measstatusdetail" />
									</td>
									<td style="vertical-align:top">Date Completed:<br />
										<asp:TextBox runat="server" ID="txt_M_datedone" Width="90px"   FormatString="{0:d}" ></asp:TextBox>
										<obout:Calendar ID="cal_M_datedone" runat="server" DatePickerImagePath="~/App_Obout/Calendar/styles/icon2.gif" 
																 DatePickerMode="true"
																 TextBoxId="txt_M_datedone" 
																 DatePickerSynchronize="true" DateFormat="MM/dd/yyyy" SelectedDate='<%#  DataBinder.Eval(Container.DataItem, "[date]") %>' >
										</obout:Calendar>    
										<obout:OboutTextBox runat="server" ID="txt_M_studymeassubjID" Visible="false"></obout:OboutTextBox>

										</td>
									<td style="vertical-align:top">Completed by:<br />
										<obout:OboutDropDownList runat="server" ID="ddl_clinician"  DataSourceID="sql_Staff"
											DataValueField="staffID" DataTextField="staffname" ></obout:OboutDropDownList>

									</td>
								</tr>
								<tr>
									<td></td>
										<td colspan="4" style="vertical-align:top">Notes:<br />
										<asp:TextBox runat="server" ID="txt_M_notes" Width="500px"   ></asp:TextBox>

										</td>
									</td>
								</tr>
							</table>

				</Template>
			</obout:GridTemplate>
		</Templates>
	</obout:Grid>
		--%>

		  </asp:Panel>
	  
		<br />
		<br />

		<asp:Label ID="lblInfo" runat="server"></asp:Label>

		<br />
		<br />

		<asp:SqlDataSource ID="sql_vwDDLPeople" runat="server"
			SelectCommandType="Text"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select Name, personID from ac.vwDDLPeople"
			UpdateCommand="select Name, personID from ac.vwDDLPeople">
			
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridPerson" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getSuperformPerson"
			UpdateCommand="ac.sp_getSuperformPerson">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridFamily" runat="server"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommandType="StoredProcedure"
			SelectCommand="ac.sp_getGridFamilyForPersonId"
						UpdateCommand="ac.sp_getGridFamilyForPersonId">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridFamilyAttributes" runat="server"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommandType="StoredProcedure"
			SelectCommand="ac.sp_getGridFamAttributes"
						UpdateCommand="ac.sp_getGridFamAttributes">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridAddresses" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridFamAddresses"
						UpdateCommand="ac.sp_getGridFamAddresses">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridPhone" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridFamPhone" 
					  UpdateCommand="ac.sp_getGridFamPhone">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridEmail" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridFamEmail"
						UpdateCommand="ac.sp_getGridFamEmail">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridClient" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridClientInfo"
						UpdateCommand="ac.sp_getGridClientInfo">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridDiagnosis" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridClientDiagnoses"
						UpdateCommand="ac.sp_getGridClientDiagnoses">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridClientEvents" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridClientEvents"
						UpdateCommand="ac.sp_getGridClientEvents">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridServices" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridClientServices"
						UpdateCommand="ac.sp_getGridClientServices">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_vwGridContacts" runat="server"
			SelectCommandType="StoredProcedure"
			ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="ac.sp_getGridFamContacts"
						UpdateCommand="ac.sp_getGridFamContacts">
			<SelectParameters>
				<asp:ControlParameter
					Name="personID"
					ControlID="DropDownList1"
					PropertyName="SelectedValue" />
			</SelectParameters>
		</asp:SqlDataSource>
  
</asp:Content>
