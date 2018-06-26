
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="EDST3DataEntryForms.edst2_battsoc.edst2_battsoc" CodeFile="edst2_battsoc.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="255" VerifiedField="verified"
							PrimaryKeyField="batt_pk" MeasureName="EDST2 Battelle Soc" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False"
							LookupField1="edsid" DatabaseTable="edst2_battelle" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td style="vertical-align:top">
									<table class="layout" id="table_insert">
										<tr>
											<td><def:datafieldcontrol id="edsid" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="edsid"
													FieldTextBoxTabIndex="1" FieldLabelText="EDS ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="date" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="date"
													FieldTextBoxTabIndex="2" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="exprmtr" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="exprmtr"
													FieldTextBoxTabIndex="3" FieldLabelText="Experimenter" IsDoubleEntryField="False" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px"
										DatabaseField="psagem" FieldTextBoxTabIndex="3" FieldLabelText="Age (months):" IsDoubleEntryField="False"
										IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
									<TABLE class="grid">
										<tr>
											<td colspan="6">Enter a raw score of -9 to indicate that a subdomain was not 
												administered<br>
												OR Leave blank to have scoring program attempt to calculate it<br>
												OR Enter raw score to use it instead of any calculated value
											</td>
										</tr>
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
											<TD><def:datafieldcontrol id="psadltrw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="psadltrw"
													FieldTextBoxTabIndex="3" DatabaseField="psadltrw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" RegEx="^([0-9]|[12][0-9]|3[0-6]|-9)$" RegExDescription="Value must be between 0-36 or -9"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psadltpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psadltpr"
													FieldTextBoxTabIndex="91" DatabaseField="psadltpr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psadltz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psadltz"
													FieldTextBoxTabIndex="92" DatabaseField="psadltz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psadltT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psadltT"
													FieldTextBoxTabIndex="93" DatabaseField="psadltT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD class="heading" width="124">Expression of Feelings/Affect</TD>
											<TD><def:datafieldcontrol id="psfeelrw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="psfeelrw"
													FieldTextBoxTabIndex="3" DatabaseField="psfeelrw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-4]|-9)$" RegExDescription="Value must be between 0-24 or -9"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psfeelpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psfeelpr"
													FieldTextBoxTabIndex="95" DatabaseField="psfeelpr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psfeelz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psfeelz"
													FieldTextBoxTabIndex="96" DatabaseField="psfeelz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psfeelT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psfeelT"
													FieldTextBoxTabIndex="97" DatabaseField="psfeelT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD class="heading" width="124">Self-Concept</TD>
											<TD><def:datafieldcontrol id="psselfrw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="psselfrw"
													FieldTextBoxTabIndex="3" DatabaseField="psselfrw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-8]|-9)$" RegExDescription="Value must be between 0-28 or -9"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psselfpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psselfpr"
													FieldTextBoxTabIndex="99" DatabaseField="psselfpr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psselfz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psselfz"
													FieldTextBoxTabIndex="100" DatabaseField="psselfz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="psselfT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="psselfT"
													FieldTextBoxTabIndex="101" DatabaseField="psselfT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD class="heading" width="124">Peer Interaction</TD>
											<TD><def:datafieldcontrol id="pspeerrw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="pspeerrw"
													FieldTextBoxTabIndex="3" DatabaseField="pspeerrw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" RegEx="^([0-9]|[12][0-9]|3[0-4]|-9)$" RegExDescription="Value must be between 0-34 or -9"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pspeerpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pspeerpr"
													FieldTextBoxTabIndex="103" DatabaseField="pspeerpr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pspeerz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pspeerz"
													FieldTextBoxTabIndex="104" DatabaseField="pspeerz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pspeerT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pspeerT"
													FieldTextBoxTabIndex="105" DatabaseField="pspeerT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD class="heading" width="124">Coping</TD>
											<TD><def:datafieldcontrol id="pscoprw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="pscoprw"
													FieldTextBoxTabIndex="3" DatabaseField="pscoprw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|20|-9)$" RegExDescription="Value must be between 0-20 or -9"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pscoppr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pscoppr"
													FieldTextBoxTabIndex="107" DatabaseField="pscoppr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pscopz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pscopz"
													FieldTextBoxTabIndex="108" DatabaseField="pscopz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pscopT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pscopT"
													FieldTextBoxTabIndex="109" DatabaseField="pscopT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD class="heading" width="124">Social Role</TD>
											<TD><def:datafieldcontrol id="pssocrw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="pssocrw"
													FieldTextBoxTabIndex="3" DatabaseField="pssocrw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-8]|-9)$" RegExDescription="Value must be between 0-28 or -9"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pssocpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pssocpr"
													FieldTextBoxTabIndex="111" DatabaseField="pssocpr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pssocz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pssocz"
													FieldTextBoxTabIndex="112" DatabaseField="pssocz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pssocT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pssocT"
													FieldTextBoxTabIndex="113" DatabaseField="pssocT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD width="124">Personal Social Total</TD>
											<TD><def:datafieldcontrol id="pstotrw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pstotrw"
													FieldTextBoxTabIndex="114" DatabaseField="pstotrw" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pstotpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pstotpr"
													FieldTextBoxTabIndex="115" DatabaseField="pstotpr" FieldTextBoxWidth="60px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pstotz" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pstotz"
													FieldTextBoxTabIndex="116" DatabaseField="pstotz" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pstotT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pstotT"
													FieldTextBoxTabIndex="117" DatabaseField="pstotT" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False" ShowAllForLayout="False"></def:datafieldcontrol></TD>
											<TD><def:datafieldcontrol id="pstotae" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="pstotae"
													FieldTextBoxTabIndex="118" DatabaseField="pstotae" FieldTextBoxWidth="50px" RenderReadOnlyAsDiv="True"
													ShowFieldLabel="False"></def:datafieldcontrol></TD>
										</TR>
									</TABLE>
									<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="Scoring Errors:" FieldTextBoxTabIndex="118" DatabaseField="psscrerr"
										FieldTextBoxWidth="300px" FieldLabelWidth="150px" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"
										FieldDivCssClass="dataentryfield"></def:datafieldcontrol><br>
									<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="TEXT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="Scoring Warnings:" FieldTextBoxTabIndex="118" DatabaseField="psscrwrn"
										FieldTextBoxWidth="300px" FieldLabelWidth="150px" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"
										FieldDivCssClass="dataentryfield"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
      <TABLE class="layout">
								<TR>
									<TD colSpan="2">Enter only circled items. Leave non-circled items below the basal 
										and above the ceiling blank. If an item is blank within the basal to ceiling 
										range, enter 9 for that item.</TD>
								</TR>
								<TR>
									<TD width="260">
										<TABLE class="grid" id="table_entry">
											<TR>
												<TD class="heading">Subdomain: Adult Interaction
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS01. Shows awareness of people"
														FieldTextBoxTabIndex="5" DatabaseField="ps01" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS02. Looks at adult's face"
														FieldTextBoxTabIndex="6" DatabaseField="ps02" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS03. Smiles or vocalizes in response to adult attention"
														FieldTextBoxTabIndex="7" DatabaseField="ps03" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS04. Explores adult facial features"
														FieldTextBoxTabIndex="8" DatabaseField="ps04" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS05. Shows desire to be picked up or held by familiar persons"
														FieldTextBoxTabIndex="9" DatabaseField="ps05" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS06. Shows desire for personal attention"
														FieldTextBoxTabIndex="10" DatabaseField="ps06" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS07. Plays peekaboo"
														FieldTextBoxTabIndex="11" DatabaseField="ps07" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS08. Discriminates between familiar and unfamiliar persons"
														FieldTextBoxTabIndex="12" DatabaseField="ps08" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS09. Continues to vocalize when imitated"
														FieldTextBoxTabIndex="13" DatabaseField="ps09" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS10. Responds to naming of familiar person"
														FieldTextBoxTabIndex="14" DatabaseField="ps10" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS11. Responds to adult praise, rewards, or promise of rewards"
														FieldTextBoxTabIndex="15" DatabaseField="ps11" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS12. Helps with simple household tasks"
														FieldTextBoxTabIndex="16" DatabaseField="ps12" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS13. Greets familiar adults spontaneously"
														FieldTextBoxTabIndex="17" DatabaseField="ps13" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS14. Responds to social contact made by familiar adults"
														FieldTextBoxTabIndex="18" DatabaseField="ps14" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS15. Separates easily from parent"
														FieldTextBoxTabIndex="19" DatabaseField="ps15" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS16. Uses adults other than parents as resources"
														FieldTextBoxTabIndex="20" DatabaseField="ps16" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS17. Initiates contacts with familiar adults"
														FieldTextBoxTabIndex="21" DatabaseField="ps17" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS18. Asks for adult help when needed"
														FieldTextBoxTabIndex="22" DatabaseField="ps18" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Expression of Feeling/Affect
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS19. Shows anticipatory excitement"
														FieldTextBoxTabIndex="23" DatabaseField="ps19" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS20. Shows pleasure in frolic play"
														FieldTextBoxTabIndex="24" DatabaseField="ps20" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS21. Expresses emotions"
														FieldTextBoxTabIndex="25" DatabaseField="ps21" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS22. Shows affection toward people, pets, or possessions"
														FieldTextBoxTabIndex="26" DatabaseField="ps22" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS23. Enjoys playing with other children"
														FieldTextBoxTabIndex="27" DatabaseField="ps23" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS24. Enjoys having simple stories read"
														FieldTextBoxTabIndex="28" DatabaseField="ps24" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS25. Expresses affection toward or liking for peer"
														FieldTextBoxTabIndex="29" DatabaseField="ps25" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS26. Expresses enthusiasm for work or play"
														FieldTextBoxTabIndex="30" DatabaseField="ps26" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS27. Shows sympathy toward others"
														FieldTextBoxTabIndex="31" DatabaseField="ps27" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS28. Comforts peers in distress"
														FieldTextBoxTabIndex="32" DatabaseField="ps28" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS29. Describes his/her feelings"
														FieldTextBoxTabIndex="33" DatabaseField="ps29" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps30" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS30. Shows positive attitude toward school"
														FieldTextBoxTabIndex="34" DatabaseField="ps30" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Self-Concept
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps31" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS31. Shows awareness of his/her hands"
														FieldTextBoxTabIndex="35" DatabaseField="ps31" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps32" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS32. Responds to his/her name"
														FieldTextBoxTabIndex="36" DatabaseField="ps32" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps33" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS33. Expresses ownership or possession"
														FieldTextBoxTabIndex="37" DatabaseField="ps33" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps34" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS34. Identifies self in mirror"
														FieldTextBoxTabIndex="38" DatabaseField="ps34" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps35" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS35. Shows pride in achievements"
														FieldTextBoxTabIndex="39" DatabaseField="ps35" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps36" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS36. Knows his/her first name"
														FieldTextBoxTabIndex="40" DatabaseField="ps36" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps37" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS37. Uses pronoun or his/her name to refer to self"
														FieldTextBoxTabIndex="41" DatabaseField="ps37" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps38" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS38. Speaks positively of self"
														FieldTextBoxTabIndex="42" DatabaseField="ps38" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps39" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS39. Knows his/her age"
														FieldTextBoxTabIndex="43" DatabaseField="ps39" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps40" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS40. Calls attention to his/her performance"
														FieldTextBoxTabIndex="44" DatabaseField="ps40" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps41" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS41. Knows his/her first and last names"
														FieldTextBoxTabIndex="45" DatabaseField="ps41" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps42" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS42. Asserts self in socially acceptable ways"
														FieldTextBoxTabIndex="46" DatabaseField="ps42" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps43" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS43. Performs for others"
														FieldTextBoxTabIndex="47" DatabaseField="ps43" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps44" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS44. Demonstrates ability to 'show and tell' without major discomfort"
														FieldTextBoxTabIndex="48" DatabaseField="ps44" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
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
													<def:datafieldcontrol id="ps45" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS45. Initiates social contacts with peers in play"
														FieldTextBoxTabIndex="49" DatabaseField="ps45" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps46" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS46. Imitates another child or children at play"
														FieldTextBoxTabIndex="50" DatabaseField="ps46" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps47" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS47. Plays independently in company of peers"
														FieldTextBoxTabIndex="51" DatabaseField="ps47" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps48" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS48. Plays alongside another child"
														FieldTextBoxTabIndex="52" DatabaseField="ps48" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps49" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS49. Participates in group play"
														FieldTextBoxTabIndex="53" DatabaseField="ps49" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps50" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS50. Shares property with others"
														FieldTextBoxTabIndex="54" DatabaseField="ps50" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps51" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS51. Interacts with peers"
														FieldTextBoxTabIndex="55" DatabaseField="ps51" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps52" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS52. Has special friends"
														FieldTextBoxTabIndex="56" DatabaseField="ps52" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps53" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS53. Chooses his/her own friends"
														FieldTextBoxTabIndex="57" DatabaseField="ps53" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps54" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS54. Plays cooperatively with peers"
														FieldTextBoxTabIndex="58" DatabaseField="ps54" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps55" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS55. Cooperates in group activities"
														FieldTextBoxTabIndex="59" DatabaseField="ps55" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps56" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS56. Takes turns and shares"
														FieldTextBoxTabIndex="60" DatabaseField="ps56" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps57" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS57. Initiates social contacts and interactions with peers"
														FieldTextBoxTabIndex="61" DatabaseField="ps57" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps58" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS58. Participates in competitive play activities"
														FieldTextBoxTabIndex="62" DatabaseField="ps58" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps59" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS59. Uses peers as resources"
														FieldTextBoxTabIndex="63" DatabaseField="ps59" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps60" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS60. Gives ideas to other children as well as going along with their ideas"
														FieldTextBoxTabIndex="64" DatabaseField="ps60" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps61" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS61. Serves as leader in peer relationships"
														FieldTextBoxTabIndex="65" DatabaseField="ps61" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Coping
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps62" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS62. Generally follows directions related to daily routine"
														FieldTextBoxTabIndex="66" DatabaseField="ps62" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps63" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS63. Follows rules given by adult for playing simple childhood games"
														FieldTextBoxTabIndex="67" DatabaseField="ps63" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps64" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS64. Complies with adult directives"
														FieldTextBoxTabIndex="68" DatabaseField="ps64" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps65" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS65. Follows classroom rules and directions"
														FieldTextBoxTabIndex="69" DatabaseField="ps65" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps66" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS66. Waits his/her turn for teacher or adult's attention"
														FieldTextBoxTabIndex="70" DatabaseField="ps66" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps67" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS67. Seeks alternatives without adult assistance when faced with problem"
														FieldTextBoxTabIndex="71" DatabaseField="ps67" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps68" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS68. Copes with criticism and teasing"
														FieldTextBoxTabIndex="72" DatabaseField="ps68" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps69" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS69. Participates in new situations"
														FieldTextBoxTabIndex="73" DatabaseField="ps69" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps70" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS70. Uses adults to help in handling peer aggression directed toward self"
														FieldTextBoxTabIndex="74" DatabaseField="ps70" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps71" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS71. Copes independently with peer aggression directed toward self"
														FieldTextBoxTabIndex="75" DatabaseField="ps71" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Subdomain: Social Role
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps72" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS72. Engages in adult role-playing"
														FieldTextBoxTabIndex="76" DatabaseField="ps72" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps73" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS73. Dramatizes in play"
														FieldTextBoxTabIndex="77" DatabaseField="ps73" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps74" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS74. Knows whether he/she is male/female"
														FieldTextBoxTabIndex="78" DatabaseField="ps74" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps75" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS75. Is aware of differences between male and female"
														FieldTextBoxTabIndex="79" DatabaseField="ps75" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps76" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS76. Recognizes facial expressions of primary emotions"
														FieldTextBoxTabIndex="80" DatabaseField="ps76" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps77" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS77. Engages in adult role-playing and imitation"
														FieldTextBoxTabIndex="81" DatabaseField="ps77" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps78" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS78. Recognizes another's need for help and gives assistance"
														FieldTextBoxTabIndex="82" DatabaseField="ps78" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps79" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS79. Respects property and rights of others"
														FieldTextBoxTabIndex="83" DatabaseField="ps79" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps80" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS80. Asks permission to use others' possessions"
														FieldTextBoxTabIndex="84" DatabaseField="ps80" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps81" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS81. Recognizes feelings of others"
														FieldTextBoxTabIndex="85" DatabaseField="ps81" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps82" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS82. Discriminates between socially acceptable and nonacceptable behavior"
														FieldTextBoxTabIndex="86" DatabaseField="ps82" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps83" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS83. Differentiates present and future social roles"
														FieldTextBoxTabIndex="87" DatabaseField="ps83" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps84" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS84. Shows moral responsibility"
														FieldTextBoxTabIndex="88" DatabaseField="ps84" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ps85" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="PS85. Admits responsibility for errors or wrongdoing"
														FieldTextBoxTabIndex="89" DatabaseField="ps85" FieldTextBoxWidth="30px" FieldLabelWidth="250px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE><BR><BR>
<def:datafieldcontrol id="psbeh" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False"
								FieldLabelText="Behavioral Comments" FieldTextBoxTabIndex="89" DatabaseField="psbeh"
								FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldTextBoxMaxLength="255"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>1= 
      Valid<BR>2= Question validity (describe below)<BR>3= Invalid data 
      (describe below)<BR>
<def:datafieldcontrol id="psvld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
								FieldLabelText="Validity" FieldTextBoxTabIndex="90" DatabaseField="psvld"
								FieldTextBoxWidth="40px" FieldLabelWidth="100px" ValidList="1,2,3"></def:datafieldcontrol><BR>
<def:datafieldcontrol id="pscmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False"
								FieldLabelText="Validity Comments" FieldTextBoxTabIndex="91" DatabaseField="pscmt"
								FieldTextBoxWidth="200px" FieldLabelWidth="100px" FieldTextBoxMaxLength="255"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="98" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="99" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="100" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="101" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel></asp:Content>
