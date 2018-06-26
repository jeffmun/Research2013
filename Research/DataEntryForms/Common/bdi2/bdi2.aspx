<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.bdi2.bdi2" CodeFile="bdi2.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<ui:header id="uiHeader" selectedmenu="dataentryform" runat="server"></ui:header>
	<body onload="bdi2_onLoad()">
		<div class="divHeader" id="divHeader">UW Autism Center Intranet</div>
		<table class="tblBody" cellSpacing="0">
			<tr>
				<th id="thLeftNavigation">
					<ui:leftnavigation id="uiLeftNavigation" selectedmenu="dataentry" runat="server"></ui:leftnavigation></th>
				<td>
					<form id="Form1" method="post" runat="server">--%>


		<script language="javascript">
/*
 * onLoad event handler
 *
 */
function bdi2_onLoad()
{



	// if in ENTERING state, set any age dependent fields
	if (document.getElementById("_formstate").value == "ENTERING")
	{
		// get age in months
		var age = parseInt(getFieldValue("<%= b2agemo_hidden.ClientID %>"));
		if (!isNaN(age))
		{
		
			if (age <= 23)
			{
				setFieldValueIfBlank("<%= b2prraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2piraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2pmraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2raraw.ClientID %>", "-888");
			}
			else if (age >= 72)
			{
				setFieldValueIfBlank("<%= b2scraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2airaw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2piraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2gmraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2fmraw.ClientID %>", "-888");
				setFieldValueIfBlank("<%= b2amraw.ClientID %>", "-888");
			}
		
		}
	}

}

		</script>

						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" AllowedStudyMeasures="579,787,1476,1566,1622"
							LookupField1DataType="TEXT" VerifiedField="verified" PrimaryKeyField="bdi2_pk" MeasureName="Battelle 2nd Edition"
							LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_bdi2"
							LookupColumns="ID,indexnum,b2clin,b2date{0:d}" LookupColumnHeaders="ID, Indexnum,clin,date" LastScoredDateField="scored"
							LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td style="WIDTH: 207px">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="ID" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" DatabaseField="ID"
													FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="indexnum" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" DatabaseField="indexnum"
													FieldTextBoxTabIndex="2" FieldLabelText="Indexnum" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="b2date" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" DatabaseField="b2date"
													FieldTextBoxTabIndex="5" FieldLabelText="Test Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="b2clin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" DatabaseField="b2clin"
													FieldTextBoxTabIndex="5" FieldLabelText="Examiner" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="b2DOB" runat="server" FieldLabelWidth="80px" DatabaseField="b2DOB" FieldTextBoxTabIndex="6"
													FieldLabelText="DOB:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
													IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="b2agemo" runat="server" FieldLabelWidth="80px" DatabaseField="b2agemo" FieldTextBoxTabIndex="7"
													FieldLabelText="Age (months):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
												<def:datafieldcontrol id="b2agemo_hidden" runat="server" FieldLabelWidth="80px" DatabaseField="b2agemo"
													FieldTextBoxTabIndex="7" FieldLabelText="Age (months):" IsDoubleEntryField="False" IsReadOnly="True"
													IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="INT" ShowFieldLabel="False" FieldTextBoxCssClass="hideme"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="b2ageym" runat="server" FieldLabelWidth="80px" DatabaseField="b2ageym" FieldTextBoxTabIndex="8"
													FieldLabelText="Age (Y/M):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" Runat="server">
							<SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt">Use -999 for missing and -888 for 
								N/A due to age.</SPAN><BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Domains and<BR>
										Subdomains</TD>
									<TD class="heading" colSpan="2">Age<BR>
										Equivalent</TD>
									<TD class="heading">Subdomain<BR>
										Raw Score</TD>
									<TD class="heading">Subdomain<BR>
										Percentile Rank</TD>
									<TD class="heading">Subdomain<BR>
										Scaled Score</TD>
									<TD class="heading">Sums of
										<BR>
										Subdomain<BR>
										Scaled Scores</TD>
								</TR>
								<TR>
									<TD class="heading"><B>Adaptive (ADP)</B></TD>
									<TD class="heading">(months)</TD>
									<TD class="heading">(y-m)</TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading" rowSpan="3"></TD>
								</TR>
								<TR>
									<TD>Self-Care (SC)</TD>
									<TD>
										<def:datafieldcontrol id="b2scae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2scae"
											FieldTextBoxTabIndex="10" DatabaseField="b2scae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2scaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2scaeym"
											FieldTextBoxTabIndex="12" DatabaseField="b2scaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="5316"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2scraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2scraw"
											FieldTextBoxTabIndex="9" DatabaseField="b2scraw" FieldTextBoxWidth="40px" ShowFieldLabel="False" RegEx="^([0-9]|[1-6][0-9]|70|-888|-999)$"
											RegExDescription="Value must be between 0 and 70, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2scpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2scpctx"
											FieldTextBoxTabIndex="11" DatabaseField="b2scpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2scss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2scss"
											FieldTextBoxTabIndex="13" DatabaseField="b2scss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Personal<BR>
										Responsibility (PR)</TD>
									<TD>
										<def:datafieldcontrol id="b2prae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2prae"
											FieldTextBoxTabIndex="15" DatabaseField="b2prae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2012"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2praeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2praeym"
											FieldTextBoxTabIndex="18" DatabaseField="b2praeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2prraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2prraw"
											FieldTextBoxTabIndex="14" DatabaseField="b2prraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-4][0-9]|50|-888|-999)$" RegExDescription="Value must be between 0 and 50, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2prpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2prpctx"
											FieldTextBoxTabIndex="16" DatabaseField="b2prpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2015"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2prss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2prss"
											FieldTextBoxTabIndex="18" DatabaseField="b2prss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>Total</B></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD class="heading">
										<def:datafieldcontrol id="b2adpsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2adpsum"
											FieldTextBoxTabIndex="74" DatabaseField="b2adpsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading"><B>Personal-Social (P-S)</B></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading" rowSpan="4"></TD>
								</TR>
								<TR>
									<TD>Adult Interaction (AI)</TD>
									<TD>
										<def:datafieldcontrol id="b2aiae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2aiae"
											FieldTextBoxTabIndex="20" DatabaseField="b2aiae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2024"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2aiaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2aiaeym"
											FieldTextBoxTabIndex="24" DatabaseField="b2aiaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2airaw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2airaw"
											FieldTextBoxTabIndex="19" DatabaseField="b2airaw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-5][0-9]|60|-888|-999)$" RegExDescription="Value must be between 0 and 60, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2aipctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2aipctx"
											FieldTextBoxTabIndex="21" DatabaseField="b2aipctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2027"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2aiss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2aiss"
											FieldTextBoxTabIndex="23" DatabaseField="b2aiss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Peer Interaction (PI)</TD>
									<TD>
										<def:datafieldcontrol id="b2piae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2piae"
											FieldTextBoxTabIndex="25" DatabaseField="b2piae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2piaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2piaeym"
											FieldTextBoxTabIndex="30" DatabaseField="b2piaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2piraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2piraw"
											FieldTextBoxTabIndex="24" DatabaseField="b2piraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-4][0-9]|50|-888|-999)$" RegExDescription="Value must be between 0 and 50, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pipctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pipctx"
											FieldTextBoxTabIndex="26" DatabaseField="b2pipctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2039"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2piss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2piss"
											FieldTextBoxTabIndex="28" DatabaseField="b2piss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Self-Concept and<BR>
										Social Role (SR)</TD>
									<TD>
										<def:datafieldcontrol id="b2srae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2srae"
											FieldTextBoxTabIndex="30" DatabaseField="b2srae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2sraeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2sraeym"
											FieldTextBoxTabIndex="36" DatabaseField="b2sraeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2srraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2srraw"
											FieldTextBoxTabIndex="29" DatabaseField="b2srraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-8][0-9]|90|-888|-999)$" RegExDescription="Value must be between 0 and 90, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2srpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2srpctx"
											FieldTextBoxTabIndex="31" DatabaseField="b2srpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2srss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2srss"
											FieldTextBoxTabIndex="33" DatabaseField="b2srss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2057"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>Total</B></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD class="heading">
										<def:datafieldcontrol id="b2pssum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pssum"
											FieldTextBoxTabIndex="79" DatabaseField="b2pssum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="3878"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading"><B>Communication (COM)</B></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading" rowSpan="3"></TD>
								</TR>
								<TR>
									<TD>Receptive Communication (RC)</TD>
									<TD>
										<def:datafieldcontrol id="b2rcae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2rcae"
											FieldTextBoxTabIndex="35" DatabaseField="b2rcae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2rcaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2rcaeym"
											FieldTextBoxTabIndex="42" DatabaseField="b2rcaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2rcraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2rcraw"
											FieldTextBoxTabIndex="34" DatabaseField="b2rcraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-7][0-9]|80|-888|-999)$" RegExDescription="Value must be between 0 and 80, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2rcpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2rcpctx"
											FieldTextBoxTabIndex="36" DatabaseField="b2rcpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2063"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2rcss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2rcss"
											FieldTextBoxTabIndex="38" DatabaseField="b2rcss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2069"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Expressive Communication (EC)</TD>
									<TD>
										<def:datafieldcontrol id="b2ecae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2ecae"
											FieldTextBoxTabIndex="40" DatabaseField="b2ecae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2ecaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2ecaeym"
											FieldTextBoxTabIndex="48" DatabaseField="b2ecaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="5334"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2ecraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2ecraw"
											FieldTextBoxTabIndex="39" DatabaseField="b2ecraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-8][0-9]|90|-888|-999)$" RegExDescription="Value must be between 0 and 90, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2ecpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2ecpctx"
											FieldTextBoxTabIndex="41" DatabaseField="b2ecpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2557"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2ecss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2ecss"
											FieldTextBoxTabIndex="43" DatabaseField="b2ecss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2563"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>Total</B></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD class="heading">
										<def:datafieldcontrol id="b2comsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2comsum"
											FieldTextBoxTabIndex="84" DatabaseField="b2comsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="3896"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading"><B>Motor (MOT)</B></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading" rowSpan="4"></TD>
								</TR>
								<TR>
									<TD>Gross Motor (GM)</TD>
									<TD>
										<def:datafieldcontrol id="b2gmae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2gmae"
											FieldTextBoxTabIndex="45" DatabaseField="b2gmae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2566"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2gmaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2gmaeym"
											FieldTextBoxTabIndex="54" DatabaseField="b2gmaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2gmraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2gmraw"
											FieldTextBoxTabIndex="44" DatabaseField="b2gmraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-8][0-9]|90|-888|-999)$" RegExDescription="Value must be between 0 and 90, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2gmpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2gmpctx"
											FieldTextBoxTabIndex="46" DatabaseField="b2gmpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2gmss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2gmss"
											FieldTextBoxTabIndex="48" DatabaseField="b2gmss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Fine Motor (FM)</TD>
									<TD>
										<def:datafieldcontrol id="b2fmae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2fmae"
											FieldTextBoxTabIndex="50" DatabaseField="b2fmae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2fmaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2fmaeym"
											FieldTextBoxTabIndex="60" DatabaseField="b2fmaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2fmraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2fmraw"
											FieldTextBoxTabIndex="49" DatabaseField="b2fmraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-5][0-9]|60|-888|-999)$" RegExDescription="Value must be between 0 and 60, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2fmpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2fmpctx"
											FieldTextBoxTabIndex="51" DatabaseField="b2fmpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2fmss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2fmss"
											FieldTextBoxTabIndex="53" DatabaseField="b2fmss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2587"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Perceptual Motor (PM)</TD>
									<TD>
										<def:datafieldcontrol id="b2pmae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pmae"
											FieldTextBoxTabIndex="55" DatabaseField="b2pmae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pmaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pmaeym"
											FieldTextBoxTabIndex="66" DatabaseField="b2pmaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pmraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2pmraw"
											FieldTextBoxTabIndex="54" DatabaseField="b2pmraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-4][0-9]|50|-888|-999)$" RegExDescription="Value must be between 0 and 50, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pmpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pmpctx"
											FieldTextBoxTabIndex="56" DatabaseField="b2pmpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pmss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pmss"
											FieldTextBoxTabIndex="58" DatabaseField="b2pmss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2599"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>Total</B></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD class="heading">
										<def:datafieldcontrol id="b2motsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2motsum"
											FieldTextBoxTabIndex="89" DatabaseField="b2motsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading"><B>Cognitive (COG)</B></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading" rowSpan="4"></TD>
								</TR>
								<TR>
									<TD>Attention and Memory (AM)</TD>
									<TD>
										<def:datafieldcontrol id="b2amae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2amae"
											FieldTextBoxTabIndex="60" DatabaseField="b2amae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2amaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2amaeym"
											FieldTextBoxTabIndex="72" DatabaseField="b2amaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2amraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2amraw"
											FieldTextBoxTabIndex="59" DatabaseField="b2amraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-5][0-9]|60|-888|-999)$" RegExDescription="Value must be between 0 and 60, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2ampctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2ampctx"
											FieldTextBoxTabIndex="61" DatabaseField="b2ampctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2amss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2amss"
											FieldTextBoxTabIndex="63" DatabaseField="b2amss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2611"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Reasoning and<BR>
										Academic Skills (RA)</TD>
									<TD>
										<def:datafieldcontrol id="b2raae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2raae"
											FieldTextBoxTabIndex="65" DatabaseField="b2raae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2raaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2raaeym"
											FieldTextBoxTabIndex="78" DatabaseField="b2raaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2raraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2raraw"
											FieldTextBoxTabIndex="64" DatabaseField="b2raraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-6][0-9]|70|-888|-999)$" RegExDescription="Value must be between 0 and 70, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2rapctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2rapctx"
											FieldTextBoxTabIndex="66" DatabaseField="b2rapctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2617"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2rass" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2rass"
											FieldTextBoxTabIndex="68" DatabaseField="b2rass" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2623"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Perception and<BR>
										Concepts (PC)</TD>
									<TD>
										<def:datafieldcontrol id="b2pcae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pcae"
											FieldTextBoxTabIndex="70" DatabaseField="b2pcae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="2626"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pcaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pcaeym"
											FieldTextBoxTabIndex="84" DatabaseField="b2pcaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pcraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b2pcraw"
											FieldTextBoxTabIndex="69" DatabaseField="b2pcraw" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-7][0-9]|80|-888|-999)$" RegExDescription="Value must be between 0 and 80, -888 or -999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pcpctx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pcpctx"
											FieldTextBoxTabIndex="71" DatabaseField="b2pcpctx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pcss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pcss"
											FieldTextBoxTabIndex="73" DatabaseField="b2pcss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>Total</B></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD class="heading">
										<def:datafieldcontrol id="b2cogsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2cogsum"
											FieldTextBoxTabIndex="94" DatabaseField="b2cogsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="3932"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">BDI-2 Total</TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading"></TD>
									<TD class="heading">
										<def:datafieldcontrol id="b2totsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2totsum"
											FieldTextBoxTabIndex="99" DatabaseField="b2totsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Sum of<BR>
										Scaled<BR>
										Scores</TD>
									<TD class="heading">Develop-<BR>
										mental<BR>
										Quotient</TD>
									<TD class="heading">Percentile<BR>
										Rank</TD>
									<TD class="heading">95%<BR>
										Confidence<BR>
										Interval</TD>
								</TR>
								<TR>
									<TD class="heading">Adaptive</TD>
									<TD>
										<def:datafieldcontrol id="b2adpsum2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2adpsum"
											FieldTextBoxTabIndex="74" DatabaseField="b2adpsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2adpdq" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2adpdq"
											FieldTextBoxTabIndex="75" DatabaseField="b2adpdq" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2adppct" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2adppct"
											FieldTextBoxTabIndex="77" DatabaseField="b2adppct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2adpci" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2adpci"
											FieldTextBoxTabIndex="78" DatabaseField="b2adpci" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Personal-Social</TD>
									<TD>
										<def:datafieldcontrol id="b2pssum2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pssum"
											FieldTextBoxTabIndex="79" DatabaseField="b2pssum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2psdq" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2psdq"
											FieldTextBoxTabIndex="80" DatabaseField="b2psdq" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2pspct" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2pspct"
											FieldTextBoxTabIndex="82" DatabaseField="b2pspct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2psci" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2psci"
											FieldTextBoxTabIndex="83" DatabaseField="b2psci" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Communication</TD>
									<TD>
										<def:datafieldcontrol id="b2comsum2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2comsum"
											FieldTextBoxTabIndex="84" DatabaseField="b2comsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2comdq" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2comdq"
											FieldTextBoxTabIndex="85" DatabaseField="b2comdq" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2compct" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2compct"
											FieldTextBoxTabIndex="87" DatabaseField="b2compct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2comci" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2comci"
											FieldTextBoxTabIndex="88" DatabaseField="b2comci" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Motor</TD>
									<TD>
										<def:datafieldcontrol id="b2motsum2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2motsum"
											FieldTextBoxTabIndex="89" DatabaseField="b2motsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2motdq" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2motdq"
											FieldTextBoxTabIndex="90" DatabaseField="b2motdq" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2motpct" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2motpct"
											FieldTextBoxTabIndex="92" DatabaseField="b2motpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2motci" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2motci"
											FieldTextBoxTabIndex="93" DatabaseField="b2motci" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4428"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Cognitive</TD>
									<TD>
										<def:datafieldcontrol id="b2cogsum2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2cogsum"
											FieldTextBoxTabIndex="94" DatabaseField="b2cogsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4433"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2cogdq" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2cogdq"
											FieldTextBoxTabIndex="95" DatabaseField="b2cogdq" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4436"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2cogpct" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2cogpct"
											FieldTextBoxTabIndex="97" DatabaseField="b2cogpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2cogci" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2cogci"
											FieldTextBoxTabIndex="98" DatabaseField="b2cogci" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4445"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">BDI-2 Total</TD>
									<TD>
										<def:datafieldcontrol id="b2totsum2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2totsum"
											FieldTextBoxTabIndex="99" DatabaseField="b2totsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4450"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2totdq" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2totdq"
											FieldTextBoxTabIndex="100" DatabaseField="b2totdq" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4453"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2totpcx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2totpcx"
											FieldTextBoxTabIndex="101" DatabaseField="b2totpcx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="b2totci" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="b2totci"
											FieldTextBoxTabIndex="103" DatabaseField="b2totci" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="b2cmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
								FieldTextBoxTabIndex="103" DatabaseField="b2cmt" FieldTextBoxWidth="200px" ShowFieldLabel="True" FieldTextBoxMaxLength="400"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="105" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="106" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="107" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="108" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="237" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="238" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
