<%@ Page language="c#" Inherits="edst3_adi.edst3_adi" CodeFile="edst3_adi.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<ui:header id="uiHeader" runat="server" selectedmenu="dataentryform"></ui:header>
	<body onload="edst3_adi_onLoad()">
		<div class="divHeader" id="divHeader">UW Autism Center Intranet</div>
		<table class="tblBody" cellSpacing="0">
			<tr>
				<th id="thLeftNavigation">
					<ui:leftnavigation id="uiLeftNavigation" runat="server" selectedmenu="dataentry"></ui:leftnavigation></th>
				<td>
					<form id="Form1" method="post" runat="server">
--%>					
					
<script language="javascript">

/*
 * onLoad event handler
 *
 */
function edst3_adi_onLoad()
{
	// if in ENTERING state, set any age dependent fields
	if (document.getElementById("_formstate").value == "ENTERING")
	{
		// get age in months
		var age = parseInt(getFieldValue("Adagemos"));
		if (!isNaN(age))
		{
			if (age >= 48) setFieldValueIfBlank("AD042cu", "8");
			
			if (age >=120)
			{
				setFieldValueIfBlank("AD029cu", "8");
				setFieldValueIfBlank("AD031cu", "8");
				setFieldValueIfBlank("AD063cu", "8");
				setFieldValueIfBlank("AD064cu", "8");
				setFieldValueIfBlank("AD065cu", "8");
				setFieldValueIfBlank("AD066cu", "8");
				setFieldValueIfBlank("AD067cu", "8");
				setFieldValueIfBlank("AD068cu", "8");
			}
		
			if (age < 120) setFieldValueIfBlank("AD069mo", "8");

		}
	}

}




/*
 * OnBlur event handler for special edst3_adi.aspx fields
 *
 */
