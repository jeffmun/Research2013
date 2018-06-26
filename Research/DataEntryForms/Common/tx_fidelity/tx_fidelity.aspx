<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.tx_fidelity.tx_fidelity" CodeFile="tx_fidelity.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_tx_fidelity" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="TX Fidelity" PrimaryKeyField="fidelity_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="621" LookupTextBox2LabelText="Fidelity Number"
							LookupField2="indexnum" LookupColumnHeaders="Measure,ID,Fidelity #,Fidelity Date" LookupColumns="studymeasname,id,indexnum,frtdate{0:d}"></def:dataentrycontroller>
						<br>
						<b>Instructions:</b> Click <a href="https://autism.washington.edu/SQLReports/Pages/Report.aspx?ItemPath=%2fTreatment+Study%2fEntered+TA+Fidelity" target="_blank">
							Here</a> to view a report of existing entered TA Fidelity sheets.<br>
						Use the next highest available Fidelity # for a given TA or 1 if none exist.
						<br><br>
						Click <a href="https://autism.washington.edu/SQLReports/Pages/Report.aspx?ItemPath=%2fTreatment+Study%2fTA+IDs" target="_blank">Here</a> to see a list of TA ID numbers.<br><br>
						
						
						
						<table class="layout">
							<tr>
								<td>
									<table id="table_insert" class="layout">
										<tr>
											<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
													FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="60px" ShowFieldLabel="True"
													FieldTextBoxMaxLength="15"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="indexnum" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Fidelity #"
													FieldTextBoxTabIndex="4" DatabaseField="indexnum" FieldLabelWidth="80px" FieldTextBoxWidth="60px"
													ShowFieldLabel="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ftherp" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Therapist"
													FieldTextBoxTabIndex="5" DatabaseField="ftherp" FieldLabelWidth="80px" FieldTextBoxWidth="100px" ShowFieldLabel="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="frater" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Rater"
													FieldTextBoxTabIndex="6" DatabaseField="frater" FieldLabelWidth="80px" FieldTextBoxWidth="100px" ShowFieldLabel="True"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="frtdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
													FieldTextBoxTabIndex="7" DatabaseField="frtdate" FieldLabelWidth="80px" FieldTextBoxWidth="60px" FormatString="{0:d}"
													ShowFieldLabel="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="fsubj" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Subject"
													FieldTextBoxTabIndex="8" DatabaseField="fsubj" FieldLabelWidth="80px" FieldTextBoxWidth="60px" ShowFieldLabel="True"
													FieldTextBoxMaxLength="15"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="fepsdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Episode Date"
													FieldTextBoxTabIndex="9" DatabaseField="fepsdate" FieldLabelWidth="80px" FieldTextBoxWidth="60px"
													FormatString="{0:d}" ShowFieldLabel="True"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
						Score 1-5 or use 9 for missing scores 
      <TABLE class="grid">
								<TR>
									<TD width="265"><B>1. Quality of Basic Behavioral Teaching Skills</B></TD>
									<TD class="heading">Score<BR>
										Activity 1</TD>
									<TD class="heading">Score<BR>
										Activity 2</TD>
									<TD class="heading">Score<BR>
										Activity 3</TD>
									<TD class="heading">Score<BR>
										Activity 4</TD>
									<TD class="heading">Score<BR>
										Activity 5</TD>
									<TD class="heading">Score<BR>
										Activity 6</TD>
									<TD class="heading">Score<BR>
										Activity 7</TD>
								</TR>
								<TR>
									<TD class="heading" width="265">A. Management of child attention</TD>
									<TD>
										<def:datafieldcontrol id="f1a1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a1"
											FieldTextBoxTabIndex="10" FieldLabelText="f1a1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1a2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a2"
											FieldTextBoxTabIndex="11" FieldLabelText="f1a2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1a3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a3"
											FieldTextBoxTabIndex="12" FieldLabelText="f1a3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1a4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a4"
											FieldTextBoxTabIndex="13" FieldLabelText="f1a4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1a5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a5"
											FieldTextBoxTabIndex="14" FieldLabelText="f1a5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1a6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a6"
											FieldTextBoxTabIndex="15" FieldLabelText="f1a6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1a7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1a7"
											FieldTextBoxTabIndex="16" FieldLabelText="f1a7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="265">B. Quality of behavioral teaching techniques</TD>
									<TD>
										<def:datafieldcontrol id="f1b1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b1"
											FieldTextBoxTabIndex="17" FieldLabelText="f1b1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1b2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b2"
											FieldTextBoxTabIndex="18" FieldLabelText="f1b2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1b3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b3"
											FieldTextBoxTabIndex="19" FieldLabelText="f1b3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1b4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b4"
											FieldTextBoxTabIndex="20" FieldLabelText="f1b4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1b5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b5"
											FieldTextBoxTabIndex="21" FieldLabelText="f1b5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1b6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b6"
											FieldTextBoxTabIndex="22" FieldLabelText="f1b6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1b7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1b7"
											FieldTextBoxTabIndex="23" FieldLabelText="f1b7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="265">C. Modulating child affect/arousal</TD>
									<TD>
										<def:datafieldcontrol id="f1c1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c1"
											FieldTextBoxTabIndex="24" FieldLabelText="f1c1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1c2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c2"
											FieldTextBoxTabIndex="25" FieldLabelText="f1c2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1c3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c3"
											FieldTextBoxTabIndex="26" FieldLabelText="f1c3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1c4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c4"
											FieldTextBoxTabIndex="27" FieldLabelText="f1c4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1c5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c5"
											FieldTextBoxTabIndex="28" FieldLabelText="f1c5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1c6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c6"
											FieldTextBoxTabIndex="29" FieldLabelText="f1c6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1c7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1c7"
											FieldTextBoxTabIndex="30" FieldLabelText="f1c7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="265">D. Management of unwanted behavior</TD>
									<TD>
										<def:datafieldcontrol id="f1d1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d1"
											FieldTextBoxTabIndex="31" FieldLabelText="f1d1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1d2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d2"
											FieldTextBoxTabIndex="32" FieldLabelText="f1d2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1d3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d3"
											FieldTextBoxTabIndex="33" FieldLabelText="f1d3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1d4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d4"
											FieldTextBoxTabIndex="34" FieldLabelText="f1d4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1d5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d5"
											FieldTextBoxTabIndex="35" FieldLabelText="f1d5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1d6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d6"
											FieldTextBoxTabIndex="36" FieldLabelText="f1d6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f1d7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f1d7"
											FieldTextBoxTabIndex="37" FieldLabelText="f1d7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											DESIGNTIMEDRAGDROP="2287"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD width="266"><B>2. Naturalistic Teaching Skills</B></TD>
									<TD class="heading">Score<BR>
										Activity 1</TD>
									<TD class="heading">Score<BR>
										Activity 2</TD>
									<TD class="heading">Score<BR>
										Activity 3</TD>
									<TD class="heading">Score<BR>
										Activity 4</TD>
									<TD class="heading">Score<BR>
										Activity 5</TD>
									<TD class="heading">Score<BR>
										Activity 6</TD>
									<TD class="heading">Score<BR>
										Activity 7</TD>
								</TR>
								<TR>
									<TD class="heading" width="266">A. Use of turn taking /dyadic engagement</TD>
									<TD>
										<def:datafieldcontrol id="f2a1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a1"
											FieldTextBoxTabIndex="45" FieldLabelText="f2a1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2a2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a2"
											FieldTextBoxTabIndex="46" FieldLabelText="f2a2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2a3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a3"
											FieldTextBoxTabIndex="47" FieldLabelText="f2a3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2a4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a4"
											FieldTextBoxTabIndex="48" FieldLabelText="f2a4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2a5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a5"
											FieldTextBoxTabIndex="49" FieldLabelText="f2a5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2a6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a6"
											FieldTextBoxTabIndex="50" FieldLabelText="f2a6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2a7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2a7"
											FieldTextBoxTabIndex="51" FieldLabelText="f2a7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">B. Child is given choices</TD>
									<TD>
										<def:datafieldcontrol id="f2b1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b1"
											FieldTextBoxTabIndex="52" FieldLabelText="f2b1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2b2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b2"
											FieldTextBoxTabIndex="53" FieldLabelText="f2b2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2b3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b3"
											FieldTextBoxTabIndex="54" FieldLabelText="f2b3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2b4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b4"
											FieldTextBoxTabIndex="55" FieldLabelText="f2b4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2b5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b5"
											FieldTextBoxTabIndex="56" FieldLabelText="f2b5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2b6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b6"
											FieldTextBoxTabIndex="57" FieldLabelText="f2b6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2b7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2b7"
											FieldTextBoxTabIndex="58" FieldLabelText="f2b7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">C. Child motivation is optimized</TD>
									<TD>
										<def:datafieldcontrol id="f2c1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c1"
											FieldTextBoxTabIndex="59" FieldLabelText="f2c1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2c2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c2"
											FieldTextBoxTabIndex="60" FieldLabelText="f2c2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2c3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c3"
											FieldTextBoxTabIndex="61" FieldLabelText="f2c3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2c4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c4"
											FieldTextBoxTabIndex="62" FieldLabelText="f2c4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2c5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c5"
											FieldTextBoxTabIndex="63" FieldLabelText="f2c5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2c6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c6"
											FieldTextBoxTabIndex="64" FieldLabelText="f2c6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2c7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2c7"
											FieldTextBoxTabIndex="65" FieldLabelText="f2c7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">D. Use of real-life materials</TD>
									<TD>
										<def:datafieldcontrol id="f2d1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d1"
											FieldTextBoxTabIndex="66" FieldLabelText="f2d1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2d2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d2"
											FieldTextBoxTabIndex="67" FieldLabelText="f2d2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2d3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d3"
											FieldTextBoxTabIndex="68" FieldLabelText="f2d3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2d4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d4"
											FieldTextBoxTabIndex="69" FieldLabelText="f2d4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2d5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d5"
											FieldTextBoxTabIndex="70" FieldLabelText="f2d5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2d6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d6"
											FieldTextBoxTabIndex="71" FieldLabelText="f2d6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f2d7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f2d7"
											FieldTextBoxTabIndex="72" FieldLabelText="f2d7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD width="266"><B>3. Affective and communicative aspects</B></TD>
									<TD class="heading">Score<BR>
										Activity 1</TD>
									<TD class="heading">Score<BR>
										Activity 2</TD>
									<TD class="heading">Score<BR>
										Activity 3</TD>
									<TD class="heading">Score<BR>
										Activity 4</TD>
									<TD class="heading">Score<BR>
										Activity 5</TD>
									<TD class="heading">Score<BR>
										Activity 6</TD>
									<TD class="heading">Score<BR>
										Activity 7</TD>
								</TR>
								<TR>
									<TD class="heading" width="266">A. Adult use of positive affect</TD>
									<TD>
										<def:datafieldcontrol id="f3a1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a1"
											FieldTextBoxTabIndex="94" FieldLabelText="f3a1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3a2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a2"
											FieldTextBoxTabIndex="95" FieldLabelText="f3a2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3a3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a3"
											FieldTextBoxTabIndex="96" FieldLabelText="f3a3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3a4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a4"
											FieldTextBoxTabIndex="97" FieldLabelText="f3a4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3a5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a5"
											FieldTextBoxTabIndex="98" FieldLabelText="f3a5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3a6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a6"
											FieldTextBoxTabIndex="99" FieldLabelText="f3a6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3a7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3a7"
											FieldTextBoxTabIndex="100" FieldLabelText="f3a7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">B. Adult sensitivity and responsivity to child cues</TD>
									<TD>
										<def:datafieldcontrol id="f3b1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b1"
											FieldTextBoxTabIndex="101" FieldLabelText="f3b1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3b2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b2"
											FieldTextBoxTabIndex="102" FieldLabelText="f3b2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3b3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b3"
											FieldTextBoxTabIndex="103" FieldLabelText="f3b3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3b4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b4"
											FieldTextBoxTabIndex="104" FieldLabelText="f3b4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3b5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b5"
											FieldTextBoxTabIndex="105" FieldLabelText="f3b5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3b6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b6"
											FieldTextBoxTabIndex="106" FieldLabelText="f3b6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3b7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3b7"
											FieldTextBoxTabIndex="107" FieldLabelText="f3b7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">C. Multiple and varied communicative functions</TD>
									<TD>
										<def:datafieldcontrol id="f3c1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c1"
											FieldTextBoxTabIndex="108" FieldLabelText="f3c1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3c2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c2"
											FieldTextBoxTabIndex="109" FieldLabelText="f3c2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3c3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c3"
											FieldTextBoxTabIndex="110" FieldLabelText="f3c3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3c4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c4"
											FieldTextBoxTabIndex="111" FieldLabelText="f3c4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3c5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c5"
											FieldTextBoxTabIndex="112" FieldLabelText="f3c5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3c6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c6"
											FieldTextBoxTabIndex="113" FieldLabelText="f3c6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3c7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3c7"
											FieldTextBoxTabIndex="114" FieldLabelText="f3c7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">D. Adult language</TD>
									<TD>
										<def:datafieldcontrol id="f3d1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d1"
											FieldTextBoxTabIndex="115" FieldLabelText="f3d1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3d2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d2"
											FieldTextBoxTabIndex="116" FieldLabelText="f3d2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3d3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d3"
											FieldTextBoxTabIndex="117" FieldLabelText="f3d3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3d4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d4"
											FieldTextBoxTabIndex="118" FieldLabelText="f3d4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3d5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d5"
											FieldTextBoxTabIndex="119" FieldLabelText="f3d5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3d6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d6"
											FieldTextBoxTabIndex="120" FieldLabelText="f3d6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3d7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3d7"
											FieldTextBoxTabIndex="121" FieldLabelText="f3d7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">E. Elaboration of activities</TD>
									<TD>
										<def:datafieldcontrol id="f3e1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e1"
											FieldTextBoxTabIndex="178" FieldLabelText="f3e1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3e2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e2"
											FieldTextBoxTabIndex="179" FieldLabelText="f3e2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3e3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e3"
											FieldTextBoxTabIndex="180" FieldLabelText="f3e3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3e4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e4"
											FieldTextBoxTabIndex="181" FieldLabelText="f3e4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3e5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e5"
											FieldTextBoxTabIndex="182" FieldLabelText="f3e5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3e6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e6"
											FieldTextBoxTabIndex="183" FieldLabelText="f3e6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3e7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3e7"
											FieldTextBoxTabIndex="184" FieldLabelText="f3e7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">F. Transition between activities</TD>
									<TD>
										<def:datafieldcontrol id="f3f1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f1"
											FieldTextBoxTabIndex="185" FieldLabelText="f3f1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3f2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f2"
											FieldTextBoxTabIndex="186" FieldLabelText="f3f2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3f3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f3"
											FieldTextBoxTabIndex="187" FieldLabelText="f3f3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3f4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f4"
											FieldTextBoxTabIndex="188" FieldLabelText="f3f4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3f5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f5"
											FieldTextBoxTabIndex="189" FieldLabelText="f3f5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3f6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f6"
											FieldTextBoxTabIndex="190" FieldLabelText="f3f6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3f7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3f7"
											FieldTextBoxTabIndex="191" FieldLabelText="f3f7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="266">G. Child engagement during adult other activities</TD>
									<TD>
										<def:datafieldcontrol id="f3g1" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g1"
											FieldTextBoxTabIndex="192" FieldLabelText="f3g1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3g2" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g2"
											FieldTextBoxTabIndex="193" FieldLabelText="f3g2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3g3" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g3"
											FieldTextBoxTabIndex="194" FieldLabelText="f3g3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3g4" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g4"
											FieldTextBoxTabIndex="195" FieldLabelText="f3g4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3g5" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g5"
											FieldTextBoxTabIndex="196" FieldLabelText="f3g5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3g6" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g6"
											FieldTextBoxTabIndex="197" FieldLabelText="f3g6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="f3g7" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="30px" DatabaseField="f3g7"
											FieldTextBoxTabIndex="198" FieldLabelText="f3g7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" ShowFieldLabel="True" FieldLabelWidth="80px" DatabaseField="created"
											FieldTextBoxTabIndex="200" FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" ShowFieldLabel="True" FieldLabelWidth="80px" DatabaseField="createdBy"
											FieldTextBoxTabIndex="201" FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" ShowFieldLabel="True" FieldLabelWidth="80px" DatabaseField="updated"
											FieldTextBoxTabIndex="202" FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" ShowFieldLabel="True" FieldLabelWidth="80px" DatabaseField="updatedBy"
											FieldTextBoxTabIndex="203" FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
