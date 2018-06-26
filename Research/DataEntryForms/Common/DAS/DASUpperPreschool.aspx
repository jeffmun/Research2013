<%@ Page language="c#" Inherits="GenericDataEntryForms.DASUpperPreschool.DASUpperPreschool" CodeFile="DASUpperPreschool.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="das_preschool_pk" MeasureName="DAS Upper Preschool" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_das_upperpreschool" 
							AllowedStudyMeasures="103,242,525,536,627,694"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<h2>Upper Preschool DAS</h2>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
      <TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="dasdate" runat="server" FieldLabelWidth="60px" FieldTextBoxWidth="80px" DatabaseField="dasdate"
											FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasclin" runat="server" FieldLabelWidth="60px" FieldTextBoxWidth="80px" DatabaseField="dasclin"
											FieldTextBoxTabIndex="4" FieldLabelText="Examiner" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dob" runat="server" DatabaseField="dob" FieldTextBoxTabIndex="6" FieldLabelText="DOB"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasage" runat="server" DatabaseField="dasage" FieldTextBoxTabIndex="7" FieldLabelText="Age (mos.):"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasageym" runat="server" DatabaseField="dasageym" FieldTextBoxTabIndex="8" FieldLabelText="Age (y:m):"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="agetable" runat="server" DatabaseField="agetable" FieldTextBoxTabIndex="88"
											FieldLabelText="Age table used:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DASscor" runat="server" DatabaseField="DASscor" FieldTextBoxTabIndex="91" FieldLabelText="Scoring Status:"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD width="252">Enter 999 for blank or missing scores.</TD>
									<TD class="heading">Ability Score</TD>
									<TD class="heading">T Score</TD>
									<TD class="heading">%ile</TD>
									<TD class="heading">Age Eq (mo.)</TD>
									<TD class="heading">Age Eq (y:m)</TD>
									<TD class="heading">Level</TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Verbal Comp.</TD>
									<TD>
										<def:datafieldcontrol id="vcraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="vcraw" FieldTextBoxTabIndex="5"
											FieldLabelText="vcraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 174 or 999."
											RegEx="^([1-9][0-9]|1[0-6][0-9]|17[0-4]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vct" runat="server" DatabaseField="vct" FieldTextBoxTabIndex="19" FieldLabelText="vct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vcpct" runat="server" DatabaseField="vcpct" FieldTextBoxTabIndex="20" FieldLabelText="vcpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vcae" runat="server" DatabaseField="vcae" FieldTextBoxTabIndex="21" FieldLabelText="vcae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vcaetxt" runat="server" DatabaseField="vcaetxt" FieldTextBoxTabIndex="44" FieldLabelText="vcaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vclevel" runat="server" DatabaseField="vclevel" FieldTextBoxTabIndex="80" FieldLabelText="vclevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Pict. Similarities</TD>
									<TD>
										<def:datafieldcontrol id="psraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="psraw" FieldTextBoxTabIndex="6"
											FieldLabelText="psraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 118 or 999."
											RegEx="^([1-9][0-9]|10[0-9]|11[0-8]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pst" runat="server" DatabaseField="pst" FieldTextBoxTabIndex="23" FieldLabelText="pst"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pspct" runat="server" DatabaseField="pspct" FieldTextBoxTabIndex="24" FieldLabelText="pspct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="psae" runat="server" DatabaseField="psae" FieldTextBoxTabIndex="25" FieldLabelText="psae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="psaetxt" runat="server" DatabaseField="psaetxt" FieldTextBoxTabIndex="45" FieldLabelText="psaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pslevel" runat="server" DatabaseField="pslevel" FieldTextBoxTabIndex="81" FieldLabelText="pslevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Naming Vocab.</TD>
									<TD>
										<def:datafieldcontrol id="nvraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="nvraw" FieldTextBoxTabIndex="7"
											FieldLabelText="nvraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 169 or 999."
											RegEx="^([1-9][0-9]|1[0-6][0-9]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvt" runat="server" DatabaseField="nvt" FieldTextBoxTabIndex="31" FieldLabelText="nvt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvpct" runat="server" DatabaseField="nvpct" FieldTextBoxTabIndex="32" FieldLabelText="nvpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvae" runat="server" DatabaseField="nvae" FieldTextBoxTabIndex="33" FieldLabelText="nvae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvaetxt" runat="server" DatabaseField="nvaetxt" FieldTextBoxTabIndex="46" FieldLabelText="nvaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvlevel" runat="server" DatabaseField="nvlevel" FieldTextBoxTabIndex="82" FieldLabelText="nvlevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Pattern Constr.
										<def:datafieldcontrol id="pctype" runat="server" FieldTextBoxWidth="30px" DatabaseField="pctype" FieldTextBoxTabIndex="12"
											FieldLabelText="Scoring (0=standard, 1=alternate)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="pcraw" FieldTextBoxTabIndex="8"
											FieldLabelText="pcraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 231 or 999."
											RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-2][0-9]|23[0-1]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pct" runat="server" DatabaseField="pct" FieldTextBoxTabIndex="36" FieldLabelText="pct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcpct" runat="server" DatabaseField="pcpct" FieldTextBoxTabIndex="37" FieldLabelText="pcpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcae" runat="server" DatabaseField="pcae" FieldTextBoxTabIndex="38" FieldLabelText="pcae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pcaetxt" runat="server" DatabaseField="pcaetxt" FieldTextBoxTabIndex="47" FieldLabelText="pcaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pclevel" runat="server" DatabaseField="pclevel" FieldTextBoxTabIndex="83" FieldLabelText="pclevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Early Num Concepts</TD>
									<TD>
										<def:datafieldcontrol id="encraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="encraw" FieldTextBoxTabIndex="9"
											FieldLabelText="encraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 154 or 999."
											RegEx="^([1-9][0-9]|1[0-4][0-9]|15[0-4]|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="enct" runat="server" DatabaseField="enct" FieldTextBoxTabIndex="15" FieldLabelText="enct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="encpct" runat="server" DatabaseField="encpct" FieldTextBoxTabIndex="16" FieldLabelText="encpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="encae" runat="server" DatabaseField="encae" FieldTextBoxTabIndex="17" FieldLabelText="encae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="encaetxt" runat="server" DatabaseField="encaetxt" FieldTextBoxTabIndex="48"
											FieldLabelText="encaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="enclevel" runat="server" DatabaseField="enclevel" FieldTextBoxTabIndex="84"
											FieldLabelText="enclevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Copying</TD>
									<TD>
										<def:datafieldcontrol id="copraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="copraw" FieldTextBoxTabIndex="10"
											FieldLabelText="copraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 170 or 999."
											RegEx="^([1-9][0-9]|1[0-6][0-9]|170|999)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="copt" runat="server" DatabaseField="copt" FieldTextBoxTabIndex="40" FieldLabelText="copt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="coppct" runat="server" DatabaseField="coppct" FieldTextBoxTabIndex="41" FieldLabelText="coppct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="copae" runat="server" DatabaseField="copae" FieldTextBoxTabIndex="42" FieldLabelText="copae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="copaetxt" runat="server" DatabaseField="copaetxt" FieldTextBoxTabIndex="49"
											FieldLabelText="copaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" DESIGNTIMEDRAGDROP="2257"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="coplevel" runat="server" DatabaseField="coplevel" FieldTextBoxTabIndex="85"
											FieldLabelText="coplevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="252">Recog. of Pictures</TD>
									<TD>
										<def:datafieldcontrol id="rpraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="rpraw" FieldTextBoxTabIndex="11"
											FieldLabelText="rpraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegExDescription="Value must be between 10 and 138 or 999."
											RegEx="^([1-9][0-9]|1[0-2][0-9]|13[0-8]|999)$" ShowFieldLabel="False" FieldTextBoxTextDefault="999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpt" runat="server" DatabaseField="rpt" FieldTextBoxTabIndex="27" FieldLabelText="rpt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rppct" runat="server" DatabaseField="rppct" FieldTextBoxTabIndex="28" FieldLabelText="rppct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpae" runat="server" DatabaseField="rpae" FieldTextBoxTabIndex="29" FieldLabelText="rpae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rpaetxt" runat="server" DatabaseField="rpaetxt" FieldTextBoxTabIndex="50" FieldLabelText="rpaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rplevel" runat="server" DatabaseField="rplevel" FieldTextBoxTabIndex="86" FieldLabelText="rplevel"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>BYA 
      = below youngest age which takes subtest<BR>AOA = above oldest age which 
      takes subtest<BR>
      <TABLE class="grid">
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
										<def:datafieldcontrol id="vass" runat="server" DatabaseField="vass" FieldTextBoxTabIndex="51" FieldLabelText="vass"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vapct" runat="server" DatabaseField="vapct" FieldTextBoxTabIndex="52" FieldLabelText="vapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="val95" runat="server" DatabaseField="val95" FieldTextBoxTabIndex="53" FieldLabelText="val95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vah95" runat="server" DatabaseField="vah95" FieldTextBoxTabIndex="54" FieldLabelText="vah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vcluslevel" runat="server" DatabaseField="vcluslevel" FieldTextBoxTabIndex="77"
											FieldLabelText="vcluslevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" DESIGNTIMEDRAGDROP="3333"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Nonverbal:</TD>
									<TD>
										<def:datafieldcontrol id="nvass" runat="server" DatabaseField="nvass" FieldTextBoxTabIndex="63" FieldLabelText="nvass"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvapct" runat="server" DatabaseField="nvapct" FieldTextBoxTabIndex="64" FieldLabelText="nvapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="2974"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nval95" runat="server" DatabaseField="nval95" FieldTextBoxTabIndex="65" FieldLabelText="nval95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="3300"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvah95" runat="server" DatabaseField="nvah95" FieldTextBoxTabIndex="66" FieldLabelText="nvah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvcluslevel" runat="server" DatabaseField="nvcluslevel" FieldTextBoxTabIndex="78"
											FieldLabelText="nvcluslevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" DESIGNTIMEDRAGDROP="3336"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">GCA:</TD>
									<TD>
										<def:datafieldcontrol id="gcass" runat="server" DatabaseField="gcass" FieldTextBoxTabIndex="67" FieldLabelText="gcass"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcapct" runat="server" DatabaseField="gcapct" FieldTextBoxTabIndex="68" FieldLabelText="gcapct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="3306"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcal95" runat="server" DatabaseField="gcal95" FieldTextBoxTabIndex="69" FieldLabelText="gcal95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="3309"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcah95" runat="server" DatabaseField="gcah95" FieldTextBoxTabIndex="70" FieldLabelText="gcah95"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcalevel" runat="server" DatabaseField="gcalevel" FieldTextBoxTabIndex="79"
											FieldLabelText="gcalevel" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="norms" runat="server" FieldLabelWidth="60px" DatabaseField="norms" FieldTextBoxTabIndex="87"
								FieldLabelText="Norms:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
      <TABLE class="grid">
								<TR>
									<TD colSpan="3">Age Equivalence</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">(mo)</TD>
									<TD class="heading">(y:m)</TD>
								</TR>
								<TR>
									<TD class="heading">GCA:</TD>
									<TD>
										<def:datafieldcontrol id="gcaae" runat="server" DatabaseField="gcaae" FieldTextBoxTabIndex="71" FieldLabelText="gcaae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="gcaaetxt" runat="server" DatabaseField="gcaaetxt" FieldTextBoxTabIndex="74"
											FieldLabelText="gcaaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Verbal:</TD>
									<TD>
										<def:datafieldcontrol id="vaae" runat="server" DatabaseField="vaae" FieldTextBoxTabIndex="72" FieldLabelText="vaae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaaetxt" runat="server" DatabaseField="vaaetxt" FieldTextBoxTabIndex="75" FieldLabelText="vaaetxt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="3660"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Nonverbal:</TD>
									<TD>
										<def:datafieldcontrol id="nvaae" runat="server" DatabaseField="nvaae" FieldTextBoxTabIndex="73" FieldLabelText="nvaae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="nvaaetxt" runat="server" DatabaseField="nvaaetxt" FieldTextBoxTabIndex="76"
											FieldLabelText="nvaaetxt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE>
								<TR>
									<TD>
										<def:datafieldcontrol id="DASvld" runat="server" FieldTextBoxWidth="40px" DatabaseField="DASvld" FieldTextBoxTabIndex="13"
											FieldLabelText="DAS valid? (0=Assigned Floor Score, 1=Valid, 2=Questionnable validty, 3=Invalid)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAScmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="DAScmnt" FieldTextBoxTabIndex="14"
											FieldLabelText="DAS Comments:" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxMaxLength="250" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="93"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="94"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="95"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="96"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
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
						</asp:Panel>
					</asp:Content>
