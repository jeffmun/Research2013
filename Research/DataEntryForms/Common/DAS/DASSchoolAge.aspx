<%@ Page language="c#" Inherits="kt_das.kt_das_schoolage" CodeFile="DASSchoolAge.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="das_pk" MeasureName="DAS (School-Age)" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_das_schoolage" 
							AllowedStudyMeasures="103,242,525,536,627,694"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<h2>School Age DAS</h2>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" runat="server">
      <TABLE class="layout" id="Table4">
								<TR>
									<TD>
										<def:datafieldcontrol id="dasdate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="dasdate"
											FieldTextBoxTabIndex="3" FieldLabelText="DAS date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasclin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="dasclin"
											FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dob" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="dob"
											FieldTextBoxTabIndex="4" FieldLabelText="DOB:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasage" runat="server" DatabaseField="dasage" FieldTextBoxTabIndex="5" FieldLabelText="Age (mos.):"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" FieldTextBoxCssClass="readonlyfieldtextbox"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasageym" runat="server" DatabaseField="dasageym" FieldTextBoxTabIndex="6" FieldLabelText="Age (y:m):"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" FieldTextBoxCssClass="readonlyfieldtextbox"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="agetable" runat="server" DatabaseField="agetable" FieldTextBoxTabIndex="80"
											FieldLabelText="Age table used:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											FieldTextBoxCssClass="readonlyfieldtextbox"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DASscor" runat="server" DatabaseField="DASscor" FieldTextBoxTabIndex="83" FieldLabelText="Scoring Status:"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid" id="Table1">
								<TR>
									<TD width="197">Enter 999 for blank or missing scores.</TD>
									<TD class="heading">Ability Score</TD>
									<TD class="heading">T Score</TD>
									<TD class="heading">%ile</TD>
									<TD class="heading">Age Eq (mo.)</TD>
									<TD class="heading">Age Eq (y:m)</TD>
									<TD class="heading">Level</TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Recall of Designs</TD>
									<TD>
										<def:datafieldcontrol id="rdraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="rdraw" FieldTextBoxTabIndex="5"
											FieldLabelText="rdraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 169, or 999."
											RegEx="^([1-9][0-9]|1[0-6][0-9]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdt" runat="server" DatabaseField="rdt" FieldTextBoxTabIndex="9" FieldLabelText="rdt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdpct" runat="server" DatabaseField="rdpct" FieldTextBoxTabIndex="10" FieldLabelText="rdpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="649"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdae" runat="server" DatabaseField="rdae" FieldTextBoxTabIndex="11" FieldLabelText="rdae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="652"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdaetxt" runat="server" DatabaseField="rdaetxt" FieldTextBoxTabIndex="37" FieldLabelText="rdaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdlevel" runat="server" DatabaseField="rdlevel" FieldTextBoxTabIndex="86" FieldLabelText="rdlevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197" height="50">Word Defin</TD>
									<TD height="50">
										<def:datafieldcontrol id="wdraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="wdraw" FieldTextBoxTabIndex="6"
											FieldLabelText="wdraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 185 or 999."
											RegEx="^([1-9][0-9]|1[0-7][0-9]|18[0-5]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdt" runat="server" DatabaseField="wdt" FieldTextBoxTabIndex="13" FieldLabelText="wdt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="655"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdpct" runat="server" DatabaseField="wdpct" FieldTextBoxTabIndex="14" FieldLabelText="wdpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdae" runat="server" DatabaseField="wdae" FieldTextBoxTabIndex="15" FieldLabelText="wdae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdaetxt" runat="server" DatabaseField="wdaetxt" FieldTextBoxTabIndex="38" FieldLabelText="wdaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1836"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdlevel" runat="server" DatabaseField="wdlevel" FieldTextBoxTabIndex="87" FieldLabelText="wdlevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Pattern Constr
										<def:datafieldcontrol id="pctype" runat="server" FieldTextBoxWidth="30px" DatabaseField="pctype" FieldTextBoxTabIndex="13"
											FieldLabelText="(Scoring: 0=standard, 1 or -1=alternate)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,-1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="pcraw" FieldTextBoxTabIndex="7"
											FieldLabelText="pcraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 231, or 999."
											RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-2][0-9]|23[01]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pct" runat="server" DatabaseField="pct" FieldTextBoxTabIndex="18" FieldLabelText="pct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1107"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcpct" runat="server" DatabaseField="pcpct" FieldTextBoxTabIndex="19" FieldLabelText="pcpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1110"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcae" runat="server" DatabaseField="pcae" FieldTextBoxTabIndex="20" FieldLabelText="pcae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1113"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcaetxt" runat="server" DatabaseField="pcaetxt" FieldTextBoxTabIndex="39" FieldLabelText="pcaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pclevel" runat="server" DatabaseField="pclevel" FieldTextBoxTabIndex="88" FieldLabelText="pclevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Matrices</TD>
									<TD>
										<def:datafieldcontrol id="maraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="maraw" FieldTextBoxTabIndex="8"
											FieldLabelText="maraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 156, or 999."
											RegEx="^([1-9][0-9]|1[0-4][0-9]|15[0-6]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mat" runat="server" DatabaseField="mat" FieldTextBoxTabIndex="22" FieldLabelText="mat"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1116"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mapct" runat="server" DatabaseField="mapct" FieldTextBoxTabIndex="23" FieldLabelText="mapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="maae" runat="server" DatabaseField="maae" FieldTextBoxTabIndex="24" FieldLabelText="maae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="maaetxt" runat="server" DatabaseField="maaetxt" FieldTextBoxTabIndex="40" FieldLabelText="maaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="malevel" runat="server" DatabaseField="malevel" FieldTextBoxTabIndex="89" FieldLabelText="malevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Similarities</TD>
									<TD>
										<def:datafieldcontrol id="siraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="siraw" FieldTextBoxTabIndex="9"
											FieldLabelText="siraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 165, or 999."
											RegEx="^([1-9][0-9]|1[0-5][0-9]|16[0-5]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sit" runat="server" DatabaseField="sit" FieldTextBoxTabIndex="26" FieldLabelText="sit"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sipct" runat="server" DatabaseField="sipct" FieldTextBoxTabIndex="27" FieldLabelText="sipct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="siae" runat="server" DatabaseField="siae" FieldTextBoxTabIndex="28" FieldLabelText="siae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="siaetxt" runat="server" DatabaseField="siaetxt" FieldTextBoxTabIndex="41" FieldLabelText="siaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1845"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="silevel" runat="server" DatabaseField="silevel" FieldTextBoxTabIndex="90" FieldLabelText="silevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Seq. &amp; Quant. Reas.</TD>
									<TD>
										<def:datafieldcontrol id="sqraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="sqraw" FieldTextBoxTabIndex="10"
											FieldLabelText="sqraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 152, or 999."
											RegEx="^([1-9][0-9]|1[0-4][0-9]|15[0-2]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqt" runat="server" DatabaseField="sqt" FieldTextBoxTabIndex="30" FieldLabelText="sqt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqpct" runat="server" DatabaseField="sqpct" FieldTextBoxTabIndex="31" FieldLabelText="sqpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqae" runat="server" DatabaseField="sqae" FieldTextBoxTabIndex="32" FieldLabelText="sqae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqaetxt" runat="server" DatabaseField="sqaetxt" FieldTextBoxTabIndex="42" FieldLabelText="sqaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqlevel" runat="server" DatabaseField="sqlevel" FieldTextBoxTabIndex="91" FieldLabelText="sqlevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Recog. of Pictures</TD>
									<TD>
										<def:datafieldcontrol id="rpraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="rpraw" FieldTextBoxTabIndex="12"
											FieldLabelText="rpraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Must be between 10 and 285, or 999."
											RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-7][0-9]|28[0-5]|999)$" ShowFieldLabel="False" FieldTextBoxTextDefault="999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpt" runat="server" DatabaseField="rpt" FieldTextBoxTabIndex="34" FieldLabelText="rpt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1143"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rppct" runat="server" DatabaseField="rppct" FieldTextBoxTabIndex="35" FieldLabelText="rppct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpae" runat="server" DatabaseField="rpae" FieldTextBoxTabIndex="36" FieldLabelText="rpae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpaetxt" runat="server" DatabaseField="rpaetxt" FieldTextBoxTabIndex="43" FieldLabelText="rpaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rplevel" runat="server" DatabaseField="rplevel" FieldTextBoxTabIndex="92" FieldLabelText="rplevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>BYA 
      = below youngest age which takes subtest<BR>AOA = above oldest age which 
      takes subtest<BR>
      <TABLE class="grid" id="Table2">
								<TR>
									<TD></TD>
									<TD class="heading">Std Score</TD>
									<TD class="heading">%ile</TD>
									<TD class="heading">95% CI Min</TD>
									<TD class="heading">Max</TD>
									<TD class="heading">Level</TD>
								</TR>
								<TR>
									<TD class="heading">Verbal:</TD>
									<TD>
										<def:datafieldcontrol id="vass" runat="server" FieldTextBoxWidth="40px" DatabaseField="vass" FieldTextBoxTabIndex="44"
											FieldLabelText="vass" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vapct" runat="server" DatabaseField="vapct" FieldTextBoxTabIndex="45" FieldLabelText="vapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="val95" runat="server" DatabaseField="val95" FieldTextBoxTabIndex="46" FieldLabelText="val95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vah95" runat="server" DatabaseField="vah95" FieldTextBoxTabIndex="47" FieldLabelText="vah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vcluslevel" runat="server" DatabaseField="vcluslevel" FieldTextBoxTabIndex="81"
											FieldLabelText="vcluslevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Nonverbal:</TD>
									<TD>
										<def:datafieldcontrol id="nvass" runat="server" FieldTextBoxWidth="40px" DatabaseField="nvass" FieldTextBoxTabIndex="56"
											FieldLabelText="nvass" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvapct" runat="server" DatabaseField="nvapct" FieldTextBoxTabIndex="57" FieldLabelText="nvapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nval95" runat="server" DatabaseField="nval95" FieldTextBoxTabIndex="58" FieldLabelText="nval95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvah95" runat="server" DatabaseField="nvah95" FieldTextBoxTabIndex="59" FieldLabelText="nvah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvcluslevel" runat="server" DatabaseField="nvcluslevel" FieldTextBoxTabIndex="82"
											FieldLabelText="nvcluslevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Spatial:</TD>
									<TD>
										<def:datafieldcontrol id="sass" runat="server" FieldTextBoxWidth="40px" DatabaseField="sass" FieldTextBoxTabIndex="52"
											FieldLabelText="sass" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sapct" runat="server" DatabaseField="sapct" FieldTextBoxTabIndex="53" FieldLabelText="sapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sal95" runat="server" DatabaseField="sal95" FieldTextBoxTabIndex="54" FieldLabelText="sal95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sah95" runat="server" DatabaseField="sah95" FieldTextBoxTabIndex="55" FieldLabelText="sah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="scluslevel" runat="server" DatabaseField="scluslevel" FieldTextBoxTabIndex="83"
											FieldLabelText="scluslevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">GCA:</TD>
									<TD>
										<def:datafieldcontrol id="gcass" runat="server" FieldTextBoxWidth="40px" DatabaseField="gcass" FieldTextBoxTabIndex="60"
											FieldLabelText="gcass" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcapct" runat="server" DatabaseField="gcapct" FieldTextBoxTabIndex="61" FieldLabelText="gcapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcal95" runat="server" DatabaseField="gcal95" FieldTextBoxTabIndex="62" FieldLabelText="gcal95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcah95" runat="server" DatabaseField="gcah95" FieldTextBoxTabIndex="63" FieldLabelText="gcah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcalevel" runat="server" DatabaseField="gcalevel" FieldTextBoxTabIndex="84"
											FieldLabelText="gcalevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Special Nonverbal Composite</TD>
									<TD>
										<def:datafieldcontrol id="sncss" runat="server" FieldTextBoxWidth="40px" DatabaseField="sncss" FieldTextBoxTabIndex="64"
											FieldLabelText="sncss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sncpct" runat="server" DatabaseField="sncpct" FieldTextBoxTabIndex="65" FieldLabelText="sncpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sncl95" runat="server" DatabaseField="sncl95" FieldTextBoxTabIndex="66" FieldLabelText="sncl95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="snch95" runat="server" DatabaseField="snch95" FieldTextBoxTabIndex="67" FieldLabelText="snch95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="snclevel" runat="server" DatabaseField="snclevel" FieldTextBoxTabIndex="85"
											FieldLabelText="snclevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="norms" runat="server" FieldTextBoxWidth="200px" DatabaseField="norms" FieldTextBoxTabIndex="79"
								FieldLabelText="Norms:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="2664"
								FieldTextBoxHeight="50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol><BR>
      <TABLE class="grid" id="Table3">
								<TR>
									<TD colSpan="3">Age Equivalence</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">(mos)</TD>
									<TD class="heading">(yr:mos)</TD>
								</TR>
								<TR>
									<TD class="heading">Verbal:</TD>
									<TD>
										<def:datafieldcontrol id="vaae" runat="server" DatabaseField="vaae" FieldTextBoxTabIndex="69" FieldLabelText="vaae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaaetxt" runat="server" DatabaseField="vaaetxt" FieldTextBoxTabIndex="75" FieldLabelText="vaaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Nonverbal:</TD>
									<TD>
										<def:datafieldcontrol id="nvaae" runat="server" DatabaseField="nvaae" FieldTextBoxTabIndex="70" FieldLabelText="nvaae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvaaetxt" runat="server" DatabaseField="nvaaetxt" FieldTextBoxTabIndex="76"
											FieldLabelText="nvaaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Spatial:</TD>
									<TD>
										<def:datafieldcontrol id="saae" runat="server" DatabaseField="saae" FieldTextBoxTabIndex="71" FieldLabelText="saae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="saaetxt" runat="server" DatabaseField="saaetxt" FieldTextBoxTabIndex="77" FieldLabelText="saaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">GCA:</TD>
									<TD>
										<def:datafieldcontrol id="gcaae" runat="server" DatabaseField="gcaae" FieldTextBoxTabIndex="68" FieldLabelText="gcaae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcaaetxt" runat="server" DatabaseField="gcaaetxt" FieldTextBoxTabIndex="74"
											FieldLabelText="gcaaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">SNC:</TD>
									<TD>
										<def:datafieldcontrol id="sncae" runat="server" DatabaseField="sncae" FieldTextBoxTabIndex="72" FieldLabelText="sncae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sncaetxt" runat="server" DatabaseField="sncaetxt" FieldTextBoxTabIndex="78"
											FieldLabelText="sncaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="DASvld" runat="server" FieldTextBoxWidth="30px" DatabaseField="DASvld" FieldTextBoxTabIndex="14"
											FieldLabelText="DAS valid? (0=Assigned Floor Score, 1=Valid, 2=Questionnable validty, 3=Invalid)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAScmnt" runat="server" FieldTextBoxWidth="300px" DatabaseField="DAScmnt" FieldTextBoxTabIndex="15"
											FieldLabelText="DAS comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="85"
											FieldLabelText="created:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="86"
											FieldLabelText="createdBy:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="87"
											FieldLabelText="updated:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="88"
											FieldLabelText="updatedBy:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="237"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="238"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
