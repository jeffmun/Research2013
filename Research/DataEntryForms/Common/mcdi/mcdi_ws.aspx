<%@ Page language="c#" Inherits="GenericDataEntryForms.mcdi.mcdi_ws" CodeFile="mcdi_ws.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_mcdi_ws" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="MCDI: Words and Sentences"
							PrimaryKeyField="mws_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="716,715,2115"
							ShowScoreButton="True" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<h3>MCDI - Words and Sentences</h3>
						<table id="table_insert" class="tblinsert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="100px" FieldLabelWidth="50px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server"><BR>
      <TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwsdate" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px" DatabaseField="mwsdate"
														FieldTextBoxTabIndex="5" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwsrelat" runat="server" FieldLabelWidth="100px" DatabaseField="mwsrelat" FieldTextBoxTabIndex="7"
														FieldLabelText="Relation to Child" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwssex" runat="server" FieldLabelWidth="100px" DatabaseField="mwssex" FieldTextBoxTabIndex="8"
														FieldLabelText="Sex:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
														IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwsdob" runat="server" FieldLabelWidth="100px" DatabaseField="mwsdob" FieldTextBoxTabIndex="9"
														FieldLabelText="DOB:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
														IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mwsagem" runat="server" FieldLabelWidth="100px" DatabaseField="mwsagem" FieldTextBoxTabIndex="10"
														FieldLabelText="Age (months):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE><BR>
      <H4>Part I: Words Children Use</H4>
      <TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsprodr" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" DatabaseField="mwsprodr"
											FieldTextBoxTabIndex="11" FieldLabelText="A1. Words produced (use -9 for missing)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD class="heading">1=NO (not yet),2=YES (sometimes or often),9=Missing</TD>
									<TD>Percent of "yes"
										<BR>
										at child's age</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwspast" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="40px" DatabaseField="mwspast"
											FieldTextBoxTabIndex="13" FieldLabelText="B1. Past" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwspastp" runat="server" DatabaseField="mwspastp" FieldTextBoxTabIndex="14"
											FieldLabelText="mwspastp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="615" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsfut" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="40px" DatabaseField="mwsfut"
											FieldTextBoxTabIndex="15" FieldLabelText="B2. Future" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsfutp" runat="server" DatabaseField="mwsfutp" FieldTextBoxTabIndex="16" FieldLabelText="mwsfutp"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsaopr" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="40px" DatabaseField="mwsaopr"
											FieldTextBoxTabIndex="17" FieldLabelText="B3. Absent object (production)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsaoprp" runat="server" DatabaseField="mwsaoprp" FieldTextBoxTabIndex="18"
											FieldLabelText="mwsaoprp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="621" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsaoco" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="40px" DatabaseField="mwsaoco"
											FieldTextBoxTabIndex="19" FieldLabelText="B4. Absent object (comprehension)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsaocop" runat="server" DatabaseField="mwsaocop" FieldTextBoxTabIndex="20"
											FieldLabelText="mwsaocop" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsao" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="40px" DatabaseField="mwsao"
											FieldTextBoxTabIndex="21" FieldLabelText="B5. Absent object" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsaop" runat="server" DatabaseField="mwsaop" FieldTextBoxTabIndex="22" FieldLabelText="mwsaop"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="627" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <H4>Part II: Sentences and Grammar</H4>
      <TABLE class="grid">
								<TR>
									<TD class="heading">1=NO (not yet),2=YES (sometimes or often),9=Missing</TD>
									<TD>Percent of "yes"
										<BR>
										at child's age</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsplur" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="40px" DatabaseField="mwsplur"
											FieldTextBoxTabIndex="23" FieldLabelText="A1. Plural" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsplurp" runat="server" DatabaseField="mwsplurp" FieldTextBoxTabIndex="24"
											FieldLabelText="mwsplurp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsposs" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="40px" DatabaseField="mwsposs"
											FieldTextBoxTabIndex="25" FieldLabelText="A2. Possessive" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwspossp" runat="server" DatabaseField="mwspossp" FieldTextBoxTabIndex="26"
											FieldLabelText="mwspossp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="633" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsprog" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="40px" DatabaseField="mwsprog"
											FieldTextBoxTabIndex="27" FieldLabelText="A3. Progressive" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsprogp" runat="server" DatabaseField="mwsprogp" FieldTextBoxTabIndex="28"
											FieldLabelText="mwsprogp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="636" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwspstt" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="40px" DatabaseField="mwspstt"
											FieldTextBoxTabIndex="29" FieldLabelText="A4. Past tense" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwspsttp" runat="server" DatabaseField="mwspsttp" FieldTextBoxTabIndex="30"
											FieldLabelText="mwspsttp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsirrwr" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" DatabaseField="mwsirrwr"
											FieldTextBoxTabIndex="31" FieldLabelText="B. Irregular words (use -9 for missing)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="mwsovrwr" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="60px" DatabaseField="mwsovrwr"
											FieldTextBoxTabIndex="33" FieldLabelText="C. Overregularized words (use -9 for missing)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsovrwp" runat="server" DatabaseField="mwsovrwp" FieldTextBoxTabIndex="35"
											FieldLabelText="Percent of children using 1 or more:" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD class="heading">1=NO (not yet),2=YES (sometimes or often),9=Missing</TD>
									<TD>Percent of "yes"
										<BR>
										at child's age</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mwscomb" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="40px" DatabaseField="mwscomb"
											FieldTextBoxTabIndex="34" FieldLabelText="Is child combining words?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwscombp" runat="server" DatabaseField="mwscombp" FieldTextBoxTabIndex="35"
											FieldLabelText="mwscombp" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>D. Length of child's three longest sentences (use -9 for missing)<BR>
										<def:datafieldcontrol id="mwslen1" runat="server" FieldLabelWidth="40px" FieldTextBoxWidth="40px" DatabaseField="mwslen1"
											FieldTextBoxTabIndex="36" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="mwslen2" runat="server" FieldLabelWidth="40px" FieldTextBoxWidth="40px" DatabaseField="mwslen2"
											FieldTextBoxTabIndex="37" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="mwslen3" runat="server" FieldLabelWidth="40px" FieldTextBoxWidth="40px" DatabaseField="mwslen3"
											FieldTextBoxTabIndex="38" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="mws2ndr" runat="server" FieldLabelWidth="240px" FieldTextBoxWidth="50px" DatabaseField="mws2ndr"
											FieldTextBoxTabIndex="41" FieldLabelText="E1. Number of times 2nd member of pair is selected (use -9  for missing)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
