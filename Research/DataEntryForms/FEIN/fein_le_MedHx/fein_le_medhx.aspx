
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="tap_medhx.tap_medhx" CodeFile="fein_le_medhx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="561" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="medhx_pk" MeasureName="FEIN LE Medical &amp; Psych. Hx" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="fein_le_medhx"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hxdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="hxdate"
										FieldTextBoxTabIndex="3" FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hxrelat" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" DatabaseField="hxrelat"
										FieldTextBoxTabIndex="4" FieldLabelText="Relationship" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True"
										FieldDataType="INT" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol>
									<div>1=biological mother<br>
										2=stepmother<br>
										3=biological father<br>
										4=stepfather<br>
										5=adoptive mother<br>
										6=adoptive father<br>
										7=Other<br>
										9=Missing/Blank<br>
									</div>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">In all cases:</TD>
								</TR>
								<TR>
									<TD>9=Missing/Blank<BR>
										-7=Don't Know<BR>
										-8=Refused to Answer<BR>
										-9=Does Not Apply</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="6">1. Pregnancy History</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>First</TD>
									<TD>Second</TD>
									<TD>Third</TD>
									<TD>Fourth</TD>
									<TD>Fifth</TD>
								</TR>
								<TR>
									<TD>a. What was the outcome?<BR>
										<DIV>0=Live Birth<BR>
											1=Live Birth, child still living
											<BR>
											3=Stillbirth<BR>
											4=Elective Termination<BR>
											5=Miscarriage</DIV>
									</TD>
									<TD>
										<def:datafieldcontrol id="hx1a1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1a1"
											FieldTextBoxTabIndex="5" DatabaseField="hx1a1" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1a2"
											FieldTextBoxTabIndex="15" DatabaseField="hx1a2" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1a3"
											FieldTextBoxTabIndex="25" DatabaseField="hx1a3" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1a4"
											FieldTextBoxTabIndex="35" DatabaseField="hx1a4" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1a4"
											FieldTextBoxTabIndex="45" DatabaseField="hx1a5" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Date of Birth</TD>
									<TD>
										<def:datafieldcontrol id="hx1b1" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1b1"
											FieldTextBoxTabIndex="9" DatabaseField="hx1b1" FieldTextBoxWidth="70px" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b2" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1b2"
											FieldTextBoxTabIndex="19" DatabaseField="hx1b2" FieldTextBoxWidth="70px" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b3" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1b3"
											FieldTextBoxTabIndex="29" DatabaseField="hx1b3" FieldTextBoxWidth="70px" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b4" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1b4"
											FieldTextBoxTabIndex="39" DatabaseField="hx1b4" FieldTextBoxWidth="70px" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b5" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1b5"
											FieldTextBoxTabIndex="49" DatabaseField="hx1b5" FieldTextBoxWidth="70px" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Week of delivery<BR>
										<DIV>0=Greater than 37<BR>
											1=Less than 28<BR>
											2=Between 28 and 32<BR>
											3=Between 32 and 37<BR>
											4=Unknown</DIV>
									</TD>
									<TD>
										<def:datafieldcontrol id="hx1c1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1c1"
											FieldTextBoxTabIndex="10" DatabaseField="hx1c1" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1c2"
											FieldTextBoxTabIndex="20" DatabaseField="hx1c2" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1c3"
											FieldTextBoxTabIndex="30" DatabaseField="hx1c3" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1c4"
											FieldTextBoxTabIndex="40" DatabaseField="hx1c4" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx1c5"
											FieldTextBoxTabIndex="50" DatabaseField="hx1c5" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="6">1. Pregnancy History (Continued)</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>Sixth</TD>
									<TD>Seventh</TD>
									<TD>Eighth</TD>
									<TD>Ninth</TD>
									<TD>Tenth</TD>
								</TR>
								<TR>
									<TD>a. What was the outcome?<BR>
										<DIV>0=Live Birth<BR>
											1=Live Birth, child still living
											<BR>
											3=Stillbirth<BR>
											4=Elective Termination<BR>
											5=Miscarriage</DIV>
									</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a6" FieldTextBoxTabIndex="51" DatabaseField="hx1a6" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a7" FieldTextBoxTabIndex="52" DatabaseField="hx1a7" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a8" FieldTextBoxTabIndex="53" DatabaseField="hx1a8" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a9" FieldTextBoxTabIndex="54" DatabaseField="hx1a9" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a10" FieldTextBoxTabIndex="55" DatabaseField="hx1a10" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,4,5,-7,-8,-9" FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Date of Birth</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b6" FieldTextBoxTabIndex="51" DatabaseField="hx1b6" FieldTextBoxWidth="70px"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b7" FieldTextBoxTabIndex="52" DatabaseField="hx1b7" FieldTextBoxWidth="70px"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b8" FieldTextBoxTabIndex="53" DatabaseField="hx1b8" FieldTextBoxWidth="70px"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b9" FieldTextBoxTabIndex="54" DatabaseField="hx1b9" FieldTextBoxWidth="70px"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b10" FieldTextBoxTabIndex="55" DatabaseField="hx1b10"
											FieldTextBoxWidth="70px" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Week of delivery<BR>
										<DIV>0=Greater than 37<BR>
											1=Less than 28<BR>
											2=Between 28 and 32<BR>
											3=Between 32 and 37<BR>
											4=Unknown</DIV>
									</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c6" FieldTextBoxTabIndex="51" DatabaseField="hx1c6" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c7" FieldTextBoxTabIndex="52" DatabaseField="hx1c7" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c8" FieldTextBoxTabIndex="53" DatabaseField="hx1c8" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c9" FieldTextBoxTabIndex="54" DatabaseField="hx1c9" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c10" FieldTextBoxTabIndex="55" DatabaseField="hx1c10" FieldTextBoxWidth="30px"
											ValidList="0,1,2,3,4,-8,-9" FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="tblentry" id="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="hx2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Pregnancy number of child in study"
											FieldTextBoxTabIndex="55" DatabaseField="hx2" FieldLabelWidth="100px" FieldTextBoxWidth="30px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="15">3. Medical history of child and child's blood 
										relatives</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>(0=N0, 1=YES,<BR>
										2=NOT SURE)</TD>
									<TD colSpan="12">(0=unchecked, 1=checked)</TD>
								</TR>
								<TR>
									<TD>Disorder</TD>
									<TD>Child/blood relative<BR>
										has disorder<BR>
									</TD>
									<TD>Child</TD>
									<TD colSpan="2">Parents<BR>
										of Child</TD>
									<TD>Siblings</TD>
									<TD colSpan="2">1/2<BR>
										Siblings</TD>
									<TD colSpan="2">First<BR>
										Cousins</TD>
									<TD colSpan="2">Aunts &amp;<BR>
										Uncles</TD>
									<TD colSpan="2">Grand-<BR>
										parents</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD>Mom</TD>
									<TD>Dad</TD>
									<TD>N/A</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD>a. Autism Spectrum Disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx3ahas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ahas"
											FieldTextBoxTabIndex="56" DatabaseField="hx3ahas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3achld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3achld"
											FieldTextBoxTabIndex="57" DatabaseField="hx3achld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3amom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3amom"
											FieldTextBoxTabIndex="58" DatabaseField="hx3amom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3adad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3adad"
											FieldTextBoxTabIndex="59" DatabaseField="hx3adad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3asib"
											FieldTextBoxTabIndex="60" DatabaseField="hx3asib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3asibm"
											FieldTextBoxTabIndex="61" DatabaseField="hx3asibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3asibp"
											FieldTextBoxTabIndex="62" DatabaseField="hx3asibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3acoum"
											FieldTextBoxTabIndex="63" DatabaseField="hx3acoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3acoup"
											FieldTextBoxTabIndex="64" DatabaseField="hx3acoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3aaum"
											FieldTextBoxTabIndex="65" DatabaseField="hx3aaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3aaup"
											FieldTextBoxTabIndex="66" DatabaseField="hx3aaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="25003"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3agpm"
											FieldTextBoxTabIndex="67" DatabaseField="hx3agpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3agpp"
											FieldTextBoxTabIndex="68" DatabaseField="hx3agpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3aotr"
											FieldTextBoxTabIndex="69" DatabaseField="hx3aotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="25012"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Fragile X</TD>
									<TD>
										<def:datafieldcontrol id="hx3bhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bhas"
											FieldTextBoxTabIndex="75" DatabaseField="hx3bhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bchld"
											FieldTextBoxTabIndex="76" DatabaseField="hx3bchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bmom"
											FieldTextBoxTabIndex="77" DatabaseField="hx3bmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bdad"
											FieldTextBoxTabIndex="78" DatabaseField="hx3bdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bsib"
											FieldTextBoxTabIndex="79" DatabaseField="hx3bsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bsibm"
											FieldTextBoxTabIndex="80" DatabaseField="hx3bsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bsibp"
											FieldTextBoxTabIndex="81" DatabaseField="hx3bsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bcoum"
											FieldTextBoxTabIndex="82" DatabaseField="hx3bcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bcoup"
											FieldTextBoxTabIndex="83" DatabaseField="hx3bcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3baum"
											FieldTextBoxTabIndex="84" DatabaseField="hx3baum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3baup"
											FieldTextBoxTabIndex="85" DatabaseField="hx3baup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bgpm"
											FieldTextBoxTabIndex="86" DatabaseField="hx3bgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bgpp"
											FieldTextBoxTabIndex="87" DatabaseField="hx3bgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3botr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3botr"
											FieldTextBoxTabIndex="88" DatabaseField="hx3botr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Tuberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3chas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3chas"
											FieldTextBoxTabIndex="89" DatabaseField="hx3chas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cchld"
											FieldTextBoxTabIndex="90" DatabaseField="hx3cchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cmom"
											FieldTextBoxTabIndex="91" DatabaseField="hx3cmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cdad"
											FieldTextBoxTabIndex="92" DatabaseField="hx3cdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3csib"
											FieldTextBoxTabIndex="93" DatabaseField="hx3csib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3csibm"
											FieldTextBoxTabIndex="94" DatabaseField="hx3csibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3csibp"
											FieldTextBoxTabIndex="95" DatabaseField="hx3csibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ccoum"
											FieldTextBoxTabIndex="96" DatabaseField="hx3ccoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ccoup"
											FieldTextBoxTabIndex="97" DatabaseField="hx3ccoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3caum"
											FieldTextBoxTabIndex="98" DatabaseField="hx3caum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3caup"
											FieldTextBoxTabIndex="99" DatabaseField="hx3caup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cgpm"
											FieldTextBoxTabIndex="100" DatabaseField="hx3cgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cgpp"
											FieldTextBoxTabIndex="101" DatabaseField="hx3cgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3cotr"
											FieldTextBoxTabIndex="102" DatabaseField="hx3cotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Neurofibromatosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3dhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dhas"
											FieldTextBoxTabIndex="103" DatabaseField="hx3dhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dchld"
											FieldTextBoxTabIndex="104" DatabaseField="hx3dchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dmom"
											FieldTextBoxTabIndex="105" DatabaseField="hx3dmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ddad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ddad"
											FieldTextBoxTabIndex="106" DatabaseField="hx3ddad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dsib"
											FieldTextBoxTabIndex="107" DatabaseField="hx3dsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dsibm"
											FieldTextBoxTabIndex="108" DatabaseField="hx3dsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dsibp"
											FieldTextBoxTabIndex="109" DatabaseField="hx3dsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dcoum"
											FieldTextBoxTabIndex="110" DatabaseField="hx3dcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dcoup"
											FieldTextBoxTabIndex="111" DatabaseField="hx3dcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3daum"
											FieldTextBoxTabIndex="112" DatabaseField="hx3daum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3daup"
											FieldTextBoxTabIndex="113" DatabaseField="hx3daup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dgpm"
											FieldTextBoxTabIndex="114" DatabaseField="hx3dgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dgpp"
											FieldTextBoxTabIndex="115" DatabaseField="hx3dgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3dotr"
											FieldTextBoxTabIndex="116" DatabaseField="hx3dotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Rett Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ehas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ehas"
											FieldTextBoxTabIndex="117" DatabaseField="hx3ehas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3echld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3echld"
											FieldTextBoxTabIndex="118" DatabaseField="hx3echld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3emom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3emom"
											FieldTextBoxTabIndex="119" DatabaseField="hx3emom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3edad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3edad"
											FieldTextBoxTabIndex="120" DatabaseField="hx3edad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3esib"
											FieldTextBoxTabIndex="121" DatabaseField="hx3esib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3esibm"
											FieldTextBoxTabIndex="122" DatabaseField="hx3esibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3esibp"
											FieldTextBoxTabIndex="123" DatabaseField="hx3esibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ecoum"
											FieldTextBoxTabIndex="124" DatabaseField="hx3ecoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ecoup"
											FieldTextBoxTabIndex="125" DatabaseField="hx3ecoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3eaum"
											FieldTextBoxTabIndex="126" DatabaseField="hx3eaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3eaup"
											FieldTextBoxTabIndex="127" DatabaseField="hx3eaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3egpm"
											FieldTextBoxTabIndex="128" DatabaseField="hx3egpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3egpp"
											FieldTextBoxTabIndex="129" DatabaseField="hx3egpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3eotr"
											FieldTextBoxTabIndex="130" DatabaseField="hx3eotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Childhood Disintegration Disorder (CDD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3fhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fhas"
											FieldTextBoxTabIndex="131" DatabaseField="hx3fhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fchld"
											FieldTextBoxTabIndex="132" DatabaseField="hx3fchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fmom"
											FieldTextBoxTabIndex="133" DatabaseField="hx3fmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fdad"
											FieldTextBoxTabIndex="134" DatabaseField="hx3fdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fsib"
											FieldTextBoxTabIndex="135" DatabaseField="hx3fsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fsibm"
											FieldTextBoxTabIndex="136" DatabaseField="hx3fsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fsibp"
											FieldTextBoxTabIndex="137" DatabaseField="hx3fsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fcoum"
											FieldTextBoxTabIndex="138" DatabaseField="hx3fcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fcoup"
											FieldTextBoxTabIndex="139" DatabaseField="hx3fcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3faum"
											FieldTextBoxTabIndex="140" DatabaseField="hx3faum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3faup"
											FieldTextBoxTabIndex="141" DatabaseField="hx3faup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fgpm"
											FieldTextBoxTabIndex="142" DatabaseField="hx3fgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fgpp"
											FieldTextBoxTabIndex="143" DatabaseField="hx3fgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3fotr"
											FieldTextBoxTabIndex="144" DatabaseField="hx3fotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Prader Willi Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ghas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ghas"
											FieldTextBoxTabIndex="145" DatabaseField="hx3ghas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gchld"
											FieldTextBoxTabIndex="146" DatabaseField="hx3gchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gmom"
											FieldTextBoxTabIndex="147" DatabaseField="hx3gmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gdad"
											FieldTextBoxTabIndex="148" DatabaseField="hx3gdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gsib"
											FieldTextBoxTabIndex="149" DatabaseField="hx3gsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gsibm"
											FieldTextBoxTabIndex="150" DatabaseField="hx3gsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gsibp"
											FieldTextBoxTabIndex="151" DatabaseField="hx3gsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gcoum"
											FieldTextBoxTabIndex="152" DatabaseField="hx3gcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gcoup"
											FieldTextBoxTabIndex="153" DatabaseField="hx3gcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gaum"
											FieldTextBoxTabIndex="154" DatabaseField="hx3gaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gaup"
											FieldTextBoxTabIndex="155" DatabaseField="hx3gaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ggpm"
											FieldTextBoxTabIndex="156" DatabaseField="hx3ggpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ggpp"
											FieldTextBoxTabIndex="157" DatabaseField="hx3ggpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3gotr"
											FieldTextBoxTabIndex="158" DatabaseField="hx3gotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Angelman Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3hhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hhas"
											FieldTextBoxTabIndex="159" DatabaseField="hx3hhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hchld"
											FieldTextBoxTabIndex="160" DatabaseField="hx3hchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hmom"
											FieldTextBoxTabIndex="161" DatabaseField="hx3hmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hdad"
											FieldTextBoxTabIndex="162" DatabaseField="hx3hdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hsib"
											FieldTextBoxTabIndex="163" DatabaseField="hx3hsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hsibm"
											FieldTextBoxTabIndex="164" DatabaseField="hx3hsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hsibp"
											FieldTextBoxTabIndex="165" DatabaseField="hx3hsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hcoum"
											FieldTextBoxTabIndex="166" DatabaseField="hx3hcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hcoup"
											FieldTextBoxTabIndex="167" DatabaseField="hx3hcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3haum"
											FieldTextBoxTabIndex="168" DatabaseField="hx3haum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3haup"
											FieldTextBoxTabIndex="169" DatabaseField="hx3haup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hgpm"
											FieldTextBoxTabIndex="170" DatabaseField="hx3hgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hgpp"
											FieldTextBoxTabIndex="171" DatabaseField="hx3hgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3hotr"
											FieldTextBoxTabIndex="172" DatabaseField="hx3hotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Other chromosomal abnormality, disorder or syndrome (please specify)
										<def:datafieldcontrol id="hx3is" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3is"
											FieldTextBoxTabIndex="173" DatabaseField="hx3is" FieldTextBoxWidth="150px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ihas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ihas"
											FieldTextBoxTabIndex="174" DatabaseField="hx3ihas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ichld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ichld"
											FieldTextBoxTabIndex="175" DatabaseField="hx3ichld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3imom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3imom"
											FieldTextBoxTabIndex="176" DatabaseField="hx3imom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3idad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3idad"
											FieldTextBoxTabIndex="177" DatabaseField="hx3idad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3isib"
											FieldTextBoxTabIndex="178" DatabaseField="hx3isib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3isibm"
											FieldTextBoxTabIndex="179" DatabaseField="hx3isibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3isibp"
											FieldTextBoxTabIndex="180" DatabaseField="hx3isibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3icoum"
											FieldTextBoxTabIndex="181" DatabaseField="hx3icoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3icoup"
											FieldTextBoxTabIndex="182" DatabaseField="hx3icoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3iaum"
											FieldTextBoxTabIndex="183" DatabaseField="hx3iaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3iaup"
											FieldTextBoxTabIndex="184" DatabaseField="hx3iaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3igpm"
											FieldTextBoxTabIndex="185" DatabaseField="hx3igpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3igpp"
											FieldTextBoxTabIndex="186" DatabaseField="hx3igpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3iotr"
											FieldTextBoxTabIndex="187" DatabaseField="hx3iotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Congenital rubella</TD>
									<TD>
										<def:datafieldcontrol id="hx3jhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jhas"
											FieldTextBoxTabIndex="188" DatabaseField="hx3jhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jchld"
											FieldTextBoxTabIndex="189" DatabaseField="hx3jchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jmom"
											FieldTextBoxTabIndex="190" DatabaseField="hx3jmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jdad"
											FieldTextBoxTabIndex="191" DatabaseField="hx3jdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jsib"
											FieldTextBoxTabIndex="192" DatabaseField="hx3jsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jsibm"
											FieldTextBoxTabIndex="193" DatabaseField="hx3jsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jsibp"
											FieldTextBoxTabIndex="194" DatabaseField="hx3jsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jcoum"
											FieldTextBoxTabIndex="195" DatabaseField="hx3jcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jcoup"
											FieldTextBoxTabIndex="196" DatabaseField="hx3jcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jaum"
											FieldTextBoxTabIndex="197" DatabaseField="hx3jaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jaup"
											FieldTextBoxTabIndex="198" DatabaseField="hx3jaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jgpm"
											FieldTextBoxTabIndex="199" DatabaseField="hx3jgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jgpp"
											FieldTextBoxTabIndex="200" DatabaseField="hx3jgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3jotr"
											FieldTextBoxTabIndex="201" DatabaseField="hx3jotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. PKU</TD>
									<TD>
										<def:datafieldcontrol id="hx3khas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3khas"
											FieldTextBoxTabIndex="202" DatabaseField="hx3khas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kchld"
											FieldTextBoxTabIndex="203" DatabaseField="hx3kchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kmom"
											FieldTextBoxTabIndex="204" DatabaseField="hx3kmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kdad"
											FieldTextBoxTabIndex="205" DatabaseField="hx3kdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ksib"
											FieldTextBoxTabIndex="206" DatabaseField="hx3ksib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ksibm"
											FieldTextBoxTabIndex="207" DatabaseField="hx3ksibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ksibp"
											FieldTextBoxTabIndex="208" DatabaseField="hx3ksibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kcoum"
											FieldTextBoxTabIndex="209" DatabaseField="hx3kcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kcoup"
											FieldTextBoxTabIndex="210" DatabaseField="hx3kcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kaum"
											FieldTextBoxTabIndex="211" DatabaseField="hx3kaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kaup"
											FieldTextBoxTabIndex="212" DatabaseField="hx3kaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kgpm"
											FieldTextBoxTabIndex="213" DatabaseField="hx3kgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kgpp"
											FieldTextBoxTabIndex="214" DatabaseField="hx3kgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3kotr"
											FieldTextBoxTabIndex="215" DatabaseField="hx3kotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Hydrocephalus (water on the brain)</TD>
									<TD>
										<def:datafieldcontrol id="hx3lhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lhas"
											FieldTextBoxTabIndex="216" DatabaseField="hx3lhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lchld"
											FieldTextBoxTabIndex="217" DatabaseField="hx3lchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lmom"
											FieldTextBoxTabIndex="218" DatabaseField="hx3lmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ldad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ldad"
											FieldTextBoxTabIndex="219" DatabaseField="hx3ldad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lsib"
											FieldTextBoxTabIndex="220" DatabaseField="hx3lsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lsibm"
											FieldTextBoxTabIndex="221" DatabaseField="hx3lsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lsibp"
											FieldTextBoxTabIndex="222" DatabaseField="hx3lsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lcoum"
											FieldTextBoxTabIndex="223" DatabaseField="hx3lcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lcoup"
											FieldTextBoxTabIndex="224" DatabaseField="hx3lcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3laum"
											FieldTextBoxTabIndex="225" DatabaseField="hx3laum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3laup"
											FieldTextBoxTabIndex="226" DatabaseField="hx3laup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lgpm"
											FieldTextBoxTabIndex="227" DatabaseField="hx3lgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lgpp"
											FieldTextBoxTabIndex="228" DatabaseField="hx3lgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3lotr"
											FieldTextBoxTabIndex="229" DatabaseField="hx3lotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Disorder</TD>
									<TD>Child/blood relative<BR>
										has disorder<BR>
									</TD>
									<TD>Child</TD>
									<TD colSpan="2">Parents<BR>
										of Child</TD>
									<TD>Siblings</TD>
									<TD colSpan="2">1/2<BR>
										Siblings</TD>
									<TD colSpan="2">First<BR>
										Cousins</TD>
									<TD colSpan="2">Aunts &amp;<BR>
										Uncles</TD>
									<TD colSpan="2">Grand-<BR>
										parents</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD>Mom</TD>
									<TD>Dad</TD>
									<TD>N/A</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD>m. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="hx3mhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mhas"
											FieldTextBoxTabIndex="230" DatabaseField="hx3mhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mchld"
											FieldTextBoxTabIndex="231" DatabaseField="hx3mchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mmom"
											FieldTextBoxTabIndex="232" DatabaseField="hx3mmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mdad"
											FieldTextBoxTabIndex="233" DatabaseField="hx3mdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3msib"
											FieldTextBoxTabIndex="234" DatabaseField="hx3msib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3msibm"
											FieldTextBoxTabIndex="235" DatabaseField="hx3msibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3msibp"
											FieldTextBoxTabIndex="236" DatabaseField="hx3msibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mcoum"
											FieldTextBoxTabIndex="237" DatabaseField="hx3mcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mcoup"
											FieldTextBoxTabIndex="238" DatabaseField="hx3mcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3maum"
											FieldTextBoxTabIndex="239" DatabaseField="hx3maum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3maup"
											FieldTextBoxTabIndex="240" DatabaseField="hx3maup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mgpm"
											FieldTextBoxTabIndex="241" DatabaseField="hx3mgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mgpp"
											FieldTextBoxTabIndex="242" DatabaseField="hx3mgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3motr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3motr"
											FieldTextBoxTabIndex="243" DatabaseField="hx3motr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Mental retardation</TD>
									<TD>
										<def:datafieldcontrol id="hx3nhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nhas"
											FieldTextBoxTabIndex="244" DatabaseField="hx3nhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nchld"
											FieldTextBoxTabIndex="245" DatabaseField="hx3nchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nmom"
											FieldTextBoxTabIndex="246" DatabaseField="hx3nmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ndad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ndad"
											FieldTextBoxTabIndex="247" DatabaseField="hx3ndad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nsib"
											FieldTextBoxTabIndex="248" DatabaseField="hx3nsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nsibm"
											FieldTextBoxTabIndex="249" DatabaseField="hx3nsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nsibp"
											FieldTextBoxTabIndex="250" DatabaseField="hx3nsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ncoum"
											FieldTextBoxTabIndex="251" DatabaseField="hx3ncoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ncoup"
											FieldTextBoxTabIndex="252" DatabaseField="hx3ncoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3naum"
											FieldTextBoxTabIndex="253" DatabaseField="hx3naum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3naup"
											FieldTextBoxTabIndex="254" DatabaseField="hx3naup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ngpm"
											FieldTextBoxTabIndex="255" DatabaseField="hx3ngpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ngpp"
											FieldTextBoxTabIndex="256" DatabaseField="hx3ngpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3notr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3notr"
											FieldTextBoxTabIndex="257" DatabaseField="hx3notr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx3ohas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ohas"
											FieldTextBoxTabIndex="258" DatabaseField="hx3ohas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ochld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ochld"
											FieldTextBoxTabIndex="259" DatabaseField="hx3ochld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3omom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3omom"
											FieldTextBoxTabIndex="260" DatabaseField="hx3omom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3odad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3odad"
											FieldTextBoxTabIndex="261" DatabaseField="hx3odad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3osib"
											FieldTextBoxTabIndex="262" DatabaseField="hx3osib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3osibm"
											FieldTextBoxTabIndex="263" DatabaseField="hx3osibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3osibp"
											FieldTextBoxTabIndex="264" DatabaseField="hx3osibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ocoum"
											FieldTextBoxTabIndex="265" DatabaseField="hx3ocoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ocoup"
											FieldTextBoxTabIndex="266" DatabaseField="hx3ocoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3oaum"
											FieldTextBoxTabIndex="267" DatabaseField="hx3oaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3oaup"
											FieldTextBoxTabIndex="268" DatabaseField="hx3oaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ogpm"
											FieldTextBoxTabIndex="269" DatabaseField="hx3ogpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ogpp"
											FieldTextBoxTabIndex="270" DatabaseField="hx3ogpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ootr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3ootr"
											FieldTextBoxTabIndex="271" DatabaseField="hx3ootr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Speech delay requiring therapy</TD>
									<TD>
										<def:datafieldcontrol id="hx3phas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3phas"
											FieldTextBoxTabIndex="272" DatabaseField="hx3phas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pchld"
											FieldTextBoxTabIndex="273" DatabaseField="hx3pchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pmom"
											FieldTextBoxTabIndex="274" DatabaseField="hx3pmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pdad"
											FieldTextBoxTabIndex="275" DatabaseField="hx3pdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3psib"
											FieldTextBoxTabIndex="276" DatabaseField="hx3psib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3psibm"
											FieldTextBoxTabIndex="277" DatabaseField="hx3psibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3psibp"
											FieldTextBoxTabIndex="278" DatabaseField="hx3psibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pcoum"
											FieldTextBoxTabIndex="279" DatabaseField="hx3pcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pcoup"
											FieldTextBoxTabIndex="280" DatabaseField="hx3pcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3paum"
											FieldTextBoxTabIndex="281" DatabaseField="hx3paum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3paup"
											FieldTextBoxTabIndex="282" DatabaseField="hx3paup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pgpm"
											FieldTextBoxTabIndex="283" DatabaseField="hx3pgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pgpp"
											FieldTextBoxTabIndex="284" DatabaseField="hx3pgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3potr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3potr"
											FieldTextBoxTabIndex="285" DatabaseField="hx3potr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Attention Deficit Disorder (ADD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3qhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qhas"
											FieldTextBoxTabIndex="286" DatabaseField="hx3qhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qchld"
											FieldTextBoxTabIndex="287" DatabaseField="hx3qchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qmom"
											FieldTextBoxTabIndex="288" DatabaseField="hx3qmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qdad"
											FieldTextBoxTabIndex="289" DatabaseField="hx3qdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qsib"
											FieldTextBoxTabIndex="290" DatabaseField="hx3qsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qsibm"
											FieldTextBoxTabIndex="291" DatabaseField="hx3qsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qsibp"
											FieldTextBoxTabIndex="292" DatabaseField="hx3qsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qcoum"
											FieldTextBoxTabIndex="293" DatabaseField="hx3qcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qcoup"
											FieldTextBoxTabIndex="294" DatabaseField="hx3qcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qaum"
											FieldTextBoxTabIndex="295" DatabaseField="hx3qaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qaup"
											FieldTextBoxTabIndex="296" DatabaseField="hx3qaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qgpm"
											FieldTextBoxTabIndex="297" DatabaseField="hx3qgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qgpp"
											FieldTextBoxTabIndex="298" DatabaseField="hx3qgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3qotr"
											FieldTextBoxTabIndex="299" DatabaseField="hx3qotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>r. Panic or anxiety disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx3rhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rhas"
											FieldTextBoxTabIndex="300" DatabaseField="hx3rhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rchld"
											FieldTextBoxTabIndex="301" DatabaseField="hx3rchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rmom"
											FieldTextBoxTabIndex="302" DatabaseField="hx3rmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rdad"
											FieldTextBoxTabIndex="303" DatabaseField="hx3rdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rsib"
											FieldTextBoxTabIndex="304" DatabaseField="hx3rsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rsibm"
											FieldTextBoxTabIndex="305" DatabaseField="hx3rsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rsibp"
											FieldTextBoxTabIndex="306" DatabaseField="hx3rsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rcoum"
											FieldTextBoxTabIndex="307" DatabaseField="hx3rcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rcoup"
											FieldTextBoxTabIndex="308" DatabaseField="hx3rcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3raum"
											FieldTextBoxTabIndex="309" DatabaseField="hx3raum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3raup"
											FieldTextBoxTabIndex="310" DatabaseField="hx3raup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rgpm"
											FieldTextBoxTabIndex="311" DatabaseField="hx3rgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rgpp"
											FieldTextBoxTabIndex="312" DatabaseField="hx3rgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3rotr"
											FieldTextBoxTabIndex="313" DatabaseField="hx3rotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>s. Depression</TD>
									<TD>
										<def:datafieldcontrol id="hx3shas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3shas"
											FieldTextBoxTabIndex="314" DatabaseField="hx3shas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3schld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3schld"
											FieldTextBoxTabIndex="315" DatabaseField="hx3schld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3smom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3smom"
											FieldTextBoxTabIndex="316" DatabaseField="hx3smom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3sdad"
											FieldTextBoxTabIndex="317" DatabaseField="hx3sdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ssib"
											FieldTextBoxTabIndex="318" DatabaseField="hx3ssib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ssibm"
											FieldTextBoxTabIndex="319" DatabaseField="hx3ssibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ssibp"
											FieldTextBoxTabIndex="320" DatabaseField="hx3ssibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3scoum"
											FieldTextBoxTabIndex="321" DatabaseField="hx3scoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3scoup"
											FieldTextBoxTabIndex="322" DatabaseField="hx3scoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3saum"
											FieldTextBoxTabIndex="323" DatabaseField="hx3saum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3saup"
											FieldTextBoxTabIndex="324" DatabaseField="hx3saup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3sgpm"
											FieldTextBoxTabIndex="325" DatabaseField="hx3sgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3sgpp"
											FieldTextBoxTabIndex="326" DatabaseField="hx3sgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3sotr"
											FieldTextBoxTabIndex="327" DatabaseField="hx3sotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>t. Manic depression/Bipolar</TD>
									<TD>
										<def:datafieldcontrol id="hx3thas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3thas"
											FieldTextBoxTabIndex="328" DatabaseField="hx3thas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tchld"
											FieldTextBoxTabIndex="329" DatabaseField="hx3tchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tmom"
											FieldTextBoxTabIndex="330" DatabaseField="hx3tmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tdad"
											FieldTextBoxTabIndex="331" DatabaseField="hx3tdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tsib"
											FieldTextBoxTabIndex="332" DatabaseField="hx3tsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tsibm"
											FieldTextBoxTabIndex="333" DatabaseField="hx3tsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tsibp"
											FieldTextBoxTabIndex="334" DatabaseField="hx3tsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tcoum"
											FieldTextBoxTabIndex="335" DatabaseField="hx3tcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tcoup"
											FieldTextBoxTabIndex="336" DatabaseField="hx3tcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3taum"
											FieldTextBoxTabIndex="337" DatabaseField="hx3taum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3taup"
											FieldTextBoxTabIndex="338" DatabaseField="hx3taup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tgpm"
											FieldTextBoxTabIndex="339" DatabaseField="hx3tgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tgpp"
											FieldTextBoxTabIndex="340" DatabaseField="hx3tgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3totr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3totr"
											FieldTextBoxTabIndex="341" DatabaseField="hx3totr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>u. Schizophrenia</TD>
									<TD>
										<def:datafieldcontrol id="hx3uhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uhas"
											FieldTextBoxTabIndex="342" DatabaseField="hx3uhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uchld"
											FieldTextBoxTabIndex="343" DatabaseField="hx3uchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3umom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3umom"
											FieldTextBoxTabIndex="344" DatabaseField="hx3umom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3udad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3udad"
											FieldTextBoxTabIndex="345" DatabaseField="hx3udad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3usib"
											FieldTextBoxTabIndex="346" DatabaseField="hx3usib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3usibm"
											FieldTextBoxTabIndex="347" DatabaseField="hx3usibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3usibp"
											FieldTextBoxTabIndex="348" DatabaseField="hx3usibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ucoum"
											FieldTextBoxTabIndex="349" DatabaseField="hx3ucoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ucoup"
											FieldTextBoxTabIndex="350" DatabaseField="hx3ucoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uaum"
											FieldTextBoxTabIndex="351" DatabaseField="hx3uaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uaup"
											FieldTextBoxTabIndex="352" DatabaseField="hx3uaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ugpm"
											FieldTextBoxTabIndex="353" DatabaseField="hx3ugpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ugpp"
											FieldTextBoxTabIndex="354" DatabaseField="hx3ugpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3uotr"
											FieldTextBoxTabIndex="355" DatabaseField="hx3uotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>v. Been admitted to a hospital for psychiatric illness</TD>
									<TD>
										<def:datafieldcontrol id="hx3vhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vhas"
											FieldTextBoxTabIndex="356" DatabaseField="hx3vhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vchld"
											FieldTextBoxTabIndex="357" DatabaseField="hx3vchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vmom"
											FieldTextBoxTabIndex="358" DatabaseField="hx3vmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vdad"
											FieldTextBoxTabIndex="359" DatabaseField="hx3vdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vsib"
											FieldTextBoxTabIndex="360" DatabaseField="hx3vsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vsibm"
											FieldTextBoxTabIndex="361" DatabaseField="hx3vsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vsibp"
											FieldTextBoxTabIndex="362" DatabaseField="hx3vsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vcoum"
											FieldTextBoxTabIndex="363" DatabaseField="hx3vcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vcoup"
											FieldTextBoxTabIndex="364" DatabaseField="hx3vcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vaum"
											FieldTextBoxTabIndex="365" DatabaseField="hx3vaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vaup"
											FieldTextBoxTabIndex="366" DatabaseField="hx3vaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vgpm"
											FieldTextBoxTabIndex="367" DatabaseField="hx3vgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vgpp"
											FieldTextBoxTabIndex="368" DatabaseField="hx3vgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3votr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3votr"
											FieldTextBoxTabIndex="369" DatabaseField="hx3votr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>w. Birth defects (e.g., cleft lip or palate, open spine)</TD>
									<TD>
										<def:datafieldcontrol id="hx3whas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3whas"
											FieldTextBoxTabIndex="370" DatabaseField="hx3whas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wchld"
											FieldTextBoxTabIndex="371" DatabaseField="hx3wchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wmom"
											FieldTextBoxTabIndex="372" DatabaseField="hx3wmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wdad"
											FieldTextBoxTabIndex="373" DatabaseField="hx3wdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wsib"
											FieldTextBoxTabIndex="374" DatabaseField="hx3wsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wsibm"
											FieldTextBoxTabIndex="375" DatabaseField="hx3wsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wsibp"
											FieldTextBoxTabIndex="376" DatabaseField="hx3wsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wcoum"
											FieldTextBoxTabIndex="377" DatabaseField="hx3wcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wcoup"
											FieldTextBoxTabIndex="378" DatabaseField="hx3wcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3waum"
											FieldTextBoxTabIndex="379" DatabaseField="hx3waum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3waup"
											FieldTextBoxTabIndex="380" DatabaseField="hx3waup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wgpm"
											FieldTextBoxTabIndex="381" DatabaseField="hx3wgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wgpp"
											FieldTextBoxTabIndex="382" DatabaseField="hx3wgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3wotr"
											FieldTextBoxTabIndex="383" DatabaseField="hx3wotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>x. Cancer (please specify type)
										<def:datafieldcontrol id="hx3xs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3xs"
											FieldTextBoxTabIndex="383" DatabaseField="hx3xs" FieldTextBoxWidth="150px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xhas"
											FieldTextBoxTabIndex="384" DatabaseField="hx3xhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xchld"
											FieldTextBoxTabIndex="385" DatabaseField="hx3xchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xmom"
											FieldTextBoxTabIndex="386" DatabaseField="hx3xmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xdad"
											FieldTextBoxTabIndex="387" DatabaseField="hx3xdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xsib"
											FieldTextBoxTabIndex="388" DatabaseField="hx3xsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xsibm"
											FieldTextBoxTabIndex="389" DatabaseField="hx3xsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xsibp"
											FieldTextBoxTabIndex="390" DatabaseField="hx3xsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xcoum"
											FieldTextBoxTabIndex="391" DatabaseField="hx3xcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xcoup"
											FieldTextBoxTabIndex="392" DatabaseField="hx3xcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xaum"
											FieldTextBoxTabIndex="393" DatabaseField="hx3xaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xaup"
											FieldTextBoxTabIndex="394" DatabaseField="hx3xaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xgpm"
											FieldTextBoxTabIndex="395" DatabaseField="hx3xgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3xgpp"
											FieldTextBoxTabIndex="396" DatabaseField="hx3xgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3xotr"
											FieldTextBoxTabIndex="397" DatabaseField="hx3xotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>y. Norrie Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3yhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3yhas"
											FieldTextBoxTabIndex="398" DatabaseField="hx3yhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ychld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ychld"
											FieldTextBoxTabIndex="399" DatabaseField="hx3ychld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ymom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ymom"
											FieldTextBoxTabIndex="400" DatabaseField="hx3ymom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ydad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ydad"
											FieldTextBoxTabIndex="401" DatabaseField="hx3ydad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ysib"
											FieldTextBoxTabIndex="402" DatabaseField="hx3ysib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ysibm"
											FieldTextBoxTabIndex="403" DatabaseField="hx3ysibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ysibp"
											FieldTextBoxTabIndex="404" DatabaseField="hx3ysibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ycoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ycoum"
											FieldTextBoxTabIndex="405" DatabaseField="hx3ycoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ycoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ycoup"
											FieldTextBoxTabIndex="406" DatabaseField="hx3ycoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3yaum"
											FieldTextBoxTabIndex="407" DatabaseField="hx3yaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3yaup"
											FieldTextBoxTabIndex="408" DatabaseField="hx3yaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ygpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ygpm"
											FieldTextBoxTabIndex="409" DatabaseField="hx3ygpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ygpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ygpp"
											FieldTextBoxTabIndex="410" DatabaseField="hx3ygpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3yotr"
											FieldTextBoxTabIndex="411" DatabaseField="hx3yotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Disorder</TD>
									<TD>Child/blood relative<BR>
										has disorder<BR>
									</TD>
									<TD>Child</TD>
									<TD colSpan="2">Parents<BR>
										of Child</TD>
									<TD>Siblings</TD>
									<TD colSpan="2">1/2<BR>
										Siblings</TD>
									<TD colSpan="2">First<BR>
										Cousins</TD>
									<TD colSpan="2">Aunts &amp;<BR>
										Uncles</TD>
									<TD colSpan="2">Grand-<BR>
										parents</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD>Mom</TD>
									<TD>Dad</TD>
									<TD>N/A</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Mat</TD>
									<TD>Pat</TD>
									<TD>Other</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">4. Assisted Reproductive Technology?</TD>
									<TD>(0=NO, 1=YES)
										<def:datafieldcontrol id="hx4" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4"
											FieldTextBoxTabIndex="412" DatabaseField="hx4" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. Ovulation induction</TD>
									<TD>
										<def:datafieldcontrol id="hx4a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4a"
											FieldTextBoxTabIndex="412" DatabaseField="hx4a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. In Vitro</TD>
									<TD>
										<def:datafieldcontrol id="hx4b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4b"
											FieldTextBoxTabIndex="412" DatabaseField="hx4b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. GIFT or ZIFT</TD>
									<TD>
										<def:datafieldcontrol id="hx4c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4c"
											FieldTextBoxTabIndex="412" DatabaseField="hx4c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Intracytoplasmic sperm injection (ICSI)</TD>
									<TD>
										<def:datafieldcontrol id="hx4d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4d"
											FieldTextBoxTabIndex="412" DatabaseField="hx4d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Sperm donor</TD>
									<TD>
										<def:datafieldcontrol id="hx4e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4e"
											FieldTextBoxTabIndex="412" DatabaseField="hx4e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Egg donor</TD>
									<TD>
										<def:datafieldcontrol id="hx4f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4f"
											FieldTextBoxTabIndex="413" DatabaseField="hx4f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Eggs or embryos frozen</TD>
									<TD>
										<def:datafieldcontrol id="hx4g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4g"
											FieldTextBoxTabIndex="414" DatabaseField="hx4g" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Other (specify)<BR>
										<def:datafieldcontrol id="hx4hs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx4hs"
											FieldTextBoxTabIndex="415" DatabaseField="hx4hs" FieldTextBoxWidth="200px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx4h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx4h"
											FieldTextBoxTabIndex="416" DatabaseField="hx4h" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">5. Any of the following health problems during 
										pregnancy?</TD>
								</TR>
								<TR>
									<TD>a. Fever</TD>
									<TD>(0=NO, 1=YES)
										<def:datafieldcontrol id="hx5a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5a"
											FieldTextBoxTabIndex="417" DatabaseField="hx5a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx5b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5b"
											FieldTextBoxTabIndex="418" DatabaseField="hx5b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Viral illness</TD>
									<TD>
										<def:datafieldcontrol id="hx5c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5c"
											FieldTextBoxTabIndex="419" DatabaseField="hx5c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Diabetes</TD>
									<TD>
										<def:datafieldcontrol id="hx5d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5d"
											FieldTextBoxTabIndex="420" DatabaseField="hx5d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Preterm labor</TD>
									<TD>
										<def:datafieldcontrol id="hx5e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5e"
											FieldTextBoxTabIndex="421" DatabaseField="hx5e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other major illness
										<def:datafieldcontrol id="hx5fs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx5fs"
											FieldTextBoxTabIndex="423" DatabaseField="hx5fs" FieldTextBoxWidth="150px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx5f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5f"
											FieldTextBoxTabIndex="422" DatabaseField="hx5f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Vaginal Bleeding</TD>
									<TD>
										<def:datafieldcontrol id="hx5g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5g"
											FieldTextBoxTabIndex="424" DatabaseField="hx5g" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Generalized edema</TD>
									<TD>
										<def:datafieldcontrol id="hx5h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5h"
											FieldTextBoxTabIndex="425" DatabaseField="hx5h" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Proteinuria</TD>
									<TD>
										<def:datafieldcontrol id="hx5i" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5i"
											FieldTextBoxTabIndex="426" DatabaseField="hx5i" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. High blood pressure</TD>
									<TD>
										<def:datafieldcontrol id="hx5j" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx5j"
											FieldTextBoxTabIndex="427" DatabaseField="hx5j" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">6. Meds before/after you knew you were pregnant?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<BR>
										1=Yes</TD>
									<TD>0=Before<BR>
										1=After<BR>
										2=Both</TD>
								</TR>
								<TR>
									<TD>a. Antibiotics</TD>
									<TD>
										<def:datafieldcontrol id="hx6a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6a"
											FieldTextBoxTabIndex="428" DatabaseField="hx6a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6awhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6awhen"
											FieldTextBoxTabIndex="429" DatabaseField="hx6awhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Medications for Acne</TD>
									<TD>
										<def:datafieldcontrol id="hx6b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6b"
											FieldTextBoxTabIndex="430" DatabaseField="hx6b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6bwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6bwhen"
											FieldTextBoxTabIndex="431" DatabaseField="hx6bwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Medications for birth control</TD>
									<TD>
										<def:datafieldcontrol id="hx6c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6c"
											FieldTextBoxTabIndex="432" DatabaseField="hx6c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6cwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6cwhen"
											FieldTextBoxTabIndex="433" DatabaseField="hx6cwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Antihypertensives</TD>
									<TD>
										<def:datafieldcontrol id="hx6d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6d"
											FieldTextBoxTabIndex="434" DatabaseField="hx6d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6dwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6dwhen"
											FieldTextBoxTabIndex="435" DatabaseField="hx6dwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Meds for heart or cardiac problems</TD>
									<TD>
										<def:datafieldcontrol id="hx6e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6e"
											FieldTextBoxTabIndex="436" DatabaseField="hx6e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6ewhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6ewhen"
											FieldTextBoxTabIndex="437" DatabaseField="hx6ewhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Meds for Attention Deficit Disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx6f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6f"
											FieldTextBoxTabIndex="438" DatabaseField="hx6f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6fwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6fwhen"
											FieldTextBoxTabIndex="439" DatabaseField="hx6fwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="8557"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Antiepileptics or anti-seizure meds</TD>
									<TD>
										<def:datafieldcontrol id="hx6g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6g"
											FieldTextBoxTabIndex="440" DatabaseField="hx6g" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6gwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6gwhen"
											FieldTextBoxTabIndex="441" DatabaseField="hx6gwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Meds to control diabetes</TD>
									<TD>
										<def:datafieldcontrol id="hx6h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6h"
											FieldTextBoxTabIndex="442" DatabaseField="hx6h" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6hwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6hwhen"
											FieldTextBoxTabIndex="443" DatabaseField="hx6hwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Meds to regulate thyroid</TD>
									<TD>
										<def:datafieldcontrol id="hx6i" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6i"
											FieldTextBoxTabIndex="444" DatabaseField="hx6i" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6iwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6iwhen"
											FieldTextBoxTabIndex="445" DatabaseField="hx6iwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Antidepressants</TD>
									<TD>
										<def:datafieldcontrol id="hx6j" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6j"
											FieldTextBoxTabIndex="446" DatabaseField="hx6j" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6jwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6jwhen"
											FieldTextBoxTabIndex="447" DatabaseField="hx6jwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Mood stabilizers</TD>
									<TD>
										<def:datafieldcontrol id="hx6k" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6k"
											FieldTextBoxTabIndex="448" DatabaseField="hx6k" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6kwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6kwhen"
											FieldTextBoxTabIndex="449" DatabaseField="hx6kwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Tranquilizers</TD>
									<TD>
										<def:datafieldcontrol id="hx6l" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6l"
											FieldTextBoxTabIndex="450" DatabaseField="hx6l" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6lwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6lwhen"
											FieldTextBoxTabIndex="451" DatabaseField="hx6lwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Pain Killers</TD>
									<TD>
										<def:datafieldcontrol id="hx6m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6m"
											FieldTextBoxTabIndex="452" DatabaseField="hx6m" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6mwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6mwhen"
											FieldTextBoxTabIndex="453" DatabaseField="hx6mwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Sedatives or sleeping pills</TD>
									<TD>
										<def:datafieldcontrol id="hx6n" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6n"
											FieldTextBoxTabIndex="454" DatabaseField="hx6n" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6nwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6nwhen"
											FieldTextBoxTabIndex="455" DatabaseField="hx6nwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Anti-inflammatory or Anti-immune drugs</TD>
									<TD>
										<def:datafieldcontrol id="hx6o" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6o"
											FieldTextBoxTabIndex="456" DatabaseField="hx6o" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6owhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6owhen"
											FieldTextBoxTabIndex="457" DatabaseField="hx6owhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Treatment for HIV</TD>
									<TD>
										<def:datafieldcontrol id="hx6p" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6p"
											FieldTextBoxTabIndex="458" DatabaseField="hx6p" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6pwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6pwhen"
											FieldTextBoxTabIndex="459" DatabaseField="hx6pwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Thalidomide (specify why prescribed)<BR>
										<def:datafieldcontrol id="hx6qwhy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx6qwhy"
											FieldTextBoxTabIndex="462" DatabaseField="hx6qwhy" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6q" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6q"
											FieldTextBoxTabIndex="460" DatabaseField="hx6q" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6qwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6qwhen"
											FieldTextBoxTabIndex="461" DatabaseField="hx6qwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Misoprostol (specify why prescribed)<BR>
										<def:datafieldcontrol id="hx6rwhy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx6rwhy"
											FieldTextBoxTabIndex="465" DatabaseField="hx6rwhy" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6r" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6r"
											FieldTextBoxTabIndex="463" DatabaseField="hx6r" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6rwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6rwhen"
											FieldTextBoxTabIndex="464" DatabaseField="hx6rwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Other (specify med and why prescribed)<BR>
										<def:datafieldcontrol id="hx6sspec" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx6sspec"
											FieldTextBoxTabIndex="468" DatabaseField="hx6sspec" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6s" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6s"
											FieldTextBoxTabIndex="466" DatabaseField="hx6s" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6swhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx6swhen"
											FieldTextBoxTabIndex="467" DatabaseField="hx6swhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">7. In this pregnancy, did the doctor tell you that 
										the<BR>
										baby had any of the following health problems?</TD>
								</TR>
								<TR>
									<TD>a. Screen positive on a blood test</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx7a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx7a"
											FieldTextBoxTabIndex="469" DatabaseField="hx7a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal ultrasound or sonogram (specify)<BR>
										<def:datafieldcontrol id="hx7bs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx7bs"
											FieldTextBoxTabIndex="471" DatabaseField="hx7bs" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx7b"
											FieldTextBoxTabIndex="470" DatabaseField="hx7b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Abnormality based on results of amniocentesis or CVS (specify)<BR>
										<def:datafieldcontrol id="hx7cs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx7cs"
											FieldTextBoxTabIndex="473" DatabaseField="hx7cs" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx7c"
											FieldTextBoxTabIndex="472" DatabaseField="hx7c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Other (specify)<BR>
										<def:datafieldcontrol id="hx7ds" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx7ds"
											FieldTextBoxTabIndex="475" DatabaseField="hx7ds" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx7d"
											FieldTextBoxTabIndex="474" DatabaseField="hx7d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">8. In this pregnancy, did you do any of the 
										following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<BR>
										1=Yes</TD>
									<TD>When?</TD>
								</TR>
								<TR>
									<TD>a. Drink alcohol</TD>
									<TD>
										<def:datafieldcontrol id="hx8a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx8a"
											FieldTextBoxTabIndex="476" DatabaseField="hx8a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8awhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx8awhen"
											FieldTextBoxTabIndex="477" DatabaseField="hx8awhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Smoke cigarettes or other tobacco</TD>
									<TD>
										<def:datafieldcontrol id="hx8b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx8b"
											FieldTextBoxTabIndex="478" DatabaseField="hx8b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8bwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx8bwhen"
											FieldTextBoxTabIndex="479" DatabaseField="hx8bwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">9. In this pregnancy did you do any of the 
										following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<BR>
										1=Yes</TD>
									<TD>When?</TD>
								</TR>
								<TR>
									<TD>a. Smoke marijuana</TD>
									<TD>
										<def:datafieldcontrol id="hx9a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9a"
											FieldTextBoxTabIndex="480" DatabaseField="hx9a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9awhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9awhen"
											FieldTextBoxTabIndex="481" DatabaseField="hx9awhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Use Cocaine</TD>
									<TD>
										<def:datafieldcontrol id="hx9b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9b"
											FieldTextBoxTabIndex="482" DatabaseField="hx9b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9bwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9bwhen"
											FieldTextBoxTabIndex="483" DatabaseField="hx9bwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Use Heroin</TD>
									<TD>
										<def:datafieldcontrol id="hx9c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9c"
											FieldTextBoxTabIndex="484" DatabaseField="hx9c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9cwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9cwhen"
											FieldTextBoxTabIndex="485" DatabaseField="hx9cwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Take Methadone</TD>
									<TD>
										<def:datafieldcontrol id="hx9d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9d"
											FieldTextBoxTabIndex="486" DatabaseField="hx9d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9dwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9dwhen"
											FieldTextBoxTabIndex="487" DatabaseField="hx9dwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Take Amphetamines</TD>
									<TD>
										<def:datafieldcontrol id="hx9e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9e"
											FieldTextBoxTabIndex="488" DatabaseField="hx9e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9ewhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9ewhen"
											FieldTextBoxTabIndex="489" DatabaseField="hx9ewhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Take Ecstasy</TD>
									<TD>
										<def:datafieldcontrol id="hx9f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9f"
											FieldTextBoxTabIndex="490" DatabaseField="hx9f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9fwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9fwhen"
											FieldTextBoxTabIndex="491" DatabaseField="hx9fwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Take Hallucinogens</TD>
									<TD>
										<def:datafieldcontrol id="hx9g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9g"
											FieldTextBoxTabIndex="492" DatabaseField="hx9g" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9gwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9gwhen"
											FieldTextBoxTabIndex="493" DatabaseField="hx9gwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Take inhalants</TD>
									<TD>
										<def:datafieldcontrol id="hx9h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9h"
											FieldTextBoxTabIndex="494" DatabaseField="hx9h" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="20847"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9hwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9hwhen"
											FieldTextBoxTabIndex="495" DatabaseField="hx9hwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Other (specify)<BR>
										<def:datafieldcontrol id="hx9is" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx9is"
											FieldTextBoxTabIndex="498" DatabaseField="hx9is" FieldTextBoxWidth="150px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9i" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9i"
											FieldTextBoxTabIndex="496" DatabaseField="hx9i" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9iwhen" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx9iwhen"
											FieldTextBoxTabIndex="497" DatabaseField="hx9iwhen" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="Table1">
								<TR>
									<TD class="heading" colSpan="9">10. Pregnancy questions</TD>
								</TR>
								<TR>
									<TD colSpan="2"></TD>
									<TD>When diagnosed?</TD>
									<TD colSpan="6">When did you have flare-ups?<BR>
										0=NOT Circled<BR>
										1=Circled</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>(0=NO,1=YES)</TD>
									<TD>0=Before<BR>
										1=During<BR>
										2=After</TD>
									<TD>More than 2<BR>
										years before</TD>
									<TD>During 2<BR>
										years before</TD>
									<TD>First<BR>
										Trimester</TD>
									<TD>Second<BR>
										Trimester</TD>
									<TD>Third<BR>
										Trimester</TD>
									<TD>During 2<BR>
										years after</TD>
								</TR>
								<TR>
									<TD>a. Autoimmune disease</TD>
									<TD>
										<def:datafieldcontrol id="hx10a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10a"
											FieldTextBoxTabIndex="498" DatabaseField="hx10a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10awhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10awhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10awhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10afb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10afb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10afb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10af2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10af2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10af2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10aft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10aft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10aft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10aft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10aft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10aft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10aft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10aft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10aft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10afa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10afa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10afa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Alopecia</TD>
									<TD>
										<def:datafieldcontrol id="hx10b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10b"
											FieldTextBoxTabIndex="498" DatabaseField="hx10b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10bfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10bfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10bfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="5944"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Autoimmune thyroid desease</TD>
									<TD>
										<def:datafieldcontrol id="hx10c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10c"
											FieldTextBoxTabIndex="498" DatabaseField="hx10c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="5955"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="5956"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10cfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10cfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10cfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="5957"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Idiopathic thrombocytopenicpurpura</TD>
									<TD>
										<def:datafieldcontrol id="hx10d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10d"
											FieldTextBoxTabIndex="498" DatabaseField="hx10d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10dwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10dwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10dwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10dfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10dfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10dfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10df2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10df2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10df2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10dft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10dft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10dft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10dft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10dft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10dft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10dft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10dft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10dft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10dfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10dfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10dfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="9551"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Inflammatory bowel disease</TD>
									<TD>
										<def:datafieldcontrol id="hx10e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10e"
											FieldTextBoxTabIndex="498" DatabaseField="hx10e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ewhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ewhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ewhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10efb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10efb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10efb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ef2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ef2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ef2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10eft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10eft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10eft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10eft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10eft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10eft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10eft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10eft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10eft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="9572"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10efa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10efa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10efa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="9575"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Psoriasis</TD>
									<TD>
										<def:datafieldcontrol id="hx10f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10f"
											FieldTextBoxTabIndex="498" DatabaseField="hx10f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10fwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10fwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10fwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ffb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ffb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ffb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ff2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ff2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ff2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10fft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10fft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10fft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10fft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10fft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10fft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10fft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10fft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10fft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ffa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ffa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ffa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Rheumatoid arthritis</TD>
									<TD>
										<def:datafieldcontrol id="hx10g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10g"
											FieldTextBoxTabIndex="498" DatabaseField="hx10g" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10gfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10gfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10gfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Type 1 diabetes mellitus</TD>
									<TD>
										<def:datafieldcontrol id="hx10h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10h"
											FieldTextBoxTabIndex="498" DatabaseField="hx10h" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10hfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10hfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10hfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Uveitis</TD>
									<TD>
										<def:datafieldcontrol id="hx10i" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10i"
											FieldTextBoxTabIndex="498" DatabaseField="hx10i" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10iwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10iwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10iwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ifb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ifb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ifb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10if2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10if2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10if2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ift1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ift1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ift1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ift2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ift2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ift2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ift3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ift3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ift3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ifa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ifa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ifa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Vasculitis</TD>
									<TD>
										<def:datafieldcontrol id="hx10j" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10j"
											FieldTextBoxTabIndex="498" DatabaseField="hx10j" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10jfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10jfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10jfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Vitiligo</TD>
									<TD>
										<def:datafieldcontrol id="hx10k" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10k"
											FieldTextBoxTabIndex="498" DatabaseField="hx10k" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10kfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10kfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10kfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Asthma</TD>
									<TD>
										<def:datafieldcontrol id="hx10l" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10l"
											FieldTextBoxTabIndex="498" DatabaseField="hx10l" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10lfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10lfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10lfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Allergies</TD>
									<TD>
										<def:datafieldcontrol id="hx10m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10m"
											FieldTextBoxTabIndex="498" DatabaseField="hx10m" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10mfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10mfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10mfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Allergic rhinitis</TD>
									<TD>
										<def:datafieldcontrol id="hx10n" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10n"
											FieldTextBoxTabIndex="498" DatabaseField="hx10n" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10nfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10nfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10nfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Anaphylaxis</TD>
									<TD>
										<def:datafieldcontrol id="hx10o" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10o"
											FieldTextBoxTabIndex="498" DatabaseField="hx10o" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10owhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10owhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10owhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ofb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ofb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ofb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10of2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10of2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10of2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10oft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10oft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10oft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10oft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10oft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10oft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10oft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10oft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10oft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10ofa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10ofa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10ofa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Angioedema</TD>
									<TD>
										<def:datafieldcontrol id="hx10p" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10p"
											FieldTextBoxTabIndex="498" DatabaseField="hx10p" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10pfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10pfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10pfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Atopic Eczema</TD>
									<TD>
										<def:datafieldcontrol id="hx10q" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10q"
											FieldTextBoxTabIndex="498" DatabaseField="hx10q" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10qfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10qfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10qfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>r. Conjuctivitis</TD>
									<TD>
										<def:datafieldcontrol id="hx10r" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10r"
											FieldTextBoxTabIndex="498" DatabaseField="hx10r" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rwhn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rwhn"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rwhn" FieldTextBoxWidth="30px" ValidList="0,1,2,-7,-8,-9,9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rfb2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rfb2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rfb2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rf2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rf2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rf2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rft1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rft1"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rft1" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rft2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rft2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rft2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rft3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rft3"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rft3" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx10rfa2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx10rfa2"
											FieldTextBoxTabIndex="498" DatabaseField="hx10rfa2" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>11. Were you given any meds to induce labor?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx11"
											FieldTextBoxTabIndex="499" DatabaseField="hx11" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>11b. Did you have a spinal?</TD>
									<TD>
										<def:datafieldcontrol id="hx11b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx11b"
											FieldTextBoxTabIndex="500" DatabaseField="hx11b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>12. How much did the child weigh at birth?</TD>
									<TD>
										<def:datafieldcontrol id="hx12wtpd" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pounds"
											FieldTextBoxTabIndex="501" DatabaseField="hx12wtpd" FieldTextBoxWidth="30px"></def:datafieldcontrol>
										<def:datafieldcontrol id="hx12wtoz" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="ounces"
											FieldTextBoxTabIndex="502" DatabaseField="hx12wtoz" FieldTextBoxWidth="30px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>12b. APGAR scores at:</TD>
									<TD>
										<def:datafieldcontrol id="hx12ap1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1 minute"
											FieldTextBoxTabIndex="503" DatabaseField="hx12ap1" FieldTextBoxWidth="30px"></def:datafieldcontrol>
										<def:datafieldcontrol id="hx12ap5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5 minutes"
											FieldTextBoxTabIndex="504" DatabaseField="hx12ap5" FieldTextBoxWidth="30px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">13. Did this child need any of the following during labor?</TD>
									<TD>0=No<BR>
										1=Yes</TD>
								</TR>
								<TR>
									<TD>a. Resuscitation</TD>
									<TD>
										<def:datafieldcontrol id="hx13a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13a"
											FieldTextBoxTabIndex="505" DatabaseField="hx13a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Forceps/vacuum extraction</TD>
									<TD>
										<def:datafieldcontrol id="hx13b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13b"
											FieldTextBoxTabIndex="506" DatabaseField="hx13b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Meconium stain</TD>
									<TD>
										<def:datafieldcontrol id="hx13c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13c"
											FieldTextBoxTabIndex="507" DatabaseField="hx13c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Cord prolapse</TD>
									<TD>
										<def:datafieldcontrol id="hx13d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13d"
											FieldTextBoxTabIndex="508" DatabaseField="hx13d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Nonvertex presentation</TD>
									<TD>
										<def:datafieldcontrol id="hx13e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13e"
											FieldTextBoxTabIndex="509" DatabaseField="hx13e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Trauma on delivery</TD>
									<TD>
										<def:datafieldcontrol id="hx13f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13f"
											FieldTextBoxTabIndex="510" DatabaseField="hx13f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Respiratory distress syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx13g" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13g"
											FieldTextBoxTabIndex="511" DatabaseField="hx13g" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Septicemia/meningitis</TD>
									<TD>
										<def:datafieldcontrol id="hx13h" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13h"
											FieldTextBoxTabIndex="512" DatabaseField="hx13h" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Hyperbilirubinemia</TD>
									<TD>
										<def:datafieldcontrol id="hx13i" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13i"
											FieldTextBoxTabIndex="513" DatabaseField="hx13i" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Anemia requiring transfusion</TD>
									<TD>
										<def:datafieldcontrol id="hx13j" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13j"
											FieldTextBoxTabIndex="514" DatabaseField="hx13j" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Irritable/floppy infant/convulsions</TD>
									<TD>
										<def:datafieldcontrol id="hx13k" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13k"
											FieldTextBoxTabIndex="515" DatabaseField="hx13k" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Clinical dysmaturity</TD>
									<TD>
										<def:datafieldcontrol id="hx13l" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13l"
											FieldTextBoxTabIndex="516" DatabaseField="hx13l" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Difficulty regulating temperature</TD>
									<TD>
										<def:datafieldcontrol id="hx13m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13m"
											FieldTextBoxTabIndex="517" DatabaseField="hx13m" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Oxygen treatment</TD>
									<TD>
										<def:datafieldcontrol id="hx13n" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx13n"
											FieldTextBoxTabIndex="518" DatabaseField="hx13n" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" height="78">
								<TR>
									<TD class="heading" colSpan="2">14. Did this child stay in the neonatal intensive 
										care unit?<BR>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx14"
											FieldTextBoxTabIndex="519" DatabaseField="hx14" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. If yes, how long?</TD>
									<TD>
										<def:datafieldcontrol id="hx14d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Days"
											FieldTextBoxTabIndex="520" DatabaseField="hx14d" FieldTextBoxWidth="30px" FieldTextBoxTextDefault="-9"></def:datafieldcontrol><B>OR
											<def:datafieldcontrol id="hx14hr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
												IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Hours"
												FieldTextBoxTabIndex="521" DatabaseField="hx14hr" FieldTextBoxWidth="30px" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></B></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">15. How many days or hours did this child stay in hospital?</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx15d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Days"
											FieldTextBoxTabIndex="522" DatabaseField="hx15d" FieldTextBoxWidth="30px"></def:datafieldcontrol><B>OR</B>
										<def:datafieldcontrol id="hx15hr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Hours"
											FieldTextBoxTabIndex="523" DatabaseField="hx15hr" FieldTextBoxWidth="30px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">16. Has this child ever had seizures or 
										convulsions?<BR>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16"
											FieldTextBoxTabIndex="524" DatabaseField="hx16" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. When was the first?<BR>
										0=First Month<BR>
										1=1-12 Months<BR>
										2=12-24 Months<BR>
										3=2-5 Years
										<BR>
										4= &gt; 5 Years</TD>
									<TD>
										<def:datafieldcontrol id="hx16a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16a"
											FieldTextBoxTabIndex="525" DatabaseField="hx16a" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Does this child have seizures now?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx16b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16b"
											FieldTextBoxTabIndex="526" DatabaseField="hx16b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Did the seizures only occur when this child had a fever</TD>
									<TD>
										<def:datafieldcontrol id="hx16c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16c"
											FieldTextBoxTabIndex="527" DatabaseField="hx16c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Does this child now take meds to control seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx16d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16d"
											FieldTextBoxTabIndex="528" DatabaseField="hx16d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">17. Has child ever...</TD>
								</TR>
								<TR>
									<TD>a. Had an abnormal picture of the brain</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx17a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17a"
											FieldTextBoxTabIndex="529" DatabaseField="hx17a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="30">b. Been hospitalized for meningitis</TD>
									<TD height="30">
										<def:datafieldcontrol id="hx17b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17b"
											FieldTextBoxTabIndex="530" DatabaseField="hx17b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Lost consciousness due to a head injury</TD>
									<TD>
										<def:datafieldcontrol id="hx17c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17c"
											FieldTextBoxTabIndex="531" DatabaseField="hx17c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="2">At what age(s) did child lose consciousness</TD>
								</TR>
								<TR>
									<TD>Years</TD>
									<TD><B><U>OR</U></B> Months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx17c1y" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1."
											FieldTextBoxTabIndex="532" DatabaseField="hx17c1y" FieldLabelWidth="20px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17c1m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17c1m"
											FieldTextBoxTabIndex="533" DatabaseField="hx17c1m" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx17c2y" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2."
											FieldTextBoxTabIndex="534" DatabaseField="hx17c2y" FieldLabelWidth="20px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17c2m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17c2m"
											FieldTextBoxTabIndex="535" DatabaseField="hx17c2m" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx17c3y" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3."
											FieldTextBoxTabIndex="536" DatabaseField="hx17c3y" FieldLabelWidth="20px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17c3m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17c3m"
											FieldTextBoxTabIndex="537" DatabaseField="hx17c3m" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">18. Did your child have any of the following birth 
										defects?</TD>
								</TR>
								<TR>
									<TD>a. Cleft lip of palate</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx18a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18a"
											FieldTextBoxTabIndex="538" DatabaseField="hx18a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal shape of hands, feet, arms or legs</TD>
									<TD>
										<def:datafieldcontrol id="hx18b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18b"
											FieldTextBoxTabIndex="539" DatabaseField="hx18b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Open spine</TD>
									<TD>
										<def:datafieldcontrol id="hx18c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18c"
											FieldTextBoxTabIndex="540" DatabaseField="hx18c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Heart defect (specify)<BR>
										<def:datafieldcontrol id="hx18ds" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx18ds"
											FieldTextBoxTabIndex="542" DatabaseField="hx18ds" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx18d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18d"
											FieldTextBoxTabIndex="541" DatabaseField="hx18d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Kidney defect (specify)<BR>
										<def:datafieldcontrol id="hx18es" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx18es"
											FieldTextBoxTabIndex="544" DatabaseField="hx18es" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx18e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18e"
											FieldTextBoxTabIndex="543" DatabaseField="hx18e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other defect (specify)<BR>
										<def:datafieldcontrol id="hx18fs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx18fs"
											FieldTextBoxTabIndex="546" DatabaseField="hx18fs" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx18f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18f"
											FieldTextBoxTabIndex="545" DatabaseField="hx18f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD width="273">19. Does the child have any other chronic medical problems?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx19"
											FieldTextBoxTabIndex="547" DatabaseField="hx19" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">a. Medical problem #1</TD>
									<TD>
										<def:datafieldcontrol id="hx19apr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx19apr"
											FieldTextBoxTabIndex="548" DatabaseField="hx19apr" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #1</TD>
									<TD>
										<def:datafieldcontrol id="hx19ah" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx19ah"
											FieldTextBoxTabIndex="549" DatabaseField="hx19ah" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">b. Medical problem #2</TD>
									<TD>
										<def:datafieldcontrol id="hx19bpr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx19bpr"
											FieldTextBoxTabIndex="551" DatabaseField="hx19bpr" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #2</TD>
									<TD>
										<def:datafieldcontrol id="hx19bh" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx19bh"
											FieldTextBoxTabIndex="552" DatabaseField="hx19bh" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">c. Medical problem #3</TD>
									<TD>
										<def:datafieldcontrol id="hx19cpr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx19cpr"
											FieldTextBoxTabIndex="554" DatabaseField="hx19cpr" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #3</TD>
									<TD>
										<def:datafieldcontrol id="hx19ch" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx19ch"
											FieldTextBoxTabIndex="555" DatabaseField="hx19ch" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">20. Did this child recieve all vaccinations on schedule...</TD>
									<TD>(0=NO, 1=YES)<BR>
										<def:datafieldcontrol id="hx20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx20"
											FieldTextBoxTabIndex="555" DatabaseField="hx20" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. This child did not receive any vaccinations</TD>
									<TD>
										<def:datafieldcontrol id="hx20a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx20a"
											FieldTextBoxTabIndex="555" DatabaseField="hx20a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. This child received some, but not all vaccinations</TD>
									<TD>
										<def:datafieldcontrol id="hx20b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx20b"
											FieldTextBoxTabIndex="555" DatabaseField="hx20b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="5">21. Please fill in the information below for each 
										vaccine.</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD>Please check one</TD>
									<TD colSpan="2">If Received</TD>
								</TR>
								<TR>
									<TD>IMMUNIZATION</TD>
									<TD>VACCINE</TD>
									<TD>1=Did not receive<BR>
										2=Received on recommended schedule<BR>
										3=Recieved later than recommended<BR>
										4=Received in seperate doses
									</TD>
									<TD>Date Recieved<BR>
										if known</TD>
									<TD></TD>
								</TR>
								<TR>
									<TD rowSpan="4">DIPTHERIA,<BR>
										TETANUS,<BR>
										PERTUSSIS<BR>
										(DTP or DT or td)</TD>
									<TD>1=DTP<BR>
										2=DT<BR>
										<def:datafieldcontrol id="hx21a1tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a1tp"
											FieldTextBoxTabIndex="667" DatabaseField="hx21a1tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a1wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a1wn"
											FieldTextBoxTabIndex="668" DatabaseField="hx21a1wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a1dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a1dt"
											FieldTextBoxTabIndex="669" DatabaseField="hx21a1dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>T1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21a2tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a2tp"
											FieldTextBoxTabIndex="670" DatabaseField="hx21a2tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a2wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a2wn"
											FieldTextBoxTabIndex="671" DatabaseField="hx21a2wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a2dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a2dt"
											FieldTextBoxTabIndex="672" DatabaseField="hx21a2dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>T2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21a3tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a3tp"
											FieldTextBoxTabIndex="673" DatabaseField="hx21a3tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a3wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a3wn"
											FieldTextBoxTabIndex="674" DatabaseField="hx21a3wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a3dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a3dt"
											FieldTextBoxTabIndex="675" DatabaseField="hx21a3dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>T3</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21a4tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a4tp"
											FieldTextBoxTabIndex="676" DatabaseField="hx21a4tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a4wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a4wn"
											FieldTextBoxTabIndex="677" DatabaseField="hx21a4wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21a4dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21a4dt"
											FieldTextBoxTabIndex="678" DatabaseField="hx21a4dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>T4</TD>
								</TR>
								<TR>
									<TD rowSpan="4">POLIO<BR>
										OPV(by mouth) or
										<BR>
										IPV(injectable)</TD>
									<TD>1=OPV<BR>
										2=IPV<BR>
										<def:datafieldcontrol id="hx21b1tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b1tp"
											FieldTextBoxTabIndex="679" DatabaseField="hx21b1tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b1wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b1wn"
											FieldTextBoxTabIndex="680" DatabaseField="hx21b1wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b1dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b1dt"
											FieldTextBoxTabIndex="681" DatabaseField="hx21b1dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>P1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21b2tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b2tp"
											FieldTextBoxTabIndex="682" DatabaseField="hx21b2tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b2wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b2wn"
											FieldTextBoxTabIndex="683" DatabaseField="hx21b2wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b2dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b2dt"
											FieldTextBoxTabIndex="684" DatabaseField="hx21b2dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>P2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21b3tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b3tp"
											FieldTextBoxTabIndex="685" DatabaseField="hx21b3tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b3wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b3wn"
											FieldTextBoxTabIndex="686" DatabaseField="hx21b3wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b3dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b3dt"
											FieldTextBoxTabIndex="687" DatabaseField="hx21b3dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>P3</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21b4tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b4tp"
											FieldTextBoxTabIndex="688" DatabaseField="hx21b4tp" FieldTextBoxWidth="30px" ValidList="1,2,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b4wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b4wn"
											FieldTextBoxTabIndex="689" DatabaseField="hx21b4wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21b4dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21b4dt"
											FieldTextBoxTabIndex="690" DatabaseField="hx21b4dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>P4</TD>
								</TR>
								<TR>
									<TD>MEASLES, MUMPS<BR>
										RUBELLA MMR</TD>
									<TD>1=MMR<BR>
										<def:datafieldcontrol id="hx21c1tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21c1tp"
											FieldTextBoxTabIndex="691" DatabaseField="hx21c1tp" FieldTextBoxWidth="30px" ValidList="1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21c1wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21c1wn"
											FieldTextBoxTabIndex="692" DatabaseField="hx21c1wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21c1dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21c1dt"
											FieldTextBoxTabIndex="693" DatabaseField="hx21c1dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>M1</TD>
								</TR>
								<TR>
									<TD rowSpan="3">HAEMOPHILUS<BR>
										INFLUENZA TYPE B<BR>
										hib</TD>
									<TD>1=Hib<BR>
										<def:datafieldcontrol id="hx21d1tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d1tp"
											FieldTextBoxTabIndex="694" DatabaseField="hx21d1tp" FieldTextBoxWidth="30px" ValidList="1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21d1wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d1wn"
											FieldTextBoxTabIndex="695" DatabaseField="hx21d1wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21d1dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d1dt"
											FieldTextBoxTabIndex="696" DatabaseField="hx21d1dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>H1</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21d2tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d2tp"
											FieldTextBoxTabIndex="697" DatabaseField="hx21d2tp" FieldTextBoxWidth="30px" ValidList="1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21d2wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d2wn"
											FieldTextBoxTabIndex="698" DatabaseField="hx21d2wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21d2dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d2dt"
											FieldTextBoxTabIndex="699" DatabaseField="hx21d2dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>H2</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx21d3tp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d3tp"
											FieldTextBoxTabIndex="700" DatabaseField="hx21d3tp" FieldTextBoxWidth="30px" ValidList="1,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21d3wn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d3wn"
											FieldTextBoxTabIndex="701" DatabaseField="hx21d3wn" FieldTextBoxWidth="30px" ValidList="1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx21d3dt" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx21d3dt"
											FieldTextBoxTabIndex="702" DatabaseField="hx21d3dt" FieldTextBoxWidth="80px" FormatString="{0:d}"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>H3</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="557" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdby"
											FieldTextBoxTabIndex="558" DatabaseField="createdby" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="559" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedby"
											FieldTextBoxTabIndex="560" DatabaseField="updatedby" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
