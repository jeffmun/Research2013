<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.bitsea.bitsea" CodeFile="bitsea.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="344, 591" DatabaseTable="all_bitsea"
							LookupField1="id" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="BITSEA"
							PrimaryKeyField="bit_pk" VerifiedField="verified" ShowScoreButton="True" LookupField1DataType="TEXT"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td>
									<def:datafieldcontrol id="id" runat="server" FieldLabelWidth="40px" FieldTextBoxWidth="80px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" DESIGNTIMEDRAGDROP="1507"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel id="mainPanel" Runat="server">
							<def:datafieldcontrol id="BITDATE" runat="server" FieldLabelWidth="60px" FieldTextBoxWidth="80px" DatabaseField="BITDATE"
								FieldTextBoxTabIndex="2" FieldLabelText="Test Date" IsDoubleEntryField="False" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True" IsInsertField="False"
								FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol>
							<def:datafieldcontrol id="BITagem" runat="server" FieldLabelWidth="100px" DatabaseField="BITagem" FieldTextBoxTabIndex="50"
								FieldLabelText="Age (months):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
								ShowFieldLabel="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Sum</TD>
									<TD class="heading">Cutpoint</TD>
									<TD class="heading">Difference from cutpoint</TD>
									<TD class="heading">Status</TD>
								</TR>
								<TR>
									<TD class="heading">Problems</TD>
									<TD>
										<def:datafieldcontrol id="BITprob" runat="server" DatabaseField="BITprob" FieldTextBoxTabIndex="50" FieldLabelText="BITprob"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="1757" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BITcutp" runat="server" DatabaseField="BITcutp" FieldTextBoxTabIndex="50" FieldLabelText="BITcutp"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="1992" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BITprobd" runat="server" FieldLabelWidth="100px" DatabaseField="BITprobd" FieldTextBoxTabIndex="56"
											FieldLabelText="sum-cutpoint =" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="True"></def:datafieldcontrol>&nbsp;</TD>
									<TD>0 if sum&lt;cutpoint<BR>
										1 if sum&gt;=cutpoint
										<def:datafieldcontrol id="BITprobx" runat="server" DatabaseField="BITprobx" FieldTextBoxTabIndex="53"
											FieldLabelText="BITprobx" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Competence</TD>
									<TD>
										<def:datafieldcontrol id="BITcomp" runat="server" DatabaseField="BITcomp" FieldTextBoxTabIndex="51" FieldLabelText="BITcomp"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BITcutc" runat="server" DatabaseField="BITcutc" FieldTextBoxTabIndex="50" FieldLabelText="BITcutc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BITcompd" runat="server" FieldLabelWidth="100px" DatabaseField="BITcompd" FieldTextBoxTabIndex="57"
											FieldLabelText="cutpoint-sum = " IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>0 if sum&gt;cutpoint<BR>
										1 if sum&lt;=cutpoint
										<def:datafieldcontrol id="BITcompx" runat="server" DatabaseField="BITcompx" FieldTextBoxTabIndex="54"
											FieldLabelText="BITcompx" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Totals</TD>
									<TD>
										<def:datafieldcontrol id="BITtot" runat="server" DatabaseField="BITtot" FieldTextBoxTabIndex="52" FieldLabelText="BITtot"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="BITtotd" runat="server" DatabaseField="BITtotd" FieldTextBoxTabIndex="58" FieldLabelText="BITtotd"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BITtotx" runat="server" DatabaseField="BITtotx" FieldTextBoxTabIndex="55" FieldLabelText="BITtotx"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="scoremsg" runat="server" FieldLabelWidth="100px" DatabaseField="scoremsg" FieldTextBoxTabIndex="59"
								FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<DIV><BR>
								<B>0</B>-not true/rarely<BR>
								<B>1</B>-somewhat true/sometimes<BR>
								<B>2</B>-very true/often<BR>
								<B>8</B>-No Contact<BR>
								<B>9</B>-Missing/Blank<BR>
								<BR>
							</DIV>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top" width="155">
										<TABLE class="layout" id="table_entry">
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT01" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT01"
														FieldTextBoxTabIndex="3" FieldLabelText="BIT01" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT02" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT02"
														FieldTextBoxTabIndex="4" FieldLabelText="BIT02" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT03" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT03"
														FieldTextBoxTabIndex="5" FieldLabelText="BIT03" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT04" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT04"
														FieldTextBoxTabIndex="6" FieldLabelText="BIT04" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT05" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT05"
														FieldTextBoxTabIndex="7" FieldLabelText="BIT05" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT06" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT06"
														FieldTextBoxTabIndex="8" FieldLabelText="BIT06" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT07" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT07"
														FieldTextBoxTabIndex="9" FieldLabelText="BIT07" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT08" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT08"
														FieldTextBoxTabIndex="10" FieldLabelText="BIT08" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT09" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT09"
														FieldTextBoxTabIndex="11" FieldLabelText="BIT09" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT10" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT10"
														FieldTextBoxTabIndex="12" FieldLabelText="BIT10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT11" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT11"
														FieldTextBoxTabIndex="13" FieldLabelText="BIT11" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT12" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT12"
														FieldTextBoxTabIndex="14" FieldLabelText="BIT12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT13" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT13"
														FieldTextBoxTabIndex="15" FieldLabelText="BIT13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT14" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT14"
														FieldTextBoxTabIndex="16" FieldLabelText="BIT14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT15" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT15"
														FieldTextBoxTabIndex="17" FieldLabelText="BIT15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT16" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT16"
														FieldTextBoxTabIndex="18" FieldLabelText="BIT16" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT17" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT17"
														FieldTextBoxTabIndex="19" FieldLabelText="BIT17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT18" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT18"
														FieldTextBoxTabIndex="20" FieldLabelText="BIT18" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT19" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT19"
														FieldTextBoxTabIndex="21" FieldLabelText="BIT19" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT20" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT20"
														FieldTextBoxTabIndex="22" FieldLabelText="BIT20" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT21" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT21"
														FieldTextBoxTabIndex="23" FieldLabelText="BIT21" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT22" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT22"
														FieldTextBoxTabIndex="24" FieldLabelText="BIT22" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT23" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT23"
														FieldTextBoxTabIndex="25" FieldLabelText="BIT23" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT24" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT24"
														FieldTextBoxTabIndex="26" FieldLabelText="BIT24" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT25" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT25"
														FieldTextBoxTabIndex="27" FieldLabelText="BIT25" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT26" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT26"
														FieldTextBoxTabIndex="28" FieldLabelText="BIT26" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT27" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT27"
														FieldTextBoxTabIndex="29" FieldLabelText="BIT27" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT28" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT28"
														FieldTextBoxTabIndex="30" FieldLabelText="BIT28" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT29" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT29"
														FieldTextBoxTabIndex="31" FieldLabelText="BIT29" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT30" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT30"
														FieldTextBoxTabIndex="32" FieldLabelText="BIT30" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT31" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT31"
														FieldTextBoxTabIndex="33" FieldLabelText="BIT31" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT32" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT32"
														FieldTextBoxTabIndex="34" FieldLabelText="BIT32" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT33" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT33"
														FieldTextBoxTabIndex="35" FieldLabelText="BIT33" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT34" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT34"
														FieldTextBoxTabIndex="36" FieldLabelText="BIT34" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT35" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT35"
														FieldTextBoxTabIndex="37" FieldLabelText="BIT35" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT36" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT36"
														FieldTextBoxTabIndex="38" FieldLabelText="BIT36" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT37" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT37"
														FieldTextBoxTabIndex="39" FieldLabelText="BIT37" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT38" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT38"
														FieldTextBoxTabIndex="40" FieldLabelText="BIT38" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT39" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT39"
														FieldTextBoxTabIndex="41" FieldLabelText="BIT39" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT40" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT40"
														FieldTextBoxTabIndex="42" FieldLabelText="BIT40" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT41" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT41"
														FieldTextBoxTabIndex="43" FieldLabelText="BIT41" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT42" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT42"
														FieldTextBoxTabIndex="44" FieldLabelText="BIT42" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD><B>1</B>-Not at all worried<BR>
													<B>2</B>-A little worried<BR>
													<B>3</B>-Worried<BR>
													<B>4</B>-Very worried<BR>
													<B>9</B>-Missing/Blank<BR>
													<BR>
													<def:datafieldcontrol id="BIT43" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT43"
														FieldTextBoxTabIndex="45" FieldLabelText="A." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BIT44" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="30px" DatabaseField="BIT44"
														FieldTextBoxTabIndex="46" FieldLabelText="B." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="49"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="50"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="51"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="52"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="51"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="52"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel></asp:Content>
