<%@ Page language="c#" Inherits="GenericDataEntryForms.bsi_dep.bsi_dep" CodeFile="bsi_dep.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_bsi_dep" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="BSI Depression" PrimaryKeyField="bsidep_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="328,329,604,605,2429,2430,2431,2432" LookupColumns="studymeasname,id,indexnum,bsifdate{0:d},bsiclin"
							LookupColumnHeaders="Measure,ID,Indexnum,BSI Date, BSI Clinician"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
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
										<def:datafieldcontrol id="BSIfdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BSIfdate"
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
									<TD class="heading">Respondant</TD>
								</TR>
								<TR>
									<TD>0=Self/Subject<BR>
										1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="BSIresp" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="130px" DatabaseField="BSIresp"
											FieldTextBoxTabIndex="9" FieldLabelText="Respondant" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="BSIrespt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="130px" DatabaseField="BSIrespt"
											FieldTextBoxTabIndex="9" FieldLabelText="(specify if 3 or 4)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE><br>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=NOT AT ALL, 1=A LITTLE BIT, 2=MODERATELY<BR>
										3=QUITE A BIT, 4= EXTREMELY, 9=MISSING/BLANK</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi01"
											FieldTextBoxTabIndex="11" FieldLabelText="1. Stress" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi02"
											FieldTextBoxTabIndex="12" FieldLabelText="2. Lonely" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi03"
											FieldTextBoxTabIndex="13" FieldLabelText="3. Blue" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi04"
											FieldTextBoxTabIndex="14" FieldLabelText="4. Muscle Tension" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi05" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi05"
											FieldTextBoxTabIndex="15" FieldLabelText="5. No Interest in things" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi06" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi06"
											FieldTextBoxTabIndex="16" FieldLabelText="6. Feelings easily Hurt" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi07" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi07"
											FieldTextBoxTabIndex="17" FieldLabelText="7. Fatigued" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi08" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi08"
											FieldTextBoxTabIndex="18" FieldLabelText="8. Worthlessness" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi09" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi09"
											FieldTextBoxTabIndex="19" FieldLabelText="9. Feeling on edge" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi10" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi10"
											FieldTextBoxTabIndex="20" FieldLabelText="10. Hopelessness" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi11" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi11"
											FieldTextBoxTabIndex="21" FieldLabelText="11. Overwhelmed" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsi12" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="fbsi12"
											FieldTextBoxTabIndex="22" FieldLabelText="12. Thoughts of ending life" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fbsicmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="fbsicmnt"
											FieldTextBoxTabIndex="23" FieldLabelText="Comment" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxMaxLength="250" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
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
