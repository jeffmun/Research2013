<%@ Page language="c#" Inherits="GenericDataEntryForms.teacher_battelle.teacher_battelle" CodeFile="teacher_battelle.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_tch_battelle" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Teacher Battelle" PrimaryKeyField="tbat_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="280,323" ShowScoreButton="True" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="1" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="batdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="2" DatabaseField="batdate" FormatString="{0:d}" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="100px"
								DatabaseField="batagem" FieldTextBoxTabIndex="3" FieldLabelText="Age (months):" IsDoubleEntryField="False"
								IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<TABLE class="grid">
								<TR>
									<TD width="124">Subdomain</TD>
									<TD class="heading">Raw<BR>
										Score</TD>
									<TD class="heading">Percentile<BR>
										Rank</TD>
									<TD class="heading">z score</TD>
									<TD class="heading">T</TD>
								</TR>
								<TR>
									<TD class="heading" width="124">Expression of Feelings/Affect</TD>
									<TD>
										<def:datafieldcontrol id="psfeelrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="batfelrw" FieldTextBoxTabIndex="3"
											FieldLabelText="psfeelrw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											RegExDescription="Value must be between 0-24 or -9" RegEx="^([0-9]|1[0-9]|2[0-4]|-9)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="psfeelpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="batfelpr" FieldTextBoxTabIndex="95"
											FieldLabelText="psfeelpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="psfeelz" runat="server" FieldTextBoxWidth="50px" DatabaseField="batfelz" FieldTextBoxTabIndex="96"
											FieldLabelText="psfeelz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="psfeelT" runat="server" FieldTextBoxWidth="50px" DatabaseField="batfelT" FieldTextBoxTabIndex="97"
											FieldLabelText="psfeelT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="124">Peer Interaction</TD>
									<TD>
										<def:datafieldcontrol id="pspeerrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="batperrw" FieldTextBoxTabIndex="3"
											FieldLabelText="pspeerrw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											RegExDescription="Value must be between 0-34 or -9" RegEx="^([0-9]|[12][0-9]|3[0-4]|-9)$" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pspeerpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="batperpr" FieldTextBoxTabIndex="103"
											FieldLabelText="pspeerpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pspeerz" runat="server" FieldTextBoxWidth="50px" DatabaseField="batperz" FieldTextBoxTabIndex="104"
											FieldLabelText="pspeerz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pspeerT" runat="server" FieldTextBoxWidth="50px" DatabaseField="batperT" FieldTextBoxTabIndex="105"
											FieldLabelText="pspeerT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="batscwrn" runat="server" FieldTextBoxWidth="300px" FieldLabelWidth="150px" DatabaseField="batscwrn"
								FieldTextBoxTabIndex="118" FieldLabelText="Scoring Warnings:" IsDoubleEntryField="False" IsReadOnly="True"
								IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="True" FieldDivCssClass="dataentryfield"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="batscerr" runat="server" FieldTextBoxWidth="300px" FieldLabelWidth="150px" DatabaseField="batscerr"
								FieldTextBoxTabIndex="118" FieldLabelText="Scoring Errors:" IsDoubleEntryField="False" IsReadOnly="True"
								IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="True" FieldDivCssClass="dataentryfield"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="consenttch" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											DatabaseField="consenttch" FieldTextBoxTabIndex="3" FieldLabelText="Teacher signed consent? 1=yes, 0=no, 9=unknown"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">2=Typically (90% or more)<BR>
										1=Sometimes (50%)<BR>
										0=Rarely or Never<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Subdomain: Expression of Feeling/Affect</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat01"
											FieldTextBoxTabIndex="5" FieldLabelText="1. Shows anticipatory excitement." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat02"
											FieldTextBoxTabIndex="6" FieldLabelText="2. Shows pleasure in frolic play." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat03"
											FieldTextBoxTabIndex="7" FieldLabelText="3. Expresses emotions." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat04"
											FieldTextBoxTabIndex="8" FieldLabelText="4. Shows affection toward people, pets, or possessions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat05"
											FieldTextBoxTabIndex="9" FieldLabelText="5. Enjoys playing with other children." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat06"
											FieldTextBoxTabIndex="10" FieldLabelText="6. Enjoys having simple stories read." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat07"
											FieldTextBoxTabIndex="11" FieldLabelText="7. Expresses affection toward or liking for peer." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat08"
											FieldTextBoxTabIndex="12" FieldLabelText="8. Expresses enthusiasm for work or play." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat09"
											FieldTextBoxTabIndex="13" FieldLabelText="9. Shows sympathy toward others." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat10"
											FieldTextBoxTabIndex="14" FieldLabelText="10. Comforts peers in distress." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat11"
											FieldTextBoxTabIndex="15" FieldLabelText="11. Describes his/her feelings." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat12"
											FieldTextBoxTabIndex="16" FieldLabelText="12. Shows positive attitude toward school." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">

								<TR>
									<TD class="heading">Subdomain: Peer Interaction
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat13"
											FieldTextBoxTabIndex="17" FieldLabelText="13. Initiates social contact with peers in play." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat14"
											FieldTextBoxTabIndex="18" FieldLabelText="14. Imitates another child or children at play." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat15"
											FieldTextBoxTabIndex="19" FieldLabelText="15. Plays independently in company of peers." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat16"
											FieldTextBoxTabIndex="20" FieldLabelText="16. Plays alongside another child." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat17"
											FieldTextBoxTabIndex="21" FieldLabelText="17. Participates in group play." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat18"
											FieldTextBoxTabIndex="22" FieldLabelText="18. Shares property with others." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat19"
											FieldTextBoxTabIndex="23" FieldLabelText="19. Interacts with peers." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat20"
											FieldTextBoxTabIndex="24" FieldLabelText="20. Has special friends." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat21"
											FieldTextBoxTabIndex="25" FieldLabelText="21. Chooses his/her own friends." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat22"
											FieldTextBoxTabIndex="26" FieldLabelText="22. Plays cooperatively with peers." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat23"
											FieldTextBoxTabIndex="27" FieldLabelText="23. Cooperates in group activities." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat24"
											FieldTextBoxTabIndex="28" FieldLabelText="24. Takes turns and shares." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat25"
											FieldTextBoxTabIndex="29" FieldLabelText="25. Initiates social contacts and interactions with peers."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat26"
											FieldTextBoxTabIndex="30" FieldLabelText="26. Participates in competitive play activities." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat27"
											FieldTextBoxTabIndex="31" FieldLabelText="27. Uses peers as resources." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat28"
											FieldTextBoxTabIndex="32" FieldLabelText="28. Gives ideas to other children as well as going along with their ideas"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="bat29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="bat29"
											FieldTextBoxTabIndex="33" FieldLabelText="29. Serves as leader in peer relationships." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="34"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="35"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="36"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="37"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
									<TR>
										<TD>
											<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="237"
												FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
												IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									</TR>
									<TR>
										<TD>
											<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="238"
												FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
												IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
