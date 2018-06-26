<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.SessionReliability.SessionReliability" CodeFile="SessionReliability.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupColumnHeaders="Measure,ID,Indexnum,Sess Date, Sess TA, Rel Date, Rel TA"
							LookupColumns="studymeasname,id,indexnum,srSESSdt{0:g},srSESSta,srRELdt{0:d},srRELta" AllowedStudyMeasures="807"
							LookupField1DataType="TEXT" VerifiedField="verified" PrimaryKeyField="sr_pk" MeasureName="Session Reliability"
							LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_SessionReliability"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="ID"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="indexnum" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" DatabaseField="indexnum"
										FieldTextBoxTabIndex="4" FieldLabelText="Indexnum" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol><br>
									(Use the lookup feature in the upper right to see all existing entries for a 
									give subject ID. Use the next unused number. Use 1 if this is the first.)
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="layout" height="156">
								<TR>
									<TD>
										<def:datafieldcontrol id="srSESSta" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" DatabaseField="srSESSta"
											FieldTextBoxTabIndex="5" FieldLabelText="Session TA" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srSESSdt" runat="server" FieldTextBoxWidth="150px" FieldLabelWidth="100px" DatabaseField="srSESSdt"
											FieldTextBoxTabIndex="6" FieldLabelText="Session Date and Time" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" FormatString="{0:g}"></def:datafieldcontrol>(Enter the 
										session date and time using the format m/d/yy hh:mm am/pm like: 6/1/06 4:15pm)
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srRELta" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" DatabaseField="srRELta"
											FieldTextBoxTabIndex="7" FieldLabelText="Reliability TA" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srRELdt" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" DatabaseField="srRELdt"
											FieldTextBoxTabIndex="8" FieldLabelText="Reliability Date" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Use the following coding. Leave unused items blank.
										<BR>
										<BR>
										Only use 9 for values that should exist but are missing or unknown.
									</TD>
								</TR>
								<TR>
									<TD>1=A (Aquired)<BR>
										2=M (Mastered)<BR>
										3=P (Prompted)<BR>
										4=NC (Non Compliant/Not Correct)<BR>
										5=+<BR>
										6=-<BR>
										7=X (Not Targeted)<BR>
										9=Missing</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE>
								<TR>
									<TD width="229">
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">RECEPTIVE</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC01A"
														FieldTextBoxTabIndex="9" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC02A"
														FieldTextBoxTabIndex="11" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC03A"
														FieldTextBoxTabIndex="13" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC04A"
														FieldTextBoxTabIndex="15" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC05A"
														FieldTextBoxTabIndex="17" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC06A"
														FieldTextBoxTabIndex="19" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC07A"
														FieldTextBoxTabIndex="21" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC08A"
														FieldTextBoxTabIndex="23" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC09A"
														FieldTextBoxTabIndex="25" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srREC10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC10A"
														FieldTextBoxTabIndex="27" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srREC10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srREC10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">EXPRESSIVE</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP01A"
														FieldTextBoxTabIndex="29" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP02A"
														FieldTextBoxTabIndex="31" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP03A"
														FieldTextBoxTabIndex="33" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP04A"
														FieldTextBoxTabIndex="35" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP05A"
														FieldTextBoxTabIndex="37" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP06A"
														FieldTextBoxTabIndex="39" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP07A"
														FieldTextBoxTabIndex="41" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP08A"
														FieldTextBoxTabIndex="43" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP09A"
														FieldTextBoxTabIndex="45" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srEXP10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP10A"
														FieldTextBoxTabIndex="47" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srEXP10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srEXP10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">SOCIAL INTERACTION</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC01A"
														FieldTextBoxTabIndex="49" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC02A"
														FieldTextBoxTabIndex="51" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC03A"
														FieldTextBoxTabIndex="53" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC04A"
														FieldTextBoxTabIndex="55" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC05A"
														FieldTextBoxTabIndex="57" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC06A"
														FieldTextBoxTabIndex="59" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC07A"
														FieldTextBoxTabIndex="61" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC08A"
														FieldTextBoxTabIndex="63" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC09A"
														FieldTextBoxTabIndex="65" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srSOC10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC10A"
														FieldTextBoxTabIndex="67" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srSOC10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srSOC10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">IMITATION</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI01A"
														FieldTextBoxTabIndex="69" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI02A"
														FieldTextBoxTabIndex="71" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI03A"
														FieldTextBoxTabIndex="73" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI04A"
														FieldTextBoxTabIndex="75" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI05A"
														FieldTextBoxTabIndex="77" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI06A"
														FieldTextBoxTabIndex="79" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI07A"
														FieldTextBoxTabIndex="81" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI08A"
														FieldTextBoxTabIndex="83" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI09A"
														FieldTextBoxTabIndex="85" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srIMI10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI10A"
														FieldTextBoxTabIndex="87" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srIMI10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srIMI10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">COGNITIVE</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG01A"
														FieldTextBoxTabIndex="89" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG02A"
														FieldTextBoxTabIndex="91" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG03A"
														FieldTextBoxTabIndex="93" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG04A"
														FieldTextBoxTabIndex="95" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG05A"
														FieldTextBoxTabIndex="97" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG06A"
														FieldTextBoxTabIndex="99" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG07A"
														FieldTextBoxTabIndex="101" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG08A"
														FieldTextBoxTabIndex="103" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG09A"
														FieldTextBoxTabIndex="105" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srCOG10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG10A"
														FieldTextBoxTabIndex="107" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srCOG10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srCOG10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">PERSONAL INDEPENDENCE</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER01A"
														FieldTextBoxTabIndex="109" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER02A"
														FieldTextBoxTabIndex="111" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER03A"
														FieldTextBoxTabIndex="113" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER04A"
														FieldTextBoxTabIndex="115" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER05A"
														FieldTextBoxTabIndex="117" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER06A"
														FieldTextBoxTabIndex="119" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER07A"
														FieldTextBoxTabIndex="121" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER08A"
														FieldTextBoxTabIndex="123" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER09A"
														FieldTextBoxTabIndex="125" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPER10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER10A"
														FieldTextBoxTabIndex="127" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPER10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPER10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">PLAY</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY01A"
														FieldTextBoxTabIndex="129" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY02A"
														FieldTextBoxTabIndex="131" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY03A"
														FieldTextBoxTabIndex="133" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY04A"
														FieldTextBoxTabIndex="135" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY05A"
														FieldTextBoxTabIndex="137" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY06A"
														FieldTextBoxTabIndex="139" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY07A"
														FieldTextBoxTabIndex="141" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY08A"
														FieldTextBoxTabIndex="143" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY09A"
														FieldTextBoxTabIndex="145" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srPLY10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY10A"
														FieldTextBoxTabIndex="147" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srPLY10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srPLY10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">FINE MOTOR</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN01A"
														FieldTextBoxTabIndex="149" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN02A"
														FieldTextBoxTabIndex="151" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN03A"
														FieldTextBoxTabIndex="153" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN04A"
														FieldTextBoxTabIndex="155" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN05A"
														FieldTextBoxTabIndex="157" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN06A"
														FieldTextBoxTabIndex="159" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN07A"
														FieldTextBoxTabIndex="161" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN08A"
														FieldTextBoxTabIndex="163" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN09A"
														FieldTextBoxTabIndex="165" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srFIN10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN10A"
														FieldTextBoxTabIndex="167" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srFIN10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srFIN10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD class="heading" colSpan="2">GROSS MOTOR</TD>
											</TR>
											<TR>
												<TD><B>Session</B></TD>
												<TD><B>Reliability</B></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO01A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO01A"
														FieldTextBoxTabIndex="169" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO01B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO01B"
														FieldTextBoxTabIndex="300" FieldLabelText="1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO02A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO02A"
														FieldTextBoxTabIndex="171" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO02B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO02B"
														FieldTextBoxTabIndex="300" FieldLabelText="2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO03A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO03A"
														FieldTextBoxTabIndex="173" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO03B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO03B"
														FieldTextBoxTabIndex="300" FieldLabelText="3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO04A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO04A"
														FieldTextBoxTabIndex="175" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO04B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO04B"
														FieldTextBoxTabIndex="300" FieldLabelText="4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO05A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO05A"
														FieldTextBoxTabIndex="177" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO05B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO05B"
														FieldTextBoxTabIndex="300" FieldLabelText="5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO06A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO06A"
														FieldTextBoxTabIndex="179" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO06B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO06B"
														FieldTextBoxTabIndex="300" FieldLabelText="6" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO07A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO07A"
														FieldTextBoxTabIndex="181" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO07B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO07B"
														FieldTextBoxTabIndex="300" FieldLabelText="7" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO08A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO08A"
														FieldTextBoxTabIndex="183" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO08B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO08B"
														FieldTextBoxTabIndex="300" FieldLabelText="8" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO09A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO09A"
														FieldTextBoxTabIndex="185" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO09B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO09B"
														FieldTextBoxTabIndex="300" FieldLabelText="9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="srGRO10A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO10A"
														FieldTextBoxTabIndex="187" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="srGRO10B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="30px" DatabaseField="srGRO10B"
														FieldTextBoxTabIndex="300" FieldLabelText="10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="60px"
											DatabaseField="srNotes" FieldTextBoxTabIndex="301" FieldLabelText="Notes" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="False" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="200px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="190"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="8900"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="191"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="192"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="193"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
