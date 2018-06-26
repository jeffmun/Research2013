
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="tap_wing.tap_wing" CodeFile="tap_wing.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_wing" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP WING" PrimaryKeyField="wing_pk"
							VerifiedField="verified" ShowScoreButton="False" LookupField1DataType="TEXT" StudyMeasID="369"></def:dataentrycontroller><br/>
						<br/>
						<div class="divDataEntryFields">
							<table id="table_insert" class="tblinsert">
								<tr>
									<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
											FieldTextBoxTabIndex="2" DatabaseField="tapid" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must  look like TAP###"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="wingdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
											FieldTextBoxTabIndex="3" DatabaseField="wingdate" FormatString="{0:d}"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="wingclin" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
											FieldTextBoxTabIndex="4" DatabaseField="wingclin"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
							<br/>
							<br/>
							<table id="table_entry" class="tblentry">
								<tr>
									<td><def:datafieldcontrol id="wingrat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Interaction Style (1=Aloof, 2=Passive, 3=Active but Odd, 4 = Socially Appropriate, 9= Missing/Blank)"
											FieldTextBoxTabIndex="5" DatabaseField="wingrat" ValidList="1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="wingcmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
											FieldTextBoxTabIndex="6" DatabaseField="wingcmt" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"
											FieldTextBoxWidth="200px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
							<br/>
							<br/>
							<table id="table_readonly" class="tblreadonly">
								<tr>
									<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="8" DatabaseField="created"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="9" DatabaseField="createdBy"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="10" DatabaseField="updated"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="11" DatabaseField="updatedBy"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
						</div>
					</asp:Content>
