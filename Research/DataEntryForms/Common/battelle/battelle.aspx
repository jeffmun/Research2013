
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.battelle.battelle" CodeFile="battelle.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_battelle" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Battelle" PrimaryKeyField="batt_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" ShowScoreButton="True" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"
							AllowedStudyMeasures="190,255,309"></def:dataentrycontroller>
						<def:datafieldcontrol id="edsid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
							IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
							FieldTextBoxTabIndex="1" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
						<asp:panel id="mainPanel" Runat="server">
      <TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout" id="table_insert">
											<TR>
												<TD>
													<def:datafieldcontrol id="date" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="date"
														FieldTextBoxTabIndex="2" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="exprmtr" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="exprmtr"
														FieldTextBoxTabIndex="3" FieldLabelText="Experimenter" IsDoubleEntryField="False" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="TEXT"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px"
											DatabaseField="psagem" FieldTextBoxTabIndex="3" FieldLabelText="Age (months):" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
										<TABLE class="grid">
											<TR>
												<TD colSpan="6">Enter a raw score of -9 to indicate that a subdomain was not 
													administered<BR>
													OR Leave blank to have scoring program attempt to calculate it<BR>
													OR Enter raw score to use it instead of any calculated value
												</TD>
											</TR>
											<TR>
												<TD width="124">Subdomain</TD>
												<TD class="heading">Raw<BR>
													Score</TD>
												<TD class="heading">Percentile<BR>
													Rank</TD>
												<TD class="heading">z score</TD>
												<TD class="heading">T</TD>
												<TD class="heading" rowSpan="7">Age<BR>
													Equivalent</TD>
											</TR>
											<TR>
												<TD class="heading" width="124">Adult Interaction</TD>
												<TD>
													<def:datafieldcontrol id="psadltrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="psadltrw" FieldTextBoxTabIndex="3"
														FieldLabelText="psadltrw" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" RegEx="^([0-9]|[12][0-9]|3[0-6]|-9)$" RegExDescription="Value must be between 0-36 or -9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psadltpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="psadltpr" FieldTextBoxTabIndex="91"
														FieldLabelText="psadltpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psadltz" runat="server" FieldTextBoxWidth="50px" DatabaseField="psadltz" FieldTextBoxTabIndex="92"
														FieldLabelText="psadltz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psadltT" runat="server" FieldTextBoxWidth="50px" DatabaseField="psadltT" FieldTextBoxTabIndex="93"
														FieldLabelText="psadltT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" width="124">Expression of Feelings/Affect</TD>
												<TD>
													<def:datafieldcontrol id="psfeelrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="psfeelrw" FieldTextBoxTabIndex="3"
														FieldLabelText="psfeelrw" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-4]|-9)$" RegExDescription="Value must be between 0-24 or -9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psfeelpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="psfeelpr" FieldTextBoxTabIndex="95"
														FieldLabelText="psfeelpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psfeelz" runat="server" FieldTextBoxWidth="50px" DatabaseField="psfeelz" FieldTextBoxTabIndex="96"
														FieldLabelText="psfeelz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psfeelT" runat="server" FieldTextBoxWidth="50px" DatabaseField="psfeelT" FieldTextBoxTabIndex="97"
														FieldLabelText="psfeelT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" width="124">Self-Concept</TD>
												<TD>
													<def:datafieldcontrol id="psselfrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="psselfrw" FieldTextBoxTabIndex="3"
														FieldLabelText="psselfrw" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-8]|-9)$" RegExDescription="Value must be between 0-28 or -9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psselfpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="psselfpr" FieldTextBoxTabIndex="99"
														FieldLabelText="psselfpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psselfz" runat="server" FieldTextBoxWidth="50px" DatabaseField="psselfz" FieldTextBoxTabIndex="100"
														FieldLabelText="psselfz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="psselfT" runat="server" FieldTextBoxWidth="50px" DatabaseField="psselfT" FieldTextBoxTabIndex="101"
														FieldLabelText="psselfT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" width="124">Peer Interaction</TD>
												<TD>
													<def:datafieldcontrol id="pspeerrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="pspeerrw" FieldTextBoxTabIndex="3"
														FieldLabelText="pspeerrw" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" RegEx="^([0-9]|[12][0-9]|3[0-4]|-9)$" RegExDescription="Value must be between 0-34 or -9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pspeerpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="pspeerpr" FieldTextBoxTabIndex="103"
														FieldLabelText="pspeerpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pspeerz" runat="server" FieldTextBoxWidth="50px" DatabaseField="pspeerz" FieldTextBoxTabIndex="104"
														FieldLabelText="pspeerz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pspeerT" runat="server" FieldTextBoxWidth="50px" DatabaseField="pspeerT" FieldTextBoxTabIndex="105"
														FieldLabelText="pspeerT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" width="124">Coping</TD>
												<TD>
													<def:datafieldcontrol id="pscoprw" runat="server" FieldTextBoxWidth="40px" DatabaseField="pscoprw" FieldTextBoxTabIndex="3"
														FieldLabelText="pscoprw" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|20|-9)$" RegExDescription="Value must be between 0-20 or -9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pscoppr" runat="server" FieldTextBoxWidth="60px" DatabaseField="pscoppr" FieldTextBoxTabIndex="107"
														FieldLabelText="pscoppr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pscopz" runat="server" FieldTextBoxWidth="50px" DatabaseField="pscopz" FieldTextBoxTabIndex="108"
														FieldLabelText="pscopz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pscopT" runat="server" FieldTextBoxWidth="50px" DatabaseField="pscopT" FieldTextBoxTabIndex="109"
														FieldLabelText="pscopT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" width="124">Social Role</TD>
												<TD>
													<def:datafieldcontrol id="pssocrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="pssocrw" FieldTextBoxTabIndex="3"
														FieldLabelText="pssocrw" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-8]|-9)$" RegExDescription="Value must be between 0-28 or -9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pssocpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="pssocpr" FieldTextBoxTabIndex="111"
														FieldLabelText="pssocpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pssocz" runat="server" FieldTextBoxWidth="50px" DatabaseField="pssocz" FieldTextBoxTabIndex="112"
														FieldLabelText="pssocz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pssocT" runat="server" FieldTextBoxWidth="50px" DatabaseField="pssocT" FieldTextBoxTabIndex="113"
														FieldLabelText="pssocT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="124">Personal Social Total</TD>
												<TD>
													<def:datafieldcontrol id="pstotrw" runat="server" FieldTextBoxWidth="40px" DatabaseField="pstotrw" FieldTextBoxTabIndex="114"
														FieldLabelText="pstotrw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pstotpr" runat="server" FieldTextBoxWidth="60px" DatabaseField="pstotpr" FieldTextBoxTabIndex="115"
														FieldLabelText="pstotpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pstotz" runat="server" FieldTextBoxWidth="50px" DatabaseField="pstotz" FieldTextBoxTabIndex="116"
														FieldLabelText="pstotz" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pstotT" runat="server" FieldTextBoxWidth="50px" DatabaseField="pstotT" FieldTextBoxTabIndex="117"
														FieldLabelText="pstotT" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="pstotae" runat="server" FieldTextBoxWidth="50px" DatabaseField="pstotae" FieldTextBoxTabIndex="118"
														FieldLabelText="pstotae" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="300px"
											DatabaseField="psscrerr" FieldTextBoxTabIndex="118" FieldLabelText="Scoring Errors:" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="True" FieldDivCssClass="dataentryfield"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="300px"
											DatabaseField="psscrwrn" FieldTextBoxTabIndex="118" FieldLabelText="Scoring Warnings:" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="True" FieldDivCssClass="dataentryfield"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" style="WIDTH: 712px; HEIGHT: 1899px">
								<TR>
									<TD colSpan="2" height="21">Enter only circled items. Leave non-circled items below 
										the basal and above the ceiling blank. If an item is blank within the basal to 
										ceiling range, enter 9 for that item.</TD>
								</TR>
								<TR>
									<TD width="283">
										<TABLE class="grid" id="table_entry">
											<TR>
												<TD class="heading">Subdomain: Adult Interaction
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps01" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps01"
														FieldTextBoxTabIndex="5" FieldLabelText="PS01. Shows awareness of people" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps02" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps02"
														FieldTextBoxTabIndex="6" FieldLabelText="PS02. Looks at adult's face" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps03" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps03"
														FieldTextBoxTabIndex="7" FieldLabelText="PS03. Smiles or vocalizes in response to adult attention"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps04" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps04"
														FieldTextBoxTabIndex="8" FieldLabelText="PS04. Explores adult facial features" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps05" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps05"
														FieldTextBoxTabIndex="9" FieldLabelText="PS05. Shows desire to be picked up or held by familiar persons"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps06" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps06"
														FieldTextBoxTabIndex="10" FieldLabelText="PS06. Shows desire for personal attention" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps07" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps07"
														FieldTextBoxTabIndex="11" FieldLabelText="PS07. Plays peekaboo" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps08" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps08"
														FieldTextBoxTabIndex="12" FieldLabelText="PS08. Discriminates between familiar and unfamiliar persons"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps09" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps09"
														FieldTextBoxTabIndex="13" FieldLabelText="PS09. Continues to vocalize when imitated" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps10" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps10"
														FieldTextBoxTabIndex="14" FieldLabelText="PS10. Responds to naming of familiar person" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps11" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps11"
														FieldTextBoxTabIndex="15" FieldLabelText="PS11. Responds to adult praise, rewards, or promise of rewards"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps12" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps12"
														FieldTextBoxTabIndex="16" FieldLabelText="PS12. Helps with simple household tasks" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps13" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps13"
														FieldTextBoxTabIndex="17" FieldLabelText="PS13. Greets familiar adults spontaneously" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps14" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps14"
														FieldTextBoxTabIndex="18" FieldLabelText="PS14. Responds to social contact made by familiar adults"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps15" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps15"
														FieldTextBoxTabIndex="19" FieldLabelText="PS15. Separates easily from parent" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps16" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps16"
														FieldTextBoxTabIndex="20" FieldLabelText="PS16. Uses adults other than parents as resources" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps17" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps17"
														FieldTextBoxTabIndex="21" FieldLabelText="PS17. Initiates contacts with familiar adults" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps18" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps18"
														FieldTextBoxTabIndex="22" FieldLabelText="PS18. Asks for adult help when needed" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Expression of Feeling/Affect
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps19" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps19"
														FieldTextBoxTabIndex="23" FieldLabelText="PS19. Shows anticipatory excitement" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps20" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps20"
														FieldTextBoxTabIndex="24" FieldLabelText="PS20. Shows pleasure in frolic play" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps21" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps21"
														FieldTextBoxTabIndex="25" FieldLabelText="PS21. Expresses emotions" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps22" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps22"
														FieldTextBoxTabIndex="26" FieldLabelText="PS22. Shows affection toward people, pets, or possessions"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps23" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps23"
														FieldTextBoxTabIndex="27" FieldLabelText="PS23. Enjoys playing with other children" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps24" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps24"
														FieldTextBoxTabIndex="28" FieldLabelText="PS24. Enjoys having simple stories read" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps25" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps25"
														FieldTextBoxTabIndex="29" FieldLabelText="PS25. Expresses affection toward or liking for peer" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps26" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps26"
														FieldTextBoxTabIndex="30" FieldLabelText="PS26. Expresses enthusiasm for work or play" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps27" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps27"
														FieldTextBoxTabIndex="31" FieldLabelText="PS27. Shows sympathy toward others" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps28" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps28"
														FieldTextBoxTabIndex="32" FieldLabelText="PS28. Comforts peers in distress" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps29" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps29"
														FieldTextBoxTabIndex="33" FieldLabelText="PS29. Describes his/her feelings" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps30" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps30"
														FieldTextBoxTabIndex="34" FieldLabelText="PS30. Shows positive attitude toward school" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Self-Concept
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps31" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps31"
														FieldTextBoxTabIndex="35" FieldLabelText="PS31. Shows awareness of his/her hands" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps32" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps32"
														FieldTextBoxTabIndex="36" FieldLabelText="PS32. Responds to his/her name" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps33" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps33"
														FieldTextBoxTabIndex="37" FieldLabelText="PS33. Expresses ownership or possession" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps34" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps34"
														FieldTextBoxTabIndex="38" FieldLabelText="PS34. Identifies self in mirror" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps35" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps35"
														FieldTextBoxTabIndex="39" FieldLabelText="PS35. Shows pride in achievements" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps36" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps36"
														FieldTextBoxTabIndex="40" FieldLabelText="PS36. Knows his/her first name" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps37" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps37"
														FieldTextBoxTabIndex="41" FieldLabelText="PS37. Uses pronoun or his/her name to refer to self" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps38" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps38"
														FieldTextBoxTabIndex="42" FieldLabelText="PS38. Speaks positively of self" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps39" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps39"
														FieldTextBoxTabIndex="43" FieldLabelText="PS39. Knows his/her age" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps40" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps40"
														FieldTextBoxTabIndex="44" FieldLabelText="PS40. Calls attention to his/her performance" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps41" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps41"
														FieldTextBoxTabIndex="45" FieldLabelText="PS41. Knows his/her first and last names" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps42" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps42"
														FieldTextBoxTabIndex="46" FieldLabelText="PS42. Asserts self in socially acceptable ways" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps43" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps43"
														FieldTextBoxTabIndex="47" FieldLabelText="PS43. Performs for others" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps44" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps44"
														FieldTextBoxTabIndex="48" FieldLabelText="PS44. Demonstrates ability to 'show and tell' without major discomfort"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Peer Interaction
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps45" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps45"
														FieldTextBoxTabIndex="49" FieldLabelText="PS45. Initiates social contacts with peers in play" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps46" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps46"
														FieldTextBoxTabIndex="50" FieldLabelText="PS46. Imitates another child or children at play" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps47" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps47"
														FieldTextBoxTabIndex="51" FieldLabelText="PS47. Plays independently in company of peers" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps48" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps48"
														FieldTextBoxTabIndex="52" FieldLabelText="PS48. Plays alongside another child" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps49" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps49"
														FieldTextBoxTabIndex="53" FieldLabelText="PS49. Participates in group play" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps50" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps50"
														FieldTextBoxTabIndex="54" FieldLabelText="PS50. Shares property with others" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps51" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps51"
														FieldTextBoxTabIndex="55" FieldLabelText="PS51. Interacts with peers" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps52" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps52"
														FieldTextBoxTabIndex="56" FieldLabelText="PS52. Has special friends" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps53" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps53"
														FieldTextBoxTabIndex="57" FieldLabelText="PS53. Chooses his/her own friends" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps54" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps54"
														FieldTextBoxTabIndex="58" FieldLabelText="PS54. Plays cooperatively with peers" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps55" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps55"
														FieldTextBoxTabIndex="59" FieldLabelText="PS55. Cooperates in group activities" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps56" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps56"
														FieldTextBoxTabIndex="60" FieldLabelText="PS56. Takes turns and shares" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps57" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps57"
														FieldTextBoxTabIndex="61" FieldLabelText="PS57. Initiates social contacts and interactions with peers"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps58" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps58"
														FieldTextBoxTabIndex="62" FieldLabelText="PS58. Participates in competitive play activities" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps59" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps59"
														FieldTextBoxTabIndex="63" FieldLabelText="PS59. Uses peers as resources" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps60" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps60"
														FieldTextBoxTabIndex="64" FieldLabelText="PS60. Gives ideas to other children as well as going along with their ideas"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps61" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps61"
														FieldTextBoxTabIndex="65" FieldLabelText="PS61. Serves as leader in peer relationships" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Coping
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps62" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps62"
														FieldTextBoxTabIndex="66" FieldLabelText="PS62. Generally follows directions related to daily routine"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps63" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps63"
														FieldTextBoxTabIndex="67" FieldLabelText="PS63. Follows rules given by adult for playing simple childhood games"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps64" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps64"
														FieldTextBoxTabIndex="68" FieldLabelText="PS64. Complies with adult directives" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps65" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps65"
														FieldTextBoxTabIndex="69" FieldLabelText="PS65. Follows classroom rules and directions" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps66" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps66"
														FieldTextBoxTabIndex="70" FieldLabelText="PS66. Waits his/her turn for teacher or adult's attention"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps67" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps67"
														FieldTextBoxTabIndex="71" FieldLabelText="PS67. Seeks alternatives without adult assistance when faced with problem"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps68" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps68"
														FieldTextBoxTabIndex="72" FieldLabelText="PS68. Copes with criticism and teasing" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps69" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps69"
														FieldTextBoxTabIndex="73" FieldLabelText="PS69. Participates in new situations" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps70" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps70"
														FieldTextBoxTabIndex="74" FieldLabelText="PS70. Uses adults to help in handling peer aggression directed toward self"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps71" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps71"
														FieldTextBoxTabIndex="75" FieldLabelText="PS71. Copes independently with peer aggression directed toward self"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Social Role
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps72" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps72"
														FieldTextBoxTabIndex="76" FieldLabelText="PS72. Engages in adult role-playing" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps73" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps73"
														FieldTextBoxTabIndex="77" FieldLabelText="PS73. Dramatizes in play" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps74" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps74"
														FieldTextBoxTabIndex="78" FieldLabelText="PS74. Knows whether he/she is male/female" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps75" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps75"
														FieldTextBoxTabIndex="79" FieldLabelText="PS75. Is aware of differences between male and female" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps76" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps76"
														FieldTextBoxTabIndex="80" FieldLabelText="PS76. Recognizes facial expressions of primary emotions"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps77" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps77"
														FieldTextBoxTabIndex="81" FieldLabelText="PS77. Engages in adult role-playing and imitation" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps78" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps78"
														FieldTextBoxTabIndex="82" FieldLabelText="PS78. Recognizes another's need for help and gives assistance"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps79" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps79"
														FieldTextBoxTabIndex="83" FieldLabelText="PS79. Respects property and rights of others" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps80" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps80"
														FieldTextBoxTabIndex="84" FieldLabelText="PS80. Asks permission to use others' possessions" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps81" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps81"
														FieldTextBoxTabIndex="85" FieldLabelText="PS81. Recognizes feelings of others" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps82" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps82"
														FieldTextBoxTabIndex="86" FieldLabelText="PS82. Discriminates between socially acceptable and nonacceptable behavior"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps83" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps83"
														FieldTextBoxTabIndex="87" FieldLabelText="PS83. Differentiates present and future social roles" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps84" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps84"
														FieldTextBoxTabIndex="88" FieldLabelText="PS84. Shows moral responsibility" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps85" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="ps85"
														FieldTextBoxTabIndex="89" FieldLabelText="PS85. Admits responsibility for errors or wrongdoing" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE><BR><BR>
<def:datafieldcontrol id="psbeh" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="200px" DatabaseField="psbeh"
								FieldTextBoxTabIndex="89" FieldLabelText="Behavioral Comments" IsDoubleEntryField="False"
								IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="255"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>1= 
      Valid<BR>2= Question validity (describe below)<BR>3= Invalid data 
      (describe below)<BR>
<def:datafieldcontrol id="psvld" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="40px" DatabaseField="psvld"
								FieldTextBoxTabIndex="90" FieldLabelText="Validity" IsDoubleEntryField="True"
								IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol><BR>
<def:datafieldcontrol id="pscmt" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="200px" DatabaseField="pscmt"
								FieldTextBoxTabIndex="91" FieldLabelText="Validity Comments" IsDoubleEntryField="False"
								IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="255"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="98"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="99"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="100"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="101"
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
							</TABLE></asp:panel>
					</asp:Content>
