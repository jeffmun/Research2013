
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="eds_vine.eds_vine" CodeFile="eds_vine.aspx.cs"  MasterPageFile="~/UWAC.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1="id" VerifiedField="verified"
							PrimaryKeyField="IDkey" MeasureName="EDS Vineland" LookupTextBox2Visible="True" LookupTextBox1LabelText="EDS ID:"
							DatabaseTable="eds_vine" LookupField1DataType="INT" ShowScoreButton="True" LookupTextBox2LabelText="Indexnum:"
							LookupField2="indexnum" StudyMeasID="104" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="grid">
						<tr><td class="heading">
						Click <a href="/reports/ViewReport.aspx?ReportID=1da50661-5992-4a8e-9d31-94e4d7805ead" target="_blank">here</a> to find the next available Indexnum. Enter the subject ID (don't select a Timepoint) and click 'Submit'.  
						Always use an indexnum that is one greater than the current highest value or 1 if none exist.
						</td></tr>
						</table>
						
						<table class="layout">
							<tr>
								<td style="vertical-align:top">
									<table class="layout" id="table_insert">
										<tr>
											<td><def:datafieldcontrol id="ID" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="100px" FieldDataType="INT"
													IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
													IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID" FieldTextBoxTabIndex="1" DatabaseField="ID"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="100px"
													FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
													IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Indexnum" FieldTextBoxTabIndex="1" DatabaseField="indexnum"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="100px"
													FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
													IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Time Point (T3-full or FollowUp)" FieldTextBoxTabIndex="1"
													DatabaseField="timepoint" ValidList="FollowUp,T1,T1.5,T2,T3-full" FieldTextBoxTextDefault="FollowUp"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VineDate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="100px" FieldDataType="DATE"
													IsInsertField="True" IsInsertValueRequired="True" IsEntryField="True" IsEntryValueRequired="False"
													IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Vineland date" FieldTextBoxTabIndex="2"
													DatabaseField="VineDate" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VineClin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="100px" FieldDataType="TEXT"
													IsInsertField="True" IsInsertValueRequired="True" IsEntryField="True" IsEntryValueRequired="False"
													IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interviewer" FieldTextBoxTabIndex="3"
													DatabaseField="VineClin"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table>
										<tr>
											<td><def:datafieldcontrol id="DOB" runat="server" FieldLabelWidth="100px" FieldDataType="DATE" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="DOB:" FieldTextBoxTabIndex="14" DatabaseField="DOB" FormatString="{0:d}"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VinAgemo" runat="server" FieldLabelWidth="100px" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="Age (months):" FieldTextBoxTabIndex="12" DatabaseField="VinAgemo"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VinAgeym" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="Age (y:m):" FieldTextBoxTabIndex="13" DatabaseField="VinAgeym"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="NormTabl" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
													IsDoubleEntryField="False" FieldLabelText="Norms table used:" FieldTextBoxTabIndex="85" DatabaseField="NormTabl"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" runat="server">
							<BR>
							<def:datafieldcontrol id="AutNorms" runat="server" DatabaseField="AutNorms" FieldTextBoxTabIndex="4" FieldLabelText="Include Autism Norms (1=yes, Missing or 0=no)"
								IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="0,1,-1"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Compgrp" runat="server" DatabaseField="Compgrp" FieldTextBoxTabIndex="5" FieldLabelText="Choose the appropriate aut. norms comparison group (0=mute, 1=verbal)"
								IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ValidList="0,1"></def:datafieldcontrol>
							<TABLE class="layout">
								<TR>
									<TD>
										<TABLE class="grid" id="Table1" height="529">
											<TR>
												<TD>use 999 for missing</TD>
												<TD class="heading" width="77">Raw score
												</TD>
												<TD class="heading">Std score</TD>
												<TD class="heading">%ile rank</TD>
												<TD class="heading">Age Equiv.</TD>
												<TD class="heading">%ile Rank (Autism norms)</TD>
											</TR>
											<TR>
												<TD class="heading">COM receptive:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Crecraw" runat="server" DatabaseField="Crecraw" FieldTextBoxTabIndex="6" FieldLabelText="Crecraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|1[0-9]|2[0-6]|999)$"
														RegExDescription="Must be 0-26 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Crecaeym" runat="server" DatabaseField="Crecaeym" FieldTextBoxTabIndex="54"
														FieldLabelText="Crecaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">COM expressive:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Cexpraw" runat="server" DatabaseField="Cexpraw" FieldTextBoxTabIndex="7" FieldLabelText="Cexpraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-5][0-9]|6[0-2]|999)$"
														RegExDescription="Must be 0-62 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Cexpaeym" runat="server" DatabaseField="Cexpaeym" FieldTextBoxTabIndex="55"
														FieldLabelText="Cexpaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">COM written:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Cwriraw" runat="server" DatabaseField="Cwriraw" FieldTextBoxTabIndex="8" FieldLabelText="Cwriraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|4[0-6]|999)$"
														RegExDescription="Must be 0-46 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Cwriaeym" runat="server" DatabaseField="Cwriaeym" FieldTextBoxTabIndex="56"
														FieldLabelText="Cwriaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading" height="28">COM DOMAIN sum:</TD>
												<TD width="77" height="28">
													<def:datafieldcontrol id="COMsum" runat="server" DatabaseField="COMsum" FieldTextBoxTabIndex="48" FieldLabelText="COMsum"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="COMss" runat="server" DatabaseField="COMss" FieldTextBoxTabIndex="37" FieldLabelText="COMss"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="COMpr" runat="server" DatabaseField="COMpr" FieldTextBoxTabIndex="78" FieldLabelText="COMpr"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="COMaeym" runat="server" DatabaseField="COMaeym" FieldTextBoxTabIndex="65" FieldLabelText="COMaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="AutCOMpr" runat="server" DatabaseField="AutCOMpr" FieldTextBoxTabIndex="71"
														FieldLabelText="AutCOMpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">DLS personal:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Dperraw" runat="server" DatabaseField="Dperraw" FieldTextBoxTabIndex="9" FieldLabelText="Dperraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-6][0-9]|7[0-8]|999)$"
														RegExDescription="Must be 0-78 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Dperaeym" runat="server" DatabaseField="Dperaeym" FieldTextBoxTabIndex="57"
														FieldLabelText="Dperaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">DLS domestic:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Ddomraw" runat="server" DatabaseField="Ddomraw" FieldTextBoxTabIndex="10" FieldLabelText="Ddomraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|4[0-2]|999)$"
														RegExDescription="Must be 0-42 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Ddomaeym" runat="server" DatabaseField="Ddomaeym" FieldTextBoxTabIndex="58"
														FieldLabelText="Ddomaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">DLS community:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Dcomraw" runat="server" DatabaseField="Dcomraw" FieldTextBoxTabIndex="11" FieldLabelText="Dcomraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-5][0-9]|6[0-4]|999)$"
														RegExDescription="Must be 0-64 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Dcomaeym" runat="server" DatabaseField="Dcomaeym" FieldTextBoxTabIndex="59"
														FieldLabelText="Dcomaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">DLS DOMAIN sum:</TD>
												<TD width="77">
													<def:datafieldcontrol id="DLSsum" runat="server" DatabaseField="DLSsum" FieldTextBoxTabIndex="49" FieldLabelText="DLSsum"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="DLSss" runat="server" DatabaseField="DLSss" FieldTextBoxTabIndex="38" FieldLabelText="DLSss"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="DLSpr" runat="server" DatabaseField="DLSpr" FieldTextBoxTabIndex="79" FieldLabelText="DLSpr"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="DLSaeym" runat="server" DatabaseField="DLSaeym" FieldTextBoxTabIndex="66" FieldLabelText="DLSaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AutDLSpr" runat="server" DatabaseField="AutDLSpr" FieldTextBoxTabIndex="72"
														FieldLabelText="AutDLSpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">SOC interper relat:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Sintrraw" runat="server" DatabaseField="Sintrraw" FieldTextBoxTabIndex="12"
														FieldLabelText="Sintrraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
														RegEx="^([0-9]|[1-4][0-9]|5[0-6]|999)$" RegExDescription="Must be 0-56 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Sintaeym" runat="server" DatabaseField="Sintaeym" FieldTextBoxTabIndex="60"
														FieldLabelText="Sintaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">SOC play and leisure:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Splaraw" runat="server" DatabaseField="Splaraw" FieldTextBoxTabIndex="13" FieldLabelText="Splaraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|999)$"
														RegExDescription="Must be 0-40 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Splaaeym" runat="server" DatabaseField="Splaaeym" FieldTextBoxTabIndex="61"
														FieldLabelText="Splaaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">SOC coping skillls:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Scopraw" runat="server" DatabaseField="Scopraw" FieldTextBoxTabIndex="14" FieldLabelText="Scopraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-2][0-9]|3[0-6]|999)$"
														RegExDescription="Must be 0-36 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Scopaeym" runat="server" DatabaseField="Scopaeym" FieldTextBoxTabIndex="62"
														FieldLabelText="Scopaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">SOC DOMAIN sum:</TD>
												<TD width="77">
													<def:datafieldcontrol id="SOCsum" runat="server" DatabaseField="SOCsum" FieldTextBoxTabIndex="50" FieldLabelText="SOCsum"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="SOCss" runat="server" DatabaseField="SOCss" FieldTextBoxTabIndex="39" FieldLabelText="SOCss"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="SOCpr" runat="server" DatabaseField="SOCpr" FieldTextBoxTabIndex="80" FieldLabelText="SOCpr"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="SOCaeym" runat="server" DatabaseField="SOCaeym" FieldTextBoxTabIndex="67" FieldLabelText="SOCaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AutSOCpr" runat="server" DatabaseField="AutSOCpr" FieldTextBoxTabIndex="73"
														FieldLabelText="AutSOCpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">MS gross:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Mgroraw" runat="server" DatabaseField="Mgroraw" FieldTextBoxTabIndex="15" FieldLabelText="Mgroraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|999)$"
														RegExDescription="Must be 0-40 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Mgroaeym" runat="server" DatabaseField="Mgroaeym" FieldTextBoxTabIndex="63"
														FieldLabelText="Mgroaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">MS fine:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Mfinraw" runat="server" DatabaseField="Mfinraw" FieldTextBoxTabIndex="16" FieldLabelText="Mfinraw"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-2][0-9]|3[0-2]|999)$"
														RegExDescription="Must be 0-32 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Mfinaeym" runat="server" DatabaseField="Mfinaeym" FieldTextBoxTabIndex="64"
														FieldLabelText="Mfinaeym" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">MS DOMAIN sum:</TD>
												<TD width="77">
													<def:datafieldcontrol id="MSsum" runat="server" DatabaseField="MSsum" FieldTextBoxTabIndex="51" FieldLabelText="MSsum"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="MSss" runat="server" DatabaseField="MSss" FieldTextBoxTabIndex="40" FieldLabelText="MSss"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="MSpr" runat="server" DatabaseField="MSpr" FieldTextBoxTabIndex="81" FieldLabelText="MSpr"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="MSaeym" runat="server" DatabaseField="MSaeym" FieldTextBoxTabIndex="68" FieldLabelText="MSaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AutMSpr" runat="server" DatabaseField="AutMSpr" FieldTextBoxTabIndex="74" FieldLabelText="AutMSpr"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid" id="Table2">
											<TR>
												<TD colSpan="2">Adaptive Behavior Composite</TD>
											</TR>
											<TR>
												<TD class="heading">Standard Score:</TD>
												<TD>
													<def:datafieldcontrol id="ABCss" runat="server" DatabaseField="ABCss" FieldTextBoxTabIndex="41" FieldLabelText="ABCss"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Percentile Rank:</TD>
												<TD>
													<def:datafieldcontrol id="ABCpr" runat="server" DatabaseField="ABCpr" FieldTextBoxTabIndex="82" FieldLabelText="ABCpr"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Age Equivalent:</TD>
												<TD>
													<def:datafieldcontrol id="ABCaeym" runat="server" DatabaseField="ABCaeym" FieldTextBoxTabIndex="69" FieldLabelText="ABCaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Percentile Rank (Autism norms):</TD>
												<TD>
													<def:datafieldcontrol id="AutABCpr" runat="server" DatabaseField="AutABCpr" FieldTextBoxTabIndex="75"
														FieldLabelText="AutABCpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Autism Norm Group:</TD>
												<TD>
													<def:datafieldcontrol id="AutGrp" runat="server" DatabaseField="AutGrp" FieldTextBoxTabIndex="76" FieldLabelText="AutGrp"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										Validity (1=Valid, 2=Questionnable validity, 3=Invalid):<BR>
										<def:datafieldcontrol id="VineVld" runat="server" DatabaseField="VineVld" FieldTextBoxTabIndex="17" FieldLabelText="Validity (1=Valid, 2=Questionnable validity, 3=Invalid)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol><BR>
										Comments:<BR>
										<def:datafieldcontrol id="VineCmnt" runat="server" DatabaseField="VineCmnt" FieldTextBoxTabIndex="18"
											FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="200px"
											ShowFieldLabel="False" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ScoreMsg" runat="server" DatabaseField="ScoreMsg" FieldTextBoxTabIndex="87"
								FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table6">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="89" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="90"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="91" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="92"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
