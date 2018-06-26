<%@ Page language="c#" Inherits="tap_bitsea.tap_bitsea" CodeFile="tap_bitsea.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_bitsea" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP BITSEA" PrimaryKeyField="bit_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="344"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###"
										FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<div><br/>
							0-not true/rarely<br/>
							1-somewhat true/sometimes<br/>
							2-very true/often<br/>
							8-N/A<br/>
							9-Missing/Blank<br/>
							<br/>
						</div>
						<table class="layout">
							<tr>
								<td style="vertical-align:top" width="155">
									<table id="table_entry" class="layout">
										<tr>
											<td><def:datafieldcontrol id="BIT01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT01"
													FieldTextBoxTabIndex="3" DatabaseField="BIT01" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT02"
													FieldTextBoxTabIndex="4" DatabaseField="BIT02" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT03"
													FieldTextBoxTabIndex="5" DatabaseField="BIT03" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT04"
													FieldTextBoxTabIndex="6" DatabaseField="BIT04" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT05"
													FieldTextBoxTabIndex="7" DatabaseField="BIT05" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT06"
													FieldTextBoxTabIndex="8" DatabaseField="BIT06" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT07"
													FieldTextBoxTabIndex="9" DatabaseField="BIT07" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT08"
													FieldTextBoxTabIndex="10" DatabaseField="BIT08" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT09"
													FieldTextBoxTabIndex="11" DatabaseField="BIT09" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT10"
													FieldTextBoxTabIndex="12" DatabaseField="BIT10" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT11"
													FieldTextBoxTabIndex="13" DatabaseField="BIT11" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT12"
													FieldTextBoxTabIndex="14" DatabaseField="BIT12" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT13"
													FieldTextBoxTabIndex="15" DatabaseField="BIT13" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT14"
													FieldTextBoxTabIndex="16" DatabaseField="BIT14" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT15"
													FieldTextBoxTabIndex="17" DatabaseField="BIT15" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT16"
													FieldTextBoxTabIndex="18" DatabaseField="BIT16" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT17"
													FieldTextBoxTabIndex="19" DatabaseField="BIT17" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT18"
													FieldTextBoxTabIndex="20" DatabaseField="BIT18" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT19"
													FieldTextBoxTabIndex="21" DatabaseField="BIT19" ValidList="0,1,2,8,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT20"
													FieldTextBoxTabIndex="22" DatabaseField="BIT20" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT21"
													FieldTextBoxTabIndex="23" DatabaseField="BIT21" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT22"
													FieldTextBoxTabIndex="24" DatabaseField="BIT22" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="BIT23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT23"
													FieldTextBoxTabIndex="25" DatabaseField="BIT23" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT24"
													FieldTextBoxTabIndex="26" DatabaseField="BIT24" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT25"
													FieldTextBoxTabIndex="27" DatabaseField="BIT25" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT26"
													FieldTextBoxTabIndex="28" DatabaseField="BIT26" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT27"
													FieldTextBoxTabIndex="29" DatabaseField="BIT27" ValidList="0,1,2,8,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT28"
													FieldTextBoxTabIndex="30" DatabaseField="BIT28" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT29"
													FieldTextBoxTabIndex="31" DatabaseField="BIT29" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT30" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT30"
													FieldTextBoxTabIndex="32" DatabaseField="BIT30" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT31" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT31"
													FieldTextBoxTabIndex="33" DatabaseField="BIT31" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT32" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT32"
													FieldTextBoxTabIndex="34" DatabaseField="BIT32" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT33" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT33"
													FieldTextBoxTabIndex="35" DatabaseField="BIT33" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT34" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT34"
													FieldTextBoxTabIndex="36" DatabaseField="BIT34" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT35" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT35"
													FieldTextBoxTabIndex="37" DatabaseField="BIT35" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT36" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT36"
													FieldTextBoxTabIndex="38" DatabaseField="BIT36" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT37" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT37"
													FieldTextBoxTabIndex="39" DatabaseField="BIT37" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT38" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT38"
													FieldTextBoxTabIndex="40" DatabaseField="BIT38" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT39" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT39"
													FieldTextBoxTabIndex="41" DatabaseField="BIT39" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT40" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT40"
													FieldTextBoxTabIndex="42" DatabaseField="BIT40" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT41" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT41"
													FieldTextBoxTabIndex="43" DatabaseField="BIT41" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT42" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="BIT42"
													FieldTextBoxTabIndex="44" DatabaseField="BIT42" ValidList="0,1,2,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT43" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A."
													FieldTextBoxTabIndex="45" DatabaseField="BIT43" ValidList="1,2,3,4,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="BIT44" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B."
													FieldTextBoxTabIndex="46" DatabaseField="BIT44" ValidList="1,2,3,4,9" FieldTextBoxWidth="30px" FieldLabelWidth="50px"></def:datafieldcontrol>
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
										FieldTextBoxTabIndex="49" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="50" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="51" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
										FieldTextBoxTabIndex="52" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
					</asp:Content>
