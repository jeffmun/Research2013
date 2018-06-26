<%@ Page language="c#" Inherits="GenericDataEntryForms.CBCL.CBCL" CodeFile="CBCL.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LastUpdatedDateField="updated" LastScoredDateField="scored"
							AllowedStudyMeasures="474,736,1233,1242,1260,1354,1926,2084,2357,2406,2496,3188" DatabaseTable="all_cbcl" LookupField1="id" LookupTextBox2Visible="False"
							LookupTextBox1LabelText="Subject ID:" MeasureName="CBCL" PrimaryKeyField="cb_pk" VerifiedField="verified"
							ShowScoreButton="False" LookupField1DataType="TEXT" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<TABLE class="layout" id="table_insert">
							<TR>
								<TD>
									<def:datafieldcontrol id="id" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="80px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="cbdate" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="80px" DatabaseField="cbdate"
										FieldTextBoxTabIndex="3" FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="cbclin" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="80px" DatabaseField="cbclin"
										FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT"></def:datafieldcontrol></TD>
							</TR>
						</TABLE>
						<BR>
						<asp:Panel id="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3"><B>ACTIVITIES</B></TD>
								</TR>
								<TR>
									<TD>I A. # of sports</TD>
									<TD>
										<def:datafieldcontrol id="cb1Anum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb1Anum"
											FieldTextBoxTabIndex="232" DatabaseField="cb1Anum" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cb1Ause" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb1Ause"
											FieldTextBoxTabIndex="231" DatabaseField="cb1Ause" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>I B. Mean of participation
										<BR>
										and skill in sports</TD>
									<TD>
										<def:datafieldcontrol id="cb1Bmean" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb1Bmean"
											FieldTextBoxTabIndex="233" DatabaseField="cb1Bmean" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>II A. # Other activities</TD>
									<TD>
										<def:datafieldcontrol id="cb2Anum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb2Anum"
											FieldTextBoxTabIndex="235" DatabaseField="cb2Anum" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="1743"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cb2Ause" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb2Ause"
											FieldTextBoxTabIndex="234" DatabaseField="cb2Ause" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>II B. Mean participation and
										<BR>
										skill in activities</TD>
									<TD>
										<def:datafieldcontrol id="cb2Bmean" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb2Bmean"
											FieldTextBoxTabIndex="236" DatabaseField="cb2Bmean" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>IV A. # Jobs</TD>
									<TD>
										<def:datafieldcontrol id="cb4Anum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb4Anum"
											FieldTextBoxTabIndex="238" DatabaseField="cb4Anum" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cb4Ause" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb4Ause"
											FieldTextBoxTabIndex="237" DatabaseField="cb4Ause" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>IV B. Mean job quality</TD>
									<TD>
										<def:datafieldcontrol id="cb4Bmean" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb4Bmean"
											FieldTextBoxTabIndex="239" DatabaseField="cb4Bmean" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3"><B>SOCIAL</B></TD>
								</TR>
								<TR>
									<TD>III A. # organizations</TD>
									<TD>
										<def:datafieldcontrol id="cb3Anum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb3Anum"
											FieldTextBoxTabIndex="241" DatabaseField="cb3Anum" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cb3Ause" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb3Ause"
											FieldTextBoxTabIndex="240" DatabaseField="cb3Ause" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>III B. Mean participation<BR>
										in organizations</TD>
									<TD>
										<def:datafieldcontrol id="cb3Bmean" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb3Bmean"
											FieldTextBoxTabIndex="242" DatabaseField="cb3Bmean" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>V 1. # friends</TD>
									<TD>
										<def:datafieldcontrol id="cb51num" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb51num"
											FieldTextBoxTabIndex="243" DatabaseField="cb51num" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>V 2. Frequency of contact<BR>
										with friends</TD>
									<TD>
										<def:datafieldcontrol id="cb52num" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb52num"
											FieldTextBoxTabIndex="244" DatabaseField="cb52num" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>VI A. Behavior with others</TD>
									<TD>
										<def:datafieldcontrol id="cb6Amean" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb6Amean"
											FieldTextBoxTabIndex="245" DatabaseField="cb6Amean" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>VI B. Behavior alone</TD>
									<TD>
										<def:datafieldcontrol id="cb6Bnum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb6Bnum"
											FieldTextBoxTabIndex="246" DatabaseField="cb6Bnum" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3"><B>SCHOOL</B></TD>
								</TR>
								<TR>
									<TD>VII 1. Mean performance</TD>
									<TD>
										<def:datafieldcontrol id="cb71mean" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb71mean"
											FieldTextBoxTabIndex="248" DatabaseField="cb71mean" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cb71use" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb71use"
											FieldTextBoxTabIndex="247" DatabaseField="cb71use" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Special Classes</TD>
									<TD>
										<def:datafieldcontrol id="cb72num" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb72num"
											FieldTextBoxTabIndex="249" DatabaseField="cb72num" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>3. Repeated Grade</TD>
									<TD>
										<def:datafieldcontrol id="cb73num" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb73num"
											FieldTextBoxTabIndex="250" DatabaseField="cb73num" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>4. School problems</TD>
									<TD>
										<def:datafieldcontrol id="cb74num" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cb74num"
											FieldTextBoxTabIndex="251" DatabaseField="cb74num" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<BR>
							
