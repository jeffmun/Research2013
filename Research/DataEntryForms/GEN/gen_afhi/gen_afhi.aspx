<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="gen_afhi.gen_afhi" CodeFile="gen_afhi.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_afhi" LookupField1="indid"
							LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN Autism FHI" PrimaryKeyField="afhi_pk"
							VerifiedField="verified" StudyMeasID="285"></def:dataentrycontroller>
						<table id="table_insert" class="tblinsert">
							<tr>
								<td><def:datafieldcontrol id="indid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="4" DatabaseField="indid" FieldLabelWidth="80px" FieldTextBoxWidth="80px" MinVal="0"
										MaxVal="99999"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="fhdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interview Date"
										FieldTextBoxTabIndex="2" DatabaseField="fhdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="fh01" runat="server" FieldTextBoxWidth="80px" DatabaseField="fh01" FieldTextBoxTabIndex="3"
											FieldLabelText="1. Family ID" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh03" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh03" FieldTextBoxTabIndex="5"
											FieldLabelText="3. Generation number" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh04" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh04" FieldTextBoxTabIndex="6"
											FieldLabelText="4. Relationship to proband" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,7,8"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fh04oth" runat="server" DatabaseField="fh04oth" FieldTextBoxTabIndex="7" FieldLabelText="(specify other)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh05" runat="server" MaxVal="99999" MinVal="0" DatabaseField="fh05" FieldTextBoxTabIndex="8"
											FieldLabelText="5. Biological mother's id" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh06" runat="server" MaxVal="99999" MinVal="0" DatabaseField="fh06" FieldTextBoxTabIndex="9"
											FieldLabelText="6. Biological father's id" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh07" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh07" FieldTextBoxTabIndex="10"
											FieldLabelText="7. Subject adopted" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh08" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh08" FieldTextBoxTabIndex="11"
											FieldLabelText="8. Sex of subject" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fhdob" runat="server" DatabaseField="fhdob" FieldTextBoxTabIndex="12" FieldLabelText="9,10,11 Subject DOB"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh13" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh13" FieldTextBoxTabIndex="17"
											FieldLabelText="13. Birth order" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RegEx="^([0-9]|1[0-3]|99)$"
											RegExDescription="Value must be between 0 and 13 or 99"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh14" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh14" FieldTextBoxTabIndex="18"
											FieldLabelText="14. Social sibship order" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh15" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh15" FieldTextBoxTabIndex="19"
											FieldLabelText="15. Side of family" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh16" runat="server" MaxVal="999" MinVal="0" FieldTextBoxWidth="50px" DatabaseField="fh16"
											FieldTextBoxTabIndex="20" FieldLabelText="16. Age at death" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh17" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh17" FieldTextBoxTabIndex="21"
											FieldLabelText="17. Marital status" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh18" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh18" FieldTextBoxTabIndex="22"
											FieldLabelText="18. Consanguineous marriage" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fh18b" runat="server" DatabaseField="fh18b" FieldTextBoxTabIndex="23" FieldLabelText="(specify relationship)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh19" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh19" FieldTextBoxTabIndex="24"
											FieldLabelText="19. Offspring of consanguineous parents" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fh19b" runat="server" DatabaseField="fh19b" FieldTextBoxTabIndex="25" FieldLabelText="(specify details)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh20" runat="server" MaxVal="9" MinVal="0" FieldTextBoxWidth="50px" DatabaseField="fh20"
											FieldTextBoxTabIndex="26" FieldLabelText="20. Number of marriages" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh21" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh21" FieldTextBoxTabIndex="27"
											FieldLabelText="21. Education" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,6,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh22" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh22" FieldTextBoxTabIndex="28"
											FieldLabelText="22. Occupation" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh23" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh23" FieldTextBoxTabIndex="29"
											FieldLabelText="23. Inapplicability" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh24" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh24" FieldTextBoxTabIndex="30"
											FieldLabelText="24. Peculiar gait" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh25" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh25" FieldTextBoxTabIndex="31"
											FieldLabelText="25. Epilepsy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh30" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh30" FieldTextBoxTabIndex="32"
											FieldLabelText="30. Social disorder" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh31" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh31" FieldTextBoxTabIndex="33"
											FieldLabelText="31. Lack of affection" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh32" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh32" FieldTextBoxTabIndex="34"
											FieldLabelText="32. Impaired social play" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh33" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh33" FieldTextBoxTabIndex="35"
											FieldLabelText="33. Circumscribed interests (childhood)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh34" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh34" FieldTextBoxTabIndex="36"
											FieldLabelText="34. Circumscribed interests (adultdhood)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh35" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh35" FieldTextBoxTabIndex="37"
											FieldLabelText="35. Impaired friendships (childhood)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh36" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh36" FieldTextBoxTabIndex="38"
											FieldLabelText="36. Impaired friendships (adulthood)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh37" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh37" FieldTextBoxTabIndex="39"
											FieldLabelText="37. Shyness (childhood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh38" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh38" FieldTextBoxTabIndex="40"
											FieldLabelText="38. Shyness (adulthood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh39" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh39" FieldTextBoxTabIndex="41"
											FieldLabelText="39. Lack of conversation (childhood)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh40" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh40" FieldTextBoxTabIndex="42"
											FieldLabelText="40. Impaired conversation (adulthood)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh41" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh41" FieldTextBoxTabIndex="43"
											FieldLabelText="41. Social dysfunction (childhood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh42" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh42" FieldTextBoxTabIndex="44"
											FieldLabelText="42. Social dysfunction (adulthood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh43" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh43" FieldTextBoxTabIndex="45"
											FieldLabelText="43. Socially odd (childhood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh44" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh44" FieldTextBoxTabIndex="46"
											FieldLabelText="44. Socially odd (adulthood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh45" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh45" FieldTextBoxTabIndex="47"
											FieldLabelText="45. Over-sensitive (childhood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh46" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh46" FieldTextBoxTabIndex="48"
											FieldLabelText="46. Over-sensitive (adulthood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh47" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh47" FieldTextBoxTabIndex="49"
											FieldLabelText="47. Rigid style (childhood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh48" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh48" FieldTextBoxTabIndex="50"
											FieldLabelText="48. Rigid style (adulthood)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh49" runat="server" DatabaseField="fh49" FieldTextBoxTabIndex="51" FieldLabelText="49. Impairment in social interaction"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh50" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh50" FieldTextBoxTabIndex="52"
											FieldLabelText="50. Impairment in communication" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh51" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh51" FieldTextBoxTabIndex="53"
											FieldLabelText="51. Repetitive behavior" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh52" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh52" FieldTextBoxTabIndex="54"
											FieldLabelText="52. Age abnormalities manifest" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh53" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh53" FieldTextBoxTabIndex="55"
											FieldLabelText="53. Autism" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,6,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh64" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh64" FieldTextBoxTabIndex="56"
											FieldLabelText="64. Quality of information" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh65" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh65" FieldTextBoxTabIndex="57"
											FieldLabelText="65. Informant ID" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fh66" runat="server" FieldTextBoxWidth="50px" DatabaseField="fh66" FieldTextBoxTabIndex="58"
											FieldLabelText="66. Interviewer's Initials" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="fhcmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="fhcmnt" FieldTextBoxTabIndex="59"
											FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="100"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="61"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="62"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="63"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="64"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
