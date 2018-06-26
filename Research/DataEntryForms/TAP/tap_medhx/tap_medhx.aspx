
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="tap_medhx.tap_medhx" CodeFile="tap_medhx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_medhx" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP Medical &amp; Psych. Hx"
							PrimaryKeyField="medhx_pk" VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="417"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hxdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="hxdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hxrelat" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Relationship"
										FieldTextBoxTabIndex="4" DatabaseField="hxrelat" FieldLabelWidth="80px" FieldTextBoxWidth="30px" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol>
									<div>1=biological mother<br/>
										2=stepmother<br/>
										3=biological father<br/>
										4=stepfather<br/>
										5=adoptive mother<br/>
										6=adoptive father<br/>
										7=Other<br/>
										9=Missing/Blank<br/>
									</div>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">In all cases:</TD>
								</TR>
								<TR>
									<TD>9=Missing/Blank<br/>
										-7=Don't Know<br/>
										-8=Refused to Answer<br/>
										-9=Does Not Apply</TD>
								</TR>
							</TABLE>
							<br/>
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
									<TD>a. What was the outcome?<br/>
										<DIV>0=Live Birth<br/>
											1=Live Birth, child still living
											<br/>
											3=Stillbirth<br/>
											4=Elective Termination<br/>
											5=Miscarriage</DIV>
									</TD>
									<TD>
										<def:datafieldcontrol id="hx1a1" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1a1" FieldTextBoxTabIndex="5"
											FieldLabelText="hx1a1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a2" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1a2" FieldTextBoxTabIndex="15"
											FieldLabelText="hx1a2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a3" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1a3" FieldTextBoxTabIndex="25"
											FieldLabelText="hx1a3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a4" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1a4" FieldTextBoxTabIndex="35"
											FieldLabelText="hx1a4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a5" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1a5" FieldTextBoxTabIndex="45"
											FieldLabelText="hx1a4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Date of Birth</TD>
									<TD>
										<def:datafieldcontrol id="hx1b1" runat="server" FieldTextBoxWidth="70px" DatabaseField="hx1b1" FieldTextBoxTabIndex="9"
											FieldLabelText="hx1b1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b2" runat="server" FieldTextBoxWidth="70px" DatabaseField="hx1b2" FieldTextBoxTabIndex="19"
											FieldLabelText="hx1b2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b3" runat="server" FieldTextBoxWidth="70px" DatabaseField="hx1b3" FieldTextBoxTabIndex="29"
											FieldLabelText="hx1b3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b4" runat="server" FieldTextBoxWidth="70px" DatabaseField="hx1b4" FieldTextBoxTabIndex="39"
											FieldLabelText="hx1b4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b5" runat="server" FieldTextBoxWidth="70px" DatabaseField="hx1b5" FieldTextBoxTabIndex="49"
											FieldLabelText="hx1b5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Week of delivery<br/>
										<DIV>0=Greater than 37<br/>
											1=Less than 28<br/>
											2=Between 28 and 32<br/>
											3=Between 32 and 37<br/>
											4=Unknown</DIV>
									</TD>
									<TD>
										<def:datafieldcontrol id="hx1c1" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1c1" FieldTextBoxTabIndex="10"
											FieldLabelText="hx1c1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c2" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1c2" FieldTextBoxTabIndex="20"
											FieldLabelText="hx1c2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c3" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1c3" FieldTextBoxTabIndex="30"
											FieldLabelText="hx1c3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c4" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1c4" FieldTextBoxTabIndex="40"
											FieldLabelText="hx1c4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c5" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1c5" FieldTextBoxTabIndex="50"
											FieldLabelText="hx1c5" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="tblentry" id="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="hx2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="100px" DatabaseField="hx2"
											FieldTextBoxTabIndex="55" FieldLabelText="2. Pregnancy number of child in study" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="15">3. Medical history of child and child's blood 
										relatives</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>(0=N0, 1=YES,<br/>
										2=NOT SURE)</TD>
									<TD colSpan="12">(0=unchecked, 1=checked)</TD>
								</TR>
								<TR>
									<TD>Disorder</TD>
									<TD>Child/blood relative<br/>
										has disorder<br/>
									</TD>
									<TD>Child</TD>
									<TD colSpan="2">Parents<br/>
										of Child</TD>
									<TD>Siblings</TD>
									<TD colSpan="2">1/2<br/>
										Siblings</TD>
									<TD colSpan="2">First<br/>
										Cousins</TD>
									<TD colSpan="2">Aunts &amp;<br/>
										Uncles</TD>
									<TD colSpan="2">Grand-<br/>
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
										<def:datafieldcontrol id="hx3ahas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ahas" FieldTextBoxTabIndex="56"
											FieldLabelText="hx3ahas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3achld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3achld" FieldTextBoxTabIndex="57"
											FieldLabelText="hx3achld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3amom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3amom" FieldTextBoxTabIndex="58"
											FieldLabelText="hx3amom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3adad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3adad" FieldTextBoxTabIndex="59"
											FieldLabelText="hx3adad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3asib" FieldTextBoxTabIndex="60"
											FieldLabelText="hx3asib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3asibm" FieldTextBoxTabIndex="61"
											FieldLabelText="hx3asibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3asibp" FieldTextBoxTabIndex="62"
											FieldLabelText="hx3asibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3acoum" FieldTextBoxTabIndex="63"
											FieldLabelText="hx3acoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3acoup" FieldTextBoxTabIndex="64"
											FieldLabelText="hx3acoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3aaum" FieldTextBoxTabIndex="65"
											FieldLabelText="hx3aaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3aaup" FieldTextBoxTabIndex="66"
											FieldLabelText="hx3aaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0" DESIGNTIMEDRAGDROP="25003"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3agpm" FieldTextBoxTabIndex="67"
											FieldLabelText="hx3agpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3agpp" FieldTextBoxTabIndex="68"
											FieldLabelText="hx3agpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3aotr" FieldTextBoxTabIndex="69"
											FieldLabelText="hx3aotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="25012"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Fragile X</TD>
									<TD>
										<def:datafieldcontrol id="hx3bhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bhas" FieldTextBoxTabIndex="75"
											FieldLabelText="hx3bhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bchld" FieldTextBoxTabIndex="76"
											FieldLabelText="hx3bchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bmom" FieldTextBoxTabIndex="77"
											FieldLabelText="hx3bmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bdad" FieldTextBoxTabIndex="78"
											FieldLabelText="hx3bdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bsib" FieldTextBoxTabIndex="79"
											FieldLabelText="hx3bsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bsibm" FieldTextBoxTabIndex="80"
											FieldLabelText="hx3bsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bsibp" FieldTextBoxTabIndex="81"
											FieldLabelText="hx3bsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bcoum" FieldTextBoxTabIndex="82"
											FieldLabelText="hx3bcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bcoup" FieldTextBoxTabIndex="83"
											FieldLabelText="hx3bcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3baum" FieldTextBoxTabIndex="84"
											FieldLabelText="hx3baum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3baup" FieldTextBoxTabIndex="85"
											FieldLabelText="hx3baup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bgpm" FieldTextBoxTabIndex="86"
											FieldLabelText="hx3bgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3bgpp" FieldTextBoxTabIndex="87"
											FieldLabelText="hx3bgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3botr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3botr" FieldTextBoxTabIndex="88"
											FieldLabelText="hx3botr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Tuberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3chas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3chas" FieldTextBoxTabIndex="89"
											FieldLabelText="hx3chas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3cchld" FieldTextBoxTabIndex="90"
											FieldLabelText="hx3cchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3cmom" FieldTextBoxTabIndex="91"
											FieldLabelText="hx3cmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3cdad" FieldTextBoxTabIndex="92"
											FieldLabelText="hx3cdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3csib" FieldTextBoxTabIndex="93"
											FieldLabelText="hx3csib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3csibm" FieldTextBoxTabIndex="94"
											FieldLabelText="hx3csibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3csibp" FieldTextBoxTabIndex="95"
											FieldLabelText="hx3csibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ccoum" FieldTextBoxTabIndex="96"
											FieldLabelText="hx3ccoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ccoup" FieldTextBoxTabIndex="97"
											FieldLabelText="hx3ccoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3caum" FieldTextBoxTabIndex="98"
											FieldLabelText="hx3caum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3caup" FieldTextBoxTabIndex="99"
											FieldLabelText="hx3caup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3cgpm" FieldTextBoxTabIndex="100"
											FieldLabelText="hx3cgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3cgpp" FieldTextBoxTabIndex="101"
											FieldLabelText="hx3cgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3cotr" FieldTextBoxTabIndex="102"
											FieldLabelText="hx3cotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Neurofibromatosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3dhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dhas" FieldTextBoxTabIndex="103"
											FieldLabelText="hx3dhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dchld" FieldTextBoxTabIndex="104"
											FieldLabelText="hx3dchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dmom" FieldTextBoxTabIndex="105"
											FieldLabelText="hx3dmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ddad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ddad" FieldTextBoxTabIndex="106"
											FieldLabelText="hx3ddad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dsib" FieldTextBoxTabIndex="107"
											FieldLabelText="hx3dsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dsibm" FieldTextBoxTabIndex="108"
											FieldLabelText="hx3dsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dsibp" FieldTextBoxTabIndex="109"
											FieldLabelText="hx3dsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dcoum" FieldTextBoxTabIndex="110"
											FieldLabelText="hx3dcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dcoup" FieldTextBoxTabIndex="111"
											FieldLabelText="hx3dcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3daum" FieldTextBoxTabIndex="112"
											FieldLabelText="hx3daum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3daup" FieldTextBoxTabIndex="113"
											FieldLabelText="hx3daup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dgpm" FieldTextBoxTabIndex="114"
											FieldLabelText="hx3dgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3dgpp" FieldTextBoxTabIndex="115"
											FieldLabelText="hx3dgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3dotr" FieldTextBoxTabIndex="116"
											FieldLabelText="hx3dotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Rett Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ehas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ehas" FieldTextBoxTabIndex="117"
											FieldLabelText="hx3ehas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3echld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3echld" FieldTextBoxTabIndex="118"
											FieldLabelText="hx3echld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3emom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3emom" FieldTextBoxTabIndex="119"
											FieldLabelText="hx3emom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3edad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3edad" FieldTextBoxTabIndex="120"
											FieldLabelText="hx3edad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3esib" FieldTextBoxTabIndex="121"
											FieldLabelText="hx3esib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3esibm" FieldTextBoxTabIndex="122"
											FieldLabelText="hx3esibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3esibp" FieldTextBoxTabIndex="123"
											FieldLabelText="hx3esibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ecoum" FieldTextBoxTabIndex="124"
											FieldLabelText="hx3ecoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ecoup" FieldTextBoxTabIndex="125"
											FieldLabelText="hx3ecoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3eaum" FieldTextBoxTabIndex="126"
											FieldLabelText="hx3eaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3eaup" FieldTextBoxTabIndex="127"
											FieldLabelText="hx3eaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3egpm" FieldTextBoxTabIndex="128"
											FieldLabelText="hx3egpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3egpp" FieldTextBoxTabIndex="129"
											FieldLabelText="hx3egpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3eotr" FieldTextBoxTabIndex="130"
											FieldLabelText="hx3eotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Childhood Disintegration Disorder (CDD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3fhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fhas" FieldTextBoxTabIndex="131"
											FieldLabelText="hx3fhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fchld" FieldTextBoxTabIndex="132"
											FieldLabelText="hx3fchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fmom" FieldTextBoxTabIndex="133"
											FieldLabelText="hx3fmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fdad" FieldTextBoxTabIndex="134"
											FieldLabelText="hx3fdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fsib" FieldTextBoxTabIndex="135"
											FieldLabelText="hx3fsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fsibm" FieldTextBoxTabIndex="136"
											FieldLabelText="hx3fsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fsibp" FieldTextBoxTabIndex="137"
											FieldLabelText="hx3fsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fcoum" FieldTextBoxTabIndex="138"
											FieldLabelText="hx3fcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fcoup" FieldTextBoxTabIndex="139"
											FieldLabelText="hx3fcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3faum" FieldTextBoxTabIndex="140"
											FieldLabelText="hx3faum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3faup" FieldTextBoxTabIndex="141"
											FieldLabelText="hx3faup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fgpm" FieldTextBoxTabIndex="142"
											FieldLabelText="hx3fgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3fgpp" FieldTextBoxTabIndex="143"
											FieldLabelText="hx3fgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3fotr" FieldTextBoxTabIndex="144"
											FieldLabelText="hx3fotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Prader Willi Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ghas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ghas" FieldTextBoxTabIndex="145"
											FieldLabelText="hx3ghas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gchld" FieldTextBoxTabIndex="146"
											FieldLabelText="hx3gchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gmom" FieldTextBoxTabIndex="147"
											FieldLabelText="hx3gmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gdad" FieldTextBoxTabIndex="148"
											FieldLabelText="hx3gdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gsib" FieldTextBoxTabIndex="149"
											FieldLabelText="hx3gsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gsibm" FieldTextBoxTabIndex="150"
											FieldLabelText="hx3gsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gsibp" FieldTextBoxTabIndex="151"
											FieldLabelText="hx3gsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gcoum" FieldTextBoxTabIndex="152"
											FieldLabelText="hx3gcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gcoup" FieldTextBoxTabIndex="153"
											FieldLabelText="hx3gcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gaum" FieldTextBoxTabIndex="154"
											FieldLabelText="hx3gaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3gaup" FieldTextBoxTabIndex="155"
											FieldLabelText="hx3gaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ggpm" FieldTextBoxTabIndex="156"
											FieldLabelText="hx3ggpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ggpp" FieldTextBoxTabIndex="157"
											FieldLabelText="hx3ggpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3gotr" FieldTextBoxTabIndex="158"
											FieldLabelText="hx3gotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Angelman Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3hhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hhas" FieldTextBoxTabIndex="159"
											FieldLabelText="hx3hhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hchld" FieldTextBoxTabIndex="160"
											FieldLabelText="hx3hchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hmom" FieldTextBoxTabIndex="161"
											FieldLabelText="hx3hmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hdad" FieldTextBoxTabIndex="162"
											FieldLabelText="hx3hdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hsib" FieldTextBoxTabIndex="163"
											FieldLabelText="hx3hsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hsibm" FieldTextBoxTabIndex="164"
											FieldLabelText="hx3hsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hsibp" FieldTextBoxTabIndex="165"
											FieldLabelText="hx3hsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hcoum" FieldTextBoxTabIndex="166"
											FieldLabelText="hx3hcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hcoup" FieldTextBoxTabIndex="167"
											FieldLabelText="hx3hcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3haum" FieldTextBoxTabIndex="168"
											FieldLabelText="hx3haum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3haup" FieldTextBoxTabIndex="169"
											FieldLabelText="hx3haup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hgpm" FieldTextBoxTabIndex="170"
											FieldLabelText="hx3hgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3hgpp" FieldTextBoxTabIndex="171"
											FieldLabelText="hx3hgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3hotr" FieldTextBoxTabIndex="172"
											FieldLabelText="hx3hotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Other chromosomal abnormality, disorder or syndrome (please specify)
										<def:datafieldcontrol id="hx3is" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx3is" FieldTextBoxTabIndex="173"
											FieldLabelText="hx3is" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ihas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ihas" FieldTextBoxTabIndex="174"
											FieldLabelText="hx3ihas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ichld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ichld" FieldTextBoxTabIndex="175"
											FieldLabelText="hx3ichld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3imom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3imom" FieldTextBoxTabIndex="176"
											FieldLabelText="hx3imom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3idad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3idad" FieldTextBoxTabIndex="177"
											FieldLabelText="hx3idad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3isib" FieldTextBoxTabIndex="178"
											FieldLabelText="hx3isib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3isibm" FieldTextBoxTabIndex="179"
											FieldLabelText="hx3isibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3isibp" FieldTextBoxTabIndex="180"
											FieldLabelText="hx3isibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3icoum" FieldTextBoxTabIndex="181"
											FieldLabelText="hx3icoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3icoup" FieldTextBoxTabIndex="182"
											FieldLabelText="hx3icoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3iaum" FieldTextBoxTabIndex="183"
											FieldLabelText="hx3iaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3iaup" FieldTextBoxTabIndex="184"
											FieldLabelText="hx3iaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3igpm" FieldTextBoxTabIndex="185"
											FieldLabelText="hx3igpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3igpp" FieldTextBoxTabIndex="186"
											FieldLabelText="hx3igpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3iotr" FieldTextBoxTabIndex="187"
											FieldLabelText="hx3iotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Congenital rubella</TD>
									<TD>
										<def:datafieldcontrol id="hx3jhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jhas" FieldTextBoxTabIndex="188"
											FieldLabelText="hx3jhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jchld" FieldTextBoxTabIndex="189"
											FieldLabelText="hx3jchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jmom" FieldTextBoxTabIndex="190"
											FieldLabelText="hx3jmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jdad" FieldTextBoxTabIndex="191"
											FieldLabelText="hx3jdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jsib" FieldTextBoxTabIndex="192"
											FieldLabelText="hx3jsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jsibm" FieldTextBoxTabIndex="193"
											FieldLabelText="hx3jsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jsibp" FieldTextBoxTabIndex="194"
											FieldLabelText="hx3jsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jcoum" FieldTextBoxTabIndex="195"
											FieldLabelText="hx3jcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jcoup" FieldTextBoxTabIndex="196"
											FieldLabelText="hx3jcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jaum" FieldTextBoxTabIndex="197"
											FieldLabelText="hx3jaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jaup" FieldTextBoxTabIndex="198"
											FieldLabelText="hx3jaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jgpm" FieldTextBoxTabIndex="199"
											FieldLabelText="hx3jgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3jgpp" FieldTextBoxTabIndex="200"
											FieldLabelText="hx3jgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3jotr" FieldTextBoxTabIndex="201"
											FieldLabelText="hx3jotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. PKU</TD>
									<TD>
										<def:datafieldcontrol id="hx3khas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3khas" FieldTextBoxTabIndex="202"
											FieldLabelText="hx3khas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kchld" FieldTextBoxTabIndex="203"
											FieldLabelText="hx3kchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kmom" FieldTextBoxTabIndex="204"
											FieldLabelText="hx3kmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kdad" FieldTextBoxTabIndex="205"
											FieldLabelText="hx3kdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ksib" FieldTextBoxTabIndex="206"
											FieldLabelText="hx3ksib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ksibm" FieldTextBoxTabIndex="207"
											FieldLabelText="hx3ksibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ksibp" FieldTextBoxTabIndex="208"
											FieldLabelText="hx3ksibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kcoum" FieldTextBoxTabIndex="209"
											FieldLabelText="hx3kcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kcoup" FieldTextBoxTabIndex="210"
											FieldLabelText="hx3kcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kaum" FieldTextBoxTabIndex="211"
											FieldLabelText="hx3kaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kaup" FieldTextBoxTabIndex="212"
											FieldLabelText="hx3kaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kgpm" FieldTextBoxTabIndex="213"
											FieldLabelText="hx3kgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3kgpp" FieldTextBoxTabIndex="214"
											FieldLabelText="hx3kgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3kotr" FieldTextBoxTabIndex="215"
											FieldLabelText="hx3kotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Hydrocephalus (water on the brain)</TD>
									<TD>
										<def:datafieldcontrol id="hx3lhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lhas" FieldTextBoxTabIndex="216"
											FieldLabelText="hx3lhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lchld" FieldTextBoxTabIndex="217"
											FieldLabelText="hx3lchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lmom" FieldTextBoxTabIndex="218"
											FieldLabelText="hx3lmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ldad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ldad" FieldTextBoxTabIndex="219"
											FieldLabelText="hx3ldad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lsib" FieldTextBoxTabIndex="220"
											FieldLabelText="hx3lsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lsibm" FieldTextBoxTabIndex="221"
											FieldLabelText="hx3lsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lsibp" FieldTextBoxTabIndex="222"
											FieldLabelText="hx3lsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lcoum" FieldTextBoxTabIndex="223"
											FieldLabelText="hx3lcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lcoup" FieldTextBoxTabIndex="224"
											FieldLabelText="hx3lcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3laum" FieldTextBoxTabIndex="225"
											FieldLabelText="hx3laum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3laup" FieldTextBoxTabIndex="226"
											FieldLabelText="hx3laup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lgpm" FieldTextBoxTabIndex="227"
											FieldLabelText="hx3lgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3lgpp" FieldTextBoxTabIndex="228"
											FieldLabelText="hx3lgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3lotr" FieldTextBoxTabIndex="229"
											FieldLabelText="hx3lotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="hx3mhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mhas" FieldTextBoxTabIndex="230"
											FieldLabelText="hx3mhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mchld" FieldTextBoxTabIndex="231"
											FieldLabelText="hx3mchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mmom" FieldTextBoxTabIndex="232"
											FieldLabelText="hx3mmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mdad" FieldTextBoxTabIndex="233"
											FieldLabelText="hx3mdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3msib" FieldTextBoxTabIndex="234"
											FieldLabelText="hx3msib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3msibm" FieldTextBoxTabIndex="235"
											FieldLabelText="hx3msibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3msibp" FieldTextBoxTabIndex="236"
											FieldLabelText="hx3msibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mcoum" FieldTextBoxTabIndex="237"
											FieldLabelText="hx3mcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mcoup" FieldTextBoxTabIndex="238"
											FieldLabelText="hx3mcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3maum" FieldTextBoxTabIndex="239"
											FieldLabelText="hx3maum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3maup" FieldTextBoxTabIndex="240"
											FieldLabelText="hx3maup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mgpm" FieldTextBoxTabIndex="241"
											FieldLabelText="hx3mgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3mgpp" FieldTextBoxTabIndex="242"
											FieldLabelText="hx3mgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3motr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3motr" FieldTextBoxTabIndex="243"
											FieldLabelText="hx3motr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Mental retardation</TD>
									<TD>
										<def:datafieldcontrol id="hx3nhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3nhas" FieldTextBoxTabIndex="244"
											FieldLabelText="hx3nhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3nchld" FieldTextBoxTabIndex="245"
											FieldLabelText="hx3nchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3nmom" FieldTextBoxTabIndex="246"
											FieldLabelText="hx3nmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ndad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ndad" FieldTextBoxTabIndex="247"
											FieldLabelText="hx3ndad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3nsib" FieldTextBoxTabIndex="248"
											FieldLabelText="hx3nsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3nsibm" FieldTextBoxTabIndex="249"
											FieldLabelText="hx3nsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3nsibp" FieldTextBoxTabIndex="250"
											FieldLabelText="hx3nsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ncoum" FieldTextBoxTabIndex="251"
											FieldLabelText="hx3ncoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ncoup" FieldTextBoxTabIndex="252"
											FieldLabelText="hx3ncoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3naum" FieldTextBoxTabIndex="253"
											FieldLabelText="hx3naum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3naup" FieldTextBoxTabIndex="254"
											FieldLabelText="hx3naup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ngpm" FieldTextBoxTabIndex="255"
											FieldLabelText="hx3ngpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ngpp" FieldTextBoxTabIndex="256"
											FieldLabelText="hx3ngpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3notr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3notr" FieldTextBoxTabIndex="257"
											FieldLabelText="hx3notr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx3ohas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ohas" FieldTextBoxTabIndex="258"
											FieldLabelText="hx3ohas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ochld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ochld" FieldTextBoxTabIndex="259"
											FieldLabelText="hx3ochld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3omom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3omom" FieldTextBoxTabIndex="260"
											FieldLabelText="hx3omom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3odad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3odad" FieldTextBoxTabIndex="261"
											FieldLabelText="hx3odad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3osib" FieldTextBoxTabIndex="262"
											FieldLabelText="hx3osib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3osibm" FieldTextBoxTabIndex="263"
											FieldLabelText="hx3osibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3osibp" FieldTextBoxTabIndex="264"
											FieldLabelText="hx3osibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ocoum" FieldTextBoxTabIndex="265"
											FieldLabelText="hx3ocoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ocoup" FieldTextBoxTabIndex="266"
											FieldLabelText="hx3ocoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3oaum" FieldTextBoxTabIndex="267"
											FieldLabelText="hx3oaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3oaup" FieldTextBoxTabIndex="268"
											FieldLabelText="hx3oaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ogpm" FieldTextBoxTabIndex="269"
											FieldLabelText="hx3ogpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ogpp" FieldTextBoxTabIndex="270"
											FieldLabelText="hx3ogpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ootr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3ootr" FieldTextBoxTabIndex="271"
											FieldLabelText="hx3ootr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Speech delay requiring therapy</TD>
									<TD>
										<def:datafieldcontrol id="hx3phas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3phas" FieldTextBoxTabIndex="272"
											FieldLabelText="hx3phas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pchld" FieldTextBoxTabIndex="273"
											FieldLabelText="hx3pchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pmom" FieldTextBoxTabIndex="274"
											FieldLabelText="hx3pmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pdad" FieldTextBoxTabIndex="275"
											FieldLabelText="hx3pdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3psib" FieldTextBoxTabIndex="276"
											FieldLabelText="hx3psib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3psibm" FieldTextBoxTabIndex="277"
											FieldLabelText="hx3psibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3psibp" FieldTextBoxTabIndex="278"
											FieldLabelText="hx3psibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pcoum" FieldTextBoxTabIndex="279"
											FieldLabelText="hx3pcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pcoup" FieldTextBoxTabIndex="280"
											FieldLabelText="hx3pcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3paum" FieldTextBoxTabIndex="281"
											FieldLabelText="hx3paum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3paup" FieldTextBoxTabIndex="282"
											FieldLabelText="hx3paup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pgpm" FieldTextBoxTabIndex="283"
											FieldLabelText="hx3pgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3pgpp" FieldTextBoxTabIndex="284"
											FieldLabelText="hx3pgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3potr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3potr" FieldTextBoxTabIndex="285"
											FieldLabelText="hx3potr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Attention Deficit Disorder (ADD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3qhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qhas" FieldTextBoxTabIndex="286"
											FieldLabelText="hx3qhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qchld" FieldTextBoxTabIndex="287"
											FieldLabelText="hx3qchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qmom" FieldTextBoxTabIndex="288"
											FieldLabelText="hx3qmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qdad" FieldTextBoxTabIndex="289"
											FieldLabelText="hx3qdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qsib" FieldTextBoxTabIndex="290"
											FieldLabelText="hx3qsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qsibm" FieldTextBoxTabIndex="291"
											FieldLabelText="hx3qsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qsibp" FieldTextBoxTabIndex="292"
											FieldLabelText="hx3qsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qcoum" FieldTextBoxTabIndex="293"
											FieldLabelText="hx3qcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qcoup" FieldTextBoxTabIndex="294"
											FieldLabelText="hx3qcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qaum" FieldTextBoxTabIndex="295"
											FieldLabelText="hx3qaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qaup" FieldTextBoxTabIndex="296"
											FieldLabelText="hx3qaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qgpm" FieldTextBoxTabIndex="297"
											FieldLabelText="hx3qgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3qgpp" FieldTextBoxTabIndex="298"
											FieldLabelText="hx3qgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3qotr" FieldTextBoxTabIndex="299"
											FieldLabelText="hx3qotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>r. Panic or anxiety disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx3rhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rhas" FieldTextBoxTabIndex="300"
											FieldLabelText="hx3rhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rchld" FieldTextBoxTabIndex="301"
											FieldLabelText="hx3rchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rmom" FieldTextBoxTabIndex="302"
											FieldLabelText="hx3rmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rdad" FieldTextBoxTabIndex="303"
											FieldLabelText="hx3rdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rsib" FieldTextBoxTabIndex="304"
											FieldLabelText="hx3rsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rsibm" FieldTextBoxTabIndex="305"
											FieldLabelText="hx3rsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rsibp" FieldTextBoxTabIndex="306"
											FieldLabelText="hx3rsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rcoum" FieldTextBoxTabIndex="307"
											FieldLabelText="hx3rcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rcoup" FieldTextBoxTabIndex="308"
											FieldLabelText="hx3rcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3raum" FieldTextBoxTabIndex="309"
											FieldLabelText="hx3raum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3raup" FieldTextBoxTabIndex="310"
											FieldLabelText="hx3raup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rgpm" FieldTextBoxTabIndex="311"
											FieldLabelText="hx3rgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3rgpp" FieldTextBoxTabIndex="312"
											FieldLabelText="hx3rgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3rotr" FieldTextBoxTabIndex="313"
											FieldLabelText="hx3rotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>s. Depression</TD>
									<TD>
										<def:datafieldcontrol id="hx3shas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3shas" FieldTextBoxTabIndex="314"
											FieldLabelText="hx3shas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3schld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3schld" FieldTextBoxTabIndex="315"
											FieldLabelText="hx3schld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3smom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3smom" FieldTextBoxTabIndex="316"
											FieldLabelText="hx3smom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3sdad" FieldTextBoxTabIndex="317"
											FieldLabelText="hx3sdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ssib" FieldTextBoxTabIndex="318"
											FieldLabelText="hx3ssib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ssibm" FieldTextBoxTabIndex="319"
											FieldLabelText="hx3ssibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ssibp" FieldTextBoxTabIndex="320"
											FieldLabelText="hx3ssibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3scoum" FieldTextBoxTabIndex="321"
											FieldLabelText="hx3scoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3scoup" FieldTextBoxTabIndex="322"
											FieldLabelText="hx3scoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3saum" FieldTextBoxTabIndex="323"
											FieldLabelText="hx3saum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3saup" FieldTextBoxTabIndex="324"
											FieldLabelText="hx3saup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3sgpm" FieldTextBoxTabIndex="325"
											FieldLabelText="hx3sgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3sgpp" FieldTextBoxTabIndex="326"
											FieldLabelText="hx3sgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3sotr" FieldTextBoxTabIndex="327"
											FieldLabelText="hx3sotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>t. Manic depression/Bipolar</TD>
									<TD>
										<def:datafieldcontrol id="hx3thas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3thas" FieldTextBoxTabIndex="328"
											FieldLabelText="hx3thas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tchld" FieldTextBoxTabIndex="329"
											FieldLabelText="hx3tchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tmom" FieldTextBoxTabIndex="330"
											FieldLabelText="hx3tmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tdad" FieldTextBoxTabIndex="331"
											FieldLabelText="hx3tdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tsib" FieldTextBoxTabIndex="332"
											FieldLabelText="hx3tsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tsibm" FieldTextBoxTabIndex="333"
											FieldLabelText="hx3tsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tsibp" FieldTextBoxTabIndex="334"
											FieldLabelText="hx3tsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tcoum" FieldTextBoxTabIndex="335"
											FieldLabelText="hx3tcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tcoup" FieldTextBoxTabIndex="336"
											FieldLabelText="hx3tcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3taum" FieldTextBoxTabIndex="337"
											FieldLabelText="hx3taum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3taup" FieldTextBoxTabIndex="338"
											FieldLabelText="hx3taup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tgpm" FieldTextBoxTabIndex="339"
											FieldLabelText="hx3tgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3tgpp" FieldTextBoxTabIndex="340"
											FieldLabelText="hx3tgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3totr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3totr" FieldTextBoxTabIndex="341"
											FieldLabelText="hx3totr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>u. Schizophrenia</TD>
									<TD>
										<def:datafieldcontrol id="hx3uhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3uhas" FieldTextBoxTabIndex="342"
											FieldLabelText="hx3uhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3uchld" FieldTextBoxTabIndex="343"
											FieldLabelText="hx3uchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3umom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3umom" FieldTextBoxTabIndex="344"
											FieldLabelText="hx3umom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3udad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3udad" FieldTextBoxTabIndex="345"
											FieldLabelText="hx3udad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3usib" FieldTextBoxTabIndex="346"
											FieldLabelText="hx3usib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3usibm" FieldTextBoxTabIndex="347"
											FieldLabelText="hx3usibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3usibp" FieldTextBoxTabIndex="348"
											FieldLabelText="hx3usibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ucoum" FieldTextBoxTabIndex="349"
											FieldLabelText="hx3ucoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ucoup" FieldTextBoxTabIndex="350"
											FieldLabelText="hx3ucoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3uaum" FieldTextBoxTabIndex="351"
											FieldLabelText="hx3uaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3uaup" FieldTextBoxTabIndex="352"
											FieldLabelText="hx3uaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ugpm" FieldTextBoxTabIndex="353"
											FieldLabelText="hx3ugpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ugpp" FieldTextBoxTabIndex="354"
											FieldLabelText="hx3ugpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3uotr" FieldTextBoxTabIndex="355"
											FieldLabelText="hx3uotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>v. Been admitted to a hospital for psychiatric illness</TD>
									<TD>
										<def:datafieldcontrol id="hx3vhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vhas" FieldTextBoxTabIndex="356"
											FieldLabelText="hx3vhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vchld" FieldTextBoxTabIndex="357"
											FieldLabelText="hx3vchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vmom" FieldTextBoxTabIndex="358"
											FieldLabelText="hx3vmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vdad" FieldTextBoxTabIndex="359"
											FieldLabelText="hx3vdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vsib" FieldTextBoxTabIndex="360"
											FieldLabelText="hx3vsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vsibm" FieldTextBoxTabIndex="361"
											FieldLabelText="hx3vsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vsibp" FieldTextBoxTabIndex="362"
											FieldLabelText="hx3vsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vcoum" FieldTextBoxTabIndex="363"
											FieldLabelText="hx3vcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vcoup" FieldTextBoxTabIndex="364"
											FieldLabelText="hx3vcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vaum" FieldTextBoxTabIndex="365"
											FieldLabelText="hx3vaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vaup" FieldTextBoxTabIndex="366"
											FieldLabelText="hx3vaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vgpm" FieldTextBoxTabIndex="367"
											FieldLabelText="hx3vgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3vgpp" FieldTextBoxTabIndex="368"
											FieldLabelText="hx3vgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3votr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3votr" FieldTextBoxTabIndex="369"
											FieldLabelText="hx3votr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>w. Birth defects (e.g., cleft lip or palate, open spine)</TD>
									<TD>
										<def:datafieldcontrol id="hx3whas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3whas" FieldTextBoxTabIndex="370"
											FieldLabelText="hx3whas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wchld" FieldTextBoxTabIndex="371"
											FieldLabelText="hx3wchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wmom" FieldTextBoxTabIndex="372"
											FieldLabelText="hx3wmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wdad" FieldTextBoxTabIndex="373"
											FieldLabelText="hx3wdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wsib" FieldTextBoxTabIndex="374"
											FieldLabelText="hx3wsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wsibm" FieldTextBoxTabIndex="375"
											FieldLabelText="hx3wsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wsibp" FieldTextBoxTabIndex="376"
											FieldLabelText="hx3wsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wcoum" FieldTextBoxTabIndex="377"
											FieldLabelText="hx3wcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wcoup" FieldTextBoxTabIndex="378"
											FieldLabelText="hx3wcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3waum" FieldTextBoxTabIndex="379"
											FieldLabelText="hx3waum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3waup" FieldTextBoxTabIndex="380"
											FieldLabelText="hx3waup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wgpm" FieldTextBoxTabIndex="381"
											FieldLabelText="hx3wgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3wgpp" FieldTextBoxTabIndex="382"
											FieldLabelText="hx3wgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3wotr" FieldTextBoxTabIndex="383"
											FieldLabelText="hx3wotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>x. Cancer (please specify type)
										<def:datafieldcontrol id="hx3xs" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx3xs" FieldTextBoxTabIndex="383"
											FieldLabelText="hx3xs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xhas" FieldTextBoxTabIndex="384"
											FieldLabelText="hx3xhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xchld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xchld" FieldTextBoxTabIndex="385"
											FieldLabelText="hx3xchld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xmom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xmom" FieldTextBoxTabIndex="386"
											FieldLabelText="hx3xmom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xdad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xdad" FieldTextBoxTabIndex="387"
											FieldLabelText="hx3xdad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xsib" FieldTextBoxTabIndex="388"
											FieldLabelText="hx3xsib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xsibm" FieldTextBoxTabIndex="389"
											FieldLabelText="hx3xsibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xsibp" FieldTextBoxTabIndex="390"
											FieldLabelText="hx3xsibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xcoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xcoum" FieldTextBoxTabIndex="391"
											FieldLabelText="hx3xcoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xcoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xcoup" FieldTextBoxTabIndex="392"
											FieldLabelText="hx3xcoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xaum" FieldTextBoxTabIndex="393"
											FieldLabelText="hx3xaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xaup" FieldTextBoxTabIndex="394"
											FieldLabelText="hx3xaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xgpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xgpm" FieldTextBoxTabIndex="395"
											FieldLabelText="hx3xgpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xgpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3xgpp" FieldTextBoxTabIndex="396"
											FieldLabelText="hx3xgpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3xotr" FieldTextBoxTabIndex="397"
											FieldLabelText="hx3xotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>y. Norrie Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3yhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3yhas" FieldTextBoxTabIndex="398"
											FieldLabelText="hx3yhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ychld" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ychld" FieldTextBoxTabIndex="399"
											FieldLabelText="hx3ychld" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ymom" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ymom" FieldTextBoxTabIndex="400"
											FieldLabelText="hx3ymom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ydad" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ydad" FieldTextBoxTabIndex="401"
											FieldLabelText="hx3ydad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysib" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ysib" FieldTextBoxTabIndex="402"
											FieldLabelText="hx3ysib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysibm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ysibm" FieldTextBoxTabIndex="403"
											FieldLabelText="hx3ysibm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysibp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ysibp" FieldTextBoxTabIndex="404"
											FieldLabelText="hx3ysibp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ycoum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ycoum" FieldTextBoxTabIndex="405"
											FieldLabelText="hx3ycoum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ycoup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ycoup" FieldTextBoxTabIndex="406"
											FieldLabelText="hx3ycoup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yaum" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3yaum" FieldTextBoxTabIndex="407"
											FieldLabelText="hx3yaum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yaup" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3yaup" FieldTextBoxTabIndex="408"
											FieldLabelText="hx3yaup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ygpm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ygpm" FieldTextBoxTabIndex="409"
											FieldLabelText="hx3ygpm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ygpp" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3ygpp" FieldTextBoxTabIndex="410"
											FieldLabelText="hx3ygpp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yotr" runat="server" FieldTextBoxWidth="100px" DatabaseField="hx3yotr" FieldTextBoxTabIndex="411"
											FieldLabelText="hx3yotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">4. Assisted Reproductive Technology?</TD>
									<TD>(0=NO, 1=YES)
										<def:datafieldcontrol id="hx4" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4" FieldTextBoxTabIndex="412"
											FieldLabelText="hx4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. Ovulation induction</TD>
									<TD>
										<def:datafieldcontrol id="hx4a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4a" FieldTextBoxTabIndex="412"
											FieldLabelText="hx4a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. In Vitro</TD>
									<TD>
										<def:datafieldcontrol id="hx4b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4b" FieldTextBoxTabIndex="412"
											FieldLabelText="hx4b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. GIFT or ZIFT</TD>
									<TD>
										<def:datafieldcontrol id="hx4c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4c" FieldTextBoxTabIndex="412"
											FieldLabelText="hx4c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Intracytoplasmic sperm injection (ICSI)</TD>
									<TD>
										<def:datafieldcontrol id="hx4d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4d" FieldTextBoxTabIndex="412"
											FieldLabelText="hx4d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Sperm donor</TD>
									<TD>
										<def:datafieldcontrol id="hx4e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4e" FieldTextBoxTabIndex="412"
											FieldLabelText="hx4e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Egg donor</TD>
									<TD>
										<def:datafieldcontrol id="hx4f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4f" FieldTextBoxTabIndex="413"
											FieldLabelText="hx4f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Eggs or embryos frozen</TD>
									<TD>
										<def:datafieldcontrol id="hx4g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4g" FieldTextBoxTabIndex="414"
											FieldLabelText="hx4g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Other (specify)<br/>
										<def:datafieldcontrol id="hx4hs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx4hs" FieldTextBoxTabIndex="415"
											FieldLabelText="hx4hs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx4h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4h" FieldTextBoxTabIndex="416"
											FieldLabelText="hx4h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">5. Any of the following health problems during 
										pregnancy?</TD>
								</TR>
								<TR>
									<TD>a. Fever</TD>
									<TD>(0=NO, 1=YES)
										<def:datafieldcontrol id="hx5a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5a" FieldTextBoxTabIndex="417"
											FieldLabelText="hx5a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx5b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5b" FieldTextBoxTabIndex="418"
											FieldLabelText="hx5b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Viral illness</TD>
									<TD>
										<def:datafieldcontrol id="hx5c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5c" FieldTextBoxTabIndex="419"
											FieldLabelText="hx5c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Diabetes</TD>
									<TD>
										<def:datafieldcontrol id="hx5d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5d" FieldTextBoxTabIndex="420"
											FieldLabelText="hx5d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Preterm labor</TD>
									<TD>
										<def:datafieldcontrol id="hx5e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5e" FieldTextBoxTabIndex="421"
											FieldLabelText="hx5e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other major illness
										<def:datafieldcontrol id="hx5fs" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx5fs" FieldTextBoxTabIndex="423"
											FieldLabelText="hx5fs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx5f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5f" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Vaginal Bleeding</TD>
									<TD>
										<def:datafieldcontrol id="hx5g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5g" FieldTextBoxTabIndex="424"
											FieldLabelText="hx5g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Generalized edema</TD>
									<TD>
										<def:datafieldcontrol id="hx5h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5h" FieldTextBoxTabIndex="425"
											FieldLabelText="hx5h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Proteinuria</TD>
									<TD>
										<def:datafieldcontrol id="hx5i" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5i" FieldTextBoxTabIndex="426"
											FieldLabelText="hx5i" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. High blood pressure</TD>
									<TD>
										<def:datafieldcontrol id="hx5j" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5j" FieldTextBoxTabIndex="427"
											FieldLabelText="hx5j" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">6. Meds before/after you knew you were pregnant?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<br/>
										1=Yes</TD>
									<TD>0=Before<br/>
										1=After<br/>
										2=Both</TD>
								</TR>
								<TR>
									<TD>a. Antibiotics</TD>
									<TD>
										<def:datafieldcontrol id="hx6a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6a" FieldTextBoxTabIndex="428"
											FieldLabelText="hx6a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6awhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6awhen" FieldTextBoxTabIndex="429"
											FieldLabelText="hx6awhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Medications for Acne</TD>
									<TD>
										<def:datafieldcontrol id="hx6b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6b" FieldTextBoxTabIndex="430"
											FieldLabelText="hx6b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6bwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6bwhen" FieldTextBoxTabIndex="431"
											FieldLabelText="hx6bwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Medications for birth control</TD>
									<TD>
										<def:datafieldcontrol id="hx6c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6c" FieldTextBoxTabIndex="432"
											FieldLabelText="hx6c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6cwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6cwhen" FieldTextBoxTabIndex="433"
											FieldLabelText="hx6cwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Antihypertensives</TD>
									<TD>
										<def:datafieldcontrol id="hx6d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6d" FieldTextBoxTabIndex="434"
											FieldLabelText="hx6d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6dwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6dwhen" FieldTextBoxTabIndex="435"
											FieldLabelText="hx6dwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Meds for heart or cardiac problems</TD>
									<TD>
										<def:datafieldcontrol id="hx6e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6e" FieldTextBoxTabIndex="436"
											FieldLabelText="hx6e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6ewhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6ewhen" FieldTextBoxTabIndex="437"
											FieldLabelText="hx6ewhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Meds for Attention Deficit Disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx6f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6f" FieldTextBoxTabIndex="438"
											FieldLabelText="hx6f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6fwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6fwhen" FieldTextBoxTabIndex="439"
											FieldLabelText="hx6fwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" DESIGNTIMEDRAGDROP="8557"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Antiepileptics or anti-seizure meds</TD>
									<TD>
										<def:datafieldcontrol id="hx6g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6g" FieldTextBoxTabIndex="440"
											FieldLabelText="hx6g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6gwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6gwhen" FieldTextBoxTabIndex="441"
											FieldLabelText="hx6gwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Meds to control diabetes</TD>
									<TD>
										<def:datafieldcontrol id="hx6h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6h" FieldTextBoxTabIndex="442"
											FieldLabelText="hx6h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6hwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6hwhen" FieldTextBoxTabIndex="443"
											FieldLabelText="hx6hwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Meds to regulate thyroid</TD>
									<TD>
										<def:datafieldcontrol id="hx6i" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6i" FieldTextBoxTabIndex="444"
											FieldLabelText="hx6i" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6iwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6iwhen" FieldTextBoxTabIndex="445"
											FieldLabelText="hx6iwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Antidepressants</TD>
									<TD>
										<def:datafieldcontrol id="hx6j" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6j" FieldTextBoxTabIndex="446"
											FieldLabelText="hx6j" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6jwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6jwhen" FieldTextBoxTabIndex="447"
											FieldLabelText="hx6jwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Mood stabilizers</TD>
									<TD>
										<def:datafieldcontrol id="hx6k" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6k" FieldTextBoxTabIndex="448"
											FieldLabelText="hx6k" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6kwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6kwhen" FieldTextBoxTabIndex="449"
											FieldLabelText="hx6kwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Tranquilizers</TD>
									<TD>
										<def:datafieldcontrol id="hx6l" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6l" FieldTextBoxTabIndex="450"
											FieldLabelText="hx6l" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6lwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6lwhen" FieldTextBoxTabIndex="451"
											FieldLabelText="hx6lwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Pain Killers</TD>
									<TD>
										<def:datafieldcontrol id="hx6m" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6m" FieldTextBoxTabIndex="452"
											FieldLabelText="hx6m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6mwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6mwhen" FieldTextBoxTabIndex="453"
											FieldLabelText="hx6mwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Sedatives or sleeping pills</TD>
									<TD>
										<def:datafieldcontrol id="hx6n" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6n" FieldTextBoxTabIndex="454"
											FieldLabelText="hx6n" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6nwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6nwhen" FieldTextBoxTabIndex="455"
											FieldLabelText="hx6nwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Anti-inflammatory or Anti-immune drugs</TD>
									<TD>
										<def:datafieldcontrol id="hx6o" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6o" FieldTextBoxTabIndex="456"
											FieldLabelText="hx6o" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6owhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6owhen" FieldTextBoxTabIndex="457"
											FieldLabelText="hx6owhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Treatment for HIV</TD>
									<TD>
										<def:datafieldcontrol id="hx6p" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6p" FieldTextBoxTabIndex="458"
											FieldLabelText="hx6p" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6pwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6pwhen" FieldTextBoxTabIndex="459"
											FieldLabelText="hx6pwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Thalidomide (specify why prescribed)<br/>
										<def:datafieldcontrol id="hx6qwhy" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx6qwhy" FieldTextBoxTabIndex="462"
											FieldLabelText="hx6qwhy" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6q" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6q" FieldTextBoxTabIndex="460"
											FieldLabelText="hx6q" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6qwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6qwhen" FieldTextBoxTabIndex="461"
											FieldLabelText="hx6qwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Misoprostol (specify why prescribed)<br/>
										<def:datafieldcontrol id="hx6rwhy" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx6rwhy" FieldTextBoxTabIndex="465"
											FieldLabelText="hx6rwhy" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6r" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6r" FieldTextBoxTabIndex="463"
											FieldLabelText="hx6r" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6rwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6rwhen" FieldTextBoxTabIndex="464"
											FieldLabelText="hx6rwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Other (specify med and why prescribed)<br/>
										<def:datafieldcontrol id="hx6sspec" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx6sspec"
											FieldTextBoxTabIndex="468" FieldLabelText="hx6sspec" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6s" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6s" FieldTextBoxTabIndex="466"
											FieldLabelText="hx6s" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6swhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6swhen" FieldTextBoxTabIndex="467"
											FieldLabelText="hx6swhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">7. In this pregnancy, did the doctor tell you that 
										the<br/>
										baby had any of the following health problems?</TD>
								</TR>
								<TR>
									<TD>a. Screen positive on a blood test</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx7a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx7a" FieldTextBoxTabIndex="469"
											FieldLabelText="hx7a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal ultrasound or sonogram (specify)<br/>
										<def:datafieldcontrol id="hx7bs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx7bs" FieldTextBoxTabIndex="471"
											FieldLabelText="hx7bs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx7b" FieldTextBoxTabIndex="470"
											FieldLabelText="hx7b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Abnormality based on results of amniocentesis or CVS (specify)<br/>
										<def:datafieldcontrol id="hx7cs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx7cs" FieldTextBoxTabIndex="473"
											FieldLabelText="hx7cs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx7c" FieldTextBoxTabIndex="472"
											FieldLabelText="hx7c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Other (specify)<br/>
										<def:datafieldcontrol id="hx7ds" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx7ds" FieldTextBoxTabIndex="475"
											FieldLabelText="hx7ds" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx7d" FieldTextBoxTabIndex="474"
											FieldLabelText="hx7d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">8. In this pregnancy, did you do any of the 
										following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<br/>
										1=Yes</TD>
									<TD>When?</TD>
								</TR>
								<TR>
									<TD>a. Drink alcohol</TD>
									<TD>
										<def:datafieldcontrol id="hx8a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8a" FieldTextBoxTabIndex="476"
											FieldLabelText="hx8a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8awhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8awhen" FieldTextBoxTabIndex="477"
											FieldLabelText="hx8awhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Smoke cigarettes or other tobacco</TD>
									<TD>
										<def:datafieldcontrol id="hx8b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8b" FieldTextBoxTabIndex="478"
											FieldLabelText="hx8b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8bwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8bwhen" FieldTextBoxTabIndex="479"
											FieldLabelText="hx8bwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">9. In this pregnancy did you do any of the 
										following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<br/>
										1=Yes</TD>
									<TD>When?</TD>
								</TR>
								<TR>
									<TD>a. Smoke marijuana</TD>
									<TD>
										<def:datafieldcontrol id="hx9a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9a" FieldTextBoxTabIndex="480"
											FieldLabelText="hx9a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9awhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9awhen" FieldTextBoxTabIndex="481"
											FieldLabelText="hx9awhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Use Cocaine</TD>
									<TD>
										<def:datafieldcontrol id="hx9b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9b" FieldTextBoxTabIndex="482"
											FieldLabelText="hx9b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9bwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9bwhen" FieldTextBoxTabIndex="483"
											FieldLabelText="hx9bwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Use Heroin</TD>
									<TD>
										<def:datafieldcontrol id="hx9c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9c" FieldTextBoxTabIndex="484"
											FieldLabelText="hx9c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9cwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9cwhen" FieldTextBoxTabIndex="485"
											FieldLabelText="hx9cwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Take Methadone</TD>
									<TD>
										<def:datafieldcontrol id="hx9d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9d" FieldTextBoxTabIndex="486"
											FieldLabelText="hx9d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9dwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9dwhen" FieldTextBoxTabIndex="487"
											FieldLabelText="hx9dwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Take Amphetamines</TD>
									<TD>
										<def:datafieldcontrol id="hx9e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9e" FieldTextBoxTabIndex="488"
											FieldLabelText="hx9e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9ewhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9ewhen" FieldTextBoxTabIndex="489"
											FieldLabelText="hx9ewhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Take Ecstasy</TD>
									<TD>
										<def:datafieldcontrol id="hx9f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9f" FieldTextBoxTabIndex="490"
											FieldLabelText="hx9f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9fwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9fwhen" FieldTextBoxTabIndex="491"
											FieldLabelText="hx9fwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Take Hallucinogens</TD>
									<TD>
										<def:datafieldcontrol id="hx9g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9g" FieldTextBoxTabIndex="492"
											FieldLabelText="hx9g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9gwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9gwhen" FieldTextBoxTabIndex="493"
											FieldLabelText="hx9gwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Take inhalants</TD>
									<TD>
										<def:datafieldcontrol id="hx9h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9h" FieldTextBoxTabIndex="494"
											FieldLabelText="hx9h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0" DESIGNTIMEDRAGDROP="20847"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9hwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9hwhen" FieldTextBoxTabIndex="495"
											FieldLabelText="hx9hwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Other (specify)<br/>
										<def:datafieldcontrol id="hx9is" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx9is" FieldTextBoxTabIndex="498"
											FieldLabelText="hx9is" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9i" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9i" FieldTextBoxTabIndex="496"
											FieldLabelText="hx9i" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx9iwhen" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9iwhen" FieldTextBoxTabIndex="497"
											FieldLabelText="hx9iwhen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD>10. Were you given any meds to induce labor?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx10" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx10" FieldTextBoxTabIndex="499"
											FieldLabelText="hx10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>10b. Did you have a spinal?</TD>
									<TD>
										<def:datafieldcontrol id="hx10b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx10b" FieldTextBoxTabIndex="500"
											FieldLabelText="hx10b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD>11. How much did the child weigh at birth?</TD>
									<TD>
										<def:datafieldcontrol id="hx11wtpd" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx11wtpd" FieldTextBoxTabIndex="501"
											FieldLabelText="Pounds" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol>
										<def:datafieldcontrol id="hx11wtoz" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx11wtoz" FieldTextBoxTabIndex="502"
											FieldLabelText="ounces" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>11b. APGAR scores at:</TD>
									<TD>
										<def:datafieldcontrol id="hx11ap1" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx11ap1" FieldTextBoxTabIndex="503"
											FieldLabelText="1 minute" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol>
										<def:datafieldcontrol id="hx11ap5" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx11ap5" FieldTextBoxTabIndex="504"
											FieldLabelText="5 minutes" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">12. Did this child need any of the following during labor?</TD>
									<TD>0=No<br/>
										1=Yes</TD>
								</TR>
								<TR>
									<TD>a. Resuscitation</TD>
									<TD>
										<def:datafieldcontrol id="hx12a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12a" FieldTextBoxTabIndex="505"
											FieldLabelText="hx12a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Forceps/vacuum extraction</TD>
									<TD>
										<def:datafieldcontrol id="hx12b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12b" FieldTextBoxTabIndex="506"
											FieldLabelText="hx12b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Meconium stain</TD>
									<TD>
										<def:datafieldcontrol id="hx12c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12c" FieldTextBoxTabIndex="507"
											FieldLabelText="hx12c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Cord prolapse</TD>
									<TD>
										<def:datafieldcontrol id="hx12d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12d" FieldTextBoxTabIndex="508"
											FieldLabelText="hx12d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Nonvertex presentation</TD>
									<TD>
										<def:datafieldcontrol id="hx12e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12e" FieldTextBoxTabIndex="509"
											FieldLabelText="hx12e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Trauma on delivery</TD>
									<TD>
										<def:datafieldcontrol id="hx12f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12f" FieldTextBoxTabIndex="510"
											FieldLabelText="hx12f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Respiratory distress syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx12g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12g" FieldTextBoxTabIndex="511"
											FieldLabelText="hx12g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Septicemia/meningitis</TD>
									<TD>
										<def:datafieldcontrol id="hx12h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12h" FieldTextBoxTabIndex="512"
											FieldLabelText="hx12h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Hyperbilirubinemia</TD>
									<TD>
										<def:datafieldcontrol id="hx12i" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12i" FieldTextBoxTabIndex="513"
											FieldLabelText="hx12i" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Anemia requiring transfusion</TD>
									<TD>
										<def:datafieldcontrol id="hx12j" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12j" FieldTextBoxTabIndex="514"
											FieldLabelText="hx12j" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Irritable/floppy infant/convulsions</TD>
									<TD>
										<def:datafieldcontrol id="hx12k" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12k" FieldTextBoxTabIndex="515"
											FieldLabelText="hx12k" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Clinical dysmaturity</TD>
									<TD>
										<def:datafieldcontrol id="hx12l" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12l" FieldTextBoxTabIndex="516"
											FieldLabelText="hx12l" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Difficulty regulating temperature</TD>
									<TD>
										<def:datafieldcontrol id="hx12m" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12m" FieldTextBoxTabIndex="517"
											FieldLabelText="hx12m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Oxygen treatment</TD>
									<TD>
										<def:datafieldcontrol id="hx12n" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12n" FieldTextBoxTabIndex="518"
											FieldLabelText="hx12n" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid" height="78">
								<TR>
									<TD class="heading" colSpan="2">13. Did this child stay in the neonatal intensive 
										care unit?<br/>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx13" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx13" FieldTextBoxTabIndex="519"
											FieldLabelText="hx13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. If yes, how long?</TD>
									<TD>
										<def:datafieldcontrol id="hx13d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx13d" FieldTextBoxTabIndex="520"
											FieldLabelText="Days" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol><B>OR
											<def:datafieldcontrol id="hx13hr" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx13hr" FieldTextBoxTabIndex="521"
												FieldLabelText="Hours" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
												IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></B></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">14. How many days or hours did this child stay in hospital?</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx14d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14d" FieldTextBoxTabIndex="522"
											FieldLabelText="Days" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol><B>OR</B>
										<def:datafieldcontrol id="hx14hr" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14hr" FieldTextBoxTabIndex="523"
											FieldLabelText="Hours" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">15. Has this child ever had seizures or 
										convulsions?<br/>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx15" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15" FieldTextBoxTabIndex="524"
											FieldLabelText="hx15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. When was the first?<br/>
										0=First Month<br/>
										1=1-12 Months<br/>
										2=12-24 Months<br/>
										3=2-5 Years
										<br/>
										4= &gt; 5 Years</TD>
									<TD>
										<def:datafieldcontrol id="hx15a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15a" FieldTextBoxTabIndex="525"
											FieldLabelText="hx15a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Does this child have seizures now?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx15b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15b" FieldTextBoxTabIndex="526"
											FieldLabelText="hx15b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Did the seizures only occur when this child had a fever</TD>
									<TD>
										<def:datafieldcontrol id="hx15c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15c" FieldTextBoxTabIndex="527"
											FieldLabelText="hx15c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Does this child now take meds to control seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx15d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15d" FieldTextBoxTabIndex="528"
											FieldLabelText="hx15d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">16. Has child ever...</TD>
								</TR>
								<TR>
									<TD>a. Had an abnormal picture of the brain</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx16a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16a" FieldTextBoxTabIndex="529"
											FieldLabelText="hx16a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="30">b. Been hospitalized for meningitis</TD>
									<TD height="30">
										<def:datafieldcontrol id="hx16b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16b" FieldTextBoxTabIndex="530"
											FieldLabelText="hx16b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Lost consciousness due to a head injury</TD>
									<TD>
										<def:datafieldcontrol id="hx16c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16c" FieldTextBoxTabIndex="531"
											FieldLabelText="hx16c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="hx16c1y" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="20px" DatabaseField="hx16c1y"
											FieldTextBoxTabIndex="532" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c1m" runat="server" FieldTextBoxWidth="40px" DatabaseField="hx16c1m" FieldTextBoxTabIndex="533"
											FieldLabelText="hx16c1m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx16c2y" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="20px" DatabaseField="hx16c2y"
											FieldTextBoxTabIndex="534" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c2m" runat="server" FieldTextBoxWidth="40px" DatabaseField="hx16c2m" FieldTextBoxTabIndex="535"
											FieldLabelText="hx16c2m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx16c3y" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="20px" DatabaseField="hx16c3y"
											FieldTextBoxTabIndex="536" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c3m" runat="server" FieldTextBoxWidth="40px" DatabaseField="hx16c3m" FieldTextBoxTabIndex="537"
											FieldLabelText="hx16c3m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">17. Did your child have any of the following birth 
										defects?</TD>
								</TR>
								<TR>
									<TD>a. Cleft lip of palate</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx17a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17a" FieldTextBoxTabIndex="538"
											FieldLabelText="hx17a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal shape of hands, feet, arms or legs</TD>
									<TD>
										<def:datafieldcontrol id="hx17b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17b" FieldTextBoxTabIndex="539"
											FieldLabelText="hx17b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Open spine</TD>
									<TD>
										<def:datafieldcontrol id="hx17c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17c" FieldTextBoxTabIndex="540"
											FieldLabelText="hx17c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Heart defect (specify)<br/>
										<def:datafieldcontrol id="hx17ds" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx17ds" FieldTextBoxTabIndex="542"
											FieldLabelText="hx17ds" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17d" FieldTextBoxTabIndex="541"
											FieldLabelText="hx17d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Kidney defect (specify)<br/>
										<def:datafieldcontrol id="hx17es" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx17es" FieldTextBoxTabIndex="544"
											FieldLabelText="hx17es" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17e" FieldTextBoxTabIndex="543"
											FieldLabelText="hx17e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other defect (specify)<br/>
										<def:datafieldcontrol id="hx17fs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx17fs" FieldTextBoxTabIndex="546"
											FieldLabelText="hx17fs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17f" FieldTextBoxTabIndex="545"
											FieldLabelText="hx17f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD width="273">18. Does the child have any other chronic medical problems?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx18" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx18" FieldTextBoxTabIndex="547"
											FieldLabelText="hx18" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">a. Medical problem #1</TD>
									<TD>
										<def:datafieldcontrol id="hx18apr" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx18apr" FieldTextBoxTabIndex="548"
											FieldLabelText="hx18apr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #1</TD>
									<TD>
										<def:datafieldcontrol id="hx18ah" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx18ah" FieldTextBoxTabIndex="549"
											FieldLabelText="hx18ah" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">b. Medical problem #2</TD>
									<TD>
										<def:datafieldcontrol id="hx18bpr" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx18bpr" FieldTextBoxTabIndex="551"
											FieldLabelText="hx18bpr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #2</TD>
									<TD>
										<def:datafieldcontrol id="hx18bh" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx18bh" FieldTextBoxTabIndex="552"
											FieldLabelText="hx18bh" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">c. Medical problem #3</TD>
									<TD>
										<def:datafieldcontrol id="hx18cpr" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx18cpr" FieldTextBoxTabIndex="554"
											FieldLabelText="hx18cpr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #3</TD>
									<TD>
										<def:datafieldcontrol id="hx18ch" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx18ch" FieldTextBoxTabIndex="555"
											FieldLabelText="hx18ch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="tblreadonly" id="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="557"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldLabelWidth="80px" DatabaseField="createdby" FieldTextBoxTabIndex="558"
											FieldLabelText="createdby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="559"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldLabelWidth="80px" DatabaseField="updatedby" FieldTextBoxTabIndex="560"
											FieldLabelText="updatedby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
