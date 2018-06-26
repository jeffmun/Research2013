

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.abc.abc" CodeFile="abc.aspx.cs"   MasterPageFile="~/UWAC.master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="145,208,342,589,762"
							LookupField1DataType="TEXT" VerifiedField="verified" PrimaryKeyField="abc_pk" MeasureName="ABC" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_abc" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" DatabaseField="id"
										FieldTextBoxTabIndex="1" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="false"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Respondant</TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="ABCresp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Respondant"
											FieldTextBoxTabIndex="2" DatabaseField="ABCresp" FieldLabelWidth="130px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="ABCrtxt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(specify if 3 or 4)"
											FieldTextBoxTabIndex="2" DatabaseField="ABCrtxt" FieldLabelWidth="130px" FieldTextBoxWidth="200px"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD></TD>
									<TD class="heading" colSpan="3">Z-scores</TD>
								</TR>
								<TR>
									<TD class="heading">SCALE</TD>
									<TD class="heading">Raw score</TD>
									<TD class="heading">by Sex</TD>
									<TD class="heading">by Age</TD>
									<TD class="heading">by Age and Sex</TD>
								</TR>
								<TR>
									<TD class="heading">Irritability</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcirr"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="935" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcirrzs"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcirrza"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="945" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcirrzb"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" height="24">Withdrawal</TD>
									<TD height="24">
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcwit"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="936" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="24">
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcwitzs"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD height="24">
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcwitza"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="946" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD height="26">
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcwitzb"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Hyperactivity</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abchyp"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="937" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abchypzs"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abchypza"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="947" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol18" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abchypzb"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Stereotyped<BR>
										Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcstb"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="938" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcstbzs"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcstbza"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="948" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol19" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcstbzb"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Inappropriate<BR>
										Speech</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcins"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="939" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcinszs"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcinsza"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="949" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FormatString="{0:f}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol20" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Datafieldcontrol1" FieldTextBoxTabIndex="22" DatabaseField="abcinszb"
											FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="954" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="Datafieldcontrol21" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
								IsDoubleEntryField="False" FieldLabelText="Age table from norms used:" FieldTextBoxTabIndex="22" DatabaseField="normtbl"
								FieldLabelWidth="175px" DESIGNTIMEDRAGDROP="955" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"></def:datafieldcontrol>
							<def:datafieldcontrol id="Datafieldcontrol22" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
								IsDoubleEntryField="False" FieldLabelText="Scoring message:" FieldTextBoxTabIndex="22" DatabaseField="scoremsg"
								FieldLabelWidth="150px" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"></def:datafieldcontrol>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading" colSpan="2">0-not at all a problem<BR>
										1-slight in degree<BR>
										2-moderately serious<BR>
										3-severe in degree<BR>
										9-Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Excessively active at home, school, work, or elsewhere"
											FieldTextBoxTabIndex="4" DatabaseField="ABC101" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,2,3,9"
											FieldTextBoxTextMode="SingleLine" DESIGNTIMEDRAGDROP="17"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC130" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Isolates himself/herself from other children or adults"
											FieldTextBoxTabIndex="33" DatabaseField="ABC130" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Injures self on purpose"
											FieldTextBoxTabIndex="5" DatabaseField="ABC102" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,2,3,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC131" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Disrupts group activities"
											FieldTextBoxTabIndex="34" DatabaseField="ABC131" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Listless, sluggish, inactive"
											FieldTextBoxTabIndex="6" DatabaseField="ABC103" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,2,3,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC132" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Sits or stands in one position for a long time"
											FieldTextBoxTabIndex="35" DatabaseField="ABC132" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Aggressive to other children or adults (verbally or physicall"
											FieldTextBoxTabIndex="7" DatabaseField="ABC104" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,2,3,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC133" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Talk to self loudly"
											FieldTextBoxTabIndex="36" DatabaseField="ABC133" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC105" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Seeks isolation from others"
											FieldTextBoxTabIndex="8" DatabaseField="ABC105" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,2,3,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC134" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. Cries over minor annoyances and hurts"
											FieldTextBoxTabIndex="37" DatabaseField="ABC134" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC106" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Meaningless, recurring body movements"
											FieldTextBoxTabIndex="9" DatabaseField="ABC106" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,2,3,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC135" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Repetitive hand, body, or head movements"
											FieldTextBoxTabIndex="38" DatabaseField="ABC135" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC107" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Boisterous (inappropriately noisy and rough)"
											FieldTextBoxTabIndex="10" DatabaseField="ABC107" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC136" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Mood changes quickly"
											FieldTextBoxTabIndex="39" DatabaseField="ABC136" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC108" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Screams inappropriately"
											FieldTextBoxTabIndex="11" DatabaseField="ABC108" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC137" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Unresponsive to structured activities (does not react)"
											FieldTextBoxTabIndex="40" DatabaseField="ABC137" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC109" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Talks excessively"
											FieldTextBoxTabIndex="12" DatabaseField="ABC109" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC138" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Does not stay in seat (during lesson, training session, meal"
											FieldTextBoxTabIndex="41" DatabaseField="ABC138" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC110" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Temper tantrums/outbursts"
											FieldTextBoxTabIndex="13" DatabaseField="ABC110" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC139" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Will not sit still for any length of time"
											FieldTextBoxTabIndex="42" DatabaseField="ABC139" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC111" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Stereotyped behavior; abnormal, repetitive movements"
											FieldTextBoxTabIndex="14" DatabaseField="ABC111" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC140" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Is difficult to reach, contact, or get through to"
											FieldTextBoxTabIndex="43" DatabaseField="ABC140" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC112" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Preoccupied, stares into space"
											FieldTextBoxTabIndex="15" DatabaseField="ABC112" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC141" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Cries and screams inappropriately"
											FieldTextBoxTabIndex="44" DatabaseField="ABC141" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC113" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Impulsive (acts without thinking)"
											FieldTextBoxTabIndex="16" DatabaseField="ABC113" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC142" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Prefers to be alone"
											FieldTextBoxTabIndex="45" DatabaseField="ABC142" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC114" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Irritable and whiny"
											FieldTextBoxTabIndex="17" DatabaseField="ABC114" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC143" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Does not try to communicate by words or gestures"
											FieldTextBoxTabIndex="46" DatabaseField="ABC143" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC115" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Restless, unable to sit still"
											FieldTextBoxTabIndex="18" DatabaseField="ABC115" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC144" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Easily distractible"
											FieldTextBoxTabIndex="47" DatabaseField="ABC144" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC116" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Withdrawn; prefers solitary activities"
											FieldTextBoxTabIndex="19" DatabaseField="ABC116" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC145" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Waves or shakes the extremities repeatedly"
											FieldTextBoxTabIndex="48" DatabaseField="ABC145" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC117" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Odd, bizarre in behavior"
											FieldTextBoxTabIndex="20" DatabaseField="ABC117" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC146" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Repeats a word or phrase over and over"
											FieldTextBoxTabIndex="49" DatabaseField="ABC146" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC118" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Disobedient, difficult to control"
											FieldTextBoxTabIndex="21" DatabaseField="ABC118" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC147" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Stamps feet or bangs objects or slams doors"
											FieldTextBoxTabIndex="50" DatabaseField="ABC147" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC119" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Yells at inappropriate times"
											FieldTextBoxTabIndex="22" DatabaseField="ABC119" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC148" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Constantly runs or jumps around the room"
											FieldTextBoxTabIndex="51" DatabaseField="ABC148" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC120" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Fixed facial expression; lacks emotional responsiveness"
											FieldTextBoxTabIndex="23" DatabaseField="ABC120" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC149" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Rocks body back and forth repeatedly"
											FieldTextBoxTabIndex="52" DatabaseField="ABC149" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC121" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Disturbs others"
											FieldTextBoxTabIndex="24" DatabaseField="ABC121" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC150" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Deliberately hurts himself/herself"
											FieldTextBoxTabIndex="53" DatabaseField="ABC150" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC122" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Repetitive speech"
											FieldTextBoxTabIndex="25" DatabaseField="ABC122" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC151" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Pays no attention when spoken to"
											FieldTextBoxTabIndex="54" DatabaseField="ABC151" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC123" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Does nothing but sit and watch others"
											FieldTextBoxTabIndex="26" DatabaseField="ABC123" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC152" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Does physical violence to self"
											FieldTextBoxTabIndex="55" DatabaseField="ABC152" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC124" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Uncooperative"
											FieldTextBoxTabIndex="27" DatabaseField="ABC124" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC153" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. Inactive, never moves spontaneously"
											FieldTextBoxTabIndex="56" DatabaseField="ABC153" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC125" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Depressed mood"
											FieldTextBoxTabIndex="28" DatabaseField="ABC125" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC154" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. Tends to be excessively active"
											FieldTextBoxTabIndex="57" DatabaseField="ABC154" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC126" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Resists any form of physical contact"
											FieldTextBoxTabIndex="29" DatabaseField="ABC126" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC155" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. Responds negatively to affection"
											FieldTextBoxTabIndex="58" DatabaseField="ABC155" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC127" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Moves or rolls head back and forth repetitively"
											FieldTextBoxTabIndex="30" DatabaseField="ABC127" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC156" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="56. Deliberately ignores directions"
											FieldTextBoxTabIndex="59" DatabaseField="ABC156" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC128" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Does not pay attention to instructions"
											FieldTextBoxTabIndex="31" DatabaseField="ABC128" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC157" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. Has temper outbursts or tantrums when does not get own way"
											FieldTextBoxTabIndex="60" DatabaseField="ABC157" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="219">
										<def:datafieldcontrol id="ABC129" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Demands must be met immediately"
											FieldTextBoxTabIndex="32" DatabaseField="ABC129" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC158" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. Shows few social reactions to others"
											FieldTextBoxTabIndex="61" DatabaseField="ABC158" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="22" DatabaseField="created" FieldLabelWidth="80px" DESIGNTIMEDRAGDROP="919"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="23" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="24" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="25" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="237" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="238" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel>
						
						
</asp:Content>