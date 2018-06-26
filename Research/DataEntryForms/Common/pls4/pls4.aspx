
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.pls4.pls4" CodeFile="pls4.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LastUpdatedDateField="updated" LastScoredDateField="scored"
							AllowedStudyMeasures="357,759,1494,1531,1540" DatabaseTable="all_pls4" LookupField1="id" LookupTextBox2Visible="False"
							LookupTextBox1LabelText="Subject ID:" MeasureName="PLS IV" PrimaryKeyField="pls4_pk" VerifiedField="verified"
							ShowScoreButton="True" LookupField1DataType="TEXT" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td width="224">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="id" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="id"
													FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsdate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="plsdate"
													FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsclin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="plsclin"
													FieldTextBoxTabIndex="4" FieldLabelText="Examiner" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="plsdob" runat="server" FieldLabelWidth="100px" DatabaseField="plsdob" FieldTextBoxTabIndex="5"
													FieldLabelText="Birth Date:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsagem" runat="server" FieldLabelWidth="100px" DatabaseField="plsagem" FieldTextBoxTabIndex="6"
													FieldLabelText="Age (months):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsageym" runat="server" FieldLabelWidth="100px" DatabaseField="plsageym" FieldTextBoxTabIndex="7"
													FieldLabelText="Age (y-m):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsagttx" runat="server" FieldLabelWidth="100px" DatabaseField="plsagttx" FieldTextBoxTabIndex="9"
													FieldLabelText="Age table used:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="grid">
								<TR>
									<TD rowSpan="2">(use -999 for missing)</TD>
									<TD rowSpan="2"></TD>
									<TD class="heading" height="61" rowSpan="2">Standard<BR>
										Score (SS)</TD>
									<TD class="heading" height="61" rowSpan="2">Percentile<BR>
										Rank (PR)</TD>
									<TD class="heading" colSpan="2">Age<BR>
										Equivalent</TD>
								</TR>
								<TR>
									<TD height="19">y-m</TD>
									<TD height="19">Months</TD>
								</TR>
								<TR>
									<TD class="heading">AC Raw Score</TD>
									<TD>
										<def:datafieldcontrol id="plsacrw" runat="server" RegExDescription="Value must be between 0 and 62 or -999"
											RegEx="^([0-9]|[1-5][0-9]|6[0-2]|-999)$" FieldTextBoxWidth="40px" DatabaseField="plsacrw" FieldTextBoxTabIndex="10"
											FieldLabelText="plsacrw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plsacss" runat="server" DatabaseField="plsacss" FieldTextBoxTabIndex="11" FieldLabelText="plsacss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plsacpr" runat="server" DatabaseField="plsacpr" FieldTextBoxTabIndex="12" FieldLabelText="plsacpr"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plsacae" runat="server" DatabaseField="plsacae" FieldTextBoxTabIndex="13" FieldLabelText="plsacae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="plsacaem" FieldTextBoxTabIndex="13"
											FieldLabelText="plsacae" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">EC Raw Score</TD>
									<TD>
										<def:datafieldcontrol id="plsecrw" runat="server" RegExDescription="Value must be between 0 and 68 or -999"
											RegEx="^([0-9]|[1-5][0-9]|6[0-8]|-999)$" FieldTextBoxWidth="40px" DatabaseField="plsecrw" FieldTextBoxTabIndex="15"
											FieldLabelText="plsecrw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plsecss" runat="server" DatabaseField="plsecss" FieldTextBoxTabIndex="16" FieldLabelText="plsecss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plsecpr" runat="server" DatabaseField="plsecpr" FieldTextBoxTabIndex="17" FieldLabelText="plsecpr"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plsecae" runat="server" DatabaseField="plsecae" FieldTextBoxTabIndex="18" FieldLabelText="plsecae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" DatabaseField="plsecaem" FieldTextBoxTabIndex="18"
											FieldLabelText="plsecae" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Standard Score total</TD>
									<TD>
										<def:datafieldcontrol id="plstotss" runat="server" DatabaseField="plstotss" FieldTextBoxTabIndex="21"
											FieldLabelText="plstotss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plstosss" runat="server" DatabaseField="plstosss" FieldTextBoxTabIndex="22"
											FieldLabelText="plstosss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="plstotpr" runat="server" DatabaseField="plstotpr" FieldTextBoxTabIndex="23"
											FieldLabelText="plstotpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD bgColor="#c0c0c0"></TD>
									<TD bgColor="#c0c0c0"></TD>
								</TR>
								<TR>
									<TD class="heading">AC Raw + EC Raw</TD>
									<TD>
										<def:datafieldcontrol id="plstotrw" runat="server" DatabaseField="plstotrw" FieldTextBoxTabIndex="20"
											FieldLabelText="plstotrw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD bgColor="silver"></TD>
									<TD bgColor="#c0c0c0"></TD>
									<TD>
										<def:datafieldcontrol id="plstotae" runat="server" DatabaseField="plstotae" FieldTextBoxTabIndex="24"
											FieldLabelText="plstotae" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" DatabaseField="plstoaem" FieldTextBoxTabIndex="24"
											FieldLabelText="plstotae" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="plsscrtxt" runat="server" FieldLabelWidth="100px" DatabaseField="plsscrtxt"
											FieldTextBoxTabIndex="26" FieldLabelText="Scoring notes:" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="plscmt" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="plscmt"
											FieldTextBoxTabIndex="27" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="29"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="30"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="31"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="32"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
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
