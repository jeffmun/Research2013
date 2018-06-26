<%@ Page language="c#" Inherits="tap_vineseec.tap_vineseec" CodeFile="tap_vineseec.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_vineseec" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="VINE-SEEC" PrimaryKeyField="vineseec_pk"
							VerifiedField="verified" ShowScoreButton="True" LookupField1DataType="TEXT"  StudyMeasID="356" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br/>
						<def:datafieldcontrol id="tapid" runat="server" DatabaseField="tapid" FieldTextBoxTabIndex="1" FieldLabelText="TAP ID"
							IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
							IsInsertField="True" FieldDataType="TEXT" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must  look like TAP###"
							FieldTextBoxWidth="100px" FieldLabelWidth="100px"></def:datafieldcontrol>
						<asp:panel id="mainPanel" runat="server">
							<TABLE class="layout" id="Table2">
								<TR>
									<TD>
										<def:datafieldcontrol id="vsclin" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician" FieldTextBoxTabIndex="2"
											DatabaseField="vsclin"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vsdate" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interview Date" FieldTextBoxTabIndex="3"
											DatabaseField="vsdate" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="vsdob" runat="server" FieldLabelWidth="150px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Birth Date:" FieldTextBoxTabIndex="4" DatabaseField="vsdob"
											FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vsageuse" runat="server" FieldLabelWidth="150px" FieldDataType="int" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Age used (months):" FieldTextBoxTabIndex="8" DatabaseField="vsageuse"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vsageym" runat="server" FieldLabelWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Chronological Age (y:m):" FieldTextBoxTabIndex="7" DatabaseField="vsageym"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vsadob" runat="server" FieldLabelWidth="150px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Adjusted Birth Date:" FieldTextBoxTabIndex="5" DatabaseField="vsadob"
											FormatString="{0:d}" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="301"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vsgagew" runat="server" FieldLabelWidth="150px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Gestation Age (weeks):" FieldTextBoxTabIndex="6" DatabaseField="vsgagew"
											RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="302"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vsaageym" runat="server" FieldLabelWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Adjusted Age (y:m) (blank if unadjusted):" FieldTextBoxTabIndex="8"
											DatabaseField="vsaageym" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid" id="Table1">
								<TR>
									<TD>Scales</TD>
									<TD width="118">Raw<br/>
										Score (enter -999 for missing/blank)</TD>
									<TD>Standard<br/>
										Score</TD>
									<TD>Percentile<br/>
										Rank</TD>
									<TD>Descriptive<br/>
										Category</TD>
									<TD>Age<br/>
										Equivalent</TD>
								</TR>
								<TR>
									<TD>Interpersonal<br/>
										Relationships</TD>
									<TD width="118">
										<def:datafieldcontrol id="vsirraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 88 or -999"
											RegEx="^([0-9]|[1-7][0-9]|[8][0-8]|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="vsirraw"
											FieldTextBoxTabIndex="10" DatabaseField="vsirraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vsirss" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vsirss" FieldTextBoxTabIndex="13" DatabaseField="vsirss"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vsirpct" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vsirpct" FieldTextBoxTabIndex="16" DatabaseField="vsirptx"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vsirdes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vsirdes"
											FieldTextBoxTabIndex="19" DatabaseField="vsirdes" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vsirae" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vsirae" FieldTextBoxTabIndex="22" DatabaseField="vsiraet"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Play and Leisure Time</TD>
									<TD width="118">
										<def:datafieldcontrol id="vspltraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 88 or -999"
											RegEx="^([0-9]|[1-7][0-9]|[8][0-8]|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="vspltraw"
											FieldTextBoxTabIndex="11" DatabaseField="vspltraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vspltss" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vspltss" FieldTextBoxTabIndex="14" DatabaseField="vspltss"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vspltpct" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vspltpct" FieldTextBoxTabIndex="17" DatabaseField="vspltptx"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vspltdes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vspltdes"
											FieldTextBoxTabIndex="20" DatabaseField="vspltdes" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vspltae" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vspltae" FieldTextBoxTabIndex="23" DatabaseField="vspltaet"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Coping Skills</TD>
									<TD width="118">
										<def:datafieldcontrol id="vscsraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 68 or -999"
											RegEx="^([0-9]|[1-5][0-9]|[6][0-8]|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="vscsraw"
											FieldTextBoxTabIndex="12" DatabaseField="vscsraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vscsss" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vscsss" FieldTextBoxTabIndex="15" DatabaseField="vscsss"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vscspct" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vscspct" FieldTextBoxTabIndex="18" DatabaseField="vscsptx"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vscsdes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vscsdes"
											FieldTextBoxTabIndex="21" DatabaseField="vscsdes" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vscsae" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vscsae" FieldTextBoxTabIndex="24" DatabaseField="vscsaet"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD rowSpan="2">Social-Emotional Composite</TD>
									<TD width="118">Sum of Scale Standard Scores</TD>
									<TD>
										<def:datafieldcontrol id="vssumss" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vssumss" FieldTextBoxTabIndex="25" DatabaseField="vssumss"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD width="118">Composite Standard Score</TD>
									<TD>
										<def:datafieldcontrol id="vscss" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vscss" FieldTextBoxTabIndex="26" DatabaseField="vscss"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vscsspct" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="vscsspct" FieldTextBoxTabIndex="27" DatabaseField="vscssptx"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vscssdes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vscssdes"
											FieldTextBoxTabIndex="28" DatabaseField="vscssdes" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE id="Table3" cellSpacing="1" cellPadding="1">
								<TR>
									<TD>
										<def:datafieldcontrol id="vsvalid" runat="server" FieldLabelWidth="150px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Validity (1=Valid, 2=Questionnable Validity, 3=Invalid)" FieldTextBoxTabIndex="29"
											DatabaseField="vsvalid" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vscmt" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="30"
											DatabaseField="vscmt" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="200"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout" id="Table4">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="32" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="33" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="34" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="35" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel>
					</asp:Content>