<%--  							
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="4"><B>TOTAL COMPETENCE SCORE</B></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">Score<BR>
										(rounded to nearest .5)</TD>
									<TD class="heading">T</TD>
									<TD class="heading">Range</TD>
								</TR>
								<TR>
									<TD class="heading">Activities</TD>
									<TD>
										<def:datafieldcontrol id="cbActTot" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbActTot"
											FieldTextBoxTabIndex="252" DatabaseField="cbActTot" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbActT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbActT"
											FieldTextBoxTabIndex="253" DatabaseField="cbActT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbActR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbActR"
											FieldTextBoxTabIndex="254" DatabaseField="cbActR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Social</TD>
									<TD>
										<def:datafieldcontrol id="cbSocTot" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSocTot"
											FieldTextBoxTabIndex="255" DatabaseField="cbSocTot" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbSocT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSocT"
											FieldTextBoxTabIndex="256" DatabaseField="cbSocT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbSocR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSocR"
											FieldTextBoxTabIndex="257" DatabaseField="cbSocR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">School</TD>
									<TD>
										<def:datafieldcontrol id="cbSchTot" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSchTot"
											FieldTextBoxTabIndex="258" DatabaseField="cbSchTot" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbSchT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSchT"
											FieldTextBoxTabIndex="259" DatabaseField="cbSchT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbSchR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSchR"
											FieldTextBoxTabIndex="260" DatabaseField="cbSchR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>Total</B></TD>
									<TD>
										<def:datafieldcontrol id="cbTotC" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbTotC"
											FieldTextBoxTabIndex="261" DatabaseField="cbTotC" FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbTotCT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbTotCT"
											FieldTextBoxTabIndex="262" DatabaseField="cbTotCT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbTotCR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbTotCR"
											FieldTextBoxTabIndex="263" DatabaseField="cbTotCR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							
--%>

</table>

<br/>
<br/>

<table id="Table4"  runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">
<tr>
<td align="center" width = "85px"><b>Social Competence<br/>Scales</b></td>
<td align="center" width = "85px"><u>Activites</u></td>
<td align="center" width = "85px"><u>Social</u></td>
<td align="center" width = "85px"><u>School</u></td>
<td align="center" width = "85px"><u>Total Competence</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBacttot" DatabaseField="CBActtot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBsoctot" DatabaseField="CBSoctot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBschtot"   DatabaseField="CBSchtot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBtotC"   DatabaseField="CBTotC" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBactT" DatabaseField="CBActT" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBsocT" DatabaseField="CBSocT" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBschT"   DatabaseField="CBSchT" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBtotCT"   DatabaseField="CBTotCT" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBactPct" DatabaseField="CBActPct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBsocPct" DatabaseField="CBSocPct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBschPct"   DatabaseField="CBSchPct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBtotCPct"   DatabaseField="CBTotCPct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">Range</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBactR" DatabaseField="CBActR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBsocR" DatabaseField="CBSocR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBschR"   DatabaseField="CBSchR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBtotCR"   DatabaseField="CBTotCR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


</table>

<br/>							
							
<table id="Table1" runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">

<tr>
<td align="center" width = "85px"><b>Narrow Band<br/>Scales</b></td>
<td align="center" width = "85px"><u>1. Anxious / Depressed</u></td>
<td align="center" width = "85px"><u>2. Withdrawn / Depressed</u></td>
<td align="center" width = "85px"><u>3. Somatic Complaints</u></td>
<td align="center" width = "85px"><u>4. Social Problems</u></td>
<td align="center" width = "85px"><u>5. Thought Problems</u></td>
<td align="center" width = "85px"><u>6. Attention Problems</u></td>
<td align="center" width = "85px"><u>7. Rule-breaking Behavior</u></td>
<td align="center" width = "85px"><u>8. Aggressive Behavior</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs1tot" DatabaseField="CBs1tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs2tot" DatabaseField="CBs2tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs3tot" DatabaseField="CBs3tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs4tot" DatabaseField="CBs4tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs5tot" DatabaseField="CBs5tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs6tot" DatabaseField="CBs6tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs7tot" DatabaseField="CBs7tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs8tot" DatabaseField="CBs8tot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs1t" DatabaseField="CBs1t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs2t" DatabaseField="CBs2t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs3t" DatabaseField="CBs3t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs4t" DatabaseField="CBs4t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs5t" DatabaseField="CBs5t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs6t" DatabaseField="CBs6t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs7t" DatabaseField="CBs7t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs8t" DatabaseField="CBs8t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs1pct" DatabaseField="CBs1pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs2pct" DatabaseField="CBs2pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs3pct" DatabaseField="CBs3pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs4pct" DatabaseField="CBs4pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs5pct" DatabaseField="CBs5pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs6pct" DatabaseField="CBs6pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs7pct" DatabaseField="CBs7pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs8pct" DatabaseField="CBs8pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td align="center">Range</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs1R" DatabaseField="CBs1R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs2R" DatabaseField="CBs2R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs3R" DatabaseField="CBs3R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs4R" DatabaseField="CBs4R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs5R" DatabaseField="CBs5R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs6R" DatabaseField="CBs6R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs7R" DatabaseField="CBs7R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBs8R" DatabaseField="CBs8R" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


</table>

<br/>
<br/>

<table id="Table2"  runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">
<tr>
<td align="center" width = "85px"><b>Broad Band<br/>Scales</b></td>
<td align="center" width = "85px"><u>Internalizing Problems</u></td>
<td align="center" width = "85px"><u>Externalizing Problems</u></td>
<td align="center" width = "85px"><u>Total Behavior Problems</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBinttot" DatabaseField="CBinttot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBexttot" DatabaseField="CBexttot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBStot" DatabaseField="CBStot" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBintt" DatabaseField="CBintt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBextt" DatabaseField="CBextt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBSt" DatabaseField="CBSt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBintpct" DatabaseField="CBintpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBextpct" DatabaseField="CBextpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBSpct" DatabaseField="CBSpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">Range</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBintR" DatabaseField="CBintR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBextR" DatabaseField="CBextR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBSR" DatabaseField="CBSR" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


</table>

<br/>
<br/>


<table id="Table3" runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">

