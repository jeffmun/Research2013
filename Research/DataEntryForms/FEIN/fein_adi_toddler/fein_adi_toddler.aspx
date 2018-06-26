<%@ Page language="c#" Inherits="FEINDataEntryForms.fein_adi_toddler.fein_adi_toddler" CodeFile="fein_adi_toddler.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="522" ShowScoreButton="True"
							LookupField1DataType="TEXT" DatabaseTable="fein_adi_toddler" LookupTextBox1LabelText="FEIN ID:" LookupTextBox2Visible="False"
							MeasureName="FEIN Toddler ADI" PrimaryKeyField="adi_toddler_pk" VerifiedField="verified" LookupField1="id" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<A id="showreportlink" href="javascript:showADIReport();">Click to View Scoring 
							Summary</A><br>
						<script language="javascript">


//Called by link in ADI data entry forms to display ADI scoring report
function showADIReport()
{


	var oIDField = document.getElementById("ctl00_oBodyPlaceHolder_id_fieldTextBox");
	var sID = oIDField.value;
	if (sID == "")
		alert("Lookup an existing ADI or enter and score a new one first.");
	else
		open("adi-toddlerreport.aspx?ID=" + sID);
		
}
						</script>
						<table class="layout" id="table_insert">
							<tr>
								<td style="vertical-align:top" width="215">
									<table>
										<tr>
											<td><def:datafieldcontrol id="id" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="id"
													FieldTextBoxTabIndex="2" FieldLabelText="FEIN ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Addate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="Addate"
													FieldTextBoxTabIndex="3" FieldLabelText="Interview Date" IsDoubleEntryField="True" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True"
													FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Adint" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="Adint"
													FieldTextBoxTabIndex="4" FieldLabelText="Interviewer" IsDoubleEntryField="False" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td><def:datafieldcontrol id="Adinf" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="150px" DatabaseField="Adinf"
													FieldTextBoxTabIndex="5" FieldLabelText="Informant  (0=mom, 1=dad, 2=other caregiver, 3=combination, 4=sibling, 5=other, 9=Missing) "
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="AdDOB" runat="server" FieldLabelWidth="60px" DatabaseField="AdDOB" FieldTextBoxTabIndex="4"
													FieldLabelText="DOB:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
													IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADageym" runat="server" FieldLabelWidth="60px" DatabaseField="ADageym" FieldTextBoxTabIndex="6"
													FieldLabelText="AGE Y-M:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="100px" DatabaseField="scorcmnt"
							FieldTextBoxTabIndex="6" FieldLabelText="Scoring Errors:" IsDoubleEntryField="False" IsReadOnly="True"
							IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
							FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
						<br>
						<asp:panel id="mainPanel" Runat="server">Enter all ages using 3 digits. For example enter 40 as 040 
      <TABLE>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="AD001" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD001"
														FieldTextBoxTabIndex="14" DatabaseField="AD001" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[126789])$" RegExDescription="Value must be 3 digits or 991, 992, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD002a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD002a"
														FieldTextBoxTabIndex="15" DatabaseField="AD002a" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,5,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD002b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD002b"
														FieldTextBoxTabIndex="16" DatabaseField="AD002b" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,5,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD002c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD002c"
														FieldTextBoxTabIndex="17" DatabaseField="AD002c" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,5,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD002d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD002d"
														FieldTextBoxTabIndex="18" DatabaseField="AD002d" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,5,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD003" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD003"
														FieldTextBoxTabIndex="19" DatabaseField="AD003" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[126789])$" RegExDescription="Value must be 3 digits or 991, 992, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD004" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD004"
														FieldTextBoxTabIndex="20" DatabaseField="AD004" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[126789])$" RegExDescription="Value must be 3 digits or 991, 992, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD005" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD005"
														FieldTextBoxTabIndex="21" DatabaseField="AD005" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[126789])$" RegExDescription="Value must be 3 digits or 991, 992, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD006" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD006"
														FieldTextBoxTabIndex="22" DatabaseField="AD006" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[126789])$" RegExDescription="Value must be 3 digits or 991, 992, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD007" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD007"
														FieldTextBoxTabIndex="23" DatabaseField="AD007" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[46789])$" RegExDescription="Value must be 3 digits or 994, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD008" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD008"
														FieldTextBoxTabIndex="24" DatabaseField="AD008" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[46789])$" RegExDescription="Value must be 3 digits or 994, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD009" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD009"
														FieldTextBoxTabIndex="25" DatabaseField="AD009" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[369])$" RegExDescription="Value must be 3 digits or 993, 996, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD010a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD010a"
														FieldTextBoxTabIndex="26" DatabaseField="AD010a" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[35789])$" RegExDescription="Value must be 3 digits or 993, 995, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD010b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD010b"
														FieldTextBoxTabIndex="27" DatabaseField="AD010b" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD011" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD011"
														FieldTextBoxTabIndex="28" DatabaseField="AD011" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[346789])$" RegExDescription="Value must be 3 digits or 993, 994, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD012a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD012a"
														FieldTextBoxTabIndex="29" DatabaseField="AD012a" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[346789])$" RegExDescription="Value must be 3 digits or 993, 994, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD012b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD012b"
														FieldTextBoxTabIndex="30" DatabaseField="AD012b" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD013cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD013cu"
														FieldTextBoxTabIndex="31" DatabaseField="AD013cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD014cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD014cu"
														FieldTextBoxTabIndex="32" DatabaseField="AD014cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD014ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD014ev"
														FieldTextBoxTabIndex="33" DatabaseField="AD014ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD015ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD015ev"
														FieldTextBoxTabIndex="34" DatabaseField="AD015ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD016" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD016"
														FieldTextBoxTabIndex="35" DatabaseField="AD016" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,3,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD017" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD017"
														FieldTextBoxTabIndex="36" DatabaseField="AD017" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[46789])$" RegExDescription="Value must be 3 digits or 994, 996, 997, 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD018" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD018"
														FieldTextBoxTabIndex="37" DatabaseField="AD018" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0][0-9][0-9]|100)$" RegExDescription="Value must be 3 digits or 100"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD019" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD019"
														FieldTextBoxTabIndex="38" DatabaseField="AD019" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[4679])$" RegExDescription="Value must be 3 digits or  994, 996, 997, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD020cua" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD020cua"
														FieldTextBoxTabIndex="39" DatabaseField="AD020cua" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD020cub" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD020cub"
														FieldTextBoxTabIndex="40" DatabaseField="AD020cub" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD021cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD021cu"
														FieldTextBoxTabIndex="41" DatabaseField="AD021cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD022cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD022cu"
														FieldTextBoxTabIndex="42" DatabaseField="AD022cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD022ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD022ev"
														FieldTextBoxTabIndex="43" DatabaseField="AD022ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD023cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD023cu"
														FieldTextBoxTabIndex="44" DatabaseField="AD023cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD023ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD023ev"
														FieldTextBoxTabIndex="45" DatabaseField="AD023ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD024cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD024cu"
														FieldTextBoxTabIndex="46" DatabaseField="AD024cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD025cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD025cu"
														FieldTextBoxTabIndex="47" DatabaseField="AD025cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD026cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD026cu"
														FieldTextBoxTabIndex="48" DatabaseField="AD026cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD026ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD026ev"
														FieldTextBoxTabIndex="49" DatabaseField="AD026ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD027cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD027cu"
														FieldTextBoxTabIndex="50" DatabaseField="AD027cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD027ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD027ev"
														FieldTextBoxTabIndex="51" DatabaseField="AD027ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD028cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD028cu"
														FieldTextBoxTabIndex="52" DatabaseField="AD028cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD028ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD028ev"
														FieldTextBoxTabIndex="53" DatabaseField="AD028ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD029cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD029cu"
														FieldTextBoxTabIndex="54" DatabaseField="AD029cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD030cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD030cu"
														FieldTextBoxTabIndex="55" DatabaseField="AD030cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD030ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD030ev"
														FieldTextBoxTabIndex="56" DatabaseField="AD030ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD031cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD031cu"
														FieldTextBoxTabIndex="57" DatabaseField="AD031cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD032cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD032cu"
														FieldTextBoxTabIndex="58" DatabaseField="AD032cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD033cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD033cu"
														FieldTextBoxTabIndex="59" DatabaseField="AD033cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD034cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD034cu"
														FieldTextBoxTabIndex="60" DatabaseField="AD034cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD035cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD035cu"
														FieldTextBoxTabIndex="61" DatabaseField="AD035cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD036cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD036cu"
														FieldTextBoxTabIndex="62" DatabaseField="AD036cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD037cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD037cu"
														FieldTextBoxTabIndex="63" DatabaseField="AD037cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD038cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD038cu"
														FieldTextBoxTabIndex="64" DatabaseField="AD038cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="AD039cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD039cu"
														FieldTextBoxTabIndex="65" DatabaseField="AD039cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD040cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD040cu"
														FieldTextBoxTabIndex="66" DatabaseField="AD040cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD041cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD041cu"
														FieldTextBoxTabIndex="67" DatabaseField="AD041cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD042cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD042cu"
														FieldTextBoxTabIndex="68" DatabaseField="AD042cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD042ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD042ev"
														FieldTextBoxTabIndex="69" DatabaseField="AD042ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD043ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD043ev"
														FieldTextBoxTabIndex="70" DatabaseField="AD043ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD044ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD044ev"
														FieldTextBoxTabIndex="71" DatabaseField="AD044ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD045ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD045ev"
														FieldTextBoxTabIndex="72" DatabaseField="AD045ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD046ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD046ev"
														FieldTextBoxTabIndex="73" DatabaseField="AD046ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD047ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD047ev"
														FieldTextBoxTabIndex="74" DatabaseField="AD047ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD048ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD048ev"
														FieldTextBoxTabIndex="75" DatabaseField="AD048ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD049ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD049ev"
														FieldTextBoxTabIndex="76" DatabaseField="AD049ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD050" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD050"
														FieldTextBoxTabIndex="77" DatabaseField="AD050" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD051" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD051"
														FieldTextBoxTabIndex="78" DatabaseField="AD051" FieldLabelWidth="70px" FieldTextBoxWidth="40px" FormatString="{0:000}"
														RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD052cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD052cu"
														FieldTextBoxTabIndex="79" DatabaseField="AD052cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD053cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD053cu"
														FieldTextBoxTabIndex="80" DatabaseField="AD053cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD054cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD054cu"
														FieldTextBoxTabIndex="81" DatabaseField="AD054cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD055cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD055cu"
														FieldTextBoxTabIndex="82" DatabaseField="AD055cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD056cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD056cu"
														FieldTextBoxTabIndex="83" DatabaseField="AD056cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD057cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD057cu"
														FieldTextBoxTabIndex="84" DatabaseField="AD057cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD058cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD058cu"
														FieldTextBoxTabIndex="85" DatabaseField="AD058cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD059cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD059cu"
														FieldTextBoxTabIndex="86" DatabaseField="AD059cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD060cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD060cu"
														FieldTextBoxTabIndex="87" DatabaseField="AD060cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD061cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD061cu"
														FieldTextBoxTabIndex="88" DatabaseField="AD061cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD062cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD062cu"
														FieldTextBoxTabIndex="89" DatabaseField="AD062cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD063cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD063cu"
														FieldTextBoxTabIndex="90" DatabaseField="AD063cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD064cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD064cu"
														FieldTextBoxTabIndex="91" DatabaseField="AD064cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD065cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD065cu"
														FieldTextBoxTabIndex="92" DatabaseField="AD065cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD066cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD066cu"
														FieldTextBoxTabIndex="93" DatabaseField="AD066cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD067cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD067cu"
														FieldTextBoxTabIndex="94" DatabaseField="AD067cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD068cu"
														FieldTextBoxTabIndex="95" DatabaseField="AD068cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD068ev"
														FieldTextBoxTabIndex="96" DatabaseField="AD068ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD069cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD069cu"
														FieldTextBoxTabIndex="97" DatabaseField="AD069cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD070cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD070cu"
														FieldTextBoxTabIndex="98" DatabaseField="AD070cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD071cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD071cu"
														FieldTextBoxTabIndex="99" DatabaseField="AD071cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD072cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD072cu"
														FieldTextBoxTabIndex="100" DatabaseField="AD072cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD072inf" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD072inf"
														FieldTextBoxTabIndex="101" DatabaseField="AD072inf" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD073cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD073cu"
														FieldTextBoxTabIndex="102" DatabaseField="AD073cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD073inf" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD073inf"
														FieldTextBoxTabIndex="103" DatabaseField="AD073inf" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD074cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD074cu"
														FieldTextBoxTabIndex="104" DatabaseField="AD074cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD074inf" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD074inf"
														FieldTextBoxTabIndex="105" DatabaseField="AD074inf" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD075cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD075cu"
														FieldTextBoxTabIndex="106" DatabaseField="AD075cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD076cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD076cu"
														FieldTextBoxTabIndex="107" DatabaseField="AD076cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD077cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD077cu"
														FieldTextBoxTabIndex="108" DatabaseField="AD077cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="AD078cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD078cu"
														FieldTextBoxTabIndex="109" DatabaseField="AD078cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD078typ" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD078typ"
														FieldTextBoxTabIndex="110" DatabaseField="AD078typ" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD079cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD079cu"
														FieldTextBoxTabIndex="111" DatabaseField="AD079cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD080cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD080cu"
														FieldTextBoxTabIndex="112" DatabaseField="AD080cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD081cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD081cu"
														FieldTextBoxTabIndex="113" DatabaseField="AD081cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD082cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD082cu"
														FieldTextBoxTabIndex="114" DatabaseField="AD082cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD083cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD083cu"
														FieldTextBoxTabIndex="115" DatabaseField="AD083cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD084cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD084cu"
														FieldTextBoxTabIndex="116" DatabaseField="AD084cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD085cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD085cu"
														FieldTextBoxTabIndex="117" DatabaseField="AD085cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD086cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD086cu"
														FieldTextBoxTabIndex="118" DatabaseField="AD086cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD087cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD087cu"
														FieldTextBoxTabIndex="119" DatabaseField="AD087cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD088cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD088cu"
														FieldTextBoxTabIndex="120" DatabaseField="AD088cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD089cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD089cu"
														FieldTextBoxTabIndex="121" DatabaseField="AD089cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD090cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD090cu"
														FieldTextBoxTabIndex="122" DatabaseField="AD090cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD091cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD091cu"
														FieldTextBoxTabIndex="123" DatabaseField="AD091cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD091age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD091age"
														FieldTextBoxTabIndex="124" DatabaseField="AD091age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD091ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD091ev"
														FieldTextBoxTabIndex="125" DatabaseField="AD091ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD092cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD092cu"
														FieldTextBoxTabIndex="126" DatabaseField="AD092cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD092age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD092age"
														FieldTextBoxTabIndex="127" DatabaseField="AD092age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD092ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD092ev"
														FieldTextBoxTabIndex="128" DatabaseField="AD092ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD093cu"
														FieldTextBoxTabIndex="129" DatabaseField="AD093cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD093age"
														FieldTextBoxTabIndex="130" DatabaseField="AD093age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD093ev"
														FieldTextBoxTabIndex="131" DatabaseField="AD093ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD094cu"
														FieldTextBoxTabIndex="132" DatabaseField="AD094cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD094age"
														FieldTextBoxTabIndex="133" DatabaseField="AD094age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD094ev"
														FieldTextBoxTabIndex="134" DatabaseField="AD094ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD095cu"
														FieldTextBoxTabIndex="135" DatabaseField="AD095cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD095age"
														FieldTextBoxTabIndex="136" DatabaseField="AD095age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD095ev"
														FieldTextBoxTabIndex="137" DatabaseField="AD095ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD096cu"
														FieldTextBoxTabIndex="138" DatabaseField="AD096cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD096age"
														FieldTextBoxTabIndex="139" DatabaseField="AD096age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD096ev"
														FieldTextBoxTabIndex="140" DatabaseField="AD096ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD097cu"
														FieldTextBoxTabIndex="141" DatabaseField="AD097cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD097age"
														FieldTextBoxTabIndex="142" DatabaseField="AD097age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD097ev"
														FieldTextBoxTabIndex="143" DatabaseField="AD097ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD098cu"
														FieldTextBoxTabIndex="144" DatabaseField="AD098cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD098age"
														FieldTextBoxTabIndex="145" DatabaseField="AD098age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD098ev"
														FieldTextBoxTabIndex="146" DatabaseField="AD098ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD099cu"
														FieldTextBoxTabIndex="147" DatabaseField="AD099cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099age" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD099age"
														FieldTextBoxTabIndex="148" DatabaseField="AD099age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD099ev"
														FieldTextBoxTabIndex="149" DatabaseField="AD099ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,7,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD100cu"
														FieldTextBoxTabIndex="150" DatabaseField="AD100cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100ag" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD100ag"
														FieldTextBoxTabIndex="151" DatabaseField="AD100ag" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD100ev"
														FieldTextBoxTabIndex="152" DatabaseField="AD100ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD101cu"
														FieldTextBoxTabIndex="153" DatabaseField="AD101cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101ag" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD101ag"
														FieldTextBoxTabIndex="154" DatabaseField="AD101ag" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD101ev"
														FieldTextBoxTabIndex="155" DatabaseField="AD101ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD102cu"
														FieldTextBoxTabIndex="156" DatabaseField="AD102cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102ag" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD102ag"
														FieldTextBoxTabIndex="157" DatabaseField="AD102ag" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD102ev"
														FieldTextBoxTabIndex="158" DatabaseField="AD102ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD103cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD103cu"
														FieldTextBoxTabIndex="159" DatabaseField="AD103cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD103ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD103ev"
														FieldTextBoxTabIndex="160" DatabaseField="AD103ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD104cu"
														FieldTextBoxTabIndex="161" DatabaseField="AD104cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104ag" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD104ag"
														FieldTextBoxTabIndex="162" DatabaseField="AD104ag" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD104ev"
														FieldTextBoxTabIndex="163" DatabaseField="AD104ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD105cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD105cu"
														FieldTextBoxTabIndex="164" DatabaseField="AD105cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD105ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD105ev"
														FieldTextBoxTabIndex="165" DatabaseField="AD105ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD106cu"
														FieldTextBoxTabIndex="166" DatabaseField="AD106cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD106ev"
														FieldTextBoxTabIndex="167" DatabaseField="AD106ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD107cu"
														FieldTextBoxTabIndex="168" DatabaseField="AD107cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD107ev"
														FieldTextBoxTabIndex="169" DatabaseField="AD107ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD108cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD108cu"
														FieldTextBoxTabIndex="170" DatabaseField="AD108cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD109cu"
														FieldTextBoxTabIndex="171" DatabaseField="AD109cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD109ev"
														FieldTextBoxTabIndex="172" DatabaseField="AD109ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD110" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD110"
														FieldTextBoxTabIndex="173" DatabaseField="AD110" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD111" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD111"
														FieldTextBoxTabIndex="174" DatabaseField="AD111" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD112" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD112"
														FieldTextBoxTabIndex="175" DatabaseField="AD112" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD113" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD113"
														FieldTextBoxTabIndex="176" DatabaseField="AD113" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD114" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD114"
														FieldTextBoxTabIndex="177" DatabaseField="AD114" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD115" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD115"
														FieldTextBoxTabIndex="178" DatabaseField="AD115" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD116" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD116"
														FieldTextBoxTabIndex="179" DatabaseField="AD116" FieldLabelWidth="70px" FieldTextBoxWidth="40px" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD117" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD117age"
														FieldTextBoxTabIndex="180" DatabaseField="AD117age" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														FormatString="{0:000}" RegEx="^([0-8][0-8][0-9]|99[89])$" RegExDescription="Value must be 3 digits or 998, 999"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD118cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD118cu"
														FieldTextBoxTabIndex="181" DatabaseField="AD118cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD118ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD118ev"
														FieldTextBoxTabIndex="182" DatabaseField="AD118ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD119cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD119cu"
														FieldTextBoxTabIndex="183" DatabaseField="AD119cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD119ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD119ev"
														FieldTextBoxTabIndex="184" DatabaseField="AD119ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD120cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD120cu"
														FieldTextBoxTabIndex="185" DatabaseField="AD120cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD120ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD120ev"
														FieldTextBoxTabIndex="186" DatabaseField="AD120ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD121cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD121cu"
														FieldTextBoxTabIndex="187" DatabaseField="AD121cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD121ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD121ev"
														FieldTextBoxTabIndex="188" DatabaseField="AD121ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD122cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD122cu"
														FieldTextBoxTabIndex="189" DatabaseField="AD122cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD122ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD122ev"
														FieldTextBoxTabIndex="190" DatabaseField="AD122ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD123cu" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD123cu"
														FieldTextBoxTabIndex="191" DatabaseField="AD123cu" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD123ev" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AD123ev"
														FieldTextBoxTabIndex="192" DatabaseField="AD123ev" FieldLabelWidth="70px" FieldTextBoxWidth="40px"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE><BR>
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
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="291" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="292" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE></asp:panel></asp:Content>
