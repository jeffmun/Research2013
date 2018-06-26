<%@ Page language="c#" Inherits="GenericDataEntryForms.VisualAttention.VisualAttention" CodeFile="VisualAttention.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="721" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="va_pk" MeasureName="Nepsy-Visual Attention" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="ALL_VisualAttention"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="2" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="vadate" runat="server" DatabaseField="vadate" FieldTextBoxTabIndex="5" FieldLabelText="Date"
										IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="vaexp" runat="server" DatabaseField="vaexp" FieldTextBoxTabIndex="6" FieldLabelText="Experimenter"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Target</TD>
									<TD class="heading">Commission<BR>
										Errors</TD>
									<TD class="heading">Accuracy<BR>
										Score</TD>
									<TD class="heading">Time(seconds)</TD>
								</TR>
								<TR>
									<TD class="heading">Cats</TD>
									<TD>
										<def:datafieldcontrol id="vatrgtc" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vatrgtc" FieldTextBoxTabIndex="8" DatabaseField="vatrgtc"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaCEc" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vaCEc" FieldTextBoxTabIndex="9" DatabaseField="vaCEc" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaASc" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vaASc" FieldTextBoxTabIndex="10" DatabaseField="vaASc" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaTc" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vaTc" FieldTextBoxTabIndex="11" DatabaseField="vaTc" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Faces</TD>
									<TD>
										<def:datafieldcontrol id="vatrgtf" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vatrgtf" FieldTextBoxTabIndex="13" DatabaseField="vatrgtf"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaCEf" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vaCEf" FieldTextBoxTabIndex="14" DatabaseField="vaCEf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaASf" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vaASf" FieldTextBoxTabIndex="15" DatabaseField="vaASf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vaTf" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vaTf" FieldTextBoxTabIndex="16" DatabaseField="vaTf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<def:datafieldcontrol id="vaOTB" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Off Task Behavior (OTB)" FieldTextBoxTabIndex="17"
								DatabaseField="vaOTB"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="vaSA" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sum Accuracy (SA)" FieldTextBoxTabIndex="18"
								DatabaseField="vaSA"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="vaST" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sum Time (ST)" FieldTextBoxTabIndex="19"
								DatabaseField="vaST"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="vaTS" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Total Score" FieldTextBoxTabIndex="20"
								DatabaseField="vaTS"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="vavalid" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="40px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=valid, 2=questionable, 3=invalid)"
								FieldTextBoxTabIndex="21" DatabaseField="vavalid" ValidList="1,2,3"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="32" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="33" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="34" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="35" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
