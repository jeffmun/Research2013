<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.TherapistEval.TherapistEval" CodeFile="TherapistEval.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_TherapistEval" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Therapist Evaluation"
							PrimaryKeyField="pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="751"
							LookupColumnHeaders="ID,Index,Date Completed" LookupColumns="id,indexnum,tedate{0:d}"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Child's Code"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="100px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="indexnum" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Index"
										FieldTextBoxTabIndex="2" DatabaseField="indexnum" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="tename" runat="server" FieldLabelWidth="100px" DatabaseField="tename" FieldTextBoxTabIndex="6"
											FieldLabelText="Your Name" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="tedate" runat="server" FieldLabelWidth="100px" DatabaseField="tedate" FieldTextBoxTabIndex="7"
											FieldLabelText="Date Completed" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Use -9 for missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te01" runat="server" DatabaseField="te01" FieldTextBoxTabIndex="8" FieldLabelText="1) Overall, my feelings about the program..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te02" runat="server" DatabaseField="te02" FieldTextBoxTabIndex="9" FieldLabelText="2) My feelings about my child’s progress..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te03" runat="server" DatabaseField="te03" FieldTextBoxTabIndex="10" FieldLabelText="3) Would you recommend this program..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te04" runat="server" DatabaseField="te04" FieldTextBoxTabIndex="11" FieldLabelText="4) I feel that the paperwork is being done in a timely manner..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te05" runat="server" DatabaseField="te05" FieldTextBoxTabIndex="12" FieldLabelText="5) I feel that the program provided adequate training..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te06" runat="server" DatabaseField="te06" FieldTextBoxTabIndex="13" FieldLabelText="6) I feel that my questions and concerns are brought..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te07" runat="server" DatabaseField="te07" FieldTextBoxTabIndex="14" FieldLabelText="7) In terms of promptness and attendance, I feel..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te08" runat="server" DatabaseField="te08" FieldTextBoxTabIndex="15" FieldLabelText="8) In dealing with my family, I feel ..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te09" runat="server" DatabaseField="te09" FieldTextBoxTabIndex="16" FieldLabelText="9) In dealing with my family, I feel "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="te10" runat="server" DatabaseField="te10" FieldTextBoxTabIndex="17" FieldLabelText="10) I feel that the intervention staff have a warm and caring attitude..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="50px" FormatString="{0:f}"></def:datafieldcontrol></TD>
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
