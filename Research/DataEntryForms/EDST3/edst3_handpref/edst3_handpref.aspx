<%@ Page language="c#" Inherits="edst3_handpref.edst3_handpref" CodeFile="edst3_handpref.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_handpref" LookupField1="edsid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:" MeasureName="EDST3 Hand Pref" PrimaryKeyField="hp_pk"
							VerifiedField="verified" StudyMeasID="187"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
										FieldTextBoxTabIndex="1" DatabaseField="edsid" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hpdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="2" DatabaseField="hpdate" FormatString="{0:d}" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hpclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="3" DatabaseField="hpclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1=left, 2=right, 9=unknown/Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hpparent" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hpparent"
											FieldTextBoxTabIndex="4" FieldLabelText="Hand preference parent response" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD class="heading" colSpan="2">1=left, 2=right, 3=both, 4=NR, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="hp01" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp01"
														FieldTextBoxTabIndex="5" FieldLabelText="1. pick up dime1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp02" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp02"
														FieldTextBoxTabIndex="6" FieldLabelText="2. draw with  crayon1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp03" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp03"
														FieldTextBoxTabIndex="7" FieldLabelText="3. throw ball1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp04" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp04"
														FieldTextBoxTabIndex="8" FieldLabelText="4. drink from cup1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp05" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp05"
														FieldTextBoxTabIndex="9" FieldLabelText="5. hammer1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp06" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp06"
														FieldTextBoxTabIndex="10" FieldLabelText="6. eat with spoon1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp07" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp07"
														FieldTextBoxTabIndex="11" FieldLabelText="7. brush teeth1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp08" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp08"
														FieldTextBoxTabIndex="12" FieldLabelText="8. pick up raisin1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp09" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp09"
														FieldTextBoxTabIndex="13" FieldLabelText="9. eat with spoon2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp10" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp10"
														FieldTextBoxTabIndex="14" FieldLabelText="10. drink from cup2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp11" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp11"
														FieldTextBoxTabIndex="15" FieldLabelText="11. brush  teeth2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp12" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp12"
														FieldTextBoxTabIndex="16" FieldLabelText="12. pick up raisin2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9" DESIGNTIMEDRAGDROP="240"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="hp13" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp13"
														FieldTextBoxTabIndex="17" FieldLabelText="13. draw with crayon2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9" DESIGNTIMEDRAGDROP="248"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp14" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp14"
														FieldTextBoxTabIndex="18" FieldLabelText="14. throw ball2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp15" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp15"
														FieldTextBoxTabIndex="19" FieldLabelText="15. hammer2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp16" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp16"
														FieldTextBoxTabIndex="20" FieldLabelText="16. pick up dime2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp17" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp17"
														FieldTextBoxTabIndex="21" FieldLabelText="17. drink from cup3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp18" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp18"
														FieldTextBoxTabIndex="22" FieldLabelText="18. pick up raisin3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp19" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp19"
														FieldTextBoxTabIndex="23" FieldLabelText="19. hammer3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp20" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp20"
														FieldTextBoxTabIndex="24" FieldLabelText="20. eat with spoon3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp21" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp21"
														FieldTextBoxTabIndex="25" FieldLabelText="21. brush teeth3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp22" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp22"
														FieldTextBoxTabIndex="26" FieldLabelText="22. pick up dime3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp23" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp23"
														FieldTextBoxTabIndex="27" FieldLabelText="23. throw ball3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="hp24" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hp24"
														FieldTextBoxTabIndex="28" FieldLabelText="24. draw with crayon3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="hpbeh" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="200px" DatabaseField="hpbeh"
											FieldTextBoxTabIndex="29" FieldLabelText="Behavioral comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1= Valid<BR>
										2= Question validity (describe below) 3= Invalid data (describe below)<BR>
										<def:datafieldcontrol id="hpvld" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="hpvld"
											FieldTextBoxTabIndex="30" FieldLabelText="Validity" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3"
											Height="28px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hpcmt" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="200px" DatabaseField="hpcmt"
											FieldTextBoxTabIndex="31" FieldLabelText="Validity comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" DESIGNTIMEDRAGDROP="453" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="33"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="34"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="35"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="36"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
