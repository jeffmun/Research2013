<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_das.edst3_das_schoolage" CodeFile="edst3_das_schoolage.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_das" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:" MeasureName="EDS T3 DAS (School-Age)"
							PrimaryKeyField="das_pk" VerifiedField="verified" ShowScoreButton="True" LookupField1DataType="INT" StudyMeasID="103" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="2" FieldLabelText="EDS ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dasdate" runat="server" DatabaseField="dasdate" FieldTextBoxTabIndex="3" FieldLabelText="DAS date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<TR>
								<TD><def:datafieldcontrol id="dasclin" runat="server" DatabaseField="dasclin" FieldTextBoxTabIndex="4" FieldLabelText="Clinician"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></TD>
							</TR>
						</table>
						<asp:panel id="mainPanel" runat="server">
							<TABLE class="layout" id="Table4">
								<TR>
									<TD>
										<def:datafieldcontrol id="dob" runat="server" FieldDataType="DATE" IsInsertField="False" IsEntryField="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DOB:" FieldTextBoxTabIndex="4" DatabaseField="dob"
											FormatString="{0:d}" FieldTextBoxCssClass="readonlyfieldtextbox" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasage" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (mos.):"
											FieldTextBoxTabIndex="5" DatabaseField="dasage" FieldTextBoxCssClass="readonlyfieldtextbox" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasageym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (y:m):"
											FieldTextBoxTabIndex="6" DatabaseField="dasageym" FieldTextBoxCssClass="readonlyfieldtextbox" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="agetable" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age table used:"
											FieldTextBoxTabIndex="80" DatabaseField="agetable" FieldTextBoxCssClass="readonlyfieldtextbox" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DASscor" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Status:"
											FieldTextBoxTabIndex="83" DatabaseField="DASscor" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
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
										<def:datafieldcontrol id="rdraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="rdraw"
											FieldTextBoxTabIndex="5" DatabaseField="rdraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-6][0-9]|999)$"
											RegExDescription="Must be between 10 and 169, or 999."></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rdt"
											FieldTextBoxTabIndex="9" DatabaseField="rdt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rdpct"
											FieldTextBoxTabIndex="10" DatabaseField="rdpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="649"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rdae"
											FieldTextBoxTabIndex="11" DatabaseField="rdae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="652"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rdaetxt"
											FieldTextBoxTabIndex="37" DatabaseField="rdaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rdlevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rdlevel"
											FieldTextBoxTabIndex="86" DatabaseField="rdlevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197" height="50">Word Defin</TD>
									<TD height="50">
										<def:datafieldcontrol id="wdraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="wdraw"
											FieldTextBoxTabIndex="6" DatabaseField="wdraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-7][0-9]|18[0-5]|999)$"
											RegExDescription="Must be between 10 and 185 or 999."></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="wdt"
											FieldTextBoxTabIndex="13" DatabaseField="wdt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="655"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="wdpct"
											FieldTextBoxTabIndex="14" DatabaseField="wdpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="wdae"
											FieldTextBoxTabIndex="15" DatabaseField="wdae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="wdaetxt"
											FieldTextBoxTabIndex="38" DatabaseField="wdaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="1836"></def:datafieldcontrol></TD>
									<TD height="50">
										<def:datafieldcontrol id="wdlevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="wdlevel"
											FieldTextBoxTabIndex="87" DatabaseField="wdlevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Pattern Constr
										<def:datafieldcontrol id="pctype" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="(Scoring: 0=standard, 1 or -1=alternate)"
											FieldTextBoxTabIndex="13" DatabaseField="pctype" FieldTextBoxWidth="30px" FieldTextBoxTextDefault="0"
											ValidList="0,1,-1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="pcraw"
											FieldTextBoxTabIndex="7" DatabaseField="pcraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-2][0-9]|23[01]|999)$"
											RegExDescription="Must be between 10 and 231, or 999."></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pct"
											FieldTextBoxTabIndex="18" DatabaseField="pct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1107"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pcpct"
											FieldTextBoxTabIndex="19" DatabaseField="pcpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="1110"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pcae"
											FieldTextBoxTabIndex="20" DatabaseField="pcae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1113"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pcaetxt"
											FieldTextBoxTabIndex="39" DatabaseField="pcaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pclevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pclevel"
											FieldTextBoxTabIndex="88" DatabaseField="pclevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Matrices</TD>
									<TD>
										<def:datafieldcontrol id="maraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="maraw"
											FieldTextBoxTabIndex="8" DatabaseField="maraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-4][0-9]|15[0-6]|999)$"
											RegExDescription="Must be between 10 and 156, or 999."></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mat"
											FieldTextBoxTabIndex="22" DatabaseField="mat" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1116"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mapct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mapct"
											FieldTextBoxTabIndex="23" DatabaseField="mapct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="maae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="maae"
											FieldTextBoxTabIndex="24" DatabaseField="maae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="maaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="maaetxt"
											FieldTextBoxTabIndex="40" DatabaseField="maaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="malevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="malevel"
											FieldTextBoxTabIndex="89" DatabaseField="malevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Similarities</TD>
									<TD>
										<def:datafieldcontrol id="siraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="siraw"
											FieldTextBoxTabIndex="9" DatabaseField="siraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-5][0-9]|16[0-5]|999)$"
											RegExDescription="Must be between 10 and 165, or 999."></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sit" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sit"
											FieldTextBoxTabIndex="26" DatabaseField="sit" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sipct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sipct"
											FieldTextBoxTabIndex="27" DatabaseField="sipct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="siae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="siae"
											FieldTextBoxTabIndex="28" DatabaseField="siae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="siaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="siaetxt"
											FieldTextBoxTabIndex="41" DatabaseField="siaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="1845"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="silevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="silevel"
											FieldTextBoxTabIndex="90" DatabaseField="silevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Seq. &amp; Quant. Reas.</TD>
									<TD>
										<def:datafieldcontrol id="sqraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sqraw"
											FieldTextBoxTabIndex="10" DatabaseField="sqraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-4][0-9]|15[0-2]|999)$"
											RegExDescription="Must be between 10 and 152, or 999."></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sqt"
											FieldTextBoxTabIndex="30" DatabaseField="sqt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sqpct"
											FieldTextBoxTabIndex="31" DatabaseField="sqpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sqae"
											FieldTextBoxTabIndex="32" DatabaseField="sqae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sqaetxt"
											FieldTextBoxTabIndex="42" DatabaseField="sqaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sqlevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sqlevel"
											FieldTextBoxTabIndex="91" DatabaseField="sqlevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="197">Recog. of Pictures</TD>
									<TD>
										<def:datafieldcontrol id="rpraw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="rpraw"
											FieldTextBoxTabIndex="12" DatabaseField="rpraw" ShowFieldLabel="False" FieldTextBoxWidth="40px" RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-7][0-9]|28[0-5]|999)$"
											RegExDescription="Must be between 10 and 285, or 999." FieldTextBoxTextDefault="999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rpt"
											FieldTextBoxTabIndex="34" DatabaseField="rpt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1143"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rppct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rppct"
											FieldTextBoxTabIndex="35" DatabaseField="rppct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpae" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rpae"
											FieldTextBoxTabIndex="36" DatabaseField="rpae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rpaetxt"
											FieldTextBoxTabIndex="43" DatabaseField="rpaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rplevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="rplevel"
											FieldTextBoxTabIndex="92" DatabaseField="rplevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
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
										<def:datafieldcontrol id="vass" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vass"
											FieldTextBoxTabIndex="44" DatabaseField="vass" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vapct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vapct"
											FieldTextBoxTabIndex="45" DatabaseField="vapct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="val95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="val95"
											FieldTextBoxTabIndex="46" DatabaseField="val95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vah95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vah95"
											FieldTextBoxTabIndex="47" DatabaseField="vah95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vcluslevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vcluslevel"
											FieldTextBoxTabIndex="81" DatabaseField="vcluslevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Nonverbal:</TD>
									<TD>
										<def:datafieldcontrol id="nvass" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nvass"
											FieldTextBoxTabIndex="56" DatabaseField="nvass" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvapct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nvapct"
											FieldTextBoxTabIndex="57" DatabaseField="nvapct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nval95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nval95"
											FieldTextBoxTabIndex="58" DatabaseField="nval95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvah95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nvah95"
											FieldTextBoxTabIndex="59" DatabaseField="nvah95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvcluslevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nvcluslevel"
											FieldTextBoxTabIndex="82" DatabaseField="nvcluslevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Spatial:</TD>
									<TD>
										<def:datafieldcontrol id="sass" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sass"
											FieldTextBoxTabIndex="52" DatabaseField="sass" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sapct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sapct"
											FieldTextBoxTabIndex="53" DatabaseField="sapct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sal95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sal95"
											FieldTextBoxTabIndex="54" DatabaseField="sal95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sah95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sah95"
											FieldTextBoxTabIndex="55" DatabaseField="sah95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="scluslevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scluslevel"
											FieldTextBoxTabIndex="83" DatabaseField="scluslevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">GCA:</TD>
									<TD>
										<def:datafieldcontrol id="gcass" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcass"
											FieldTextBoxTabIndex="60" DatabaseField="gcass" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcapct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcapct"
											FieldTextBoxTabIndex="61" DatabaseField="gcapct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcal95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcal95"
											FieldTextBoxTabIndex="62" DatabaseField="gcal95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcah95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcah95"
											FieldTextBoxTabIndex="63" DatabaseField="gcah95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcalevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcalevel"
											FieldTextBoxTabIndex="84" DatabaseField="gcalevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Special Nonverbal Composite</TD>
									<TD>
										<def:datafieldcontrol id="sncss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sncss"
											FieldTextBoxTabIndex="64" DatabaseField="sncss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sncpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sncpct"
											FieldTextBoxTabIndex="65" DatabaseField="sncpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sncl95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sncl95"
											FieldTextBoxTabIndex="66" DatabaseField="sncl95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="snch95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="snch95"
											FieldTextBoxTabIndex="67" DatabaseField="snch95" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="snclevel" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="snclevel"
											FieldTextBoxTabIndex="85" DatabaseField="snclevel" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="norms" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Norms:"
								FieldTextBoxTabIndex="79" DatabaseField="norms" RenderReadOnlyAsDiv="True" FieldTextBoxWidth="200px"
								DESIGNTIMEDRAGDROP="2664" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="50px"></def:datafieldcontrol>
							<BR>
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
										<def:datafieldcontrol id="vaae" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vaae"
											FieldTextBoxTabIndex="69" DatabaseField="vaae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vaaetxt"
											FieldTextBoxTabIndex="75" DatabaseField="vaaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Nonverbal:</TD>
									<TD>
										<def:datafieldcontrol id="nvaae" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nvaae"
											FieldTextBoxTabIndex="70" DatabaseField="nvaae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvaaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="nvaaetxt"
											FieldTextBoxTabIndex="76" DatabaseField="nvaaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Spatial:</TD>
									<TD>
										<def:datafieldcontrol id="saae" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="saae"
											FieldTextBoxTabIndex="71" DatabaseField="saae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="saaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="saaetxt"
											FieldTextBoxTabIndex="77" DatabaseField="saaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">GCA:</TD>
									<TD>
										<def:datafieldcontrol id="gcaae" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcaae"
											FieldTextBoxTabIndex="68" DatabaseField="gcaae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcaaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="gcaaetxt"
											FieldTextBoxTabIndex="74" DatabaseField="gcaaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">SNC:</TD>
									<TD>
										<def:datafieldcontrol id="sncae" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sncae"
											FieldTextBoxTabIndex="72" DatabaseField="sncae" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sncaetxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sncaetxt"
											FieldTextBoxTabIndex="78" DatabaseField="sncaetxt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="DASvld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="DAS valid? (1=Valid, 2=Questionnable validty, 3=Invalid)"
											FieldTextBoxTabIndex="14" DatabaseField="DASvld" FieldTextBoxWidth="30px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAScmnt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="DAS comments"
											FieldTextBoxTabIndex="15" DatabaseField="DAScmnt" FieldTextBoxWidth="300px" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created:"
											FieldTextBoxTabIndex="85" DatabaseField="created" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy:"
											FieldTextBoxTabIndex="86" DatabaseField="createdBy" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated:"
											FieldTextBoxTabIndex="87" DatabaseField="updated" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy:"
											FieldTextBoxTabIndex="88" DatabaseField="updatedBy" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
