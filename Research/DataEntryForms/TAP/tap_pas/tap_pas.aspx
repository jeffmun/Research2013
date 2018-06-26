<%@ Page language="c#" Inherits="tap_pas.tap_pas" CodeFile="tap_pas.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" VerifiedField="verified"
							PrimaryKeyField="pas_pk" MeasureName="TAP Play Assessment Scale" LookupTextBox1LabelText="TAP ID:" LookupTextBox2Visible="False"
							LookupField1="tapid" DatabaseTable="tap_pas" ShowScoreButton="False" StudyMeasID="368" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" RegExDescription="TAP ID must look like TAP###" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="tapid" FieldTextBoxTabIndex="2" FieldLabelText="TAP ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="pasdate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="pasdate"
										FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="pasclin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="pasclin"
										FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br/>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD colSpan="2">(use -9 if missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PASLOW" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Lowest scored item"
											FieldTextBoxTabIndex="6" DatabaseField="PASLOW" FieldTextBoxWidth="30px" FieldLabelWidth="100px" RegEx="^([1-9]|[1-3][0-9]|4[0-5]|-9)$"
											RegExDescription="Value must be between 1 and 45 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="PASHIGH" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Highest scored  item"
											FieldTextBoxTabIndex="7" DatabaseField="PASHIGH" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
											RegEx="^([1-9]|[1-3][0-9]|4[0-5]|-9)$" RegExDescription="Value must be between 1 and 45 or -9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout">
								<TR>
									<TD colSpan="2">0=Spontaneous, 1=Verbal 1, 2=Verbal 2, 3=Verbal+Model, 4=Failed, 
										9=Missing</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top" width="285">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1.  Attends to and tracks toys   "
														FieldTextBoxTabIndex="8" DatabaseField="PAS01" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2.  Attends and turns to sound"
														FieldTextBoxTabIndex="9" DatabaseField="PAS02" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3.  Explores toys with "
														FieldTextBoxTabIndex="10" DatabaseField="PAS03" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4.  Manipulates toys (waves, "
														FieldTextBoxTabIndex="11" DatabaseField="PAS04" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5.  Manipulates toys (squeezes, "
														FieldTextBoxTabIndex="12" DatabaseField="PAS05" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6.  Bangs together any objects "
														FieldTextBoxTabIndex="13" DatabaseField="PAS06" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7.  Grasps toy and visually "
														FieldTextBoxTabIndex="14" DatabaseField="PAS07" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8.  Places toys near other toys"
														FieldTextBoxTabIndex="15" DatabaseField="PAS08" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9.  Acts on toy while making "
														FieldTextBoxTabIndex="16" DatabaseField="PAS09" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10.  Places unrelated object "
														FieldTextBoxTabIndex="17" DatabaseField="PAS10" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11.  Uses toys with   appropriate actions"
														FieldTextBoxTabIndex="18" DatabaseField="PAS11" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12.  Places object near/in another object or body part..."
														FieldTextBoxTabIndex="19" DatabaseField="PAS12" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13.  Combines unlike but related objects together"
														FieldTextBoxTabIndex="20" DatabaseField="PAS13" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14.  Acts on self several times or in 2-3 ways"
														FieldTextBoxTabIndex="21" DatabaseField="PAS14" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15.   Places object near doll or person to demonstrate a relationship"
														FieldTextBoxTabIndex="22" DatabaseField="PAS15" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16.  Places object near adult and observes adult’s use of object"
														FieldTextBoxTabIndex="23" DatabaseField="PAS16" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17.  Places 3 to 4 objects in related group"
														FieldTextBoxTabIndex="24" DatabaseField="PAS17" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18.  Initiates motor or vocal act to adult, observes adult’s response, then imitates adult..."
														FieldTextBoxTabIndex="25" DatabaseField="PAS18" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19.  Single act on doll"
														FieldTextBoxTabIndex="26" DatabaseField="PAS19" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20.  Same actions with two objects or to two recipients"
														FieldTextBoxTabIndex="27" DatabaseField="PAS20" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21.  Related serial acts to self "
														FieldTextBoxTabIndex="28" DatabaseField="PAS21" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22.  Places toys in a scheme in a disorganized manner"
														FieldTextBoxTabIndex="29" DatabaseField="PAS22" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23.  Appropriate serial acts "
														FieldTextBoxTabIndex="30" DatabaseField="PAS23" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24.  Same acts from 2 sources one recipient in one play scheme"
														FieldTextBoxTabIndex="31" DatabaseField="PAS24" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25.  Positions objects in appropriate place then acts on the combination"
														FieldTextBoxTabIndex="32" DatabaseField="PAS25" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26.  Same acts, different sources, different recipients in one play scheme"
														FieldTextBoxTabIndex="33" DatabaseField="PAS26" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27.  Purposefully completes two step problem solving task for solution with novel toy"
														FieldTextBoxTabIndex="34" DatabaseField="PAS27" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28.  Demonstrates size, space awareness of four related objects"
														FieldTextBoxTabIndex="35" DatabaseField="PAS28" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29.  Adds sounds to action and labels to objects ..."
														FieldTextBoxTabIndex="36" DatabaseField="PAS29" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS30" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30.  Places doll in appropriate position to two objects within one play scheme"
														FieldTextBoxTabIndex="37" DatabaseField="PAS30" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS31" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31.  Appropriate 3 step serial acts involving adult, doll, or other props in dramatic play with a theme"
														FieldTextBoxTabIndex="38" DatabaseField="PAS31" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS32" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32.  Substitutes doll for self in play..."
														FieldTextBoxTabIndex="39" DatabaseField="PAS32" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS33" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33.  Uses one object for two different purposes in play scheme"
														FieldTextBoxTabIndex="40" DatabaseField="PAS33" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS34" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34.  Child demonstrates two actions with substitute objects..."
														FieldTextBoxTabIndex="41" DatabaseField="PAS34" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS35" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35.  Places accessories in a scheme in an organized manner"
														FieldTextBoxTabIndex="42" DatabaseField="PAS35" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS36" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36.  Substitutes object in single meaningful act..."
														FieldTextBoxTabIndex="43" DatabaseField="PAS36" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS37" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37.  Makes doll act on self ..."
														FieldTextBoxTabIndex="44" DatabaseField="PAS37" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS38" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Demonstrates/verbalizes functional play plan before or while doing the acts"
														FieldTextBoxTabIndex="45" DatabaseField="PAS38" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS39" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39.  Substitutes multiple objects in same scenario"
														FieldTextBoxTabIndex="46" DatabaseField="PAS39" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS40" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40.  Verbalizes play plan for assigned roles"
														FieldTextBoxTabIndex="47" DatabaseField="PAS40" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS41" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Child demonstrates awareness or appropriate size correspondence between dolls and accessories."
														FieldTextBoxTabIndex="48" DatabaseField="PAS41" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS42" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42.  When requested, shows adult how to perform simple motor act using a body part."
														FieldTextBoxTabIndex="49" DatabaseField="PAS42" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS43" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43.  Verbalizes play plan and uses pretend props which are identified for benefit of adult"
														FieldTextBoxTabIndex="50" DatabaseField="PAS43" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS44" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44.  Solves puzzle or steps using cash register or other novel toy with 4-6 steps"
														FieldTextBoxTabIndex="51" DatabaseField="PAS44" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS45" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45.  Demonstrates functions with dissimilar object substitutions given instruction:..."
														FieldTextBoxTabIndex="52" DatabaseField="PAS45" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="53" DatabaseField="PASCMT"
											FieldTextBoxWidth="200px" FieldLabelWidth="80px" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="11" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="12" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="13" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="14" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
