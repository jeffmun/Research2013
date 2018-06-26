<%@ Page language="c#" Inherits="GenericDataEntryForms.hpdt.hpdt" CodeFile="hpdt.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="False"
							VerifiedField="verified" PrimaryKeyField="hp_pk" MeasureName="Hand Preference Test" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_hpdt" AllowedStudyMeasures="760"></def:dataentrycontroller>
						<table id="table_insert" class="tblinsert">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="ID" FieldLabelWidth="60px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hpdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="5" DatabaseField="hpdate" FieldLabelWidth="60px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hpexp" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="6" DatabaseField="hpexp" FieldLabelWidth="60px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="hppar" FieldTextBoxTabIndex="7"
								FieldLabelText="Ask Parent (1=L, 2=R, 3=B, 4=UK, 9=Missing)" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ShowFieldLabel="True" ValidList="1,2,3,4,9"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>1 = L<BR>
										2 = R<BR>
										3 = B<BR>
										4 = NR<BR>
										9 = Missing</TD>
									<TD class="heading">Trial #1</TD>
									<TD class="heading">Trial #2</TD>
									<TD class="heading">Trial #3</TD>
								</TR>
								<TR>
									<TD class="heading">1. PUTTING a quarter in a slot (Put it in)</TD>
									<TD>
										<def:datafieldcontrol id="hp1_1" runat="server" DatabaseField="hp1_1" FieldTextBoxTabIndex="7" FieldLabelText="hp1_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" DESIGNTIMEDRAGDROP="234" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp1_2" runat="server" DatabaseField="hp1_2" FieldTextBoxTabIndex="8" FieldLabelText="hp1_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp1_3" runat="server" DatabaseField="hp1_3" FieldTextBoxTabIndex="9" FieldLabelText="hp1_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">*2. DRAWING with a crayon (Color here)</TD>
									<TD>
										<def:datafieldcontrol id="hp2_1" runat="server" DatabaseField="hp2_1" FieldTextBoxTabIndex="10" FieldLabelText="hp2_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp2_2" runat="server" DatabaseField="hp2_2" FieldTextBoxTabIndex="11" FieldLabelText="hp2_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp2_3" runat="server" DatabaseField="hp2_3" FieldTextBoxTabIndex="12" FieldLabelText="hp2_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">3. THROWING a ball (Throw it to me)</TD>
									<TD>
										<def:datafieldcontrol id="hp3_1" runat="server" DatabaseField="hp3_1" FieldTextBoxTabIndex="13" FieldLabelText="hp3_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp3_2" runat="server" DatabaseField="hp3_2" FieldTextBoxTabIndex="14" FieldLabelText="hp3_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp3_3" runat="server" DatabaseField="hp3_3" FieldTextBoxTabIndex="15" FieldLabelText="hp3_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">4. ROLLING a peg (Roll it to me)</TD>
									<TD>
										<def:datafieldcontrol id="hp4_1" runat="server" DatabaseField="hp4_1" FieldTextBoxTabIndex="16" FieldLabelText="hp4_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp4_2" runat="server" DatabaseField="hp4_2" FieldTextBoxTabIndex="17" FieldLabelText="hp4_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp4_3" runat="server" DatabaseField="hp4_3" FieldTextBoxTabIndex="18" FieldLabelText="hp4_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">5. PICKING UP a raisin/cheerio (Show me how you eat)</TD>
									<TD>
										<def:datafieldcontrol id="hp5_1" runat="server" DatabaseField="hp5_1" FieldTextBoxTabIndex="19" FieldLabelText="hp5_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp5_2" runat="server" DatabaseField="hp5_2" FieldTextBoxTabIndex="20" FieldLabelText="hp5_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp5_3" runat="server" DatabaseField="hp5_3" FieldTextBoxTabIndex="21" FieldLabelText="hp5_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">6. BRUSHING teeth (Show me how you brush your teeth)</TD>
									<TD>
										<def:datafieldcontrol id="hp6_1" runat="server" DatabaseField="hp6_1" FieldTextBoxTabIndex="22" FieldLabelText="hp6_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp6_2" runat="server" DatabaseField="hp6_2" FieldTextBoxTabIndex="23" FieldLabelText="hp6_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp6_3" runat="server" DatabaseField="hp6_3" FieldTextBoxTabIndex="24" FieldLabelText="hp6_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">*7. SCREWING a nut on a bolt (Twist it on)</TD>
									<TD>
										<def:datafieldcontrol id="hp7_1" runat="server" DatabaseField="hp7_1" FieldTextBoxTabIndex="25" FieldLabelText="hp7_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp7_2" runat="server" DatabaseField="hp7_2" FieldTextBoxTabIndex="26" FieldLabelText="hp7_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp7_3" runat="server" DatabaseField="hp7_3" FieldTextBoxTabIndex="27" FieldLabelText="hp7_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">*8. OPENING a small plastic container (Open it)</TD>
									<TD>
										<def:datafieldcontrol id="hp8_1" runat="server" DatabaseField="hp8_1" FieldTextBoxTabIndex="28" FieldLabelText="hp8_1"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp8_2" runat="server" DatabaseField="hp8_2" FieldTextBoxTabIndex="29" FieldLabelText="hp8_2"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hp8_3" runat="server" DatabaseField="hp8_3" FieldTextBoxTabIndex="30" FieldLabelText="hp8_3"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="hpcmt" runat="server" DatabaseField="hpcmt" FieldTextBoxTabIndex="32" FieldLabelText="Comments"
								IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxTextMode="MultiLine"
								FieldTextBoxHeight="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="34" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="35"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="36" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="37"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
