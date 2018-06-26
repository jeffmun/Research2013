<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="face_adi.face_adi_wps" CodeFile="face_adi_wps.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="411" LookupField1DataType="TEXT"
							ShowScoreButton="True" VerifiedField="verified" PrimaryKeyField="adi_pk" MeasureName="FACE ADI-R WPS Edition"
							LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="face_adi" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<A id="showreportlink" href="javascript:showADIReport('IDfield_fieldTextBox', 'FACEADI.aspx');">
							Click to View Scoring Summary</A><br>
						<br>
						<div class="divDataEntryFields">
							<table class="tblinsert" id="table_insert" height="291">
								<tr>
									<td><def:datafieldcontrol id="IDfield" runat="server" RegExDescription="FACE ID must  look like FACE###" RegEx="^[F][A][C][E][0-9][0-9][0-9]$"
											FieldLabelWidth="70px" FieldTextBoxWidth="100px" DatabaseField="ID" FieldTextBoxTabIndex="4" FieldLabelText="FACE ID"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
											IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="adsex" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="50px" DatabaseField="adsex"
											FieldTextBoxTabIndex="5" FieldLabelText="sex  (0=male, 1=female)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="adrelat" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="50px" DatabaseField="adinf"
											FieldTextBoxTabIndex="6" FieldLabelText="Informant  (0=mom, 1=dad, 2=other caregiver, 3=combination, 4=sibling, 5=other) "
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
											IsInsertField="True" FieldDataType="INT" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="addate" runat="server" FieldLabelWidth="70px" FieldTextBoxWidth="70px" DatabaseField="addate"
											FieldTextBoxTabIndex="7" FieldLabelText="Test date" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True"
											FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="adDOB" runat="server" FieldLabelWidth="70px" FieldTextBoxWidth="70px" DatabaseField="adDOB"
											FieldTextBoxTabIndex="8" FieldLabelText="Birth date:" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="adint" runat="server" FieldLabelWidth="70px" FieldTextBoxWidth="50px" DatabaseField="adint"
											FieldTextBoxTabIndex="17" FieldLabelText="Interviewer initials" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True"
											FieldDataType="TEXT"></def:datafieldcontrol></td>
								</tr>
							</table>
							<br>
							<table>
								<tr>
									<td width="194">
										<table class="tblentry">
											<tr>
												<td><def:datafieldcontrol id="ad002" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad002"
														FieldTextBoxTabIndex="18" FieldLabelText="02. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad004" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad004"
														FieldTextBoxTabIndex="19" FieldLabelText="04. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad005" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad005"
														FieldTextBoxTabIndex="20" FieldLabelText="05. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="999"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad006" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad006"
														FieldTextBoxTabIndex="21" FieldLabelText="06. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="999"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad007" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad007"
														FieldTextBoxTabIndex="22" FieldLabelText="07. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="999"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad008" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad008"
														FieldTextBoxTabIndex="23" FieldLabelText="08. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="999"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad009" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad009"
														FieldTextBoxTabIndex="24" FieldLabelText="09. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad010" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad010"
														FieldTextBoxTabIndex="25" FieldLabelText="10. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad011ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad011ev"
														FieldTextBoxTabIndex="26" FieldLabelText="11. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1" CallOnBlur="face_adi_wps_onBlur"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad012ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad012ev"
														FieldTextBoxTabIndex="27" FieldLabelText="12. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad013ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad013ev"
														FieldTextBoxTabIndex="28" FieldLabelText="13. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad014ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad014ev"
														FieldTextBoxTabIndex="29" FieldLabelText="14. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad015ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad015ev"
														FieldTextBoxTabIndex="30" FieldLabelText="15. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad016ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad016ev"
														FieldTextBoxTabIndex="31" FieldLabelText="16. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad017" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad017"
														FieldTextBoxTabIndex="32" FieldLabelText="17. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad018ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad018ev"
														FieldTextBoxTabIndex="33" FieldLabelText="18. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad019" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad019"
														FieldTextBoxTabIndex="34" FieldLabelText="19. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad020ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad020ev"
														FieldTextBoxTabIndex="35" FieldLabelText="20. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9" CallOnBlur="face_adi_wps_onBlur"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad021ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad021ev"
														FieldTextBoxTabIndex="36" FieldLabelText="21. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad022ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad022ev"
														FieldTextBoxTabIndex="37" FieldLabelText="22. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad023ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad023ev"
														FieldTextBoxTabIndex="38" FieldLabelText="23. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad024ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad024ev"
														FieldTextBoxTabIndex="39" FieldLabelText="24. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad025ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad025ev"
														FieldTextBoxTabIndex="40" FieldLabelText="25. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad026" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad026"
														FieldTextBoxTabIndex="41" FieldLabelText="26. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad027ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad027ev"
														FieldTextBoxTabIndex="42" FieldLabelText="27. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad028" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad028"
														FieldTextBoxTabIndex="43" FieldLabelText="28. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad029cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad029cu"
														FieldTextBoxTabIndex="44" FieldLabelText="29. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,4,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad029mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad029mo"
														FieldTextBoxTabIndex="45" FieldLabelText="29. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,4,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad030cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad030cu"
														FieldTextBoxTabIndex="46" FieldLabelText="30. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2" CallOnBlur="face_adi_wps_onBlur"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad031cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad031cu"
														FieldTextBoxTabIndex="47" FieldLabelText="31. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad031ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad031ev"
														FieldTextBoxTabIndex="48" FieldLabelText="31. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad032cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad032cu"
														FieldTextBoxTabIndex="49" FieldLabelText="32. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad032at" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad032at"
														FieldTextBoxTabIndex="50" FieldLabelText="32. At 5.0 Years" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td height="27"><def:datafieldcontrol id="ad033cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad033cu"
														FieldTextBoxTabIndex="51" FieldLabelText="33. (current)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad033ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad033ev"
														FieldTextBoxTabIndex="52" FieldLabelText="33. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad034cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad034cu"
														FieldTextBoxTabIndex="53" FieldLabelText="34. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad034ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad034ev"
														FieldTextBoxTabIndex="54" FieldLabelText="34. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad035cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad035cu"
														FieldTextBoxTabIndex="55" FieldLabelText="35. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad035ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad035ev"
														FieldTextBoxTabIndex="56" FieldLabelText="35. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad036cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad036cu"
														FieldTextBoxTabIndex="57" FieldLabelText="36. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad036ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad036ev"
														FieldTextBoxTabIndex="58" FieldLabelText="36. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad037cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad037cu"
														FieldTextBoxTabIndex="59" FieldLabelText="37. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad037ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad037ev"
														FieldTextBoxTabIndex="60" FieldLabelText="37. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad038cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad038cu"
														FieldTextBoxTabIndex="61" FieldLabelText="38. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad038ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad038ev"
														FieldTextBoxTabIndex="62" FieldLabelText="38. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad039cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad039cu"
														FieldTextBoxTabIndex="63" FieldLabelText="39. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad039ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad039ev"
														FieldTextBoxTabIndex="64" FieldLabelText="39. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad040cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad040cu"
														FieldTextBoxTabIndex="65" FieldLabelText="40. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad040ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad040ev"
														FieldTextBoxTabIndex="66" FieldLabelText="40. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad041cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad041cu"
														FieldTextBoxTabIndex="67" FieldLabelText="41. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad041at" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad041at"
														FieldTextBoxTabIndex="68" FieldLabelText="41. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
										</table>
									</td>
									<td width="206">
										<table>
											<tr>
												<td><def:datafieldcontrol id="ad042cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad042cu"
														FieldTextBoxTabIndex="69" FieldLabelText="42. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad042mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad042mo"
														FieldTextBoxTabIndex="70" FieldLabelText="42. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad043cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad043cu"
														FieldTextBoxTabIndex="71" FieldLabelText="43. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad043mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad043mo"
														FieldTextBoxTabIndex="72" FieldLabelText="43. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad044cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad044cu"
														FieldTextBoxTabIndex="73" FieldLabelText="44. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad044mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad044mo"
														FieldTextBoxTabIndex="74" FieldLabelText="44. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad045cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad045cu"
														FieldTextBoxTabIndex="75" FieldLabelText="45. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad045mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad045mo"
														FieldTextBoxTabIndex="76" FieldLabelText="45. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad046cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad046cu"
														FieldTextBoxTabIndex="77" FieldLabelText="46. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad046mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad046mo"
														FieldTextBoxTabIndex="78" FieldLabelText="46. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad047cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad047cu"
														FieldTextBoxTabIndex="79" FieldLabelText="47. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad047mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad047mo"
														FieldTextBoxTabIndex="80" FieldLabelText="47. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad048cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad048cu"
														FieldTextBoxTabIndex="81" FieldLabelText="48. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad048mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad048mo"
														FieldTextBoxTabIndex="82" FieldLabelText="48. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad049cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad049cu"
														FieldTextBoxTabIndex="83" FieldLabelText="49. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad049mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad049mo"
														FieldTextBoxTabIndex="84" FieldLabelText="49. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad050cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad050cu"
														FieldTextBoxTabIndex="85" FieldLabelText="50. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad050mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad050mo"
														FieldTextBoxTabIndex="86" FieldLabelText="50. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad051cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad051cu"
														FieldTextBoxTabIndex="87" FieldLabelText="51. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad051mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad051mo"
														FieldTextBoxTabIndex="88" FieldLabelText="51. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad052cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad052cu"
														FieldTextBoxTabIndex="89" FieldLabelText="52. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad052mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad052mo"
														FieldTextBoxTabIndex="90" FieldLabelText="52. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad053cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad053cu"
														FieldTextBoxTabIndex="91" FieldLabelText="53. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad053mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad053mo"
														FieldTextBoxTabIndex="92" FieldLabelText="53. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad054cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad054cu"
														FieldTextBoxTabIndex="93" FieldLabelText="54. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad054mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad054mo"
														FieldTextBoxTabIndex="94" FieldLabelText="54. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad055cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad055cu"
														FieldTextBoxTabIndex="95" FieldLabelText="55. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad055mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad055mo"
														FieldTextBoxTabIndex="96" FieldLabelText="55. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad056cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad056cu"
														FieldTextBoxTabIndex="97" FieldLabelText="56. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad056mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad056mo"
														FieldTextBoxTabIndex="98" FieldLabelText="56. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad057cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad057cu"
														FieldTextBoxTabIndex="99" FieldLabelText="57. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad057mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad057mo"
														FieldTextBoxTabIndex="100" FieldLabelText="57. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad058cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad058cu"
														FieldTextBoxTabIndex="101" FieldLabelText="58. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad058ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad058ev"
														FieldTextBoxTabIndex="102" FieldLabelText="58. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad059cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad059cu"
														FieldTextBoxTabIndex="103" FieldLabelText="59. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad059mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad059mo"
														FieldTextBoxTabIndex="104" FieldLabelText="59. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad060cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad060cu"
														FieldTextBoxTabIndex="105" FieldLabelText="60. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad060mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad060mo"
														FieldTextBoxTabIndex="106" FieldLabelText="60. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad061cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad061cu"
														FieldTextBoxTabIndex="107" FieldLabelText="61. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad061mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad061mo"
														FieldTextBoxTabIndex="108" FieldLabelText="61. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad062cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad062cu"
														FieldTextBoxTabIndex="109" FieldLabelText="62. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad062mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad062mo"
														FieldTextBoxTabIndex="110" FieldLabelText="62. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad063cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad063cu"
														FieldTextBoxTabIndex="111" FieldLabelText="63. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad063mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad063mo"
														FieldTextBoxTabIndex="112" FieldLabelText="63. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad064cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad064cu"
														FieldTextBoxTabIndex="113" FieldLabelText="64. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad064mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad064mo"
														FieldTextBoxTabIndex="114" FieldLabelText="64. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad065cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad065cu"
														FieldTextBoxTabIndex="115" FieldLabelText="65. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad065mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad065mo"
														FieldTextBoxTabIndex="116" FieldLabelText="65. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad066cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad066cu"
														FieldTextBoxTabIndex="117" FieldLabelText="66. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad066mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad066mo"
														FieldTextBoxTabIndex="118" FieldLabelText="66. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad067cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad067cu"
														FieldTextBoxTabIndex="119" FieldLabelText="67. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad067ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad067ev"
														FieldTextBoxTabIndex="120" FieldLabelText="67. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
										</table>
									</td>
									<td>
										<table>
											<tr>
												<td><def:datafieldcontrol id="ad068cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad068cu"
														FieldTextBoxTabIndex="121" FieldLabelText="68. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad068ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad068ev"
														FieldTextBoxTabIndex="122" FieldLabelText="68. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad069cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad069cu"
														FieldTextBoxTabIndex="123" FieldLabelText="69. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad069ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad069ev"
														FieldTextBoxTabIndex="124" FieldLabelText="69. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad070cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad070cu"
														FieldTextBoxTabIndex="125" FieldLabelText="70. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad070ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad070ev"
														FieldTextBoxTabIndex="126" FieldLabelText="70. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad071cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad071cu"
														FieldTextBoxTabIndex="127" FieldLabelText="71. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad071ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad071ev"
														FieldTextBoxTabIndex="128" FieldLabelText="71. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad072cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad072cu"
														FieldTextBoxTabIndex="129" FieldLabelText="72. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad072ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad072ev"
														FieldTextBoxTabIndex="130" FieldLabelText="72. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad073cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad073cu"
														FieldTextBoxTabIndex="131" FieldLabelText="73. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad073ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad073ev"
														FieldTextBoxTabIndex="132" FieldLabelText="73. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad074cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad074cu"
														FieldTextBoxTabIndex="133" FieldLabelText="74. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad074ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad074ev"
														FieldTextBoxTabIndex="134" FieldLabelText="74. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad075cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad075cu"
														FieldTextBoxTabIndex="135" FieldLabelText="75. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad075ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad075ev"
														FieldTextBoxTabIndex="136" FieldLabelText="75. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad076cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad076cu"
														FieldTextBoxTabIndex="137" FieldLabelText="76. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,6,7,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad076ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad076ev"
														FieldTextBoxTabIndex="138" FieldLabelText="76. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,6,7,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad077cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad077cu"
														FieldTextBoxTabIndex="139" FieldLabelText="77. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad077ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad077ev"
														FieldTextBoxTabIndex="140" FieldLabelText="77. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad078cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad078cu"
														FieldTextBoxTabIndex="141" FieldLabelText="78. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad078ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad078ev"
														FieldTextBoxTabIndex="142" FieldLabelText="78. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad079cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad079cu"
														FieldTextBoxTabIndex="143" FieldLabelText="79. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad079ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad079ev"
														FieldTextBoxTabIndex="144" FieldLabelText="79. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad080cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad080cu"
														FieldTextBoxTabIndex="145" FieldLabelText="80. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad080mo" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad080mo"
														FieldTextBoxTabIndex="146" FieldLabelText="80. (most)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,7,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad081cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad081cu"
														FieldTextBoxTabIndex="147" FieldLabelText="81. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad081ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad081ev"
														FieldTextBoxTabIndex="148" FieldLabelText="81. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad082cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad082cu"
														FieldTextBoxTabIndex="149" FieldLabelText="82. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad082ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad082ev"
														FieldTextBoxTabIndex="150" FieldLabelText="82. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad083cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad083cu"
														FieldTextBoxTabIndex="151" FieldLabelText="83. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad083ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad083ev"
														FieldTextBoxTabIndex="152" FieldLabelText="83. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,3,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad084cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad084cu"
														FieldTextBoxTabIndex="153" FieldLabelText="84. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad084ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad084ev"
														FieldTextBoxTabIndex="154" FieldLabelText="84. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad085cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad085cu"
														FieldTextBoxTabIndex="155" FieldLabelText="85. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad085ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad085ev"
														FieldTextBoxTabIndex="156" FieldLabelText="85. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad086" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad086"
														FieldTextBoxTabIndex="157" FieldLabelText="86. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad087" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad087"
														FieldTextBoxTabIndex="158" FieldLabelText="87. " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad088cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad088cu"
														FieldTextBoxTabIndex="159" FieldLabelText="88. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad088ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad088ev"
														FieldTextBoxTabIndex="160" FieldLabelText="88. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad089cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad089cu"
														FieldTextBoxTabIndex="161" FieldLabelText="89. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad089ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad089ev"
														FieldTextBoxTabIndex="162" FieldLabelText="89. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad090cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad090cu"
														FieldTextBoxTabIndex="163" FieldLabelText="90. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad090ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad090ev"
														FieldTextBoxTabIndex="164" FieldLabelText="90. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad091cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad091cu"
														FieldTextBoxTabIndex="165" FieldLabelText="91. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad091ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad091ev"
														FieldTextBoxTabIndex="166" FieldLabelText="91. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad092cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad092cu"
														FieldTextBoxTabIndex="167" FieldLabelText="92. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad092ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad092ev"
														FieldTextBoxTabIndex="168" FieldLabelText="92. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad093cu" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad093cu"
														FieldTextBoxTabIndex="169" FieldLabelText="93. (current)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ad093ev" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" DatabaseField="ad093ev"
														FieldTextBoxTabIndex="170" FieldLabelText="93. (ever)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,7,8,9"></def:datafieldcontrol></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<br>
							<table class="tblreadonly" id="table_readonly">
								<tr>
									<td><def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="267" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="268"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="269" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="270"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></td>
								</tr>
							</table>
						</div>
					</asp:Content>
