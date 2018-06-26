<%@ Page language="c#" Inherits="GenericDataEntryForms.mcdi.mcdi_wg" CodeFile="mcdi_wg.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" 
							LookupField1DataType="TEXT" VerifiedField="verified" PrimaryKeyField="mwg_pk" MeasureName="MCDI: Words and Gestures"
							LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_mcdi_wg"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"
							AllowedStudyMeasures="576,714,1167,1208,1209,1447,1493,1605,1606,1740,1789,1838,1864,1876,1877,1878,2039,2191,2224,2344,2566,2567,2568,2569,2570,2571,2572,2573,2788,2802,2819,2849,2915,2940" ></def:dataentrycontroller>
						<h3>MCDI - Words and Gestures</h3>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="40px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server"><BR>
      <TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwgdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date"
														FieldTextBoxTabIndex="5" DatabaseField="mwgdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwgrelat" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Relation to Child"
														FieldTextBoxTabIndex="6" DatabaseField="mwgrelat" FieldLabelWidth="80px"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwgsex" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sex:"
														FieldTextBoxTabIndex="7" DatabaseField="mwgsex" FieldLabelWidth="80px" ValidList="M,F,9" FieldTextBoxMaxLength="50"
														RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwgdob" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DOB:"
														FieldTextBoxTabIndex="8" DatabaseField="mwgdob" FieldLabelWidth="80px" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwgagem" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (months):"
														FieldTextBoxTabIndex="9" DatabaseField="mwgagem" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
      <H4>Part I: Early Words</H4>
      <TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=YES, 2=NO, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgrname" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A1. Responds when name is called"
											FieldTextBoxTabIndex="10" DatabaseField="mwgrname" FieldLabelWidth="250px" FieldTextBoxWidth="40px"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgrno" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText='A2. Responds to "no no"'
											FieldTextBoxTabIndex="11" DatabaseField="mwgrno" FieldLabelWidth="250px" FieldTextBoxWidth="40px"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgrmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A3. Reacts to &quot;there's mommy/daddy&quot;"
											FieldTextBoxTabIndex="12" DatabaseField="mwgrmom" FieldLabelWidth="250px" FieldTextBoxWidth="40px"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgphrur" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B. Phrases understood (use -9 for missing)"
											FieldTextBoxTabIndex="13" DatabaseField="mwgphrur" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD class="heading">1=YES, 2=NO, 9=Missing</TD>
									<TD class="heading">Percent "yes" at<BR>
										this child's age</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgimit" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C1. Imitation"
											FieldTextBoxTabIndex="15" DatabaseField="mwgimit" FieldLabelWidth="100px" FieldTextBoxWidth="40px"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgimitp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgimitp"
											FieldTextBoxTabIndex="16" DatabaseField="mwgimitp" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwglabl" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C2. Labeling"
											FieldTextBoxTabIndex="17" DatabaseField="mwglabl" FieldLabelWidth="100px" FieldTextBoxWidth="40px"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwglablp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwglablp"
											FieldTextBoxTabIndex="18" DatabaseField="mwglablp" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgundr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D1. Words understood (use -9 for missing)"
											FieldTextBoxTabIndex="19" DatabaseField="mwgundr" FieldLabelWidth="200px" FieldTextBoxWidth="60px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgprodr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D2. Words produced (use -9 for missing)"
											FieldTextBoxTabIndex="21" DatabaseField="mwgprodr" FieldLabelWidth="200px" FieldTextBoxWidth="60px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <H4>Part II: Actions and Gestures</H4>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgerlyr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A-B. Early Gestures (use -9 for missing)"
											FieldTextBoxTabIndex="23" DatabaseField="mwgerlyr" FieldLabelWidth="150px" FieldTextBoxWidth="60px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwglatr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C-E. Later Gestures (use -9 for missing)"
											FieldTextBoxTabIndex="25" DatabaseField="mwglatr" FieldLabelWidth="150px" FieldTextBoxWidth="60px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgtotr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A-E. Total Gestures (use -9 for missing)"
											FieldTextBoxTabIndex="27" DatabaseField="mwgtotr" FieldLabelWidth="150px" FieldTextBoxWidth="60px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwgpreto" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="F. Pretend Objects (1=YES, 2=NO, 9=Missing)"
											FieldTextBoxTabIndex="29" DatabaseField="mwgpreto" FieldLabelWidth="250px" FieldTextBoxWidth="40px"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
<def:datafieldcontrol id="mwgcmnt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False"
								FieldLabelText="Comments" FieldTextBoxTabIndex="30" DatabaseField="mwgcmnt"
								FieldLabelWidth="100px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="300"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>
      <H4>CDI Summary</H4>**Age Equivalent is the age at which the raw score is 
      at the 50th percentile. 
      <TABLE class="grid">
								<TR>
									<TD class="heading">Section</TD>
									<TD class="heading">Raw Score</TD>
									<TD class="heading">Percentile<BR>
										Score</TD>
									<TD class="heading">**Age<BR>
										Equivalent<BR>
										(months)</TD>
								</TR>
								<TR>
									<TD>Phrases understood</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mwgphrut" FieldTextBoxTabIndex="14" DatabaseField="mwgphrur"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="361"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgphrup" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgphrut"
											FieldTextBoxTabIndex="14" DatabaseField="mwgphrut" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="194"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgphaet" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgphaet"
											FieldTextBoxTabIndex="14" DatabaseField="mwgphaet" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="171"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Vocabulary comprehension</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mwgphrut" FieldTextBoxTabIndex="14" DatabaseField="mwgundr"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="362"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgundp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgundt"
											FieldTextBoxTabIndex="20" DatabaseField="mwgundt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgunaet" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgunaet"
											FieldTextBoxTabIndex="14" DatabaseField="mwgunaet" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="172"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Vocabulary production</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mwgphrut" FieldTextBoxTabIndex="14" DatabaseField="mwgprodr"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="363"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgprodp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgprodt"
											FieldTextBoxTabIndex="22" DatabaseField="mwgprodt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgpraet" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgpraet"
											FieldTextBoxTabIndex="14" DatabaseField="mwgpraet" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="173"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Early gestures</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mwgphrut" FieldTextBoxTabIndex="14" DatabaseField="mwgerlyr"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="364"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgerlyp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgerlyt"
											FieldTextBoxTabIndex="24" DatabaseField="mwgerlyt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgegaet" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgegaet"
											FieldTextBoxTabIndex="14" DatabaseField="mwgegaet" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="174"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Later gestures</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mwgphrut" FieldTextBoxTabIndex="14" DatabaseField="mwglatr"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="365"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwglatp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwglatt"
											FieldTextBoxTabIndex="26" DatabaseField="mwglatt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwglgaet" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwglgaet"
											FieldTextBoxTabIndex="14" DatabaseField="mwglgaet" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="175"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Total gestures</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mwgphrut" FieldTextBoxTabIndex="14" DatabaseField="mwgtotr"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgtotp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgtott"
											FieldTextBoxTabIndex="28" DatabaseField="mwgtott" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="146"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwgtgaet" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mwgtgaet"
											FieldTextBoxTabIndex="14" DatabaseField="mwgtgaet" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
								IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring status:"
								FieldTextBoxTabIndex="28" DatabaseField="scoremsg" FieldLabelWidth="100px"
								RenderReadOnlyAsDiv="True" ShowFieldLabel="True"></def:datafieldcontrol><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="32" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="33" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="34" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="35" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scored" FieldTextBoxTabIndex="34" DatabaseField="scored"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scoredBy" FieldTextBoxTabIndex="35" DatabaseField="scoredBy"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE></asp:panel></asp:Content>
