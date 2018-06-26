<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_odrpartial.edst3_odrpartial" CodeFile="edst3_odrpartial.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
					<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="odr_pk"
						MeasureName="EDST3 ODR Partial" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" LookupField1="edsid"
						DatabaseTable="edst3_odrpartial" StudyMeasID="191"></def:dataentrycontroller>
					<table id="table_insert" class="layout">
						<tr>
							<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
									IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
									FieldTextBoxTabIndex="2" DatabaseField="edsid" FieldLabelWidth="60px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
							</td>
						</tr>
						<tr>
							<td><def:datafieldcontrol id="odrdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
									IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
									FieldTextBoxTabIndex="3" DatabaseField="odrdate" FieldLabelWidth="60px" FieldTextBoxWidth="60px" FormatString="{0:d}"></def:datafieldcontrol>
							</td>
						</tr>
						<tr>
							<td><def:datafieldcontrol id="odrclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
									IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
									FieldTextBoxTabIndex="4" DatabaseField="odrclin" FieldLabelWidth="60px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
							</td>
						</tr>
					</table>
					<br>
					<asp:Panel Runat="server" ID="mainPanel">
						<TABLE class="layout">
							<TR>
								<TD class="heading" colSpan="4">0=Incorrect<BR>
									1=Correct<BR>
									9=Missing/Blank<BR>
									**Leave blank all items after criterion is met.</TD>
							</TR>
							<TR>
								<TD style="vertical-align:top">
									<TABLE class="grid" id="table_entry">
										<TR>
											<TD class="heading">Practice</TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra01"
													FieldTextBoxTabIndex="5" FieldLabelText="1 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra02"
													FieldTextBoxTabIndex="6" FieldLabelText="2 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra03"
													FieldTextBoxTabIndex="7" FieldLabelText="3 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra04"
													FieldTextBoxTabIndex="8" FieldLabelText="4 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra05"
													FieldTextBoxTabIndex="9" FieldLabelText="5 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra06"
													FieldTextBoxTabIndex="10" FieldLabelText="6 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra07"
													FieldTextBoxTabIndex="11" FieldLabelText="7 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra08"
													FieldTextBoxTabIndex="12" FieldLabelText="8 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra09"
													FieldTextBoxTabIndex="13" FieldLabelText="9 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra10"
													FieldTextBoxTabIndex="14" FieldLabelText="10 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra11"
													FieldTextBoxTabIndex="15" FieldLabelText="11 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra12"
													FieldTextBoxTabIndex="16" FieldLabelText="12 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra13"
													FieldTextBoxTabIndex="17" FieldLabelText="13 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra14"
													FieldTextBoxTabIndex="18" FieldLabelText="14 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra15"
													FieldTextBoxTabIndex="19" FieldLabelText="15 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra16"
													FieldTextBoxTabIndex="20" FieldLabelText="16 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra17"
													FieldTextBoxTabIndex="21" FieldLabelText="17 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra18"
													FieldTextBoxTabIndex="22" FieldLabelText="18 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra19"
													FieldTextBoxTabIndex="23" FieldLabelText="19 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra20"
													FieldTextBoxTabIndex="24" FieldLabelText="20 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra21"
													FieldTextBoxTabIndex="25" FieldLabelText="21 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra22"
													FieldTextBoxTabIndex="26" FieldLabelText="22 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra23"
													FieldTextBoxTabIndex="27" FieldLabelText="23 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra24"
													FieldTextBoxTabIndex="28" FieldLabelText="24 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra25"
													FieldTextBoxTabIndex="29" FieldLabelText="25 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra26"
													FieldTextBoxTabIndex="30" FieldLabelText="26 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra27"
													FieldTextBoxTabIndex="31" FieldLabelText="27 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra28"
													FieldTextBoxTabIndex="32" FieldLabelText="28 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra29"
													FieldTextBoxTabIndex="33" FieldLabelText="29 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odra30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odra30"
													FieldTextBoxTabIndex="34" FieldLabelText="30 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odracr" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odracr"
													FieldTextBoxTabIndex="35" FieldLabelText="Met Criteria?" IsDoubleEntryField="True" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
									</TABLE>
								</TD>
								<TD style="vertical-align:top">
									<TABLE class="grid">
										<TR>
											<TD class="heading">Reversal #1</TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb01"
													FieldTextBoxTabIndex="36" FieldLabelText="1 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb02"
													FieldTextBoxTabIndex="37" FieldLabelText="2 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb03"
													FieldTextBoxTabIndex="38" FieldLabelText="3 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb04"
													FieldTextBoxTabIndex="39" FieldLabelText="4 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb05"
													FieldTextBoxTabIndex="40" FieldLabelText="5 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb06"
													FieldTextBoxTabIndex="41" FieldLabelText="6 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb07"
													FieldTextBoxTabIndex="42" FieldLabelText="7 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb08"
													FieldTextBoxTabIndex="43" FieldLabelText="8 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb09"
													FieldTextBoxTabIndex="44" FieldLabelText="9 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb10"
													FieldTextBoxTabIndex="45" FieldLabelText="10 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb11"
													FieldTextBoxTabIndex="46" FieldLabelText="11 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb12"
													FieldTextBoxTabIndex="47" FieldLabelText="12 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb13"
													FieldTextBoxTabIndex="48" FieldLabelText="13 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb14"
													FieldTextBoxTabIndex="49" FieldLabelText="14 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb15"
													FieldTextBoxTabIndex="50" FieldLabelText="15 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb16"
													FieldTextBoxTabIndex="51" FieldLabelText="16 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb17"
													FieldTextBoxTabIndex="52" FieldLabelText="17 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb18"
													FieldTextBoxTabIndex="53" FieldLabelText="18 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb19"
													FieldTextBoxTabIndex="54" FieldLabelText="19 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb20"
													FieldTextBoxTabIndex="55" FieldLabelText="20 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb21"
													FieldTextBoxTabIndex="56" FieldLabelText="21 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb22"
													FieldTextBoxTabIndex="57" FieldLabelText="22 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb23"
													FieldTextBoxTabIndex="58" FieldLabelText="23 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb24"
													FieldTextBoxTabIndex="59" FieldLabelText="24 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb25"
													FieldTextBoxTabIndex="60" FieldLabelText="25 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb26"
													FieldTextBoxTabIndex="61" FieldLabelText="26 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb27"
													FieldTextBoxTabIndex="62" FieldLabelText="27 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb28"
													FieldTextBoxTabIndex="63" FieldLabelText="28 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb29"
													FieldTextBoxTabIndex="64" FieldLabelText="29 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb30"
													FieldTextBoxTabIndex="65" FieldLabelText="30 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb31"
													FieldTextBoxTabIndex="66" FieldLabelText="31 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb32"
													FieldTextBoxTabIndex="67" FieldLabelText="32 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb33"
													FieldTextBoxTabIndex="68" FieldLabelText="33 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb34"
													FieldTextBoxTabIndex="69" FieldLabelText="34 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb35"
													FieldTextBoxTabIndex="70" FieldLabelText="35 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb36"
													FieldTextBoxTabIndex="71" FieldLabelText="36 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb37"
													FieldTextBoxTabIndex="72" FieldLabelText="37 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb38"
													FieldTextBoxTabIndex="73" FieldLabelText="38 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb39"
													FieldTextBoxTabIndex="74" FieldLabelText="39 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrb40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrb40"
													FieldTextBoxTabIndex="75" FieldLabelText="40 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrbcr" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrbcr"
													FieldTextBoxTabIndex="76" FieldLabelText="Met Criteria?" IsDoubleEntryField="True" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
									</TABLE>
								</TD>
								<TD style="vertical-align:top">
									<TABLE class="grid">
										<TR>
											<TD class="heading">Reversal #2</TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc01"
													FieldTextBoxTabIndex="77" FieldLabelText="1 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc02"
													FieldTextBoxTabIndex="78" FieldLabelText="2 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc03"
													FieldTextBoxTabIndex="79" FieldLabelText="3 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc04"
													FieldTextBoxTabIndex="80" FieldLabelText="4 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc05"
													FieldTextBoxTabIndex="81" FieldLabelText="5 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc06"
													FieldTextBoxTabIndex="82" FieldLabelText="6 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc07"
													FieldTextBoxTabIndex="83" FieldLabelText="7 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc08"
													FieldTextBoxTabIndex="84" FieldLabelText="8 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc09"
													FieldTextBoxTabIndex="85" FieldLabelText="9 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc10"
													FieldTextBoxTabIndex="86" FieldLabelText="10 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc11"
													FieldTextBoxTabIndex="87" FieldLabelText="11 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc12"
													FieldTextBoxTabIndex="88" FieldLabelText="12 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc13"
													FieldTextBoxTabIndex="89" FieldLabelText="13 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc14"
													FieldTextBoxTabIndex="90" FieldLabelText="14 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc15"
													FieldTextBoxTabIndex="91" FieldLabelText="15 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc16"
													FieldTextBoxTabIndex="92" FieldLabelText="16 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc17"
													FieldTextBoxTabIndex="93" FieldLabelText="17 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc18"
													FieldTextBoxTabIndex="94" FieldLabelText="18 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc19"
													FieldTextBoxTabIndex="95" FieldLabelText="19 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc20"
													FieldTextBoxTabIndex="96" FieldLabelText="20 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc21"
													FieldTextBoxTabIndex="97" FieldLabelText="21 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc22"
													FieldTextBoxTabIndex="98" FieldLabelText="22 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc23"
													FieldTextBoxTabIndex="99" FieldLabelText="23 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc24"
													FieldTextBoxTabIndex="100" FieldLabelText="24 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc25"
													FieldTextBoxTabIndex="101" FieldLabelText="25 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc26"
													FieldTextBoxTabIndex="102" FieldLabelText="26 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc27"
													FieldTextBoxTabIndex="103" FieldLabelText="27 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc28"
													FieldTextBoxTabIndex="104" FieldLabelText="28 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc29"
													FieldTextBoxTabIndex="105" FieldLabelText="29 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc30"
													FieldTextBoxTabIndex="106" FieldLabelText="30 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc31"
													FieldTextBoxTabIndex="107" FieldLabelText="31 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc32"
													FieldTextBoxTabIndex="108" FieldLabelText="32 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc33"
													FieldTextBoxTabIndex="109" FieldLabelText="33 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc34"
													FieldTextBoxTabIndex="110" FieldLabelText="34 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc35"
													FieldTextBoxTabIndex="111" FieldLabelText="35 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc36"
													FieldTextBoxTabIndex="112" FieldLabelText="36 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc37"
													FieldTextBoxTabIndex="113" FieldLabelText="37 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc38"
													FieldTextBoxTabIndex="114" FieldLabelText="38 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc39"
													FieldTextBoxTabIndex="115" FieldLabelText="39 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrc40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrc40"
													FieldTextBoxTabIndex="116" FieldLabelText="40 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrccr" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrccr"
													FieldTextBoxTabIndex="117" FieldLabelText="Met Criteria?" IsDoubleEntryField="True" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
									</TABLE>
								</TD>
								<TD style="vertical-align:top">
									<TABLE class="grid">
										<TR>
											<TD class="heading">Reversal #3</TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd01"
													FieldTextBoxTabIndex="118" FieldLabelText="1 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd02"
													FieldTextBoxTabIndex="119" FieldLabelText="2 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd03"
													FieldTextBoxTabIndex="120" FieldLabelText="3 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd04"
													FieldTextBoxTabIndex="121" FieldLabelText="4 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd05"
													FieldTextBoxTabIndex="122" FieldLabelText="5 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd06"
													FieldTextBoxTabIndex="123" FieldLabelText="6 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd07"
													FieldTextBoxTabIndex="124" FieldLabelText="7 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd08"
													FieldTextBoxTabIndex="125" FieldLabelText="8 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd09"
													FieldTextBoxTabIndex="126" FieldLabelText="9 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd10"
													FieldTextBoxTabIndex="127" FieldLabelText="10 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd11"
													FieldTextBoxTabIndex="128" FieldLabelText="11 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd12"
													FieldTextBoxTabIndex="129" FieldLabelText="12 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd13"
													FieldTextBoxTabIndex="130" FieldLabelText="13 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd14"
													FieldTextBoxTabIndex="131" FieldLabelText="14 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd15"
													FieldTextBoxTabIndex="132" FieldLabelText="15 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd16"
													FieldTextBoxTabIndex="133" FieldLabelText="16 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd17"
													FieldTextBoxTabIndex="134" FieldLabelText="17 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd18"
													FieldTextBoxTabIndex="135" FieldLabelText="18 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd19"
													FieldTextBoxTabIndex="136" FieldLabelText="19 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd20"
													FieldTextBoxTabIndex="137" FieldLabelText="20 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd21"
													FieldTextBoxTabIndex="138" FieldLabelText="21 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd22"
													FieldTextBoxTabIndex="139" FieldLabelText="22 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd23"
													FieldTextBoxTabIndex="140" FieldLabelText="23 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd24"
													FieldTextBoxTabIndex="141" FieldLabelText="24 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd25"
													FieldTextBoxTabIndex="142" FieldLabelText="25 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd26"
													FieldTextBoxTabIndex="143" FieldLabelText="26 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd27"
													FieldTextBoxTabIndex="144" FieldLabelText="27 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd28"
													FieldTextBoxTabIndex="145" FieldLabelText="28 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd29"
													FieldTextBoxTabIndex="146" FieldLabelText="29 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd30"
													FieldTextBoxTabIndex="147" FieldLabelText="30 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd31"
													FieldTextBoxTabIndex="148" FieldLabelText="31 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd32"
													FieldTextBoxTabIndex="149" FieldLabelText="32 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd33"
													FieldTextBoxTabIndex="150" FieldLabelText="33 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd34"
													FieldTextBoxTabIndex="151" FieldLabelText="34 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd35"
													FieldTextBoxTabIndex="152" FieldLabelText="35 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd36"
													FieldTextBoxTabIndex="153" FieldLabelText="36 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd37"
													FieldTextBoxTabIndex="154" FieldLabelText="37 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd38"
													FieldTextBoxTabIndex="155" FieldLabelText="38 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd39"
													FieldTextBoxTabIndex="156" FieldLabelText="39 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrd40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrd40"
													FieldTextBoxTabIndex="157" FieldLabelText="40 " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="odrdcr" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="30px" DatabaseField="odrdcr"
													FieldTextBoxTabIndex="158" FieldLabelText="Met Criteria?" IsDoubleEntryField="True" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD class="heading" colSpan="4">0=Criteria not met, 1=Criteria Met, 9=Missing/Blank</TD>
							</TR>
						</TABLE>
						<BR>
						<TABLE class="grid">
							<TR>
								<TD>
									<def:datafieldcontrol id="odrbeh" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="odrbeh"
										FieldTextBoxTabIndex="159" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="odrvld" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="odrvld"
										FieldTextBoxTabIndex="160" FieldLabelText="Validity (1=valid, 2=questionable, 3=invalid)" IsDoubleEntryField="True"
										IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="odrcmt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="odrcmt"
										FieldTextBoxTabIndex="161" FieldLabelText="Validity Comments" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
							</TR>
						</TABLE>
						<BR>
						<TABLE class="layout" id="table_readonly">
							<TR>
								<TD>
									<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="163"
										FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="164"
										FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="165"
										FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="166"
										FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
						</TABLE>
					</asp:Panel>
</asp:Content>
