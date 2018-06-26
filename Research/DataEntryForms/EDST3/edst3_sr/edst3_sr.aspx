<%@ Page language="c#" Inherits="edst3_sr.edst3_sr" CodeFile="edst3_sr.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="INT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="sr_pk" MeasureName="EDS T3 Spatial Reversal" LookupTextBox1LabelText="EDS ID:"
							LookupTextBox2Visible="False" LookupField1="edsid" DatabaseTable="edst3_sr" StudyMeasID="310" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="60px" DatabaseField="edsid"
										FieldTextBoxTabIndex="2" FieldLabelText="EDS ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="date" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="60px" DatabaseField="date"
										FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="exprmtr" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="60px" DatabaseField="exprmtr"
										FieldTextBoxTabIndex="4" FieldLabelText="Examiner" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">Trial</TD>
									<TD class="heading">1=Reversal</TD>
									<TD class="heading">0=Incorrect<BR>
										1=Correct<BR>
										9=Missing/Blank
									</TD>
								</TR>
								<TR>
									<TD class="heading">Practice</TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="srp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Practice"
											FieldTextBoxTabIndex="5" DatabaseField="srp" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1</TD>
									<TD>
										<def:datafieldcontrol id="r01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r01"
											FieldTextBoxTabIndex="34" DatabaseField="r01" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="371" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr01"
											FieldTextBoxTabIndex="6" DatabaseField="sr01" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">2</TD>
									<TD>
										<def:datafieldcontrol id="r02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r02"
											FieldTextBoxTabIndex="35" DatabaseField="r02" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr02"
											FieldTextBoxTabIndex="7" DatabaseField="sr02" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">3</TD>
									<TD>
										<def:datafieldcontrol id="r03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r03"
											FieldTextBoxTabIndex="36" DatabaseField="r03" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr03"
											FieldTextBoxTabIndex="8" DatabaseField="sr03" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">4</TD>
									<TD>
										<def:datafieldcontrol id="r04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r04"
											FieldTextBoxTabIndex="37" DatabaseField="r04" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="380" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr04"
											FieldTextBoxTabIndex="9" DatabaseField="sr04" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">5</TD>
									<TD>
										<def:datafieldcontrol id="r05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r05"
											FieldTextBoxTabIndex="38" DatabaseField="r05" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="383" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr05"
											FieldTextBoxTabIndex="10" DatabaseField="sr05" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">6</TD>
									<TD>
										<def:datafieldcontrol id="r06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r06"
											FieldTextBoxTabIndex="39" DatabaseField="r06" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr06"
											FieldTextBoxTabIndex="11" DatabaseField="sr06" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">7</TD>
									<TD>
										<def:datafieldcontrol id="r07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r07"
											FieldTextBoxTabIndex="40" DatabaseField="r07" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="389" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr07"
											FieldTextBoxTabIndex="12" DatabaseField="sr07" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">8</TD>
									<TD>
										<def:datafieldcontrol id="r08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r08"
											FieldTextBoxTabIndex="41" DatabaseField="r08" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="392" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr08"
											FieldTextBoxTabIndex="13" DatabaseField="sr08" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">9</TD>
									<TD>
										<def:datafieldcontrol id="r09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r09"
											FieldTextBoxTabIndex="42" DatabaseField="r09" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr09"
											FieldTextBoxTabIndex="14" DatabaseField="sr09" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">10</TD>
									<TD>
										<def:datafieldcontrol id="r10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r10"
											FieldTextBoxTabIndex="43" DatabaseField="r10" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr10"
											FieldTextBoxTabIndex="15" DatabaseField="sr10" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">11</TD>
									<TD>
										<def:datafieldcontrol id="r11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r11"
											FieldTextBoxTabIndex="44" DatabaseField="r11" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr11"
											FieldTextBoxTabIndex="16" DatabaseField="sr11" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">12</TD>
									<TD>
										<def:datafieldcontrol id="r12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r12"
											FieldTextBoxTabIndex="45" DatabaseField="r12" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr12"
											FieldTextBoxTabIndex="17" DatabaseField="sr12" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">13</TD>
									<TD>
										<def:datafieldcontrol id="r13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r13"
											FieldTextBoxTabIndex="46" DatabaseField="r13" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr13"
											FieldTextBoxTabIndex="18" DatabaseField="sr13" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">14</TD>
									<TD>
										<def:datafieldcontrol id="r14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r14"
											FieldTextBoxTabIndex="47" DatabaseField="r14" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr14"
											FieldTextBoxTabIndex="19" DatabaseField="sr14" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">15</TD>
									<TD>
										<def:datafieldcontrol id="r15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r15"
											FieldTextBoxTabIndex="48" DatabaseField="r15" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr15"
											FieldTextBoxTabIndex="20" DatabaseField="sr15" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">16</TD>
									<TD>
										<def:datafieldcontrol id="r16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r16"
											FieldTextBoxTabIndex="49" DatabaseField="r16" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr16"
											FieldTextBoxTabIndex="21" DatabaseField="sr16" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">17</TD>
									<TD>
										<def:datafieldcontrol id="r17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r17"
											FieldTextBoxTabIndex="50" DatabaseField="r17" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr17"
											FieldTextBoxTabIndex="22" DatabaseField="sr17" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">18</TD>
									<TD>
										<def:datafieldcontrol id="r18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r18"
											FieldTextBoxTabIndex="51" DatabaseField="r18" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr18"
											FieldTextBoxTabIndex="23" DatabaseField="sr18" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">19</TD>
									<TD>
										<def:datafieldcontrol id="r19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r19"
											FieldTextBoxTabIndex="52" DatabaseField="r19" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr19"
											FieldTextBoxTabIndex="24" DatabaseField="sr19" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">20</TD>
									<TD>
										<def:datafieldcontrol id="r20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="r20"
											FieldTextBoxTabIndex="53" DatabaseField="r20" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sr20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="sr20"
											FieldTextBoxTabIndex="25" DatabaseField="sr20" FieldTextBoxWidth="30px" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="srtotco" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="# correct:"
											FieldTextBoxTabIndex="54" DatabaseField="srtotco" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srrevco" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="reversal correct:"
											FieldTextBoxTabIndex="55" DatabaseField="srrevco" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srrever" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="reversal error:"
											FieldTextBoxTabIndex="59" DatabaseField="srrever" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srcfc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="correct follow correct:"
											FieldTextBoxTabIndex="57" DatabaseField="srcfc" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srefe" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="error follow error:"
											FieldTextBoxTabIndex="60" DatabaseField="srefe" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srcfe" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="correct follow error, not reversal:"
											FieldTextBoxTabIndex="58" DatabaseField="srcfe" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srefc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="error follow correct:"
											FieldTextBoxTabIndex="61" DatabaseField="srefc" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srcri" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="# correct criterion:"
											FieldTextBoxTabIndex="62" DatabaseField="sr#cri" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srrevtr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="# reversal trials:"
											FieldTextBoxTabIndex="56" DatabaseField="srrevtr" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Reversal Trial #</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srrev1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="srrev1"
											FieldTextBoxTabIndex="26" DatabaseField="srrev1" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srrev2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="srrev2"
											FieldTextBoxTabIndex="27" DatabaseField="srrev2" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srrev3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="srrev3"
											FieldTextBoxTabIndex="28" DatabaseField="srrev3" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srrev4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="srrev4"
											FieldTextBoxTabIndex="29" DatabaseField="srrev4" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="srscor" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring notes:"
											FieldTextBoxTabIndex="65" DatabaseField="srscor" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="srbeh" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Behavioral Comments"
											FieldTextBoxTabIndex="30" DatabaseField="srbeh" FieldTextBoxWidth="200px" FieldLabelWidth="80px" FieldTextBoxHeight="150px"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srvld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=valid, 2=questionable, 3=invalid)"
											FieldTextBoxTabIndex="31" DatabaseField="srvld" FieldLabelWidth="80px" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srcmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Validity Comments"
											FieldTextBoxTabIndex="32" DatabaseField="srcmt" FieldTextBoxWidth="200px" FieldLabelWidth="80px" FieldTextBoxHeight="150px"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="66" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="67" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="68" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="69" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
