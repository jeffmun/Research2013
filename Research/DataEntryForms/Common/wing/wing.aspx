
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.wing.wing" CodeFile="wing.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="False"
							VerifiedField="verified" PrimaryKeyField="wing_pk" MeasureName="Wing Rating" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_wing" AllowedStudyMeasures="369,758"></def:dataentrycontroller>
						<br>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="wingdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="wingdate" FormatString="{0:d}" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="wingclin" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="4" DatabaseField="wingclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<table id="table_entry" class="layout">
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
						<br>
						<table id="table_readonly" class="layout">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
										FieldTextBoxTabIndex="8" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="9" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="10" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
										FieldTextBoxTabIndex="11" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
					</asp:Content>
