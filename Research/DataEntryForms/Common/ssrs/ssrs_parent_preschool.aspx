<%@ Page language="c#" Inherits="GenericDataEntryForms.ssrs.ssrs_parent_preschool" CodeFile="ssrs_parent_preschool.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="ssp_pk" MeasureName="SSRS Parent Preschool Version" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_ssrs_parent_preschool" AllowedStudyMeasures="793"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<table class="tblinsert" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="60px"
										FieldTextBoxWidth="80px" FieldTextBoxTabIndex="4" FieldLabelText="ID" DatabaseField="id"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="sspdate" runat="server" DatabaseField="sspdate" FieldLabelText="Date" FieldTextBoxTabIndex="5"
											FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="ssprat" runat="server" DatabaseField="ssprat" FieldLabelText="Respondant" FieldTextBoxTabIndex="6"
											FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="ssprato" runat="server" DatabaseField="ssprato" FieldLabelText="(specify if 3 or 4)"
											FieldTextBoxTabIndex="7" FieldTextBoxWidth="100px" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="sspdob" runat="server" DatabaseField="sspdob" FieldLabelText="Birth Date:" FieldTextBoxTabIndex="5"
											FieldLabelWidth="100px" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False"
											IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sspagem" runat="server" DatabaseField="sspagemo" FieldLabelText="Age (months):"
											FieldTextBoxTabIndex="6" FieldLabelWidth="100px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sspageym" runat="server" DatabaseField="sspageym" FieldLabelText="Age (y-m):"
											FieldTextBoxTabIndex="7" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sspsex" runat="server" DatabaseField="sspsex" FieldLabelText="Sex:" FieldTextBoxTabIndex="6"
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
										9=Missing
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
										<def:datafieldcontrol id="ssp01" runat="server" DatabaseField="ssp01" FieldLabelText="1. Follows your instructions. "
											FieldTextBoxTabIndex="11" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi01" runat="server" DatabaseField="sspi01" FieldLabelText="1. Follows your instructions.  (Important)"
											FieldTextBoxTabIndex="12" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp02" runat="server" DatabaseField="ssp02" FieldLabelText="2. Helps you with household tasks without being asked. "
											FieldTextBoxTabIndex="13" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi02" runat="server" DatabaseField="sspi02" FieldLabelText="2. Helps you with household tasks without being asked.  (Important)"
											FieldTextBoxTabIndex="14" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp03" runat="server" DatabaseField="ssp03" FieldLabelText="3. Appropriately questions household rules that may be unfair."
											FieldTextBoxTabIndex="15" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi03" runat="server" DatabaseField="sspi03" FieldLabelText="3. Appropriately questions household rules that may be unfair. (Important)"
											FieldTextBoxTabIndex="16" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp04" runat="server" DatabaseField="ssp04" FieldLabelText="4. Attempts household tasks before asking for your help. "
											FieldTextBoxTabIndex="17" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi04" runat="server" DatabaseField="sspi04" FieldLabelText="4. Attempts household tasks before asking for your help.  (Important)"
											FieldTextBoxTabIndex="18" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp05" runat="server" DatabaseField="ssp05" FieldLabelText="5. Gives compliments to friends or other children in the family."
											FieldTextBoxTabIndex="19" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi05" runat="server" DatabaseField="sspi05" FieldLabelText="5. Gives compliments to friends or other children in the family. (Important)"
											FieldTextBoxTabIndex="20" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp06" runat="server" DatabaseField="ssp06" FieldLabelText="6. Participates in organized group activities. "
											FieldTextBoxTabIndex="21" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi06" runat="server" DatabaseField="sspi06" FieldLabelText="6. Participates in organized group activities.  (Important)"
											FieldTextBoxTabIndex="22" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp07" runat="server" DatabaseField="ssp07" FieldLabelText="7. Politely refuses unreasonable requests from others. "
											FieldTextBoxTabIndex="23" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi07" runat="server" DatabaseField="sspi07" FieldLabelText="7. Politely refuses unreasonable requests from others.  (Important)"
											FieldTextBoxTabIndex="24" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp08" runat="server" DatabaseField="ssp08" FieldLabelText="8. Introduces herself or himself to new people without being told. "
											FieldTextBoxTabIndex="25" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi08" runat="server" DatabaseField="sspi08" FieldLabelText="8. Introduces herself or himself to new people without being told.  (Important)"
											FieldTextBoxTabIndex="26" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp09" runat="server" DatabaseField="ssp09" FieldLabelText="9. Uses free time at home in an acceptable way. "
											FieldTextBoxTabIndex="27" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi09" runat="server" DatabaseField="sspi09" FieldLabelText="9. Uses free time at home in an acceptable way.  (Important)"
											FieldTextBoxTabIndex="28" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp10" runat="server" DatabaseField="ssp10" FieldLabelText="10. Asks permission before using another family member's property. "
											FieldTextBoxTabIndex="29" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi10" runat="server" DatabaseField="sspi10" FieldLabelText="10. Asks permission before using another family member's property.  (Important)"
											FieldTextBoxTabIndex="30" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp11" runat="server" DatabaseField="ssp11" FieldLabelText="11. Responds appropriately when hit or pushed by other children. "
											FieldTextBoxTabIndex="31" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi11" runat="server" DatabaseField="sspi11" FieldLabelText="11. Responds appropriately when hit or pushed by other children.  (Important)"
											FieldTextBoxTabIndex="32" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp12" runat="server" DatabaseField="ssp12" FieldLabelText="12. Volunteers to help family members with tasks. "
											FieldTextBoxTabIndex="33" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi12" runat="server" DatabaseField="sspi12" FieldLabelText="12. Volunteers to help family members with tasks.  (Important)"
											FieldTextBoxTabIndex="34" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp13" runat="server" DatabaseField="ssp13" FieldLabelText="13. Invites others to your home. "
											FieldTextBoxTabIndex="35" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi13" runat="server" DatabaseField="sspi13" FieldLabelText="13. Invites others to your home.  (Important)"
											FieldTextBoxTabIndex="36" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp14" runat="server" DatabaseField="ssp14" FieldLabelText="14. Avoids situations that are likely to result in trouble. "
											FieldTextBoxTabIndex="37" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi14" runat="server" DatabaseField="sspi14" FieldLabelText="14. Avoids situations that are likely to result in trouble.  (Important)"
											FieldTextBoxTabIndex="38" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp15" runat="server" DatabaseField="ssp15" FieldLabelText="15. Starts conversations rather than waiting for others to talk first. "
											FieldTextBoxTabIndex="39" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi15" runat="server" DatabaseField="sspi15" FieldLabelText="15. Starts conversations rather than waiting for others to talk first.  (Important)"
											FieldTextBoxTabIndex="40" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp16" runat="server" DatabaseField="ssp16" FieldLabelText="16. Keeps room clean and neat without being reminded. "
											FieldTextBoxTabIndex="41" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi16" runat="server" DatabaseField="sspi16" FieldLabelText="16. Keeps room clean and neat without being reminded.  (Important)"
											FieldTextBoxTabIndex="42" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp17" runat="server" DatabaseField="ssp17" FieldLabelText="17. Completes household tasks within a reasonable time. "
											FieldTextBoxTabIndex="43" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi17" runat="server" DatabaseField="sspi17" FieldLabelText="17. Completes household tasks within a reasonable time.  (Important)"
											FieldTextBoxTabIndex="44" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp18" runat="server" DatabaseField="ssp18" FieldLabelText="18. Controls temper in conflict situations with you. "
											FieldTextBoxTabIndex="45" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi18" runat="server" DatabaseField="sspi18" FieldLabelText="18. Controls temper in conflict situations with you.  (Important)"
											FieldTextBoxTabIndex="46" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp19" runat="server" DatabaseField="ssp19" FieldLabelText="19. Controls temper when arguing with other children. "
											FieldTextBoxTabIndex="47" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi19" runat="server" DatabaseField="sspi19" FieldLabelText="19. Controls temper when arguing with other children.  (Important)"
											FieldTextBoxTabIndex="48" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp20" runat="server" DatabaseField="ssp20" FieldLabelText="20. Appropriately expresses feelings when wronged. "
											FieldTextBoxTabIndex="49" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi20" runat="server" DatabaseField="sspi20" FieldLabelText="20. Appropriately expresses feelings when wronged.  (Important)"
											FieldTextBoxTabIndex="50" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp21" runat="server" DatabaseField="ssp21" FieldLabelText="21. Follows rules when playing games with others. "
											FieldTextBoxTabIndex="51" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi21" runat="server" DatabaseField="sspi21" FieldLabelText="21. Follows rules when playing games with others.  (Important)"
											FieldTextBoxTabIndex="52" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp22" runat="server" DatabaseField="ssp22" FieldLabelText="22. Attends to your instructions. "
											FieldTextBoxTabIndex="53" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi22" runat="server" DatabaseField="sspi22" FieldLabelText="22. Attends to your instructions.  (Important)"
											FieldTextBoxTabIndex="54" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp23" runat="server" DatabaseField="ssp23" FieldLabelText="23. Shows interest in a variety of things. "
											FieldTextBoxTabIndex="55" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi23" runat="server" DatabaseField="sspi23" FieldLabelText="23. Shows interest in a variety of things.  (Important)"
											FieldTextBoxTabIndex="56" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp24" runat="server" DatabaseField="ssp24" FieldLabelText="24. Answers the phone appropriately. "
											FieldTextBoxTabIndex="57" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi24" runat="server" DatabaseField="sspi24" FieldLabelText="24. Answers the phone appropriately.  (Important)"
											FieldTextBoxTabIndex="58" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp25" runat="server" DatabaseField="ssp25" FieldLabelText="25. Makes friends easily. "
											FieldTextBoxTabIndex="59" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi25" runat="server" DatabaseField="sspi25" FieldLabelText="25. Makes friends easily.  (Important)"
											FieldTextBoxTabIndex="60" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp26" runat="server" DatabaseField="ssp26" FieldLabelText="26. Compromises in conflict situations by changing own ideas to reach agreement. "
											FieldTextBoxTabIndex="61" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi26" runat="server" DatabaseField="sspi26" FieldLabelText="26. Compromises in conflict situations by changing own ideas to reach agreement.  (Important)"
											FieldTextBoxTabIndex="62" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp27" runat="server" DatabaseField="ssp27" FieldLabelText="27. Puts away toys or other household property. "
											FieldTextBoxTabIndex="63" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi27" runat="server" DatabaseField="sspi27" FieldLabelText="27. Puts away toys or other household property.  (Important)"
											FieldTextBoxTabIndex="64" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp28" runat="server" DatabaseField="ssp28" FieldLabelText="28. Waits turn in games or other activities. "
											FieldTextBoxTabIndex="65" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi28" runat="server" DatabaseField="sspi28" FieldLabelText="28. Waits turn in games or other activities.  (Important)"
											FieldTextBoxTabIndex="66" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp29" runat="server" DatabaseField="ssp29" FieldLabelText="29. Receives criticism well. "
											FieldTextBoxTabIndex="67" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi29" runat="server" DatabaseField="sspi29" FieldLabelText="29. Receives criticism well.  (Important)"
											FieldTextBoxTabIndex="68" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp30" runat="server" DatabaseField="ssp30" FieldLabelText="30. Congratulates family members on accomplishments. "
											FieldTextBoxTabIndex="69" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi30" runat="server" DatabaseField="sspi30" FieldLabelText="30. Congratulates family members on accomplishments.  (Important)"
											FieldTextBoxTabIndex="70" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp31" runat="server" DatabaseField="ssp31" FieldLabelText="31. Follows household rules. "
											FieldTextBoxTabIndex="71" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi31" runat="server" DatabaseField="sspi31" FieldLabelText="31. Follows household rules.  (Important)"
											FieldTextBoxTabIndex="72" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp32" runat="server" DatabaseField="ssp32" FieldLabelText="32. Is seif-confident in social situations such as parties or group outings. "
											FieldTextBoxTabIndex="73" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi32" runat="server" DatabaseField="sspi32" FieldLabelText="32. Is seif-confident in social situations such as parties or group outings.  (Important)"
											FieldTextBoxTabIndex="74" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp33" runat="server" DatabaseField="ssp33" FieldLabelText="33. Attends to speakers at meetings such as in church or youth groups. "
											FieldTextBoxTabIndex="75" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi33" runat="server" DatabaseField="sspi33" FieldLabelText="33. Attends to speakers at meetings such as in church or youth groups.  (Important)"
											FieldTextBoxTabIndex="76" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp34" runat="server" DatabaseField="ssp34" FieldLabelText="34. Joins group activities without being told. "
											FieldTextBoxTabIndex="77" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi34" runat="server" DatabaseField="sspi34" FieldLabelText="34. Joins group activities without being told.  (Important)"
											FieldTextBoxTabIndex="78" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp35" runat="server" DatabaseField="ssp35" FieldLabelText="35. Ends disagreements with you calmly. "
											FieldTextBoxTabIndex="79" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi35" runat="server" DatabaseField="sspi35" FieldLabelText="35. Ends disagreements with you calmly.  (Important)"
											FieldTextBoxTabIndex="80" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp36" runat="server" DatabaseField="ssp36" FieldLabelText="36. Is liked by others. "
											FieldTextBoxTabIndex="81" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi36" runat="server" DatabaseField="sspi36" FieldLabelText="36. Is liked by others.  (Important)"
											FieldTextBoxTabIndex="82" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp37" runat="server" DatabaseField="ssp37" FieldLabelText="37. Asks sales clerks for information or assistance. "
											FieldTextBoxTabIndex="83" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi37" runat="server" DatabaseField="sspi37" FieldLabelText="37. Asks sales clerks for information or assistance.  (Important)"
											FieldTextBoxTabIndex="84" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp38" runat="server" DatabaseField="ssp38" FieldLabelText="38. Communicates problems to you. "
											FieldTextBoxTabIndex="85" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi38" runat="server" DatabaseField="sspi38" FieldLabelText="38. Communicates problems to you.  (Important)"
											FieldTextBoxTabIndex="86" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp39" runat="server" DatabaseField="ssp39" FieldLabelText="39. Speaks in an appropriate tone of voice at home. "
											FieldTextBoxTabIndex="87" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sspi39" runat="server" DatabaseField="sspi39" FieldLabelText="39. Speaks in an appropriate tone of voice at home.  (Important)"
											FieldTextBoxTabIndex="88" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" ValidList="0,1,2,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp40" runat="server" DatabaseField="ssp40" FieldLabelText="40. Has temper tantrums. "
											FieldTextBoxTabIndex="89" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp41" runat="server" DatabaseField="ssp41" FieldLabelText="41. Fidgets or moves excessively. "
											FieldTextBoxTabIndex="91" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp42" runat="server" DatabaseField="ssp42" FieldLabelText="42. Argues with others. "
											FieldTextBoxTabIndex="93" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp43" runat="server" DatabaseField="ssp43" FieldLabelText="43. Disturbs ongoing activities. "
											FieldTextBoxTabIndex="95" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp44" runat="server" DatabaseField="ssp44" FieldLabelText="44. Says nobody likes him or her. "
											FieldTextBoxTabIndex="97" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp45" runat="server" DatabaseField="ssp45" FieldLabelText="45. Appears lonely. "
											FieldTextBoxTabIndex="99" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp46" runat="server" DatabaseField="ssp46" FieldLabelText="46. Is aggressive toward people or objects. "
											FieldTextBoxTabIndex="101" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp47" runat="server" DatabaseField="ssp47" FieldLabelText="47. Disobeys rules or requests. "
											FieldTextBoxTabIndex="103" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp48" runat="server" DatabaseField="ssp48" FieldLabelText="48. Shows anxiety about being with a group of children. "
											FieldTextBoxTabIndex="105" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssp49" runat="server" DatabaseField="ssp49" FieldLabelText="49. Acts sad or depressed. "
											FieldTextBoxTabIndex="107" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT" IsInsertField="False"
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
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="sspnorms" FieldLabelText="Norms Table:"
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
													<def:datafieldcontrol id="sspsc" runat="server" DatabaseField="sspsc" FieldLabelText="Cooperation Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspsclvl" runat="server" DatabaseField="sspsclvl" FieldLabelText="Cooperation Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Assertion (A)</TD>
												<TD>
													<def:datafieldcontrol id="sspsa" runat="server" DatabaseField="sspsa" FieldLabelText="Assertion Sum" FieldTextBoxTabIndex="20"
														FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
														IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspsalvl" runat="server" DatabaseField="sspsalvl" FieldLabelText="Assertion Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Responsibility (R)</TD>
												<TD>
													<def:datafieldcontrol id="sspsr" runat="server" DatabaseField="sspsr" FieldLabelText="Responsibility Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspsrlvl" runat="server" DatabaseField="sspsrlvl" FieldLabelText="Responsibility Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Self-Control (S)</TD>
												<TD>
													<def:datafieldcontrol id="sspss" runat="server" DatabaseField="sspss" FieldLabelText="Self-Control Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspsslvl" runat="server" DatabaseField="sspsslvl" FieldLabelText="Self-Control Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Social Skills Total</TD>
												<TD>
													<def:datafieldcontrol id="sspsto" runat="server" DatabaseField="sspsto" FieldLabelText="Social Skills Total"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspstolv" runat="server" DatabaseField="sspstolv" FieldLabelText="Social Skills Level"
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
													<def:datafieldcontrol id="sspssstx" runat="server" DatabaseField="sspssstx" FieldLabelText="Social Skills Scaled Score:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="sspspctt" runat="server" DatabaseField="sspspctt" FieldLabelText="Social Skills Percentile Rank:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 68%</TD>
												<TD>
													<def:datafieldcontrol id="sspssem6" runat="server" DatabaseField="sspssem6" FieldLabelText="Social Skills SEM 68%:"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 95%</TD>
												<TD>
													<def:datafieldcontrol id="sspssem9" runat="server" DatabaseField="sspssem9" FieldLabelText="Social Skills SEM 95%:"
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
													<def:datafieldcontrol id="sspbe" runat="server" DatabaseField="sspbe" FieldLabelText="Externalizing Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspbelvl" runat="server" DatabaseField="sspbelvl" FieldLabelText="Externalizing Level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Internalizing</TD>
												<TD>
													<def:datafieldcontrol id="sspbi" runat="server" DatabaseField="sspbi" FieldLabelText="Internalizing Sum"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspbilvl" runat="server" DatabaseField="sspbilvl" FieldLabelText="Internalizing level"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Problem Behaviors Total</TD>
												<TD>
													<def:datafieldcontrol id="sspbto" runat="server" DatabaseField="sspbto" FieldLabelText="Problem Behaviors Total"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="sspbtolv" runat="server" DatabaseField="sspbtolv" FieldLabelText="Problem Behaviors Level"
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
													<def:datafieldcontrol id="sspbsst" runat="server" DatabaseField="sspbsst" FieldLabelText="Problem Behaviors Standard Score:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="sspbpctt" runat="server" DatabaseField="sspbpctt" FieldLabelText="Problem Behaviors Standard Percentile Rank:"
														FieldTextBoxTabIndex="20" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 68%</TD>
												<TD>
													<def:datafieldcontrol id="sspbsem6" runat="server" DatabaseField="sspbsem6" FieldLabelText="Problem Behaviors SEM 68%"
														FieldTextBoxTabIndex="20" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>SEM 95%</TD>
												<TD>
													<def:datafieldcontrol id="sspbsem9" runat="server" DatabaseField="sspbsem9" FieldLabelText="Problem Behaviors SEM 95%"
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
