<%@ Page language="c#" Inherits="GenericDataEntryForms.odr3.odr3" CodeFile="odr3.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="odr3_pk" MeasureName="ODR3" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_odr3"
							></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" DatabaseField="ID" FieldTextBoxTabIndex="4" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<table class="layout" id="table_entry">
							<tr>
								<td><def:datafieldcontrol id="ODRCLIN" runat="server" DatabaseField="ODRCLIN" FieldTextBoxTabIndex="5" FieldLabelText="Clinician"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="ODRDATE" runat="server" DatabaseField="ODRDATE" FieldTextBoxTabIndex="6" FieldLabelText="Date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						Enter: 0=No (slash), 1=Yes (circle), 9=Missing/chose both/blank<br>
						<table class="layout">
							<tr>
								<td>
									<table>
										<tr>
											<td><b>Reversal 1</b></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra01" runat="server" DatabaseField="odra01" FieldTextBoxTabIndex="13" FieldLabelText="odra01"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra02" runat="server" DatabaseField="odra02" FieldTextBoxTabIndex="14" FieldLabelText="odra02"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra03" runat="server" DatabaseField="odra03" FieldTextBoxTabIndex="15" FieldLabelText="odra03"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra04" runat="server" DatabaseField="odra04" FieldTextBoxTabIndex="16" FieldLabelText="odra04"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra05" runat="server" DatabaseField="odra05" FieldTextBoxTabIndex="17" FieldLabelText="odra05"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra06" runat="server" DatabaseField="odra06" FieldTextBoxTabIndex="18" FieldLabelText="odra06"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra07" runat="server" DatabaseField="odra07" FieldTextBoxTabIndex="19" FieldLabelText="odra07"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra08" runat="server" DatabaseField="odra08" FieldTextBoxTabIndex="20" FieldLabelText="odra08"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra09" runat="server" DatabaseField="odra09" FieldTextBoxTabIndex="21" FieldLabelText="odra09"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra10" runat="server" DatabaseField="odra10" FieldTextBoxTabIndex="22" FieldLabelText="odra10"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra11" runat="server" DatabaseField="odra11" FieldTextBoxTabIndex="23" FieldLabelText="odra11"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra12" runat="server" DatabaseField="odra12" FieldTextBoxTabIndex="24" FieldLabelText="odra12"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra13" runat="server" DatabaseField="odra13" FieldTextBoxTabIndex="25" FieldLabelText="odra13"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra14" runat="server" DatabaseField="odra14" FieldTextBoxTabIndex="26" FieldLabelText="odra14"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra15" runat="server" DatabaseField="odra15" FieldTextBoxTabIndex="27" FieldLabelText="odra15"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra16" runat="server" DatabaseField="odra16" FieldTextBoxTabIndex="28" FieldLabelText="odra16"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra17" runat="server" DatabaseField="odra17" FieldTextBoxTabIndex="29" FieldLabelText="odra17"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra18" runat="server" DatabaseField="odra18" FieldTextBoxTabIndex="30" FieldLabelText="odra18"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra19" runat="server" DatabaseField="odra19" FieldTextBoxTabIndex="31" FieldLabelText="odra19"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra20" runat="server" DatabaseField="odra20" FieldTextBoxTabIndex="32" FieldLabelText="odra20"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra21" runat="server" DatabaseField="odra21" FieldTextBoxTabIndex="33" FieldLabelText="odra21"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra22" runat="server" DatabaseField="odra22" FieldTextBoxTabIndex="34" FieldLabelText="odra22"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra23" runat="server" DatabaseField="odra23" FieldTextBoxTabIndex="35" FieldLabelText="odra23"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra24" runat="server" DatabaseField="odra24" FieldTextBoxTabIndex="36" FieldLabelText="odra24"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odra25" runat="server" DatabaseField="odra25" FieldTextBoxTabIndex="37" FieldLabelText="odra25"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ODRynA" runat="server" DatabaseField="ODRynA" FieldTextBoxTabIndex="37" FieldLabelText="REV 1 Crit. Met (y or n)?"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="40px" FieldLabelWidth="130px" ValidList="y,n,Y,N"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td><STRONG>Reversal 2</STRONG></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb01" runat="server" DatabaseField="odrb01" FieldTextBoxTabIndex="38" FieldLabelText="odrb01"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb02" runat="server" DatabaseField="odrb02" FieldTextBoxTabIndex="39" FieldLabelText="odrb02"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb03" runat="server" DatabaseField="odrb03" FieldTextBoxTabIndex="40" FieldLabelText="odrb03"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb04" runat="server" DatabaseField="odrb04" FieldTextBoxTabIndex="41" FieldLabelText="odrb04"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb05" runat="server" DatabaseField="odrb05" FieldTextBoxTabIndex="42" FieldLabelText="odrb05"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb06" runat="server" DatabaseField="odrb06" FieldTextBoxTabIndex="43" FieldLabelText="odrb06"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb07" runat="server" DatabaseField="odrb07" FieldTextBoxTabIndex="44" FieldLabelText="odrb07"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb08" runat="server" DatabaseField="odrb08" FieldTextBoxTabIndex="45" FieldLabelText="odrb08"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb09" runat="server" DatabaseField="odrb09" FieldTextBoxTabIndex="46" FieldLabelText="odrb09"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb10" runat="server" DatabaseField="odrb10" FieldTextBoxTabIndex="47" FieldLabelText="odrb10"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb11" runat="server" DatabaseField="odrb11" FieldTextBoxTabIndex="48" FieldLabelText="odrb11"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb12" runat="server" DatabaseField="odrb12" FieldTextBoxTabIndex="49" FieldLabelText="odrb12"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb13" runat="server" DatabaseField="odrb13" FieldTextBoxTabIndex="50" FieldLabelText="odrb13"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb14" runat="server" DatabaseField="odrb14" FieldTextBoxTabIndex="51" FieldLabelText="odrb14"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb15" runat="server" DatabaseField="odrb15" FieldTextBoxTabIndex="52" FieldLabelText="odrb15"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb16" runat="server" DatabaseField="odrb16" FieldTextBoxTabIndex="53" FieldLabelText="odrb16"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb17" runat="server" DatabaseField="odrb17" FieldTextBoxTabIndex="54" FieldLabelText="odrb17"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb18" runat="server" DatabaseField="odrb18" FieldTextBoxTabIndex="55" FieldLabelText="odrb18"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb19" runat="server" DatabaseField="odrb19" FieldTextBoxTabIndex="56" FieldLabelText="odrb19"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb20" runat="server" DatabaseField="odrb20" FieldTextBoxTabIndex="57" FieldLabelText="odrb20"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb21" runat="server" DatabaseField="odrb21" FieldTextBoxTabIndex="58" FieldLabelText="odrb21"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb22" runat="server" DatabaseField="odrb22" FieldTextBoxTabIndex="59" FieldLabelText="odrb22"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb23" runat="server" DatabaseField="odrb23" FieldTextBoxTabIndex="60" FieldLabelText="odrb23"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb24" runat="server" DatabaseField="odrb24" FieldTextBoxTabIndex="61" FieldLabelText="odrb24"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrb25" runat="server" DatabaseField="odrb25" FieldTextBoxTabIndex="62" FieldLabelText="odrb25"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxTextMode="SingleLine" FieldTextBoxWidth="40px"
													FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ODRynB" runat="server" DatabaseField="ODRynB" FieldTextBoxTabIndex="62" FieldLabelText="REV 2 Crit. Met (y or n)?"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="40px" FieldLabelWidth="130px" ValidList="y,n,Y,N"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td><STRONG>Reversal 3</STRONG></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc01" runat="server" DatabaseField="odrc01" FieldTextBoxTabIndex="63" FieldLabelText="odrc01"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc02" runat="server" DatabaseField="odrc02" FieldTextBoxTabIndex="64" FieldLabelText="odrc02"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc03" runat="server" DatabaseField="odrc03" FieldTextBoxTabIndex="65" FieldLabelText="odrc03"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc04" runat="server" DatabaseField="odrc04" FieldTextBoxTabIndex="66" FieldLabelText="odrc04"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc05" runat="server" DatabaseField="odrc05" FieldTextBoxTabIndex="67" FieldLabelText="odrc05"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc06" runat="server" DatabaseField="odrc06" FieldTextBoxTabIndex="68" FieldLabelText="odrc06"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc07" runat="server" DatabaseField="odrc07" FieldTextBoxTabIndex="69" FieldLabelText="odrc07"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc08" runat="server" DatabaseField="odrc08" FieldTextBoxTabIndex="70" FieldLabelText="odrc08"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc09" runat="server" DatabaseField="odrc09" FieldTextBoxTabIndex="71" FieldLabelText="odrc09"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc10" runat="server" DatabaseField="odrc10" FieldTextBoxTabIndex="72" FieldLabelText="odrc10"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc11" runat="server" DatabaseField="odrc11" FieldTextBoxTabIndex="73" FieldLabelText="odrc11"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc12" runat="server" DatabaseField="odrc12" FieldTextBoxTabIndex="74" FieldLabelText="odrc12"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc13" runat="server" DatabaseField="odrc13" FieldTextBoxTabIndex="75" FieldLabelText="odrc13"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc14" runat="server" DatabaseField="odrc14" FieldTextBoxTabIndex="76" FieldLabelText="odrc14"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc15" runat="server" DatabaseField="odrc15" FieldTextBoxTabIndex="77" FieldLabelText="odrc15"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc16" runat="server" DatabaseField="odrc16" FieldTextBoxTabIndex="78" FieldLabelText="odrc16"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc17" runat="server" DatabaseField="odrc17" FieldTextBoxTabIndex="79" FieldLabelText="odrc17"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc18" runat="server" DatabaseField="odrc18" FieldTextBoxTabIndex="80" FieldLabelText="odrc18"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc19" runat="server" DatabaseField="odrc19" FieldTextBoxTabIndex="81" FieldLabelText="odrc19"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc20" runat="server" DatabaseField="odrc20" FieldTextBoxTabIndex="82" FieldLabelText="odrc20"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc21" runat="server" DatabaseField="odrc21" FieldTextBoxTabIndex="83" FieldLabelText="odrc21"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc22" runat="server" DatabaseField="odrc22" FieldTextBoxTabIndex="84" FieldLabelText="odrc22"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc23" runat="server" DatabaseField="odrc23" FieldTextBoxTabIndex="85" FieldLabelText="odrc23"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc24" runat="server" DatabaseField="odrc24" FieldTextBoxTabIndex="86" FieldLabelText="odrc24"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="odrc25" runat="server" DatabaseField="odrc25" FieldTextBoxTabIndex="87" FieldLabelText="odrc25"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,0,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ODRynC" runat="server" DatabaseField="ODRynC" FieldTextBoxTabIndex="87" FieldLabelText="REV 3 Crit. Met (y or n)?"
													IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="40px" FieldLabelWidth="130px" ValidList="y,n,Y,N"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td><def:datafieldcontrol id="ODRVLD" runat="server" DatabaseField="ODRVLD" FieldTextBoxTabIndex="89" FieldLabelText="Validity"
										IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="FLOAT" FieldTextBoxWidth="40px" FieldLabelWidth="60px" ValidList="1,2,3,9"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="ODRBEH" runat="server" DatabaseField="ODRBEH" FieldTextBoxTabIndex="90" FieldLabelText="Behavioral Comments"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="250px"
										FieldTextBoxHeight="150px" FieldLabelWidth="100px" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="ODRCMNT" runat="server" DatabaseField="ODRCMNT" FieldTextBoxTabIndex="91" FieldLabelText="Comments"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="250px"
										FieldTextBoxHeight="150px" FieldLabelWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<table class="layout" id="table_readonly">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
										FieldTextBoxTabIndex="89" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="90" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="91" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="92"
										FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
					</asp:Content>
