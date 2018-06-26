<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_sopt.edst3_sopt" CodeFile="edst3_sopt.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_sopt" LookupField1="edsid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:" MeasureName="EDS T3 SOPT" PrimaryKeyField="so_pk"
							VerifiedField="verified" ShowScoreButton="True" LookupField1DataType="INT" StudyMeasID="188" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="EDSID"
										FieldTextBoxTabIndex="2" FieldLabelText="EDS ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="soclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="soclin"
										FieldTextBoxTabIndex="3" FieldLabelText="Experimenter" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="sodate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="sodate"
										FieldTextBoxTabIndex="4" FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=Yes, 0=No, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sotrcrit" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Training criteria met?"
											FieldTextBoxTabIndex="5" DatabaseField="sotrcrit" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Enter a 1 if set criteria met
										<BR>
										(leave blank otherwise)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sotrcrit1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Training Set 1"
											FieldTextBoxTabIndex="6" DatabaseField="sotrcrit1" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sotrcrit2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Training Set 2"
											FieldTextBoxTabIndex="7" DatabaseField="sotrcrit2" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sotrcrit3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Training Set 3"
											FieldTextBoxTabIndex="8" DatabaseField="sotrcrit3" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sotrcrit4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Training Set 4"
											FieldTextBoxTabIndex="9" DatabaseField="sotrcrit4" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											ValidList="1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1=Yes, 0=No, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="socrit" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4-Item criteria met?"
											FieldTextBoxTabIndex="10" DatabaseField="socrit" FieldTextBoxWidth="30px" ValidList="1,0,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="socritt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="(Total, if No)"
											FieldTextBoxTabIndex="10" DatabaseField="socritt" FieldTextBoxWidth="30px" ValidList="0,1,2,3"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD colSpan="4">Enter the grid position number corresponding to the selected 
										picture.<BR>
										Numbering starts at 1 and goes across. For example, the 6 picture<BR>
										grid is numbered like:
										<TABLE>
											<TR>
												<TD>1</TD>
												<TD>2</TD>
												<TD>3</TD>
											</TR>
											<TR>
												<TD>4</TD>
												<TD>5</TD>
												<TD>6</TD>
											</TR>
										</TABLE>
										<BR>
										(Use -99 for missing values. NOTE that scoring<BR>
										only works if ALL values are specified.)
									</TD>
								</TR>
								<TR>
									<TD>Grid<BR>
										Position</TD>
									<TD>Shape</TD>
									<TD>Correct?<BR>
										1=Yes<BR>
										0=No</TD>
									<TD>Perseverative Error?<BR>
										(Sequential errors<BR>
										with same shape)<BR>
										1=Yes<BR>
										0=No</TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">4 Item - Set 1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="12" DatabaseField="sog0101" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0101" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0101" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0101" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="13" DatabaseField="sog0102" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0102" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0102" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0102" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="14" DatabaseField="sog0103" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0103" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0103" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0103" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="15" DatabaseField="sog0104" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0104" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0104" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0104" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">4 Item - Set 2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0201" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="16" DatabaseField="sog0201" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0201" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0201" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0201" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0201" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0201" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0201" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0202" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="17" DatabaseField="sog0202" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0202" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0202" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0202" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0202" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0202" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0202" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0203" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="18" DatabaseField="sog0203" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0203" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0203" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0203" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0203" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0203" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0203" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0204" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="19" DatabaseField="sog0204" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0204" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0204" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0204" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0204" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0204" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0204" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>Grid<BR>
										Position</TD>
									<TD>Shape</TD>
									<TD>Correct?<BR>
										1=Yes<BR>
										0=No</TD>
									<TD>Perseverative Error?<BR>
										1=Yes<BR>
										0=No</TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">6 Item - Set 1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0301" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="20" DatabaseField="sog0301" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0301" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0301" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0301" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0301" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0301" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0301" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0302" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="21" DatabaseField="sog0302" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0302" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0302" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0302" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0302" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0302" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0302" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0303" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="22" DatabaseField="sog0303" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0303" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0303" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0303" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0303" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0303" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0303" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0304" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="23" DatabaseField="sog0304" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0304" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0304" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0304" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0304" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0304" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0304" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0305" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. "
											FieldTextBoxTabIndex="24" DatabaseField="sog0305" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0305" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0305" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0305" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0305" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0305" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0305" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0306" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. "
											FieldTextBoxTabIndex="25" DatabaseField="sog0306" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0306" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0306" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0306" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0306" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0306" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0306" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">6 Item - Set 2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0401" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="26" DatabaseField="sog0401" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0401" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0401" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0401" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0401" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0401" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0401" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0402" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="27" DatabaseField="sog0402" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0402" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0402" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0402" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0402" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0402" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0402" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0403" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="28" DatabaseField="sog0403" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0403" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0403" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0403" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0403" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0403" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0403" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0404" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="29" DatabaseField="sog0404" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0404" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0404" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0404" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0404" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0404" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0404" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0405" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. "
											FieldTextBoxTabIndex="30" DatabaseField="sog0405" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0405" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0405" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0405" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0405" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0405" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0405" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0406" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. "
											FieldTextBoxTabIndex="31" DatabaseField="sog0406" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,-99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0406" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0406" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0406" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0406" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0406" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0406" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>Grid<BR>
										Position</TD>
									<TD>Shape</TD>
									<TD>Correct?<BR>
										1=Yes<BR>
										0=No</TD>
									<TD>Perseverative Error?<BR>
										1=Yes<BR>
										0=No</TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">9 Item - Set 1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0501" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="32" DatabaseField="sog0501" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0501" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0501" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0501" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0501" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0501" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0501" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0502" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="33" DatabaseField="sog0502" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0502" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0502" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0502" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0502" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0502" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0502" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0503" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="34" DatabaseField="sog0503" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0503" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0503" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0503" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0503" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0503" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0503" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0504" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="35" DatabaseField="sog0504" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0504" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0504" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0504" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0504" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0504" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0504" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0505" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. "
											FieldTextBoxTabIndex="36" DatabaseField="sog0505" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0505" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0505" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0505" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0505" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0505" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0505" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0506" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. "
											FieldTextBoxTabIndex="37" DatabaseField="sog0506" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0506" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0506" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0506" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0506" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0506" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0506" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0507" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. "
											FieldTextBoxTabIndex="38" DatabaseField="sog0507" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0507" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0507" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0507" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0507" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0507" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0507" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0508" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. "
											FieldTextBoxTabIndex="39" DatabaseField="sog0508" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0508" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0508" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0508" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0508" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0508" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0508" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0509" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. "
											FieldTextBoxTabIndex="40" DatabaseField="sog0509" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0509" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0509" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0509" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0509" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0509" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0509" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">9 Item - Set 2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0601" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="41" DatabaseField="sog0601" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0601" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0601" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0601" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0601" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0601" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0601" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0602" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="42" DatabaseField="sog0602" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0602" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0602" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0602" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0602" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0602" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0602" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0603" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="43" DatabaseField="sog0603" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0603" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0603" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0603" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0603" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0603" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0603" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0604" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="44" DatabaseField="sog0604" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0604" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0604" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0604" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0604" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0604" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0604" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0605" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. "
											FieldTextBoxTabIndex="45" DatabaseField="sog0605" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0605" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0605" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0605" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0605" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0605" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0605" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0606" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. "
											FieldTextBoxTabIndex="46" DatabaseField="sog0606" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0606" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0606" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0606" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0606" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0606" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0606" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0607" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. "
											FieldTextBoxTabIndex="47" DatabaseField="sog0607" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0607" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0607" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0607" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0607" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0607" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0607" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0608" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. "
											FieldTextBoxTabIndex="48" DatabaseField="sog0608" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0608" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0608" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0608" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0608" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0608" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0608" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0609" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. "
											FieldTextBoxTabIndex="49" DatabaseField="sog0609" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 9 or -99" RegEx="^([1-9]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0609" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0609" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0609" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0609" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0609" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0609" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>Grid<BR>
										Position</TD>
									<TD>Shape</TD>
									<TD>Correct?<BR>
										1=Yes<BR>
										0=No</TD>
									<TD>Perseverative Error?<BR>
										1=Yes<BR>
										0=No</TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">12 Item - Set 1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0701" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="50" DatabaseField="sog0701" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0701" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0701" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0701" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0701" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0701" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0701" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0702" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="51" DatabaseField="sog0702" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0702" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0702" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0702" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0702" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0702" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0702" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0703" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="52" DatabaseField="sog0703" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0703" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0703" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0703" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0703" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0703" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0703" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0704" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="53" DatabaseField="sog0704" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0704" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0704" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0704" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0704" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0704" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0704" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0705" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. "
											FieldTextBoxTabIndex="54" DatabaseField="sog0705" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0705" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0705" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0705" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0705" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0705" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0705" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0706" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. "
											FieldTextBoxTabIndex="55" DatabaseField="sog0706" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0706" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0706" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0706" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0706" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0706" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0706" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0707" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. "
											FieldTextBoxTabIndex="56" DatabaseField="sog0707" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0707" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0707" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0707" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0707" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0707" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0707" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0708" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. "
											FieldTextBoxTabIndex="57" DatabaseField="sog0708" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0708" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0708" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0708" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0708" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0708" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0708" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0709" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. "
											FieldTextBoxTabIndex="58" DatabaseField="sog0709" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0709" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0709" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0709" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0709" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0709" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0709" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0710" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. "
											FieldTextBoxTabIndex="59" DatabaseField="sog0710" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0710" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0710" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0710" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0710" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0710" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0710" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0711" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. "
											FieldTextBoxTabIndex="60" DatabaseField="sog0711" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0711" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0711" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0711" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0711" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0711" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0711" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0712" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. "
											FieldTextBoxTabIndex="61" DatabaseField="sog0712" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0712" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0712" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0712" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0712" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0712" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0712" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="4">12 Item - Set 2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0801" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. "
											FieldTextBoxTabIndex="62" DatabaseField="sog0801" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0801" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0801" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0801" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0801" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0801" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0801" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0802" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. "
											FieldTextBoxTabIndex="63" DatabaseField="sog0802" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0802" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0802" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0802" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0802" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0802" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0802" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0803" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. "
											FieldTextBoxTabIndex="64" DatabaseField="sog0803" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0803" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0803" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0803" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0803" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0803" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0803" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0804" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. "
											FieldTextBoxTabIndex="65" DatabaseField="sog0804" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0804" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0804" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0804" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0804" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0804" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0804" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0805" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. "
											FieldTextBoxTabIndex="66" DatabaseField="sog0805" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0805" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0805" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0805" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0805" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0805" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0805" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0806" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. "
											FieldTextBoxTabIndex="67" DatabaseField="sog0806" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0806" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0806" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0806" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0806" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0806" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0806" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0807" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. "
											FieldTextBoxTabIndex="68" DatabaseField="sog0807" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0807" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0807" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0807" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0807" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0807" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0807" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0808" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. "
											FieldTextBoxTabIndex="69" DatabaseField="sog0808" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0808" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0808" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0808" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0808" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0808" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0808" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0809" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. "
											FieldTextBoxTabIndex="70" DatabaseField="sog0809" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0809" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0809" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0809" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0809" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0809" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0809" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0810" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. "
											FieldTextBoxTabIndex="71" DatabaseField="sog0810" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0810" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0810" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0810" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0810" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0810" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0810" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0811" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. "
											FieldTextBoxTabIndex="72" DatabaseField="sog0811" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0811" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0811" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0811" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0811" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0811" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0811" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sog0812" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. "
											FieldTextBoxTabIndex="73" DatabaseField="sog0812" FieldLabelWidth="40px" FieldTextBoxWidth="40px"
											RegExDescription="Value must be between 1 and 12 or -99" RegEx="^([1-9]|1[0-2]|-99)$"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sos0812" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sos0812" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="soc0812" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="soc0812" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sop0812" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="x"
											DatabaseField="sop0812" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading"></TD>
									<TD class="heading"># Correct</TD>
									<TD class="heading">Perseverative<BR>
										Errors</TD>
									<TD class="heading">Span
										<BR>
										(#correct before<BR>
										first error)</TD>
								</TR>
								<TR>
									<TD>4 Item Set 1</TD>
									<TD>
										<def:datafieldcontrol id="socr1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr1"
											FieldTextBoxTabIndex="260" DatabaseField="socr1" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sope1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope1"
											FieldTextBoxTabIndex="268" DatabaseField="sope1" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospan1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan1"
											FieldTextBoxTabIndex="276" DatabaseField="sospan1" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4 Item Set 2</TD>
									<TD>
										<def:datafieldcontrol id="socr2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr2"
											FieldTextBoxTabIndex="261" DatabaseField="socr2" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sope2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope2"
											FieldTextBoxTabIndex="269" DatabaseField="sope2" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospan2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan2"
											FieldTextBoxTabIndex="277" DatabaseField="sospan2" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>6 Item Set 1</TD>
									<TD>
										<def:datafieldcontrol id="socr3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr3"
											FieldTextBoxTabIndex="262" DatabaseField="socr3" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sope3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope3"
											FieldTextBoxTabIndex="270" DatabaseField="sope3" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospan3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan3"
											FieldTextBoxTabIndex="278" DatabaseField="sospan3" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="20">6 Item Set 2</TD>
									<TD height="20">
										<def:datafieldcontrol id="socr4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr4"
											FieldTextBoxTabIndex="263" DatabaseField="socr4" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD height="20">
										<def:datafieldcontrol id="sope4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope4"
											FieldTextBoxTabIndex="271" DatabaseField="sope4" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD height="20">
										<def:datafieldcontrol id="sospan4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan4"
											FieldTextBoxTabIndex="279" DatabaseField="sospan4" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="19">9 Item Set 1</TD>
									<TD height="19">
										<def:datafieldcontrol id="socr5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr5"
											FieldTextBoxTabIndex="264" DatabaseField="socr5" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD height="19">
										<def:datafieldcontrol id="sope5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope5"
											FieldTextBoxTabIndex="272" DatabaseField="sope5" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD height="19">
										<def:datafieldcontrol id="sospan5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan5"
											FieldTextBoxTabIndex="280" DatabaseField="sospan5" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>9 Item Set 2</TD>
									<TD>
										<def:datafieldcontrol id="socr6" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr6"
											FieldTextBoxTabIndex="265" DatabaseField="socr6" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sope6" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope6"
											FieldTextBoxTabIndex="273" DatabaseField="sope6" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospan6" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan6"
											FieldTextBoxTabIndex="281" DatabaseField="sospan6" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>12 Item Set 1</TD>
									<TD>
										<def:datafieldcontrol id="socr7" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr7"
											FieldTextBoxTabIndex="266" DatabaseField="socr7" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sope7" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope7"
											FieldTextBoxTabIndex="274" DatabaseField="sope7" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospan7" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan7"
											FieldTextBoxTabIndex="282" DatabaseField="sospan7" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>12 Item Set 2</TD>
									<TD>
										<def:datafieldcontrol id="socr8" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socr8"
											FieldTextBoxTabIndex="267" DatabaseField="socr8" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sope8" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sope8"
											FieldTextBoxTabIndex="275" DatabaseField="sope8" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospan8" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospan8"
											FieldTextBoxTabIndex="283" DatabaseField="sospan8" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Totals:</TD>
									<TD>
										<def:datafieldcontrol id="socrtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="socrtot"
											FieldTextBoxTabIndex="284" DatabaseField="socrtot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sopetot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sopetot"
											FieldTextBoxTabIndex="285" DatabaseField="sopetot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="sospntot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="sospntot"
											FieldTextBoxTabIndex="286" DatabaseField="sospntot" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="validity" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=Valid, 2=Questionnable, 3=Invalid)"
											FieldTextBoxTabIndex="286" DatabaseField="validity" FieldLabelWidth="100px" FieldTextBoxWidth="30px"
											ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="socmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Notes"
											FieldTextBoxTabIndex="287" DatabaseField="socmt" FieldLabelWidth="100px" FieldTextBoxWidth="200px"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="289" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="290" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="291" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="292" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
