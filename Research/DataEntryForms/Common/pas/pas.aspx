<%@ Page language="c#" Inherits="kt_pas.kt_pas" CodeFile="pas.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="567, 368, 761" ShowScoreButton="True"
							DatabaseTable="all_pas" LookupField1="id" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:"
							MeasureName="Play Assessment Scale" PrimaryKeyField="pas_pk" VerifiedField="verified" LookupField1DataType="TEXT" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="pasdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="pasdate" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="pasclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="pasclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="43"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<table class="grid">
							<tr>
								<td colspan="2" align="center">Score</td>
							</tr>
							<tr>
								<td class="heading">Functional Play:</td>
								<td>
									<def:datafieldcontrol id="pasftot" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="60px" DatabaseField="pasftot"
										FieldTextBoxTabIndex="4" FieldLabelText="pasftot" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" DESIGNTIMEDRAGDROP="264"
										RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td class="heading">Symbolic Play:</td>
								<td>
									<def:datafieldcontrol id="passtot" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol3"
										FieldTextBoxTabIndex="4" DatabaseField="passtot" FieldTextBoxWidth="60px" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"
										ShowFieldLabel="False"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><b>Total:</b></td>
								<td>
									<def:datafieldcontrol id="pastot" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="60px" DatabaseField="pastot"
										FieldTextBoxTabIndex="4" FieldLabelText="Score:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" DESIGNTIMEDRAGDROP="63"
										RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></td>
							</tr>
						</table>
						<def:datafieldcontrol id="passcmsg" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
							IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Status:"
							FieldTextBoxTabIndex="4" DatabaseField="passcmsg" FieldTextBoxWidth="80px" FieldLabelWidth="100px"
							RenderReadOnlyAsDiv="True"></def:datafieldcontrol><br>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading" colSpan="2">Specify Basal and Ceiling (use -9 if missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PASLOW" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PASLOW"
											FieldTextBoxTabIndex="6" FieldLabelText="Basal (prior items are scored as 4)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" RegExDescription="Value must be between 1 and 45 or -9" RegEx="^([1-9]|[1-3][0-9]|4[0-5]|-9)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="PASHIGH" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PASHIGH"
											FieldTextBoxTabIndex="7" FieldLabelText="Ceiling (subsequent items are scored as 0)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" RegExDescription="Value must be between 1 and 45 or -9" RegEx="^([1-9]|[1-3][0-9]|4[0-5]|-9)$"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE>
								<TR>
									<TD class="heading" colSpan="2"><B>4</B>=Spontaneous, <B>3</B>=Verbal 1, <B>2</B>=Verbal 
										2, <B>1</B>=Verbal+Model, <B>0</B>=Failed, <B>9</B>=Missing<BR>
										<BR>
										<B>Leave items before basal and after ceiling blank.</B></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top" width="285">
										<TABLE class="layout">
											<TR>
												<TD height="30">
													<def:datafieldcontrol id="PAS01" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS01"
														FieldTextBoxTabIndex="8" FieldLabelText="1.  Attends to and tracks toys   " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS02" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS02"
														FieldTextBoxTabIndex="9" FieldLabelText="2.  Attends and turns to sound" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS03" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS03"
														FieldTextBoxTabIndex="10" FieldLabelText="3.  Explores toys with " IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS04" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS04"
														FieldTextBoxTabIndex="11" FieldLabelText="4.  Manipulates toys (waves, " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS05" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS05"
														FieldTextBoxTabIndex="12" FieldLabelText="5.  Manipulates toys (squeezes, " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS06" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS06"
														FieldTextBoxTabIndex="13" FieldLabelText="6.  Bangs together any objects " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS07" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS07"
														FieldTextBoxTabIndex="14" FieldLabelText="7.  Grasps toy and visually " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS08" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS08"
														FieldTextBoxTabIndex="15" FieldLabelText="8.  Places toys near other toys" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS09" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS09"
														FieldTextBoxTabIndex="16" FieldLabelText="9.  Acts on toy while making " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS10" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS10"
														FieldTextBoxTabIndex="17" FieldLabelText="10.  Places unrelated object " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS11" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS11"
														FieldTextBoxTabIndex="18" FieldLabelText="11.  Uses toys with   appropriate actions" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS12" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS12"
														FieldTextBoxTabIndex="19" FieldLabelText="12.  Places object near/in another object or body part..."
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS13" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS13"
														FieldTextBoxTabIndex="20" FieldLabelText="13.  Combines unlike but related objects together" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS14" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS14"
														FieldTextBoxTabIndex="21" FieldLabelText="14.  Acts on self several times or in 2-3 ways" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS15" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS15"
														FieldTextBoxTabIndex="22" FieldLabelText="15.   Places object near doll or person to demonstrate a relationship"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS16" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS16"
														FieldTextBoxTabIndex="23" FieldLabelText="16.  Places object near adult and observes adult’s use of object"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS17" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS17"
														FieldTextBoxTabIndex="24" FieldLabelText="17.  Places 3 to 4 objects in related group" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS18" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS18"
														FieldTextBoxTabIndex="25" FieldLabelText="18.  Initiates motor or vocal act to adult, observes adult’s response, then imitates adult..."
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS19" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS19"
														FieldTextBoxTabIndex="26" FieldLabelText="19.  Single act on doll" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS20" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS20"
														FieldTextBoxTabIndex="27" FieldLabelText="20.  Same actions with two objects or to two recipients"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS21" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS21"
														FieldTextBoxTabIndex="28" FieldLabelText="21.  Related serial acts to self " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS22" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS22"
														FieldTextBoxTabIndex="29" FieldLabelText="22.  Places toys in a scheme in a disorganized manner" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS23" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS23"
														FieldTextBoxTabIndex="30" FieldLabelText="23.  Appropriate serial acts " IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS24" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS24"
														FieldTextBoxTabIndex="31" FieldLabelText="24.  Same acts from 2 sources one recipient in one play scheme"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS25" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS25"
														FieldTextBoxTabIndex="32" FieldLabelText="25.  Positions objects in appropriate place then acts on the combination"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS26" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS26"
														FieldTextBoxTabIndex="33" FieldLabelText="26.  Same acts, different sources, different recipients in one play scheme"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS27" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS27"
														FieldTextBoxTabIndex="34" FieldLabelText="27.  Purposefully completes two step problem solving task for solution with novel toy"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS28" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS28"
														FieldTextBoxTabIndex="35" FieldLabelText="28.  Demonstrates size, space awareness of four related objects"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS29" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS29"
														FieldTextBoxTabIndex="36" FieldLabelText="29.  Adds sounds to action and labels to objects ..." IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS30" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS30"
														FieldTextBoxTabIndex="37" FieldLabelText="30.  Places doll in appropriate position to two objects within one play scheme"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS31" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS31"
														FieldTextBoxTabIndex="38" FieldLabelText="31.  Appropriate 3 step serial acts involving adult, doll, or other props in dramatic play with a theme"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS32" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS32"
														FieldTextBoxTabIndex="39" FieldLabelText="32.  Substitutes doll for self in play..." IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS33" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS33"
														FieldTextBoxTabIndex="40" FieldLabelText="33.  Uses one object for two different purposes in play scheme"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS34" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS34"
														FieldTextBoxTabIndex="41" FieldLabelText="34.  Child demonstrates two actions with substitute objects..."
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS35" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS35"
														FieldTextBoxTabIndex="42" FieldLabelText="35.  Places accessories in a scheme in an organized manner"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS36" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS36"
														FieldTextBoxTabIndex="43" FieldLabelText="36.  Substitutes object in single meaningful act..." IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS37" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS37"
														FieldTextBoxTabIndex="44" FieldLabelText="37.  Makes doll act on self ..." IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS38" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS38"
														FieldTextBoxTabIndex="45" FieldLabelText="38. Demonstrates/verbalizes functional play plan before or while doing the acts"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS39" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS39"
														FieldTextBoxTabIndex="46" FieldLabelText="39.  Substitutes multiple objects in same scenario" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS40" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS40"
														FieldTextBoxTabIndex="47" FieldLabelText="40.  Verbalizes play plan for assigned roles" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS41" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS41"
														FieldTextBoxTabIndex="48" FieldLabelText="41. Child demonstrates awareness or appropriate size correspondence between dolls and accessories."
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS42" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS42"
														FieldTextBoxTabIndex="49" FieldLabelText="42.  When requested, shows adult how to perform simple motor act using a body part."
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS43" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS43"
														FieldTextBoxTabIndex="50" FieldLabelText="43.  Verbalizes play plan and uses pretend props which are identified for benefit of adult"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS44" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS44"
														FieldTextBoxTabIndex="51" FieldLabelText="44.  Solves puzzle or steps using cash register or other novel toy with 4-6 steps"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="PAS45" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="PAS45"
														FieldTextBoxTabIndex="52" FieldLabelText="45.  Demonstrates functions with dissimilar object substitutions given instruction:..."
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											DatabaseField="PASCMT" FieldTextBoxTabIndex="53" FieldLabelText="Comments" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"
											FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="11"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="12"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="13"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="14"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="19" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="20" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
