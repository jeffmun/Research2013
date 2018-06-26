<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="wj.aspx.cs" Inherits="DataEntryForms_Common_wj_wj" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="False"
	VerifiedField="verified" PrimaryKeyField="wj_pk" MeasureName="WJ-PictRec" LookupTextBox1LabelText="Subject ID:"
	LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_wj"
	AllowedStudyMeasures="108,115,148,386,921,2077" ></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="wjdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="wjdate" FieldLabelWidth="80px" FieldTextBoxWidth="60px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="wjclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="wjclin" FieldLabelWidth="80px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="wjraw" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" RegExDescription="Value must be between 0 and 30 or -999."
											RegEx="^([0-9]|[1-2][0-9]|30|-999)$" DatabaseField="wjraw" FieldTextBoxTabIndex="5" FieldLabelText="Pict Rec: Raw Score"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
									<TD> <def:datafieldcontrol id="wjss" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" DatabaseField="wjss"  FieldLabelText = "Pict Rec: Std Score"
										IsReadOnly="True"> </def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wjvld" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" DatabaseField="wjvld"
											FieldTextBoxTabIndex="6" FieldLabelText="Validity (1=valid, 2=Questionable, 3=Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
									<TD> <def:datafieldcontrol id="wjagemos" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" DatabaseField="wjagemos"  FieldLabelText = "Pict Rec: Age (months)"
										IsReadOnly="True"> </def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wjcmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="wjcmnt"
											FieldTextBoxTabIndex="7" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
									<TD> <def:datafieldcontrol id="wjscrmsg" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="80px" DatabaseField="wjscrmsg"  FieldLabelText = "Pict Rec: Score Message"
										IsReadOnly="True"> </def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="9"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="10"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>


								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="9"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="10"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="11"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="12"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>

</asp:Content>

