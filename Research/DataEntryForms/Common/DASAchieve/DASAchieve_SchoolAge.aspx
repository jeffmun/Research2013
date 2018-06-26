<%@ Page language="c#" Inherits="GenericDataEntryForms.DASAchieve.DASAchieve_SchoolAge" CodeFile="DASAchieve_SchoolAge.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField2DataType="INT" LastUpdatedDateField="updated"
							LastScoredDateField="scored" DatabaseTable="all_dasachieve_schoolage" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="DAS Achievement Tests (School-Age)"
							PrimaryKeyField="da_pk" VerifiedField="verified" ShowScoreButton="True" LookupField1DataType="TEXT"
							AllowedStudyMeasures="189,1237" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="layout" id="Table4">
								<TR>
									<TD>
										<def:datafieldcontrol id="dasdate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="dadate"
											FieldTextBoxTabIndex="3" FieldLabelText="DAS date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasclin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="daclin"
											FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dob" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="dadob"
											FieldTextBoxTabIndex="4" FieldLabelText="DOB:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasage" runat="server" FieldLabelWidth="100px" DatabaseField="daagem" FieldTextBoxTabIndex="5"
											FieldLabelText="Age (mos.):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											FieldTextBoxCssClass="readonlyfieldtextbox"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dasageym" runat="server" FieldLabelWidth="100px" DatabaseField="daageym" FieldTextBoxTabIndex="6"
											FieldLabelText="Age (y:m):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											FieldTextBoxCssClass="readonlyfieldtextbox"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DASscor" runat="server" FieldLabelWidth="100px" DatabaseField="scoremsg" FieldTextBoxTabIndex="83"
											FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="172"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="100px" DatabaseField="danorms"
											FieldTextBoxTabIndex="83" FieldLabelText="Norms:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>ACHIEVEMENT TESTS</TD>
									<TD class="heading">Ability<BR>
										Score<br>(use 999 for missing)</TD>
									<TD class="heading">Standard<BR>
										Score</TD>
									<TD class="heading">Percentile<BR>
										(Grade/Age)</TD>
								</TR>
								<TR>
									<TD class="heading">Basic Number Skills</TD>
									<TD>
										<def:datafieldcontrol id="daBNSab" runat="server" FieldTextBoxWidth="50px" DatabaseField="daBNSab" FieldTextBoxTabIndex="10"
											FieldLabelText="daBNSab" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-3]|999)$" RegExDescription="Value must be between 10 and 253 or 999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="daBNSss" runat="server" DatabaseField="daBNSss" FieldTextBoxTabIndex="13" FieldLabelText="daBNSss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="daBNSpct" runat="server" DatabaseField="daBNSpct" FieldTextBoxTabIndex="16"
											FieldLabelText="daBNSpct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Spelling</TD>
									<TD>
										<def:datafieldcontrol id="daSPab" runat="server" FieldTextBoxWidth="50px" DatabaseField="daSPab" FieldTextBoxTabIndex="11"
											FieldLabelText="daSPab" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RegEx="^([1-9][0-9]|1[0-9][0-9]|2[0-5][0-9]|260|999)$"
											RegExDescription="Value must be between 10 and 260 or 999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="daSPss" runat="server" DatabaseField="daSPss" FieldTextBoxTabIndex="14" FieldLabelText="daSPss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="daSPpct" runat="server" DatabaseField="daSPpct" FieldTextBoxTabIndex="17" FieldLabelText="daSPpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Word Reading</TD>
									<TD>
										<def:datafieldcontrol id="daWRab" runat="server" FieldTextBoxWidth="50px" DatabaseField="daWRab" FieldTextBoxTabIndex="12"
											FieldLabelText="daWRab" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RegEx="^([1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-2]|999)$"
											RegExDescription="Value must be between 10 and 212 or 999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="daWRss" runat="server" DatabaseField="daWRss" FieldTextBoxTabIndex="15" FieldLabelText="daWRss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="daWRpct" runat="server" DatabaseField="daWRpct" FieldTextBoxTabIndex="18" FieldLabelText="daWRpct"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="DASvld" runat="server" FieldTextBoxWidth="30px" DatabaseField="davld" FieldTextBoxTabIndex="14"
											FieldLabelText="Validity (0=Assigned Floor Score, 1=Valid, 2=Questionnable validty, 3=Invalid)" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAScmnt" runat="server" FieldTextBoxWidth="300px" DatabaseField="dacmt" FieldTextBoxTabIndex="15"
											FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
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
