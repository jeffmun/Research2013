<%@ Page language="c#" Inherits="GenericDataEntryForms.VisuomotorPrecision.VisuomotorPrecision" CodeFile="VisuomotorPrecision.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="722" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="vp_pk" MeasureName="Nepsy-Visuomotor Precision" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="ALL_VisuomotorPrecision"></def:dataentrycontroller>
						<table class="tblinsert" id="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="2" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="vpdate" runat="server" DatabaseField="vpdate" FieldTextBoxTabIndex="5" FieldLabelText="Date"
										IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="vpexp" runat="server" DatabaseField="vpexp" FieldTextBoxTabIndex="6" FieldLabelText="Experimenter"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<br>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Error</TD>
									<TD class="heading">Time(seconds)</TD>
								</TR>
								<TR>
									<TD class="heading">Car</TD>
									<TD>
										<def:datafieldcontrol id="vpERRcar" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vpERRcar" FieldTextBoxTabIndex="8" DatabaseField="vpERRcar"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vpTIMcar" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vpTIMcar" FieldTextBoxTabIndex="9" DatabaseField="vpTIMcar"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Motorcycle</TD>
									<TD>
										<def:datafieldcontrol id="vpERRmot" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vpERRmot" FieldTextBoxTabIndex="11" DatabaseField="vpERRmot"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="vpTIMmot" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="vpTIMmot" FieldTextBoxTabIndex="12" DatabaseField="vpTIMmot"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="vpTE" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="80px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Total Errors" FieldTextBoxTabIndex="13"
								DatabaseField="vpTE"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="vpTT" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="80px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Total Time (seconds)" FieldTextBoxTabIndex="14"
								DatabaseField="vpTT"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="vpTS" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="80px" FieldDataType="INT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
								IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Total Score" FieldTextBoxTabIndex="15"
								DatabaseField="vpTS"></def:datafieldcontrol>
							<BR>
							<TABLE class="tblentry" id="table_entry">
								<TR>
									<TD><B>Qualitative Observations (0=NO, 1=YES, 9=Missing)</B></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vpQOmat" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Mature" FieldTextBoxTabIndex="16" DatabaseField="vpQOmat"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vpQOint" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Intermediate" FieldTextBoxTabIndex="17"
											DatabaseField="vpQOint" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="vpQOimm" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Immature" FieldTextBoxTabIndex="18" DatabaseField="vpQOimm"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="vpvalid" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="True" FieldLabelText="Validity (1=valid, 2=questionable, 3=invalid)" FieldTextBoxTabIndex="19"
								DatabaseField="vpvalid" ValidList="1,2,3"></def:datafieldcontrol>
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
						</asp:Panel>
					</asp:Content>
