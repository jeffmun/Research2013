
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="KTDissDataEntryForms.kt_cts3.kt_cts3" CodeFile="cts3.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_cts" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Childhood Temperament Questionnaire"
							PrimaryKeyField="cts_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="519,529"
							ShowScoreButton="True" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<h3>Middle Childhood Temperament Questionnaire</h3>
						<br>
						<a href="cts_lookup.aspx">Click here to enter other CTS versions.</a>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ctsrat" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Rater"
										FieldTextBoxTabIndex="3" DatabaseField="ctsrat" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ctsdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date"
										FieldTextBoxTabIndex="4" DatabaseField="ctsdate" FormatString="{0:d}" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="DATE" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="DOB" FieldTextBoxTabIndex="4" DatabaseField="ctsdob" FormatString="{0:d}"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="TEXT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="AGE" FieldTextBoxTabIndex="4" DatabaseField="ctsageym"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
							IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ctsver"
							FieldTextBoxTabIndex="4" DatabaseField="ctsver" FieldLabelWidth="80px" FieldTextBoxWidth="80px" ShowFieldLabel="False"
							FieldTextBoxCssClass="hideme" FieldTextBoxTextDefault="3"></def:datafieldcontrol>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Category<BR>
										Score</TD>
									<TD class="heading">Standard<BR>
										Deviations<BR>
										from Mean</TD>
									<TD class="heading">Mean</TD>
									<TD class="heading">Standard<BR>
										Deviation</TD>
								</TR>
								<TR>
									<TD class="heading">Activity</TD>
									<TD>
										<def:datafieldcontrol id="ctsact" runat="server" DatabaseField="ctsact" FieldTextBoxTabIndex="122" FieldLabelText="ctsact"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsactsd" runat="server" DatabaseField="ctsactsd" FieldTextBoxTabIndex="123"
											FieldLabelText="ctsactsd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsactm" runat="server" DatabaseField="ctsactm" FieldTextBoxTabIndex="124" FieldLabelText="ctsactm"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsactdv" runat="server" DatabaseField="ctsactdv" FieldTextBoxTabIndex="125"
											FieldLabelText="ctsactdv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Rhythmicity</TD>
									<TD>
										<def:datafieldcontrol id="ctsrhy" runat="server" DatabaseField="ctsrhy" FieldTextBoxTabIndex="124" FieldLabelText="ctsrhy"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsrhysd" runat="server" DatabaseField="ctsrhysd" FieldTextBoxTabIndex="125"
											FieldLabelText="ctsrhysd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsrhym" runat="server" DatabaseField="ctsrhym" FieldTextBoxTabIndex="128" FieldLabelText="ctsrhym"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsrhydv" runat="server" DatabaseField="ctsrhydv" FieldTextBoxTabIndex="129"
											FieldLabelText="ctsrhydv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Approach</TD>
									<TD>
										<def:datafieldcontrol id="ctsapp" runat="server" DatabaseField="ctsapp" FieldTextBoxTabIndex="126" FieldLabelText="ctsapp"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsappsd" runat="server" DatabaseField="ctsappsd" FieldTextBoxTabIndex="127"
											FieldLabelText="ctsappsd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsappm" runat="server" DatabaseField="ctsappm" FieldTextBoxTabIndex="132" FieldLabelText="ctsappm"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsappdv" runat="server" DatabaseField="ctsappdv" FieldTextBoxTabIndex="133"
											FieldLabelText="ctsappdv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Adaptability</TD>
									<TD>
										<def:datafieldcontrol id="ctsada" runat="server" DatabaseField="ctsada" FieldTextBoxTabIndex="128" FieldLabelText="ctsada"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsadasd" runat="server" DatabaseField="ctsadasd" FieldTextBoxTabIndex="129"
											FieldLabelText="ctsadasd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsadam" runat="server" DatabaseField="ctsadam" FieldTextBoxTabIndex="136" FieldLabelText="ctsadam"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsadadv" runat="server" DatabaseField="ctsadadv" FieldTextBoxTabIndex="137"
											FieldLabelText="ctsadadv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Intensity</TD>
									<TD>
										<def:datafieldcontrol id="ctsint" runat="server" DatabaseField="ctsint" FieldTextBoxTabIndex="130" FieldLabelText="ctsint"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsintsd" runat="server" DatabaseField="ctsintsd" FieldTextBoxTabIndex="131"
											FieldLabelText="ctsintsd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsintm" runat="server" DatabaseField="ctsintm" FieldTextBoxTabIndex="140" FieldLabelText="ctsintm"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsintdv" runat="server" DatabaseField="ctsintdv" FieldTextBoxTabIndex="141"
											FieldLabelText="ctsintdv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Mood</TD>
									<TD>
										<def:datafieldcontrol id="ctsmoo" runat="server" DatabaseField="ctsmoo" FieldTextBoxTabIndex="132" FieldLabelText="ctsmoo"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsmoosd" runat="server" DatabaseField="ctsmoosd" FieldTextBoxTabIndex="133"
											FieldLabelText="ctsmoosd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsmoom" runat="server" DatabaseField="ctsmoom" FieldTextBoxTabIndex="144" FieldLabelText="ctsmoom"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsmoodv" runat="server" DatabaseField="ctsmoodv" FieldTextBoxTabIndex="145"
											FieldLabelText="ctsmoodv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Persistence</TD>
									<TD>
										<def:datafieldcontrol id="ctsper" runat="server" DatabaseField="ctsper" FieldTextBoxTabIndex="134" FieldLabelText="ctsper"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctspersd" runat="server" DatabaseField="ctspersd" FieldTextBoxTabIndex="135"
											FieldLabelText="ctspersd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsperm" runat="server" DatabaseField="ctsperm" FieldTextBoxTabIndex="148" FieldLabelText="ctsperm"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsperdv" runat="server" DatabaseField="ctsperdv" FieldTextBoxTabIndex="149"
											FieldLabelText="ctsperdv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Distractibility</TD>
									<TD>
										<def:datafieldcontrol id="ctsdis" runat="server" DatabaseField="ctsdis" FieldTextBoxTabIndex="136" FieldLabelText="ctsdis"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsdissd" runat="server" DatabaseField="ctsdissd" FieldTextBoxTabIndex="137"
											FieldLabelText="ctsdissd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsdism" runat="server" DatabaseField="ctsdism" FieldTextBoxTabIndex="152" FieldLabelText="ctsdism"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsdisdv" runat="server" DatabaseField="ctsdisdv" FieldTextBoxTabIndex="153"
											FieldLabelText="ctsdisdv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Threshold</TD>
									<TD>
										<def:datafieldcontrol id="ctsthr" runat="server" DatabaseField="ctsthr" FieldTextBoxTabIndex="138" FieldLabelText="ctsthr"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsthrsd" runat="server" DatabaseField="ctsthrsd" FieldTextBoxTabIndex="139"
											FieldLabelText="ctsthrsd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsthrm" runat="server" DatabaseField="ctsthrm" FieldTextBoxTabIndex="156" FieldLabelText="ctsthrm"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsthrdv" runat="server" DatabaseField="ctsthrdv" FieldTextBoxTabIndex="157"
											FieldLabelText="ctsthrdv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ctsscrmsg" runat="server" FieldLabelWidth="100px" DatabaseField="ctsscrmsg"
								FieldTextBoxTabIndex="140" FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True"
								IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=ALMOST NEVER 2=RARELY 3=VARIABLE, USUALLY NOT
										<BR>
										4=VARIABLE, USUALLY DOES 5=FREQUENTLY 6=ALMOST ALWAYS 9=MISSING</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa001" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa001"
											FieldTextBoxTabIndex="5" FieldLabelText="1. Runs to get where he/she wants to go." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa002" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa002"
											FieldTextBoxTabIndex="6" FieldLabelText="2. Avoids (stays away from, doesn't talk to) a new sitter on first meeting."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa003" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa003"
											FieldTextBoxTabIndex="7" FieldLabelText="3. Easily excited by praise (laughs, claps, yells, etc.). ,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa004" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa004"
											FieldTextBoxTabIndex="8" FieldLabelText="4. Frowns or complains when asked by the parent to do a chore."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa005" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa005"
											FieldTextBoxTabIndex="9" FieldLabelText="5. Notices (looks toward) minor changes in lighting (changes in shadows, turning on lights, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa006" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa006"
											FieldTextBoxTabIndex="10" FieldLabelText="6. Loses interest in a new toy or game the same day she/he gets it."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa007" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa007"
											FieldTextBoxTabIndex="11" FieldLabelText="7. Has difficulty (asks for advice, takes a long time, etc.) making decisions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa008" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa008"
											FieldTextBoxTabIndex="12" FieldLabelText="8. Uncomfortable with wet or dirty clothes; wants to change right away."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa009" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa009"
											FieldTextBoxTabIndex="13" FieldLabelText="9. Shows strong reactions (yells, shouts, etc.) when pleasantly surprised."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa010" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa010"
											FieldTextBoxTabIndex="14" FieldLabelText="10. Responses to parent's instructions are predictable."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa011" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa011"
											FieldTextBoxTabIndex="15" FieldLabelText="11. Remains pleasant (smiles, etc.) even when tired.,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa012" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa012"
											FieldTextBoxTabIndex="16" FieldLabelText="12. Looks up right away from play when telephone or doorbell rings."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa013" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa013"
											FieldTextBoxTabIndex="17" FieldLabelText="13. Moves right into a new place (store, theatre, playground)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa014" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa014"
											FieldTextBoxTabIndex="18" FieldLabelText="14. Adjusts within a day or two to changes in routine (different bedtime, new chores, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa015" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa015"
											FieldTextBoxTabIndex="19" FieldLabelText="15. Follows a consistent routine after school (snack-play-dinner; play-dinner-homework, etc)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa016" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa016"
											FieldTextBoxTabIndex="20" FieldLabelText="16. Happy and pleasant on short trips in the car or on the bus."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa017" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa017"
											FieldTextBoxTabIndex="21" FieldLabelText="17. Approaches new visitors in the home. ,." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa018" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa018"
											FieldTextBoxTabIndex="22" FieldLabelText="18. Reacts to sudden noises (doorbell, siren) while playing a game with friends."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa019" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa019"
											FieldTextBoxTabIndex="23" FieldLabelText="19. Looks up when someone walks past the doorway." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa020" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa020"
											FieldTextBoxTabIndex="24" FieldLabelText="20. Settles arguments with playmates within a few minutes. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa021" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa021"
											FieldTextBoxTabIndex="25" FieldLabelText="21. Stays with homework until finished." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa022" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa022"
											FieldTextBoxTabIndex="26" FieldLabelText="22. Stands or sits calmly while waiting (for snacks, turn in game, parent's attention, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa023" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa023"
											FieldTextBoxTabIndex="27" FieldLabelText="23. Reacts to temperature of water in bath, swimming, etc."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa024" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa024"
											FieldTextBoxTabIndex="28" FieldLabelText="24. Shows unusual behaviors in (has trouble getting used to) new situations (visiting relatives,new playmates)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa025" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa025"
											FieldTextBoxTabIndex="29" FieldLabelText="25. Loses interest as soon as difficulty arises when working on a project of his/her own choice."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa026" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa026"
											FieldTextBoxTabIndex="30" FieldLabelText="26. Repeats behavior for which he/she has previously been punished.,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa027" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa027"
											FieldTextBoxTabIndex="31" FieldLabelText="27. Moody when corrected for misbehavior." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa028" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa028"
											FieldTextBoxTabIndex="32" FieldLabelText="28. Amount of time for practicing special activities varies (music, sports, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa029" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa029"
											FieldTextBoxTabIndex="33" FieldLabelText="29. Reacts strongly (shouts, screams, etc.) to kidding or teasing."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa030" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa030"
											FieldTextBoxTabIndex="34" FieldLabelText="30. Runs or jumps when going up or down stairs." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa031" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa031"
											FieldTextBoxTabIndex="35" FieldLabelText="31. Jumps about or skips when walking with friends or family.,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa032" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa032"
											FieldTextBoxTabIndex="36" FieldLabelText="32. Reads a book without distraction while TV is on in same room.,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa033" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa033"
											FieldTextBoxTabIndex="37" FieldLabelText="33. Notices differences in taste or consistency of food (different brands, recipe, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa034" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa034"
											FieldTextBoxTabIndex="38" FieldLabelText="34. Laughs hard, shouts, squeals, etc, when happy." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa035" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa035"
											FieldTextBoxTabIndex="39" FieldLabelText="35. Quits routine household chores before finished.," IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa036" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa036"
											FieldTextBoxTabIndex="40" FieldLabelText="36. Food choices (likes and dislikes) vary from day to day.,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa037" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa037"
											FieldTextBoxTabIndex="41" FieldLabelText="37. Complains about events at school that day." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa038" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa038"
											FieldTextBoxTabIndex="42" FieldLabelText="38. Wants parent, brother, or sister along more than once for a new group activity."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa039" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa039"
											FieldTextBoxTabIndex="43" FieldLabelText="39. Resists changes in plans (delay in trip, friend can't visit, ete.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa040" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa040"
											FieldTextBoxTabIndex="44" FieldLabelText="40. Sits calmly while listening to music." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa041" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa041"
											FieldTextBoxTabIndex="45" FieldLabelText="41. Approaches (smiles at, speaks to) strangers outside the home, when with parents."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa042" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa042"
											FieldTextBoxTabIndex="46" FieldLabelText="42. Avoids misbehavior if punished firmly once or twice."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa043" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa043"
											FieldTextBoxTabIndex="47" FieldLabelText="43. Cheerful (smiles, hums, ete.) while doing chores or homework."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa044" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa044"
											FieldTextBoxTabIndex="48" FieldLabelText="44. Keeps her/his room neat and orderly." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa045" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa045"
											FieldTextBoxTabIndex="49" FieldLabelText="45. Wants to leave meal to answer telephone or doorbell."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa046" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa046"
											FieldTextBoxTabIndex="50" FieldLabelText="46. Goes back to play (game, drawing, model, ete.) after interruption."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa047" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa047"
											FieldTextBoxTabIndex="51" FieldLabelText="47. Reacts mildly (frowns, looks down) when scolded." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa048" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa048"
											FieldTextBoxTabIndex="52" FieldLabelText="48. Responds (looks up, goes to window, ete.) when he/she hears unusual noises such as sirens, car arriving, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa049" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa049"
											FieldTextBoxTabIndex="53" FieldLabelText="49. Can be coaxed out of a forbidden activity." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa050" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa050"
											FieldTextBoxTabIndex="54" FieldLabelText="50. Eats meals slowly and quietly." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa051" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa051"
											FieldTextBoxTabIndex="55" FieldLabelText="51. Cheerful or agreeable on waking up in the morning."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa052" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa052"
											FieldTextBoxTabIndex="56" FieldLabelText="52. Easily leaves home or car to go to a party or gathering by self."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa053" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa053"
											FieldTextBoxTabIndex="57" FieldLabelText="53. Spends over 1 hour working on a project (building, drawing, ete.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa054" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa054"
											FieldTextBoxTabIndex="58" FieldLabelText="54. Returns home from play or group activities on schedule."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa055" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa055"
											FieldTextBoxTabIndex="59" FieldLabelText="55. Avoids (stays away from, doesn't talk to) new guests or visitors in the home."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa056" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa056"
											FieldTextBoxTabIndex="60" FieldLabelText="56. Comments on odors (cooking, smoke) when first entering or leaving the home."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa057" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa057"
											FieldTextBoxTabIndex="61" FieldLabelText="57. Makes loud noises when angry (slams doors, bangs objects, shouts, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa058" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa058"
											FieldTextBoxTabIndex="62" FieldLabelText="58. Loses interest in caring for a pet, garden, houseplant, etc. within a week."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa059" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa059"
											FieldTextBoxTabIndex="63" FieldLabelText="59. Becomes angry with playmates.  " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa060" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa060"
											FieldTextBoxTabIndex="64" FieldLabelText="60. Attitudes toward after-school activities (scouts, hobbies, sports, etc.) vary from week to week."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa061" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa061"
											FieldTextBoxTabIndex="65" FieldLabelText="61. Slow to adjust to changes in mealtime (complains, not hungry, can't wait, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa062" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa062"
											FieldTextBoxTabIndex="66" FieldLabelText="62. Jumps about or wiggles when talking to parents." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa063" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa063"
											FieldTextBoxTabIndex="67" FieldLabelText="63. Reluctant (waits 5 minutes or more) to try out a new game or toy when first presented."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa064" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa064"
											FieldTextBoxTabIndex="68" FieldLabelText="64. Reacts strongly (laughs hard, shouts out, ete.) when he/she finds something he/she was looking for."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa065" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa065"
											FieldTextBoxTabIndex="69" FieldLabelText="65. Reacts to mild disapproval of parent (frown, shake of head)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa066" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa066"
											FieldTextBoxTabIndex="70" FieldLabelText="66. Misplaces possessions (clothes, toys, school papers, ete.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa067" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa067"
											FieldTextBoxTabIndex="71" FieldLabelText="67. Fidgets when he/she has to stay still (car ride, restaurant, ete.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa068" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa068"
											FieldTextBoxTabIndex="72" FieldLabelText="68. Leaves projects unfinished (drawings, models, crafts, ete.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa069" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa069"
											FieldTextBoxTabIndex="73" FieldLabelText="69. Ignores nearby conversation when reading a book or magazine."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa070" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa070"
											FieldTextBoxTabIndex="74" FieldLabelText="70. Bothered by changing activities (play, reading, etc.) at parent's request."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa071" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa071"
											FieldTextBoxTabIndex="75" FieldLabelText="71. Protests (frowns, complains) when denied permission to visit a friend."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa072" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa072"
											FieldTextBoxTabIndex="76" FieldLabelText="72. Plays quiet indoor games with friends (board games, puzzles, jacks, ete.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa073" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa073"
											FieldTextBoxTabIndex="77" FieldLabelText="73. Reacts mildly (slight smile, ete.) when accepting a new toy or game."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa074" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa074"
											FieldTextBoxTabIndex="78" FieldLabelText="74. Pays attention from start to finish when the parent explains something."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa075" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa075"
											FieldTextBoxTabIndex="79" FieldLabelText="75. Approaches children her/his age whom he/she doesn't know."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa076" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa076"
											FieldTextBoxTabIndex="80" FieldLabelText="76. Goes back to the task at hand (chore, housework, etc.) after interruption."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa077" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa077"
											FieldTextBoxTabIndex="81" FieldLabelText="77. Accepts other children's rules in games, even when different from his/her own. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa078" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa078"
											FieldTextBoxTabIndex="82" FieldLabelText="78. Remembers to do homework without being reminded." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa079" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa079"
											FieldTextBoxTabIndex="83" FieldLabelText="79. Pleasant (smiles, happy) at bedtime." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa080" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa080"
											FieldTextBoxTabIndex="84" FieldLabelText="80. Practices a physical activity (gym skills, skating, etc.) until it is mastered."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa081" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa081"
											FieldTextBoxTabIndex="85" FieldLabelText="81. Smiles or laughs with new adult visitors at home" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa082" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa082"
											FieldTextBoxTabIndex="86" FieldLabelText="82. Distracted by household noises. Needs silence for quiet activities (homework, reading, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa083" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa083"
											FieldTextBoxTabIndex="87" FieldLabelText="83. Takes major setbacks in stride (behavior changed for less than 2 days) when trip is cancelled or friend moves away, etc."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa084" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa084"
											FieldTextBoxTabIndex="88" FieldLabelText="84. Pleasant at meal times (smiles, cheerful).,." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa085" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa085"
											FieldTextBoxTabIndex="89" FieldLabelText="85. Sits calmly while watching TV or reading. ,." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa086" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa086"
											FieldTextBoxTabIndex="90" FieldLabelText="86. A continuous loud noise (jackhammer, siren, etc.) still bothers her/him after others are used to it."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa087" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa087"
											FieldTextBoxTabIndex="91" FieldLabelText="87. Runs when entering or leaving home." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa088" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa088"
											FieldTextBoxTabIndex="92" FieldLabelText="88. Responds intensely to disapproval (shouts, stamps foot, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa089" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa089"
											FieldTextBoxTabIndex="93" FieldLabelText="89. Has difficulty doing things on time (homework, keeping appointments, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa090" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa090"
											FieldTextBoxTabIndex="94" FieldLabelText="90. Stands aside or watches in a new situation until sure of himself/herself."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa091" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa091"
											FieldTextBoxTabIndex="95" FieldLabelText="91. Has 'off 'days when she/he is moody or cranky." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa092" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa092"
											FieldTextBoxTabIndex="96" FieldLabelText="92. Comments on changes in temperature when first going outdoors."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa093" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa093"
											FieldTextBoxTabIndex="97" FieldLabelText="93. Reacts strongly (cries or complains loudly) to a disappointment or failure."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa094" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa094"
											FieldTextBoxTabIndex="98" FieldLabelText="94. Notices and comments on textures (rough, soft, smooth) of materials (clothing, surfaces, upholstery, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa095" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa095"
											FieldTextBoxTabIndex="99" FieldLabelText="95. Leaves or wants to leave the table during meals.,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa096" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa096"
											FieldTextBoxTabIndex="100" FieldLabelText="96. Bursts loudly into the room when entering." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa097" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa097"
											FieldTextBoxTabIndex="101" FieldLabelText="97. Quits before finishing a chore he/she likes." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa098" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa098"
											FieldTextBoxTabIndex="102" FieldLabelText="98. Has trouble sleeping when there's conversation nearby. '"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa099" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa099"
											FieldTextBoxTabIndex="103" FieldLabelText="99. Calmed by parents within a few minutes when upset.'."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1-very inactive 2-inactive 3-somewhat inactive
										<BR>
										4-somewhat active 5-active 6-very active 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb01"
											FieldTextBoxTabIndex="104" FieldLabelText="1. Activity level-the amount of physical motion during daily routine."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very predictable 2-predictable 3-somewhat predictable
										<BR>
										4-somewhat unpredictable 5-unpredictable 6-very unpredictable 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb02"
											FieldTextBoxTabIndex="105" FieldLabelText="2. Predictability-regularity and consistency of social behavior."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-not hesitant 2-very slightly hesitant 3-somewhat hesitant
										<BR>
										4-moderately hesitant 5-hesitant 6-very hesitant 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb03"
											FieldTextBoxTabIndex="106" FieldLabelText="3. Approach-responses to new persons, places, events."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very quick to adapt 2-adaptable 3-somewhat adaptable 
										4-somewhat slow to adapt
										<BR>
										5-slow to adapt 6-very slow to adapt 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb04"
											FieldTextBoxTabIndex="107" FieldLabelText="4. Adaptability-the ease/difficulty with which your child can change to socially acceptable behavior."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very mild 2-mild 3-somewhat mild 4-somewhat intense
										<BR>
										5-intense 6-very intense 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb05"
											FieldTextBoxTabIndex="108" FieldLabelText="5. Intensity-the amount of energy in a response whether negative or positive."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very pleasant 2-pleasant 3-somewhat pleasant 4-somewhat 
										unpleasant
										<BR>
										5-unpleasant 6-very unpleasant 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb06"
											FieldTextBoxTabIndex="109" FieldLabelText="6. Mood-general amount of pleasant or unpleasant feelings."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very persistent 2-persistent 3-somewhat persistent 4-somewhat 
										nonpersistent
										<BR>
										5-nonpersistent 6-very nonpersistent 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb07"
											FieldTextBoxTabIndex="110" FieldLabelText="7. Persistence/Attention Span-how long your child stays with a task or activity. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-rarely distracted 2-seldom distracted 3-sometimes distracted
										<BR>
										4-regular1y distracted 5-often distracted 6-very often distracted 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb08"
											FieldTextBoxTabIndex="111" FieldLabelText="8. Distractibility-the effect of external stimuli (sounds, persons, etc.) on ongoing behavior."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very nonreactive 2-nonreactive 3-somewhat nonreactive 
										4-somewhat sensitive
										<BR>
										5-sensitive 6-very sensitive 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb09"
											FieldTextBoxTabIndex="112" FieldLabelText="9. Threshold-general sensitivity or insensitivity to stimuli (sound, odor, taste, light, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very easy 2 -easy 3-somewhat easy 4-somewhat difficult
										<BR>
										5-difficult 6-very difficult 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb10"
											FieldTextBoxTabIndex="113" FieldLabelText="10. How manageable is this child?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="115"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="116"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="117"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="118"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="115" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="116" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
