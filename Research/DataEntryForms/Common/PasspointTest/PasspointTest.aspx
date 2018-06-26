<%@ Page language="c#" Inherits="GenericDataEntryForms.PasspointTest.PasspointTest" CodeFile="PasspointTest.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_Passpoint" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Passpoint Test" PrimaryKeyField="pp_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="638"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td>
									<def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="100px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ppexp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="3" DatabaseField="ppexp" FieldLabelWidth="100px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ppTdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="4" DatabaseField="ppTdate" FieldLabelWidth="100px" FormatString="{0:d}" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ppEdate" runat="server" DatabaseField="ppEdate" FieldTextBoxTabIndex="5" FieldLabelText="Eval Date"
										IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="100px" FormatString="{0:d}" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD colSpan="4"><B>Red Marker</B></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">Time<BR>
										(seconds)</TD>
									<TD class="heading"># Dots</TD>
									<TD class="heading"># Out</TD>
								</TR>
								<TR>
									<TD class="heading">Total</TD>
									<TD>
										<def:datafieldcontrol id="ppRTTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppRTTot" FieldTextBoxTabIndex="8"
											FieldLabelText="ppRTTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppRDTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppRDTot" FieldTextBoxTabIndex="9"
											FieldLabelText="ppRDTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppROTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppROTot" FieldTextBoxTabIndex="10"
											FieldLabelText="ppROTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">First Ten</TD>
									<TD>
										<def:datafieldcontrol id="ppRTTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppRTTen" FieldTextBoxTabIndex="11"
											FieldLabelText="ppRTTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppRDTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppRDTen" FieldTextBoxTabIndex="12"
											FieldLabelText="ppRDTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppROTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppROTen" FieldTextBoxTabIndex="13"
											FieldLabelText="ppROTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ppRvalid" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="ppRvalid"
								FieldTextBoxTabIndex="14" FieldLabelText="Red Validity (1=valid, 2=questionable, 3=invalid)" IsDoubleEntryField="True"
								IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD colSpan="4"><B>Blue Marker</B></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">Time<BR>
										(seconds)</TD>
									<TD class="heading"># Dots</TD>
									<TD class="heading"># Out</TD>
								</TR>
								<TR>
									<TD class="heading">Total</TD>
									<TD>
										<def:datafieldcontrol id="ppBTTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppBTTot" FieldTextBoxTabIndex="15"
											FieldLabelText="ppBTTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppBDTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppBDTot" FieldTextBoxTabIndex="16"
											FieldLabelText="ppBDTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppBOTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppBOTot" FieldTextBoxTabIndex="17"
											FieldLabelText="ppBOTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">First Ten</TD>
									<TD>
										<def:datafieldcontrol id="ppBTTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppBTTen" FieldTextBoxTabIndex="18"
											FieldLabelText="ppBTTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppBDTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppBDTen" FieldTextBoxTabIndex="19"
											FieldLabelText="ppBDTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppBOTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppBOTen" FieldTextBoxTabIndex="20"
											FieldLabelText="ppBOTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ppBvalid" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="ppBvalid"
								FieldTextBoxTabIndex="21" FieldLabelText="Blue Validity (1=valid, 2=questionable, 3=invalid)" IsDoubleEntryField="True"
								IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD colSpan="4"><B>Green Marker</B></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">Time<BR>
										(seconds)</TD>
									<TD class="heading"># Dots</TD>
									<TD class="heading"># Out</TD>
								</TR>
								<TR>
									<TD class="heading">Total</TD>
									<TD>
										<def:datafieldcontrol id="ppGTTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppGTTot" FieldTextBoxTabIndex="22"
											FieldLabelText="ppGTTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppGDTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppGDTot" FieldTextBoxTabIndex="23"
											FieldLabelText="ppGDTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppGOTot" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppGOTot" FieldTextBoxTabIndex="24"
											FieldLabelText="ppGOTot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">First Ten</TD>
									<TD>
										<def:datafieldcontrol id="ppGTTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppGTTen" FieldTextBoxTabIndex="25"
											FieldLabelText="ppGTTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppGDTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppGDTen" FieldTextBoxTabIndex="26"
											FieldLabelText="ppGDTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ppGOTen" runat="server" FieldTextBoxWidth="60px" DatabaseField="ppGOTen" FieldTextBoxTabIndex="27"
											FieldLabelText="ppGOTen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="ppGvalid" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="ppGvalid"
								FieldTextBoxTabIndex="28" FieldLabelText="Green Validity (1=valid,  2=questionable, 3=invalid)" IsDoubleEntryField="True"
								IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol>
							<BR>
							<BR>
							<def:datafieldcontrol id="ppGog2" runat="server" FieldTextBoxWidth="80px" DatabaseField="ppGog2" FieldTextBoxTabIndex="29"
								FieldLabelText="Time between goggles on and task 2 (seconds)" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="ppGog3" runat="server" FieldTextBoxWidth="80px" DatabaseField="ppGog3" FieldTextBoxTabIndex="30"
								FieldLabelText="Time between goggles on and task 3 (seconds)" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="32"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="33"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="34"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="35"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