<tr>
<td align="center" width = "85px"><b>DSM-Oriented<br/>Scales</b></td>
<td align="center" width = "85px"><u>1. Affective problems</u></td>
<td align="center" width = "85px"><u>2. Anxiety problems</u></td>
<td align="center" width = "85px"><u>3. Somatic problems</u></td>
<td align="center" width = "85px"><u>4. ADHD problems</u></td>
<td align="center" width = "85px"><u>5. Oppositional Defiant problems</u></td>
<td align="center" width = "85px"><u>5. Conduct problems</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmafftot"  DatabaseField="CBdsmafftot"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmanxtot"  DatabaseField="CBdsmanxtot"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmsomtot"  DatabaseField="CBdsmsomtot"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmadhdtot" DatabaseField="CBdsmadhdtot"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmoddtot"  DatabaseField="CBdsmoddtot"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmcdtot"   DatabaseField="CBdsmcdtot"   IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmafft"  DatabaseField="CBdsmafft"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmanxt"  DatabaseField="CBdsmanxt"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmsomt"  DatabaseField="CBdsmsomt"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmadhdt" DatabaseField="CBdsmadhdt"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmoddt"  DatabaseField="CBdsmoddt"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmcdt"   DatabaseField="CBdsmcdt"   IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmaffpct"  DatabaseField="CBdsmaffpct"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmanxpct"  DatabaseField="CBdsmanxpct"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmsompct"  DatabaseField="CBdsmsompct"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmadhdpct" DatabaseField="CBdsmadhdpct"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmoddpct"  DatabaseField="CBdsmoddpct"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmcdpct"   DatabaseField="CBdsmcdpct"   IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td align="center">Range</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmaffr"  DatabaseField="CBdsmaffr"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmanxr"  DatabaseField="CBdsmanxr"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmsomr"  DatabaseField="CBdsmsomr"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmadhdr" DatabaseField="CBdsmadhdr"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmoddr"  DatabaseField="CBdsmoddr"  IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBdsmcdr"   DatabaseField="CBdsmcdr"   IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


</table>

							
							
							
		<%--  							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="4">SYNDROME SCALES</TD>
								</TR>
								<TR>
									<TD class="heading">Scale</TD>
									<TD class="heading">Score</TD>
									<TD class="heading">T</TD>
									<TD class="heading">Range</TD>
								</TR>
								<TR>
									<TD>I. Anxious/Depressed</TD>
									<TD>
										<def:datafieldcontrol id="cbS1Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS1Tot"
											FieldTextBoxTabIndex="264" DatabaseField="cbS1Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS1T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS1T"
											FieldTextBoxTabIndex="265" DatabaseField="cbS1T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS1R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS1R"
											FieldTextBoxTabIndex="266" DatabaseField="cbS1R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>II. Withdrawn/Depressed</TD>
									<TD>
										<def:datafieldcontrol id="cbS2Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS2Tot"
											FieldTextBoxTabIndex="267" DatabaseField="cbS2Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS2T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS2T"
											FieldTextBoxTabIndex="268" DatabaseField="cbS2T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS2R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS2R"
											FieldTextBoxTabIndex="269" DatabaseField="cbS2R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>III. Somatic Complaints</TD>
									<TD>
										<def:datafieldcontrol id="cbS3Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS3Tot"
											FieldTextBoxTabIndex="270" DatabaseField="cbS3Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS3T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS3T"
											FieldTextBoxTabIndex="271" DatabaseField="cbS3T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS3R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS3R"
											FieldTextBoxTabIndex="272" DatabaseField="cbS3R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>Internal (a)</B>
									</TD>
									<TD>
										<def:datafieldcontrol id="cbIntTot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbIntTot"
											FieldTextBoxTabIndex="289" DatabaseField="cbIntTot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbIntT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbIntT"
											FieldTextBoxTabIndex="290" DatabaseField="cbIntT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbIntR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbIntR"
											FieldTextBoxTabIndex="291" DatabaseField="cbIntR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>VII. Rule-Breaking Behavior</TD>
									<TD>
										<def:datafieldcontrol id="cbS7Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS7Tot"
											FieldTextBoxTabIndex="282" DatabaseField="cbS7Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS7T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS7T"
											FieldTextBoxTabIndex="283" DatabaseField="cbS7T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS7R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS7R"
											FieldTextBoxTabIndex="284" DatabaseField="cbS7R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>VIII. Aggressive Behavior</TD>
									<TD>
										<def:datafieldcontrol id="cbS8Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS8Tot"
											FieldTextBoxTabIndex="285" DatabaseField="cbS8Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS8T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS8T"
											FieldTextBoxTabIndex="286" DatabaseField="cbS8T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS8R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS8R"
											FieldTextBoxTabIndex="287" DatabaseField="cbS8R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD align="right"><B>External (b)</B></TD>
									<TD>
										<def:datafieldcontrol id="cbExtTot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbExtTot"
											FieldTextBoxTabIndex="292" DatabaseField="cbExtTot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbExtT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbExtT"
											FieldTextBoxTabIndex="293" DatabaseField="cbExtT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbExtR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbExtR"
											FieldTextBoxTabIndex="294" DatabaseField="cbExtR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>IV. Social Problems</TD>
									<TD>
										<def:datafieldcontrol id="cbS4Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS4Tot"
											FieldTextBoxTabIndex="273" DatabaseField="cbS4Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS4T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS4T"
											FieldTextBoxTabIndex="274" DatabaseField="cbS4T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS4R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS4R"
											FieldTextBoxTabIndex="275" DatabaseField="cbS4R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>V. Thought Problems</TD>
									<TD>
										<def:datafieldcontrol id="cbS5Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS5Tot"
											FieldTextBoxTabIndex="276" DatabaseField="cbS5Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS5T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS5T"
											FieldTextBoxTabIndex="277" DatabaseField="cbS5T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS5R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS5R"
											FieldTextBoxTabIndex="278" DatabaseField="cbS5R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>VI. Attention Problems</TD>
									<TD>
										<def:datafieldcontrol id="cbS6Tot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS6Tot"
											FieldTextBoxTabIndex="279" DatabaseField="cbS6Tot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS6T" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS6T"
											FieldTextBoxTabIndex="280" DatabaseField="cbS6T" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbS6R" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbS6R"
											FieldTextBoxTabIndex="281" DatabaseField="cbS6R" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Other Problems</TD>
									<TD>
										<def:datafieldcontrol id="cbSOTot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSOTot"
											FieldTextBoxTabIndex="288" DatabaseField="cbSOTot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="right"><B>(c)</B></TD>
									<TD>
										<def:datafieldcontrol id="cbSCTot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSCTot"
											FieldTextBoxTabIndex="295" DatabaseField="cbSCTot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="right"><B>TOTAL (a)+(b)+(c)</B></TD>
									<TD>
										<def:datafieldcontrol id="cbSTot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSTot"
											FieldTextBoxTabIndex="296" DatabaseField="cbSTot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbST" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbST"
											FieldTextBoxTabIndex="297" DatabaseField="cbST" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbSR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cbSR"
											FieldTextBoxTabIndex="298" DatabaseField="cbSR" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							
