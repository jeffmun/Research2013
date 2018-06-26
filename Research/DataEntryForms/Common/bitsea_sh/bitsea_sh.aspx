<%@ Page language="c#" Inherits="GenericDataEntryForms.bitsea_sh.bitsea_sh" CodeFile="bitsea_sh.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="False"
							VerifiedField="verified" PrimaryKeyField="bitsea_pk" MeasureName="Brief BITSEA" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_bitsea_sh" AllowedStudyMeasures="611,616"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="id"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BSHCLIN" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interviewer"
										FieldTextBoxTabIndex="5" DatabaseField="BSHCLIN" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BSHDATE" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="6" DatabaseField="BSHDATE" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
						0 = not true/rarely; 1 = somewhat true/sometimes; 2 = very true/often; 9 = 
						Missing/Blank<br>
						<table id="table_entry" class="grid" xmlns:def="foofoofoo">
							<tr>
								<td>
									<def:datafieldcontrol id="BSH01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Cries or tantrums until s/he is exhausted."
										FieldTextBoxTabIndex="7" DatabaseField="BSH01" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Runs away in public places."
										FieldTextBoxTabIndex="8" DatabaseField="BSH02" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Often gets very upset."
										FieldTextBoxTabIndex="9" DatabaseField="BSH03" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Hits, shoves, kicks, or bites children (not including brother/sister).  (4 = No contact with other children)"
										FieldTextBoxTabIndex="10" DatabaseField="BSH04" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,4,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Is destructive.  Breaks or ruins things on purpose."
										FieldTextBoxTabIndex="11" DatabaseField="BSH05" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Hurts him/herself on purpose.  "
										FieldTextBoxTabIndex="12" DatabaseField="BSH06" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
									<br>
									<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
										IsDoubleEntryField="False" FieldLabelText="Describe" FieldTextBoxTabIndex="12" DatabaseField="BSH06ds"
										FieldTextBoxWidth="300px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Purposely tries to hurt you (or other parent)."
										FieldTextBoxTabIndex="13" DatabaseField="BSH07" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Hits, bites or kicks you (or other parent). "
										FieldTextBoxTabIndex="14" DatabaseField="BSH08" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Wakes up at night and needs help to fall asleep again."
										FieldTextBoxTabIndex="15" DatabaseField="BSH09" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BSH10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Has trouble falling asleep or staying asleep."
										FieldTextBoxTabIndex="16" DatabaseField="BSH10" FieldLabelWidth="400px" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<table id="table_readonly" class="layout">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
										FieldTextBoxTabIndex="18" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="19" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="20" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
										FieldTextBoxTabIndex="21" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						</asp:Panel>
					</asp:Content>
