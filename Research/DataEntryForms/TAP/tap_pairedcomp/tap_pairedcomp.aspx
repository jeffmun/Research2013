<%@ Page language="c#" Inherits="tap_pairedcomp.tap_pairedcomp" CodeFile="tap_pairedcomp.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_pairedcomp" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP Paired Comparison" PrimaryKeyField="pc_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="348" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###"
										FieldLabelWidth="100px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
      <TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="PCDATE" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" DatabaseField="PCDATE"
											FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PCCLIN" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" DatabaseField="PCCLIN"
											FieldTextBoxTabIndex="4" FieldLabelText="Experimenter" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" DESIGNTIMEDRAGDROP="17"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PCVER" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" DatabaseField="PCVER"
											FieldTextBoxTabIndex="4" FieldLabelText="Version" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD class="heading">0=incorrect, 1=correct,<BR>
										9=Missing/No Trial</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PC01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="PC01"
											FieldTextBoxTabIndex="5" FieldLabelText="1 (3min)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PC02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="PC02"
											FieldTextBoxTabIndex="6" FieldLabelText="2 (10sec)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PC03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="PC03"
											FieldTextBoxTabIndex="7" FieldLabelText="3 (3min)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PC04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="PC04"
											FieldTextBoxTabIndex="8" FieldLabelText="4 (10sec)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PC05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="PC05"
											FieldTextBoxTabIndex="9" FieldLabelText="5 (3min)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PC06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="PC06"
											FieldTextBoxTabIndex="10" FieldLabelText="6 (10sec)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9" DESIGNTIMEDRAGDROP="148"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>Use 
      -9 for missing values<BR>
      <TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading" width="124"># Correct (Novel)</TD>
									<TD class="heading"># Trials</TD>
									<TD class="heading">% Correct</TD>
								</TR>
								<TR>
									<TD class="heading">10 sec</TD>
									<TD width="124">
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCC10" FieldTextBoxTabIndex="10" FieldLabelText="PCC10" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,-9" DESIGNTIMEDRAGDROP="265" ShowFieldLabel="False"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCC10C" FieldTextBoxTabIndex="11" FieldLabelText="PCC10C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FormatString="({0:g})" DESIGNTIMEDRAGDROP="184" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCT10" FieldTextBoxTabIndex="11" FieldLabelText="PCT10" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,-9" DESIGNTIMEDRAGDROP="70" ShowFieldLabel="False"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCT10C" FieldTextBoxTabIndex="11" FieldLabelText="PCT10C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FormatString="({0:g})" DESIGNTIMEDRAGDROP="229" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCPCT10" FieldTextBoxTabIndex="11" FieldLabelText="PCPCT10" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" DESIGNTIMEDRAGDROP="424" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCPCT10C" FieldTextBoxTabIndex="11" FieldLabelText="PCPCT10C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="({0:f})" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">3 min</TD>
									<TD width="124">
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCC3" FieldTextBoxTabIndex="12" FieldLabelText="PCC3" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,-9" ShowFieldLabel="False"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCC3C" FieldTextBoxTabIndex="11" FieldLabelText="PCC3C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FormatString="({0:g})" DESIGNTIMEDRAGDROP="230" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCT3" FieldTextBoxTabIndex="13" FieldLabelText="PCT3" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,-9" DESIGNTIMEDRAGDROP="268" ShowFieldLabel="False"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCT3C" FieldTextBoxTabIndex="11" FieldLabelText="PCT3C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FormatString="({0:g})" DESIGNTIMEDRAGDROP="432" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCPCT3" FieldTextBoxTabIndex="11" FieldLabelText="PCPCT3" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" DESIGNTIMEDRAGDROP="434" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCPCT3C" FieldTextBoxTabIndex="11" FieldLabelText="PCPCT3C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FormatString="({0:f})" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
      <TABLE>
								<TR>
									<TD colSpan="2">
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px"
											DatabaseField="PCLEFT" FieldTextBoxTabIndex="14" FieldLabelText="# Choices to E's left" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,5,6,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px"
											DatabaseField="PCTOTT" FieldTextBoxTabIndex="15" FieldLabelText="# Total trials" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,4,5,6,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px"
											DatabaseField="PCTOTTC" FieldTextBoxTabIndex="11" FieldLabelText="PCT3C" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FormatString="({0:g})" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="125px"
								DatabaseField="PCSCRMSG" FieldTextBoxTabIndex="11" FieldLabelText="Scoring Notes:"
								IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" ShowFieldLabel="True" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
      <TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="PCVLD" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="50px" DatabaseField="PCVLD"
											FieldTextBoxTabIndex="17" FieldLabelText="Validity" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol>1=Valid 
										data, no problems<BR>
										2=Valid data, some probs (e.g., skipped item, etc.)<BR>
										3=Invalid data - do not use, serious problems<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="PCCMNT" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="PCCMNT"
											FieldTextBoxTabIndex="17" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="21"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="22"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="23"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="24"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="37"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="38"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