<def:datafieldcontrol id="mwscmnt" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="300px" DatabaseField="mwscmnt"
								FieldTextBoxTabIndex="43" FieldLabelText="Comments" IsDoubleEntryField="False"
								IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
								FieldTextBoxHeight="200px"></def:datafieldcontrol><BR>
      <H4>CDI/Words and Sentences Summary</H4>**Age Equivalent is the age at 
      which the raw score is at the 50th percentile. 
      <TABLE class="grid">
								<TR>
									<TD class="heading">Section</TD>
									<TD class="heading">Raw<BR>
										Score</TD>
									<TD class="heading">Percentile<BR>
										Score</TD>
									<TD class="heading">**Age<BR>
										Equivalent<BR>
										(months)</TD>
								</TR>
								<TR>
									<TD>Vocabulary production</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="mwsprodr" FieldTextBoxTabIndex="39"
											FieldLabelText="mwsprodr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="1336" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsprodp" runat="server" DatabaseField="mwsprodt" FieldTextBoxTabIndex="12"
											FieldLabelText="mwsprodt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="18" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsvpaet" runat="server" DatabaseField="mwsvpaet" FieldTextBoxTabIndex="12"
											FieldLabelText="mwsvpaet" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Irregular words</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" DatabaseField="mwsirrwr" FieldTextBoxTabIndex="39"
											FieldLabelText="mwsirrwr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="1337" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsirrwp" runat="server" DatabaseField="mwsirrwt" FieldTextBoxTabIndex="32"
											FieldLabelText="mwsirrwt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="185" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsiwaet" runat="server" DatabaseField="mwsiwaet" FieldTextBoxTabIndex="32"
											FieldLabelText="mwsiwaet" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="225" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Sentence complexity</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" DatabaseField="mws2ndr" FieldTextBoxTabIndex="39"
											FieldLabelText="mws2ndr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mws2ndp" runat="server" DatabaseField="mws2ndt" FieldTextBoxTabIndex="42" FieldLabelText="mws2ndt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwsscaet" runat="server" DatabaseField="mwsscaet" FieldTextBoxTabIndex="32"
											FieldLabelText="mwsscaet" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">Mean Length<BR>
										for Child</TD>
									<TD class="heading">Mean Length<BR>
										for Child's Age</TD>
									<TD class="heading"></TD>
								</TR>
								<TR>
									<TD>Three longest sentences</TD>
									<TD>
										<def:datafieldcontrol id="mwslenm" runat="server" DatabaseField="mwslenm" FieldTextBoxTabIndex="39" FieldLabelText="mwslenm"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="1312"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mwslenma" runat="server" DatabaseField="mwslenma" FieldTextBoxTabIndex="40"
											FieldLabelText="mwslenma" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
											RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="230" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="100px" DatabaseField="scoremsg"
								FieldTextBoxTabIndex="40" FieldLabelText="Scoring status:" IsDoubleEntryField="False"
								IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
								ShowFieldLabel="True"></def:datafieldcontrol><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="45"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="46"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="47"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="48"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="47" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="48" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
