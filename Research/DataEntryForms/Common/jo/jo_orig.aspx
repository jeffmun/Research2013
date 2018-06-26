<%@ Page language="c#" Inherits="kt_jo.kt_jo" CodeFile="jo_orig.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_jo" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Joint Orient" PrimaryKeyField="jo_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" 
							AllowedStudyMeasures="263,364,485,569,789,1199,1200,1201,1303,1315,1316,1755,1802"
							></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="jodate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="jodate"
											FieldTextBoxTabIndex="3" FieldLabelText="Test date" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="joclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="joclin"
											FieldTextBoxTabIndex="4" FieldLabelText="Experimenter" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="jowkst" runat="server" FieldTextBoxWidth="30px" DatabaseField="jowkst" FieldTextBoxTabIndex="5"
											FieldLabelText="Worksheet used (A, B, C, D, X=missing/unknown)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ValidList="A,a,B,b,C,c,D,d,X,x"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="joprnt" runat="server" FieldTextBoxWidth="30px" DatabaseField="joprnt" FieldTextBoxTabIndex="5"
											FieldLabelText="Training in response to name? (0=no, 1=yes, 9=missing)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top" width="204">
										<TABLE class="layout" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">
											<TR>
												<TD bgColor="#a1b5cf">Non social</TD>
											</TR>
											<TR>
												<TD bgColor="gainsboro">(0=No, 1=Yes, 9=Missing)</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jotime" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jotime"
														FieldTextBoxTabIndex="6" FieldLabelText="timer" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jophon" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jophon"
														FieldTextBoxTabIndex="7" FieldLabelText="phone" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jowhis" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jowhis"
														FieldTextBoxTabIndex="8" FieldLabelText="whistle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="johorn" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="johorn"
														FieldTextBoxTabIndex="9" FieldLabelText="horn" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD bgColor="#a1b5cf">Social</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="johum" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="johum"
														FieldTextBoxTabIndex="10" FieldLabelText="hum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="joname" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="joname"
														FieldTextBoxTabIndex="11" FieldLabelText="name" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="josnap" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="josnap"
														FieldTextBoxTabIndex="12" FieldLabelText="snap" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jopat" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jopat"
														FieldTextBoxTabIndex="13" FieldLabelText="pat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jopnt1" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jopnt1"
														FieldTextBoxTabIndex="14" FieldLabelText="point 1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jopnt2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jopnt2"
														FieldTextBoxTabIndex="15" FieldLabelText="point 2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jogaz1" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jogaz1"
														FieldTextBoxTabIndex="16" FieldLabelText="gaze 1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jogaz2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="jogaz2"
														FieldTextBoxTabIndex="17" FieldLabelText="gaze 2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">
											<TR>
												<TD bgColor="#a1b5cf">Familiarity with sounds</TD>
											</TR>
											<TR>
												<TD bgColor="gainsboro">1=very unfamiliar<BR>
													2=somewhat unfamiliar<BR>
													3=neither familiar nor unfamiliar<BR>
													4=somewhat familiar<BR>
													5=very familiar<BR>
													9=Missing</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmhorn" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmhorn"
														FieldTextBoxTabIndex="18" FieldLabelText="car horn" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmname" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmname"
														FieldTextBoxTabIndex="19" FieldLabelText="someone calling child's name" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmsnap" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmsnap"
														FieldTextBoxTabIndex="20" FieldLabelText="someone snapping fingers" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmring" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmring"
														FieldTextBoxTabIndex="21" FieldLabelText="phone ringing" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmbeep" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmbeep"
														FieldTextBoxTabIndex="22" FieldLabelText="timer beeping" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmpat" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmpat"
														FieldTextBoxTabIndex="23" FieldLabelText="someone patting legs" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmwhtl" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmwhtl"
														FieldTextBoxTabIndex="24" FieldLabelText="whistle blowing" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="jofmhum" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="jofmhum"
														FieldTextBoxTabIndex="25" FieldLabelText="someone humming" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="jobeh" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="jobeh"
											FieldTextBoxTabIndex="26" FieldLabelText="Behavioral Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="jovld" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="jovld"
											FieldTextBoxTabIndex="27" FieldLabelText="Validity (1=valid, 2=questionable, 3=invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="jocmt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="jocmt"
											FieldTextBoxTabIndex="28" FieldLabelText="Validity Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="30"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="31"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="32"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="33"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
