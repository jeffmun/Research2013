<%@ Page language="c#" Inherits="GenericDataEntryForms.cbq.cbq" CodeFile="cbq.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="cbq_pk" MeasureName="Child Behavior Questionnaire" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_cbq" AllowedStudyMeasures="799,1065" LastScoredDateField="scored"
							LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<table class="grid">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="4" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="40px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="cbqdate" runat="server" FieldLabelWidth="40px" FieldTextBoxWidth="80px" DatabaseField="cbqdate"
											FieldTextBoxTabIndex="5" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="cbqrsp" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="30px" DatabaseField="cbqrsp"
											FieldTextBoxTabIndex="6" FieldLabelText="Respondant" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbqrspo" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="200px" DatabaseField="cbqrspo"
											FieldTextBoxTabIndex="6" FieldLabelText="(specify if 3 or 4)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>1=extremely untrue of your child<BR>
										2=quite untrue of your child<BR>
										3=slightly untrue of your child<BR>
										4=neither true nor false of your child<BR>
										5=slightly true of your child<BR>
										6=quite true of your child<BR>
										7=extremely true of your child<BR>
										8=N/A<BR>
										9=Missing
									</TD>
								</TR>
							</TABLE><BR>(S) = Surgency Items<BR>(N) = Negative 
      Affect Items<BR>(E) = Effortful Control Items<BR><BR>
      <TABLE class="grid">
								<TR>
									<TD></TD>
									<TD>Recoded</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq01" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq01"
											FieldTextBoxTabIndex="7" FieldLabelText="1 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol><BR>
									</TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq02" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq02"
											FieldTextBoxTabIndex="8" FieldLabelText="2 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq03" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq03"
											FieldTextBoxTabIndex="9" FieldLabelText="3 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq04" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq04"
											FieldTextBoxTabIndex="10" FieldLabelText="4 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq05" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq05"
											FieldTextBoxTabIndex="11" FieldLabelText="5 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq06" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq06"
											FieldTextBoxTabIndex="12" FieldLabelText="6 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq07" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq07"
											FieldTextBoxTabIndex="13" FieldLabelText="7 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq08" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq08"
											FieldTextBoxTabIndex="14" FieldLabelText="8 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq09" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq09"
											FieldTextBoxTabIndex="15" FieldLabelText="9 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq10" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq10"
											FieldTextBoxTabIndex="16" FieldLabelText="10 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq11" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq11"
											FieldTextBoxTabIndex="17" FieldLabelText="11 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq12" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq12"
											FieldTextBoxTabIndex="18" FieldLabelText="12 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq13" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq13"
											FieldTextBoxTabIndex="19" FieldLabelText="13 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="929"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq13r" FieldTextBoxTabIndex="19" FieldLabelText="13 (S)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq14" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq14"
											FieldTextBoxTabIndex="20" FieldLabelText="14 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq15" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq15"
											FieldTextBoxTabIndex="21" FieldLabelText="15 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq16" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq16"
											FieldTextBoxTabIndex="22" FieldLabelText="16 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq17" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq17"
											FieldTextBoxTabIndex="23" FieldLabelText="17 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq18" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq18"
											FieldTextBoxTabIndex="24" FieldLabelText="18 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq19" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq19"
											FieldTextBoxTabIndex="25" FieldLabelText="19 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1051"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq19r" FieldTextBoxTabIndex="25" FieldLabelText="19 (S)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq20" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq20"
											FieldTextBoxTabIndex="26" FieldLabelText="20 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1055"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq20r" FieldTextBoxTabIndex="26" FieldLabelText="20 (N)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq21" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq21"
											FieldTextBoxTabIndex="27" FieldLabelText="21 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq22" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq22"
											FieldTextBoxTabIndex="28" FieldLabelText="22 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1063"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq22r" FieldTextBoxTabIndex="28" FieldLabelText="22 (S)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq23" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq23"
											FieldTextBoxTabIndex="29" FieldLabelText="23 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq24" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq24"
											FieldTextBoxTabIndex="30" FieldLabelText="24 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq25" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq25"
											FieldTextBoxTabIndex="31" FieldLabelText="25 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq26" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq26"
											FieldTextBoxTabIndex="32" FieldLabelText="26 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1079"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq26r" FieldTextBoxTabIndex="32" FieldLabelText="26 (N)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq27" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq27"
											FieldTextBoxTabIndex="33" FieldLabelText="27 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq28" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq28"
											FieldTextBoxTabIndex="34" FieldLabelText="28 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq29" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq29"
											FieldTextBoxTabIndex="35" FieldLabelText="29 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1091"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq29r" FieldTextBoxTabIndex="35" FieldLabelText="29 (N)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq30" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq30"
											FieldTextBoxTabIndex="36" FieldLabelText="30 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq31" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq31"
											FieldTextBoxTabIndex="37" FieldLabelText="31 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1099"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq31r" FieldTextBoxTabIndex="37" FieldLabelText="31 (S)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq32" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq32"
											FieldTextBoxTabIndex="38" FieldLabelText="32 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq33" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq33"
											FieldTextBoxTabIndex="39" FieldLabelText="33 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq34" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq34"
											FieldTextBoxTabIndex="40" FieldLabelText="34 (S)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="1111"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px"
											DatabaseField="cbq34r" FieldTextBoxTabIndex="40" FieldLabelText="34 (S)." IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq35" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq35"
											FieldTextBoxTabIndex="41" FieldLabelText="35 (N)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbq36" runat="server" FieldLabelWidth="45px" FieldTextBoxWidth="40px" DatabaseField="cbq36"
											FieldTextBoxTabIndex="42" FieldLabelText="36 (E)." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="2485"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="250px"
								DatabaseField="cbqcmt" FieldTextBoxTabIndex="42" FieldLabelText="Comments"
								IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
								IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" ValidList="1,2,3,4,5,6,7,8,9" FieldTextBoxHeight="150px"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="200"></def:datafieldcontrol><BR>
      <TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Item Count</TD>
									<TD class="heading">Item Total</TD>
									<TD class="heading">Scale Score</TD>
								</TR>
								<TR>
									<TD class="heading">Surgency</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" DatabaseField="cbqSuCnt" FieldTextBoxTabIndex="43"
											FieldLabelText="cbqSuCnt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbqSuTot" runat="server" DatabaseField="cbqSuTot" FieldTextBoxTabIndex="43"
											FieldLabelText="cbqSuTot" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="19"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbqSuSS" runat="server" DatabaseField="cbqSuSS" FieldTextBoxTabIndex="44" FieldLabelText="cbqSuSS"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Negative Affect</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" DatabaseField="cbqNeCnt" FieldTextBoxTabIndex="45"
											FieldLabelText="cbqNeTot" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbqNeTot" runat="server" DatabaseField="cbqNeTot" FieldTextBoxTabIndex="45"
											FieldLabelText="cbqNeTot" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="187"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbqNeSS" runat="server" DatabaseField="cbqNeSS" FieldTextBoxTabIndex="46" FieldLabelText="cbqNeSS"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Effortful Control</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" DatabaseField="cbqEfCnt" FieldTextBoxTabIndex="47"
											FieldLabelText="cbqEfTot" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbqEfTot" runat="server" DatabaseField="cbqEfTot" FieldTextBoxTabIndex="47"
											FieldLabelText="cbqEfTot" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="194"
											RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbqEfSS" runat="server" DatabaseField="cbqEfSS" FieldTextBoxTabIndex="48" FieldLabelText="cbqEfSS"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="scoremsg" runat="server" FieldLabelWidth="100px" DatabaseField="scoremsg" FieldTextBoxTabIndex="49"
								FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True"
								IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol><BR><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="51"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="52"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="53"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="54"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="55"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="56"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
