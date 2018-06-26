<%@ Page language="c#" Inherits="tap_pls4.tap_pls4" CodeFile="tap_pls4.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_pls4" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP PLS4" PrimaryKeyField="pls4_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" ShowScoreButton="True" StudyMeasID="357" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td width="224">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
													FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
													RegExDescription="TAP ID must  look like TAP###" FieldLabelWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Test Date"
													FieldTextBoxTabIndex="3" DatabaseField="plsdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Examiner"
													FieldTextBoxTabIndex="4" DatabaseField="plsclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="plsdob" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Birth Date:"
													FieldTextBoxTabIndex="5" DatabaseField="plsdob" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"
													FormatString="{0:d}"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsagem" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (months):"
													FieldTextBoxTabIndex="6" DatabaseField="plsagem" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="plsageym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (y-m):"
													FieldTextBoxTabIndex="7" DatabaseField="plsageym" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td>
												<def:datafieldcontrol id="plsagttx" runat="server" FieldLabelWidth="100px" DatabaseField="plsagttx" FieldTextBoxTabIndex="9"
													FieldLabelText="Age table used:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<br/>
							<TABLE class="grid">
								<TR>
									<TD rowSpan="2">(use -999 for missing)</TD>
									<TD rowSpan="2"></TD>
									<TD class="heading" height="61" rowSpan="2">Standard<br/>
										Score (SS)</TD>
									<TD class="heading" height="61" rowSpan="2">Percentile<br/>
										Rank (PR)</TD>
									<TD class="heading" colSpan="2">Age<br/>
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
							<br/>
							<br/>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="plscmt" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="plscmt"
											FieldTextBoxTabIndex="27" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
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
							</TABLE>
						</asp:Panel>
					</asp:Content>
