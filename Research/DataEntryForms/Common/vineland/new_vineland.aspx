
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>
<%@ Page language="c#"   MasterPageFile="~/UWAC.master" Title="Vineland Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_vine" PrimaryKeyField="vine_pk">
</def:dataentrycontroller>

						<table class="layout">
							<tr>
								<td style="vertical-align:top">
									<table class="layout" id="table_insert">
										<tr>
											<td><def:datafieldcontrol id="ID" runat="server" DatabaseField="ID" FieldTextBoxTabIndex="1" FieldLabelText="ID"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
													IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="100px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="indexnum" FieldTextBoxTabIndex="1"
													FieldLabelText="Vineland Number" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="100px"
													FieldLabelWidth="80px" FieldTextBoxTextDefault="1"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VineDate" runat="server" DatabaseField="VineDate" FieldTextBoxTabIndex="2" FieldLabelText="Vineland date"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="True"
													IsInsertField="True" FieldDataType="DATE" FieldTextBoxWidth="100px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VineClin" runat="server" DatabaseField="VineClin" FieldTextBoxTabIndex="3" FieldLabelText="Interviewer"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="True"
													IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="100px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td><def:datafieldcontrol id="DOB" runat="server" DatabaseField="DOB" FieldTextBoxTabIndex="14" FieldLabelText="DOB:"
													IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="100px" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VinAgemo" runat="server" DatabaseField="VinAgemo" FieldTextBoxTabIndex="12"
													FieldLabelText="Age (months):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="100px"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="VinAgeym" runat="server" DatabaseField="VinAgeym" FieldTextBoxTabIndex="13"
													FieldLabelText="Age (y:m):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="NormTabl" runat="server" DatabaseField="NormTabl" FieldTextBoxTabIndex="85"
													FieldLabelText="Norms table used:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px"
													RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" runat="server">
							<BR>
							<def:datafieldcontrol id="AutNorms" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Include Autism Norms (1=yes, Missing or 0=no)" FieldTextBoxTabIndex="4"
								DatabaseField="AutNorms" ValidList="0,1,-1"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Compgrp" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Choose the appropriate aut. norms comparison group (0=mute, 1=verbal)"
								FieldTextBoxTabIndex="5" DatabaseField="Compgrp" ValidList="0,1"></def:datafieldcontrol>
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
													<def:datafieldcontrol id="Crecraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Crecraw" FieldTextBoxTabIndex="6" DatabaseField="Crecraw" RegEx="^([0-9]|1[0-9]|2[0-6]|999)$"
														RegExDescription="Must be 0-26 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Crecaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Crecaeym"
														FieldTextBoxTabIndex="54" DatabaseField="Crecaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">COM expressive:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Cexpraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Cexpraw" FieldTextBoxTabIndex="7" DatabaseField="Cexpraw" RegEx="^([0-9]|[1-5][0-9]|6[0-2]|999)$"
														RegExDescription="Must be 0-62 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Cexpaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Cexpaeym"
														FieldTextBoxTabIndex="55" DatabaseField="Cexpaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">COM written:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Cwriraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Cwriraw" FieldTextBoxTabIndex="8" DatabaseField="Cwriraw" RegEx="^([0-9]|[1-3][0-9]|4[0-6]|999)$"
														RegExDescription="Must be 0-46 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Cwriaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Cwriaeym"
														FieldTextBoxTabIndex="56" DatabaseField="Cwriaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading" height="28">COM DOMAIN sum:</TD>
												<TD width="77" height="28">
													<def:datafieldcontrol id="COMsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="COMsum"
														FieldTextBoxTabIndex="48" DatabaseField="COMsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="COMss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="COMss"
														FieldTextBoxTabIndex="37" DatabaseField="COMss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="COMpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="COMpr"
														FieldTextBoxTabIndex="78" DatabaseField="COMpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="COMaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="COMaeym"
														FieldTextBoxTabIndex="65" DatabaseField="COMaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD height="28">
													<def:datafieldcontrol id="AutCOMpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AutCOMpr"
														FieldTextBoxTabIndex="71" DatabaseField="AutCOMpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">DLS personal:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Dperraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Dperraw" FieldTextBoxTabIndex="9" DatabaseField="Dperraw" RegEx="^([0-9]|[1-6][0-9]|7[0-8]|999)$"
														RegExDescription="Must be 0-78 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Dperaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Dperaeym"
														FieldTextBoxTabIndex="57" DatabaseField="Dperaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">DLS domestic:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Ddomraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Ddomraw" FieldTextBoxTabIndex="10" DatabaseField="Ddomraw" RegEx="^([0-9]|[1-3][0-9]|4[0-2]|999)$"
														RegExDescription="Must be 0-42 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Ddomaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Ddomaeym"
														FieldTextBoxTabIndex="58" DatabaseField="Ddomaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">DLS community:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Dcomraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Dcomraw" FieldTextBoxTabIndex="11" DatabaseField="Dcomraw" RegEx="^([0-9]|[1-5][0-9]|6[0-4]|999)$"
														RegExDescription="Must be 0-64 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Dcomaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Dcomaeym"
														FieldTextBoxTabIndex="59" DatabaseField="Dcomaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">DLS DOMAIN sum:</TD>
												<TD width="77">
													<def:datafieldcontrol id="DLSsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DLSsum"
														FieldTextBoxTabIndex="49" DatabaseField="DLSsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="DLSss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DLSss"
														FieldTextBoxTabIndex="38" DatabaseField="DLSss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="DLSpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DLSpr"
														FieldTextBoxTabIndex="79" DatabaseField="DLSpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="DLSaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DLSaeym"
														FieldTextBoxTabIndex="66" DatabaseField="DLSaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AutDLSpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AutDLSpr"
														FieldTextBoxTabIndex="72" DatabaseField="AutDLSpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">SOC interper relat:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Sintrraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Sintrraw" FieldTextBoxTabIndex="12" DatabaseField="Sintrraw" RegEx="^([0-9]|[1-4][0-9]|5[0-6]|999)$"
														RegExDescription="Must be 0-56 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Sintaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sintaeym"
														FieldTextBoxTabIndex="60" DatabaseField="Sintaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">SOC play and leisure:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Splaraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Splaraw" FieldTextBoxTabIndex="13" DatabaseField="Splaraw" RegEx="^([0-9]|[1-3][0-9]|40|999)$"
														RegExDescription="Must be 0-40 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Splaaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Splaaeym"
														FieldTextBoxTabIndex="61" DatabaseField="Splaaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">SOC coping skillls:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Scopraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Scopraw" FieldTextBoxTabIndex="14" DatabaseField="Scopraw" RegEx="^([0-9]|[1-2][0-9]|3[0-6]|999)$"
														RegExDescription="Must be 0-36 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Scopaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scopaeym"
														FieldTextBoxTabIndex="62" DatabaseField="Scopaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">SOC DOMAIN sum:</TD>
												<TD width="77">
													<def:datafieldcontrol id="SOCsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="SOCsum"
														FieldTextBoxTabIndex="50" DatabaseField="SOCsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="SOCss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="SOCss"
														FieldTextBoxTabIndex="39" DatabaseField="SOCss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="SOCpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="SOCpr"
														FieldTextBoxTabIndex="80" DatabaseField="SOCpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="SOCaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="SOCaeym"
														FieldTextBoxTabIndex="67" DatabaseField="SOCaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AutSOCpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AutSOCpr"
														FieldTextBoxTabIndex="73" DatabaseField="AutSOCpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">MS gross:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Mgroraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Mgroraw" FieldTextBoxTabIndex="15" DatabaseField="Mgroraw" RegEx="^([0-9]|[1-3][0-9]|40|999)$"
														RegExDescription="Must be 0-40 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Mgroaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Mgroaeym"
														FieldTextBoxTabIndex="63" DatabaseField="Mgroaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">MS fine:</TD>
												<TD width="77">
													<def:datafieldcontrol id="Mfinraw" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="Mfinraw" FieldTextBoxTabIndex="16" DatabaseField="Mfinraw" RegEx="^([0-9]|[1-2][0-9]|3[0-2]|999)$"
														RegExDescription="Must be 0-32 or 999" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="Mfinaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Mfinaeym"
														FieldTextBoxTabIndex="64" DatabaseField="Mfinaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">MS DOMAIN sum:</TD>
												<TD width="77">
													<def:datafieldcontrol id="MSsum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="MSsum"
														FieldTextBoxTabIndex="51" DatabaseField="MSsum" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="MSss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="MSss"
														FieldTextBoxTabIndex="40" DatabaseField="MSss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="MSpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="MSpr"
														FieldTextBoxTabIndex="81" DatabaseField="MSpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="MSaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="MSaeym"
														FieldTextBoxTabIndex="68" DatabaseField="MSaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AutMSpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AutMSpr"
														FieldTextBoxTabIndex="74" DatabaseField="AutMSpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
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
													<def:datafieldcontrol id="ABCss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ABCss"
														FieldTextBoxTabIndex="41" DatabaseField="ABCss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Percentile Rank:</TD>
												<TD>
													<def:datafieldcontrol id="ABCpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ABCpr"
														FieldTextBoxTabIndex="82" DatabaseField="ABCpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Age Equivalent:</TD>
												<TD>
													<def:datafieldcontrol id="ABCaeym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ABCaeym"
														FieldTextBoxTabIndex="69" DatabaseField="ABCaeym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Percentile Rank (Autism norms):</TD>
												<TD>
													<def:datafieldcontrol id="AutABCpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AutABCpr"
														FieldTextBoxTabIndex="75" DatabaseField="AutABCpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Autism Norm Group:</TD>
												<TD>
													<def:datafieldcontrol id="AutGrp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AutGrp"
														FieldTextBoxTabIndex="76" DatabaseField="AutGrp" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										Validity (1=Valid, 2=Questionnable validity, 3=Invalid):<BR>
										<def:datafieldcontrol id="VineVld" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Validity (1=Valid, 2=Questionnable validity, 3=Invalid)" FieldTextBoxTabIndex="17"
											DatabaseField="VineVld" ValidList="1,2,3" ShowFieldLabel="False"></def:datafieldcontrol><BR>
										Comments:<BR>
										<def:datafieldcontrol id="VineCmnt" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="18" DatabaseField="VineCmnt"
											ShowFieldLabel="False" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ScoreMsg" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
								IsDoubleEntryField="False" FieldLabelText="Scoring Status:" FieldTextBoxTabIndex="87" DatabaseField="ScoreMsg"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table6">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="89" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="90" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="91" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="92" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scored" FieldTextBoxTabIndex="237" DatabaseField="scored"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scoredBy" FieldTextBoxTabIndex="238" DatabaseField="scoredBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
