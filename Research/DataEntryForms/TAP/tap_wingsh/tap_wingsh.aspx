<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_wingsh.tap_wingsh" CodeFile="tap_wingsh.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_wingshort" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP WING" PrimaryKeyField="wingsh_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="422"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapidx" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldLabelWidth="100px" FieldTextBoxWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="WNGdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="WNGdate" FieldTextBoxWidth="100px" FieldLabelWidth="100px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<DIV><br/>
								0-Never<br/>
								1-Very Rarely<br/>
								2-Rarely<br/>
								3-Sometimes<br/>
								4-Frequently<br/>
								5-Very Frequently<br/>
								6-Always<br/>
								9-Missing/Blank<br/>
								<br/>
							</DIV>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>Group #1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG011" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG011"
											FieldTextBoxTabIndex="4" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG012" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG012"
											FieldTextBoxTabIndex="5" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG013" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG013"
											FieldTextBoxTabIndex="6" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG014" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG014"
											FieldTextBoxTabIndex="7" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG01BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG01BST"
											FieldTextBoxTabIndex="8" FieldLabelText="Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout">
								<TR>
									<TD>Group #2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG021" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG021"
											FieldTextBoxTabIndex="9" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG022" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG022"
											FieldTextBoxTabIndex="10" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG023" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG023"
											FieldTextBoxTabIndex="11" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG02BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG02BST"
											FieldTextBoxTabIndex="12" FieldLabelText="Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout">
								<TR>
									<TD>Group #3</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG031" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG031"
											FieldTextBoxTabIndex="13" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG032" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG032"
											FieldTextBoxTabIndex="14" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG033" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG033"
											FieldTextBoxTabIndex="15" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG034" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG034"
											FieldTextBoxTabIndex="16" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="WNG03BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="WNG03BST"
											FieldTextBoxTabIndex="17" FieldLabelText="Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="19"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="20"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="21"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="22"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
