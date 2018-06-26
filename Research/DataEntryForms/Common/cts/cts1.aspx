
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="KTDissDataEntryForms.kt_cts1.kt_cts1" CodeFile="cts1.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="519,529" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="cts_pk" MeasureName="Todder Temperament Scale" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_cts" ShowScoreButton="True" LastScoredDateField="scored"
							LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<h3>Todder Temperament Scale</h3>
						<br>
						<A href="cts_lookup.aspx">Click here to enter other CTS versions.</A>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="ctsrat" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="ctsrat"
										FieldTextBoxTabIndex="3" FieldLabelText="Rater" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="ctsdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="ctsdate"
										FieldTextBoxTabIndex="4" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
										DatabaseField="ctsdob" FieldTextBoxTabIndex="4" FieldLabelText="DOB" IsDoubleEntryField="False" IsReadOnly="True"
										IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
										DatabaseField="ctsageym" FieldTextBoxTabIndex="4" FieldLabelText="AGE" IsDoubleEntryField="False"
										IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
							DatabaseField="ctsver" FieldTextBoxTabIndex="4" FieldLabelText="ctsver" IsDoubleEntryField="False"
							IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
							IsInsertField="True" FieldDataType="INT" FieldTextBoxTextDefault="1" FieldTextBoxCssClass="hideme"
							ShowFieldLabel="False"></def:datafieldcontrol>
						<asp:Panel id="mainPanel" Runat="server">
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
										<def:datafieldcontrol id="ctsact" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsact"
											FieldTextBoxTabIndex="122" DatabaseField="ctsact" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsactsd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsactsd"
											FieldTextBoxTabIndex="123" DatabaseField="ctsactsd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsactm" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsactm"
											FieldTextBoxTabIndex="124" DatabaseField="ctsactm" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsactdv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsactdv"
											FieldTextBoxTabIndex="125" DatabaseField="ctsactdv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Rhythmicity</TD>
									<TD>
										<def:datafieldcontrol id="ctsrhy" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsrhy"
											FieldTextBoxTabIndex="124" DatabaseField="ctsrhy" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsrhysd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsrhysd"
											FieldTextBoxTabIndex="125" DatabaseField="ctsrhysd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsrhym" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsrhym"
											FieldTextBoxTabIndex="128" DatabaseField="ctsrhym" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsrhydv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsrhydv"
											FieldTextBoxTabIndex="129" DatabaseField="ctsrhydv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Approach</TD>
									<TD>
										<def:datafieldcontrol id="ctsapp" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsapp"
											FieldTextBoxTabIndex="126" DatabaseField="ctsapp" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsappsd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsappsd"
											FieldTextBoxTabIndex="127" DatabaseField="ctsappsd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsappm" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsappm"
											FieldTextBoxTabIndex="132" DatabaseField="ctsappm" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsappdv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsappdv"
											FieldTextBoxTabIndex="133" DatabaseField="ctsappdv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Adaptability</TD>
									<TD>
										<def:datafieldcontrol id="ctsada" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsada"
											FieldTextBoxTabIndex="128" DatabaseField="ctsada" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsadasd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsadasd"
											FieldTextBoxTabIndex="129" DatabaseField="ctsadasd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsadam" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsadam"
											FieldTextBoxTabIndex="136" DatabaseField="ctsadam" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsadadv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsadadv"
											FieldTextBoxTabIndex="137" DatabaseField="ctsadadv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Intensity</TD>
									<TD>
										<def:datafieldcontrol id="ctsint" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsint"
											FieldTextBoxTabIndex="130" DatabaseField="ctsint" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsintsd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsintsd"
											FieldTextBoxTabIndex="131" DatabaseField="ctsintsd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsintm" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsintm"
											FieldTextBoxTabIndex="140" DatabaseField="ctsintm" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsintdv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsintdv"
											FieldTextBoxTabIndex="141" DatabaseField="ctsintdv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Mood</TD>
									<TD>
										<def:datafieldcontrol id="ctsmoo" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsmoo"
											FieldTextBoxTabIndex="132" DatabaseField="ctsmoo" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsmoosd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsmoosd"
											FieldTextBoxTabIndex="133" DatabaseField="ctsmoosd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsmoom" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsmoom"
											FieldTextBoxTabIndex="144" DatabaseField="ctsmoom" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsmoodv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsmoodv"
											FieldTextBoxTabIndex="145" DatabaseField="ctsmoodv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Persistence</TD>
									<TD>
										<def:datafieldcontrol id="ctsper" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsper"
											FieldTextBoxTabIndex="134" DatabaseField="ctsper" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctspersd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctspersd"
											FieldTextBoxTabIndex="135" DatabaseField="ctspersd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsperm" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsperm"
											FieldTextBoxTabIndex="148" DatabaseField="ctsperm" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsperdv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsperdv"
											FieldTextBoxTabIndex="149" DatabaseField="ctsperdv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Distractibility</TD>
									<TD>
										<def:datafieldcontrol id="ctsdis" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsdis"
											FieldTextBoxTabIndex="136" DatabaseField="ctsdis" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsdissd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsdissd"
											FieldTextBoxTabIndex="137" DatabaseField="ctsdissd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsdism" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsdism"
											FieldTextBoxTabIndex="152" DatabaseField="ctsdism" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsdisdv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsdisdv"
											FieldTextBoxTabIndex="153" DatabaseField="ctsdisdv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Threshold</TD>
									<TD>
										<def:datafieldcontrol id="ctsthr" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsthr"
											FieldTextBoxTabIndex="138" DatabaseField="ctsthr" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsthrsd" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsthrsd"
											FieldTextBoxTabIndex="139" DatabaseField="ctsthrsd" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsthrm" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsthrm"
											FieldTextBoxTabIndex="156" DatabaseField="ctsthrm" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ctsthrdv" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ctsthrdv"
											FieldTextBoxTabIndex="157" DatabaseField="ctsthrdv" FormatString="{0:f}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ctsscrmsg" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Status:"
								FieldTextBoxTabIndex="140" DatabaseField="ctsscrmsg" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=ALMOST NEVER 2=RARELY 3=VARIABLE, USUALLY NOT
										<BR>
										4=VARIABLE, USUALLY DOES 5=FREQUENTLY 6=ALMOST ALWAYS 9=MISSING</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa001" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. The child gets sleepy at about the same time each evening (within 1/2 hour)"
											FieldTextBoxTabIndex="5" DatabaseField="ctsa001" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa002" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. The child fidgets during quiet activities (story telling, looking at pictures)."
											FieldTextBoxTabIndex="6" DatabaseField="ctsa002" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa003" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. The child takes feedings quietly with mild expressions of likes and dislikes"
											FieldTextBoxTabIndex="7" DatabaseField="ctsa003" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa004" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. The child is pleasant (smiles, laughs) when first arriving in unfamiliar places."
											FieldTextBoxTabIndex="8" DatabaseField="ctsa004" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa005" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. A child's initial reaction to seeing the doctor is acceptance"
											FieldTextBoxTabIndex="9" DatabaseField="ctsa005" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa006" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. The child pays attention to games with parent for only a minute or so."
											FieldTextBoxTabIndex="10" DatabaseField="ctsa006" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa007" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. The child's bowel movements come at different times from day to day (over I-hour difference)."
											FieldTextBoxTabIndex="11" DatabaseField="ctsa007" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa008" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. The child is fussy on waking up (frowns, complains, cries)"
											FieldTextBoxTabIndex="12" DatabaseField="ctsa008" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa009" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. The child's initial reaction to a new babysitter is rejection (crying, clinging to mother, etc.)."
											FieldTextBoxTabIndex="13" DatabaseField="ctsa009" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa010" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. The child reacts to a disliked food even if it is mixed with a preferred one"
											FieldTextBoxTabIndex="14" DatabaseField="ctsa010" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa011" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. The child accepts delays (for several minutes) for desired objects or activities (snacks, treats, gifts)"
											FieldTextBoxTabIndex="15" DatabaseField="ctsa011" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa012" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. The child moves little (stays still) when being dressed"
											FieldTextBoxTabIndex="16" DatabaseField="ctsa012" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa013" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. The child continues an activity in spite of noises in the same room"
											FieldTextBoxTabIndex="17" DatabaseField="ctsa013" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa014" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. The child shows strong reactions (cries, stamps feet) to failure."
											FieldTextBoxTabIndex="18" DatabaseField="ctsa014" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa015" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. The child plays continuously for more than 10 minutes at a time with a favorite toy."
											FieldTextBoxTabIndex="19" DatabaseField="ctsa015" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa016" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. The child ignores the temperature of food, whether hot or cold"
											FieldTextBoxTabIndex="20" DatabaseField="ctsa016" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa017" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. The child varies from day to day in wanting a bottle or snack before bedtime at night."
											FieldTextBoxTabIndex="21" DatabaseField="ctsa017" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa018" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. The child sits still while waiting for food"
											FieldTextBoxTabIndex="22" DatabaseField="ctsa018" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa019" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. The child is easily excited by praise (laughs, yells, jumps)."
											FieldTextBoxTabIndex="23" DatabaseField="ctsa019" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa020" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. The child cries after a fall or bump."
											FieldTextBoxTabIndex="24" DatabaseField="ctsa020" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa021" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. The child approaches and plays with unfamiliar pets (small dogs, cats)"
											FieldTextBoxTabIndex="25" DatabaseField="ctsa021" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa022" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. The child stops eating and looks up when a person walks by."
											FieldTextBoxTabIndex="26" DatabaseField="ctsa022" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa023" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. The child seems unaware of differences in taste of familiar liquids (type of milk, different juices)."
											FieldTextBoxTabIndex="27" DatabaseField="ctsa023" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa024" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. The child moves about actively when he/she explores new places (runs, climbs or jumps)."
											FieldTextBoxTabIndex="28" DatabaseField="ctsa024" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa025" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. The child fusses or whines when bottom is cleaned after bowel movement."
											FieldTextBoxTabIndex="29" DatabaseField="ctsa025" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa026" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. The child smiles when played with by unfamiliar adults."
											FieldTextBoxTabIndex="30" DatabaseField="ctsa026" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa027" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. The child looks up from play when mother enters the room"
											FieldTextBoxTabIndex="31" DatabaseField="ctsa027" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa028" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. The child spends over an hour reading a book or looking at the pictures."
											FieldTextBoxTabIndex="32" DatabaseField="ctsa028" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa029" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. The child responds intensely (screams, yells) to frustration"
											FieldTextBoxTabIndex="33" DatabaseField="ctsa029" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa030" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. The child eats about the same amount of solid food at meals from day to day."
											FieldTextBoxTabIndex="34" DatabaseField="ctsa030" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa031" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. The child remains pleasant when hungry and waiting for food to be prepared"
											FieldTextBoxTabIndex="35" DatabaseField="ctsa031" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa032" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. The child allows face washing without protest (squirming, turning away)"
											FieldTextBoxTabIndex="36" DatabaseField="ctsa032" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa033" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. The amount of milk or juice the child takes at mealtime is unpredictable from meal to meal (over 2 oz. difference)"
											FieldTextBoxTabIndex="37" DatabaseField="ctsa033" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa034" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. The child practices physical activities (climbing, jumping, pushing objects) for under 5 minutes."
											FieldTextBoxTabIndex="38" DatabaseField="ctsa034" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa035" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. The child vigorously resists additional food or milk when full (spits out, clamps mouth closed, bats at spoon, etc.)"
											FieldTextBoxTabIndex="39" DatabaseField="ctsa035" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa036" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. The child plays actively (bangs, throws, runs) with toy indoors."
											FieldTextBoxTabIndex="40" DatabaseField="ctsa036" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa037" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. The child ignores voices when playing with a favorite toy."
											FieldTextBoxTabIndex="41" DatabaseField="ctsa037" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa038" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. The child approaches (moves toward) new visitors at home."
											FieldTextBoxTabIndex="42" DatabaseField="ctsa038" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa039" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. The child plays outside on hot or cold days without seeming to notice differences in temperature."
											FieldTextBoxTabIndex="43" DatabaseField="ctsa039" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa040" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. The child continues playing with other children for under 5 minutes and then goes elsewhere."
											FieldTextBoxTabIndex="44" DatabaseField="ctsa040" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa041" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. The child continues to look at a picture book in spite of distracting noises (car horns, doorbell)."
											FieldTextBoxTabIndex="45" DatabaseField="ctsa041" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa042" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. The child wants a snack at a different time each day (over 1- hour difference)."
											FieldTextBoxTabIndex="46" DatabaseField="ctsa042" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa043" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. The child is pleasant (smiles) when put down for nap or at night."
											FieldTextBoxTabIndex="47" DatabaseField="ctsa043" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa044" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. The child takes several days to get used to (show usual behavior in) new situations away from parent (play group, day care center, sitter)."
											FieldTextBoxTabIndex="48" DatabaseField="ctsa044" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa045" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. The child speaks (or vocalizes) right away to unfamiliar adults."
											FieldTextBoxTabIndex="49" DatabaseField="ctsa045" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa046" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. The child reacts strongly (cries or screams) when unable to complete a play activity."
											FieldTextBoxTabIndex="50" DatabaseField="ctsa046" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa047" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. The child enjoys games with running and jumping more than games done sitting down."
											FieldTextBoxTabIndex="51" DatabaseField="ctsa047" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa048" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. The child notices wet clothing and wants to be changed right away."
											FieldTextBoxTabIndex="52" DatabaseField="ctsa048" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa049" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. The child is fussy or moody throughout a cold or an intestinal virus."
											FieldTextBoxTabIndex="53" DatabaseField="ctsa049" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa050" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. The child ignores parent's first call while watching a favorite TV program."
											FieldTextBoxTabIndex="54" DatabaseField="ctsa050" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa051" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. A child loses interest in a new toy or game within an hour."
											FieldTextBoxTabIndex="55" DatabaseField="ctsa051" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa052" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. The child runs to get where he/she wants to go."
											FieldTextBoxTabIndex="56" DatabaseField="ctsa052" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa053" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. For the first few minutes in a new place (store, home, or, vacation place) the child is wary (clings to mother, holds back)."
											FieldTextBoxTabIndex="57" DatabaseField="ctsa053" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa054" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. The child takes daytime naps at differing times (over 1/2-hour difference) from day to day."
											FieldTextBoxTabIndex="58" DatabaseField="ctsa054" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa055" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. The child reacts mildly (frown or smile) when his/her play is interrupted by parent."
											FieldTextBoxTabIndex="59" DatabaseField="ctsa055" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa056" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="56. The child accepts being dressed and undressed without protest."
											FieldTextBoxTabIndex="60" DatabaseField="ctsa056" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa057" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. The child is outgoing with adult strangers outside the home."
											FieldTextBoxTabIndex="61" DatabaseField="ctsa057" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa058" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. The child runs ahead when walking with the parent."
											FieldTextBoxTabIndex="62" DatabaseField="ctsa058" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa059" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="59. The child's period of greatest physical activity comes at same time of day."
											FieldTextBoxTabIndex="63" DatabaseField="ctsa059" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa060" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="60. The child can be coaxed out of a forbidden activity."
											FieldTextBoxTabIndex="64" DatabaseField="ctsa060" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa061" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="61. The child stops play and watches when someone walks by. ;."
											FieldTextBoxTabIndex="65" DatabaseField="ctsa061" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa062" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="62. The child goes back to the same activity after brief interruption (snack, trip to toilet)."
											FieldTextBoxTabIndex="66" DatabaseField="ctsa062" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa063" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="63. The child laughs or smiles when meeting other children."
											FieldTextBoxTabIndex="67" DatabaseField="ctsa063" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa064" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="64. The child sits still while watching TV or listening to music."
											FieldTextBoxTabIndex="68" DatabaseField="ctsa064" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa065" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="65. The child will avoid repetition of misbehavior if punished firmly once or twice.,"
											FieldTextBoxTabIndex="69" DatabaseField="ctsa065" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa066" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="66. The child continues to play with a toy in spite of sudden noises from outdoors (car horn, siren, etc.)."
											FieldTextBoxTabIndex="70" DatabaseField="ctsa066" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa067" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="67. The child ignores dirt on himself/herself."
											FieldTextBoxTabIndex="71" DatabaseField="ctsa067" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa068" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="68. The child's time of waking in the morning varies greatly (by 1 hour or more) from day to day."
											FieldTextBoxTabIndex="72" DatabaseField="ctsa068" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa069" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="69. The child has moody or 'off' days when he/she is fussy all day."
											FieldTextBoxTabIndex="73" DatabaseField="ctsa069" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa070" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="70. The child reacts mildly (frown or smile) when another child takes his/her toy."
											FieldTextBoxTabIndex="74" DatabaseField="ctsa070" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa071" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="71. The child stays with a routine task (dressing, picking up toys) up to 5 minutes or more."
											FieldTextBoxTabIndex="75" DatabaseField="ctsa071" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa072" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="72. The child stops eating and looks when he/she hears an unusual noise (telephone, doorbell)."
											FieldTextBoxTabIndex="76" DatabaseField="ctsa072" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa073" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="73. The child sits still (moves little) during procedures like hair brushing or nail cutting."
											FieldTextBoxTabIndex="77" DatabaseField="ctsa073" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa074" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="74. The child shows much body movement (stomps, writhes, swings arms) when upset or crying."
											FieldTextBoxTabIndex="78" DatabaseField="ctsa074" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa075" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="75. The child is pleasant (smiles, laughs) during face washing."
											FieldTextBoxTabIndex="79" DatabaseField="ctsa075" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa076" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="76. The child's initial reaction at home to approach by strangers is acceptance (looks at, reaches out)."
											FieldTextBoxTabIndex="80" DatabaseField="ctsa076" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa077" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="77. The child is hungry at dinner time."
											FieldTextBoxTabIndex="81" DatabaseField="ctsa077" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa078" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="78. The child continues to get into forbidden areas or objects in spite of parents' repeated warnings."
											FieldTextBoxTabIndex="82" DatabaseField="ctsa078" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa079" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="79. The child stops to examine new objects thoroughly (5 minutes or more)."
											FieldTextBoxTabIndex="83" DatabaseField="ctsa079" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa080" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="80. The child ignores odors (cooking, smoke, perfume) whether pleasant or not."
											FieldTextBoxTabIndex="84" DatabaseField="ctsa080" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa081" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="81. The child looks up from an activity when he/she hears the sounds of children playing."
											FieldTextBoxTabIndex="85" DatabaseField="ctsa081" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa082" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="82. The child falls asleep in about the same length of time after being put to bed."
											FieldTextBoxTabIndex="86" DatabaseField="ctsa082" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa083" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="83. The child greets babysitter loudly with much expression of feeling, whether positive or negative."
											FieldTextBoxTabIndex="87" DatabaseField="ctsa083" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa084" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="84. The child is moody for more than a few minutes when corrected or disciplined."
											FieldTextBoxTabIndex="88" DatabaseField="ctsa084" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa085" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="85. The child sits still (little squinning) while traveling in car or stroller."
											FieldTextBoxTabIndex="89" DatabaseField="ctsa085" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa086" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="86. The child watches TV for under 10 minutes, then turns to another activity."
											FieldTextBoxTabIndex="90" DatabaseField="ctsa086" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa087" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="87. The child is shy (turns away or clings to mother) on meeting another child for the first time."
											FieldTextBoxTabIndex="91" DatabaseField="ctsa087" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa088" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="88. The child is still wary of strangers after 15 minutes."
											FieldTextBoxTabIndex="92" DatabaseField="ctsa088" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa089" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="89. The child frets or cries when fITst learning a new task (dressing self, picking up toys)."
											FieldTextBoxTabIndex="93" DatabaseField="ctsa089" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa090" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="90. The child sits quietly in the bath."
											FieldTextBoxTabIndex="94" DatabaseField="ctsa090" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa091" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="91. The child practices a new skill (throwing, piling, drawing) for 10 minutes or more."
											FieldTextBoxTabIndex="95" DatabaseField="ctsa091" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa092" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="92. The child ignores differences in taste or consistency of familiar foods."
											FieldTextBoxTabIndex="96" DatabaseField="ctsa092" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa093" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="93. The child sleeps poorly (restless, wakeful) in new places for first two or three times"
											FieldTextBoxTabIndex="97" DatabaseField="ctsa093" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa094" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="94. Child is fearful of being put down in an unfamiliar place (supermarket cart, new stroller, playpen) with parent present."
											FieldTextBoxTabIndex="98" DatabaseField="ctsa094" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa095" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="95. The child frowns or complains when left to play by self."
											FieldTextBoxTabIndex="99" DatabaseField="ctsa095" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa096" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="96. The child accepts within 10 minutes (feels at home, at ease) new surroundings (home, store, play area)."
											FieldTextBoxTabIndex="100" DatabaseField="ctsa096" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsa097" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="97. The child looks up from play when the telephone or doorbell rings."
											FieldTextBoxTabIndex="101" DatabaseField="ctsa097" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1-very inactive 2-inactive 3-somewhat inactive
										<BR>
										4-somewhat active 5-active 6-very active 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Activity level-the amount of physical motion during daily routine.,."
											FieldTextBoxTabIndex="102" DatabaseField="ctsb01" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very regular 2-regular 3-somewhat regular
										<BR>
										4-somewhat irregular 5-irregular 6-very irregular 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Rhythmicity-regularity of bodily functioning in sleep, hunger, bowel movements, etc."
											FieldTextBoxTabIndex="103" DatabaseField="ctsb02" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-not hesitant 2-very slightly hesitant 3-somewhat hesitant
										<BR>
										4-moderately hesitant 5-hesitant 6-very hesitant 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Approach-responses to new persons,places,events."
											FieldTextBoxTabIndex="104" DatabaseField="ctsb03" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very quick to adapt 2-adapta6le 3-somewhat adapta6le
										<BR>
										4-somewhat slow to adapt 5-slow to adapt 6-very slow to adapt 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Adaptability-the ease/difficulty with which your toddler can change to socially acceptable behavior."
											FieldTextBoxTabIndex="105" DatabaseField="ctsb04" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very mild 2-mild 3-somewhat mild
										<BR>
										4-somewhat intense 5-intense 6-very intense 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Intensity-the amount of energy in a response, whether negative or positive."
											FieldTextBoxTabIndex="106" DatabaseField="ctsb05" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very pleasant 2-pleasant 3-somewhat pleasant
										<BR>
										4-somewhat unpleasant 5-unpleasant 6-very unpleasant 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Mood-general amount of pleasant or unpleasant feelings."
											FieldTextBoxTabIndex="107" DatabaseField="ctsb06" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very persistent 2-persistent 3-somewhat persistent
										<BR>
										4-somewhat nonpersistent 5-nonpersistent 6-very nonpersistent 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Persistence/Attention Span-how long your toddler stays with a task or activity."
											FieldTextBoxTabIndex="108" DatabaseField="ctsb07" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-rarely distracted 2-seldom distracted 3-sometimes distracted
										<BR>
										4-regularly distracted 5-often distracted 6-very often distracted 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Distractibility-the effect of external stimuli (sounds, persons, ete.) on ongoing behavior."
											FieldTextBoxTabIndex="109" DatabaseField="ctsb08" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very nonreactive 2-nonreactive 3-somewhat non reactive
										<BR>
										4-somewhat sensitive 5-sensitive 6-very sensitive 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Threshold-general sensitivity or insensitivity to stimuli (sound, odor, taste, light, etc.)."
											FieldTextBoxTabIndex="110" DatabaseField="ctsb09" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1-very easy 2-easy 3-somewhat easy
										<BR>
										4-somewhat difficult 5-difficult 6-very difficult 9-Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ctsb10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. How manageable is this toddler? ."
											FieldTextBoxTabIndex="111" DatabaseField="ctsb10" FieldLabelWidth="475px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="113" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="114" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="115" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="116" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scored" FieldTextBoxTabIndex="115" DatabaseField="scored"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scoredBy" FieldTextBoxTabIndex="116" DatabaseField="scoredBy"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel></asp:Content>
