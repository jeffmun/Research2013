<%@ Page language="c#" Inherits="face_WMSHousesDel.face_WMSHousesDel" CodeFile="face_WMSHousesDel.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="whd_pk"
							MeasureName="FACE WMS Houses Delayed" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False"
							LookupField1="faceid" DatabaseTable="face_wmshousesdel" LookupField1DataType="TEXT" ShowScoreButton="True"
							StudyMeasID="475" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td style="vertical-align:top">
									<table id="table_insert" class="layout">
										<tr>
											<td><def:datafieldcontrol id="faceid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FACE ID"
													FieldTextBoxTabIndex="2" DatabaseField="faceid" RegEx="^[F][A][C][E][0-9][0-9][0-9]$" RegExDescription="FACE ID must  look like FACE###"
													FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="wmsdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
													FieldTextBoxTabIndex="3" DatabaseField="whddate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="wmsclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Examiner"
													FieldTextBoxTabIndex="6" DatabaseField="whdclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="grid">
										<tr>
											<td><def:datafieldcontrol id="wmsdob" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DOB:"
													FieldTextBoxTabIndex="4" DatabaseField="whddob" FieldLabelWidth="60px" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="wmsageyr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (years):"
													FieldTextBoxTabIndex="5" DatabaseField="whdageyr" FieldLabelWidth="60px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3" height="21">Houses Delayed</TD>
								</TR>
								<TR>
									<TD colSpan="3">
										<def:datafieldcontrol id="wmsraw1" runat="server" FieldLabelWidth="100px" DatabaseField="whdraw" FieldTextBoxTabIndex="7"
											FieldLabelText="Raw Score:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="3">
										<def:datafieldcontrol id="wmsss1" runat="server" FieldLabelWidth="100px" DatabaseField="whdss" FieldTextBoxTabIndex="9"
											FieldLabelText="Scaled Score:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD class="heading">Seen</TD>
									<TD class="heading">Not Seen</TD>
								</TR>
								<TR>
									<TD class="heading">YES</TD>
									<TD>
										<def:datafieldcontrol id="wmsf1sy" runat="server" FieldLabelWidth="60px" DatabaseField="whdsy" FieldTextBoxTabIndex="11"
											FieldLabelText="wmsf1sy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsf1nsy" runat="server" FieldLabelWidth="60px" DatabaseField="whdnsy" FieldTextBoxTabIndex="13"
											FieldLabelText="wmsf1nsy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">NO</TD>
									<TD>
										<def:datafieldcontrol id="wmsf1sn" runat="server" FieldLabelWidth="60px" DatabaseField="whdsn" FieldTextBoxTabIndex="12"
											FieldLabelText="wmsf1sn" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsf1nsn" runat="server" FieldLabelWidth="60px" DatabaseField="whdnsn" FieldTextBoxTabIndex="14"
											FieldLabelText="wmsf1nsn" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Response Codes</TD>
								</TR>
								<TR>
									<TD>SY = Picture SEEN, Response was YES<BR>
										SN = Picture SEEN, Response was NO<BR>
										NSY = Picture NOT SEEN, Response was YES<BR>
										NSN = Picture NOT SEEN, Response was NO</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">Houses Delayed</TD>
								</TR>
								<TR>
									<TD class="heading">Item Score<BR>
										(0 or 1)</TD>
									<TD class="heading">Response<BR>
										Code</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd01"
											FieldTextBoxTabIndex="15" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr101" runat="server" DatabaseField="whdr01" FieldTextBoxTabIndex="111" FieldLabelText="wmsr101"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd02"
											FieldTextBoxTabIndex="16" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr102" runat="server" DatabaseField="whdr02" FieldTextBoxTabIndex="112" FieldLabelText="wmsr102"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd03"
											FieldTextBoxTabIndex="17" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr103" runat="server" DatabaseField="whdr03" FieldTextBoxTabIndex="113" FieldLabelText="wmsr103"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd04"
											FieldTextBoxTabIndex="18" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr104" runat="server" DatabaseField="whdr04" FieldTextBoxTabIndex="114" FieldLabelText="wmsr104"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd05"
											FieldTextBoxTabIndex="19" FieldLabelText="5." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr105" runat="server" DatabaseField="whdr05" FieldTextBoxTabIndex="115" FieldLabelText="wmsr105"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd06"
											FieldTextBoxTabIndex="20" FieldLabelText="6." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr106" runat="server" DatabaseField="whdr06" FieldTextBoxTabIndex="116" FieldLabelText="wmsr106"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd07"
											FieldTextBoxTabIndex="21" FieldLabelText="7." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr107" runat="server" DatabaseField="whdr07" FieldTextBoxTabIndex="117" FieldLabelText="wmsr107"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd08"
											FieldTextBoxTabIndex="22" FieldLabelText="8." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr108" runat="server" DatabaseField="whdr08" FieldTextBoxTabIndex="118" FieldLabelText="wmsr108"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd09"
											FieldTextBoxTabIndex="23" FieldLabelText="9." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr109" runat="server" DatabaseField="whdr09" FieldTextBoxTabIndex="119" FieldLabelText="wmsr109"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd10"
											FieldTextBoxTabIndex="24" FieldLabelText="10." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr110" runat="server" DatabaseField="whdr10" FieldTextBoxTabIndex="120" FieldLabelText="wmsr110"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd11"
											FieldTextBoxTabIndex="25" FieldLabelText="11." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr111" runat="server" DatabaseField="whdr11" FieldTextBoxTabIndex="121" FieldLabelText="wmsr111"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd12"
											FieldTextBoxTabIndex="26" FieldLabelText="12." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr112" runat="server" DatabaseField="whdr12" FieldTextBoxTabIndex="122" FieldLabelText="wmsr112"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd13"
											FieldTextBoxTabIndex="27" FieldLabelText="13." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr113" runat="server" DatabaseField="whdr13" FieldTextBoxTabIndex="123" FieldLabelText="wmsr113"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd14"
											FieldTextBoxTabIndex="28" FieldLabelText="14." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr114" runat="server" DatabaseField="whdr14" FieldTextBoxTabIndex="124" FieldLabelText="wmsr114"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd15"
											FieldTextBoxTabIndex="29" FieldLabelText="15." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr115" runat="server" DatabaseField="whdr15" FieldTextBoxTabIndex="125" FieldLabelText="wmsr115"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd16"
											FieldTextBoxTabIndex="30" FieldLabelText="16." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr116" runat="server" DatabaseField="whdr16" FieldTextBoxTabIndex="126" FieldLabelText="wmsr116"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd17"
											FieldTextBoxTabIndex="31" FieldLabelText="17." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr117" runat="server" DatabaseField="whdr17" FieldTextBoxTabIndex="127" FieldLabelText="wmsr117"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd18"
											FieldTextBoxTabIndex="32" FieldLabelText="18." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr118" runat="server" DatabaseField="whdr18" FieldTextBoxTabIndex="128" FieldLabelText="wmsr118"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd19"
											FieldTextBoxTabIndex="33" FieldLabelText="19." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr119" runat="server" DatabaseField="whdr19" FieldTextBoxTabIndex="129" FieldLabelText="wmsr119"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd20"
											FieldTextBoxTabIndex="34" FieldLabelText="20." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr120" runat="server" DatabaseField="whdr20" FieldTextBoxTabIndex="130" FieldLabelText="wmsr120"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd21"
											FieldTextBoxTabIndex="35" FieldLabelText="21." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr121" runat="server" DatabaseField="whdr21" FieldTextBoxTabIndex="131" FieldLabelText="wmsr121"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd22"
											FieldTextBoxTabIndex="36" FieldLabelText="22." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr122" runat="server" DatabaseField="whdr22" FieldTextBoxTabIndex="132" FieldLabelText="wmsr122"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd23"
											FieldTextBoxTabIndex="37" FieldLabelText="23." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr123" runat="server" DatabaseField="whdr23" FieldTextBoxTabIndex="133" FieldLabelText="wmsr123"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd24"
											FieldTextBoxTabIndex="38" FieldLabelText="24." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr124" runat="server" DatabaseField="whdr24" FieldTextBoxTabIndex="134" FieldLabelText="wmsr124"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd25"
											FieldTextBoxTabIndex="39" FieldLabelText="25." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr125" runat="server" DatabaseField="whdr25" FieldTextBoxTabIndex="135" FieldLabelText="wmsr125"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd26"
											FieldTextBoxTabIndex="40" FieldLabelText="26." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr126" runat="server" DatabaseField="whdr26" FieldTextBoxTabIndex="136" FieldLabelText="wmsr126"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd27"
											FieldTextBoxTabIndex="41" FieldLabelText="27." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr127" runat="server" DatabaseField="whdr27" FieldTextBoxTabIndex="137" FieldLabelText="wmsr127"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd28"
											FieldTextBoxTabIndex="42" FieldLabelText="28." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr128" runat="server" DatabaseField="whdr28" FieldTextBoxTabIndex="138" FieldLabelText="wmsr128"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf129" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd29"
											FieldTextBoxTabIndex="43" FieldLabelText="29." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr129" runat="server" DatabaseField="whdr29" FieldTextBoxTabIndex="139" FieldLabelText="wmsr129"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf130" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd30"
											FieldTextBoxTabIndex="44" FieldLabelText="30." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr130" runat="server" DatabaseField="whdr30" FieldTextBoxTabIndex="140" FieldLabelText="wmsr130"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd31"
											FieldTextBoxTabIndex="45" FieldLabelText="31." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr131" runat="server" DatabaseField="whdr31" FieldTextBoxTabIndex="141" FieldLabelText="wmsr131"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd32"
											FieldTextBoxTabIndex="46" FieldLabelText="32." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr132" runat="server" DatabaseField="whdr32" FieldTextBoxTabIndex="142" FieldLabelText="wmsr132"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd33"
											FieldTextBoxTabIndex="47" FieldLabelText="33." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr133" runat="server" DatabaseField="whdr33" FieldTextBoxTabIndex="143" FieldLabelText="wmsr133"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd34"
											FieldTextBoxTabIndex="48" FieldLabelText="34." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr134" runat="server" DatabaseField="whdr34" FieldTextBoxTabIndex="144" FieldLabelText="wmsr134"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf135" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd35"
											FieldTextBoxTabIndex="49" FieldLabelText="35." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr135" runat="server" DatabaseField="whdr35" FieldTextBoxTabIndex="145" FieldLabelText="wmsr135"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf136" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd36"
											FieldTextBoxTabIndex="50" FieldLabelText="36." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr136" runat="server" DatabaseField="whdr36" FieldTextBoxTabIndex="146" FieldLabelText="wmsr136"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf137" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd37"
											FieldTextBoxTabIndex="51" FieldLabelText="37." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr137" runat="server" DatabaseField="whdr37" FieldTextBoxTabIndex="147" FieldLabelText="wmsr137"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf138" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd38"
											FieldTextBoxTabIndex="52" FieldLabelText="38." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr138" runat="server" DatabaseField="whdr38" FieldTextBoxTabIndex="148" FieldLabelText="wmsr138"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf139" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd39"
											FieldTextBoxTabIndex="53" FieldLabelText="39." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr139" runat="server" DatabaseField="whdr39" FieldTextBoxTabIndex="149" FieldLabelText="wmsr139"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf140" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd40"
											FieldTextBoxTabIndex="54" FieldLabelText="40." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr140" runat="server" DatabaseField="whdr40" FieldTextBoxTabIndex="150" FieldLabelText="wmsr140"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf141" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd41"
											FieldTextBoxTabIndex="55" FieldLabelText="41." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr141" runat="server" DatabaseField="whdr41" FieldTextBoxTabIndex="151" FieldLabelText="wmsr141"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf142" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd42"
											FieldTextBoxTabIndex="56" FieldLabelText="42." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr142" runat="server" DatabaseField="whdr42" FieldTextBoxTabIndex="152" FieldLabelText="wmsr142"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf143" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd43"
											FieldTextBoxTabIndex="57" FieldLabelText="43." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr143" runat="server" DatabaseField="whdr43" FieldTextBoxTabIndex="153" FieldLabelText="wmsr143"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf144" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd44"
											FieldTextBoxTabIndex="58" FieldLabelText="44." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr144" runat="server" DatabaseField="whdr44" FieldTextBoxTabIndex="154" FieldLabelText="wmsr144"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf145" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd45"
											FieldTextBoxTabIndex="59" FieldLabelText="45." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr145" runat="server" DatabaseField="whdr45" FieldTextBoxTabIndex="155" FieldLabelText="wmsr145"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf146" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd46"
											FieldTextBoxTabIndex="60" FieldLabelText="46." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr146" runat="server" DatabaseField="whdr46" FieldTextBoxTabIndex="156" FieldLabelText="wmsr146"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf147" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd47"
											FieldTextBoxTabIndex="61" FieldLabelText="47." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr147" runat="server" DatabaseField="whdr47" FieldTextBoxTabIndex="157" FieldLabelText="wmsr147"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsf148" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="whd48"
											FieldTextBoxTabIndex="62" FieldLabelText="48." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsr148" runat="server" DatabaseField="whdr48" FieldTextBoxTabIndex="158" FieldLabelText="wmsr148"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsvld" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="whdvld"
											FieldTextBoxTabIndex="207" FieldLabelText="Validity (1=valid, 2=Questionable, 3=Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmscmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="whdcmnt"
											FieldTextBoxTabIndex="208" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="210"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="211"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="212"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="213"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
