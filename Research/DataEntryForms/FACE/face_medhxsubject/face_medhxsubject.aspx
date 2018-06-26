<%@ Page language="c#" Inherits="face_medhxsubject.face_medhxsubject" CodeFile="face_medhxsubject.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" VerifiedField="verified"
							PrimaryKeyField="medhx_pk" MeasureName="FACE Medical History-Subject" LookupTextBox1LabelText="FACE ID:"
							LookupTextBox2Visible="False" LookupField1="faceid" DatabaseTable="face_medhxsubject" StudyMeasID="376"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="faceid" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="60px" RegExDescription="FACE ID must  look like FACE###"
										RegEx="^[F][A][C][E][0-9][0-9][0-9]$" DatabaseField="faceid" FieldTextBoxTabIndex="2" FieldLabelText="FACE ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="hxweek" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Week"
											FieldTextBoxTabIndex="3" DatabaseField="hxweek" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
											FieldTextBoxTabIndex="4" DatabaseField="hxdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Rater Last Name" FieldTextBoxTabIndex="5" DatabaseField="hxratlast"
											FieldLabelWidth="80px"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="First" FieldTextBoxTabIndex="5" DatabaseField="hxratfirst"
											FieldLabelWidth="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxrphon" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="1=Phone"
											FieldTextBoxTabIndex="5" DatabaseField="hxrphon" FieldLabelWidth="80px" FieldTextBoxWidth="30px" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxrprsn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="1=In person"
											FieldTextBoxTabIndex="6" DatabaseField="hxrprsn" FieldLabelWidth="80px" FieldTextBoxWidth="30px" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="6">Enter a 1 for all that apply</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>Mother</TD>
									<TD>Father</TD>
									<TD>Child</TD>
									<TD>Staff</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD>Primary Source</TD>
									<TD>
										<def:datafieldcontrol id="hxrelm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxrelm"
											FieldTextBoxTabIndex="7" DatabaseField="hxrelmo" FieldTextBoxWidth="30px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelfa" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxrelfa"
											FieldTextBoxTabIndex="7" DatabaseField="hxrelfa" FieldTextBoxWidth="30px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelsb" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxrelch"
											FieldTextBoxTabIndex="7" DatabaseField="hxrelch" FieldTextBoxWidth="30px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelstf" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxrelstf"
											FieldTextBoxTabIndex="7" DatabaseField="hxrelstf" FieldTextBoxWidth="30px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelo" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxrelo"
											FieldTextBoxTabIndex="7" DatabaseField="hxrelo" FieldTextBoxWidth="30px" ShowFieldLabel="False"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxreloth" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(specify)"
											FieldTextBoxTabIndex="7" DatabaseField="hxreloth" FieldLabelWidth="50px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
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
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="15">3. Medical history of person being evaluated and 
										their blood relatives</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>(0=N0, 1=YES,<BR>
										2=NOT SURE)</TD>
									<TD colSpan="13">(0=unchecked, 1=checked)</TD>
								</TR>
								<TR>
									<TD>Disorder</TD>
									<TD>Subject/blood relative<BR>
										has disorder<BR>
									</TD>
									<TD>Subject</TD>
									<TD colSpan="2">Parents<BR>
										of Subject</TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3achld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3achld"
											FieldTextBoxTabIndex="57" DatabaseField="hx3achld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3amom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3amom"
											FieldTextBoxTabIndex="58" DatabaseField="hx3amom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3adad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3adad"
											FieldTextBoxTabIndex="59" DatabaseField="hx3adad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3asib"
											FieldTextBoxTabIndex="60" DatabaseField="hx3asib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3asibm"
											FieldTextBoxTabIndex="61" DatabaseField="hx3asibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3asibp"
											FieldTextBoxTabIndex="62" DatabaseField="hx3asibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3acoum"
											FieldTextBoxTabIndex="63" DatabaseField="hx3acoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3acoup"
											FieldTextBoxTabIndex="64" DatabaseField="hx3acoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3aaum"
											FieldTextBoxTabIndex="65" DatabaseField="hx3aaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3aaup"
											FieldTextBoxTabIndex="66" DatabaseField="hx3aaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0" DESIGNTIMEDRAGDROP="25003"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3agpm"
											FieldTextBoxTabIndex="67" DatabaseField="hx3agpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3agpp"
											FieldTextBoxTabIndex="68" DatabaseField="hx3agpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bchld"
											FieldTextBoxTabIndex="76" DatabaseField="hx3bchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bmom"
											FieldTextBoxTabIndex="77" DatabaseField="hx3bmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bdad"
											FieldTextBoxTabIndex="78" DatabaseField="hx3bdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bsib"
											FieldTextBoxTabIndex="79" DatabaseField="hx3bsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bsibm"
											FieldTextBoxTabIndex="80" DatabaseField="hx3bsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bsibp"
											FieldTextBoxTabIndex="81" DatabaseField="hx3bsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bcoum"
											FieldTextBoxTabIndex="82" DatabaseField="hx3bcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bcoup"
											FieldTextBoxTabIndex="83" DatabaseField="hx3bcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3baum"
											FieldTextBoxTabIndex="84" DatabaseField="hx3baum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3baup"
											FieldTextBoxTabIndex="85" DatabaseField="hx3baup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bgpm"
											FieldTextBoxTabIndex="86" DatabaseField="hx3bgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3bgpp"
											FieldTextBoxTabIndex="87" DatabaseField="hx3bgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cchld"
											FieldTextBoxTabIndex="90" DatabaseField="hx3cchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cmom"
											FieldTextBoxTabIndex="91" DatabaseField="hx3cmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cdad"
											FieldTextBoxTabIndex="92" DatabaseField="hx3cdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3csib"
											FieldTextBoxTabIndex="93" DatabaseField="hx3csib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3csibm"
											FieldTextBoxTabIndex="94" DatabaseField="hx3csibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3csibp"
											FieldTextBoxTabIndex="95" DatabaseField="hx3csibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ccoum"
											FieldTextBoxTabIndex="96" DatabaseField="hx3ccoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ccoup"
											FieldTextBoxTabIndex="97" DatabaseField="hx3ccoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3caum"
											FieldTextBoxTabIndex="98" DatabaseField="hx3caum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3caup"
											FieldTextBoxTabIndex="99" DatabaseField="hx3caup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cgpm"
											FieldTextBoxTabIndex="100" DatabaseField="hx3cgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3cgpp"
											FieldTextBoxTabIndex="101" DatabaseField="hx3cgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dchld"
											FieldTextBoxTabIndex="104" DatabaseField="hx3dchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dmom"
											FieldTextBoxTabIndex="105" DatabaseField="hx3dmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ddad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ddad"
											FieldTextBoxTabIndex="106" DatabaseField="hx3ddad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dsib"
											FieldTextBoxTabIndex="107" DatabaseField="hx3dsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dsibm"
											FieldTextBoxTabIndex="108" DatabaseField="hx3dsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dsibp"
											FieldTextBoxTabIndex="109" DatabaseField="hx3dsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dcoum"
											FieldTextBoxTabIndex="110" DatabaseField="hx3dcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dcoup"
											FieldTextBoxTabIndex="111" DatabaseField="hx3dcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3daum"
											FieldTextBoxTabIndex="112" DatabaseField="hx3daum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3daup"
											FieldTextBoxTabIndex="113" DatabaseField="hx3daup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dgpm"
											FieldTextBoxTabIndex="114" DatabaseField="hx3dgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3dgpp"
											FieldTextBoxTabIndex="115" DatabaseField="hx3dgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3echld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3echld"
											FieldTextBoxTabIndex="118" DatabaseField="hx3echld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3emom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3emom"
											FieldTextBoxTabIndex="119" DatabaseField="hx3emom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3edad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3edad"
											FieldTextBoxTabIndex="120" DatabaseField="hx3edad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3esib"
											FieldTextBoxTabIndex="121" DatabaseField="hx3esib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3esibm"
											FieldTextBoxTabIndex="122" DatabaseField="hx3esibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3esibp"
											FieldTextBoxTabIndex="123" DatabaseField="hx3esibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ecoum"
											FieldTextBoxTabIndex="124" DatabaseField="hx3ecoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ecoup"
											FieldTextBoxTabIndex="125" DatabaseField="hx3ecoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3eaum"
											FieldTextBoxTabIndex="126" DatabaseField="hx3eaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3eaup"
											FieldTextBoxTabIndex="127" DatabaseField="hx3eaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3egpm"
											FieldTextBoxTabIndex="128" DatabaseField="hx3egpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3egpp"
											FieldTextBoxTabIndex="129" DatabaseField="hx3egpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fchld"
											FieldTextBoxTabIndex="132" DatabaseField="hx3fchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fmom"
											FieldTextBoxTabIndex="133" DatabaseField="hx3fmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fdad"
											FieldTextBoxTabIndex="134" DatabaseField="hx3fdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fsib"
											FieldTextBoxTabIndex="135" DatabaseField="hx3fsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fsibm"
											FieldTextBoxTabIndex="136" DatabaseField="hx3fsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fsibp"
											FieldTextBoxTabIndex="137" DatabaseField="hx3fsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fcoum"
											FieldTextBoxTabIndex="138" DatabaseField="hx3fcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fcoup"
											FieldTextBoxTabIndex="139" DatabaseField="hx3fcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3faum"
											FieldTextBoxTabIndex="140" DatabaseField="hx3faum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3faup"
											FieldTextBoxTabIndex="141" DatabaseField="hx3faup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fgpm"
											FieldTextBoxTabIndex="142" DatabaseField="hx3fgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3fgpp"
											FieldTextBoxTabIndex="143" DatabaseField="hx3fgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gchld"
											FieldTextBoxTabIndex="146" DatabaseField="hx3gchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gmom"
											FieldTextBoxTabIndex="147" DatabaseField="hx3gmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gdad"
											FieldTextBoxTabIndex="148" DatabaseField="hx3gdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gsib"
											FieldTextBoxTabIndex="149" DatabaseField="hx3gsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gsibm"
											FieldTextBoxTabIndex="150" DatabaseField="hx3gsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gsibp"
											FieldTextBoxTabIndex="151" DatabaseField="hx3gsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gcoum"
											FieldTextBoxTabIndex="152" DatabaseField="hx3gcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gcoup"
											FieldTextBoxTabIndex="153" DatabaseField="hx3gcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gaum"
											FieldTextBoxTabIndex="154" DatabaseField="hx3gaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3gaup"
											FieldTextBoxTabIndex="155" DatabaseField="hx3gaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ggpm"
											FieldTextBoxTabIndex="156" DatabaseField="hx3ggpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ggpp"
											FieldTextBoxTabIndex="157" DatabaseField="hx3ggpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hchld"
											FieldTextBoxTabIndex="160" DatabaseField="hx3hchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hmom"
											FieldTextBoxTabIndex="161" DatabaseField="hx3hmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hdad"
											FieldTextBoxTabIndex="162" DatabaseField="hx3hdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hsib"
											FieldTextBoxTabIndex="163" DatabaseField="hx3hsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hsibm"
											FieldTextBoxTabIndex="164" DatabaseField="hx3hsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hsibp"
											FieldTextBoxTabIndex="165" DatabaseField="hx3hsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hcoum"
											FieldTextBoxTabIndex="166" DatabaseField="hx3hcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hcoup"
											FieldTextBoxTabIndex="167" DatabaseField="hx3hcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3haum"
											FieldTextBoxTabIndex="168" DatabaseField="hx3haum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3haup"
											FieldTextBoxTabIndex="169" DatabaseField="hx3haup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hgpm"
											FieldTextBoxTabIndex="170" DatabaseField="hx3hgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3hgpp"
											FieldTextBoxTabIndex="171" DatabaseField="hx3hgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ichld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ichld"
											FieldTextBoxTabIndex="175" DatabaseField="hx3ichld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3imom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3imom"
											FieldTextBoxTabIndex="176" DatabaseField="hx3imom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3idad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3idad"
											FieldTextBoxTabIndex="177" DatabaseField="hx3idad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3isib"
											FieldTextBoxTabIndex="178" DatabaseField="hx3isib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3isibm"
											FieldTextBoxTabIndex="179" DatabaseField="hx3isibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3isibp"
											FieldTextBoxTabIndex="180" DatabaseField="hx3isibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3icoum"
											FieldTextBoxTabIndex="181" DatabaseField="hx3icoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3icoup"
											FieldTextBoxTabIndex="182" DatabaseField="hx3icoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3iaum"
											FieldTextBoxTabIndex="183" DatabaseField="hx3iaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3iaup"
											FieldTextBoxTabIndex="184" DatabaseField="hx3iaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3igpm"
											FieldTextBoxTabIndex="185" DatabaseField="hx3igpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3igpp"
											FieldTextBoxTabIndex="186" DatabaseField="hx3igpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jchld"
											FieldTextBoxTabIndex="189" DatabaseField="hx3jchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jmom"
											FieldTextBoxTabIndex="190" DatabaseField="hx3jmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jdad"
											FieldTextBoxTabIndex="191" DatabaseField="hx3jdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jsib"
											FieldTextBoxTabIndex="192" DatabaseField="hx3jsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jsibm"
											FieldTextBoxTabIndex="193" DatabaseField="hx3jsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jsibp"
											FieldTextBoxTabIndex="194" DatabaseField="hx3jsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jcoum"
											FieldTextBoxTabIndex="195" DatabaseField="hx3jcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jcoup"
											FieldTextBoxTabIndex="196" DatabaseField="hx3jcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jaum"
											FieldTextBoxTabIndex="197" DatabaseField="hx3jaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jaup"
											FieldTextBoxTabIndex="198" DatabaseField="hx3jaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jgpm"
											FieldTextBoxTabIndex="199" DatabaseField="hx3jgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3jgpp"
											FieldTextBoxTabIndex="200" DatabaseField="hx3jgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kchld"
											FieldTextBoxTabIndex="203" DatabaseField="hx3kchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kmom"
											FieldTextBoxTabIndex="204" DatabaseField="hx3kmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kdad"
											FieldTextBoxTabIndex="205" DatabaseField="hx3kdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ksib"
											FieldTextBoxTabIndex="206" DatabaseField="hx3ksib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ksibm"
											FieldTextBoxTabIndex="207" DatabaseField="hx3ksibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ksibp"
											FieldTextBoxTabIndex="208" DatabaseField="hx3ksibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kcoum"
											FieldTextBoxTabIndex="209" DatabaseField="hx3kcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kcoup"
											FieldTextBoxTabIndex="210" DatabaseField="hx3kcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kaum"
											FieldTextBoxTabIndex="211" DatabaseField="hx3kaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kaup"
											FieldTextBoxTabIndex="212" DatabaseField="hx3kaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kgpm"
											FieldTextBoxTabIndex="213" DatabaseField="hx3kgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3kgpp"
											FieldTextBoxTabIndex="214" DatabaseField="hx3kgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lchld"
											FieldTextBoxTabIndex="217" DatabaseField="hx3lchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lmom"
											FieldTextBoxTabIndex="218" DatabaseField="hx3lmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ldad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ldad"
											FieldTextBoxTabIndex="219" DatabaseField="hx3ldad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lsib"
											FieldTextBoxTabIndex="220" DatabaseField="hx3lsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lsibm"
											FieldTextBoxTabIndex="221" DatabaseField="hx3lsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lsibp"
											FieldTextBoxTabIndex="222" DatabaseField="hx3lsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lcoum"
											FieldTextBoxTabIndex="223" DatabaseField="hx3lcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lcoup"
											FieldTextBoxTabIndex="224" DatabaseField="hx3lcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3laum"
											FieldTextBoxTabIndex="225" DatabaseField="hx3laum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3laup"
											FieldTextBoxTabIndex="226" DatabaseField="hx3laup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lgpm"
											FieldTextBoxTabIndex="227" DatabaseField="hx3lgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3lgpp"
											FieldTextBoxTabIndex="228" DatabaseField="hx3lgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3lotr"
											FieldTextBoxTabIndex="229" DatabaseField="hx3lotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="hx3mhas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mhas"
											FieldTextBoxTabIndex="230" DatabaseField="hx3mhas" FieldTextBoxWidth="30px" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mchld"
											FieldTextBoxTabIndex="231" DatabaseField="hx3mchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mmom"
											FieldTextBoxTabIndex="232" DatabaseField="hx3mmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mdad"
											FieldTextBoxTabIndex="233" DatabaseField="hx3mdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3msib"
											FieldTextBoxTabIndex="234" DatabaseField="hx3msib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3msibm"
											FieldTextBoxTabIndex="235" DatabaseField="hx3msibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3msibp"
											FieldTextBoxTabIndex="236" DatabaseField="hx3msibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mcoum"
											FieldTextBoxTabIndex="237" DatabaseField="hx3mcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mcoup"
											FieldTextBoxTabIndex="238" DatabaseField="hx3mcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3maum"
											FieldTextBoxTabIndex="239" DatabaseField="hx3maum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3maup"
											FieldTextBoxTabIndex="240" DatabaseField="hx3maup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mgpm"
											FieldTextBoxTabIndex="241" DatabaseField="hx3mgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3mgpp"
											FieldTextBoxTabIndex="242" DatabaseField="hx3mgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nchld"
											FieldTextBoxTabIndex="245" DatabaseField="hx3nchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nmom"
											FieldTextBoxTabIndex="246" DatabaseField="hx3nmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ndad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ndad"
											FieldTextBoxTabIndex="247" DatabaseField="hx3ndad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nsib"
											FieldTextBoxTabIndex="248" DatabaseField="hx3nsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nsibm"
											FieldTextBoxTabIndex="249" DatabaseField="hx3nsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3nsibp"
											FieldTextBoxTabIndex="250" DatabaseField="hx3nsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ncoum"
											FieldTextBoxTabIndex="251" DatabaseField="hx3ncoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ncoup"
											FieldTextBoxTabIndex="252" DatabaseField="hx3ncoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3naum"
											FieldTextBoxTabIndex="253" DatabaseField="hx3naum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3naup"
											FieldTextBoxTabIndex="254" DatabaseField="hx3naup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ngpm"
											FieldTextBoxTabIndex="255" DatabaseField="hx3ngpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ngpp"
											FieldTextBoxTabIndex="256" DatabaseField="hx3ngpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ochld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ochld"
											FieldTextBoxTabIndex="259" DatabaseField="hx3ochld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3omom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3omom"
											FieldTextBoxTabIndex="260" DatabaseField="hx3omom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3odad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3odad"
											FieldTextBoxTabIndex="261" DatabaseField="hx3odad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3osib"
											FieldTextBoxTabIndex="262" DatabaseField="hx3osib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3osibm"
											FieldTextBoxTabIndex="263" DatabaseField="hx3osibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3osibp"
											FieldTextBoxTabIndex="264" DatabaseField="hx3osibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ocoum"
											FieldTextBoxTabIndex="265" DatabaseField="hx3ocoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ocoup"
											FieldTextBoxTabIndex="266" DatabaseField="hx3ocoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3oaum"
											FieldTextBoxTabIndex="267" DatabaseField="hx3oaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3oaup"
											FieldTextBoxTabIndex="268" DatabaseField="hx3oaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ogpm"
											FieldTextBoxTabIndex="269" DatabaseField="hx3ogpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ogpp"
											FieldTextBoxTabIndex="270" DatabaseField="hx3ogpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pchld"
											FieldTextBoxTabIndex="273" DatabaseField="hx3pchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pmom"
											FieldTextBoxTabIndex="274" DatabaseField="hx3pmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pdad"
											FieldTextBoxTabIndex="275" DatabaseField="hx3pdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3psib"
											FieldTextBoxTabIndex="276" DatabaseField="hx3psib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3psibm"
											FieldTextBoxTabIndex="277" DatabaseField="hx3psibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3psibp"
											FieldTextBoxTabIndex="278" DatabaseField="hx3psibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pcoum"
											FieldTextBoxTabIndex="279" DatabaseField="hx3pcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pcoup"
											FieldTextBoxTabIndex="280" DatabaseField="hx3pcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3paum"
											FieldTextBoxTabIndex="281" DatabaseField="hx3paum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3paup"
											FieldTextBoxTabIndex="282" DatabaseField="hx3paup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pgpm"
											FieldTextBoxTabIndex="283" DatabaseField="hx3pgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3pgpp"
											FieldTextBoxTabIndex="284" DatabaseField="hx3pgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qchld"
											FieldTextBoxTabIndex="287" DatabaseField="hx3qchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qmom"
											FieldTextBoxTabIndex="288" DatabaseField="hx3qmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qdad"
											FieldTextBoxTabIndex="289" DatabaseField="hx3qdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qsib"
											FieldTextBoxTabIndex="290" DatabaseField="hx3qsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qsibm"
											FieldTextBoxTabIndex="291" DatabaseField="hx3qsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qsibp"
											FieldTextBoxTabIndex="292" DatabaseField="hx3qsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qcoum"
											FieldTextBoxTabIndex="293" DatabaseField="hx3qcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qcoup"
											FieldTextBoxTabIndex="294" DatabaseField="hx3qcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qaum"
											FieldTextBoxTabIndex="295" DatabaseField="hx3qaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qaup"
											FieldTextBoxTabIndex="296" DatabaseField="hx3qaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qgpm"
											FieldTextBoxTabIndex="297" DatabaseField="hx3qgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3qgpp"
											FieldTextBoxTabIndex="298" DatabaseField="hx3qgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rchld"
											FieldTextBoxTabIndex="301" DatabaseField="hx3rchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rmom"
											FieldTextBoxTabIndex="302" DatabaseField="hx3rmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rdad"
											FieldTextBoxTabIndex="303" DatabaseField="hx3rdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rsib"
											FieldTextBoxTabIndex="304" DatabaseField="hx3rsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rsibm"
											FieldTextBoxTabIndex="305" DatabaseField="hx3rsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rsibp"
											FieldTextBoxTabIndex="306" DatabaseField="hx3rsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rcoum"
											FieldTextBoxTabIndex="307" DatabaseField="hx3rcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rcoup"
											FieldTextBoxTabIndex="308" DatabaseField="hx3rcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3raum"
											FieldTextBoxTabIndex="309" DatabaseField="hx3raum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3raup"
											FieldTextBoxTabIndex="310" DatabaseField="hx3raup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rgpm"
											FieldTextBoxTabIndex="311" DatabaseField="hx3rgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3rgpp"
											FieldTextBoxTabIndex="312" DatabaseField="hx3rgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3schld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3schld"
											FieldTextBoxTabIndex="315" DatabaseField="hx3schld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3smom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3smom"
											FieldTextBoxTabIndex="316" DatabaseField="hx3smom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3sdad"
											FieldTextBoxTabIndex="317" DatabaseField="hx3sdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ssib"
											FieldTextBoxTabIndex="318" DatabaseField="hx3ssib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ssibm"
											FieldTextBoxTabIndex="319" DatabaseField="hx3ssibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ssibp"
											FieldTextBoxTabIndex="320" DatabaseField="hx3ssibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3scoum"
											FieldTextBoxTabIndex="321" DatabaseField="hx3scoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3scoup"
											FieldTextBoxTabIndex="322" DatabaseField="hx3scoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3saum"
											FieldTextBoxTabIndex="323" DatabaseField="hx3saum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3saup"
											FieldTextBoxTabIndex="324" DatabaseField="hx3saup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3sgpm"
											FieldTextBoxTabIndex="325" DatabaseField="hx3sgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3sgpp"
											FieldTextBoxTabIndex="326" DatabaseField="hx3sgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tchld"
											FieldTextBoxTabIndex="329" DatabaseField="hx3tchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tmom"
											FieldTextBoxTabIndex="330" DatabaseField="hx3tmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tdad"
											FieldTextBoxTabIndex="331" DatabaseField="hx3tdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tsib"
											FieldTextBoxTabIndex="332" DatabaseField="hx3tsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tsibm"
											FieldTextBoxTabIndex="333" DatabaseField="hx3tsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tsibp"
											FieldTextBoxTabIndex="334" DatabaseField="hx3tsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tcoum"
											FieldTextBoxTabIndex="335" DatabaseField="hx3tcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tcoup"
											FieldTextBoxTabIndex="336" DatabaseField="hx3tcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3taum"
											FieldTextBoxTabIndex="337" DatabaseField="hx3taum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3taup"
											FieldTextBoxTabIndex="338" DatabaseField="hx3taup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tgpm"
											FieldTextBoxTabIndex="339" DatabaseField="hx3tgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3tgpp"
											FieldTextBoxTabIndex="340" DatabaseField="hx3tgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uchld"
											FieldTextBoxTabIndex="343" DatabaseField="hx3uchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3umom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3umom"
											FieldTextBoxTabIndex="344" DatabaseField="hx3umom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3udad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3udad"
											FieldTextBoxTabIndex="345" DatabaseField="hx3udad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3usib"
											FieldTextBoxTabIndex="346" DatabaseField="hx3usib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3usibm"
											FieldTextBoxTabIndex="347" DatabaseField="hx3usibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3usibp"
											FieldTextBoxTabIndex="348" DatabaseField="hx3usibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ucoum"
											FieldTextBoxTabIndex="349" DatabaseField="hx3ucoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ucoup"
											FieldTextBoxTabIndex="350" DatabaseField="hx3ucoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uaum"
											FieldTextBoxTabIndex="351" DatabaseField="hx3uaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3uaup"
											FieldTextBoxTabIndex="352" DatabaseField="hx3uaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ugpm"
											FieldTextBoxTabIndex="353" DatabaseField="hx3ugpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3ugpp"
											FieldTextBoxTabIndex="354" DatabaseField="hx3ugpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vchld"
											FieldTextBoxTabIndex="357" DatabaseField="hx3vchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vmom"
											FieldTextBoxTabIndex="358" DatabaseField="hx3vmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vdad"
											FieldTextBoxTabIndex="359" DatabaseField="hx3vdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vsib"
											FieldTextBoxTabIndex="360" DatabaseField="hx3vsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vsibm"
											FieldTextBoxTabIndex="361" DatabaseField="hx3vsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vsibp"
											FieldTextBoxTabIndex="362" DatabaseField="hx3vsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vcoum"
											FieldTextBoxTabIndex="363" DatabaseField="hx3vcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vcoup"
											FieldTextBoxTabIndex="364" DatabaseField="hx3vcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vaum"
											FieldTextBoxTabIndex="365" DatabaseField="hx3vaum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vaup"
											FieldTextBoxTabIndex="366" DatabaseField="hx3vaup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vgpm"
											FieldTextBoxTabIndex="367" DatabaseField="hx3vgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3vgpp"
											FieldTextBoxTabIndex="368" DatabaseField="hx3vgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wchld" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wchld"
											FieldTextBoxTabIndex="371" DatabaseField="hx3wchld" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wmom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wmom"
											FieldTextBoxTabIndex="372" DatabaseField="hx3wmom" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wdad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wdad"
											FieldTextBoxTabIndex="373" DatabaseField="hx3wdad" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsib" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wsib"
											FieldTextBoxTabIndex="374" DatabaseField="hx3wsib" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wsibm"
											FieldTextBoxTabIndex="375" DatabaseField="hx3wsibm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wsibp"
											FieldTextBoxTabIndex="376" DatabaseField="hx3wsibp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wcoum"
											FieldTextBoxTabIndex="377" DatabaseField="hx3wcoum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wcoup"
											FieldTextBoxTabIndex="378" DatabaseField="hx3wcoup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3waum"
											FieldTextBoxTabIndex="379" DatabaseField="hx3waum" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3waup"
											FieldTextBoxTabIndex="380" DatabaseField="hx3waup" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wgpm"
											FieldTextBoxTabIndex="381" DatabaseField="hx3wgpm" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx3wgpp"
											FieldTextBoxTabIndex="382" DatabaseField="hx3wgpp" FieldTextBoxWidth="30px" ValidList="0,1,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wotr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx3wotr"
											FieldTextBoxTabIndex="383" DatabaseField="hx3wotr" FieldTextBoxWidth="100px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">15. Have you ever had seizures or convulsions?<BR>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx15"
											FieldTextBoxTabIndex="524" DatabaseField="hx15" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="hx15a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx15a"
											FieldTextBoxTabIndex="525" DatabaseField="hx15a" FieldTextBoxWidth="30px" ValidList="0,1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Do you have&nbsp;seizures or convulsions&nbsp;now?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx15b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx15b"
											FieldTextBoxTabIndex="526" DatabaseField="hx15b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Did the seizures only occur when&nbsp;you had a fever</TD>
									<TD>
										<def:datafieldcontrol id="hx15c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx15c"
											FieldTextBoxTabIndex="527" DatabaseField="hx15c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Do you&nbsp; take meds to control seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx15d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx15d"
											FieldTextBoxTabIndex="528" DatabaseField="hx15d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">16. Has you ever...</TD>
								</TR>
								<TR>
									<TD>a. Had an abnormal picture of the brain</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx16a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16a"
											FieldTextBoxTabIndex="529" DatabaseField="hx16a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="30">b. Been hospitalized for meningitis</TD>
									<TD height="30">
										<def:datafieldcontrol id="hx16b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16b"
											FieldTextBoxTabIndex="530" DatabaseField="hx16b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Lost consciousness due to a head injury</TD>
									<TD>
										<def:datafieldcontrol id="hx16c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16c"
											FieldTextBoxTabIndex="531" DatabaseField="hx16c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
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
										<def:datafieldcontrol id="hx16c1y" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1."
											FieldTextBoxTabIndex="532" DatabaseField="hx16c1y" FieldLabelWidth="20px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c1m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16c1m"
											FieldTextBoxTabIndex="533" DatabaseField="hx16c1m" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx16c2y" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2."
											FieldTextBoxTabIndex="534" DatabaseField="hx16c2y" FieldLabelWidth="20px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c2m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16c2m"
											FieldTextBoxTabIndex="535" DatabaseField="hx16c2m" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx16c3y" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3."
											FieldTextBoxTabIndex="536" DatabaseField="hx16c3y" FieldLabelWidth="20px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c3m" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx16c3m"
											FieldTextBoxTabIndex="537" DatabaseField="hx16c3m" FieldTextBoxWidth="40px" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">17. Did you have any of the following birth 
										defects?</TD>
								</TR>
								<TR>
									<TD>a. Cleft lip of palate</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx17a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17a"
											FieldTextBoxTabIndex="538" DatabaseField="hx17a" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal shape of hands, feet, arms or legs</TD>
									<TD>
										<def:datafieldcontrol id="hx17b" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17b"
											FieldTextBoxTabIndex="539" DatabaseField="hx17b" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Open spine</TD>
									<TD>
										<def:datafieldcontrol id="hx17c" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17c"
											FieldTextBoxTabIndex="540" DatabaseField="hx17c" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Heart defect (specify)<BR>
										<def:datafieldcontrol id="hx17ds" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx17ds"
											FieldTextBoxTabIndex="541" DatabaseField="hx17ds" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17d" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17d"
											FieldTextBoxTabIndex="541" DatabaseField="hx17d" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Kidney defect (specify)<BR>
										<def:datafieldcontrol id="hx17es" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx17es"
											FieldTextBoxTabIndex="543" DatabaseField="hx17es" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17e" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17e"
											FieldTextBoxTabIndex="543" DatabaseField="hx17e" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other defect (specify)<BR>
										<def:datafieldcontrol id="hx17fs" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx17fs"
											FieldTextBoxTabIndex="545" DatabaseField="hx17fs" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx17f" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx17f"
											FieldTextBoxTabIndex="545" DatabaseField="hx17f" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD width="273">18. Do you have any other chronic medical problems?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18"
											FieldTextBoxTabIndex="547" DatabaseField="hx18" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">a. Medical problem #1</TD>
									<TD>
										<def:datafieldcontrol id="hx18apr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx18apr"
											FieldTextBoxTabIndex="548" DatabaseField="hx18apr" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #1</TD>
									<TD>
										<def:datafieldcontrol id="hx18ah" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18ah"
											FieldTextBoxTabIndex="549" DatabaseField="hx18ah" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">b. Medical problem #2</TD>
									<TD>
										<def:datafieldcontrol id="hx18bpr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx18bpr"
											FieldTextBoxTabIndex="551" DatabaseField="hx18bpr" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #2</TD>
									<TD>
										<def:datafieldcontrol id="hx18bh" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18bh"
											FieldTextBoxTabIndex="552" DatabaseField="hx18bh" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">c. Medical problem #3</TD>
									<TD>
										<def:datafieldcontrol id="hx18cpr" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hx18cpr"
											FieldTextBoxTabIndex="554" DatabaseField="hx18cpr" FieldTextBoxWidth="200px" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #3</TD>
									<TD>
										<def:datafieldcontrol id="hx18ch" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx18ch"
											FieldTextBoxTabIndex="555" DatabaseField="hx18ch" FieldTextBoxWidth="30px" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR> <%-- Not asked anymore df:6/20/05
							<TABLE class="grid">
								<TR>
									<TD width="273">19. Maternal (Mother's) Date of Birth</TD>
									<TD>
										<def:datafieldcontrol id="hx19" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="hx19"
											FieldTextBoxTabIndex="555" DatabaseField="hx19" FieldTextBoxWidth="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							--%>
							<TABLE class="layout" id="layout">
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
						</asp:Panel>
					</asp:Content>
