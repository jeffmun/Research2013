<%@ Page language="c#" Inherits="edst3_abilityq.edst3_abilityq" CodeFile="edst3_abilityq.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupTextBox1LabelText="EDS ID:" VerifiedField="verified"
							PrimaryKeyField="abq_pk" MeasureName="EDST3 Abilities Questionnaire" LookupTextBox2Visible="False" LookupField1DataType="INT"
							LookupField1="edsid" DatabaseTable="edst3_abilityq" StudyMeasID="440"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="EDSID" FieldTextBoxTabIndex="1" FieldLabelText="EDSID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD class="heading">1. Musical Abilities</TD>
											</TR>
											<TR>
												<TD>1=Advanced, 2=Similar, 3=Delayed, 4=NA or Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq1a" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1A " FieldTextBoxTabIndex="2" DatabaseField="aq1a"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes at camps, etc., 2=Yes at school, 3=Yes (specify below), 4=No, 
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq1b" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1B  " FieldTextBoxTabIndex="3" DatabaseField="aq1b"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1byes" runat="server" FieldTextBoxWidth="120px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText=" Yes,  specify" FieldTextBoxTabIndex="4"
														DatabaseField="aq1byes"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1binst" runat="server" FieldTextBoxWidth="120px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="1B1a. If so, on what instrument?" FieldTextBoxTabIndex="5"
														DatabaseField="aq1binst"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1blong" runat="server" FieldLabelWidth="100px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
														IsDoubleEntryField="True" FieldLabelText="1B1b. For how long (months)?" FieldTextBoxTabIndex="6" DatabaseField="aq1blong"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq1c01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1C 1)Can your child reproduce a musical piece after limited exposure?"
														FieldTextBoxTabIndex="7" DatabaseField="aq1c01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1c02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1C 2)Does your child have absolute or perfect pitch?"
														FieldTextBoxTabIndex="8" DatabaseField="aq1c02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1c03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1C 3)Can your child compose music or improvise on already learned pieces?"
														FieldTextBoxTabIndex="9" DatabaseField="aq1c03" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1c04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1C 4)Have these abilities changed over time?"
														FieldTextBoxTabIndex="10" DatabaseField="aq1c04" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1c04cn" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText=" If yes, how have they changed? " FieldTextBoxTabIndex="11"
														DatabaseField="aq1c04cn" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq1dothr" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="1D. Other musical abilities. Please describe "
														FieldTextBoxTabIndex="12" DatabaseField="aq1dothr" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"
														FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">2. Artistic Abilities</TD>
											</TR>
											<TR>
												<TD>1=Advanced, 2=Similar, 3=Delayed, 4=NA or Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq2a" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2A  " FieldTextBoxTabIndex="13" DatabaseField="aq2a"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes at camps, etc., 2=Yes at school, 3=Yes (specify below), 4=No, 
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq2b" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2B " FieldTextBoxTabIndex="14" DatabaseField="aq2b"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2byes" runat="server" FieldTextBoxWidth="120px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Yes, specify" FieldTextBoxTabIndex="15"
														DatabaseField="aq2byes"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2btype" runat="server" FieldTextBoxWidth="120px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="2B1a. If so, what type?" FieldTextBoxTabIndex="16"
														DatabaseField="aq2btype"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2blong" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2B1b. For how long? (in months) " FieldTextBoxTabIndex="17"
														DatabaseField="aq2blong"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq2c01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2C  1)Can your child reproduce, from memory, a realistic picture?"
														FieldTextBoxTabIndex="18" DatabaseField="aq2c01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2c02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2C  2)Can your child reproduce, from memory, a realistic picture?"
														FieldTextBoxTabIndex="19" DatabaseField="aq2c02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2c03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2C  3)Does your child have a restricted set of items s/he likes to portray?"
														FieldTextBoxTabIndex="20" DatabaseField="aq2c03" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2c04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2C  4)Have these abilities changed over time?"
														FieldTextBoxTabIndex="21" DatabaseField="aq2c04" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2c04cg" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="2C 4) If yes, how have they changed?"
														FieldTextBoxTabIndex="22" DatabaseField="aq2c04cg" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine"
														FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq2d" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="2D. Other artistic abilities. Please describe."
														FieldTextBoxTabIndex="23" DatabaseField="aq2d" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"
														FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">3. Mathematical Abilities</TD>
											</TR>
											<TR>
												<TD>1=Advanced, 2=Similar, 3=Delayed, 4=NA or Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3a" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3A " FieldTextBoxTabIndex="24" DatabaseField="aq3a"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes at camps, etc., 2=Yes at school, 3=Yes (specify below), 4=No, 
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3b" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3B " FieldTextBoxTabIndex="25" DatabaseField="aq3b"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3byes" runat="server" FieldTextBoxWidth="120px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="yes, specify" FieldTextBoxTabIndex="26"
														DatabaseField="aq3byes"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3btype" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="3B1a.  what type?" FieldTextBoxTabIndex="27"
														DatabaseField="aq3btype" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3blong" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3B1b. for how long (months).  Use -999 if missing."
														FieldTextBoxTabIndex="28" DatabaseField="aq3blong"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3c01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText='3C  1)Can your child reproduce, from memory, a "long" series of numbers?'
														FieldTextBoxTabIndex="29" DatabaseField="aq3c01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3c02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3C  2)Does your child associate numbers with other events?"
														FieldTextBoxTabIndex="30" DatabaseField="aq3c02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3c03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3C  3)Does your child remember (and compare) numerical details about previous events"
														FieldTextBoxTabIndex="31" DatabaseField="aq3c03" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3c04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3C  4)Have these abilities changed over time?"
														FieldTextBoxTabIndex="32" DatabaseField="aq3c04" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3c04cg" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How changed? " FieldTextBoxTabIndex="33"
														DatabaseField="aq3c04cg" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3d01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3D  1)Can your child calculate math equations in his/her head?"
														FieldTextBoxTabIndex="34" DatabaseField="aq3d01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3d02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3D  2)Have these abilities changed over time?"
														FieldTextBoxTabIndex="35" DatabaseField="aq3d02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3d02cg" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How changed? " FieldTextBoxTabIndex="36"
														DatabaseField="aq3d02cg" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3e01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3E 1)Does your child memorize dates of specific events?"
														FieldTextBoxTabIndex="37" DatabaseField="aq3e01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3e01tp" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Type of event: " FieldTextBoxTabIndex="38"
														DatabaseField="aq3e01tp" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq3e02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3E 2)Does your recall the dates when referring to past events?"
														FieldTextBoxTabIndex="39" DatabaseField="aq3e02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3e03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3E 3)Can your child calculate the day of the week"
														FieldTextBoxTabIndex="40" DatabaseField="aq3e03" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3e04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3E 4)Have these abilities changed over time?"
														FieldTextBoxTabIndex="41" DatabaseField="aq3e04" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3e04cg" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How changed?" FieldTextBoxTabIndex="42"
														DatabaseField="aq3e04cg" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq3f" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="3F Other mathematical abilities" FieldTextBoxTabIndex="43"
														DatabaseField="aq3f" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">4. Linguistic or Reading Abilities</TD>
											</TR>
											<TR>
												<TD>1=Advanced, 2=Similar, 3=Delayed, 4=NA or Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4a" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4A " FieldTextBoxTabIndex="44" DatabaseField="aq4a"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes at camps, etc., 2=Yes at school, 3=Yes (specify below), 4=No, 
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4b" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4B " FieldTextBoxTabIndex="45" DatabaseField="aq4b"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4byes" runat="server" FieldTextBoxWidth="120px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="yes, specify" FieldTextBoxTabIndex="46"
														DatabaseField="aq4byes"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4blang" runat="server" FieldTextBoxWidth="150px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="4B1a. what language?" FieldTextBoxTabIndex="47"
														DatabaseField="aq4blang"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4blong" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4B1b. how long (months)" FieldTextBoxTabIndex="48"
														DatabaseField="aq4blong"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes at camps, etc., 2=Yes at school, 3=Yes (specify below), 4=No, 
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4c" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4C " FieldTextBoxTabIndex="49" DatabaseField="aq4c"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4ctype" runat="server" FieldTextBoxWidth="150px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="4C1a. what type?" FieldTextBoxTabIndex="50"
														DatabaseField="aq4ctype"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4clong" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4C1b. how long (months)?" FieldTextBoxTabIndex="51"
														DatabaseField="aq4clong"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Advanced, 2=Similar, 3=Delayed, 4=NA or Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4d" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4D " FieldTextBoxTabIndex="52" DatabaseField="aq4d"
														ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4e01" runat="server" FieldLabelWidth="100px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="4E  1)Linguistic ability " FieldTextBoxTabIndex="53" DatabaseField="aq4e01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=1-4 words, 2=5-10 words, 3=Over 10 word phrases, 4=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4e01lp" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="If yes, how long are the phrases?" FieldTextBoxTabIndex="54"
														DatabaseField="aq4e01lp" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Movies/TV, 2=Parents/adults, 3=Music lyrics, 4=Other (specify Below), 
													5=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4e01wp" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Where did the child first hear these phrases?"
														FieldTextBoxTabIndex="55" DatabaseField="aq4e01wp" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4e01ot" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other, specify" FieldTextBoxTabIndex="56"
														DatabaseField="aq4e01ot"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4e02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4E 2)Have these abilities changed over time?"
														FieldTextBoxTabIndex="57" DatabaseField="aq4e02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4e02cn" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How changed? " FieldTextBoxTabIndex="58"
														DatabaseField="aq4e02cn" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>(Use -9 for missing)<BR>
													<def:datafieldcontrol id="aq4fyear" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4F When did child first read (years)?"
														FieldTextBoxTabIndex="59" DatabaseField="aq4fyear"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq4f01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4F 1)Can your child reproduce, from memory, phrases that s/he read?"
														FieldTextBoxTabIndex="60" DatabaseField="aq4f01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4f02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4F 2)Does your child read at an advanced speed?"
														FieldTextBoxTabIndex="61" DatabaseField="aq4f02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4f03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4F 3)Have these abilities changed over time?"
														FieldTextBoxTabIndex="62" DatabaseField="aq4f03" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4f03cn" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How changed?" FieldTextBoxTabIndex="63"
														DatabaseField="aq4f03cn" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq4g" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="4G Other language abilities" FieldTextBoxTabIndex="64"
														DatabaseField="aq4g" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">5. Memory Abilities</TD>
											</TR>
											<TR>
												<TD>1=Advanced, 2=Similar, 3=Delayed, 4=NA or Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq5a" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5A " FieldTextBoxTabIndex="65" DatabaseField="aq5a"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq5atype" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="What types?" FieldTextBoxTabIndex="66"
														DatabaseField="aq5atype" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Less than 1 week, 2=1 week to 1 month, 3=2 to 6 months, 4=6 to 12 months, 
													5=Over a year, 9=Missing/blank<BR>
													<def:datafieldcontrol id="aq5along" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="How long?" FieldTextBoxTabIndex="67"
														DatabaseField="aq5along" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank
													<def:datafieldcontrol id="aq5b01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText='5B 1)Does your child have a "photographic" memory?'
														FieldTextBoxTabIndex="68" DatabaseField="aq5b01" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq5b02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5B 2)Does your child memorizes items from a limited set of topics?"
														FieldTextBoxTabIndex="69" DatabaseField="aq5b02" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq5b02ar" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="What topic area?" FieldTextBoxTabIndex="70"
														DatabaseField="aq5b02ar" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq5b03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5B 3)Does your child make complex associations between two unrelated items..."
														FieldTextBoxTabIndex="71" DatabaseField="aq5b03" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq5b04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5B 4)Have these abilities changed over time?"
														FieldTextBoxTabIndex="72" DatabaseField="aq5b04" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq5b04cn" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How have they changed?" FieldTextBoxTabIndex="73"
														DatabaseField="aq5b04cn" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq5c" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="5C. Other Abilities" FieldTextBoxTabIndex="74"
														DatabaseField="aq5c" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">6. Other strengths</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq6a" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="6A. Describe any other outstanding abilities"
														FieldTextBoxTabIndex="75" DatabaseField="aq6a" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"
														FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq6bage" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6B Age first noticed (Months).  Use -999 if missing."
														FieldTextBoxTabIndex="76" DatabaseField="aq6bage"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>1=Yes, 2=No, 3=Unknown, 9=Missing/Blank<BR>
													<def:datafieldcontrol id="aq6b" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6B Changed over time?" FieldTextBoxTabIndex="77"
														DatabaseField="aq6b" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="aq6bcn" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldDataType="TEXT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
														IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="How changed?" FieldTextBoxTabIndex="78"
														DatabaseField="aq6bcn" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="80" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="81" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="82" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="83" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
