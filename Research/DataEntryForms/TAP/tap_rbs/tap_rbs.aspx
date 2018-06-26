<%@ Page language="c#" Inherits="tap_rbs.tap_rbs" CodeFile="tap_rbs.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_rbs" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP RBS" PrimaryKeyField="rbs_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="345"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldLabelWidth="80px" FieldTextBoxWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<div><br/>
							0-behavior does not occur<br/>
							1-mild problem<br/>
							2-moderate problem<br/>
							3-severe problem<br/>
							9-Missing/Blank<br/>
							<br/>
						</div>
						<table class="layout">
							<tr>
								<td style="vertical-align:top" width="127">
									<table id="table_entry" class="layout">
										<tr>
											<td><def:datafieldcontrol id="RBS01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS01"
													FieldTextBoxTabIndex="3" DatabaseField="RBS01" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS02"
													FieldTextBoxTabIndex="4" DatabaseField="RBS02" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS03"
													FieldTextBoxTabIndex="5" DatabaseField="RBS03" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS04"
													FieldTextBoxTabIndex="6" DatabaseField="RBS04" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS05"
													FieldTextBoxTabIndex="7" DatabaseField="RBS05" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS06"
													FieldTextBoxTabIndex="8" DatabaseField="RBS06" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS07"
													FieldTextBoxTabIndex="9" DatabaseField="RBS07" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS08"
													FieldTextBoxTabIndex="10" DatabaseField="RBS08" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS09"
													FieldTextBoxTabIndex="11" DatabaseField="RBS09" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS10"
													FieldTextBoxTabIndex="12" DatabaseField="RBS10" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS11"
													FieldTextBoxTabIndex="13" DatabaseField="RBS11" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS12"
													FieldTextBoxTabIndex="14" DatabaseField="RBS12" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS13"
													FieldTextBoxTabIndex="15" DatabaseField="RBS13" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS14"
													FieldTextBoxTabIndex="16" DatabaseField="RBS14" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS15"
													FieldTextBoxTabIndex="17" DatabaseField="RBS15" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS16"
													FieldTextBoxTabIndex="18" DatabaseField="RBS16" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS17"
													FieldTextBoxTabIndex="19" DatabaseField="RBS17" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top" width="132">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="RBS18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS18"
													FieldTextBoxTabIndex="20" DatabaseField="RBS18" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS19"
													FieldTextBoxTabIndex="21" DatabaseField="RBS19" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS20"
													FieldTextBoxTabIndex="22" DatabaseField="RBS20" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS21"
													FieldTextBoxTabIndex="23" DatabaseField="RBS21" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS22"
													FieldTextBoxTabIndex="24" DatabaseField="RBS22" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS23"
													FieldTextBoxTabIndex="25" DatabaseField="RBS23" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS24"
													FieldTextBoxTabIndex="26" DatabaseField="RBS24" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS25"
													FieldTextBoxTabIndex="27" DatabaseField="RBS25" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS26"
													FieldTextBoxTabIndex="28" DatabaseField="RBS26" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS27"
													FieldTextBoxTabIndex="29" DatabaseField="RBS27" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS28"
													FieldTextBoxTabIndex="30" DatabaseField="RBS28" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS29"
													FieldTextBoxTabIndex="31" DatabaseField="RBS29" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS30" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS30"
													FieldTextBoxTabIndex="32" DatabaseField="RBS30" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS31" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS31"
													FieldTextBoxTabIndex="33" DatabaseField="RBS31" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS32" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS32"
													FieldTextBoxTabIndex="34" DatabaseField="RBS32" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS33" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS33"
													FieldTextBoxTabIndex="35" DatabaseField="RBS33" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS34" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS34"
													FieldTextBoxTabIndex="36" DatabaseField="RBS34" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="RBS35" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS35"
													FieldTextBoxTabIndex="37" DatabaseField="RBS35" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS36" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS36"
													FieldTextBoxTabIndex="38" DatabaseField="RBS36" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS37" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS37"
													FieldTextBoxTabIndex="39" DatabaseField="RBS37" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS38" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS38"
													FieldTextBoxTabIndex="40" DatabaseField="RBS38" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS39" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS39"
													FieldTextBoxTabIndex="41" DatabaseField="RBS39" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS40" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS40"
													FieldTextBoxTabIndex="42" DatabaseField="RBS40" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS41" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS41"
													FieldTextBoxTabIndex="43" DatabaseField="RBS41" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS42" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS42"
													FieldTextBoxTabIndex="44" DatabaseField="RBS42" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS43" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS43"
													FieldTextBoxTabIndex="45" DatabaseField="RBS43" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS44" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS44"
													FieldTextBoxTabIndex="46" DatabaseField="RBS44" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS45" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS45"
													FieldTextBoxTabIndex="47" DatabaseField="RBS45" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS46" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS46"
													FieldTextBoxTabIndex="48" DatabaseField="RBS46" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS47" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS47"
													FieldTextBoxTabIndex="49" DatabaseField="RBS47" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS48" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS48"
													FieldTextBoxTabIndex="50" DatabaseField="RBS48" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="RBS49" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="RBS49"
													FieldTextBoxTabIndex="51" DatabaseField="RBS49" ValidList="0,1,2,3,9" FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br/>
						<table id="table_readonly" class="layout">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
										FieldTextBoxTabIndex="54" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="55" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="56" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
										FieldTextBoxTabIndex="57" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
					</asp:Content>
