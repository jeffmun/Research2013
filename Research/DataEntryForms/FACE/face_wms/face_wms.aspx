
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="face_wms.face_wms" CodeFile="face_wms.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="wms_pk"
							MeasureName="FACE WMS Faces" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False" LookupField1="faceid"
							DatabaseTable="face_wms" LookupField1DataType="TEXT" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
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
													FieldTextBoxTabIndex="3" DatabaseField="wmsdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="wmsclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Examiner"
													FieldTextBoxTabIndex="6" DatabaseField="wmsclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="grid">
										<tr>
											<td><def:datafieldcontrol id="wmsdob" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="DOB:"
													FieldTextBoxTabIndex="4" DatabaseField="wmsdob" FieldLabelWidth="60px" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="wmsageyr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (years):"
													FieldTextBoxTabIndex="5" DatabaseField="wmsageyr" FieldLabelWidth="60px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<br/>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading" colSpan="3">Faces I</TD>
											</TR>
											<TR>
												<TD colSpan="3">
													<def:datafieldcontrol id="wmsraw1" runat="server" FieldLabelWidth="100px" DatabaseField="wmsraw1" FieldTextBoxTabIndex="7"
														FieldLabelText="Faces I Raw:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD colSpan="3">
													<def:datafieldcontrol id="wmsss1" runat="server" FieldLabelWidth="100px" DatabaseField="wmsss1" FieldTextBoxTabIndex="9"
														FieldLabelText="Faces I Scaled Score:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
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
													<def:datafieldcontrol id="wmsf1sy" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf1sy" FieldTextBoxTabIndex="11"
														FieldLabelText="wmsf1sy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsf1nsy" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf1nsy" FieldTextBoxTabIndex="13"
														FieldLabelText="wmsf1nsy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">NO</TD>
												<TD>
													<def:datafieldcontrol id="wmsf1sn" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf1sn" FieldTextBoxTabIndex="12"
														FieldLabelText="wmsf1sn" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsf1nsn" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf1nsn" FieldTextBoxTabIndex="14"
														FieldLabelText="wmsf1nsn" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading" colSpan="3">Faces II</TD>
											</TR>
											<TR>
												<TD colSpan="3">
													<def:datafieldcontrol id="wmsraw2" runat="server" FieldLabelWidth="100px" DatabaseField="wmsraw2" FieldTextBoxTabIndex="8"
														FieldLabelText="Faces II Raw:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD colSpan="3">
													<def:datafieldcontrol id="wmsss2" runat="server" FieldLabelWidth="100px" DatabaseField="wmsss2" FieldTextBoxTabIndex="10"
														FieldLabelText="Faces II Scaled Score:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
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
													<def:datafieldcontrol id="wmsf2sy" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf2sy" FieldTextBoxTabIndex="11"
														FieldLabelText="wmsf2sy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsf2nsy" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf2nsy" FieldTextBoxTabIndex="13"
														FieldLabelText="wmsf2nsy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">NO</TD>
												<TD>
													<def:datafieldcontrol id="wmsf2sn" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf2sn" FieldTextBoxTabIndex="12"
														FieldLabelText="wmsf2sn" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsf2nsn" runat="server" FieldLabelWidth="60px" DatabaseField="wmsf2nsn" FieldTextBoxTabIndex="14"
														FieldLabelText="wmsf2nsn" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Response Codes</TD>
								</TR>
								<TR>
									<TD>SY = Picture SEEN, Response was YES<br/>
										SN = Picture SEEN, Response was NO<br/>
										NSY = Picture NOT SEEN, Response was YES<br/>
										NSN = Picture NOT SEEN, Response was NO</TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading" colSpan="2">Faces I</TD>
											</TR>
											<TR>
												<TD class="heading">Item Score<br/>
													(0 or 1)</TD>
												<TD class="heading">Response<br/>
													Code</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf101"
														FieldTextBoxTabIndex="15" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr101" runat="server" DatabaseField="wmsr101" FieldTextBoxTabIndex="111" FieldLabelText="wmsr101"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf102"
														FieldTextBoxTabIndex="16" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr102" runat="server" DatabaseField="wmsr102" FieldTextBoxTabIndex="112" FieldLabelText="wmsr102"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf103"
														FieldTextBoxTabIndex="17" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr103" runat="server" DatabaseField="wmsr103" FieldTextBoxTabIndex="113" FieldLabelText="wmsr103"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf104"
														FieldTextBoxTabIndex="18" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr104" runat="server" DatabaseField="wmsr104" FieldTextBoxTabIndex="114" FieldLabelText="wmsr104"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf105"
														FieldTextBoxTabIndex="19" FieldLabelText="5." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr105" runat="server" DatabaseField="wmsr105" FieldTextBoxTabIndex="115" FieldLabelText="wmsr105"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf106"
														FieldTextBoxTabIndex="20" FieldLabelText="6." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr106" runat="server" DatabaseField="wmsr106" FieldTextBoxTabIndex="116" FieldLabelText="wmsr106"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf107"
														FieldTextBoxTabIndex="21" FieldLabelText="7." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr107" runat="server" DatabaseField="wmsr107" FieldTextBoxTabIndex="117" FieldLabelText="wmsr107"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf108"
														FieldTextBoxTabIndex="22" FieldLabelText="8." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr108" runat="server" DatabaseField="wmsr108" FieldTextBoxTabIndex="118" FieldLabelText="wmsr108"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf109"
														FieldTextBoxTabIndex="23" FieldLabelText="9." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr109" runat="server" DatabaseField="wmsr109" FieldTextBoxTabIndex="119" FieldLabelText="wmsr109"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf110"
														FieldTextBoxTabIndex="24" FieldLabelText="10." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr110" runat="server" DatabaseField="wmsr110" FieldTextBoxTabIndex="120" FieldLabelText="wmsr110"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf111"
														FieldTextBoxTabIndex="25" FieldLabelText="11." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr111" runat="server" DatabaseField="wmsr111" FieldTextBoxTabIndex="121" FieldLabelText="wmsr111"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf112"
														FieldTextBoxTabIndex="26" FieldLabelText="12." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr112" runat="server" DatabaseField="wmsr112" FieldTextBoxTabIndex="122" FieldLabelText="wmsr112"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf113"
														FieldTextBoxTabIndex="27" FieldLabelText="13." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr113" runat="server" DatabaseField="wmsr113" FieldTextBoxTabIndex="123" FieldLabelText="wmsr113"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf114"
														FieldTextBoxTabIndex="28" FieldLabelText="14." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr114" runat="server" DatabaseField="wmsr114" FieldTextBoxTabIndex="124" FieldLabelText="wmsr114"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf115"
														FieldTextBoxTabIndex="29" FieldLabelText="15." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr115" runat="server" DatabaseField="wmsr115" FieldTextBoxTabIndex="125" FieldLabelText="wmsr115"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf116"
														FieldTextBoxTabIndex="30" FieldLabelText="16." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr116" runat="server" DatabaseField="wmsr116" FieldTextBoxTabIndex="126" FieldLabelText="wmsr116"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf117"
														FieldTextBoxTabIndex="31" FieldLabelText="17." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr117" runat="server" DatabaseField="wmsr117" FieldTextBoxTabIndex="127" FieldLabelText="wmsr117"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf118"
														FieldTextBoxTabIndex="32" FieldLabelText="18." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr118" runat="server" DatabaseField="wmsr118" FieldTextBoxTabIndex="128" FieldLabelText="wmsr118"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf119"
														FieldTextBoxTabIndex="33" FieldLabelText="19." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr119" runat="server" DatabaseField="wmsr119" FieldTextBoxTabIndex="129" FieldLabelText="wmsr119"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf120"
														FieldTextBoxTabIndex="34" FieldLabelText="20." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr120" runat="server" DatabaseField="wmsr120" FieldTextBoxTabIndex="130" FieldLabelText="wmsr120"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf121"
														FieldTextBoxTabIndex="35" FieldLabelText="21." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr121" runat="server" DatabaseField="wmsr121" FieldTextBoxTabIndex="131" FieldLabelText="wmsr121"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf122"
														FieldTextBoxTabIndex="36" FieldLabelText="22." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr122" runat="server" DatabaseField="wmsr122" FieldTextBoxTabIndex="132" FieldLabelText="wmsr122"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf123"
														FieldTextBoxTabIndex="37" FieldLabelText="23." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr123" runat="server" DatabaseField="wmsr123" FieldTextBoxTabIndex="133" FieldLabelText="wmsr123"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf124"
														FieldTextBoxTabIndex="38" FieldLabelText="24." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr124" runat="server" DatabaseField="wmsr124" FieldTextBoxTabIndex="134" FieldLabelText="wmsr124"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf125"
														FieldTextBoxTabIndex="39" FieldLabelText="25." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr125" runat="server" DatabaseField="wmsr125" FieldTextBoxTabIndex="135" FieldLabelText="wmsr125"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf126"
														FieldTextBoxTabIndex="40" FieldLabelText="26." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr126" runat="server" DatabaseField="wmsr126" FieldTextBoxTabIndex="136" FieldLabelText="wmsr126"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf127"
														FieldTextBoxTabIndex="41" FieldLabelText="27." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr127" runat="server" DatabaseField="wmsr127" FieldTextBoxTabIndex="137" FieldLabelText="wmsr127"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf128"
														FieldTextBoxTabIndex="42" FieldLabelText="28." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr128" runat="server" DatabaseField="wmsr128" FieldTextBoxTabIndex="138" FieldLabelText="wmsr128"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf129" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf129"
														FieldTextBoxTabIndex="43" FieldLabelText="29." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr129" runat="server" DatabaseField="wmsr129" FieldTextBoxTabIndex="139" FieldLabelText="wmsr129"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf130" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf130"
														FieldTextBoxTabIndex="44" FieldLabelText="30." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr130" runat="server" DatabaseField="wmsr130" FieldTextBoxTabIndex="140" FieldLabelText="wmsr130"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf131"
														FieldTextBoxTabIndex="45" FieldLabelText="31." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr131" runat="server" DatabaseField="wmsr131" FieldTextBoxTabIndex="141" FieldLabelText="wmsr131"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf132"
														FieldTextBoxTabIndex="46" FieldLabelText="32." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr132" runat="server" DatabaseField="wmsr132" FieldTextBoxTabIndex="142" FieldLabelText="wmsr132"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf133"
														FieldTextBoxTabIndex="47" FieldLabelText="33." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr133" runat="server" DatabaseField="wmsr133" FieldTextBoxTabIndex="143" FieldLabelText="wmsr133"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf134"
														FieldTextBoxTabIndex="48" FieldLabelText="34." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr134" runat="server" DatabaseField="wmsr134" FieldTextBoxTabIndex="144" FieldLabelText="wmsr134"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf135" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf135"
														FieldTextBoxTabIndex="49" FieldLabelText="35." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr135" runat="server" DatabaseField="wmsr135" FieldTextBoxTabIndex="145" FieldLabelText="wmsr135"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf136" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf136"
														FieldTextBoxTabIndex="50" FieldLabelText="36." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr136" runat="server" DatabaseField="wmsr136" FieldTextBoxTabIndex="146" FieldLabelText="wmsr136"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf137" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf137"
														FieldTextBoxTabIndex="51" FieldLabelText="37." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr137" runat="server" DatabaseField="wmsr137" FieldTextBoxTabIndex="147" FieldLabelText="wmsr137"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf138" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf138"
														FieldTextBoxTabIndex="52" FieldLabelText="38." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr138" runat="server" DatabaseField="wmsr138" FieldTextBoxTabIndex="148" FieldLabelText="wmsr138"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf139" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf139"
														FieldTextBoxTabIndex="53" FieldLabelText="39." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr139" runat="server" DatabaseField="wmsr139" FieldTextBoxTabIndex="149" FieldLabelText="wmsr139"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf140" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf140"
														FieldTextBoxTabIndex="54" FieldLabelText="40." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr140" runat="server" DatabaseField="wmsr140" FieldTextBoxTabIndex="150" FieldLabelText="wmsr140"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf141" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf141"
														FieldTextBoxTabIndex="55" FieldLabelText="41." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr141" runat="server" DatabaseField="wmsr141" FieldTextBoxTabIndex="151" FieldLabelText="wmsr141"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf142" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf142"
														FieldTextBoxTabIndex="56" FieldLabelText="42." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr142" runat="server" DatabaseField="wmsr142" FieldTextBoxTabIndex="152" FieldLabelText="wmsr142"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf143" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf143"
														FieldTextBoxTabIndex="57" FieldLabelText="43." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr143" runat="server" DatabaseField="wmsr143" FieldTextBoxTabIndex="153" FieldLabelText="wmsr143"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf144" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf144"
														FieldTextBoxTabIndex="58" FieldLabelText="44." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr144" runat="server" DatabaseField="wmsr144" FieldTextBoxTabIndex="154" FieldLabelText="wmsr144"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf145" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf145"
														FieldTextBoxTabIndex="59" FieldLabelText="45." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr145" runat="server" DatabaseField="wmsr145" FieldTextBoxTabIndex="155" FieldLabelText="wmsr145"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf146" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf146"
														FieldTextBoxTabIndex="60" FieldLabelText="46." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr146" runat="server" DatabaseField="wmsr146" FieldTextBoxTabIndex="156" FieldLabelText="wmsr146"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf147" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf147"
														FieldTextBoxTabIndex="61" FieldLabelText="47." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr147" runat="server" DatabaseField="wmsr147" FieldTextBoxTabIndex="157" FieldLabelText="wmsr147"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf148" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf148"
														FieldTextBoxTabIndex="62" FieldLabelText="48." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr148" runat="server" DatabaseField="wmsr148" FieldTextBoxTabIndex="158" FieldLabelText="wmsr148"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading" colSpan="2">Faces II</TD>
											</TR>
											<TR>
												<TD class="heading">Item Score<br/>
													(0 or 1)</TD>
												<TD class="heading">Response<br/>
													Code</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf201" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf201"
														FieldTextBoxTabIndex="63" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr201" runat="server" DatabaseField="wmsr201" FieldTextBoxTabIndex="159" FieldLabelText="wmsr201"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf202" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf202"
														FieldTextBoxTabIndex="64" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr202" runat="server" DatabaseField="wmsr202" FieldTextBoxTabIndex="160" FieldLabelText="wmsr202"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf203" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf203"
														FieldTextBoxTabIndex="65" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr203" runat="server" DatabaseField="wmsr203" FieldTextBoxTabIndex="161" FieldLabelText="wmsr203"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf204" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf204"
														FieldTextBoxTabIndex="66" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr204" runat="server" DatabaseField="wmsr204" FieldTextBoxTabIndex="162" FieldLabelText="wmsr204"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf205" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf205"
														FieldTextBoxTabIndex="67" FieldLabelText="5." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr205" runat="server" DatabaseField="wmsr205" FieldTextBoxTabIndex="163" FieldLabelText="wmsr205"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf206" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf206"
														FieldTextBoxTabIndex="68" FieldLabelText="6." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr206" runat="server" DatabaseField="wmsr206" FieldTextBoxTabIndex="164" FieldLabelText="wmsr206"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf207" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf207"
														FieldTextBoxTabIndex="69" FieldLabelText="7." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr207" runat="server" DatabaseField="wmsr207" FieldTextBoxTabIndex="165" FieldLabelText="wmsr207"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf208" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf208"
														FieldTextBoxTabIndex="70" FieldLabelText="8." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr208" runat="server" DatabaseField="wmsr208" FieldTextBoxTabIndex="166" FieldLabelText="wmsr208"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf209" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf209"
														FieldTextBoxTabIndex="71" FieldLabelText="9." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr209" runat="server" DatabaseField="wmsr209" FieldTextBoxTabIndex="167" FieldLabelText="wmsr209"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf210" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf210"
														FieldTextBoxTabIndex="72" FieldLabelText="10." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr210" runat="server" DatabaseField="wmsr210" FieldTextBoxTabIndex="168" FieldLabelText="wmsr210"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf211" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf211"
														FieldTextBoxTabIndex="73" FieldLabelText="11." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr211" runat="server" DatabaseField="wmsr211" FieldTextBoxTabIndex="169" FieldLabelText="wmsr211"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf212" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf212"
														FieldTextBoxTabIndex="74" FieldLabelText="12." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr212" runat="server" DatabaseField="wmsr212" FieldTextBoxTabIndex="170" FieldLabelText="wmsr212"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf213" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf213"
														FieldTextBoxTabIndex="75" FieldLabelText="13." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr213" runat="server" DatabaseField="wmsr213" FieldTextBoxTabIndex="171" FieldLabelText="wmsr213"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf214" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf214"
														FieldTextBoxTabIndex="76" FieldLabelText="14." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr214" runat="server" DatabaseField="wmsr214" FieldTextBoxTabIndex="172" FieldLabelText="wmsr214"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf215" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf215"
														FieldTextBoxTabIndex="77" FieldLabelText="15." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr215" runat="server" DatabaseField="wmsr215" FieldTextBoxTabIndex="173" FieldLabelText="wmsr215"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf216" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf216"
														FieldTextBoxTabIndex="78" FieldLabelText="16." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr216" runat="server" DatabaseField="wmsr216" FieldTextBoxTabIndex="174" FieldLabelText="wmsr216"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf217" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf217"
														FieldTextBoxTabIndex="79" FieldLabelText="17." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr217" runat="server" DatabaseField="wmsr217" FieldTextBoxTabIndex="175" FieldLabelText="wmsr217"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf218" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf218"
														FieldTextBoxTabIndex="80" FieldLabelText="18." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr218" runat="server" DatabaseField="wmsr218" FieldTextBoxTabIndex="176" FieldLabelText="wmsr218"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf219" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf219"
														FieldTextBoxTabIndex="81" FieldLabelText="19." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr219" runat="server" DatabaseField="wmsr219" FieldTextBoxTabIndex="177" FieldLabelText="wmsr219"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf220" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf220"
														FieldTextBoxTabIndex="82" FieldLabelText="20." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr220" runat="server" DatabaseField="wmsr220" FieldTextBoxTabIndex="178" FieldLabelText="wmsr220"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf221" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf221"
														FieldTextBoxTabIndex="83" FieldLabelText="21." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr221" runat="server" DatabaseField="wmsr221" FieldTextBoxTabIndex="179" FieldLabelText="wmsr221"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf222" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf222"
														FieldTextBoxTabIndex="84" FieldLabelText="22." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr222" runat="server" DatabaseField="wmsr222" FieldTextBoxTabIndex="180" FieldLabelText="wmsr222"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf223" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf223"
														FieldTextBoxTabIndex="85" FieldLabelText="23." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr223" runat="server" DatabaseField="wmsr223" FieldTextBoxTabIndex="181" FieldLabelText="wmsr223"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf224" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf224"
														FieldTextBoxTabIndex="86" FieldLabelText="24." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr224" runat="server" DatabaseField="wmsr224" FieldTextBoxTabIndex="182" FieldLabelText="wmsr224"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf225" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf225"
														FieldTextBoxTabIndex="87" FieldLabelText="25." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr225" runat="server" DatabaseField="wmsr225" FieldTextBoxTabIndex="183" FieldLabelText="wmsr225"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf226" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf226"
														FieldTextBoxTabIndex="88" FieldLabelText="26." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr226" runat="server" DatabaseField="wmsr226" FieldTextBoxTabIndex="184" FieldLabelText="wmsr226"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf227" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf227"
														FieldTextBoxTabIndex="89" FieldLabelText="27." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr227" runat="server" DatabaseField="wmsr227" FieldTextBoxTabIndex="185" FieldLabelText="wmsr227"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf228" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf228"
														FieldTextBoxTabIndex="90" FieldLabelText="28." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr228" runat="server" DatabaseField="wmsr228" FieldTextBoxTabIndex="186" FieldLabelText="wmsr228"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf229" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf229"
														FieldTextBoxTabIndex="91" FieldLabelText="29." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr229" runat="server" DatabaseField="wmsr229" FieldTextBoxTabIndex="187" FieldLabelText="wmsr229"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf230" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf230"
														FieldTextBoxTabIndex="92" FieldLabelText="30." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr230" runat="server" DatabaseField="wmsr230" FieldTextBoxTabIndex="188" FieldLabelText="wmsr230"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf231" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf231"
														FieldTextBoxTabIndex="93" FieldLabelText="31." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr231" runat="server" DatabaseField="wmsr231" FieldTextBoxTabIndex="189" FieldLabelText="wmsr231"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf232" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf232"
														FieldTextBoxTabIndex="94" FieldLabelText="32." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr232" runat="server" DatabaseField="wmsr232" FieldTextBoxTabIndex="190" FieldLabelText="wmsr232"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf233" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf233"
														FieldTextBoxTabIndex="95" FieldLabelText="33." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr233" runat="server" DatabaseField="wmsr233" FieldTextBoxTabIndex="191" FieldLabelText="wmsr233"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf234" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf234"
														FieldTextBoxTabIndex="96" FieldLabelText="34." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr234" runat="server" DatabaseField="wmsr234" FieldTextBoxTabIndex="192" FieldLabelText="wmsr234"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf235" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf235"
														FieldTextBoxTabIndex="97" FieldLabelText="35." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr235" runat="server" DatabaseField="wmsr235" FieldTextBoxTabIndex="193" FieldLabelText="wmsr235"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf236" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf236"
														FieldTextBoxTabIndex="98" FieldLabelText="36." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr236" runat="server" DatabaseField="wmsr236" FieldTextBoxTabIndex="194" FieldLabelText="wmsr236"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf237" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf237"
														FieldTextBoxTabIndex="99" FieldLabelText="37." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr237" runat="server" DatabaseField="wmsr237" FieldTextBoxTabIndex="195" FieldLabelText="wmsr237"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf238" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf238"
														FieldTextBoxTabIndex="100" FieldLabelText="38." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr238" runat="server" DatabaseField="wmsr238" FieldTextBoxTabIndex="196" FieldLabelText="wmsr238"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf239" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf239"
														FieldTextBoxTabIndex="101" FieldLabelText="39." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr239" runat="server" DatabaseField="wmsr239" FieldTextBoxTabIndex="197" FieldLabelText="wmsr239"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf240" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf240"
														FieldTextBoxTabIndex="102" FieldLabelText="40." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr240" runat="server" DatabaseField="wmsr240" FieldTextBoxTabIndex="198" FieldLabelText="wmsr240"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf241" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf241"
														FieldTextBoxTabIndex="103" FieldLabelText="41." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr241" runat="server" DatabaseField="wmsr241" FieldTextBoxTabIndex="199" FieldLabelText="wmsr241"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf242" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf242"
														FieldTextBoxTabIndex="104" FieldLabelText="42." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr242" runat="server" DatabaseField="wmsr242" FieldTextBoxTabIndex="200" FieldLabelText="wmsr242"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf243" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf243"
														FieldTextBoxTabIndex="105" FieldLabelText="43." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr243" runat="server" DatabaseField="wmsr243" FieldTextBoxTabIndex="201" FieldLabelText="wmsr243"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf244" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf244"
														FieldTextBoxTabIndex="106" FieldLabelText="44." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr244" runat="server" DatabaseField="wmsr244" FieldTextBoxTabIndex="202" FieldLabelText="wmsr244"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf245" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf245"
														FieldTextBoxTabIndex="107" FieldLabelText="45." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr245" runat="server" DatabaseField="wmsr245" FieldTextBoxTabIndex="203" FieldLabelText="wmsr245"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf246" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf246"
														FieldTextBoxTabIndex="108" FieldLabelText="46." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr246" runat="server" DatabaseField="wmsr246" FieldTextBoxTabIndex="204" FieldLabelText="wmsr246"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf247" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf247"
														FieldTextBoxTabIndex="109" FieldLabelText="47." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr247" runat="server" DatabaseField="wmsr247" FieldTextBoxTabIndex="205" FieldLabelText="wmsr247"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="wmsf248" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="wmsf248"
														FieldTextBoxTabIndex="110" FieldLabelText="48." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="wmsr248" runat="server" DatabaseField="wmsr248" FieldTextBoxTabIndex="206" FieldLabelText="wmsr248"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<br/>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsvld" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="wmsvld"
											FieldTextBoxTabIndex="207" FieldLabelText="Validity (0=valid, 1=Questionable, 2=Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmscmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="wmscmnt"
											FieldTextBoxTabIndex="208" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
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
