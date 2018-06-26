<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_nsips.edst3_nsips" CodeFile="edst3_nsips.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="194" VerifiedField="verified"
							PrimaryKeyField="nsips_pk" MeasureName="EDST3 NSIPS" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False"
							LookupField1="edsid" DatabaseTable="edst3_nsips"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" DatabaseField="edsid" FieldTextBoxTabIndex="2" FieldLabelText="EDS ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="nsdate" runat="server" DatabaseField="nsdate" FieldTextBoxTabIndex="3" FieldLabelText="Date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="nsclin" runat="server" DatabaseField="nsclin" FieldTextBoxTabIndex="4" FieldLabelText="Experimenter"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="20"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="nsfrmver" runat="server" DatabaseField="nsfrmver" FieldTextBoxTabIndex="4" FieldLabelText="Form Version (1,2,3, or 4)"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="40px" FieldLabelWidth="80px" ValidList="1,2,3,4,9"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">Order of choice. Note order by entering 1 or 2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nschtoy" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Toy" FieldTextBoxTabIndex="5" DatabaseField="nschtoy" ValidList="1,2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nschtoyc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Toy and Clinician" FieldTextBoxTabIndex="6" DatabaseField="nschtoyc"
											ValidList="1,2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nschot" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Other" FieldTextBoxTabIndex="7" DatabaseField="nschot" ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="nschottx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="specify:"
											FieldTextBoxTabIndex="7" DatabaseField="nschottx"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Enter time in seconds. (enter 999 if missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nstime" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Amount of time engaged w/clinician" FieldTextBoxTabIndex="8" DatabaseField="nstime"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ns3foot" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Amount of time spent within 3 foot" FieldTextBoxTabIndex="9" DatabaseField="ns3foot"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Play Observations 1: (0=DID NOT OCCUR, 1=OCCURRED, 9=Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp1appr" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Physically approaches" FieldTextBoxTabIndex="10" DatabaseField="nsp1appr" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp1toy" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Shows toy" FieldTextBoxTabIndex="11" DatabaseField="nsp1toy" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp1talk" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Talks to clinician" FieldTextBoxTabIndex="12" DatabaseField="nsp1talk" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp1init" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="No initiation" FieldTextBoxTabIndex="13" DatabaseField="nsp1init" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp1odd" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Overly persistent/odd approaches" FieldTextBoxTabIndex="14" DatabaseField="nsp1odd"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp1cmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="14" DatabaseField="nsp1cmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 1</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="14" DatabaseField="nspaimp1" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="14" DatabaseField="nspadec1"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Transition task: Response to Joint Attention (Poster)</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity or verbalize<BR>
										2=Orients to examiner<BR>
										3=Follows gaze or alternates gaze<BR>
										4=Initiates continued interaction re: poster<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr01nme" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Unprompted: Say child’s name and gaze at poster" FieldTextBoxTabIndex="14" DatabaseField="nsr01nme"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr01mmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Unprompted: “Hmmmm”" FieldTextBoxTabIndex="14" DatabaseField="nsr01mmm" ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr01chk" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “Check out that poster”" FieldTextBoxTabIndex="14" DatabaseField="nsr01chk"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr01sb" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4. Verbal prompt: “Its a Sponge Bob Poster”" FieldTextBoxTabIndex="14" DatabaseField="nsr01sb"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Response to distress - Bump knee</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity<BR>
										2=Orients to examiner<BR>
										3=Tries to help OR looks concerned<BR>
										4=Both tries to help AND looks concerned<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr02wnc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Wince" FieldTextBoxTabIndex="14" DatabaseField="nsr02wnc" ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr02rub" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Rub Knee" FieldTextBoxTabIndex="14" DatabaseField="nsr02rub" ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Play Observations 2: (0=DID NOT OCCUR, 1=OCCURRED, 9=Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2appr" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Physically approaches" FieldTextBoxTabIndex="15" DatabaseField="nsp2appr" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2talk" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Talks to clinician" FieldTextBoxTabIndex="16" DatabaseField="nsp2talk" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2rchi" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Responds to comments about child’s play" FieldTextBoxTabIndex="17" DatabaseField="nsp2rchi"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2rcln" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Responds to comments about clinician's play" FieldTextBoxTabIndex="18" DatabaseField="nsp2rcln"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2ignr" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Ignores" FieldTextBoxTabIndex="19" DatabaseField="nsp2ignr" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2wthd" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Withdraws/resists interaction" FieldTextBoxTabIndex="20" DatabaseField="nsp2wthd"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp2cmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="21" DatabaseField="nsp2cmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 2</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="21" DatabaseField="nspaimp2" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="21" DatabaseField="nspadec2"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Transition task: Initiation of JA: Light</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity or Partial JA (uncoordinated gaze)<BR>
										2=Limited frequency or quality, but present
										<BR>
										3=Frequent or high quality JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp03neu" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Neutral expression. Look at child" FieldTextBoxTabIndex="21" DatabaseField="nsp03neu"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp03cur" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Curious expression. Look about" FieldTextBoxTabIndex="21" DatabaseField="nsp03cur"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp03vrb" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “What was that?” Look about " FieldTextBoxTabIndex="21" DatabaseField="nsp03vrb"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Play Observations 3/Withdraw From Play: (0=DID NOT OCCUR, 
										1=OCCURRED, 9=Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp3rply" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Attempts to re-establish play" FieldTextBoxTabIndex="21" DatabaseField="nsp3rply"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp3nply" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="No attempts to re-establish play" FieldTextBoxTabIndex="22" DatabaseField="nsp3nply"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp3odd" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Engages in odd or unusual behavior" FieldTextBoxTabIndex="23" DatabaseField="nsp3odd"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp3prst" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Overly persistent" FieldTextBoxTabIndex="24" DatabaseField="nsp3prst" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp3cmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="24" DatabaseField="nsp3cmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 3</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="24" DatabaseField="nspaimp3" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="24" DatabaseField="nspadec3"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Response to JA: Penny</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity<BR>
										2=Orients to examiner<BR>
										3=Follows gaze or alternates gaze<BR>
										4=Initiates continued interaction re: penny<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr04gze" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Say child’s name and gaze" FieldTextBoxTabIndex="24" DatabaseField="nsr04gze" ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr04hmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Verbal prompt: “Hmmmm” and gaze" FieldTextBoxTabIndex="24" DatabaseField="nsr04hmm"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr04odd" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “That’s odd” and gaze" FieldTextBoxTabIndex="24" DatabaseField="nsr04odd"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr04wht" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4. Verbal prompt: “What is that doing there?” and gaze" FieldTextBoxTabIndex="24"
											DatabaseField="nsr04wht" ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Response to distress: Pencil/Pen</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity<BR>
										2=Orients to examiner or item<BR>
										3=Tries to help OR conveys concern<BR>
										4=Both helps AND conveys concern<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr05prp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Look about: Perplexed " FieldTextBoxTabIndex="24" DatabaseField="nsr05prp" ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr05lst" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Verbal prompt: “I lost my pen/pencil”" FieldTextBoxTabIndex="24" DatabaseField="nsr05lst"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr05hlp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “I need help.”" FieldTextBoxTabIndex="24" DatabaseField="nsr05hlp"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 4</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp4" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="24" DatabaseField="nspaimp4" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec4" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="24" DatabaseField="nspadec4"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Response to JA: Toys on shelf</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity or verbalize<BR>
										2=Orients to examiner<BR>
										3=Follows gaze or alternates gaze<BR>
										4=Initiates continued interaction re: toys<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr06lk" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Unprompted: “Look!” Gesture to shelf" FieldTextBoxTabIndex="24" DatabaseField="nsr06lk"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr06ply" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Verbal prompt: “Let’s play with one.”" FieldTextBoxTabIndex="24" DatabaseField="nsr06ply"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr06whc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “Which one?”" FieldTextBoxTabIndex="24" DatabaseField="nsr06whc"
											ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Play Observations 4: (0=DID NOT OCCUR, 1=OCCURRED, 9=Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp4rply" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Engages in reciprocal play" FieldTextBoxTabIndex="25" DatabaseField="nsp4rply" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp4rque" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Responds to questions" FieldTextBoxTabIndex="26" DatabaseField="nsp4rque" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp4rreq" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Responds to requests" FieldTextBoxTabIndex="27" DatabaseField="nsp4rreq" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp4ign" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Ignores" FieldTextBoxTabIndex="28" DatabaseField="nsp4ign" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp4with" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Withdraws, resists" FieldTextBoxTabIndex="29" DatabaseField="nsp4with" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsp4cmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="66" DatabaseField="nsp4cmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 5</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp5" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="67" DatabaseField="nspaimp5" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec5" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="68" DatabaseField="nspadec5"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Prosocial behavior: Clearing table for snack</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity<BR>
										2=Orients to examiner or table<BR>
										3=Tries to help<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr07neu" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Unprompted: Look at table; neutral expression" FieldTextBoxTabIndex="69" DatabaseField="nsr07neu"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr07hmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Unprompted: “Hmmm”" FieldTextBoxTabIndex="70" DatabaseField="nsr07hmm" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr07try" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “I can’t put the tray down”" FieldTextBoxTabIndex="71" DatabaseField="nsr07try"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr07clr" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4. Verbal prompt: “Will you clear the table?”" FieldTextBoxTabIndex="72" DatabaseField="nsr07clr"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Prosocial behavior: Sharing snack</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity<BR>
										2=Orients to examiner or snack<BR>
										3=Offers snack<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr08hmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Say “Mmmm”: Look at snack" FieldTextBoxTabIndex="73" DatabaseField="nsr08hmm" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr08yum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Verbal prompt: “That looks yummy”" FieldTextBoxTabIndex="74" DatabaseField="nsr08yum"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr08can" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “Can I have some?”" FieldTextBoxTabIndex="75" DatabaseField="nsr08can"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Prosocial behavior: Dropped cup</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity<BR>
										2=Orients to examiner or cup<BR>
										3=Tries to help<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr09rch" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Reach for cup:" FieldTextBoxTabIndex="76" DatabaseField="nsr09rch" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr09can" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Verbal prompt: “I can’t reach it”" FieldTextBoxTabIndex="77" DatabaseField="nsr09can"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr09pls" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “Please give me the cup”" FieldTextBoxTabIndex="78" DatabaseField="nsr09pls"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 6</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp6" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="78" DatabaseField="nspaimp6" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec6" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="78" DatabaseField="nspadec6"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">IF VERBAL: Conversation</TD>
								</TR>
								<TR>
									<TD>
										<P>0=No response<BR>
											1=Stops activity/Looks at examiner<BR>
											2=Answers question<BR>
											3=Spontaneously adds to conversation<BR>
											4=Asks examiner about self<BR>
											7=Not Administered<BR>
											8=N/A<BR>
											9=Missing</P>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr10fav" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. “So, what was your favorite thing that we did today?”" FieldTextBoxTabIndex="79"
											DatabaseField="nsr10fav" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr10lik" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. “Did you like the snack, the game, or the action figures best?”" FieldTextBoxTabIndex="80"
											DatabaseField="nsr10lik" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr10ifv" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. “I definitely had a favorite part of today”" FieldTextBoxTabIndex="81" DatabaseField="nsr10ifv"
											ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr10myf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4. “Do you want to know what my favorite part was?”" FieldTextBoxTabIndex="82" DatabaseField="nsr10myf"
											ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Indicate the following that apply to conversation<BR>
										0=DOES NOT APPLY<BR>
										1=APPLIES<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsconflw" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Conversation flows back and forth" FieldTextBoxTabIndex="82" DatabaseField="nsconflw"
											ValidList="0,1,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nschtlk" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Child talks about events that happen outside of the immediate environment" FieldTextBoxTabIndex="82"
											DatabaseField="nschtlk" ValidList="0,1,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nschbld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Child builds on clinician’s comments; asks about clinician" FieldTextBoxTabIndex="82"
											DatabaseField="nschbld" ValidList="0,1,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsclprag" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Limited pragmatic skills" FieldTextBoxTabIndex="82" DatabaseField="nsclprag" ValidList="0,1,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsccmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="83" DatabaseField="nsccmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 7</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspaimp7" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="84" DatabaseField="nspaimp7" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec7" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="85" DatabaseField="nspadec7"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Prosocial behavior: Cleaning up</TD>
								</TR>
								<TR>
									<TD>0=No response<BR>
										1=Stops activity 2=Orients to examiner or toys<BR>
										3=Tries to help<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr11mss" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Unprompted: “What a mess”" FieldTextBoxTabIndex="86" DatabaseField="nsr11mss" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr11cup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Verbal prompt: “Maybe we could clean up”" FieldTextBoxTabIndex="87" DatabaseField="nsr11cup"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsr11hlp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Verbal prompt: “Please help me clean up”" FieldTextBoxTabIndex="88" DatabaseField="nsr11hlp"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Passive Administration 8</TD>
								</TR>
								<TR>
									<TD>0=No JA<BR>
										1=Partial (not coordinated)<BR>
										2=Limited frequency, but present<BR>
										3=Frequent use of coordinated JA<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="si352" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Imperative/Requesting" FieldTextBoxTabIndex="89" DatabaseField="nspaimp8" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspadec8" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Declarative/Showing, Commenting" FieldTextBoxTabIndex="90" DatabaseField="nspadec8"
											ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">SUMMARY of SOCIAL INTERACTION STYLE</TD>
								</TR>
								<TR>
									<TD>Best fit:<BR>
										1=Aloof<BR>
										2=Passive<BR>
										3=Active but Odd<BR>
										4=Socially appropriate<BR>
										7=Not Administered<BR>
										8=N/A<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsscstyl" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Best Fit" FieldTextBoxTabIndex="90" DatabaseField="nsscstyl" ValidList="1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Rate the fit on a scale of 1=Does not fit to 5=Very Good Fit:</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsaloof" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Aloof" FieldTextBoxTabIndex="91" DatabaseField="nsaloof" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nspassiv" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Passive" FieldTextBoxTabIndex="92" DatabaseField="nspassiv" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nsacodd" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Active but odd" FieldTextBoxTabIndex="93" DatabaseField="nsacodd" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="nssocapp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Socially appropriate" FieldTextBoxTabIndex="94" DatabaseField="nssocapp" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="validity" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Validity (1=valid, 2=Possible problems, 3=Invalid)" FieldTextBoxTabIndex="95" DatabaseField="validity"
											ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="valcmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Validity Comments" FieldTextBoxTabIndex="95" DatabaseField="valcmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="behcmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Behavioral Comments" FieldTextBoxTabIndex="95" DatabaseField="behcmnt"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="96" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="97" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="98" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="99" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
