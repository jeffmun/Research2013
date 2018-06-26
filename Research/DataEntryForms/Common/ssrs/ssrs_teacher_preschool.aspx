<%@ Page language="c#" Inherits="GenericDataEntryForms.ssrs.ssrs_teacher_preschool" CodeFile="ssrs_teacher_preschool.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="sst_pk" MeasureName="SSRS Teacher Preschool Version" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_ssrs_teacher_preschool" AllowedStudyMeasures="776"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<table class="tblinsert" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="60px"
										FieldTextBoxWidth="80px" FieldTextBoxTabIndex="4" FieldLabelText="ID" DatabaseField="id"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="sstdate" runat="server" DatabaseField="sstdate" FieldLabelText="Date" FieldTextBoxTabIndex="5"
											FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="sstrat" runat="server" DatabaseField="sstrat" FieldLabelText="Respondant" FieldTextBoxTabIndex="6"
											FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="sstrato" runat="server" DatabaseField="sstrato" FieldLabelText="(specify if 3 or 4)"
											FieldTextBoxTabIndex="7" FieldTextBoxWidth="100px" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="sstdob" runat="server" DatabaseField="sstdob" FieldLabelText="Birth Date:" FieldTextBoxTabIndex="5"
											FieldLabelWidth="100px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False"
											IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sstagem" runat="server" DatabaseField="sstagemo" FieldLabelText="Age (months):"
											FieldTextBoxTabIndex="6" FieldLabelWidth="100px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sstageym" runat="server" DatabaseField="sstageym" FieldLabelText="Age (y-m):"
											FieldTextBoxTabIndex="7" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sstsex" runat="server" DatabaseField="sstsex" FieldLabelText="Sex:" FieldTextBoxTabIndex="6"
											FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False"
											IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">How Often?<BR>
										0=Never<BR>
										1=Sometimes<BR>
										2=Very Ofter<BR>
										3=Missing
									</TD>
									<TD class="heading">How Important?<BR>
										0=Not Important<BR>
										1=Important<BR>
										2=Critical<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst01" runat="server" DatabaseField="sst01" FieldLabelText="1. Follows your directions. "
											FieldTextBoxTabIndex="10" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti01" runat="server" DatabaseField="ssti01" FieldLabelText="1. Follows your directions. (How Important)"
											FieldTextBoxTabIndex="11" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst02" runat="server" DatabaseField="sst02" FieldLabelText="2. Makes friends easily. "
											FieldTextBoxTabIndex="12" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti02" runat="server" DatabaseField="ssti02" FieldLabelText="2. Makes friends easily. (How Important)"
											FieldTextBoxTabIndex="13" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst03" runat="server" DatabaseField="sst03" FieldLabelText="3. Appropriately tells you when he or she thinks you have treated him or her unfairly. "
											FieldTextBoxTabIndex="14" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti03" runat="server" DatabaseField="ssti03" FieldLabelText="3. Appropriately tells you when he or she thinks you have treated him or her unfairly. (How Important)"
											FieldTextBoxTabIndex="15" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst04" runat="server" DatabaseField="sst04" FieldLabelText="4. Responds appropriately to teasing by peers. "
											FieldTextBoxTabIndex="16" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti04" runat="server" DatabaseField="ssti04" FieldLabelText="4. Responds appropriately to teasing by peers. (How Important)"
											FieldTextBoxTabIndex="17" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst05" runat="server" DatabaseField="sst05" FieldLabelText="5. Appropriately questions rules that may be unfair. "
											FieldTextBoxTabIndex="18" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti05" runat="server" DatabaseField="ssti05" FieldLabelText="5. Appropriately questions rules that may be unfair. (How Important)"
											FieldTextBoxTabIndex="19" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst06" runat="server" DatabaseField="sst06" FieldLabelText="6. Attempts classroom tasks before asking for your help. "
											FieldTextBoxTabIndex="20" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti06" runat="server" DatabaseField="ssti06" FieldLabelText="6. Attempts classroom tasks before asking for your help. (How Important)"
											FieldTextBoxTabIndex="21" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst07" runat="server" DatabaseField="sst07" FieldLabelText="7. Controls temper in conflict situations with adults. "
											FieldTextBoxTabIndex="22" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti07" runat="server" DatabaseField="ssti07" FieldLabelText="7. Controls temper in conflict situations with adults. (How Important)"
											FieldTextBoxTabIndex="23" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst08" runat="server" DatabaseField="sst08" FieldLabelText="8. Gives compliments to peers. "
											FieldTextBoxTabIndex="24" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti08" runat="server" DatabaseField="ssti08" FieldLabelText="8. Gives compliments to peers. (How Important)"
											FieldTextBoxTabIndex="25" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst09" runat="server" DatabaseField="sst09" FieldLabelText="9. Participates in games or group activities. "
											FieldTextBoxTabIndex="26" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti09" runat="server" DatabaseField="ssti09" FieldLabelText="9. Participates in games or group activities. (How Important)"
											FieldTextBoxTabIndex="27" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst10" runat="server" DatabaseField="sst10" FieldLabelText="10. Produces correct schoolwork. "
											FieldTextBoxTabIndex="28" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti10" runat="server" DatabaseField="ssti10" FieldLabelText="10. Produces correct schoolwork. (How Important)"
											FieldTextBoxTabIndex="29" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst11" runat="server" DatabaseField="sst11" FieldLabelText="11. Helps you without being asked. "
											FieldTextBoxTabIndex="30" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti11" runat="server" DatabaseField="ssti11" FieldLabelText="11. Helps you without being asked. (How Important)"
											FieldTextBoxTabIndex="31" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst12" runat="server" DatabaseField="sst12" FieldLabelText="12. Introduces himself or herself to new people without being told. "
											FieldTextBoxTabIndex="32" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti12" runat="server" DatabaseField="ssti12" FieldLabelText="12. Introduces himself or herself to new people without being told. (How Important)"
											FieldTextBoxTabIndex="33" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst13" runat="server" DatabaseField="sst13" FieldLabelText="13. Accepts peers' ideas for group activities. "
											FieldTextBoxTabIndex="34" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti13" runat="server" DatabaseField="ssti13" FieldLabelText="13. Accepts peers' ideas for group activities. (How Important)"
											FieldTextBoxTabIndex="35" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst14" runat="server" DatabaseField="sst14" FieldLabelText="14. Cooperates with peers without prompting. "
											FieldTextBoxTabIndex="36" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti14" runat="server" DatabaseField="ssti14" FieldLabelText="14. Cooperates with peers without prompting. (How Important)"
											FieldTextBoxTabIndex="37" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst15" runat="server" DatabaseField="sst15" FieldLabelText="15. Waits turn in games or other activities. "
											FieldTextBoxTabIndex="38" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti15" runat="server" DatabaseField="ssti15" FieldLabelText="15. Waits turn in games or other activities. (How Important)"
											FieldTextBoxTabIndex="39" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst16" runat="server" DatabaseField="sst16" FieldLabelText="16. Uses time appropriately while waiting for your help. "
											FieldTextBoxTabIndex="40" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti16" runat="server" DatabaseField="ssti16" FieldLabelText="16. Uses time appropriately while waiting for your help. (How Important)"
											FieldTextBoxTabIndex="41" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst17" runat="server" DatabaseField="sst17" FieldLabelText="17. Says nice things about himself or herself when appropriate. "
											FieldTextBoxTabIndex="42" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti17" runat="server" DatabaseField="ssti17" FieldLabelText="17. Says nice things about himself or herself when appropriate. (How Important)"
											FieldTextBoxTabIndex="43" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst18" runat="server" DatabaseField="sst18" FieldLabelText="18. Uses free time in an acceptable way. "
											FieldTextBoxTabIndex="44" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti18" runat="server" DatabaseField="ssti18" FieldLabelText="18. Uses free time in an acceptable way. (How Important)"
											FieldTextBoxTabIndex="45" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst19" runat="server" DatabaseField="sst19" FieldLabelText="19. Acknowledges compliments or praise from peers. "
											FieldTextBoxTabIndex="46" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti19" runat="server" DatabaseField="ssti19" FieldLabelText="19. Acknowledges compliments or praise from peers. (How Important)"
											FieldTextBoxTabIndex="47" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst20" runat="server" DatabaseField="sst20" FieldLabelText="20. Controls temper in conflict situations with peers. "
											FieldTextBoxTabIndex="48" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti20" runat="server" DatabaseField="ssti20" FieldLabelText="20. Controls temper in conflict situations with peers. (How Important)"
											FieldTextBoxTabIndex="49" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst21" runat="server" DatabaseField="sst21" FieldLabelText="21. Follows rules when playing games with others. "
											FieldTextBoxTabIndex="50" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti21" runat="server" DatabaseField="ssti21" FieldLabelText="21. Follows rules when playing games with others. (How Important)"
											FieldTextBoxTabIndex="51" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst22" runat="server" DatabaseField="sst22" FieldLabelText="22. Finishes class assignments within time limits. "
											FieldTextBoxTabIndex="52" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti22" runat="server" DatabaseField="ssti22" FieldLabelText="22. Finishes class assignments within time limits. (How Important)"
											FieldTextBoxTabIndex="53" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst23" runat="server" DatabaseField="sst23" FieldLabelText="23. Compromises in conflict situations by changing own ideas to reach agreement. "
											FieldTextBoxTabIndex="54" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti23" runat="server" DatabaseField="ssti23" FieldLabelText="23. Compromises in conflict situations by changing own ideas to reach agreement. (How Important)"
											FieldTextBoxTabIndex="55" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst24" runat="server" DatabaseField="sst24" FieldLabelText="24. Initiates conversations with peers. "
											FieldTextBoxTabIndex="56" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti24" runat="server" DatabaseField="ssti24" FieldLabelText="24. Initiates conversations with peers. (How Important)"
											FieldTextBoxTabIndex="57" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst25" runat="server" DatabaseField="sst25" FieldLabelText="25. Invites others to join in activities. "
											FieldTextBoxTabIndex="58" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti25" runat="server" DatabaseField="ssti25" FieldLabelText="25. Invites others to join in activities. (How Important)"
											FieldTextBoxTabIndex="59" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst26" runat="server" DatabaseField="sst26" FieldLabelText="26. Receives criticism well. "
											FieldTextBoxTabIndex="60" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti26" runat="server" DatabaseField="ssti26" FieldLabelText="26. Receives criticism well. (How Important)"
											FieldTextBoxTabIndex="61" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst27" runat="server" DatabaseField="sst27" FieldLabelText="27. Puts work materials or school property away. "
											FieldTextBoxTabIndex="62" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti27" runat="server" DatabaseField="ssti27" FieldLabelText="27. Puts work materials or school property away. (How Important)"
											FieldTextBoxTabIndex="63" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst28" runat="server" DatabaseField="sst28" FieldLabelText="28. Responds appropriately to peer pressure. "
											FieldTextBoxTabIndex="64" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti28" runat="server" DatabaseField="ssti28" FieldLabelText="28. Responds appropriately to peer pressure. (How Important)"
											FieldTextBoxTabIndex="65" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst29" runat="server" DatabaseField="sst29" FieldLabelText="29. Joins ongoing activity or group without being told to do so. "
											FieldTextBoxTabIndex="66" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti29" runat="server" DatabaseField="ssti29" FieldLabelText="29. Joins ongoing activity or group without being told to do so. (How Important)"
											FieldTextBoxTabIndex="67" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst30" runat="server" DatabaseField="sst30" FieldLabelText="30. Volunteers to help peers with classroom tasks. "
											FieldTextBoxTabIndex="68" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssti30" runat="server" DatabaseField="ssti30" FieldLabelText="30. Volunteers to help peers with classroom tasks. (How Important)"
											FieldTextBoxTabIndex="69" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst31" runat="server" DatabaseField="sst31" FieldLabelText="31. Has temper tantrums. "
											FieldTextBoxTabIndex="70" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst32" runat="server" DatabaseField="sst32" FieldLabelText="32. Fidgets or moves excessively. "
											FieldTextBoxTabIndex="72" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst33" runat="server" DatabaseField="sst33" FieldLabelText="33. Argues with others. "
											FieldTextBoxTabIndex="74" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst34" runat="server" DatabaseField="sst34" FieldLabelText="34. Disturbs ongoing activities. "
											FieldTextBoxTabIndex="76" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst35" runat="server" DatabaseField="sst35" FieldLabelText="35. Says nobody likes him or her. "
											FieldTextBoxTabIndex="78" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst36" runat="server" DatabaseField="sst36" FieldLabelText="36. Appears lonely. "
											FieldTextBoxTabIndex="80" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst37" runat="server" DatabaseField="sst37" FieldLabelText="37. Is aggressive toward people or objects. "
											FieldTextBoxTabIndex="82" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst38" runat="server" DatabaseField="sst38" FieldLabelText="38. Disobeys rules or requests. "
											FieldTextBoxTabIndex="84" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst39" runat="server" DatabaseField="sst39" FieldLabelText="39. Shows anxiety about being with a group of children. "
											FieldTextBoxTabIndex="86" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sst40" runat="server" DatabaseField="sst40" FieldLabelText="40. Acts sad or depressed. "
											FieldTextBoxTabIndex="88" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="scoremsg" runat="server" DatabaseField="scoremsg" FieldLabelText="Scoring Status:"
											FieldTextBoxTabIndex="20" FieldLabelWidth="90px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="sstnorms" FieldLabelText="Norms Table:"
											FieldTextBoxTabIndex="20" FieldLabelWidth="90px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE>
								<TR>
									<TD style="vertical-align:top" width="254">
										<TABLE class="grid">
											<TR>
												<TD colSpan="3">Social Skills</TD>
											</TR>
											<TR>
												<TD class="heading">Scale</TD>
												<TD class="heading">Score</TD>
												<TD class="heading">Level</TD>
											</TR>
											<TR>
												<TD>Cooperation (C)</TD>
												<TD>
													<def:datafieldcontrol id="sstsc" runat="server" DatabaseField="sstsc" FieldLabelText="Cooperation Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sstsclvl" runat="server" DatabaseField="sstsclvl" FieldLabelText="Cooperation Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Assertion (A)</TD>
												<TD>
													<def:datafieldcontrol id="sstsa" runat="server" DatabaseField="sstsa" FieldLabelText="Assertion Sum" FieldTextBoxTabIndex="20"
														FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
														IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sstsalvl" runat="server" DatabaseField="sstsalvl" FieldLabelText="Assertion Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Self-Control (S)</TD>
												<TD>
													<def:datafieldcontrol id="sstss" runat="server" DatabaseField="sstss" FieldLabelText="Self-Control Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sstsslvl" runat="server" DatabaseField="sstsslvl" FieldLabelText="Self-Control Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Social Skills Total</TD>
												<TD>
													<def:datafieldcontrol id="sststo" runat="server" DatabaseField="sststo" FieldLabelText="Social Skills Total"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sststolv" runat="server" DatabaseField="sststolv" FieldLabelText="Social Skills Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>Standard Score</TD>
												<TD>
													<def:datafieldcontrol id="sstssstx" runat="server" DatabaseField="sstssstx" FieldLabelText="Social Skills Scaled Score:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="sstspctt" runat="server" DatabaseField="sstspctt" FieldLabelText="Social Skills Percentile Rank:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 68%</TD>
												<TD>
													<def:datafieldcontrol id="sstssem6" runat="server" DatabaseField="sstssem6" FieldLabelText="Social Skills SEM 68%:"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 95%</TD>
												<TD>
													<def:datafieldcontrol id="sstssem9" runat="server" DatabaseField="sstssem9" FieldLabelText="Social Skills SEM 95%:"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD colSpan="3">Problem Behaviors</TD>
											</TR>
											<TR>
												<TD class="heading">Scale</TD>
												<TD class="heading">Score</TD>
												<TD class="heading">Level</TD>
											</TR>
											<TR>
												<TD>Externalizing</TD>
												<TD>
													<def:datafieldcontrol id="sstbe" runat="server" DatabaseField="sstbe" FieldLabelText="Externalizing Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sstbelvl" runat="server" DatabaseField="sstbelvl" FieldLabelText="Externalizing Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Internalizing</TD>
												<TD>
													<def:datafieldcontrol id="sstbi" runat="server" DatabaseField="sstbi" FieldLabelText="Internalizing Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sstbilvl" runat="server" DatabaseField="sstbilvl" FieldLabelText="Internalizing level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Problem Behaviors Total</TD>
												<TD>
													<def:datafieldcontrol id="sstbto" runat="server" DatabaseField="sstbto" FieldLabelText="Problem Behaviors Total"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sstbtolv" runat="server" DatabaseField="sstbtolv" FieldLabelText="Problem Behaviors Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>Standard Score</TD>
												<TD>
													<def:datafieldcontrol id="sstbsst" runat="server" DatabaseField="sstbsst" FieldLabelText="Problem Behaviors Standard Score:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="sstbpctt" runat="server" DatabaseField="sstbpctt" FieldLabelText="Problem Behaviors Standard Percentile Rank:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 68%</TD>
												<TD>
													<def:datafieldcontrol id="sstbsem6" runat="server" DatabaseField="sstbsem6" FieldLabelText="Problem Behaviors SEM 68%"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 95%</TD>
												<TD>
													<def:datafieldcontrol id="sstbsem9" runat="server" DatabaseField="sstbsem9" FieldLabelText="Problem Behaviors SEM 95%"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldLabelText="created" FieldTextBoxTabIndex="352"
											FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False"
											IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="353" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldLabelText="updated" FieldTextBoxTabIndex="354"
											FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False"
											IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="355" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" DatabaseField="scored" FieldLabelText="scored" FieldTextBoxTabIndex="356"
											FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False"
											IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" DatabaseField="scoredBy" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="357" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