function edst3_adi_onBlur(sFieldID)
{
	unselectField();
			

	switch (sFieldID) {
	
		case "AD019":
			if (getFieldValue(sFieldID) == 1 || getFieldValue(sFieldID) == 2)
			{
				setFieldValueIfBlank("AD020cu", "8");
				setFieldValueIfBlank("AD020mo", "8");
				setFieldValueIfBlank("AD022cu", "8");
				setFieldValueIfBlank("AD022ev", "8");
				setFieldValueIfBlank("AD023cu", "8");
				setFieldValueIfBlank("AD023ev", "8");
				setFieldValueIfBlank("AD024cu", "8");
				setFieldValueIfBlank("AD024ev", "8");
				setFieldValueIfBlank("AD025cu", "8");
				setFieldValueIfBlank("AD025ev", "8");
			}
			break;

	}
}

					</script>

						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="INT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="adi_pk" MeasureName="EDS T3 ADI-R Short Form" LookupTextBox1LabelText="EDS ID:"
							LookupTextBox2Visible="False" LookupField1="edsid" DatabaseTable="edst3_adi" StudyMeasID="101" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<A id="showreportlink" href="javascript:showADIReport('edsid_fieldTextBox', 'EDST3ADI.aspx');">
							Click to View Scoring Summary</A><br>
						<br>
						<table class="layout">
							<tr>
								<td width="318">
									<table class="tblinsert" id="table_insert">
										<tr>
											<td><def:datafieldcontrol id="edsid" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="True"
													IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False"
													IsDoubleEntryField="False" FieldLabelText="EDS ID" FieldTextBoxTabIndex="6" DatabaseField="edsid"
													FieldLabelWidth="200px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Adsex" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="True"
													IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False"
													IsDoubleEntryField="False" FieldLabelText="Sex (0=male, 1=female)" FieldTextBoxTabIndex="7" DatabaseField="Adsex"
													ValidList="0,1" FieldLabelWidth="200px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Addate" runat="server" FieldTextBoxWidth="75px" FieldDataType="DATE" IsInsertField="True"
													IsInsertValueRequired="True" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Date of interview (mm/dd/yy):" FieldTextBoxTabIndex="9" DatabaseField="Addate" FormatString="{0:d}"
													FieldLabelWidth="200px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Adint" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="True"
													IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False"
													IsDoubleEntryField="False" FieldLabelText="Interviewer initials" FieldTextBoxTabIndex="18" DatabaseField="Adint"
													FieldLabelWidth="200px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Adinf" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="True"
													IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False"
													IsDoubleEntryField="False" FieldLabelText="Informant (0=mom, 1=dad, 2=other caregiver, 3=combination)"
													FieldTextBoxTabIndex="19" DatabaseField="Adinf" ValidList="0,1,2,3" FieldLabelWidth="200px"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="AdDOB" runat="server" FieldTextBoxWidth="75px" FieldDataType="DATE" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="Subject's DOB:" FieldTextBoxTabIndex="10" DatabaseField="AdDOB"
													FormatString="{0:d}" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Adagemos1" runat="server" FieldTextBoxWidth="75px" FieldDataType="TEXT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="Age (months):" FieldTextBoxTabIndex="10" DatabaseField="Adagemos"
													FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Adageym" runat="server" FieldTextBoxWidth="75px" FieldDataType="TEXT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="Age (y-m):" FieldTextBoxTabIndex="10" DatabaseField="Adageym"
													FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<def:datafieldcontrol id="Adagemos" runat="server" FieldTextBoxWidth="75px" FieldDataType="TEXT" IsInsertField="False"
							IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
							IsDoubleEntryField="False" FieldLabelText="Age (months):" FieldTextBoxTabIndex="10" DatabaseField="Adagemos"
							FieldLabelWidth="100px" RenderReadOnlyAsDiv="False" ShowFieldLabel="False" FieldTextBoxCssClass="hideme"></def:datafieldcontrol><br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout" id="table_entry">
											<TR>
												<TD>
													<def:datafieldcontrol id="AD002" runat="server" DatabaseField="AD002" FieldTextBoxTabIndex="20" FieldLabelText="2. Age noticed concern (months)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD003" runat="server" DatabaseField="AD003" FieldTextBoxTabIndex="21" FieldLabelText="3. First symptoms"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD004" runat="server" DatabaseField="AD004" FieldTextBoxTabIndex="22" FieldLabelText="4. Age parents first sought advice (months)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD005" runat="server" DatabaseField="AD005" FieldTextBoxTabIndex="23" FieldLabelText="5. Onset in hindsight"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD011cu" runat="server" DatabaseField="AD011cu" FieldTextBoxTabIndex="24" FieldLabelText="11. Use of other's body to communicate (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD011ev" runat="server" DatabaseField="AD011ev" FieldTextBoxTabIndex="25" FieldLabelText="11. Use of other's body to communicate (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD012" runat="server" DatabaseField="AD012" FieldTextBoxTabIndex="26" FieldLabelText="12. Age of first single words (months)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD013" runat="server" DatabaseField="AD013" FieldTextBoxTabIndex="27" FieldLabelText="13. Age of first phrases (months)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD016cu" runat="server" DatabaseField="AD016cu" FieldTextBoxTabIndex="28" FieldLabelText="16. Social vocalization / chat (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD016mo" runat="server" DatabaseField="AD016mo" FieldTextBoxTabIndex="29" FieldLabelText="16. Social vocalization / chat (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD018cu" runat="server" DatabaseField="AD018cu" FieldTextBoxTabIndex="30" FieldLabelText="18. Stereotyped utterances (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD018ev" runat="server" DatabaseField="AD018ev" FieldTextBoxTabIndex="31" FieldLabelText="18. Stereotyped utterances (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD019" runat="server" DatabaseField="AD019" FieldTextBoxTabIndex="32" FieldLabelText="19. Overall language"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2" CallOnBlur="edst3_adi_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD020cu" runat="server" DatabaseField="AD020cu" FieldTextBoxTabIndex="33" FieldLabelText="20. Reciprocal conversation (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD020mo" runat="server" DatabaseField="AD020mo" FieldTextBoxTabIndex="34" FieldLabelText="20. Reciprocal conversation (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD022cu" runat="server" DatabaseField="AD022cu" FieldTextBoxTabIndex="35" FieldLabelText="22. Inappropriate questions (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD022ev" runat="server" DatabaseField="AD022ev" FieldTextBoxTabIndex="36" FieldLabelText="22. Inappropriate questions (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD023cu" runat="server" DatabaseField="AD023cu" FieldTextBoxTabIndex="37" FieldLabelText="23. Pronomial reversal (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD023ev" runat="server" DatabaseField="AD023ev" FieldTextBoxTabIndex="38" FieldLabelText="23. Pronomial reversal (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD024cu" runat="server" DatabaseField="AD024cu" FieldTextBoxTabIndex="39" FieldLabelText="24. Neologisms/Idiosyncratic language (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD024ev" runat="server" DatabaseField="AD024ev" FieldTextBoxTabIndex="40" FieldLabelText="24. Neologisms/Idiosyncratic language (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD025cu" runat="server" DatabaseField="AD025cu" FieldTextBoxTabIndex="41" FieldLabelText="25. Verbal rituals (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD025ev" runat="server" DatabaseField="AD025ev" FieldTextBoxTabIndex="42" FieldLabelText="25. Verbal rituals (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD029cu" runat="server" DatabaseField="AD029cu" FieldTextBoxTabIndex="43" FieldLabelText="29. Spontaneous imitation of actions (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD029mo" runat="server" DatabaseField="AD029mo" FieldTextBoxTabIndex="44" FieldLabelText="29. Spontaneous imitation of actions (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD><BR>
													<BR>
													<FONT color="blue">For items 30-Current
														<BR>
														and 30-Most Abnormal 4-5<BR>
														use code 8 instead of 3</FONT><BR>
													<def:datafieldcontrol id="AD030cu" runat="server" DatabaseField="AD030cu" FieldTextBoxTabIndex="45" FieldLabelText="30. Pointing to express interest (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD030mo" runat="server" DatabaseField="AD030mo" FieldTextBoxTabIndex="46" FieldLabelText="30. Pointing to express interest (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD031cu" runat="server" DatabaseField="AD031cu" FieldTextBoxTabIndex="47" FieldLabelText="31. Conventional instrumental gestures (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD031mo" runat="server" DatabaseField="AD031mo" FieldTextBoxTabIndex="48" FieldLabelText="31. Conventional instrumental gestures (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD032cu" runat="server" DatabaseField="AD032cu" FieldTextBoxTabIndex="49" FieldLabelText="32. Nodding (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD032mo" runat="server" DatabaseField="AD032mo" FieldTextBoxTabIndex="50" FieldLabelText="32. Nodding (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD033cu" runat="server" DatabaseField="AD033cu" FieldTextBoxTabIndex="51" FieldLabelText="33. Head shaking (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD033mo" runat="server" DatabaseField="AD033mo" FieldTextBoxTabIndex="52" FieldLabelText="33. Head shaking (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD037" runat="server" DatabaseField="AD037" FieldTextBoxTabIndex="53" FieldLabelText="37. Level of language before loss"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD038" runat="server" DatabaseField="AD038" FieldTextBoxTabIndex="54" FieldLabelText="38. Spontaneous, meaningful speech"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD039" runat="server" DatabaseField="AD039" FieldTextBoxTabIndex="55" FieldLabelText="39. Words used spont. w/out intent"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD040" runat="server" DatabaseField="AD040" FieldTextBoxTabIndex="56" FieldLabelText="40. Simple syntax"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD041" runat="server" DatabaseField="AD041" FieldTextBoxTabIndex="57" FieldLabelText="41. Articulation"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD042cu" runat="server" DatabaseField="AD042cu" FieldTextBoxTabIndex="58" FieldLabelText="42. Direct gaze (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD042mo" runat="server" DatabaseField="AD042mo" FieldTextBoxTabIndex="59" FieldLabelText="42. Direct gaze (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD043cu" runat="server" DatabaseField="AD043cu" FieldTextBoxTabIndex="60" FieldLabelText="43. Social smiling (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD043mo" runat="server" DatabaseField="AD043mo" FieldTextBoxTabIndex="61" FieldLabelText="43. Social smiling (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD045cu" runat="server" DatabaseField="AD045cu" FieldTextBoxTabIndex="62" FieldLabelText="45. Showing and directing attention (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD045mo" runat="server" DatabaseField="AD045mo" FieldTextBoxTabIndex="63" FieldLabelText="45. Showing and directing attention (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD046cu" runat="server" DatabaseField="AD046cu" FieldTextBoxTabIndex="64" FieldLabelText="46. Offering to share (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD046mo" runat="server" DatabaseField="AD046mo" FieldTextBoxTabIndex="65" FieldLabelText="46. Offering to share (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD047cu" runat="server" DatabaseField="AD047cu" FieldTextBoxTabIndex="66" FieldLabelText="47. Seeking to share own enjoy w/ others (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD047mo" runat="server" DatabaseField="AD047mo" FieldTextBoxTabIndex="67" FieldLabelText="47. Seeking to share own enjoy w/ others (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD049cu" runat="server" DatabaseField="AD049cu" FieldTextBoxTabIndex="68" FieldLabelText="49. Offers comfort (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD049mo" runat="server" DatabaseField="AD049mo" FieldTextBoxTabIndex="69" FieldLabelText="49. Offers comfort (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD051cu" runat="server" DatabaseField="AD051cu" FieldTextBoxTabIndex="70" FieldLabelText="51. Quality of social overtures (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD051mo" runat="server" DatabaseField="AD051mo" FieldTextBoxTabIndex="71" FieldLabelText="51. Quality of social overtures (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD052cu" runat="server" DatabaseField="AD052cu" FieldTextBoxTabIndex="72" FieldLabelText="52. Range of facial expr used to commun. (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD052mo" runat="server" DatabaseField="AD052mo" FieldTextBoxTabIndex="73" FieldLabelText="52. Range of facial expr used to commun. (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD053cu" runat="server" DatabaseField="AD053cu" FieldTextBoxTabIndex="74" FieldLabelText="53. Inappropriate facial expression (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD053ev" runat="server" DatabaseField="AD053ev" FieldTextBoxTabIndex="75" FieldLabelText="53. Inappropriate facial expression (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD057cu" runat="server" DatabaseField="AD057cu" FieldTextBoxTabIndex="76" FieldLabelText="57. Appropriateness of social responses (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD057mo" runat="server" DatabaseField="AD057mo" FieldTextBoxTabIndex="77" FieldLabelText="57. Appropriateness of social responses (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD063cu" runat="server" DatabaseField="AD063cu" FieldTextBoxTabIndex="78" FieldLabelText="63. Imaginative play (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD063mo" runat="server" DatabaseField="AD063mo" FieldTextBoxTabIndex="79" FieldLabelText="63. Imaginative play (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD064cu" runat="server" DatabaseField="AD064cu" FieldTextBoxTabIndex="80" FieldLabelText="64. Imaginative play with peers (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD064mo" runat="server" DatabaseField="AD064mo" FieldTextBoxTabIndex="81" FieldLabelText="64. Imaginative play with peers (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD065cu" runat="server" DatabaseField="AD065cu" FieldTextBoxTabIndex="82" FieldLabelText="65. Imitative social play (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD065mo" runat="server" DatabaseField="AD065mo" FieldTextBoxTabIndex="83" FieldLabelText="65. Imitative social play (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD066cu" runat="server" DatabaseField="AD066cu" FieldTextBoxTabIndex="84" FieldLabelText="66. Interest in children (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD066mo" runat="server" DatabaseField="AD066mo" FieldTextBoxTabIndex="85" FieldLabelText="66. Interest in children (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD067cu" runat="server" DatabaseField="AD067cu" FieldTextBoxTabIndex="86" FieldLabelText="67. Resp to other child's approaches (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD067mo" runat="server" DatabaseField="AD067mo" FieldTextBoxTabIndex="87" FieldLabelText="67. Resp to other child's approaches (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068cu" runat="server" DatabaseField="AD068cu" FieldTextBoxTabIndex="88" FieldLabelText="68. Group play with peers (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068mo" runat="server" DatabaseField="AD068mo" FieldTextBoxTabIndex="89" FieldLabelText="68. Group play with peers (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD069cu" runat="server" DatabaseField="AD069cu" FieldTextBoxTabIndex="90" FieldLabelText="69. Friendships (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD069mo" runat="server" DatabaseField="AD069mo" FieldTextBoxTabIndex="91" FieldLabelText="69. Friendships (most abn)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD070cu" runat="server" DatabaseField="AD070cu" FieldTextBoxTabIndex="92" FieldLabelText="70. Circumscribed interests (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD070ev" runat="server" DatabaseField="AD070ev" FieldTextBoxTabIndex="93" FieldLabelText="70. Circumscribed interests (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD071cu" runat="server" DatabaseField="AD071cu" FieldTextBoxTabIndex="94" FieldLabelText="71. Unusual preoccupations (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD071ev" runat="server" DatabaseField="AD071ev" FieldTextBoxTabIndex="95" FieldLabelText="71. Unusual preoccupations (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD072cu" runat="server" DatabaseField="AD072cu" FieldTextBoxTabIndex="96" FieldLabelText="72. Repetitive use of objects (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD072ev" runat="server" DatabaseField="AD072ev" FieldTextBoxTabIndex="97" FieldLabelText="72. Repetitive use of objects (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD075cu" runat="server" DatabaseField="AD075cu" FieldTextBoxTabIndex="98" FieldLabelText="75. Compulsions/Rituals (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD075ev" runat="server" DatabaseField="AD075ev" FieldTextBoxTabIndex="99" FieldLabelText="75. Compulsions/Rituals (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD077cu" runat="server" DatabaseField="AD077cu" FieldTextBoxTabIndex="100" FieldLabelText="77. Unusual sensory interests (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD077ev" runat="server" DatabaseField="AD077ev" FieldTextBoxTabIndex="101" FieldLabelText="77. Unusual sensory interests (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD081cu" runat="server" DatabaseField="AD081cu" FieldTextBoxTabIndex="102" FieldLabelText="81. Hand and finger mannerisms (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD081ev" runat="server" DatabaseField="AD081ev" FieldTextBoxTabIndex="103" FieldLabelText="81. Hand and finger mannerisms (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD084cu" runat="server" DatabaseField="AD084cu" FieldTextBoxTabIndex="104" FieldLabelText="84. Other complex mannerisms (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD084ev" runat="server" DatabaseField="AD084ev" FieldTextBoxTabIndex="105" FieldLabelText="84. Other complex mannerisms (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093" runat="server" DatabaseField="AD093" FieldTextBoxTabIndex="106" FieldLabelText="93. Age when abnorm. first evident "
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094" runat="server" DatabaseField="AD094" FieldTextBoxTabIndex="107" FieldLabelText="94. Intrvw's judgment on age first evident"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095be" runat="server" DatabaseField="AD095be" FieldTextBoxTabIndex="108" FieldLabelText="95. Loss of skills (at least 3 mos.) (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095af" runat="server" DatabaseField="AD095af" FieldTextBoxTabIndex="109" FieldLabelText="95. Loss of skills (at least 3 mos.) (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096be" runat="server" DatabaseField="AD096be" FieldTextBoxTabIndex="110" FieldLabelText="96. Loss of skills (w/ phys illness) (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096af" runat="server" DatabaseField="AD096af" FieldTextBoxTabIndex="111" FieldLabelText="96. Loss of skills (w/ phys illness) (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097be" runat="server" DatabaseField="AD097be" FieldTextBoxTabIndex="112" FieldLabelText="97. Communication (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097af" runat="server" DatabaseField="AD097af" FieldTextBoxTabIndex="113" FieldLabelText="97. Communication (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098be" runat="server" DatabaseField="AD098be" FieldTextBoxTabIndex="114" FieldLabelText="98. Social interst and responsiveness (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098af" runat="server" DatabaseField="AD098af" FieldTextBoxTabIndex="115" FieldLabelText="98. Social interst and responsiveness (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099be" runat="server" DatabaseField="AD099be" FieldTextBoxTabIndex="116" FieldLabelText="99. Play and imagination (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099af" runat="server" DatabaseField="AD099af" FieldTextBoxTabIndex="117" FieldLabelText="99. Play and imagination (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100be" runat="server" DatabaseField="AD100be" FieldTextBoxTabIndex="118" FieldLabelText="100. Adaptive skills (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100af" runat="server" DatabaseField="AD100af" FieldTextBoxTabIndex="119" FieldLabelText="100. Adaptive skills (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101be" runat="server" DatabaseField="AD101be" FieldTextBoxTabIndex="120" FieldLabelText="101. Pre-, Academic, Vocat. Skills (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101af" runat="server" DatabaseField="AD101af" FieldTextBoxTabIndex="121" FieldLabelText="101. Pre-, Academic, Vocat. Skills (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102be" runat="server" DatabaseField="AD102be" FieldTextBoxTabIndex="122" FieldLabelText="102. Motor skills (before age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102af" runat="server" DatabaseField="AD102af" FieldTextBoxTabIndex="123" FieldLabelText="102. Motor skills (after age 5.0)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD103" runat="server" DatabaseField="AD103" FieldTextBoxTabIndex="124" FieldLabelText="103. Age when loss first apparent"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104" runat="server" DatabaseField="AD104" FieldTextBoxTabIndex="125" FieldLabelText="104. Progressive deterioration"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD105" runat="server" DatabaseField="AD105" FieldTextBoxTabIndex="126" FieldLabelText="105. Duration of deterioration"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106cu" runat="server" DatabaseField="AD106cu" FieldTextBoxTabIndex="127" FieldLabelText="106. Visuospatial ability (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106ev" runat="server" DatabaseField="AD106ev" FieldTextBoxTabIndex="128" FieldLabelText="106. Visuospatial ability (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107cu" runat="server" DatabaseField="AD107cu" FieldTextBoxTabIndex="129" FieldLabelText="107. Memory skill (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107ev" runat="server" DatabaseField="AD107ev" FieldTextBoxTabIndex="130" FieldLabelText="107. Memory skill (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD108cu" runat="server" DatabaseField="AD108cu" FieldTextBoxTabIndex="131" FieldLabelText="108. Musical ability (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD108ev" runat="server" DatabaseField="AD108ev" FieldTextBoxTabIndex="132" FieldLabelText="108. Musical ability (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109cu" runat="server" DatabaseField="AD109cu" FieldTextBoxTabIndex="133" FieldLabelText="109. Drawing skills (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109ev" runat="server" DatabaseField="AD109ev" FieldTextBoxTabIndex="134" FieldLabelText="109. Drawing skills (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD110cu" runat="server" DatabaseField="AD110cu" FieldTextBoxTabIndex="135" FieldLabelText="110. Reading ability (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD110ev" runat="server" DatabaseField="AD110ev" FieldTextBoxTabIndex="136" FieldLabelText="110. Reading ability (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD111cu" runat="server" DatabaseField="AD111cu" FieldTextBoxTabIndex="137" FieldLabelText="111. Computational ability (current)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD111ev" runat="server" DatabaseField="AD111ev" FieldTextBoxTabIndex="138" FieldLabelText="111. Computational ability (ever)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="235"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="236"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="237"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="238"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
</asp:Content>