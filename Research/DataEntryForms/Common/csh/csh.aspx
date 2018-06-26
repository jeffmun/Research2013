<%@ Page language="c#" Inherits="GenericDataEntryForms.csh.csh" CodeFile="csh.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_csh" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Child Sleep Habits Questionnaire"
							PrimaryKeyField="csh_pk" VerifiedField="verified" LookupField1DataType="TEXT"
							AllowedStudyMeasures="748,766,1223,1358,1925"></def:dataentrycontroller><br>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="4" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="60px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="cshdate" runat="server" DatabaseField="cshdate" FieldTextBoxTabIndex="5" FieldLabelText="Date"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="60px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										-9=Missing/Unknown<BR>
										<def:datafieldcontrol id="cshrsp" runat="server" DatabaseField="cshrsp" FieldTextBoxTabIndex="6" FieldLabelText="Respondant"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="130px" FieldTextBoxWidth="40px" ValidList="1,2,3,4,-9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cshrspo" runat="server" DatabaseField="cshrspo" FieldTextBoxTabIndex="6" FieldLabelText="(specify if 3 or 4)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="130px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br />
							<def:datafieldcontrol id="cshbt" runat="server" DatabaseField="cshbt" FieldTextBoxTabIndex="6" FieldLabelText="Write in child's bedtime. <em>(Use <strong>-9</strong> for Missing Values.)</em>"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="80px"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Bedtime</TD>
									<TD><B>3</B>=Usually<BR>
										<B>2</B>=Sometimes<BR>
										<B>1</B>=Rarely<BR>
										<B>-9</B>=Missing
									</TD>
									<TD><B>1</B>=Yes<BR>
										<B>2</B>=No<BR>
										<B>3</B>=N/A<BR>
										<B>-9</B>=Missing
									</TD>
								</TR>
								<TR>
									<TD>Child goes to bed at the same time at night</TD>
									<TD>
										<def:datafieldcontrol id="csh01" runat="server" DatabaseField="csh01" FieldTextBoxTabIndex="6" FieldLabelText="csh01"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh01p" runat="server" DatabaseField="csh01p" FieldTextBoxTabIndex="6" FieldLabelText="csh01p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child falls asleep within 20 minutes after going to bed</TD>
									<TD>
										<def:datafieldcontrol id="csh03" runat="server" DatabaseField="csh03" FieldTextBoxTabIndex="6" FieldLabelText="csh03"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh03p" runat="server" DatabaseField="csh03p" FieldTextBoxTabIndex="6" FieldLabelText="csh03p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child falls asleep alone in own bed</TD>
									<TD>
										<def:datafieldcontrol id="csh04" runat="server" DatabaseField="csh04" FieldTextBoxTabIndex="6" FieldLabelText="csh04"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh04p" runat="server" DatabaseField="csh04p" FieldTextBoxTabIndex="6" FieldLabelText="csh04p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child falls asleep in parent's or sibling's bed</TD>
									<TD>
										<def:datafieldcontrol id="csh05" runat="server" DatabaseField="csh05" FieldTextBoxTabIndex="6" FieldLabelText="csh05"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh05p" runat="server" DatabaseField="csh05p" FieldTextBoxTabIndex="6" FieldLabelText="csh05p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child falls asleep with rocking or rhythmic movements</TD>
									<TD>
										<def:datafieldcontrol id="csh06" runat="server" DatabaseField="csh06" FieldTextBoxTabIndex="6" FieldLabelText="csh06"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh06p" runat="server" DatabaseField="csh06p" FieldTextBoxTabIndex="6" FieldLabelText="csh06p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child needs special object to fall asleep (doll, special blanket, etc.)</TD>
									<TD>
										<def:datafieldcontrol id="csh07" runat="server" DatabaseField="csh07" FieldTextBoxTabIndex="6" FieldLabelText="csh07"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh07p" runat="server" DatabaseField="csh07p" FieldTextBoxTabIndex="6" FieldLabelText="csh07p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child needs parent in the room to fall asleep</TD>
									<TD>
										<def:datafieldcontrol id="csh08" runat="server" DatabaseField="csh08" FieldTextBoxTabIndex="6" FieldLabelText="csh08"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh08p" runat="server" DatabaseField="csh08p" FieldTextBoxTabIndex="6" FieldLabelText="csh08p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child is ready to go to bed at bedtime</TD>
									<TD>
										<def:datafieldcontrol id="csh09" runat="server" DatabaseField="csh09" FieldTextBoxTabIndex="6" FieldLabelText="csh09"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh09p" runat="server" DatabaseField="csh09p" FieldTextBoxTabIndex="6" FieldLabelText="csh09p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">Child resists going to bed at bedtime</TD>
									<TD>
										<def:datafieldcontrol id="csh10" runat="server" DatabaseField="csh10" FieldTextBoxTabIndex="6" FieldLabelText="csh10"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh10p" runat="server" DatabaseField="csh10p" FieldTextBoxTabIndex="6" FieldLabelText="csh10p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child struggles at bedtime (cries, refuses to stay in bed, etc.)</TD>
									<TD>
										<def:datafieldcontrol id="csh11" runat="server" DatabaseField="csh11" FieldTextBoxTabIndex="6" FieldLabelText="csh11"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh11p" runat="server" DatabaseField="csh11p" FieldTextBoxTabIndex="6" FieldLabelText="csh11p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child is afraid of sleeping in the dark</TD>
									<TD>
										<def:datafieldcontrol id="csh12" runat="server" DatabaseField="csh12" FieldTextBoxTabIndex="6" FieldLabelText="csh12"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh12p" runat="server" DatabaseField="csh12p" FieldTextBoxTabIndex="6" FieldLabelText="csh12p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child is afraid of sleep alone</TD>
									<TD>
										<def:datafieldcontrol id="csh13" runat="server" DatabaseField="csh13" FieldTextBoxTabIndex="6" FieldLabelText="csh13"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh13p" runat="server" DatabaseField="csh13p" FieldTextBoxTabIndex="6" FieldLabelText="csh13p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br />
							<def:datafieldcontrol id="cshamth" runat="server" DatabaseField="cshamth" FieldTextBoxTabIndex="6" FieldLabelText="Child's usual amount of sleep (hours). <em>(Use <strong>-9</strong> for Missing Values.)</em>"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" DESIGNTIMEDRAGDROP="6676"></def:datafieldcontrol>
							<def:datafieldcontrol id="cshamtm" runat="server" DatabaseField="cshamtm" FieldTextBoxTabIndex="6" FieldLabelText="Child's usual amount of sleep (minutes). <em>(Use <strong>-9</strong> for Missing Values.)</em>"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="50px" DESIGNTIMEDRAGDROP="6679"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Sleep Behavior</TD>
									<TD><B>3</B>=Usually<BR>
										<B>2</B>=Sometimes<BR>
										<B>1</B>=Rarely<BR>
										<B>-9</B>=Missing
									</TD>
									<TD><B>1</B>=Yes<BR>
										<B>2</B>=No<BR>
										<B>3</B>=N/A<BR>
										<B>-9</B>=Missing
									</TD>
								</TR>
								<TR>
									<TD>Child sleeps too little</TD>
									<TD>
										<def:datafieldcontrol id="csh14" runat="server" DatabaseField="csh14" FieldTextBoxTabIndex="6" FieldLabelText="csh14"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh14p" runat="server" DatabaseField="csh14p" FieldTextBoxTabIndex="6" FieldLabelText="csh14p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child sleeps too much</TD>
									<TD>
										<def:datafieldcontrol id="csh15" runat="server" DatabaseField="csh15" FieldTextBoxTabIndex="6" FieldLabelText="csh15"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh15p" runat="server" DatabaseField="csh15p" FieldTextBoxTabIndex="6" FieldLabelText="csh15p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child sleeps the right amount</TD>
									<TD>
										<def:datafieldcontrol id="csh16" runat="server" DatabaseField="csh16" FieldTextBoxTabIndex="6" FieldLabelText="csh16"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh16p" runat="server" DatabaseField="csh16p" FieldTextBoxTabIndex="6" FieldLabelText="csh16p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child sleeps about the same amount each day</TD>
									<TD>
										<def:datafieldcontrol id="csh17" runat="server" DatabaseField="csh17" FieldTextBoxTabIndex="6" FieldLabelText="csh17"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh17p" runat="server" DatabaseField="csh17p" FieldTextBoxTabIndex="6" FieldLabelText="csh17p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child wets the bed at night</TD>
									<TD>
										<def:datafieldcontrol id="csh18" runat="server" DatabaseField="csh18" FieldTextBoxTabIndex="6" FieldLabelText="csh18"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh18p" runat="server" DatabaseField="csh18p" FieldTextBoxTabIndex="6" FieldLabelText="csh18p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child talks during sleep</TD>
									<TD>
										<def:datafieldcontrol id="csh19" runat="server" DatabaseField="csh19" FieldTextBoxTabIndex="6" FieldLabelText="csh19"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh19p" runat="server" DatabaseField="csh19p" FieldTextBoxTabIndex="6" FieldLabelText="csh19p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child is restless and moves a lot during sleep</TD>
									<TD>
										<def:datafieldcontrol id="csh20" runat="server" DatabaseField="csh20" FieldTextBoxTabIndex="6" FieldLabelText="csh20"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh20p" runat="server" DatabaseField="csh20p" FieldTextBoxTabIndex="6" FieldLabelText="csh20p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child sleepwalks during the night</TD>
									<TD>
										<def:datafieldcontrol id="csh21" runat="server" DatabaseField="csh21" FieldTextBoxTabIndex="6" FieldLabelText="csh21"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh21p" runat="server" DatabaseField="csh21p" FieldTextBoxTabIndex="6" FieldLabelText="csh21p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child moves to someone else's bed during the night (parent, brother, sister, 
										etc.)</TD>
									<TD>
										<def:datafieldcontrol id="csh22" runat="server" DatabaseField="csh22" FieldTextBoxTabIndex="6" FieldLabelText="csh22"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh22p" runat="server" DatabaseField="csh22p" FieldTextBoxTabIndex="6" FieldLabelText="csh22p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child reports body pains during sleep. If so, where?
										<def:datafieldcontrol id="cshwhr" runat="server" DatabaseField="cshwhr" FieldTextBoxTabIndex="6" FieldLabelText="cshwhr"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh23" runat="server" DatabaseField="csh23" FieldTextBoxTabIndex="6" FieldLabelText="csh23"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh23p" runat="server" DatabaseField="csh23p" FieldTextBoxTabIndex="6" FieldLabelText="csh23p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child grinds teeth during sleep (your dentist may have told you this)</TD>
									<TD>
										<def:datafieldcontrol id="csh24" runat="server" DatabaseField="csh24" FieldTextBoxTabIndex="6" FieldLabelText="csh24"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh24p" runat="server" DatabaseField="csh24p" FieldTextBoxTabIndex="6" FieldLabelText="csh24p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child snores loudly</TD>
									<TD>
										<def:datafieldcontrol id="csh25" runat="server" DatabaseField="csh25" FieldTextBoxTabIndex="6" FieldLabelText="csh25"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh25p" runat="server" DatabaseField="csh25p" FieldTextBoxTabIndex="6" FieldLabelText="csh25p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child seems to stop breathing during sleep</TD>
									<TD>
										<def:datafieldcontrol id="csh26" runat="server" DatabaseField="csh26" FieldTextBoxTabIndex="6" FieldLabelText="csh26"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh26p" runat="server" DatabaseField="csh26p" FieldTextBoxTabIndex="6" FieldLabelText="csh26p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child snorts and/or gasps during sleep</TD>
									<TD>
										<def:datafieldcontrol id="csh27" runat="server" DatabaseField="csh27" FieldTextBoxTabIndex="6" FieldLabelText="csh27"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh27p" runat="server" DatabaseField="csh27p" FieldTextBoxTabIndex="6" FieldLabelText="csh27p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child has trouble sleeping away from home (visiting relatives, vacation)</TD>
									<TD>
										<def:datafieldcontrol id="csh28" runat="server" DatabaseField="csh28" FieldTextBoxTabIndex="6" FieldLabelText="csh28"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh28p" runat="server" DatabaseField="csh28p" FieldTextBoxTabIndex="6" FieldLabelText="csh28p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child complains about problems sleeping</TD>
									<TD>
										<def:datafieldcontrol id="csh29" runat="server" DatabaseField="csh29" FieldTextBoxTabIndex="6" FieldLabelText="csh29"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh29p" runat="server" DatabaseField="csh29p" FieldTextBoxTabIndex="6" FieldLabelText="csh29p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child awakens during night screaming, sweating, and inconsolable</TD>
									<TD>
										<def:datafieldcontrol id="csh30" runat="server" DatabaseField="csh30" FieldTextBoxTabIndex="6" FieldLabelText="csh30"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh30p" runat="server" DatabaseField="csh30p" FieldTextBoxTabIndex="6" FieldLabelText="csh30p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child awakens alarmed by a frightening dream</TD>
									<TD>
										<def:datafieldcontrol id="csh31" runat="server" DatabaseField="csh31" FieldTextBoxTabIndex="6" FieldLabelText="csh31"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh31p" runat="server" DatabaseField="csh31p" FieldTextBoxTabIndex="6" FieldLabelText="csh31p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Waking During the Night</TD>
									<TD><B>3</B>=Usually<BR>
										<B>2</B>=Sometimes<BR>
										<B>1</B>=Rarely<BR>
										<B>-9</B>=Missing
									</TD>
									<TD><B>1</B>=Yes<BR>
										<B>2</B>=No<BR>
										<B>3</B>=N/A<BR>
										<B>-9</B>=Missing
									</TD>
								</TR>
								<TR>
									<TD>Child awakes once during the night</TD>
									<TD>
										<def:datafieldcontrol id="csh32" runat="server" DatabaseField="csh32" FieldTextBoxTabIndex="6" FieldLabelText="csh32"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh32p" runat="server" DatabaseField="csh32p" FieldTextBoxTabIndex="6" FieldLabelText="csh32p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child awakes more than once during the night</TD>
									<TD>
										<def:datafieldcontrol id="csh33" runat="server" DatabaseField="csh33" FieldTextBoxTabIndex="6" FieldLabelText="csh33"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh33p" runat="server" DatabaseField="csh33p" FieldTextBoxTabIndex="6" FieldLabelText="csh33p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child returns to sleep without help after waking</TD>
									<TD>
										<def:datafieldcontrol id="csh34" runat="server" DatabaseField="csh34" FieldTextBoxTabIndex="6" FieldLabelText="csh34"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh34p" runat="server" DatabaseField="csh34p" FieldTextBoxTabIndex="6" FieldLabelText="csh34p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br />
							<def:datafieldcontrol id="cshmin" runat="server" DatabaseField="cshmin" FieldTextBoxTabIndex="6" FieldLabelText="Write the number of minutes a night waking usually lasts. <em>(Use <strong>-9</strong> for Missing Values.)</em>"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="cshwake" runat="server" DatabaseField="cshwake" FieldTextBoxTabIndex="6" FieldLabelText="Write in the time of day child usually wakes in the morning. <em>(Use <strong>-9</strong> for Missing Values.)</em>"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="FALSE" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="40px"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Morning Waking</TD>
									<TD><B>3</B>=Usually<BR>
										<B>2</B>=Sometimes<BR>
										<B>1</B>=Rarely<BR>
										<B>-9</B>=Missing
									</TD>
									<TD><B>1</B>=Yes<BR>
										<B>2</B>=No<BR>
										<B>3</B>=N/A<BR>
										<B>-9</B>=Missing
									</TD>
								</TR>
								<TR>
									<TD>Child wakes up by him/herself</TD>
									<TD>
										<def:datafieldcontrol id="csh35" runat="server" DatabaseField="csh35" FieldTextBoxTabIndex="6" FieldLabelText="csh35"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh35p" runat="server" DatabaseField="csh35p" FieldTextBoxTabIndex="6" FieldLabelText="csh35p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child wakes up with alarm clock</TD>
									<TD>
										<def:datafieldcontrol id="csh36" runat="server" DatabaseField="csh36" FieldTextBoxTabIndex="6" FieldLabelText="csh36"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh36p" runat="server" DatabaseField="csh36p" FieldTextBoxTabIndex="6" FieldLabelText="csh36p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child wakes up in negative mood</TD>
									<TD>
										<def:datafieldcontrol id="csh37" runat="server" DatabaseField="csh37" FieldTextBoxTabIndex="6" FieldLabelText="csh37"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh37p" runat="server" DatabaseField="csh37p" FieldTextBoxTabIndex="6" FieldLabelText="csh37p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Adults or siblings wake up child</TD>
									<TD>
										<def:datafieldcontrol id="csh38" runat="server" DatabaseField="csh38" FieldTextBoxTabIndex="6" FieldLabelText="csh38"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh38p" runat="server" DatabaseField="csh38p" FieldTextBoxTabIndex="6" FieldLabelText="csh38p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child has difficulty getting out of bed in the morning</TD>
									<TD>
										<def:datafieldcontrol id="csh39" runat="server" DatabaseField="csh39" FieldTextBoxTabIndex="6" FieldLabelText="csh39"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh39p" runat="server" DatabaseField="csh39p" FieldTextBoxTabIndex="6" FieldLabelText="csh39p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child takes a long time to become alert in the morning</TD>
									<TD>
										<def:datafieldcontrol id="csh40" runat="server" DatabaseField="csh40" FieldTextBoxTabIndex="6" FieldLabelText="csh40"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh40p" runat="server" DatabaseField="csh40p" FieldTextBoxTabIndex="6" FieldLabelText="csh40p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child wakes up very early in the morning</TD>
									<TD>
										<def:datafieldcontrol id="csh41" runat="server" DatabaseField="csh41" FieldTextBoxTabIndex="6" FieldLabelText="csh41"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh41p" runat="server" DatabaseField="csh41p" FieldTextBoxTabIndex="6" FieldLabelText="csh41p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child has a good appetite in the morning</TD>
									<TD>
										<def:datafieldcontrol id="csh42" runat="server" DatabaseField="csh42" FieldTextBoxTabIndex="6" FieldLabelText="csh42"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh42p" runat="server" DatabaseField="csh42p" FieldTextBoxTabIndex="6" FieldLabelText="csh42p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child naps during the day</TD>
									<TD>
										<def:datafieldcontrol id="csh43" runat="server" DatabaseField="csh43" FieldTextBoxTabIndex="6" FieldLabelText="csh43"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh43p" runat="server" DatabaseField="csh43p" FieldTextBoxTabIndex="6" FieldLabelText="csh43p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child suddenly falls asleep in the middle of active behavior</TD>
									<TD>
										<def:datafieldcontrol id="csh44" runat="server" DatabaseField="csh44" FieldTextBoxTabIndex="6" FieldLabelText="csh44"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh44p" runat="server" DatabaseField="csh44p" FieldTextBoxTabIndex="6" FieldLabelText="csh44p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Child seems tired</TD>
									<TD>
										<def:datafieldcontrol id="csh45" runat="server" DatabaseField="csh45" FieldTextBoxTabIndex="6" FieldLabelText="csh45"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csh45p" runat="server" DatabaseField="csh45p" FieldTextBoxTabIndex="6" FieldLabelText="csh45p"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading"></TD>
									<TD><B>1</B>=Not Sleepy<BR>
										<B>2</B>=Very Sleepy<BR>
										<B>3</B>=Falls Asleep<BR>
										<B>-9</B>=Missing
									</TD>
								</TR>
								<TR>
									<TD>Play alone</TD>
									<TD>
										<def:datafieldcontrol id="csh46" runat="server" DatabaseField="csh46" FieldTextBoxTabIndex="6" FieldLabelText="csh46"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Watching TV</TD>
									<TD>
										<def:datafieldcontrol id="csh47" runat="server" DatabaseField="csh47" FieldTextBoxTabIndex="6" FieldLabelText="csh47"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Riding in car</TD>
									<TD>
										<def:datafieldcontrol id="csh48" runat="server" DatabaseField="csh48" FieldTextBoxTabIndex="6" FieldLabelText="csh48"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Eating meals</TD>
									<TD>
										<def:datafieldcontrol id="csh49" runat="server" DatabaseField="csh49" FieldTextBoxTabIndex="6" FieldLabelText="csh49"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="111" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="112"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="113" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="114"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" DatabaseField="scored" FieldTextBoxTabIndex="115" FieldLabelText="scored"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" DatabaseField="scoredBy" FieldTextBoxTabIndex="116"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
