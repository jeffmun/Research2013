
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.IntHx.IntHx" CodeFile="IntHx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

	<script language="javascript">

function Save_OnClick ()
{

	return SaveGrid();

}


function LoadGrid()
{
	//load grid if form is single or double entered
	if (mainForm._formstate.value == "SINGLE_ENTERED" || 
		mainForm._formstate.value == "DOUBLE_ENTERED" 
		 || mainForm._formstate.value == "ENTERING" )
	{
		//mainForm.inthxgrid1.StartYear = mainForm.hxyear_fieldTextBox.value;
		mainForm.inthxgrid1.StartYear = 1995;
		mainForm.inthxgrid1.ID = mainForm.ID_fieldTextBox.value;
		mainForm.inthxgrid1.StudyMeasID = mainForm.studymeasid_fieldTextBox.value;
		mainForm.inthxgrid1.YearCount = 17;
		
		mainForm.inthxgrid1.SetupGrid();
	
	}
	
	//set focus off grid (fixes a bug that prevents copy/paste from
	//working until focus id removed from grid
	if (mainForm._formstate.value == "INSERTING")
		mainForm.ID_fieldTextBox.focus();
	else
		mainForm.hxyear_fieldTextBox.focus();
		
}


function SaveGrid()
{
	return mainForm.inthxgrid1.SaveGrid();
}

	</script>
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupColumnHeaders="Measure,ID,Indexnum,Interview Date"
							LookupColumns="studymeasname,id,indexnum,hxdate{0:d}" DatabaseTable="all_inthx" LookupField1="id" LookupTextBox2Visible="False"
							LookupTextBox1LabelText="Subject ID:" MeasureName="Intervention History" PrimaryKeyField="inthx_pk" VerifiedField="verified"
							LookupField1DataType="TEXT" SaveOnClick="Save_OnClick()"
							AllowedStudyMeasures="210,330,603,619,620,1916"
							></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="80px" DatabaseField="ID"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol>
									<br>
									<def:datafieldcontrol id="indexnum" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="40px" DatabaseField="indexnum"
										FieldTextBoxTabIndex="4" FieldLabelText="Indexnum" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol>
									<br>
									<def:datafieldcontrol id="hxyear" runat="server" FieldTextBoxWidth="80px" DatabaseField="hxyear" FieldTextBoxTabIndex="5"
										FieldLabelText="Calendar Year (eg. 2005)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT" MinVal="1997"
										MaxVal="2010" FieldLabelWidth="150px"></def:datafieldcontrol>
								</td>
								<td><def:datafieldcontrol id="hxdate" runat="server" FieldTextBoxWidth="80px" DatabaseField="hxdate" FieldTextBoxTabIndex="6"
										FieldLabelText="Interview Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"
										FieldLabelWidth="150px"></def:datafieldcontrol>
									<br>
									<def:datafieldcontrol id="hxinf" runat="server" FieldTextBoxWidth="40px" DatabaseField="hxinf" FieldTextBoxTabIndex="7"
										FieldLabelText="Informant (1=Mother, 2=Father, 3=Caregiver, 9=Missing)" IsDoubleEntryField="True"
										IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="INT" ValidList="1,2,3,9" FieldLabelWidth="150px"></def:datafieldcontrol>
									<br>
									<def:datafieldcontrol id="hxintvr" runat="server" FieldTextBoxWidth="80px" DatabaseField="hxintvr" FieldTextBoxTabIndex="8"
										FieldLabelText="Interviewer" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="150px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<BR>
						<TABLE class="grid">
							<TR>
								<TD>
									Hints:<br>
									1. You must make a one-time adjustment to an Internet Explorer security setting 
									for this page to work. <A href="IntHx_setup.htm" target="_blank">Click here for 
										instructions.</A><BR>
									<br>
									2. After editing in the grid you MUST click the save button before clicking on 
									any other links or your edits will be lost.<BR>
									<BR>
									3. You can click and drag to selected existing values then use CTRL+C to copy. 
									Use CTRL+V to paste after selecting the desired location.
								</TD>
							</TR>
						</TABLE>
						<BR>
						<asp:panel id="mainPanel" Runat="server">
							<asp:Literal id="litPrograms" runat="server" EnableViewState="False"></asp:Literal>
							<%--
							<OBJECT id="inthxgrid1" height="500" width="100%" classid="IntHxControl.dll#InterventionHistoryControl.IntHxControl"
								VIEWASTEXT>
							</OBJECT>
							--%>
							<script src="docwrite.js"></script>
							
							<BR>
							<def:datafieldcontrol id="hxcmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
								FieldTextBoxTabIndex="9" DatabaseField="hxcmt" FieldTextBoxWidth="350px" FieldLabelWidth="100px" FieldTextBoxHeight="150px"
								FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="11" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="12" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="13" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="14" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="studymeasid" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="studymeasid"
											FieldTextBoxTabIndex="3" DatabaseField="studymeasid" ShowFieldLabel="False" FieldTextBoxCssClass="hideme"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
