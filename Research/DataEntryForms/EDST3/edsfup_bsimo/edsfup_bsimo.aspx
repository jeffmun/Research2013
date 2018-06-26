<%@ Page language="c#" Inherits="EDST3DataEntryForms.edsfup_bsimo.edsfup_bsimo" CodeFile="edsfup_bsimo.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="bsi_pk"
							MeasureName="EDS FUP Mother BSI" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="True" LookupField1="edsid"
							DatabaseTable="eds_bsimo" StudyMeasID="328" LookupField2="indexnum" LookupTextBox2LabelText="Indexnum:"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
										FieldTextBoxTabIndex="2" DatabaseField="edsid" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="indexnum" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Indexnum"
										FieldTextBoxTabIndex="3" DatabaseField="indexnum" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="BSIdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BSIdate"
											FieldTextBoxTabIndex="8" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSIclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BSIclin"
											FieldTextBoxTabIndex="9" FieldLabelText="Clinician" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=NOT AT ALL, 1=A LITTLE BIT, 2=MODERATELY<BR>
										3=QUITE A BIT, 4= EXTREMELY, 9=MISSING/BLANK</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi01"
											FieldTextBoxTabIndex="11" FieldLabelText="1. Stress" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi02"
											FieldTextBoxTabIndex="12" FieldLabelText="2. Lonely" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi03"
											FieldTextBoxTabIndex="13" FieldLabelText="3. Blue" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi04"
											FieldTextBoxTabIndex="14" FieldLabelText="4. Muscle Tension" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi05" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi05"
											FieldTextBoxTabIndex="15" FieldLabelText="5. No Interest in things" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi06" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi06"
											FieldTextBoxTabIndex="16" FieldLabelText="6. Feelings easily Hurt" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi07" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi07"
											FieldTextBoxTabIndex="17" FieldLabelText="7. Fatigued" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi08" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi08"
											FieldTextBoxTabIndex="18" FieldLabelText="8. Worthlessness" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi09" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi09"
											FieldTextBoxTabIndex="19" FieldLabelText="9. Feeling on edge" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi10" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi10"
											FieldTextBoxTabIndex="20" FieldLabelText="10. Hopelessness" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi11" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi11"
											FieldTextBoxTabIndex="21" FieldLabelText="11. Overwhelmed" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsi12" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mbsi12"
											FieldTextBoxTabIndex="22" FieldLabelText="12. Thoughts of ending life" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mbsicmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="mbsicmnt"
											FieldTextBoxTabIndex="23" FieldLabelText="Comment" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxMaxLength="250" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="studymeassubjID" runat="server" FieldLabelWidth="80px" DatabaseField="studymeassubjID"
											FieldTextBoxTabIndex="4" FieldLabelText="studymeassubjID" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="actionID" runat="server" FieldLabelWidth="80px" DatabaseField="actionID" FieldTextBoxTabIndex="5"
											FieldLabelText="actionID" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSIkey" runat="server" FieldLabelWidth="80px" DatabaseField="BSIkey" FieldTextBoxTabIndex="6"
											FieldLabelText="BSIkey" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="upd" runat="server" FieldLabelWidth="80px" DatabaseField="upd" FieldTextBoxTabIndex="7"
											FieldLabelText="upd" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSItp" runat="server" FieldLabelWidth="80px" DatabaseField="BSItp" FieldTextBoxTabIndex="10"
											FieldLabelText="BSItp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="25"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="26"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="27"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="28"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