--%>					
							
							
							<def:datafieldcontrol id="scoremsg" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Status:"
								FieldTextBoxTabIndex="301" DatabaseField="scoremsg" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="cbsex" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sex:"
								FieldTextBoxTabIndex="299" DatabaseField="cbsex" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="cbageyr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (years):"
								FieldTextBoxTabIndex="300" DatabaseField="cbageyr" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
                                        <asp:Label ID="Label1" runat="server" Text="Grade: 0=Kindergarten, 1=1st etc., 99=Other/Grade level is NA, -9=missing" Font-Color="blue"></asp:Label>
										<def:datafieldcontrol id="cbgrade" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Grade in school: "
											FieldTextBoxTabIndex="5" DatabaseField="cbgrade" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbnosch" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=Not Attending School"
											FieldTextBoxTabIndex="6" DatabaseField="cbnosch" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											ValidList="1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbfawork" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Father's Work"
											FieldTextBoxTabIndex="7" DatabaseField="cbfawork" FieldLabelWidth="150px" FieldTextBoxWidth="200px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbmowork" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Mother's Work"
											FieldTextBoxTabIndex="8" DatabaseField="cbmowork" FieldLabelWidth="150px" FieldTextBoxWidth="200px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbgen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Your Gender (1=Male, 2=Female, 9=Missing)"
											FieldTextBoxTabIndex="9" DatabaseField="cbgen" FieldTextBoxWidth="30px" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1=Biological Parent<BR>
										2=Adoptive Parent<BR>
										3=Step Parent<BR>
										4=Foster Parent<BR>
										5=Grandparent<BR>
										6=Other (specify)<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbrelat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Relation to child"
											FieldTextBoxTabIndex="10" DatabaseField="cbrelat" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbrelot" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other:"
											FieldTextBoxTabIndex="11" DatabaseField="cbrelot" FieldLabelWidth="70px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">I. Sports</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprtn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=None"
											FieldTextBoxTabIndex="12" DatabaseField="cbsprtn" FieldLabelWidth="60px" FieldTextBoxWidth="30px"
											ValidList="1"></def:datafieldcontrol><BR>
										To skip an individual item add _skip_
									</TD>
									<TD>1=Less Than Average<BR>
										2=Average<BR>
										3=More Than Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
									<TD>1=Below Average<BR>
										2=Average<BR>
										3=Above Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprta" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="a."
											FieldTextBoxTabIndex="13" DatabaseField="cbsprta" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbsprtat"
											FieldTextBoxTabIndex="13" DatabaseField="cbsprtat" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtaw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbsprtaw"
											FieldTextBoxTabIndex="13" DatabaseField="cbsprtaw" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprtb" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="b."
											FieldTextBoxTabIndex="14" DatabaseField="cbsprtb" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtbt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbsprtbt"
											FieldTextBoxTabIndex="14" DatabaseField="cbsprtbt" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtbw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbsprtbw"
											FieldTextBoxTabIndex="14" DatabaseField="cbsprtbw" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprtc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="c."
											FieldTextBoxTabIndex="15" DatabaseField="cbsprtc" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbsprtct"
											FieldTextBoxTabIndex="15" DatabaseField="cbsprtct" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtcw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbsprtcw"
											FieldTextBoxTabIndex="15" DatabaseField="cbsprtcw" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">II. Hobbies</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhobn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=None"
											FieldTextBoxTabIndex="22" DatabaseField="cbhobn" FieldLabelWidth="60px" FieldTextBoxWidth="30px" ValidList="1"></def:datafieldcontrol><BR>
										To skip an individual item add _skip_
									</TD>
									<TD>1=Less Than Average<BR>
										2=Average<BR>
										3=More Than Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
									<TD>1=Below Average<BR>
										2=Average<BR>
										3=Above Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhoba" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="a."
											FieldTextBoxTabIndex="23" DatabaseField="cbhoba" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbhobat"
											FieldTextBoxTabIndex="23" DatabaseField="cbhobat" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobaw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbhobaw"
											FieldTextBoxTabIndex="23" DatabaseField="cbhobaw" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhobb" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="b."
											FieldTextBoxTabIndex="24" DatabaseField="cbhobb" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobbt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbhobbt"
											FieldTextBoxTabIndex="24" DatabaseField="cbhobbt" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobbw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbhobbw"
											FieldTextBoxTabIndex="24" DatabaseField="cbhobbw" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhobc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="c."
											FieldTextBoxTabIndex="25" DatabaseField="cbhobc" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbhobct"
											FieldTextBoxTabIndex="25" DatabaseField="cbhobct" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobcw" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbhobcw"
											FieldTextBoxTabIndex="25" DatabaseField="cbhobcw" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">III. Organizations</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborgn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=None"
											FieldTextBoxTabIndex="32" DatabaseField="cborgn" FieldLabelWidth="60px" FieldTextBoxWidth="30px" ValidList="1"></def:datafieldcontrol><BR>
										To skip an individual item add _skip_
									</TD>
									<TD width="141">1= Less Active<BR>
										2=Average<BR>
										3= More Active<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborga" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="a."
											FieldTextBoxTabIndex="33" DatabaseField="cborga" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD width="141">
										<def:datafieldcontrol id="cborgat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cborgat"
											FieldTextBoxTabIndex="33" DatabaseField="cborgat" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborgb" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="b."
											FieldTextBoxTabIndex="34" DatabaseField="cborgb" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD width="141">
										<def:datafieldcontrol id="cborgbt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cborgbt"
											FieldTextBoxTabIndex="34" DatabaseField="cborgbt" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborgc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="c."
											FieldTextBoxTabIndex="35" DatabaseField="cborgc" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD width="141">
										<def:datafieldcontrol id="cborgct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cborgct"
											FieldTextBoxTabIndex="35" DatabaseField="cborgct" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">IV. Jobs</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjobn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=None"
											FieldTextBoxTabIndex="39" DatabaseField="cbjobn" FieldLabelWidth="60px" FieldTextBoxWidth="30px" ValidList="1"></def:datafieldcontrol><BR>
										To skip an individual item add _skip_
									</TD>
									<TD>1=Below Average<BR>
										2=Average<BR>
										3=Above Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjoba" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="a."
											FieldTextBoxTabIndex="40" DatabaseField="cbjoba" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbjobat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbjobat"
											FieldTextBoxTabIndex="40" DatabaseField="cbjobat" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjobb" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="b."
											FieldTextBoxTabIndex="41" DatabaseField="cbjobb" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbjobbt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbjobbt"
											FieldTextBoxTabIndex="41" DatabaseField="cbjobbt" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjobc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="c."
											FieldTextBoxTabIndex="42" DatabaseField="cbjobc" FieldLabelWidth="20px"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbjobct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbjobct"
											FieldTextBoxTabIndex="42" DatabaseField="cbjobct" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">V.</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbfrnd" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. How many close friends?"
											FieldTextBoxTabIndex="46" DatabaseField="cbfrnd" FieldLabelWidth="300px" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>0=none<BR>
										1=1<BR>
										2=2 or 3<BR>
										3=4 or more<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbfrtim" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. How many times a week does your child do things with friends? "
											FieldTextBoxTabIndex="47" DatabaseField="cbfrtim" FieldLabelWidth="300px" FieldTextBoxWidth="30px"
											ValidList="0,2,3,9"></def:datafieldcontrol></TD>
									<TD>0 = Less Than 1<BR>
										2=1 or 2<BR>
										3 = 3 or more<BR>
										9=Missing</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VI. Compared to others how well does your child:<BR>
										1=Worse<BR>
										2=Average<BR>
										3=Better<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbnosib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=Has no brothers or sisters"
											FieldTextBoxTabIndex="48" DatabaseField="cbnosib" FieldTextBoxWidth="30px" ValidList="1,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbalsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="a. Get along with brothers and sisters"
											FieldTextBoxTabIndex="49" DatabaseField="cbalsib" FieldTextBoxWidth="30px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbalkids" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b. Get along with other kids?"
											FieldTextBoxTabIndex="50" DatabaseField="cbalkids" FieldTextBoxWidth="30px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbbehpar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="c. Behave with his/her parents?"
											FieldTextBoxTabIndex="51" DatabaseField="cbbehpar" FieldTextBoxWidth="30px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbplalon" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="d. Play and work alone?"
											FieldTextBoxTabIndex="52" DatabaseField="cbplalon" FieldTextBoxWidth="30px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VII. Performance in academic subjects.</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbnoschl" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=Does not attend school"
											FieldTextBoxTabIndex="53" DatabaseField="cbnoschl" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											ValidList="1,0,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbnoschlr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="because:"
											FieldTextBoxTabIndex="54" DatabaseField="cbnoschlr" FieldLabelWidth="60px" FieldTextBoxWidth="200px"
											FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Failing<BR>
										2=Below Average<BR>
										3=Average<BR>
										4=Above Average</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacada" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="a. Reading, English..."
											FieldTextBoxTabIndex="55" DatabaseField="cbacada" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadb" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b. History or Social Studies"
											FieldTextBoxTabIndex="56" DatabaseField="cbacadb" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="c. Arithmetic or Math"
											FieldTextBoxTabIndex="57" DatabaseField="cbacadc" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="d. Science" FieldTextBoxTabIndex="57" DatabaseField="cbacadd"
											FieldTextBoxWidth="30px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>To skip a user supplied subject add _skip_<BR>
										<def:datafieldcontrol id="cbacades" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="e. "
											FieldTextBoxTabIndex="58" DatabaseField="cbacades" FieldLabelWidth="20px"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbacade" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbacade"
											FieldTextBoxTabIndex="59" DatabaseField="cbacade" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadfs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="f. "
											FieldTextBoxTabIndex="60" DatabaseField="cbacadfs" FieldLabelWidth="20px"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbacadf" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbacadf"
											FieldTextBoxTabIndex="61" DatabaseField="cbacadf" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadgs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="g."
											FieldTextBoxTabIndex="62" DatabaseField="cbacadgs" FieldLabelWidth="20px"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbacadg" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="cbacadg"
											FieldTextBoxTabIndex="63" DatabaseField="cbacadg" FieldTextBoxWidth="30px" ShowFieldLabel="False"
											ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbspeced" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Does your child receive special education...? (1=yes, 2=no)"
											FieldTextBoxTabIndex="64" DatabaseField="cbspeced" FieldTextBoxWidth="30px" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbspeckd" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="If yes, describe:"
											FieldTextBoxTabIndex="65" DatabaseField="cbspeckd" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="255"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbrepgr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Has your child repeated any grades? (1=yes, 2=no)"
											FieldTextBoxTabIndex="66" DatabaseField="cbrepgr" FieldTextBoxWidth="30px" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbrepgrr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Grade and reasons:"
											FieldTextBoxTabIndex="67" DatabaseField="cbrepgrr" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="255"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacprb" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Has your child had any academic or other problems...? (1=yes, 2=no)"
											FieldTextBoxTabIndex="68" DatabaseField="cbacprb" FieldTextBoxWidth="30px" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacprbd" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Describe:"
											FieldTextBoxTabIndex="69" DatabaseField="cbacprbd" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="255"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacprst" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="When did these problems start?"
											FieldTextBoxTabIndex="70" DatabaseField="cbacprst"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacpre" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Have these problems ended? (1=yes, 2=no)"
											FieldTextBoxTabIndex="71" DatabaseField="cbacpre" FieldTextBoxWidth="30px" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacprew" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="If yes, when?"
											FieldTextBoxTabIndex="72" DatabaseField="cbacprew"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbill" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Does your child have any illness...? (1=yes, 2=no)"
											FieldTextBoxTabIndex="73" DatabaseField="cbill" FieldTextBoxWidth="30px" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbilldes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="If yes, describe:"
											FieldTextBoxTabIndex="74" DatabaseField="cbilldes" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="255"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbcncrn" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="What concerns you most about your child?"
											FieldTextBoxTabIndex="75" DatabaseField="cbcncrn" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbbest" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Please describe the best things about your child."
											FieldTextBoxTabIndex="76" DatabaseField="cbbest" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Not True<BR>
										1=Somewhat or Sometimes True<BR>
										2=Very True or Often True<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Acts too young for his/her age"
											FieldTextBoxTabIndex="78" DatabaseField="cb01" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Drinks alcohol without parents' approval"
											FieldTextBoxTabIndex="79" DatabaseField="cb02" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb02des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="80" DatabaseField="cb02des" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Argues a lot"
											FieldTextBoxTabIndex="81" DatabaseField="cb03" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Fails to finish things he/she starts"
											FieldTextBoxTabIndex="82" DatabaseField="cb04" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. There is very little he/she enjoys"
											FieldTextBoxTabIndex="83" DatabaseField="cb05" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Bowel movements outside toilet"
											FieldTextBoxTabIndex="84" DatabaseField="cb06" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Bragging, boasting"
											FieldTextBoxTabIndex="85" DatabaseField="cb07" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Can't concentrate, can't pay attention for long"
											FieldTextBoxTabIndex="86" DatabaseField="cb08" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Can't get his/her mind off certain thoughts; obsessions"
											FieldTextBoxTabIndex="87" DatabaseField="cb09" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb09des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="88" DatabaseField="cb09des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Can't sit still, restless, or hyperactive"
											FieldTextBoxTabIndex="89" DatabaseField="cb10" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Clings to adults or too dependent"
											FieldTextBoxTabIndex="90" DatabaseField="cb11" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Complains of loneliness"
											FieldTextBoxTabIndex="91" DatabaseField="cb12" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Confused or seems to be in a fog"
											FieldTextBoxTabIndex="92" DatabaseField="cb13" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Cries a lot"
											FieldTextBoxTabIndex="93" DatabaseField="cb14" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Cruel to animals"
											FieldTextBoxTabIndex="94" DatabaseField="cb15" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Cruelty, bullying, or meanness to others"
											FieldTextBoxTabIndex="95" DatabaseField="cb16" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Daydreams or gets lost in his/her thoughts"
											FieldTextBoxTabIndex="96" DatabaseField="cb17" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Deliberately harms self or attempts suicide"
											FieldTextBoxTabIndex="97" DatabaseField="cb18" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Demands a lot of attention"
											FieldTextBoxTabIndex="98" DatabaseField="cb19" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Destroys his/her own things"
											FieldTextBoxTabIndex="99" DatabaseField="cb20" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Destroys things belonging to his/her family or others"
											FieldTextBoxTabIndex="100" DatabaseField="cb21" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Disobedient at home"
											FieldTextBoxTabIndex="101" DatabaseField="cb22" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Disobedient at school"
											FieldTextBoxTabIndex="102" DatabaseField="cb23" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Doesn't eat well"
											FieldTextBoxTabIndex="103" DatabaseField="cb24" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Doesn't get along with other kids"
											FieldTextBoxTabIndex="104" DatabaseField="cb25" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Doesn't seem to feel guilty after misbehaving"
											FieldTextBoxTabIndex="105" DatabaseField="cb26" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Easily jealous"
											FieldTextBoxTabIndex="106" DatabaseField="cb27" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Breaks rules at home, school, or elsewhere"
											FieldTextBoxTabIndex="107" DatabaseField="cb28" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Fears certain animals, situations, or places, other than school "
											FieldTextBoxTabIndex="108" DatabaseField="cb29" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb29des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="109" DatabaseField="cb29des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb30" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Fears going to school"
											FieldTextBoxTabIndex="110" DatabaseField="cb30" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb31" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Fears he/she might think or do something bad"
											FieldTextBoxTabIndex="111" DatabaseField="cb31" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb32" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Feels he/she has to be perfect"
											FieldTextBoxTabIndex="112" DatabaseField="cb32" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb33" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Feels or complains that no one loves him/her"
											FieldTextBoxTabIndex="113" DatabaseField="cb33" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb34" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. Feels others are out to get him/her"
											FieldTextBoxTabIndex="114" DatabaseField="cb34" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb35" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Feels worthless or inferior"
											FieldTextBoxTabIndex="115" DatabaseField="cb35" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb36" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Gets hurt a lot, accident-prone"
											FieldTextBoxTabIndex="116" DatabaseField="cb36" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb37" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Gets in many fights"
											FieldTextBoxTabIndex="117" DatabaseField="cb37" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb38" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Gets teased a lot"
											FieldTextBoxTabIndex="118" DatabaseField="cb38" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb39" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Hangs around with others who get in trouble"
											FieldTextBoxTabIndex="119" DatabaseField="cb39" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb40" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Hears sounds or voices that aren't there"
											FieldTextBoxTabIndex="120" DatabaseField="cb40" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb40des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="121" DatabaseField="cb40des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb41" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText=" 41. Impulsive or acts without thinking"
											FieldTextBoxTabIndex="122" DatabaseField="cb41" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb42" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Would rather be alone than with others"
											FieldTextBoxTabIndex="123" DatabaseField="cb42" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb43" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Lying or cheating"
											FieldTextBoxTabIndex="124" DatabaseField="cb43" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb44" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Bites fingernails"
											FieldTextBoxTabIndex="125" DatabaseField="cb44" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb45" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Nervous, highstrung, or tense"
											FieldTextBoxTabIndex="126" DatabaseField="cb45" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb46" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Nervous movements or twitching"
											FieldTextBoxTabIndex="127" DatabaseField="cb46" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb46des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="128" DatabaseField="cb46des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb47" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Nightmares"
											FieldTextBoxTabIndex="129" DatabaseField="cb47" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb48" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Not liked by other kids"
											FieldTextBoxTabIndex="130" DatabaseField="cb48" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb49" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Constipated, doesn't move bowels"
											FieldTextBoxTabIndex="131" DatabaseField="cb49" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb50" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Too fearful or anxious"
											FieldTextBoxTabIndex="132" DatabaseField="cb50" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb51" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Feels dizzy or lightheaded"
											FieldTextBoxTabIndex="133" DatabaseField="cb51" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb52" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Feels too guilty"
											FieldTextBoxTabIndex="134" DatabaseField="cb52" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb53" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. Overeating"
											FieldTextBoxTabIndex="135" DatabaseField="cb53" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb54" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. Overtired without good reason"
											FieldTextBoxTabIndex="136" DatabaseField="cb54" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb55" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. Overweight"
											FieldTextBoxTabIndex="137" DatabaseField="cb55" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="a. Aches or pains (not stomach or headaches)"
											FieldTextBoxTabIndex="138" DatabaseField="cb56a" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="b. Headaches"
											FieldTextBoxTabIndex="139" DatabaseField="cb56b" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="c. Nausea, feels sick"
											FieldTextBoxTabIndex="140" DatabaseField="cb56c" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="d. Problems with eyes (not if corrected by glasses)"
											FieldTextBoxTabIndex="141" DatabaseField="cb56d" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56ddes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="142" DatabaseField="cb56ddes" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="e. Rashes or other skin problems"
											FieldTextBoxTabIndex="143" DatabaseField="cb56e" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="f. Rashes or other skin problems"
											FieldTextBoxTabIndex="144" DatabaseField="cb56f" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="g. Vomiting, throwing up"
											FieldTextBoxTabIndex="145" DatabaseField="cb56g" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="h. Other"
											FieldTextBoxTabIndex="146" DatabaseField="cb56h" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56hdes" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="147" DatabaseField="cb56hdes" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb57" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. Physically attacks people "
											FieldTextBoxTabIndex="148" DatabaseField="cb57" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb58" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. Picks nose, skin, or other parts of body "
											FieldTextBoxTabIndex="149" DatabaseField="cb58" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb58des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe): "
											FieldTextBoxTabIndex="150" DatabaseField="cb58des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb59" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="59. Plays with own sex parts in public "
											FieldTextBoxTabIndex="151" DatabaseField="cb59" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb60" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="60. Plays with own sex parts too much "
											FieldTextBoxTabIndex="152" DatabaseField="cb60" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb61" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="61. Poor school work "
											FieldTextBoxTabIndex="153" DatabaseField="cb61" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb62" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="62. Poorly coordinated or clumsy "
											FieldTextBoxTabIndex="154" DatabaseField="cb62" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb63" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="63. Prefers being with older kids "
											FieldTextBoxTabIndex="155" DatabaseField="cb63" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb64" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="64. Prefers being with younger kids "
											FieldTextBoxTabIndex="156" DatabaseField="cb64" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb65" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="65. Refuses to talk "
											FieldTextBoxTabIndex="157" DatabaseField="cb65" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb66" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="66. Repeats certain acts over and over; compulsions "
											FieldTextBoxTabIndex="158" DatabaseField="cb66" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb66des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe): "
											FieldTextBoxTabIndex="159" DatabaseField="cb66des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb67" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="67. Runs away from home "
											FieldTextBoxTabIndex="160" DatabaseField="cb67" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb68" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="68. Screams a lot "
											FieldTextBoxTabIndex="161" DatabaseField="cb68" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb69" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="69. Secretive, keeps things to self "
											FieldTextBoxTabIndex="162" DatabaseField="cb69" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb70" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="70. Sees things that aren't there (describe):-"
											FieldTextBoxTabIndex="163" DatabaseField="cb70" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb70des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="164" DatabaseField="cb70des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb71" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="71. Self-conscious or easily embarrassed "
											FieldTextBoxTabIndex="165" DatabaseField="cb71" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb72" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="72. Sets fires "
											FieldTextBoxTabIndex="166" DatabaseField="cb72" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb73" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="73. Sexual problems"
											FieldTextBoxTabIndex="167" DatabaseField="cb73" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb73des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="168" DatabaseField="cb73des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb74" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="74. Showing off or clowning "
											FieldTextBoxTabIndex="169" DatabaseField="cb74" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb75" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="75. Too shy or timid "
											FieldTextBoxTabIndex="170" DatabaseField="cb75" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb76" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="76. Sleeps less than most kids "
											FieldTextBoxTabIndex="171" DatabaseField="cb76" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb77" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="77. Sleeps more than most kids during day and/or night "
											FieldTextBoxTabIndex="172" DatabaseField="cb77" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb77des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe): "
											FieldTextBoxTabIndex="173" DatabaseField="cb77des"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb78" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="78. Inattentive or easily distracted "
											FieldTextBoxTabIndex="174" DatabaseField="cb78" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb79" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="79. Speech problem"
											FieldTextBoxTabIndex="175" DatabaseField="cb79" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb79des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText=" (describe):"
											FieldTextBoxTabIndex="176" DatabaseField="cb79des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb80" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="80. Stares blankly "
											FieldTextBoxTabIndex="177" DatabaseField="cb80" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb81" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="81. Steals at home "
											FieldTextBoxTabIndex="178" DatabaseField="cb81" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb82" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="82. Steals outside the home "
											FieldTextBoxTabIndex="179" DatabaseField="cb82" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb83" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="83. Stores up too many things he/she doesn't need"
											FieldTextBoxTabIndex="180" DatabaseField="cb83" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb83des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe): "
											FieldTextBoxTabIndex="181" DatabaseField="cb83des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb84" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="84. Strange behavior"
											FieldTextBoxTabIndex="182" DatabaseField="cb84" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb84des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText=" (describe):"
											FieldTextBoxTabIndex="183" DatabaseField="cb84des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb85" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="85. Strange ideas"
											FieldTextBoxTabIndex="184" DatabaseField="cb85" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb85des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="185" DatabaseField="cb85des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb86" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="86. Stubborn, sullen, or irritable"
											FieldTextBoxTabIndex="186" DatabaseField="cb86" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb87" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="87. Sudden changes in mood or feelings"
											FieldTextBoxTabIndex="187" DatabaseField="cb87" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb88" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="88. Sulks a lot"
											FieldTextBoxTabIndex="188" DatabaseField="cb88" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb89" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="89. Suspicious"
											FieldTextBoxTabIndex="189" DatabaseField="cb89" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb90" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="90. Swearing or obscene language"
											FieldTextBoxTabIndex="190" DatabaseField="cb90" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb91" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="91. Talks about killing self"
											FieldTextBoxTabIndex="191" DatabaseField="cb91" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb92" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="92. Talks or walks in sleep"
											FieldTextBoxTabIndex="192" DatabaseField="cb92" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb92des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="193" DatabaseField="cb92des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb93" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="93. Talks too much"
											FieldTextBoxTabIndex="194" DatabaseField="cb93" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb94" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="94. Teases a lot"
											FieldTextBoxTabIndex="195" DatabaseField="cb94" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb95" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="95. Temper tantrums or hot temper"
											FieldTextBoxTabIndex="196" DatabaseField="cb95" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb96" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="96. Thinks about sex too much"
											FieldTextBoxTabIndex="197" DatabaseField="cb96" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb97" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="97. Threatens people"
											FieldTextBoxTabIndex="198" DatabaseField="cb97" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb98" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="98. Thumb-sucking"
											FieldTextBoxTabIndex="199" DatabaseField="cb98" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb99" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="99. Smokes, chews, or sniffs tobacco"
											FieldTextBoxTabIndex="200" DatabaseField="cb99" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb100" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="100. Trouble sleeping"
											FieldTextBoxTabIndex="201" DatabaseField="cb100" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb100des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="202" DatabaseField="cb100des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="101. Truancy, skips school"
											FieldTextBoxTabIndex="203" DatabaseField="cb101" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="102. Underactive, slow moving, or lacks energy"
											FieldTextBoxTabIndex="204" DatabaseField="cb102" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="103. Unhappy, sad, or depressed"
											FieldTextBoxTabIndex="205" DatabaseField="cb103" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="104. Unusually loud"
											FieldTextBoxTabIndex="206" DatabaseField="cb104" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb105" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="105. Uses drugs for nonmedical purposes (don't include alcohol or tobacco)"
											FieldTextBoxTabIndex="207" DatabaseField="cb105" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb105des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(describe):"
											FieldTextBoxTabIndex="208" DatabaseField="cb105des" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb106" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="106. Vandalism"
											FieldTextBoxTabIndex="209" DatabaseField="cb106" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb107" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="107. Wets self during the day"
											FieldTextBoxTabIndex="210" DatabaseField="cb107" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb108" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="108. Wets the bed"
											FieldTextBoxTabIndex="211" DatabaseField="cb108" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb109" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="109. Whining"
											FieldTextBoxTabIndex="212" DatabaseField="cb109" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb110" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="110. Wishes to be of opposite sex"
											FieldTextBoxTabIndex="213" DatabaseField="cb110" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb111" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="111. Withdrawn, doesn't get involved with others"
											FieldTextBoxTabIndex="214" DatabaseField="cb111" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb112" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="112. Worries"
											FieldTextBoxTabIndex="215" DatabaseField="cb112" FieldTextBoxWidth="30px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Write in any problems not listed above:</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb113des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="113 a."
											FieldTextBoxTabIndex="216" DatabaseField="cb113des" FieldLabelWidth="40px"></def:datafieldcontrol>
										<def:datafieldcontrol id="cb113" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rating:"
											FieldTextBoxTabIndex="216" DatabaseField="cb113" FieldLabelWidth="40px" FieldTextBoxWidth="30px" ShowFieldLabel="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb114des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="113 b."
											FieldTextBoxTabIndex="218" DatabaseField="cb114des" FieldLabelWidth="40px"></def:datafieldcontrol>
										<def:datafieldcontrol id="cb114" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rating:"
											FieldTextBoxTabIndex="218" DatabaseField="cb114" FieldLabelWidth="40px" FieldTextBoxWidth="30px" ShowFieldLabel="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb115des" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="113 c."
											FieldTextBoxTabIndex="220" DatabaseField="cb115des" FieldLabelWidth="40px"></def:datafieldcontrol>
										<def:datafieldcontrol id="cb115" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rating:"
											FieldTextBoxTabIndex="220" DatabaseField="cb115" FieldLabelWidth="40px" FieldTextBoxWidth="30px" ShowFieldLabel="True"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="221" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="222" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="223" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="224" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="223" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="224" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel></asp:Content>
