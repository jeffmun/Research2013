<%@ Page language="c#" Inherits="GenericDataEntryForms.ssrs.ssrs" CodeFile="ssrs.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="ssrs_pk" MeasureName="SSRS" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_ssrs" LastScoredDateField="scored" LastUpdatedDateField="updated"
							AllowedStudyMeasures="281,322,1235,1938" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="ID" FieldTextBoxTabIndex="1" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="60px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<TR>
								<TD>
									<def:datafieldcontrol id="ssqdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="1" DatabaseField="ssqdate" FieldLabelWidth="80px" FieldTextBoxWidth="100px"
										FormatString="{0:d}"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="ssqsex" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sex:"
										FieldTextBoxTabIndex="3" DatabaseField="ssqsex" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="ssqdob" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DOB:"
										FieldTextBoxTabIndex="4" DatabaseField="ssqdob" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"
										FormatString="{0:d}"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="ssqagem" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (months):"
										FieldTextBoxTabIndex="5" DatabaseField="ssqagem" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="ssqageym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (y-m):"
										FieldTextBoxTabIndex="6" DatabaseField="ssqageym" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">How Often?</TD>
									<TD class="heading">How Important?</TD>
								</TR>
								<TR>
									<TD>0=Never<BR>
										1=Sometimes<BR>
										2=Very Often<BR>
										9=Missing
									</TD>
									<TD>0=Not Important<BR>
										1=Important<BR>
										2=Critical<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft01" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1 (S). Controls temper in conflict situations with peers." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft01" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp01" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp01" FieldTextBoxTabIndex="4" DatabaseField="ssqimp01" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft02" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2 (A). Introduces himself or herself to new people without being told." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft02" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp02" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp02" FieldTextBoxTabIndex="4" DatabaseField="ssqimp02" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft03" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3 (A). Appropriately questions rules that may be unfair." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft03" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp03" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp03" FieldTextBoxTabIndex="4" DatabaseField="ssqimp03" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft04" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4 (S). Compromises in conflict situations by changing own ideas to reach agreement."
											FieldTextBoxTabIndex="3" DatabaseField="ssqoft04" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp04" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp04" FieldTextBoxTabIndex="4" DatabaseField="ssqimp04" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft05" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="5 (S). Responds appropriately to peer pressure." FieldTextBoxTabIndex="3" DatabaseField="ssqoft05"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp05" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp05" FieldTextBoxTabIndex="4" DatabaseField="ssqimp05" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft06" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="6 (A). Says nice things about himself or herself when appropriate." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft06" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp06" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp06" FieldTextBoxTabIndex="4" DatabaseField="ssqimp06" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft07" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="7 (A). Invites others to join in activities." FieldTextBoxTabIndex="3" DatabaseField="ssqoft07"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp07" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp07" FieldTextBoxTabIndex="4" DatabaseField="ssqimp07" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft08" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="8 (C). Uses free time in an acceptable way." FieldTextBoxTabIndex="3" DatabaseField="ssqoft08"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp08" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp08" FieldTextBoxTabIndex="4" DatabaseField="ssqimp08" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft09" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="9 (C). Finishes class assignments within time limits." FieldTextBoxTabIndex="3" DatabaseField="ssqoft09"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp09" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp09" FieldTextBoxTabIndex="4" DatabaseField="ssqimp09" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft10" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10 (A). Makes friends easily." FieldTextBoxTabIndex="3" DatabaseField="ssqoft10" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp10" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp10" FieldTextBoxTabIndex="4" DatabaseField="ssqimp10" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft11" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="11 (S). Responds appropriately to teasing by peers." FieldTextBoxTabIndex="3" DatabaseField="ssqoft11"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp11" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp11" FieldTextBoxTabIndex="4" DatabaseField="ssqimp11" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft12" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="12 (S). Controls temper in conflict situations with adults." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft12" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp12" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp12" FieldTextBoxTabIndex="4" DatabaseField="ssqimp12" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft13" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="13 (S). Receives criticism well." FieldTextBoxTabIndex="3" DatabaseField="ssqoft13"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp13" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp13" FieldTextBoxTabIndex="4" DatabaseField="ssqimp13" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft14" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="14 (A). Initiates conversations with peers." FieldTextBoxTabIndex="3" DatabaseField="ssqoft14"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp14" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp14" FieldTextBoxTabIndex="4" DatabaseField="ssqimp14" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="15 (C). Uses time appropriately while waiting for help." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft15" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp15" FieldTextBoxTabIndex="4" DatabaseField="ssqimp15" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft16" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="16 (C). Produces correct schoolwork." FieldTextBoxTabIndex="3" DatabaseField="ssqoft16"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp16" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp16" FieldTextBoxTabIndex="4" DatabaseField="ssqimp16" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft17" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="17 (A). Appropriately tells you when he or she thinks you have treated him unfairly."
											FieldTextBoxTabIndex="3" DatabaseField="ssqoft17" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp17" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp17" FieldTextBoxTabIndex="4" DatabaseField="ssqimp17" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="18 (S). Accepts peers' ideas for group activities." FieldTextBoxTabIndex="3" DatabaseField="ssqoft18"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp18" FieldTextBoxTabIndex="4" DatabaseField="ssqimp18" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft19" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="19 (A). Gives compliments to peers." FieldTextBoxTabIndex="3" DatabaseField="ssqoft19"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp19" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp19" FieldTextBoxTabIndex="4" DatabaseField="ssqimp19" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft20" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="20 (C). Follows your directions." FieldTextBoxTabIndex="3" DatabaseField="ssqoft20"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp20" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp20" FieldTextBoxTabIndex="4" DatabaseField="ssqimp20" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="21 (C). Puts work materials or school property away." FieldTextBoxTabIndex="3" DatabaseField="ssqoft21"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp21" FieldTextBoxTabIndex="4" DatabaseField="ssqimp21" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft22" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="22 (S). Cooperates with peers without prompting." FieldTextBoxTabIndex="3" DatabaseField="ssqoft22"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp22" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp22" FieldTextBoxTabIndex="4" DatabaseField="ssqimp22" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft23" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="23 (A). Volunteers to help peers with classroom tasks." FieldTextBoxTabIndex="3" DatabaseField="ssqoft23"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp23" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp23" FieldTextBoxTabIndex="4" DatabaseField="ssqimp23" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft24" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="24 (A). Joins ongoing activity or group without being told to do so. " FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft24" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp24" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp24" FieldTextBoxTabIndex="4" DatabaseField="ssqimp24" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft25" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="25 (S). Responds appropriately when pushed or hit by other children." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft25" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp25" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp25" FieldTextBoxTabIndex="4" DatabaseField="ssqimp25" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft26" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="26 (C). Ignores peer distractions when doing class work. " FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft26" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp26" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp26" FieldTextBoxTabIndex="4" DatabaseField="ssqimp26" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft27" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="27 (C). Keeps desk clean and neat without being reminded." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft27" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp27" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp27" FieldTextBoxTabIndex="4" DatabaseField="ssqimp27" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft28" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="28 (C). Attends to your instructions." FieldTextBoxTabIndex="3" DatabaseField="ssqoft28"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp28" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp28" FieldTextBoxTabIndex="4" DatabaseField="ssqimp28" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft29" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="29 (C). Easily makes transition from one classroom activity to another." FieldTextBoxTabIndex="3"
											DatabaseField="ssqoft29" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp29" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp29" FieldTextBoxTabIndex="4" DatabaseField="ssqimp29" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft30" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="30 (S). Gets along with people who are different." FieldTextBoxTabIndex="3" DatabaseField="ssqoft30"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ssqimp30" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="ssqimp30" FieldTextBoxTabIndex="4" DatabaseField="ssqimp30" ValidList="0,1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">How Often?</TD>
								</TR>
								<TR>
									<TD>0=Never<BR>
										1=Sometimes<BR>
										2=Very Often<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft31" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="31 (E). Fights with others." FieldTextBoxTabIndex="63" DatabaseField="ssqoft31" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft32" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="32 (I). Has low self-esteem." FieldTextBoxTabIndex="64" DatabaseField="ssqoft32" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft33" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="33 (E). Threatens or bullies others." FieldTextBoxTabIndex="65" DatabaseField="ssqoft33"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft34" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="34 (I). Appears lonely." FieldTextBoxTabIndex="66" DatabaseField="ssqoft34" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft35" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="35 (H). Is easily distracted." FieldTextBoxTabIndex="67" DatabaseField="ssqoft35"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft36" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="36 (H). Interrupts conversations of others." FieldTextBoxTabIndex="68" DatabaseField="ssqoft36"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft37" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="37 (H). Disturbs ongoing activities." FieldTextBoxTabIndex="69" DatabaseField="ssqoft37"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft38" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="38 (I). Shows anxiety about being with a group of children." FieldTextBoxTabIndex="70"
											DatabaseField="ssqoft38" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft39" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="39 (I). Is easily embarrassed." FieldTextBoxTabIndex="71" DatabaseField="ssqoft39"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft40" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="40 (H). Doesn't listen to what others say." FieldTextBoxTabIndex="72" DatabaseField="ssqoft40"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft41" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="41 (E). Argues with others." FieldTextBoxTabIndex="73" DatabaseField="ssqoft41" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft42" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="42 (E). Talks back to adults when corrected." FieldTextBoxTabIndex="74" DatabaseField="ssqoft42"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft43" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="43 (E). Gets angry easily." FieldTextBoxTabIndex="75" DatabaseField="ssqoft43" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft44" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="44 (E). Has temper tantrums." FieldTextBoxTabIndex="76" DatabaseField="ssqoft44" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft45" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="45 (I). Likes to be alone." FieldTextBoxTabIndex="77" DatabaseField="ssqoft45" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft46" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="46 (I). Acts sad or depressed." FieldTextBoxTabIndex="78" DatabaseField="ssqoft46"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft47" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="47 (H). Acts impulsively." FieldTextBoxTabIndex="79" DatabaseField="ssqoft47" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssqoft48" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="48 (H). Fidgets or moves excessively." FieldTextBoxTabIndex="80" DatabaseField="ssqoft48"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Academic/Learning Behaviors</TD>
								</TR>
								<TR>
									<TD>1=Lowest 10%, 2=Next Lowest 20%, 3=Middle 40%, 4=Next Highest 20%, 5=Highest 
										10%, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq49" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="49. Compared with other children in my classroom, the overall academic performance of this child is:"
											FieldTextBoxTabIndex="81" DatabaseField="ssq49" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq50" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="50. In reading, how does this child compare with other students?" FieldTextBoxTabIndex="82"
											DatabaseField="ssq50" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq51" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="51. In mathematics, how does this child compare with other students?" FieldTextBoxTabIndex="83"
											DatabaseField="ssq51" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq52" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="52. In terms of grade-level expectations, this child's skills in reading are:" FieldTextBoxTabIndex="84"
											DatabaseField="ssq52" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq53" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="53. In terms of grade-level expectations, this child's skills in mathematics are:"
											FieldTextBoxTabIndex="85" DatabaseField="ssq53" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq54" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="54. This child's overall motivation to succeed academically is:" FieldTextBoxTabIndex="86"
											DatabaseField="ssq54" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq55" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="55. This child's parental encouragement to succeed academically is:" FieldTextBoxTabIndex="87"
											DatabaseField="ssq55" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq56" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="56. Compared with other children in my classroom this child's intellectual functioning is:"
											FieldTextBoxTabIndex="88" DatabaseField="ssq56" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ssq57" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="57. Compared with other children in my classroom this child's overall classroom behavior is:"
											FieldTextBoxTabIndex="89" DatabaseField="ssq57" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top" width="214">
										<TABLE class="grid">
											<TR>
												<TD class="heading" colSpan="2">SOCIAL SKILLS</TD>
											</TR>
											<TR>
												<TD width="97">Cooperation</TD>
												<TD>
													<def:datafieldcontrol id="ssqsc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqsc"
														FieldTextBoxTabIndex="7" DatabaseField="ssqsc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="97">Assertion</TD>
												<TD>
													<def:datafieldcontrol id="ssqsa" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqsa"
														FieldTextBoxTabIndex="8" DatabaseField="ssqsa" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="97">Self-Control</TD>
												<TD>
													<def:datafieldcontrol id="ssqss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqss"
														FieldTextBoxTabIndex="9" DatabaseField="ssqss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="97">TOTAL:</TD>
												<TD>
													<def:datafieldcontrol id="ssqstot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqstot"
														FieldTextBoxTabIndex="10" DatabaseField="ssqstot" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="97">Standard Score</TD>
												<TD>
													<def:datafieldcontrol id="ssqssstx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqssstx"
														FieldTextBoxTabIndex="12" DatabaseField="ssqssstx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="97">Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="ssqsprtx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqsprtx"
														FieldTextBoxTabIndex="14" DatabaseField="ssqsprtx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top" width="227">
										<TABLE class="grid">
											<TR>
												<TD class="heading" width="129" colSpan="2">PROBLEM BEHAVIORS</TD>
	
											</TR>
											<TR>
												<TD width="129">Externalizing</TD>
												<TD>
													<def:datafieldcontrol id="ssqpe" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqpe"
														FieldTextBoxTabIndex="15" DatabaseField="ssqpe" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="129">Internalizing</TD>
												<TD>
													<def:datafieldcontrol id="ssqpi" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqpi"
														FieldTextBoxTabIndex="16" DatabaseField="ssqpi" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="129">Hyperactivity</TD>
												<TD>
													<def:datafieldcontrol id="ssqph" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqph"
														FieldTextBoxTabIndex="17" DatabaseField="ssqph" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="129">TOTAL:</TD>
												<TD>
													<def:datafieldcontrol id="ssqptot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqptot"
														FieldTextBoxTabIndex="18" DatabaseField="ssqptot" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="129">Standard Score</TD>
												<TD>
													<def:datafieldcontrol id="ssqpsstx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqpsstx"
														FieldTextBoxTabIndex="20" DatabaseField="ssqpsstx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="129">Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="ssqprtx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqprtx"
														FieldTextBoxTabIndex="22" DatabaseField="ssqpprtx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading" width="108" colSpan="2">ACADEMIC COMPETENCE</TD>
											</TR>
											<TR>
												<TD width="108">TOTAL:</TD>
												<TD>
													<def:datafieldcontrol id="ssqatot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqatot"
														FieldTextBoxTabIndex="23" DatabaseField="ssqatot" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="108">Standard Score</TD>
												<TD>
													<def:datafieldcontrol id="ssqasstx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqasstx"
														FieldTextBoxTabIndex="25" DatabaseField="ssqasstx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD width="108">Percentile Rank</TD>
												<TD>
													<def:datafieldcontrol id="ssqaprtx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ssqaprtx"
														FieldTextBoxTabIndex="27" DatabaseField="ssqaprtx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
								IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
								IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Message:" FieldTextBoxTabIndex="27"
								DatabaseField="ssqscmsg" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="91" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="92" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="93" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="94" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
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
