
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="KTDissDataEntryForms.kt_cts2.kt_cts2" CodeFile="cts2.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_cts" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Behavioral Style Questionnaire"
							PrimaryKeyField="cts_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="519,529"
							ShowScoreButton="True" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<h3>Behavioral Style Questionnaire</h3>
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
							FieldTextBoxCssClass="hideme" FieldTextBoxTextDefault="2"></def:datafieldcontrol>
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
											FieldTextBoxTabIndex="5" FieldLabelText="1. The child is moody for more than a few minutes when corrected or disciplined."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa002" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa002"
											FieldTextBoxTabIndex="6" FieldLabelText="2. The child seems not to hear when involved in a favorite activity. ,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa003" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa003"
											FieldTextBoxTabIndex="7" FieldLabelText="3. The child can be coaxed out of a forbidden activity.,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa004" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa004"
											FieldTextBoxTabIndex="8" FieldLabelText="4. The child runs ahead when walking with the parent." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa005" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa005"
											FieldTextBoxTabIndex="9" FieldLabelText="5. The child laughs and smiles while playing." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa006" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa006"
											FieldTextBoxTabIndex="10" FieldLabelText="6. The child moves slowly when working on a project or activity."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa007" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa007"
											FieldTextBoxTabIndex="11" FieldLabelText="7. The child responds intensely to disapproval." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa008" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa008"
											FieldTextBoxTabIndex="12" FieldLabelText="8. The child needs a period of adjustment to get used to changes in school or at home."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa009" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa009"
											FieldTextBoxTabIndex="13" FieldLabelText="9. The child enjoys games that involve running or jumping."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa010" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa010"
											FieldTextBoxTabIndex="14" FieldLabelText="10. The child is slow to adjust to changes in household rules. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa011" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa011"
											FieldTextBoxTabIndex="15" FieldLabelText="11. The child has bowel movements at about the same time each day. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa012" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa012"
											FieldTextBoxTabIndex="16" FieldLabelText="12. The child is willing to try new things." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa013" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa013"
											FieldTextBoxTabIndex="17" FieldLabelText="13. The child sits calmly while watching TV or listening to music."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa014" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa014"
											FieldTextBoxTabIndex="18" FieldLabelText="14. The child leaves or wants to leave the table during meals."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa015" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa015"
											FieldTextBoxTabIndex="19" FieldLabelText="15. Change in plans bother the child." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa016" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa016"
											FieldTextBoxTabIndex="20" FieldLabelText="16. The child notices minor changes in mother's dress or appearance (clothing, hairstyle, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa017" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa017"
											FieldTextBoxTabIndex="21" FieldLabelText="17. The child does not acknowledge a call to come in if involved in something. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa018" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa018"
											FieldTextBoxTabIndex="22" FieldLabelText="18. The child responds to mild disapproval by the parent (a frown or shake of the head)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa019" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa019"
											FieldTextBoxTabIndex="23" FieldLabelText="19. The child settles arguments with playmates within a few minutes."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa020" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa020"
											FieldTextBoxTabIndex="24" FieldLabelText="20. The child shows strong reaction to things, both positive and negative."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa021" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa021"
											FieldTextBoxTabIndex="25" FieldLabelText="21. The child had trouble leaving the mother the first three days when he/she entered school."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa022" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa022"
											FieldTextBoxTabIndex="26" FieldLabelText="22. The child picks up the nuances or subtleties of parental explanations (example: implied meaning)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa023" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa023"
											FieldTextBoxTabIndex="27" FieldLabelText="23. The child falls asleep as soon as he/she is put to bed."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa024" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa024"
											FieldTextBoxTabIndex="28" FieldLabelText="24. The child moves about actively when he/she explores new places."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa025" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa025"
											FieldTextBoxTabIndex="29" FieldLabelText="25. The child likes to go to new places rather than familiar ones. ,."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa026" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa026"
											FieldTextBoxTabIndex="30" FieldLabelText="26. The child sits quietly while waiting." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa027" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa027"
											FieldTextBoxTabIndex="31" FieldLabelText="27. The child spends over an hour reading a book or looking at the pictures. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa028" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa028"
											FieldTextBoxTabIndex="32" FieldLabelText="28. The child learns new things at his/her level quickly and easily."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa029" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa029"
											FieldTextBoxTabIndex="33" FieldLabelText="29. The child smiles or laughs when he/she meets new visitors at home. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa030" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa030"
											FieldTextBoxTabIndex="34" FieldLabelText="30. The child is easily excited by praise.'" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa031" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa031"
											FieldTextBoxTabIndex="35" FieldLabelText="31. The child is outgoing with strangers." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa032" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa032"
											FieldTextBoxTabIndex="36" FieldLabelText="32. The child fidgets when he/she has to stay still." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa033" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa033"
											FieldTextBoxTabIndex="37" FieldLabelText="33. The child says he/she is 'bored' with his/her toys and games. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa034" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa034"
											FieldTextBoxTabIndex="38" FieldLabelText="34. The child is annoyed at interrupting play to comply with a parental request."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa035" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa035"
											FieldTextBoxTabIndex="39" FieldLabelText="35. The child practices an activity until he/she masters it."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa036" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa036"
											FieldTextBoxTabIndex="40" FieldLabelText="36. The child eats about the same amount at supper from day to day."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa037" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa037"
											FieldTextBoxTabIndex="41" FieldLabelText="37. Unusual noises (sirens, thunder, etc.) interrupt the child's behavior. '"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa038" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa038"
											FieldTextBoxTabIndex="42" FieldLabelText="38. The child complains when tired." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa039" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa039"
											FieldTextBoxTabIndex="43" FieldLabelText="39. The child loses interest in a new toy or game the same day."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa040" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa040"
											FieldTextBoxTabIndex="44" FieldLabelText="40. The child becomes engrossed in an interesting activity for one half hour or more."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa041" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa041"
											FieldTextBoxTabIndex="45" FieldLabelText="41. The child cries intensely when hurt." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa042" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa042"
											FieldTextBoxTabIndex="46" FieldLabelText="42. The child reacts strongly to kidding or light-hearted comments."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa043" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa043"
											FieldTextBoxTabIndex="47" FieldLabelText="43. The child approaches children his/her age that he/she doesn't know."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa044" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa044"
											FieldTextBoxTabIndex="48" FieldLabelText="44. The child plays quietly with his/her toys and games."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa045" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa045"
											FieldTextBoxTabIndex="49" FieldLabelText="45. The child is outwardly expressive of his/her emotions. .  ."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa046" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa046"
											FieldTextBoxTabIndex="50" FieldLabelText="46. The child is enthusiastic when he/she masters an activity and wants to show everyone."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa047" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa047"
											FieldTextBoxTabIndex="51" FieldLabelText="47. The child is sleepy at his/her bed-time." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa048" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa048"
											FieldTextBoxTabIndex="52" FieldLabelText="48. The child stops an activity because something else catches his/her attention."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa049" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa049"
											FieldTextBoxTabIndex="53" FieldLabelText="49. The child is hungry at dinner time." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa050" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa050"
											FieldTextBoxTabIndex="54" FieldLabelText="50. The child holds back until sure of himself /herself."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa051" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa051"
											FieldTextBoxTabIndex="55" FieldLabelText="51. The child looks up when someone walks past the door-way."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa052" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa052"
											FieldTextBoxTabIndex="56" FieldLabelText="52. The child becomes upset if he/she misses a regular television program."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa053" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa053"
											FieldTextBoxTabIndex="57" FieldLabelText="53. The child reacts strongly (cries or complains) to a disappointment or failure."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa054" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa054"
											FieldTextBoxTabIndex="58" FieldLabelText="54. The child accepts new foods within one or two tries."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa055" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa055"
											FieldTextBoxTabIndex="59" FieldLabelText="55. The child has difficulty getting used to new situations."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa056" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa056"
											FieldTextBoxTabIndex="60" FieldLabelText="56. The child will avoid misbehavior if punished firmly once or twice."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa057" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa057"
											FieldTextBoxTabIndex="61" FieldLabelText="57. The child is sensitive to noises (television, doorbell) and looks up right away."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa058" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa058"
											FieldTextBoxTabIndex="62" FieldLabelText="58. The child prefers active outdoor play to quite play inside."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa059" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa059"
											FieldTextBoxTabIndex="63" FieldLabelText="59. The child dislikes milk and other drinks if not ice cold."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa060" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa060"
											FieldTextBoxTabIndex="64" FieldLabelText="60. The child notices differences or changes in the consistency offoOO."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa061" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa061"
											FieldTextBoxTabIndex="65" FieldLabelText="61. The child adjusts easily to changes in his/her routine."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa062" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa062"
											FieldTextBoxTabIndex="66" FieldLabelText="62. The child eats about the same amount at breakfast from day to day."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa063" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa063"
											FieldTextBoxTabIndex="67" FieldLabelText="63. The child seems to take setbacks in stride." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa064" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa064"
											FieldTextBoxTabIndex="68" FieldLabelText="64. The child cries and whines when frustrated." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa065" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa065"
											FieldTextBoxTabIndex="69" FieldLabelText="65. The child repeats behavior for which he/she has previously been punished."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa066" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa066"
											FieldTextBoxTabIndex="70" FieldLabelText="66. The child looks up from playing when the telephone rings."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa067" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa067"
											FieldTextBoxTabIndex="71" FieldLabelText="67. The child is willing to try new foods." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa068" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa068"
											FieldTextBoxTabIndex="72" FieldLabelText="68. The child needs encouragement before he/she will try new things."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa069" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa069"
											FieldTextBoxTabIndex="73" FieldLabelText="69. The child cries or whines when ill with a cold or upset stomach."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa070" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa070"
											FieldTextBoxTabIndex="74" FieldLabelText="70. The child runs to get where he/she want to go." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa071" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa071"
											FieldTextBoxTabIndex="75" FieldLabelText="71. The child's attention drifts away or lapses when listening to parental instructions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa072" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa072"
											FieldTextBoxTabIndex="76" FieldLabelText="72. The child becomes angry with one of his/her playmates."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa073" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa073"
											FieldTextBoxTabIndex="77" FieldLabelText="73. The child is reluctant to give up when trying to do a difficult task."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa074" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa074"
											FieldTextBoxTabIndex="78" FieldLabelText="74. The child reacts to mild approval from the parent (a nod or smile)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa075" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa075"
											FieldTextBoxTabIndex="79" FieldLabelText="75. The child requests 'something to eat' between meals and regular snacks."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa076" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa076"
											FieldTextBoxTabIndex="80" FieldLabelText="76. The child rushes to greet the parent or greets loudly after absence during the day."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa077" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa077"
											FieldTextBoxTabIndex="81" FieldLabelText="77. The child looks up when he/she hears voices in the next room."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa078" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa078"
											FieldTextBoxTabIndex="82" FieldLabelText="78. The child protests when denied a request by the parent.,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa079" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa079"
											FieldTextBoxTabIndex="83" FieldLabelText="79. The child ignores loud noises when reading or looking at pictures in a book."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa080" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa080"
											FieldTextBoxTabIndex="84" FieldLabelText="80. The child dislikes a food that he/she had previously seemed to accept. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa081" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa081"
											FieldTextBoxTabIndex="85" FieldLabelText="81. The child stops what he/she is doing and looks up when the parent enters the room"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa082" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa082"
											FieldTextBoxTabIndex="86" FieldLabelText="82. The child cries for more than a few minutes when hurt. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa083" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa083"
											FieldTextBoxTabIndex="87" FieldLabelText="83. The child watches a long (1 hour or more) TV program without getting up to do something else"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa084" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa084"
											FieldTextBoxTabIndex="88" FieldLabelText="84. The child spontaneously wakes up at the usual time on the weekends and holidays."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa085" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa085"
											FieldTextBoxTabIndex="89" FieldLabelText="85. The child responds to sounds or noises unrelated to his/her activity.'."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa086" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa086"
											FieldTextBoxTabIndex="90" FieldLabelText="86. The child avoids new guests or visitors. ,.'" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa087" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa087"
											FieldTextBoxTabIndex="91" FieldLabelText="87. The child fidgets when a story is being read to him/her.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa088" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa088"
											FieldTextBoxTabIndex="92" FieldLabelText="88. The child becomes upset or cries over minor falls or bumps. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa089" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa089"
											FieldTextBoxTabIndex="93" FieldLabelText="89. The child interrupts an activity to listen to conversation around him/her.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa090" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa090"
											FieldTextBoxTabIndex="94" FieldLabelText="90. The child is unwilling to leave a play activity that he/she has not completed.,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa091" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa091"
											FieldTextBoxTabIndex="95" FieldLabelText="91. The child is able to fall asleep when there is conversation in a nearby room. '"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa092" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa092"
											FieldTextBoxTabIndex="96" FieldLabelText="92. The child becomes higWy excited when presented with new toy or game.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa093" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa093"
											FieldTextBoxTabIndex="97" FieldLabelText="93. The child pays attention from start to finish when the parent tries to explain something to him/her."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa094" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa094"
											FieldTextBoxTabIndex="98" FieldLabelText="94. The child speaks so quickly that it is sometimes difficult to understand him/her.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa095" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa095"
											FieldTextBoxTabIndex="99" FieldLabelText="95. The child wants to leave the table during meals to answer the doorbell or phone."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa096" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa096"
											FieldTextBoxTabIndex="100" FieldLabelText="96. The child complains of events in school or with playmates that day.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa097" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa097"
											FieldTextBoxTabIndex="101" FieldLabelText="97. The child frowns when asked to do a chore by the parent. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa098" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa098"
											FieldTextBoxTabIndex="102" FieldLabelText="98. The child tends to hold back in new situations. '."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa099" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa099"
											FieldTextBoxTabIndex="103" FieldLabelText="99. The child laughs hard while watching television cartoons or comedy."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa100" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsa100"
											FieldTextBoxTabIndex="104" FieldLabelText="100. The child has 'off' days when he/she is moody or cranky.'."
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
											FieldTextBoxTabIndex="105" FieldLabelText="1. Activity level - the amount of physical motion during daily routine.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very regular 2-regular 3-somewhat regular
										<BR>
										4-somewhat irregular 5-irregular 6-very irregular 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb02"
											FieldTextBoxTabIndex="106" FieldLabelText="2. Rhythmicity - regularity of bodily functioning in sleep, hunger, bowel movements, etc. ,"
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
											FieldTextBoxTabIndex="107" FieldLabelText="3. Approach - responses to new persons,places,events.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very quick to adapt 2-adaptable 3-somewhat adaptable
										<BR>
										4-somewhat slow to adapt 5-slow to adapt 6-very slow to adapt 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb04"
											FieldTextBoxTabIndex="108" FieldLabelText="4. Adaptability - the ease/difficulty with which your child can change to socially acceptable behavior."
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
											FieldTextBoxTabIndex="109" FieldLabelText="5. Intensity - the amount of energy in a response whether negative or positive."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very pleasant 2-pleasant 3-somewhat pleasant
										<BR>
										4-somewhat unpleasant 5-unpleasant 6-very unpleasant 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb06"
											FieldTextBoxTabIndex="110" FieldLabelText="6. Mood - general amount of pleasant or unpleasant feelings. ,"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very persistence 2-persistent 3-somewhat persistent
										<BR>
										4-somewhat nonpersistent 5-nonpersistent 6-very nonpersistent 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb07"
											FieldTextBoxTabIndex="111" FieldLabelText="7. Persistence/Attention Span - how long your child stays with a task or activity."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-rarely distracted 2-seldom distracted 3-sometimes distracted
										<BR>
										4-regularly distracted 5-often distracted 6-very often distracted 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb08"
											FieldTextBoxTabIndex="112" FieldLabelText="8. Distractibility - the effect of external stimuli (sounds, persons, etc.) on ongoing behavior.'"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very nonreactive 2-nonreactive 3-somewhat nonreactive
										<BR>
										4-somewhat sensitive 5-sensitive 6-very sensitive 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb09"
											FieldTextBoxTabIndex="113" FieldLabelText="9. Threshold - general sensitivity or insensitivity to stimuli (sound, odor, taste, light, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very easy 2-easy 3-somewhat easy 4-somewhat difficult
										<BR>
										5-difficult 6-very difficult 9-Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="475px" DatabaseField="ctsb10"
											FieldTextBoxTabIndex="114" FieldLabelText="10. How manageable is this child?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="116"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="117"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="118"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="119"
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
