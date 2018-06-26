<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.tap_fif_update.tap_fif_update" CodeFile="tap_fif_update.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="778" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="fu_pk" MeasureName="TAP T3 FIF Update" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="tap_fif_update"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" DatabaseField="ID" FieldTextBoxTabIndex="6" FieldLabelText="TAP ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###"
										FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading" colSpan="2">A. Contact/General Family Information</TD>
								</TR>
								<TR>
									<TD>1. Date</TD>
									<TD>
										<def:datafieldcontrol id="fhadate" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="fhadate" FieldTextBoxTabIndex="6" DatabaseField="fuadate" ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Person completing form</TD>
									<TD>
										<def:datafieldcontrol id="fhaln" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="Last" FieldTextBoxTabIndex="6" DatabaseField="fualn"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhafn" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="First" FieldTextBoxTabIndex="6" DatabaseField="fuafn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3. Participating child's name</TD>
									<TD>
										<def:datafieldcontrol id="fhacln" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="Last" FieldTextBoxTabIndex="6" DatabaseField="fuacln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhacfn" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="First" FieldTextBoxTabIndex="6" DatabaseField="fuacfn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4. Relationship to participating child<BR>
										1=biological mother<BR>
										2=stepmother<BR>
										3=adoptive mother<BR>
										4=biological father<BR>
										5=stepfather<BR>
										6=adoptive father<BR>
										7=Other<BR>
										-9=missing</TD>
									<TD>
										<def:datafieldcontrol id="fharlat" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fharlat" FieldTextBoxTabIndex="6" DatabaseField="fuarlat" ShowFieldLabel="False" ValidList="1,2,3,4,5,6,7,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other:" FieldTextBoxTabIndex="6" DatabaseField="fuarlato"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">5. Phone numbers</TD>
									<TD>
										<def:datafieldcontrol id="fhaph1" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Home" FieldTextBoxTabIndex="6" DatabaseField="fuaph1" ShowFieldLabel="True"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fhaph2" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Cell" FieldTextBoxTabIndex="6" DatabaseField="fuaph2" ShowFieldLabel="True"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fhaph3" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Work" FieldTextBoxTabIndex="6" DatabaseField="fuaph3" ShowFieldLabel="True"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fhaph4" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other" FieldTextBoxTabIndex="6" DatabaseField="fuaph4"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">6. Address</TD>
									<TD>
										<def:datafieldcontrol id="fhaaddr1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 1" FieldTextBoxTabIndex="6"
											DatabaseField="fuaaddr1" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fhaaddr2" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 2" FieldTextBoxTabIndex="6"
											DatabaseField="fuaaddr2" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="fhacity" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="City" FieldTextBoxTabIndex="6" DatabaseField="fuacity"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhastate" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="State" FieldTextBoxTabIndex="6" DatabaseField="fuastate"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhazip" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Zip" FieldTextBoxTabIndex="6" DatabaseField="fuazip" ShowFieldLabel="True"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>7. Primary Contact? ) (Y or N)</TD>
									<TD>
										<def:datafieldcontrol id="fhapc" runat="server" FieldTextBoxWidth="30px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhapc" FieldTextBoxTabIndex="6" DatabaseField="fuapc" ShowFieldLabel="False" ValidList="Y,y,N,n"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>8. If no, name of primary contact</TD>
									<TD>
										<def:datafieldcontrol id="fhapcln" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Last" FieldTextBoxTabIndex="6" DatabaseField="fuapcln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhapcfn" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="First" FieldTextBoxTabIndex="6" DatabaseField="fuapcfn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">9. Phone numbers</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 1" FieldTextBoxTabIndex="6" DatabaseField="fuapcph1"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 2" FieldTextBoxTabIndex="6" DatabaseField="fuapcph2"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 3" FieldTextBoxTabIndex="6" DatabaseField="fuapcph3"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 4" FieldTextBoxTabIndex="6" DatabaseField="fuapcph4"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 5" FieldTextBoxTabIndex="6" DatabaseField="fuapcph5"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">10. Address</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 1" FieldTextBoxTabIndex="6"
											DatabaseField="fuapcadr1" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 2" FieldTextBoxTabIndex="6"
											DatabaseField="fuapcadr2" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="City" FieldTextBoxTabIndex="6" DatabaseField="fuapcity"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="50px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="State" FieldTextBoxTabIndex="6" DatabaseField="fuapcst"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Zip" FieldTextBoxTabIndex="6" DatabaseField="fuapczip"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">11. Email address(es)</TD>
									<TD>
										<def:datafieldcontrol id="fhaeml" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Email 1" FieldTextBoxTabIndex="6" DatabaseField="fuaeml1"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 2" FieldTextBoxTabIndex="6" DatabaseField="fuaeml2"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 3" FieldTextBoxTabIndex="6" DatabaseField="fuaeml3"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 4" FieldTextBoxTabIndex="6" DatabaseField="fuaeml4"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 5" FieldTextBoxTabIndex="6" DatabaseField="fuaeml5"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><br>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="6">12. Pregnancy History: 
										Haveyouhadanypregnanciessinceyourchild'sfirstvisit?(1=Yes,0=No,9=Missing)&nbsp;
										<def:datafieldcontrol id="Datafieldcontrol21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fu12" FieldTextBoxTabIndex="6" DatabaseField="fu12"
											ShowFieldLabel="False" ValidList="0,1,9" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="hx1a1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a1" FieldTextBoxTabIndex="6" DatabaseField="fu12a1" ShowFieldLabel="False" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9" DESIGNTIMEDRAGDROP="28931"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a2" FieldTextBoxTabIndex="6" DatabaseField="fu12a2" ShowFieldLabel="False" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a3" FieldTextBoxTabIndex="6" DatabaseField="fu12a3" ShowFieldLabel="False" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a4" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a4" FieldTextBoxTabIndex="6" DatabaseField="fu12a4" ShowFieldLabel="False" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1a5" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1a4" FieldTextBoxTabIndex="6" DatabaseField="fu12a5" ShowFieldLabel="False" ValidList="0,1,2,3,4,5,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Date of Birth</TD>
									<TD>
										<def:datafieldcontrol id="hx1b1" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b1" FieldTextBoxTabIndex="6" DatabaseField="fu12b1" ShowFieldLabel="False"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b2" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b2" FieldTextBoxTabIndex="6" DatabaseField="fu12b2" ShowFieldLabel="False"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b3" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b3" FieldTextBoxTabIndex="6" DatabaseField="fu12b3" ShowFieldLabel="False"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b4" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b4" FieldTextBoxTabIndex="6" DatabaseField="fu12b4" ShowFieldLabel="False"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1b5" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hx1b5" FieldTextBoxTabIndex="6" DatabaseField="fu12b5" ShowFieldLabel="False"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="hx1c1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c1" FieldTextBoxTabIndex="6" DatabaseField="fu12c1" ShowFieldLabel="False" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c2" FieldTextBoxTabIndex="6" DatabaseField="fu12c2" ShowFieldLabel="False" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c3" FieldTextBoxTabIndex="6" DatabaseField="fu12c3" ShowFieldLabel="False" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c4" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c4" FieldTextBoxTabIndex="6" DatabaseField="fu12c4" ShowFieldLabel="False" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx1c5" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx1c5" FieldTextBoxTabIndex="6" DatabaseField="fu12c5" ShowFieldLabel="False" ValidList="0,1,2,3,4,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD colSpan="9" class="heading">13. List all of the participating child's siblings.
									</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD colSpan="2">Child's Name</TD>
									<TD>Birthdate</TD>
									<TD>Gender</TD>
									<TD colSpan="2">Biological Mother</TD>
									<TD colSpan="2">Biological Father</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>First</TD>
									<TD>Last</TD>
									<TD></TD>
									<TD>(M or F)</TD>
									<TD>First</TD>
									<TD>Last</TD>
									<TD>First</TD>
									<TD>Last</TD>
								</TR>
								<TR>
									<TD>#1</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn1"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfn1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln1"
											FieldTextBoxTabIndex="6" DatabaseField="fuasln1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob1" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob1" FieldTextBoxTabIndex="6" DatabaseField="fuasdob1"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex1" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex1" FieldTextBoxTabIndex="6" DatabaseField="fuassex1"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn1"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmfn1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln1"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmln1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs1"
											FieldTextBoxTabIndex="6" DatabaseField="fuasffs1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln1"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfln1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#2</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn2"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfn2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln2"
											FieldTextBoxTabIndex="6" DatabaseField="fuasln2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob2" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob2" FieldTextBoxTabIndex="6" DatabaseField="fuasdob2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex2" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex2" FieldTextBoxTabIndex="6" DatabaseField="fuassex2"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn2"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmfn2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln2"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmln2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs2"
											FieldTextBoxTabIndex="6" DatabaseField="fuasffs2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln2"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfln2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#3</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn3"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfn3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln3"
											FieldTextBoxTabIndex="6" DatabaseField="fuasln3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob3" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob3" FieldTextBoxTabIndex="6" DatabaseField="fuasdob3"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex3" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex3" FieldTextBoxTabIndex="6" DatabaseField="fuassex3"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn3"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmfn3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln3"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmln3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs3"
											FieldTextBoxTabIndex="6" DatabaseField="fuasffs3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln3"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfln3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#4</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn4"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfn4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln4"
											FieldTextBoxTabIndex="6" DatabaseField="fuasln4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob4" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob4" FieldTextBoxTabIndex="6" DatabaseField="fuasdob4"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex4" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex4" FieldTextBoxTabIndex="6" DatabaseField="fuassex4"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn4"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmfn4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln4"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmln4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs4"
											FieldTextBoxTabIndex="6" DatabaseField="fuasffs4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln4"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfln4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#5</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn5"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfn5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln5"
											FieldTextBoxTabIndex="6" DatabaseField="fuasln5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob5" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob5" FieldTextBoxTabIndex="6" DatabaseField="fuasdob5"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex5" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex5" FieldTextBoxTabIndex="6" DatabaseField="fuassex5"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn5"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmfn5" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="30975"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln5"
											FieldTextBoxTabIndex="6" DatabaseField="fuasmln5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs5"
											FieldTextBoxTabIndex="6" DatabaseField="fuasffs5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln5"
											FieldTextBoxTabIndex="6" DatabaseField="fuasfln5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD colSpan="2" class="heading">(use -9 for missing)</TD>
								</TR>
								<TR>
									<TD>14. How many people live in the child's home</TD>
									<TD>
										<def:datafieldcontrol id="fha13" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha13" FieldTextBoxTabIndex="6" DatabaseField="fua14" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15. Please estimate you family's gross annual income</TD>
									<TD>
										<def:datafieldcontrol id="fha14" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha14" FieldTextBoxTabIndex="6" DatabaseField="fua15" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16. If you own a business, please estimate the business value</TD>
									<TD>
										<def:datafieldcontrol id="fha15" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha15" FieldTextBoxTabIndex="6" DatabaseField="fua16" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17. If child is spending equal amount of time in two homes...</TD>
									<TD>
										<def:datafieldcontrol id="fha16" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha16" FieldTextBoxTabIndex="6" DatabaseField="fua17" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><br>
							<B>B. MEDICAL HISTORY UPDATE</B><BR>
							<def:datafieldcontrol id="Datafieldcontrol22" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Biological Mother's Name" FieldTextBoxTabIndex="6" DatabaseField="fu18mo"
								ShowFieldLabel="True" DESIGNTIMEDRAGDROP="32610"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol23" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Biological Fathers's Name" FieldTextBoxTabIndex="6" DatabaseField="fu18fa"
								ShowFieldLabel="True" DESIGNTIMEDRAGDROP="32611"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol26" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Sibling 1" FieldTextBoxTabIndex="6" DatabaseField="fu18s1"
								ShowFieldLabel="True" DESIGNTIMEDRAGDROP="32913"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol27" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Sibling 2" FieldTextBoxTabIndex="6" DatabaseField="fu18s2"
								ShowFieldLabel="True" DESIGNTIMEDRAGDROP="32915"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol25" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Sibling 3" FieldTextBoxTabIndex="6" DatabaseField="fu18s3"
								ShowFieldLabel="True" DESIGNTIMEDRAGDROP="32917"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD colSpan="7" class="heading">18. Medical History Update</TD>
								</TR>
								<TR>
									<TD>1=checked</TD>
									<TD>Child</TD>
									<TD>Father</TD>
									<TD>Mother</TD>
									<TD>Sibling 1<BR>
										<def:datafieldcontrol id="Datafieldcontrol24" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Sibling 1" FieldTextBoxTabIndex="6" DatabaseField="fu18ms1"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>Sibling 2<BR>
										<def:datafieldcontrol id="Datafieldcontrol28" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Sibling 2" FieldTextBoxTabIndex="6" DatabaseField="fu18ms2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>Sibling 3<BR>
										<def:datafieldcontrol id="Datafieldcontrol29" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Sibling 3" FieldTextBoxTabIndex="6" DatabaseField="fu18ms3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="7"><b>Social/Developmental</b></TD>
								</TR>
								<TR>
									<TD>a. Social Awkwardness/Impairment</TD>
									<TD>
										<def:datafieldcontrol id="fubac" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubac" FieldTextBoxTabIndex="6" DatabaseField="fubac" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubaf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubaf" FieldTextBoxTabIndex="6" DatabaseField="fubaf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubam" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubam" FieldTextBoxTabIndex="6" DatabaseField="fubam" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubas1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubas1" FieldTextBoxTabIndex="6" DatabaseField="fubas1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubas2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubas2" FieldTextBoxTabIndex="6" DatabaseField="fubas2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubas3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubas3" FieldTextBoxTabIndex="6" DatabaseField="fubas3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Motor coordination</TD>
									<TD>
										<def:datafieldcontrol id="fubbc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubbc" FieldTextBoxTabIndex="6" DatabaseField="fubbc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubbf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubbf" FieldTextBoxTabIndex="6" DatabaseField="fubbf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubbm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubbm" FieldTextBoxTabIndex="6" DatabaseField="fubbm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubbs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubbs1" FieldTextBoxTabIndex="6" DatabaseField="fubbs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubbs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubbs2" FieldTextBoxTabIndex="6" DatabaseField="fubbs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubbs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubbs3" FieldTextBoxTabIndex="6" DatabaseField="fubbs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Tics or Other Motor problems</TD>
									<TD>
										<def:datafieldcontrol id="fubcc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubcc" FieldTextBoxTabIndex="6" DatabaseField="fubcc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubcf" FieldTextBoxTabIndex="6" DatabaseField="fubcf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubcm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubcm" FieldTextBoxTabIndex="6" DatabaseField="fubcm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubcs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubcs1" FieldTextBoxTabIndex="6" DatabaseField="fubcs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubcs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubcs2" FieldTextBoxTabIndex="6" DatabaseField="fubcs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubcs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubcs3" FieldTextBoxTabIndex="6" DatabaseField="fubcs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Learning Problems</TD>
									<TD>
										<def:datafieldcontrol id="fubdc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubdc" FieldTextBoxTabIndex="6" DatabaseField="fubdc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubdf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubdf" FieldTextBoxTabIndex="6" DatabaseField="fubdf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubdm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubdm" FieldTextBoxTabIndex="6" DatabaseField="fubdm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubds1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubds1" FieldTextBoxTabIndex="6" DatabaseField="fubds1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubds2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubds2" FieldTextBoxTabIndex="6" DatabaseField="fubds2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubds3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubds3" FieldTextBoxTabIndex="6" DatabaseField="fubds3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Special Education</TD>
									<TD>
										<def:datafieldcontrol id="fubec" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubec" FieldTextBoxTabIndex="6" DatabaseField="fubec" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubef" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubef" FieldTextBoxTabIndex="6" DatabaseField="fubef" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubem" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubem" FieldTextBoxTabIndex="6" DatabaseField="fubem" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubes1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubes1" FieldTextBoxTabIndex="6" DatabaseField="fubes1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubes2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubes2" FieldTextBoxTabIndex="6" DatabaseField="fubes2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubes3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubes3" FieldTextBoxTabIndex="6" DatabaseField="fubes3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="7"><b>Medical/Health</b></TD>
								</TR>
								<TR>
									<TD>f. Cancer</TD>
									<TD>
										<def:datafieldcontrol id="fubfc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubfc" FieldTextBoxTabIndex="6" DatabaseField="fubfc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubff" FieldTextBoxTabIndex="6" DatabaseField="fubff" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubfm" FieldTextBoxTabIndex="6" DatabaseField="fubfm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubfs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubfs1" FieldTextBoxTabIndex="6" DatabaseField="fubfs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubfs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubfs2" FieldTextBoxTabIndex="6" DatabaseField="fubfs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubfs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubfs3" FieldTextBoxTabIndex="6" DatabaseField="fubfs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Vision problems</TD>
									<TD>
										<def:datafieldcontrol id="fubgc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubgc" FieldTextBoxTabIndex="6" DatabaseField="fubgc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubgf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubgf" FieldTextBoxTabIndex="6" DatabaseField="fubgf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubgm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubgm" FieldTextBoxTabIndex="6" DatabaseField="fubgm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubgs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubgs1" FieldTextBoxTabIndex="6" DatabaseField="fubgs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubgs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubgs2" FieldTextBoxTabIndex="6" DatabaseField="fubgs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubgs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubgs3" FieldTextBoxTabIndex="6" DatabaseField="fubgs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Hearing problems</TD>
									<TD>
										<def:datafieldcontrol id="fubhc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubhc" FieldTextBoxTabIndex="6" DatabaseField="fubhc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubhf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubhf" FieldTextBoxTabIndex="6" DatabaseField="fubhf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubhm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubhm" FieldTextBoxTabIndex="6" DatabaseField="fubhm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubhs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubhs1" FieldTextBoxTabIndex="6" DatabaseField="fubhs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubhs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubhs2" FieldTextBoxTabIndex="6" DatabaseField="fubhs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubhs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubhs3" FieldTextBoxTabIndex="6" DatabaseField="fubhs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Attention problems</TD>
									<TD>
										<def:datafieldcontrol id="fubic" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubic" FieldTextBoxTabIndex="6" DatabaseField="fubic" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubif" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubif" FieldTextBoxTabIndex="6" DatabaseField="fubif" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubim" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubim" FieldTextBoxTabIndex="6" DatabaseField="fubim" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubis1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubis1" FieldTextBoxTabIndex="6" DatabaseField="fubis1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubis2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubis2" FieldTextBoxTabIndex="6" DatabaseField="fubis2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubis3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubis3" FieldTextBoxTabIndex="6" DatabaseField="fubis3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Hyperactivity</TD>
									<TD>
										<def:datafieldcontrol id="fubjc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubjc" FieldTextBoxTabIndex="6" DatabaseField="fubjc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubjf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubjf" FieldTextBoxTabIndex="6" DatabaseField="fubjf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubjm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubjm" FieldTextBoxTabIndex="6" DatabaseField="fubjm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubjs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubjs1" FieldTextBoxTabIndex="6" DatabaseField="fubjs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubjs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubjs2" FieldTextBoxTabIndex="6" DatabaseField="fubjs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubjs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubjs3" FieldTextBoxTabIndex="6" DatabaseField="fubjs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Neurological Diseases</TD>
									<TD>
										<def:datafieldcontrol id="fubkc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubkc" FieldTextBoxTabIndex="6" DatabaseField="fubkc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubkf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubkf" FieldTextBoxTabIndex="6" DatabaseField="fubkf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubkm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubkm" FieldTextBoxTabIndex="6" DatabaseField="fubkm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubks1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubks1" FieldTextBoxTabIndex="6" DatabaseField="fubks1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubks2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubks2" FieldTextBoxTabIndex="6" DatabaseField="fubks2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubks3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubks3" FieldTextBoxTabIndex="6" DatabaseField="fubks3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Epilepsy/Seizures</TD>
									<TD>
										<def:datafieldcontrol id="fublc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fublc" FieldTextBoxTabIndex="6" DatabaseField="fublc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fublf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fublf" FieldTextBoxTabIndex="6" DatabaseField="fublf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fublm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fublm" FieldTextBoxTabIndex="6" DatabaseField="fublm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubls1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubls1" FieldTextBoxTabIndex="6" DatabaseField="fubls1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubls2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubls2" FieldTextBoxTabIndex="6" DatabaseField="fubls2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubls3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubls3" FieldTextBoxTabIndex="6" DatabaseField="fubls3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Turberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="fubmc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubmc" FieldTextBoxTabIndex="6" DatabaseField="fubmc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubmf" FieldTextBoxTabIndex="6" DatabaseField="fubmf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubmm" FieldTextBoxTabIndex="6" DatabaseField="fubmm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubms1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubms1" FieldTextBoxTabIndex="6" DatabaseField="fubms1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubms2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubms2" FieldTextBoxTabIndex="6" DatabaseField="fubms2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubms3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubms3" FieldTextBoxTabIndex="6" DatabaseField="fubms3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="fubnc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubnc" FieldTextBoxTabIndex="6" DatabaseField="fubnc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubnf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubnf" FieldTextBoxTabIndex="6" DatabaseField="fubnf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubnm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubnm" FieldTextBoxTabIndex="6" DatabaseField="fubnm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubns1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubns1" FieldTextBoxTabIndex="6" DatabaseField="fubns1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubns2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubns2" FieldTextBoxTabIndex="6" DatabaseField="fubns2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubns3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubns3" FieldTextBoxTabIndex="6" DatabaseField="fubns3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Birth Defects</TD>
									<TD>
										<def:datafieldcontrol id="fuboc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fuboc" FieldTextBoxTabIndex="6" DatabaseField="fuboc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubof" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubof" FieldTextBoxTabIndex="6" DatabaseField="fubof" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubom" FieldTextBoxTabIndex="6" DatabaseField="fubom" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubos1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubos1" FieldTextBoxTabIndex="6" DatabaseField="fubos1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubos2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubos2" FieldTextBoxTabIndex="6" DatabaseField="fubos2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubos3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubos3" FieldTextBoxTabIndex="6" DatabaseField="fubos3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Major physical anomaly</TD>
									<TD>
										<def:datafieldcontrol id="fubpc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubpc" FieldTextBoxTabIndex="6" DatabaseField="fubpc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubpf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubpf" FieldTextBoxTabIndex="6" DatabaseField="fubpf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubpm" FieldTextBoxTabIndex="6" DatabaseField="fubpm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubps1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubps1" FieldTextBoxTabIndex="6" DatabaseField="fubps1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubps2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubps2" FieldTextBoxTabIndex="6" DatabaseField="fubps2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubps3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubps3" FieldTextBoxTabIndex="6" DatabaseField="fubps3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Minor physical anomaly</TD>
									<TD>
										<def:datafieldcontrol id="fubqc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubqc" FieldTextBoxTabIndex="6" DatabaseField="fubqc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubqf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubqf" FieldTextBoxTabIndex="6" DatabaseField="fubqf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubqm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubqm" FieldTextBoxTabIndex="6" DatabaseField="fubqm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubqs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubqs1" FieldTextBoxTabIndex="6" DatabaseField="fubqs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubqs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubqs2" FieldTextBoxTabIndex="6" DatabaseField="fubqs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubqs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubqs3" FieldTextBoxTabIndex="6" DatabaseField="fubqs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="7"><b>Psychological/Psychiatric</b></TD>
								</TR>
								<TR>
									<TD>r. Tourette's Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="fubrc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubrc" FieldTextBoxTabIndex="6" DatabaseField="fubrc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubrf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubrf" FieldTextBoxTabIndex="6" DatabaseField="fubrf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubrm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubrm" FieldTextBoxTabIndex="6" DatabaseField="fubrm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubrs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubrs1" FieldTextBoxTabIndex="6" DatabaseField="fubrs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubrs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubrs2" FieldTextBoxTabIndex="6" DatabaseField="fubrs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubrs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubrs3" FieldTextBoxTabIndex="6" DatabaseField="fubrs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>s. Obsessive Compulsive Disorder</TD>
									<TD>
										<def:datafieldcontrol id="fubsc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubsc" FieldTextBoxTabIndex="6" DatabaseField="fubsc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubsf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubsf" FieldTextBoxTabIndex="6" DatabaseField="fubsf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubsm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubsm" FieldTextBoxTabIndex="6" DatabaseField="fubsm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubss1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubss1" FieldTextBoxTabIndex="6" DatabaseField="fubss1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubss2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubss2" FieldTextBoxTabIndex="6" DatabaseField="fubss2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubss3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubss3" FieldTextBoxTabIndex="6" DatabaseField="fubss3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>t. Drug Abuse</TD>
									<TD>
										<def:datafieldcontrol id="fubtc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubtc" FieldTextBoxTabIndex="6" DatabaseField="fubtc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubtf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubtf" FieldTextBoxTabIndex="6" DatabaseField="fubtf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubtm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubtm" FieldTextBoxTabIndex="6" DatabaseField="fubtm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubts1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubts1" FieldTextBoxTabIndex="6" DatabaseField="fubts1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubts2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubts2" FieldTextBoxTabIndex="6" DatabaseField="fubts2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubts3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubts3" FieldTextBoxTabIndex="6" DatabaseField="fubts3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>u. Alcoholism</TD>
									<TD>
										<def:datafieldcontrol id="fubuc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubuc" FieldTextBoxTabIndex="6" DatabaseField="fubuc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubuf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubuf" FieldTextBoxTabIndex="6" DatabaseField="fubuf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubum" FieldTextBoxTabIndex="6" DatabaseField="fubum" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubus1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubus1" FieldTextBoxTabIndex="6" DatabaseField="fubus1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubus2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubus2" FieldTextBoxTabIndex="6" DatabaseField="fubus2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubus3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubus3" FieldTextBoxTabIndex="6" DatabaseField="fubus3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>v. Delinquency</TD>
									<TD>
										<def:datafieldcontrol id="fubvc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubvc" FieldTextBoxTabIndex="6" DatabaseField="fubvc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubvf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubvf" FieldTextBoxTabIndex="6" DatabaseField="fubvf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubvm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubvm" FieldTextBoxTabIndex="6" DatabaseField="fubvm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubvs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubvs1" FieldTextBoxTabIndex="6" DatabaseField="fubvs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubvs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubvs2" FieldTextBoxTabIndex="6" DatabaseField="fubvs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubvs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubvs3" FieldTextBoxTabIndex="6" DatabaseField="fubvs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>w. A history of being admitted</TD>
									<TD>
										<def:datafieldcontrol id="fubwc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubwc" FieldTextBoxTabIndex="6" DatabaseField="fubwc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubwf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubwf" FieldTextBoxTabIndex="6" DatabaseField="fubwf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubwm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubwm" FieldTextBoxTabIndex="6" DatabaseField="fubwm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubws1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubws1" FieldTextBoxTabIndex="6" DatabaseField="fubws1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubws2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubws2" FieldTextBoxTabIndex="6" DatabaseField="fubws2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubws3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubws3" FieldTextBoxTabIndex="6" DatabaseField="fubws3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>x. Other mental illness</TD>
									<TD>
										<def:datafieldcontrol id="fubxc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubxc" FieldTextBoxTabIndex="6" DatabaseField="fubxc" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubxf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubxf" FieldTextBoxTabIndex="6" DatabaseField="fubxf" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubxm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubxm" FieldTextBoxTabIndex="6" DatabaseField="fubxm" ShowFieldLabel="False"
											ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubxs1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubxs1" FieldTextBoxTabIndex="6" DatabaseField="fubxs1"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubxs2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubxs2" FieldTextBoxTabIndex="6" DatabaseField="fubxs2"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fubxs3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="fubxs3" FieldTextBoxTabIndex="6" DatabaseField="fubxs3"
											ShowFieldLabel="False" ValidList="1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="15">19. Medical history of child and child's blood 
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
										<def:datafieldcontrol id="hx3ahas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ahas" FieldTextBoxTabIndex="6" DatabaseField="fu3ahas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3achld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3achld" FieldTextBoxTabIndex="6" DatabaseField="fu3achld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3amom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3amom" FieldTextBoxTabIndex="6" DatabaseField="fu3amom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3adad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3adad" FieldTextBoxTabIndex="6" DatabaseField="fu3adad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3asib" FieldTextBoxTabIndex="6" DatabaseField="fu3asib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3asibm" FieldTextBoxTabIndex="6" DatabaseField="fu3asibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3asibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3asibp" FieldTextBoxTabIndex="6" DatabaseField="fu3asibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3acoum" FieldTextBoxTabIndex="6" DatabaseField="fu3acoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3acoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3acoup" FieldTextBoxTabIndex="6" DatabaseField="fu3acoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3aaum" FieldTextBoxTabIndex="6" DatabaseField="fu3aaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3aaup" FieldTextBoxTabIndex="6" DatabaseField="fu3aaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0" DESIGNTIMEDRAGDROP="25003"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3agpm" FieldTextBoxTabIndex="6" DatabaseField="fu3agpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3agpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3agpp" FieldTextBoxTabIndex="6" DatabaseField="fu3agpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3aotr" FieldTextBoxTabIndex="6" DatabaseField="fu3aotr"
											ShowFieldLabel="False" DESIGNTIMEDRAGDROP="25012"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Fragile X</TD>
									<TD>
										<def:datafieldcontrol id="hx3bhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bhas" FieldTextBoxTabIndex="6" DatabaseField="fu3bhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bchld" FieldTextBoxTabIndex="6" DatabaseField="fu3bchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bmom" FieldTextBoxTabIndex="6" DatabaseField="fu3bmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bdad" FieldTextBoxTabIndex="6" DatabaseField="fu3bdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bsib" FieldTextBoxTabIndex="6" DatabaseField="fu3bsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3bsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3bsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3bcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3bcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3baum" FieldTextBoxTabIndex="6" DatabaseField="fu3baum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3baup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3baup" FieldTextBoxTabIndex="6" DatabaseField="fu3baup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3bgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3bgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3bgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3bgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3botr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3botr" FieldTextBoxTabIndex="6" DatabaseField="fu3botr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Tuberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3chas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3chas" FieldTextBoxTabIndex="6" DatabaseField="fu3chas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3cchld" FieldTextBoxTabIndex="6" DatabaseField="fu3cchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3cmom" FieldTextBoxTabIndex="6" DatabaseField="fu3cmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3cdad" FieldTextBoxTabIndex="6" DatabaseField="fu3cdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3csib" FieldTextBoxTabIndex="6" DatabaseField="fu3csib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3csibm" FieldTextBoxTabIndex="6" DatabaseField="fu3csibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3csibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3csibp" FieldTextBoxTabIndex="6" DatabaseField="fu3csibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ccoum" FieldTextBoxTabIndex="6" DatabaseField="fu3ccoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ccoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ccoup" FieldTextBoxTabIndex="6" DatabaseField="fu3ccoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3caum" FieldTextBoxTabIndex="6" DatabaseField="fu3caum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3caup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3caup" FieldTextBoxTabIndex="6" DatabaseField="fu3caup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3cgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3cgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3cgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3cgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3cotr" FieldTextBoxTabIndex="6" DatabaseField="fu3cotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Neurofibromatosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3dhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dhas" FieldTextBoxTabIndex="6" DatabaseField="fu3dhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dchld" FieldTextBoxTabIndex="6" DatabaseField="fu3dchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dmom" FieldTextBoxTabIndex="6" DatabaseField="fu3dmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ddad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ddad" FieldTextBoxTabIndex="6" DatabaseField="fu3ddad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dsib" FieldTextBoxTabIndex="6" DatabaseField="fu3dsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3dsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3dsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3dcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3dcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3daum" FieldTextBoxTabIndex="6" DatabaseField="fu3daum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3daup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3daup" FieldTextBoxTabIndex="6" DatabaseField="fu3daup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3dgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3dgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3dgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3dotr" FieldTextBoxTabIndex="6" DatabaseField="fu3dotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Rett Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ehas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ehas" FieldTextBoxTabIndex="6" DatabaseField="fu3ehas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3echld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3echld" FieldTextBoxTabIndex="6" DatabaseField="fu3echld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3emom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3emom" FieldTextBoxTabIndex="6" DatabaseField="fu3emom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3edad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3edad" FieldTextBoxTabIndex="6" DatabaseField="fu3edad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3esib" FieldTextBoxTabIndex="6" DatabaseField="fu3esib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3esibm" FieldTextBoxTabIndex="6" DatabaseField="fu3esibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3esibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3esibp" FieldTextBoxTabIndex="6" DatabaseField="fu3esibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ecoum" FieldTextBoxTabIndex="6" DatabaseField="fu3ecoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ecoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ecoup" FieldTextBoxTabIndex="6" DatabaseField="fu3ecoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3eaum" FieldTextBoxTabIndex="6" DatabaseField="fu3eaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3eaup" FieldTextBoxTabIndex="6" DatabaseField="fu3eaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3egpm" FieldTextBoxTabIndex="6" DatabaseField="fu3egpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3egpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3egpp" FieldTextBoxTabIndex="6" DatabaseField="fu3egpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3eotr" FieldTextBoxTabIndex="6" DatabaseField="fu3eotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Childhood Disintegration Disorder (CDD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3fhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fhas" FieldTextBoxTabIndex="6" DatabaseField="fu3fhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fchld" FieldTextBoxTabIndex="6" DatabaseField="fu3fchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fmom" FieldTextBoxTabIndex="6" DatabaseField="fu3fmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fdad" FieldTextBoxTabIndex="6" DatabaseField="fu3fdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fsib" FieldTextBoxTabIndex="6" DatabaseField="fu3fsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3fsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3fsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3fcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3fcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3faum" FieldTextBoxTabIndex="6" DatabaseField="fu3faum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3faup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3faup" FieldTextBoxTabIndex="6" DatabaseField="fu3faup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3fgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3fgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3fgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3fotr" FieldTextBoxTabIndex="6" DatabaseField="fu3fotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Prader Willi Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ghas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ghas" FieldTextBoxTabIndex="6" DatabaseField="fu3ghas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gchld" FieldTextBoxTabIndex="6" DatabaseField="fu3gchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gmom" FieldTextBoxTabIndex="6" DatabaseField="fu3gmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gdad" FieldTextBoxTabIndex="6" DatabaseField="fu3gdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gsib" FieldTextBoxTabIndex="6" DatabaseField="fu3gsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3gsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3gsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3gcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3gcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gaum" FieldTextBoxTabIndex="6" DatabaseField="fu3gaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3gaup" FieldTextBoxTabIndex="6" DatabaseField="fu3gaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ggpm" FieldTextBoxTabIndex="6" DatabaseField="fu3ggpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ggpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ggpp" FieldTextBoxTabIndex="6" DatabaseField="fu3ggpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3gotr" FieldTextBoxTabIndex="6" DatabaseField="fu3gotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Angelman Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3hhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hhas" FieldTextBoxTabIndex="6" DatabaseField="fu3hhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hchld" FieldTextBoxTabIndex="6" DatabaseField="fu3hchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hmom" FieldTextBoxTabIndex="6" DatabaseField="fu3hmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hdad" FieldTextBoxTabIndex="6" DatabaseField="fu3hdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hsib" FieldTextBoxTabIndex="6" DatabaseField="fu3hsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3hsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3hsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3hcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3hcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3haum" FieldTextBoxTabIndex="6" DatabaseField="fu3haum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3haup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3haup" FieldTextBoxTabIndex="6" DatabaseField="fu3haup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3hgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3hgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3hgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3hotr" FieldTextBoxTabIndex="6" DatabaseField="fu3hotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Other chromosomal abnormality, disorder or syndrome (please specify)
										<def:datafieldcontrol id="hx3is" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3is" FieldTextBoxTabIndex="6" DatabaseField="fu3is" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ihas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ihas" FieldTextBoxTabIndex="6" DatabaseField="fu3ihas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ichld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ichld" FieldTextBoxTabIndex="6" DatabaseField="fu3ichld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3imom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3imom" FieldTextBoxTabIndex="6" DatabaseField="fu3imom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3idad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3idad" FieldTextBoxTabIndex="6" DatabaseField="fu3idad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3isib" FieldTextBoxTabIndex="6" DatabaseField="fu3isib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3isibm" FieldTextBoxTabIndex="6" DatabaseField="fu3isibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3isibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3isibp" FieldTextBoxTabIndex="6" DatabaseField="fu3isibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3icoum" FieldTextBoxTabIndex="6" DatabaseField="fu3icoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3icoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3icoup" FieldTextBoxTabIndex="6" DatabaseField="fu3icoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3iaum" FieldTextBoxTabIndex="6" DatabaseField="fu3iaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3iaup" FieldTextBoxTabIndex="6" DatabaseField="fu3iaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3igpm" FieldTextBoxTabIndex="6" DatabaseField="fu3igpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3igpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3igpp" FieldTextBoxTabIndex="6" DatabaseField="fu3igpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3iotr" FieldTextBoxTabIndex="6" DatabaseField="fu3iotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Congenital rubella</TD>
									<TD>
										<def:datafieldcontrol id="hx3jhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jhas" FieldTextBoxTabIndex="6" DatabaseField="fu3jhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jchld" FieldTextBoxTabIndex="6" DatabaseField="fu3jchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jmom" FieldTextBoxTabIndex="6" DatabaseField="fu3jmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jdad" FieldTextBoxTabIndex="6" DatabaseField="fu3jdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jsib" FieldTextBoxTabIndex="6" DatabaseField="fu3jsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3jsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3jsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3jcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3jcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jaum" FieldTextBoxTabIndex="6" DatabaseField="fu3jaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jaup" FieldTextBoxTabIndex="6" DatabaseField="fu3jaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3jgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3jgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3jgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3jotr" FieldTextBoxTabIndex="6" DatabaseField="fu3jotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. PKU</TD>
									<TD>
										<def:datafieldcontrol id="hx3khas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3khas" FieldTextBoxTabIndex="6" DatabaseField="fu3khas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kchld" FieldTextBoxTabIndex="6" DatabaseField="fu3kchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kmom" FieldTextBoxTabIndex="6" DatabaseField="fu3kmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kdad" FieldTextBoxTabIndex="6" DatabaseField="fu3kdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ksib" FieldTextBoxTabIndex="6" DatabaseField="fu3ksib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ksibm" FieldTextBoxTabIndex="6" DatabaseField="fu3ksibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ksibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ksibp" FieldTextBoxTabIndex="6" DatabaseField="fu3ksibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3kcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3kcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kaum" FieldTextBoxTabIndex="6" DatabaseField="fu3kaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kaup" FieldTextBoxTabIndex="6" DatabaseField="fu3kaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3kgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3kgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3kgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3kotr" FieldTextBoxTabIndex="6" DatabaseField="fu3kotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Hydrocephalus (water on the brain)</TD>
									<TD>
										<def:datafieldcontrol id="hx3lhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lhas" FieldTextBoxTabIndex="6" DatabaseField="fu3lhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lchld" FieldTextBoxTabIndex="6" DatabaseField="fu3lchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lmom" FieldTextBoxTabIndex="6" DatabaseField="fu3lmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ldad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ldad" FieldTextBoxTabIndex="6" DatabaseField="fu3ldad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lsib" FieldTextBoxTabIndex="6" DatabaseField="fu3lsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3lsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3lsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3lcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3lcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3laum" FieldTextBoxTabIndex="6" DatabaseField="fu3laum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3laup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3laup" FieldTextBoxTabIndex="6" DatabaseField="fu3laup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3lgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3lgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3lgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3lotr" FieldTextBoxTabIndex="6" DatabaseField="fu3lotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="hx3mhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mhas" FieldTextBoxTabIndex="6" DatabaseField="fu3mhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mchld" FieldTextBoxTabIndex="6" DatabaseField="fu3mchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mmom" FieldTextBoxTabIndex="6" DatabaseField="fu3mmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mdad" FieldTextBoxTabIndex="6" DatabaseField="fu3mdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3msib" FieldTextBoxTabIndex="6" DatabaseField="fu3msib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3msibm" FieldTextBoxTabIndex="6" DatabaseField="fu3msibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3msibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3msibp" FieldTextBoxTabIndex="6" DatabaseField="fu3msibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3mcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3mcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3maum" FieldTextBoxTabIndex="6" DatabaseField="fu3maum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3maup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3maup" FieldTextBoxTabIndex="6" DatabaseField="fu3maup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3mgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3mgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3mgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3mgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3motr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3motr" FieldTextBoxTabIndex="6" DatabaseField="fu3motr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Mental retardation</TD>
									<TD>
										<def:datafieldcontrol id="hx3nhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3nhas" FieldTextBoxTabIndex="6" DatabaseField="fu3nhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3nchld" FieldTextBoxTabIndex="6" DatabaseField="fu3nchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3nmom" FieldTextBoxTabIndex="6" DatabaseField="fu3nmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ndad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ndad" FieldTextBoxTabIndex="6" DatabaseField="fu3ndad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3nsib" FieldTextBoxTabIndex="6" DatabaseField="fu3nsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3nsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3nsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3nsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3nsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3nsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ncoum" FieldTextBoxTabIndex="6" DatabaseField="fu3ncoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ncoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ncoup" FieldTextBoxTabIndex="6" DatabaseField="fu3ncoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3naum" FieldTextBoxTabIndex="6" DatabaseField="fu3naum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3naup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3naup" FieldTextBoxTabIndex="6" DatabaseField="fu3naup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ngpm" FieldTextBoxTabIndex="6" DatabaseField="fu3ngpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ngpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ngpp" FieldTextBoxTabIndex="6" DatabaseField="fu3ngpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3notr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3notr" FieldTextBoxTabIndex="6" DatabaseField="fu3notr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx3ohas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ohas" FieldTextBoxTabIndex="6" DatabaseField="fu3ohas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ochld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ochld" FieldTextBoxTabIndex="6" DatabaseField="fu3ochld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3omom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3omom" FieldTextBoxTabIndex="6" DatabaseField="fu3omom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3odad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3odad" FieldTextBoxTabIndex="6" DatabaseField="fu3odad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3osib" FieldTextBoxTabIndex="6" DatabaseField="fu3osib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3osibm" FieldTextBoxTabIndex="6" DatabaseField="fu3osibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3osibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3osibp" FieldTextBoxTabIndex="6" DatabaseField="fu3osibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ocoum" FieldTextBoxTabIndex="6" DatabaseField="fu3ocoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ocoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ocoup" FieldTextBoxTabIndex="6" DatabaseField="fu3ocoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3oaum" FieldTextBoxTabIndex="6" DatabaseField="fu3oaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3oaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3oaup" FieldTextBoxTabIndex="6" DatabaseField="fu3oaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ogpm" FieldTextBoxTabIndex="6" DatabaseField="fu3ogpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ogpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ogpp" FieldTextBoxTabIndex="6" DatabaseField="fu3ogpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ootr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3ootr" FieldTextBoxTabIndex="6" DatabaseField="fu3ootr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Speech delay requiring therapy</TD>
									<TD>
										<def:datafieldcontrol id="hx3phas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3phas" FieldTextBoxTabIndex="6" DatabaseField="fu3phas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pchld" FieldTextBoxTabIndex="6" DatabaseField="fu3pchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pmom" FieldTextBoxTabIndex="6" DatabaseField="fu3pmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pdad" FieldTextBoxTabIndex="6" DatabaseField="fu3pdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3psib" FieldTextBoxTabIndex="6" DatabaseField="fu3psib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3psibm" FieldTextBoxTabIndex="6" DatabaseField="fu3psibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3psibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3psibp" FieldTextBoxTabIndex="6" DatabaseField="fu3psibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3pcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3pcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3paum" FieldTextBoxTabIndex="6" DatabaseField="fu3paum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3paup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3paup" FieldTextBoxTabIndex="6" DatabaseField="fu3paup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3pgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3pgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3pgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3pgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3potr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3potr" FieldTextBoxTabIndex="6" DatabaseField="fu3potr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Attention Deficit Disorder (ADD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3qhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qhas" FieldTextBoxTabIndex="6" DatabaseField="fu3qhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qchld" FieldTextBoxTabIndex="6" DatabaseField="fu3qchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qmom" FieldTextBoxTabIndex="6" DatabaseField="fu3qmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qdad" FieldTextBoxTabIndex="6" DatabaseField="fu3qdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qsib" FieldTextBoxTabIndex="6" DatabaseField="fu3qsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3qsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3qsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3qcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3qcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qaum" FieldTextBoxTabIndex="6" DatabaseField="fu3qaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qaup" FieldTextBoxTabIndex="6" DatabaseField="fu3qaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3qgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3qgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3qgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3qotr" FieldTextBoxTabIndex="6" DatabaseField="fu3qotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>r. Panic or anxiety disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx3rhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rhas" FieldTextBoxTabIndex="6" DatabaseField="fu3rhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rchld" FieldTextBoxTabIndex="6" DatabaseField="fu3rchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rmom" FieldTextBoxTabIndex="6" DatabaseField="fu3rmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rdad" FieldTextBoxTabIndex="6" DatabaseField="fu3rdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rsib" FieldTextBoxTabIndex="6" DatabaseField="fu3rsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3rsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3rsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3rcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3rcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3raum" FieldTextBoxTabIndex="6" DatabaseField="fu3raum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3raup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3raup" FieldTextBoxTabIndex="6" DatabaseField="fu3raup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3rgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3rgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3rgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3rotr" FieldTextBoxTabIndex="6" DatabaseField="fu3rotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>s. Depression</TD>
									<TD>
										<def:datafieldcontrol id="hx3shas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3shas" FieldTextBoxTabIndex="6" DatabaseField="fu3shas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3schld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3schld" FieldTextBoxTabIndex="6" DatabaseField="fu3schld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3smom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3smom" FieldTextBoxTabIndex="6" DatabaseField="fu3smom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3sdad" FieldTextBoxTabIndex="6" DatabaseField="fu3sdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ssib" FieldTextBoxTabIndex="6" DatabaseField="fu3ssib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ssibm" FieldTextBoxTabIndex="6" DatabaseField="fu3ssibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ssibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ssibp" FieldTextBoxTabIndex="6" DatabaseField="fu3ssibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3scoum" FieldTextBoxTabIndex="6" DatabaseField="fu3scoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3scoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3scoup" FieldTextBoxTabIndex="6" DatabaseField="fu3scoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3saum" FieldTextBoxTabIndex="6" DatabaseField="fu3saum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3saup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3saup" FieldTextBoxTabIndex="6" DatabaseField="fu3saup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3sgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3sgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3sgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3sgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3sotr" FieldTextBoxTabIndex="6" DatabaseField="fu3sotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>t. Manic depression/Bipolar</TD>
									<TD>
										<def:datafieldcontrol id="hx3thas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3thas" FieldTextBoxTabIndex="6" DatabaseField="fu3thas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tchld" FieldTextBoxTabIndex="6" DatabaseField="fu3tchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tmom" FieldTextBoxTabIndex="6" DatabaseField="fu3tmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tdad" FieldTextBoxTabIndex="6" DatabaseField="fu3tdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tsib" FieldTextBoxTabIndex="6" DatabaseField="fu3tsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3tsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3tsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3tcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3tcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3taum" FieldTextBoxTabIndex="6" DatabaseField="fu3taum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3taup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3taup" FieldTextBoxTabIndex="6" DatabaseField="fu3taup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3tgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3tgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3tgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3tgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3totr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3totr" FieldTextBoxTabIndex="6" DatabaseField="fu3totr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>u. Schizophrenia</TD>
									<TD>
										<def:datafieldcontrol id="hx3uhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3uhas" FieldTextBoxTabIndex="6" DatabaseField="fu3uhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3uchld" FieldTextBoxTabIndex="6" DatabaseField="fu3uchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3umom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3umom" FieldTextBoxTabIndex="6" DatabaseField="fu3umom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3udad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3udad" FieldTextBoxTabIndex="6" DatabaseField="fu3udad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3usib" FieldTextBoxTabIndex="6" DatabaseField="fu3usib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3usibm" FieldTextBoxTabIndex="6" DatabaseField="fu3usibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3usibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3usibp" FieldTextBoxTabIndex="6" DatabaseField="fu3usibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ucoum" FieldTextBoxTabIndex="6" DatabaseField="fu3ucoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ucoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ucoup" FieldTextBoxTabIndex="6" DatabaseField="fu3ucoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3uaum" FieldTextBoxTabIndex="6" DatabaseField="fu3uaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3uaup" FieldTextBoxTabIndex="6" DatabaseField="fu3uaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ugpm" FieldTextBoxTabIndex="6" DatabaseField="fu3ugpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ugpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ugpp" FieldTextBoxTabIndex="6" DatabaseField="fu3ugpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3uotr" FieldTextBoxTabIndex="6" DatabaseField="fu3uotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>v. Been admitted to a hospital for psychiatric illness</TD>
									<TD>
										<def:datafieldcontrol id="hx3vhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vhas" FieldTextBoxTabIndex="6" DatabaseField="fu3vhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vchld" FieldTextBoxTabIndex="6" DatabaseField="fu3vchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vmom" FieldTextBoxTabIndex="6" DatabaseField="fu3vmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vdad" FieldTextBoxTabIndex="6" DatabaseField="fu3vdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vsib" FieldTextBoxTabIndex="6" DatabaseField="fu3vsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3vsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3vsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3vcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3vcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vaum" FieldTextBoxTabIndex="6" DatabaseField="fu3vaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vaup" FieldTextBoxTabIndex="6" DatabaseField="fu3vaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3vgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3vgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3vgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3vgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3votr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3votr" FieldTextBoxTabIndex="6" DatabaseField="fu3votr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>w. Birth defects (e.g., cleft lip or palate, open spine)</TD>
									<TD>
										<def:datafieldcontrol id="hx3whas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3whas" FieldTextBoxTabIndex="6" DatabaseField="fu3whas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wchld" FieldTextBoxTabIndex="6" DatabaseField="fu3wchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wmom" FieldTextBoxTabIndex="6" DatabaseField="fu3wmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wdad" FieldTextBoxTabIndex="6" DatabaseField="fu3wdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wsib" FieldTextBoxTabIndex="6" DatabaseField="fu3wsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3wsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3wsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3wcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3wcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3waum" FieldTextBoxTabIndex="6" DatabaseField="fu3waum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3waup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3waup" FieldTextBoxTabIndex="6" DatabaseField="fu3waup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3wgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3wgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3wgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3wotr" FieldTextBoxTabIndex="6" DatabaseField="fu3wotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>x. Cancer (please specify type)
										<def:datafieldcontrol id="hx3xs" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3xs" FieldTextBoxTabIndex="6" DatabaseField="fu3xs" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xhas" FieldTextBoxTabIndex="6" DatabaseField="fu3xhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xchld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xchld" FieldTextBoxTabIndex="6" DatabaseField="fu3xchld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xmom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xmom" FieldTextBoxTabIndex="6" DatabaseField="fu3xmom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xdad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xdad" FieldTextBoxTabIndex="6" DatabaseField="fu3xdad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xsib" FieldTextBoxTabIndex="6" DatabaseField="fu3xsib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xsibm" FieldTextBoxTabIndex="6" DatabaseField="fu3xsibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xsibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xsibp" FieldTextBoxTabIndex="6" DatabaseField="fu3xsibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xcoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xcoum" FieldTextBoxTabIndex="6" DatabaseField="fu3xcoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xcoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xcoup" FieldTextBoxTabIndex="6" DatabaseField="fu3xcoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xaum" FieldTextBoxTabIndex="6" DatabaseField="fu3xaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xaup" FieldTextBoxTabIndex="6" DatabaseField="fu3xaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xgpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xgpm" FieldTextBoxTabIndex="6" DatabaseField="fu3xgpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xgpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3xgpp" FieldTextBoxTabIndex="6" DatabaseField="fu3xgpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3xotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3xotr" FieldTextBoxTabIndex="6" DatabaseField="fu3xotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>y. Norrie Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3yhas" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3yhas" FieldTextBoxTabIndex="6" DatabaseField="fu3yhas" ShowFieldLabel="False" ValidList="0,1,2,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ychld" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ychld" FieldTextBoxTabIndex="6" DatabaseField="fu3ychld" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ymom" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ymom" FieldTextBoxTabIndex="6" DatabaseField="fu3ymom" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ydad" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ydad" FieldTextBoxTabIndex="6" DatabaseField="fu3ydad" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysib" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ysib" FieldTextBoxTabIndex="6" DatabaseField="fu3ysib" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysibm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ysibm" FieldTextBoxTabIndex="6" DatabaseField="fu3ysibm" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ysibp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ysibp" FieldTextBoxTabIndex="6" DatabaseField="fu3ysibp" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ycoum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ycoum" FieldTextBoxTabIndex="6" DatabaseField="fu3ycoum" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ycoup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ycoup" FieldTextBoxTabIndex="6" DatabaseField="fu3ycoup" ShowFieldLabel="False"
											ValidList="0,1,-7,-8,-9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yaum" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3yaum" FieldTextBoxTabIndex="6" DatabaseField="fu3yaum" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yaup" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3yaup" FieldTextBoxTabIndex="6" DatabaseField="fu3yaup" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ygpm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ygpm" FieldTextBoxTabIndex="6" DatabaseField="fu3ygpm" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ygpp" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx3ygpp" FieldTextBoxTabIndex="6" DatabaseField="fu3ygpp" ShowFieldLabel="False" ValidList="0,1,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3yotr" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx3yotr" FieldTextBoxTabIndex="6" DatabaseField="fu3yotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">20. Has this child ever had seizures or 
										convulsions?<BR>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx15" FieldTextBoxTabIndex="6" DatabaseField="fu20" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="hx15a" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx15a" FieldTextBoxTabIndex="6" DatabaseField="fu20a" ShowFieldLabel="False" ValidList="0,1,2,3,4,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Does this child have seizures now?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx15b" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx15b" FieldTextBoxTabIndex="6" DatabaseField="fu20b" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Did the seizures only occur when this child had a fever</TD>
									<TD>
										<def:datafieldcontrol id="hx15c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx15c" FieldTextBoxTabIndex="6" DatabaseField="fu20c" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Does this child now take meds to control seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx15d" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx15d" FieldTextBoxTabIndex="6" DatabaseField="fu20d" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" style="HEIGHT: 19px" colSpan="2">21. Has child ever...</TD>
								</TR>
								<TR>
									<TD>a. Had an abnormal picture of the brain</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx16a" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx16a" FieldTextBoxTabIndex="6" DatabaseField="fu21a" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="30">b. Been hospitalized for meningitis</TD>
									<TD height="30">
										<def:datafieldcontrol id="hx16b" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx16b" FieldTextBoxTabIndex="6" DatabaseField="fu21b" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Lost consciousness due to a head injury</TD>
									<TD>
										<def:datafieldcontrol id="hx16c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx16c" FieldTextBoxTabIndex="6" DatabaseField="fu21c" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="hx16c1y" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1." FieldTextBoxTabIndex="6" DatabaseField="fu21c1y"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c1m" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx16c1m" FieldTextBoxTabIndex="6" DatabaseField="fu21c1m" ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx16c2y" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2." FieldTextBoxTabIndex="6" DatabaseField="fu21c2y"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c2m" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx16c2m" FieldTextBoxTabIndex="6" DatabaseField="fu21c2m" ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx16c3y" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3." FieldTextBoxTabIndex="6" DatabaseField="fu21c3y"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16c3m" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx16c3m" FieldTextBoxTabIndex="6" DatabaseField="fu21c3m" ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD width="273" colspan="2" class="heading">22. Does the child have any other chronic medical problems?
									(0=NO,1=YES)
										<def:datafieldcontrol id="hx18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx18" FieldTextBoxTabIndex="6" DatabaseField="fu22" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol>
									</TD>

								</TR>
								<TR>
									<TD width="273">a. Medical problem #1</TD>
									<TD>
										<def:datafieldcontrol id="hx18apr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx18apr" FieldTextBoxTabIndex="6" DatabaseField="fu22apr"
											ShowFieldLabel="False" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #1</TD>
									<TD>
										<def:datafieldcontrol id="hx18ah" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx18ah" FieldTextBoxTabIndex="6" DatabaseField="fu22ah" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">b. Medical problem #2</TD>
									<TD>
										<def:datafieldcontrol id="hx18bpr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx18bpr" FieldTextBoxTabIndex="6" DatabaseField="fu22bpr"
											ShowFieldLabel="False" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #2</TD>
									<TD>
										<def:datafieldcontrol id="hx18bh" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx18bh" FieldTextBoxTabIndex="6" DatabaseField="fu22bh" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">c. Medical problem #3</TD>
									<TD>
										<def:datafieldcontrol id="hx18cpr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hx18cpr" FieldTextBoxTabIndex="6" DatabaseField="fu22cpr"
											ShowFieldLabel="False" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #3</TD>
									<TD>
										<def:datafieldcontrol id="hx18ch" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hx18ch" FieldTextBoxTabIndex="6" DatabaseField="fu22ch" ShowFieldLabel="False" ValidList="0,1,9,-7,-8,-9"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<def:datafieldcontrol id="hxb4med" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
								FieldLabelText="23. medications on a regular basis? (1=yes,2=no,9=missing/blank)" FieldTextBoxTabIndex="6"
								DatabaseField="fu23med" ValidList="1,2,9"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Name of Medicine</TD>
									<TD class="heading">Reason</TD>
									<TD class="heading">Date Began<BR>
										mm/yyyy</TD>
									<TD class="heading">Currently<BR>
										Taking?<BR>
										1=yes,2=no,9=missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb401n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb401n" FieldTextBoxTabIndex="6" DatabaseField="fu2301n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb401r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb401r"
											FieldTextBoxTabIndex="6" DatabaseField="fu2301r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb401d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="6" DatabaseField="fu2301dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="6" DatabaseField="fu2301dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb401c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb401c" FieldTextBoxTabIndex="6" DatabaseField="fu2301c"
											ShowFieldLabel="False" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb402n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb402n" FieldTextBoxTabIndex="6" DatabaseField="fu2302n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb402r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb402r"
											FieldTextBoxTabIndex="6" DatabaseField="fu2302r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb402d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="6" DatabaseField="fu2302dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="6" DatabaseField="fu2302dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb402c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb402c" FieldTextBoxTabIndex="6" DatabaseField="fu2302c"
											ShowFieldLabel="False" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb403n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb403n" FieldTextBoxTabIndex="6" DatabaseField="fu2303n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb403r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb403r"
											FieldTextBoxTabIndex="6" DatabaseField="fu2303r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb403d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="6" DatabaseField="fu2303dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol18" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="6" DatabaseField="fu2303dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb403c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb403c" FieldTextBoxTabIndex="6" DatabaseField="fu2303c"
											ShowFieldLabel="False" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb404n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb404n" FieldTextBoxTabIndex="6" DatabaseField="fu2304n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb404r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb404r"
											FieldTextBoxTabIndex="6" DatabaseField="fu2304r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb404d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="6" DatabaseField="fu2304dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol19" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="6" DatabaseField="fu2304dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb404c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb404c" FieldTextBoxTabIndex="6" DatabaseField="fu2304c"
											ShowFieldLabel="False" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb405n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb405n" FieldTextBoxTabIndex="6" DatabaseField="fu2305n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb405r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb405r"
											FieldTextBoxTabIndex="6" DatabaseField="fu2305r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb405d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="6" DatabaseField="fu2305dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol20" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="6" DatabaseField="fu2305dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb405c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb405c" FieldTextBoxTabIndex="6" DatabaseField="fu2305c"
											ShowFieldLabel="False" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">24. Illness</TD>
									<TD class="heading">Age (months)</TD>
									<TD class="heading">Length<BR>
										of illness (days)</TD>
									<TD class="heading">High Fever<BR>
										or Unconscious<BR>
										(1=yes, 2= No, 9=missing)</TD>
									<TD class="heading">Treatment/<BR>
										Aftereffects</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb501i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501i"
											FieldTextBoxTabIndex="6" DatabaseField="fu2401i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ia" FieldTextBoxTabIndex="6" DatabaseField="fu2401ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501il" FieldTextBoxTabIndex="6" DatabaseField="fu2401il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ih" FieldTextBoxTabIndex="6" DatabaseField="fu2401ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501it"
											FieldTextBoxTabIndex="6" DatabaseField="fu2401it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb502i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502i"
											FieldTextBoxTabIndex="6" DatabaseField="fu2402i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ia" FieldTextBoxTabIndex="6" DatabaseField="fu2402ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502il" FieldTextBoxTabIndex="6" DatabaseField="fu2402il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ih" FieldTextBoxTabIndex="6" DatabaseField="fu2402ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502it"
											FieldTextBoxTabIndex="6" DatabaseField="fu2402it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb503i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503i"
											FieldTextBoxTabIndex="6" DatabaseField="fu2403i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ia" FieldTextBoxTabIndex="6" DatabaseField="fu2403ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503il" FieldTextBoxTabIndex="6" DatabaseField="fu2403il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ih" FieldTextBoxTabIndex="6" DatabaseField="fu2403ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503it"
											FieldTextBoxTabIndex="6" DatabaseField="fu2403it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb504i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb504i"
											FieldTextBoxTabIndex="6" DatabaseField="fu2404i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb504ia" FieldTextBoxTabIndex="6" DatabaseField="fu2404ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb504il" FieldTextBoxTabIndex="6" DatabaseField="fu2404il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb504ih" FieldTextBoxTabIndex="6" DatabaseField="fu2404ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb504it"
											FieldTextBoxTabIndex="6" DatabaseField="fu2404it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb505i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb505i"
											FieldTextBoxTabIndex="6" DatabaseField="fu2405i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb505ia" FieldTextBoxTabIndex="6" DatabaseField="fu2405ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb505il" FieldTextBoxTabIndex="6" DatabaseField="fu2405il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb505ih" FieldTextBoxTabIndex="6" DatabaseField="fu2405ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb505it"
											FieldTextBoxTabIndex="6" DatabaseField="fu2405it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Operations</TD>
									<TD class="heading">Age (months)</TD>
									<TD class="heading">Length of<BR>
										time in Hospital (days)</TD>
									<TD class="heading">Aftereffects/How was<BR>
										child prepared</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb501o" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501o"
											FieldTextBoxTabIndex="6" DatabaseField="fu2401o" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501oa" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501oa" FieldTextBoxTabIndex="6" DatabaseField="fu2401oa"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ol" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ol" FieldTextBoxTabIndex="6" DatabaseField="fu2401ol"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501oh" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb501oh" FieldTextBoxTabIndex="6" DatabaseField="fu2401oh"
											ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb502o" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502o"
											FieldTextBoxTabIndex="6" DatabaseField="fu2402o" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502oa" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502oa" FieldTextBoxTabIndex="6" DatabaseField="fu2402oa"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ol" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ol" FieldTextBoxTabIndex="6" DatabaseField="fu2402ol"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502oh" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb502oh" FieldTextBoxTabIndex="6" DatabaseField="fu2402oh"
											ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb503o" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503o"
											FieldTextBoxTabIndex="6" DatabaseField="fu2403o" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503oa" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503oa" FieldTextBoxTabIndex="6" DatabaseField="fu2403oa"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ol" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ol" FieldTextBoxTabIndex="6" DatabaseField="fu2403ol"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503oh" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb503oh" FieldTextBoxTabIndex="6" DatabaseField="fu2403oh"
											ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Other<BR>
										Hospitalizations</TD>
									<TD class="heading">Age (months)</TD>
									<TD class="heading">Time in<BR>
										Hospital (days)</TD>
									<TD class="heading">Aftereffects</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb501h" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501h"
											FieldTextBoxTabIndex="6" DatabaseField="fu2401h" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ha" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ha" FieldTextBoxTabIndex="6" DatabaseField="fu2401ha"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501hl" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501hl" FieldTextBoxTabIndex="6" DatabaseField="fu2401hl"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501hd" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb501hd" FieldTextBoxTabIndex="6" DatabaseField="fu2401hd" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb502h" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502h"
											FieldTextBoxTabIndex="6" DatabaseField="fu2402h" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ha" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ha" FieldTextBoxTabIndex="6" DatabaseField="fu2402ha"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502hl" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502hl" FieldTextBoxTabIndex="6" DatabaseField="fu2402hl"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502hd" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb502hd" FieldTextBoxTabIndex="6" DatabaseField="fu2402hd" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb503h" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503h"
											FieldTextBoxTabIndex="6" DatabaseField="fu2403h" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ha" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ha" FieldTextBoxTabIndex="6" DatabaseField="fu2403ha"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503hl" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503hl" FieldTextBoxTabIndex="6" DatabaseField="fu2403hl"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503hd" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb503hd" FieldTextBoxTabIndex="6" DatabaseField="fu2403hd" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">25. Digestive Problems<BR>
										0=No problem, 1=Mild, 2=Moderate, 3=Severe, 4=Incapacitating, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb601" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Diarrhea" FieldTextBoxTabIndex="6" DatabaseField="fu2501" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb602" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Constipation" FieldTextBoxTabIndex="6" DatabaseField="fu2502" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb603" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Poor Appetite" FieldTextBoxTabIndex="6" DatabaseField="fu2503" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb604" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Bloating" FieldTextBoxTabIndex="6" DatabaseField="fu2504" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb605" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Flatulence" FieldTextBoxTabIndex="6" DatabaseField="fu2505" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb606" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Abdominal Pain" FieldTextBoxTabIndex="6" DatabaseField="fu2506" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<B>C. DEVELOPMENTAL HISTORY UPDATE</B><BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="hxb77a" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7a. Has training started for bowel control? (1=yes, 2=no)"
											FieldTextBoxTabIndex="6" DatabaseField="fuc77a" ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb77aag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Age (months)" FieldTextBoxTabIndex="6" DatabaseField="fuc77aag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb77bag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="7b. At what age was control established?" FieldTextBoxTabIndex="6"
											DatabaseField="fuc77bag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb77c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="7c. Were there any relapses? (1=yes, 2=no)" FieldTextBoxTabIndex="6"
											DatabaseField="fuc77c" ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb77cag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="relapse age (months)" FieldTextBoxTabIndex="6" DatabaseField="fuc77cag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb77crl" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="If Yes, Describe the relapse" FieldTextBoxTabIndex="6"
											DatabaseField="fuc77crl" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="hxb88a" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8a. Has your child stopped wetting at night? (1=yes,2=no)"
											FieldTextBoxTabIndex="6" DatabaseField="fuc88a" ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb88aag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="stop wetting age (months)?" FieldTextBoxTabIndex="6" DatabaseField="fuc88aag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb88b" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="8b. during the day?" FieldTextBoxTabIndex="6" DatabaseField="fuc88b"
											ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb88bag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="during day age (months)?" FieldTextBoxTabIndex="6" DatabaseField="fuc88bag"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">9. Sleep Disturbances (1=yes, 2=no, 9=missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb901" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="9. Has your child experienced sleep disturbances?" FieldTextBoxTabIndex="6" DatabaseField="fuc901"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb901ag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="disturbances age (months)?" FieldTextBoxTabIndex="6" DatabaseField="fuc901ag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb902" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sleep-wake schedule disturbances" FieldTextBoxTabIndex="6" DatabaseField="fuc902"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb903" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Difficulty initiating sleep" FieldTextBoxTabIndex="6" DatabaseField="fuc903" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb904" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Difficulty maintaining sleep/night wakings" FieldTextBoxTabIndex="6" DatabaseField="fuc904"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb905" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Hypersomnia/ excessive sleepiness" FieldTextBoxTabIndex="6" DatabaseField="fuc905"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb906" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Insomnia/ lack of sleepiness" FieldTextBoxTabIndex="6" DatabaseField="fuc906" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb907" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Breathing-related sleep disorder" FieldTextBoxTabIndex="6" DatabaseField="fuc907"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb908" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Narcolepsy" FieldTextBoxTabIndex="6" DatabaseField="fuc908" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb909" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Parasomnia/unusual behavior while sleeping" FieldTextBoxTabIndex="6" DatabaseField="fuc909"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb910" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sleep terrors" FieldTextBoxTabIndex="6" DatabaseField="fuc910" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb911" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sleep walking" FieldTextBoxTabIndex="6" DatabaseField="fuc911" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb912" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="If yes, is this possibly due to medications your child is taking?" FieldTextBoxTabIndex="6"
											DatabaseField="fuc912" ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb912m" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Please specify medications"
											FieldTextBoxTabIndex="6" DatabaseField="fuc912m" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb913" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Is it due to another medical condition?" FieldTextBoxTabIndex="6" DatabaseField="fuc913"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb913mc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="specify"
											FieldTextBoxTabIndex="6" DatabaseField="fuc913mc" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">10. Eating Problems (1=yes, 2=no, 9=missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1001" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10. Has your child displayed any eating problems?" FieldTextBoxTabIndex="6" DatabaseField="fuc1001"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb1001a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="At what age?"
											FieldTextBoxTabIndex="6" DatabaseField="fuc1001a"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1002" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Pica/eating non-food substances" FieldTextBoxTabIndex="6" DatabaseField="fuc1002"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1003" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Rumination Disorder/ repeated regurgitation and swallowing of food" FieldTextBoxTabIndex="6"
											DatabaseField="fuc1003" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1005" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Failure to eat adequately " FieldTextBoxTabIndex="6" DatabaseField="fuc1005" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1006" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Overeating" FieldTextBoxTabIndex="6" DatabaseField="fuc1006" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1007" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Specific food preferences or avoidance" FieldTextBoxTabIndex="6" DatabaseField="fuc1007"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb1007d" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Describe here" FieldTextBoxTabIndex="6" DatabaseField="fuc1007d"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="6" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="6" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="6" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="6" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
