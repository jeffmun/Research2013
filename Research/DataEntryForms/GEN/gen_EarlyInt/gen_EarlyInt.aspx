<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="gen_EarlyInt.gen_EarlyInt" CodeFile="gen_EarlyInt.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_earlyint" LookupField1="indid"
							LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN Early Intervention"
							PrimaryKeyField="ei_pk" VerifiedField="verified" StudyMeasID="141"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="INDID" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Years</TD>
									<TD class="heading">Mos</TD>
									<TD class="heading">Never: 0 if blank 1 if 'X'</TD>
								</TR>
								<TR>
									<TD class="heading">Early Int: Speech/Lang Tx (mos)</TD>
									<TD>
										<def:datafieldcontrol id="EISPLGYR" runat="server" FieldTextBoxWidth="30px" DatabaseField="EISPLGYR" FieldTextBoxTabIndex="3"
											FieldLabelText="EISPLGYR" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EISPLGMO" runat="server" FieldTextBoxWidth="30px" DatabaseField="EISPLGMO" FieldTextBoxTabIndex="3"
											FieldLabelText="EISPLGMO" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EISPLGNV" runat="server" FieldTextBoxWidth="30px" DatabaseField="EISPLGNV" FieldTextBoxTabIndex="3"
											FieldLabelText="EISPLGNV" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Early Int: Special Educ. (mos)</TD>
									<TD>
										<def:datafieldcontrol id="EISPEDYR" runat="server" FieldTextBoxWidth="30px" DatabaseField="EISPEDYR" FieldTextBoxTabIndex="4"
											FieldLabelText="EISPEDYR" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EISPEDMO" runat="server" FieldTextBoxWidth="30px" DatabaseField="EISPEDMO" FieldTextBoxTabIndex="4"
											FieldLabelText="EISPEDMO" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EISPEDNV" runat="server" FieldTextBoxWidth="30px" DatabaseField="EISPEDNV" FieldTextBoxTabIndex="4"
											FieldLabelText="EISPEDNV" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Early Int: Behav. Home Program (mos)</TD>
									<TD>
										<def:datafieldcontrol id="EIBEHHYR" runat="server" FieldTextBoxWidth="30px" DatabaseField="EIBEHHYR" FieldTextBoxTabIndex="5"
											FieldLabelText="EIBEHHYR" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EIBEHHMO" runat="server" FieldTextBoxWidth="30px" DatabaseField="EIBEHHMO" FieldTextBoxTabIndex="5"
											FieldLabelText="EIBEHHMO" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EIBEHHNV" runat="server" FieldTextBoxWidth="30px" DatabaseField="EIBEHHNV" FieldTextBoxTabIndex="5"
											FieldLabelText="EIBEHHNV" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>0<BR>
										0 hrs</TD>
									<TD>1<BR>
										1-5 hrs</TD>
									<TD>2<BR>
										6-10 hrs</TD>
									<TD>3<BR>
										11-15 hrs</TD>
									<TD>4<BR>
										16-20 hrs</TD>
									<TD>5<BR>
										20-30 hrs</TD>
									<TD>6<BR>
										&gt;30 hrs</TD>
									<TD>9<BR>
										Missing
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">Early intervention hours per week</TD>
								</TR>
								<TR>
									<TD>1 to 2 yrs old</TD>
									<TD>
										<def:datafieldcontrol id="EIHRS1" runat="server" FieldTextBoxWidth="40px" DatabaseField="EIHRS1" FieldTextBoxTabIndex="6"
											FieldLabelText="EIHRS1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2 to 3 yrs old</TD>
									<TD>
										<def:datafieldcontrol id="EIHRS2" runat="server" FieldTextBoxWidth="40px" DatabaseField="EIHRS2" FieldTextBoxTabIndex="7"
											FieldLabelText="EIHRS2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3 to 4 yrs old</TD>
									<TD>
										<def:datafieldcontrol id="EIHRS3" runat="server" FieldTextBoxWidth="40px" DatabaseField="EIHRS3" FieldTextBoxTabIndex="8"
											FieldLabelText="EIHRS3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4 to 5 yrs old</TD>
									<TD>
										<def:datafieldcontrol id="EIHRS4" runat="server" FieldTextBoxWidth="40px" DatabaseField="EIHRS4" FieldTextBoxTabIndex="9"
											FieldLabelText="EIHRS4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>5 to 6 yrs old</TD>
									<TD>
										<def:datafieldcontrol id="EIHRS5" runat="server" FieldTextBoxWidth="40px" DatabaseField="EIHRS5" FieldTextBoxTabIndex="10"
											FieldLabelText="EIHRS5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>6 to 7 yrs old</TD>
									<TD>
										<def:datafieldcontrol id="EIHRS6" runat="server" FieldTextBoxWidth="40px" DatabaseField="EIHRS6" FieldTextBoxTabIndex="11"
											FieldLabelText="EIHRS6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
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
