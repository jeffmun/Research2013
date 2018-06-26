
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="tap_fhi.tap_fhi" CodeFile="tap_fhi.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" VerifiedField="verified"
							PrimaryKeyField="fhi_pk" MeasureName="TAP FHI" LookupTextBox1LabelText="TAP ID:" LookupTextBox2Visible="False"
							LookupField1="tapid" DatabaseTable="tap_fhi" StudyMeasID="416"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" DatabaseField="tapid" FieldTextBoxTabIndex="2" FieldLabelText="TAP ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###"
										FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br/>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading" colSpan="2">A. Contact/General Family Information</TD>
								</TR>
								<TR>
									<TD>1. Date</TD>
									<TD>
										<def:datafieldcontrol id="fhadate" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="fhadate" FieldTextBoxTabIndex="3" DatabaseField="fhadate" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Person completing form</TD>
									<TD>
										<def:datafieldcontrol id="fhaln" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="Last" FieldTextBoxTabIndex="4" DatabaseField="fhaln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhafn" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="First" FieldTextBoxTabIndex="5" DatabaseField="fhafn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3. Participating child's name</TD>
									<TD>
										<def:datafieldcontrol id="fhacln" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="Last" FieldTextBoxTabIndex="5" DatabaseField="fhacln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhacfn" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="First" FieldTextBoxTabIndex="6" DatabaseField="fhacfn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4. Relationship to participating child<br/>
										(use -9 for missing)</TD>
									<TD>
										<def:datafieldcontrol id="fharlat" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fharlat" FieldTextBoxTabIndex="6" DatabaseField="fharlat" ShowFieldLabel="False" ValidList="1,2,3,4,5,6,7,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other:" FieldTextBoxTabIndex="6" DatabaseField="fharlato"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">5. Phone numbers</TD>
									<TD>
										<def:datafieldcontrol id="fhaph1" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Phone 1" FieldTextBoxTabIndex="7" DatabaseField="fhaph1"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhaph2" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Phone 2" FieldTextBoxTabIndex="7" DatabaseField="fhaph2"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhaph3" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Phone 3" FieldTextBoxTabIndex="7" DatabaseField="fhaph3"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhaph4" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Phone 4" FieldTextBoxTabIndex="7" DatabaseField="fhaph4"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhaph5" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Phone 5" FieldTextBoxTabIndex="7" DatabaseField="fhaph5"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">6. Address</TD>
									<TD>
										<def:datafieldcontrol id="fhaaddr1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 1" FieldTextBoxTabIndex="8"
											DatabaseField="fhaaddr1" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhaaddr2" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 2" FieldTextBoxTabIndex="8"
											DatabaseField="fhaaddr2" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhacity" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="City" FieldTextBoxTabIndex="8" DatabaseField="fhacity"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhastate" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="State" FieldTextBoxTabIndex="8" DatabaseField="fhastate"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhazip" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Zip" FieldTextBoxTabIndex="8" DatabaseField="fhazip" ShowFieldLabel="True"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>7. Primary Contact? ) (Y or N)</TD>
									<TD>
										<def:datafieldcontrol id="fhapc" runat="server" FieldTextBoxWidth="30px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhapc" FieldTextBoxTabIndex="9" DatabaseField="fhapc" ShowFieldLabel="False" ValidList="Y,y,N,n"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>8. If no, name of primary contact</TD>
									<TD>
										<def:datafieldcontrol id="fhapcln" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Last" FieldTextBoxTabIndex="10" DatabaseField="fhapcln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhapcfn" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="First" FieldTextBoxTabIndex="11" DatabaseField="fhapcfn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">9. Phone numbers</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 1" FieldTextBoxTabIndex="12" DatabaseField="fhapcph1"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 2" FieldTextBoxTabIndex="12" DatabaseField="fhapcph2"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 3" FieldTextBoxTabIndex="12" DatabaseField="fhapcph3"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 4" FieldTextBoxTabIndex="12" DatabaseField="fhapcph4"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Phone 5" FieldTextBoxTabIndex="12" DatabaseField="fhapcph5"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">10. Address</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 1" FieldTextBoxTabIndex="13"
											DatabaseField="fhapcadr1" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Address 2" FieldTextBoxTabIndex="13"
											DatabaseField="fhapcadr2" ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="City" FieldTextBoxTabIndex="13" DatabaseField="fhapcity"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldLabelWidth="50px" FieldTextBoxWidth="50px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="State" FieldTextBoxTabIndex="13" DatabaseField="fhapcst"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldLabelWidth="50px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Zip" FieldTextBoxTabIndex="13" DatabaseField="fhapczip"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">11. Email address(es)</TD>
									<TD>
										<def:datafieldcontrol id="fhaeml" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Email 1" FieldTextBoxTabIndex="14" DatabaseField="fhaeml1"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 2" FieldTextBoxTabIndex="14" DatabaseField="fhaeml2"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 3" FieldTextBoxTabIndex="14" DatabaseField="fhaeml3"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 4" FieldTextBoxTabIndex="14" DatabaseField="fhaeml4"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Email 5" FieldTextBoxTabIndex="14" DatabaseField="fhaeml5"
											ShowFieldLabel="True" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD colSpan="9">12. List all of the participating child's siblings.
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
											FieldTextBoxTabIndex="15" DatabaseField="fhasfn1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln1"
											FieldTextBoxTabIndex="16" DatabaseField="fhasln1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob1" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob1" FieldTextBoxTabIndex="17" DatabaseField="fhasdob1"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex1" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex1" FieldTextBoxTabIndex="18" DatabaseField="fhassex1"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn1"
											FieldTextBoxTabIndex="19" DatabaseField="fhasmfn1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln1"
											FieldTextBoxTabIndex="20" DatabaseField="fhasmln1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs1"
											FieldTextBoxTabIndex="21" DatabaseField="fhasffs1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln1"
											FieldTextBoxTabIndex="22" DatabaseField="fhasfln1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#2</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn2"
											FieldTextBoxTabIndex="23" DatabaseField="fhasfn2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln2"
											FieldTextBoxTabIndex="24" DatabaseField="fhasln2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob2" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob2" FieldTextBoxTabIndex="25" DatabaseField="fhasdob2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex2" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex2" FieldTextBoxTabIndex="26" DatabaseField="fhassex2"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn2"
											FieldTextBoxTabIndex="27" DatabaseField="fhasmfn2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln2"
											FieldTextBoxTabIndex="28" DatabaseField="fhasmln2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs2"
											FieldTextBoxTabIndex="29" DatabaseField="fhasffs2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln2"
											FieldTextBoxTabIndex="30" DatabaseField="fhasfln2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#3</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn3"
											FieldTextBoxTabIndex="31" DatabaseField="fhasfn3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln3"
											FieldTextBoxTabIndex="32" DatabaseField="fhasln3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob3" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob3" FieldTextBoxTabIndex="33" DatabaseField="fhasdob3"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex3" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex3" FieldTextBoxTabIndex="34" DatabaseField="fhassex3"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn3"
											FieldTextBoxTabIndex="35" DatabaseField="fhasmfn3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln3"
											FieldTextBoxTabIndex="36" DatabaseField="fhasmln3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs3"
											FieldTextBoxTabIndex="37" DatabaseField="fhasffs3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln3"
											FieldTextBoxTabIndex="38" DatabaseField="fhasfln3" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#4</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn4"
											FieldTextBoxTabIndex="39" DatabaseField="fhasfn4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln4"
											FieldTextBoxTabIndex="40" DatabaseField="fhasln4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob4" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob4" FieldTextBoxTabIndex="41" DatabaseField="fhasdob4"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex4" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex4" FieldTextBoxTabIndex="42" DatabaseField="fhassex4"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn4"
											FieldTextBoxTabIndex="43" DatabaseField="fhasmfn4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln4"
											FieldTextBoxTabIndex="44" DatabaseField="fhasmln4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs4"
											FieldTextBoxTabIndex="45" DatabaseField="fhasffs4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln4"
											FieldTextBoxTabIndex="46" DatabaseField="fhasfln4" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>#5</TD>
									<TD>
										<def:datafieldcontrol id="fhasfn5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfn5"
											FieldTextBoxTabIndex="47" DatabaseField="fhasfn5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasln5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasln5"
											FieldTextBoxTabIndex="48" DatabaseField="fhasln5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasdob5" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhasdob5" FieldTextBoxTabIndex="49" DatabaseField="fhasdob5"
											FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhassex5" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhassex5" FieldTextBoxTabIndex="50" DatabaseField="fhassex5"
											ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmfn5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmfn5"
											FieldTextBoxTabIndex="51" DatabaseField="fhasmfn5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasmln5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasmln5"
											FieldTextBoxTabIndex="52" DatabaseField="fhasmln5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasffs5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasffs5"
											FieldTextBoxTabIndex="53" DatabaseField="fhasffs5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhasfln5" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="fhasfln5"
											FieldTextBoxTabIndex="54" DatabaseField="fhasfln5" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD colSpan="2">(use -9 for missing)</TD>
								</TR>
								<TR>
									<TD>13. How many people live in the child's home</TD>
									<TD>
										<def:datafieldcontrol id="fha13" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha13" FieldTextBoxTabIndex="55" DatabaseField="fha13" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14. Please estimate you family's gross annual income</TD>
									<TD>
										<def:datafieldcontrol id="fha14" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha14" FieldTextBoxTabIndex="56" DatabaseField="fha14" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15. If you own a business, please estimate the business value</TD>
									<TD>
										<def:datafieldcontrol id="fha15" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha15" FieldTextBoxTabIndex="57" DatabaseField="fha15" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16. If child is spending equal amount of time in two homes...</TD>
									<TD>
										<def:datafieldcontrol id="fha16" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fha16" FieldTextBoxTabIndex="58" DatabaseField="fha16" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">B. Participating Child</TD>
								</TR>
								<TR>
									<TD>1. Birthdate</TD>
									<TD>
										<def:datafieldcontrol id="fhbdob" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhbdob" FieldTextBoxTabIndex="59" DatabaseField="fhbdob" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Ethnic background<br/>
										(use -9 for missing)<br/>
									</TD>
									<TD>
										<def:datafieldcontrol id="fhbenc" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhbenc" FieldTextBoxTabIndex="60" DatabaseField="fhbenc" ShowFieldLabel="False" ValidList="1,2,3,4,5,6,7,8,9, -9"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhbotr" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Specify other:" FieldTextBoxTabIndex="61" DatabaseField="fhbotr"
											ShowFieldLabel="True"></def:datafieldcontrol><br/>
										<def:datafieldcontrol id="fhbbi" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Specify Bi-Racial:" FieldTextBoxTabIndex="62" DatabaseField="fhbbi"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3. Sex (M or F)</TD>
									<TD>
										<def:datafieldcontrol id="fhbsex" runat="server" FieldTextBoxWidth="30px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhbsex" FieldTextBoxTabIndex="63" DatabaseField="fhbsex" ShowFieldLabel="False" ValidList="M,m,F,f"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD colSpan="2">4. Has your child had any digestive problems?<br/>
										(use -9 for missing)</TD>
								</TR>
								<TR>
									<TD>a. Diarrhea</TD>
									<TD>
										<def:datafieldcontrol id="fhb4a" runat="server" FieldTextBoxWidth="30px" RegExDescription="Must be 0-12 or -9"
											RegEx="^([0-9]|1[0-2]|-9)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhb4a"
											FieldTextBoxTabIndex="64" DatabaseField="fhb4a" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Constipation</TD>
									<TD>
										<def:datafieldcontrol id="fhb4b" runat="server" FieldTextBoxWidth="30px" RegExDescription="Must be 0-12 or -9"
											RegEx="^([0-9]|1[0-2]|-9)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhb4b"
											FieldTextBoxTabIndex="65" DatabaseField="fhb4b" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Poor Appetite</TD>
									<TD>
										<def:datafieldcontrol id="fhb4c" runat="server" FieldTextBoxWidth="30px" RegExDescription="Must be 0-12 or -9"
											RegEx="^([0-9]|1[0-2]|-9)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhb4c"
											FieldTextBoxTabIndex="66" DatabaseField="fhb4c" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Bloating</TD>
									<TD>
										<def:datafieldcontrol id="fhb4d" runat="server" FieldTextBoxWidth="30px" RegExDescription="Must be 0-12 or -9"
											RegEx="^([0-9]|1[0-2]|-9)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhb4d"
											FieldTextBoxTabIndex="67" DatabaseField="fhb4d" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Flatulence</TD>
									<TD>
										<def:datafieldcontrol id="fhb4e" runat="server" FieldTextBoxWidth="30px" RegExDescription="Must be 0-12 or -9"
											RegEx="^([0-9]|1[0-2]|-9)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhb4e"
											FieldTextBoxTabIndex="68" DatabaseField="fhb4e" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Abdominal pain</TD>
									<TD>
										<def:datafieldcontrol id="fhb4f" runat="server" FieldTextBoxWidth="30px" RegExDescription="Must be 0-12 or -9"
											RegEx="^([0-9]|1[0-2]|-9)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhb4f"
											FieldTextBoxTabIndex="69" DatabaseField="fhb4f" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD colSpan="4">5. Motor Skills (use -9 for missing)</TD>
								</TR>
								<TR>
									<TD>Skill</TD>
									<TD>Achieved<br/>
										(1=YES,0=NO,<br/>
										-9=missing)</TD>
									<TD>Age Achieved<br/>
										(mos.) (use -9 for missing)</TD>
									<TD>Confidence<br/>
										in Recall<br/>
										(1=slight,2=moderate,3=strong, -9=missing)</TD>
								</TR>
								<TR>
									<TD>a. Sat without support</TD>
									<TD>
										<def:datafieldcontrol id="fhb5aa" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5aa" FieldTextBoxTabIndex="70" DatabaseField="fhb5aa" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5aage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5aage" FieldTextBoxTabIndex="71" DatabaseField="fhb5aage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5acf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5acf" FieldTextBoxTabIndex="72" DatabaseField="fhb5acf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Rolled from back to stomach</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ba" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ba" FieldTextBoxTabIndex="73" DatabaseField="fhb5ba" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5bage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5bage" FieldTextBoxTabIndex="74" DatabaseField="fhb5bage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5bcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5bcf" FieldTextBoxTabIndex="75" DatabaseField="fhb5bcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Rolled from stomach to back</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ca" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ca" FieldTextBoxTabIndex="76" DatabaseField="fhb5ca" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5cage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5cage" FieldTextBoxTabIndex="77" DatabaseField="fhb5cage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5ccf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ccf" FieldTextBoxTabIndex="78" DatabaseField="fhb5ccf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Crawled</TD>
									<TD>
										<def:datafieldcontrol id="fhb5da" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5da" FieldTextBoxTabIndex="79" DatabaseField="fhb5da" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5dage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5dage" FieldTextBoxTabIndex="80" DatabaseField="fhb5dage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5dcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5dcf" FieldTextBoxTabIndex="81" DatabaseField="fhb5dcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Stood alone</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ea" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ea" FieldTextBoxTabIndex="82" DatabaseField="fhb5ea" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5eage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5eage" FieldTextBoxTabIndex="83" DatabaseField="fhb5eage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5ecf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ecf" FieldTextBoxTabIndex="84" DatabaseField="fhb5ecf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Walked</TD>
									<TD>
										<def:datafieldcontrol id="fhb5fa" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5fa" FieldTextBoxTabIndex="85" DatabaseField="fhb5fa" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5fage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5fage" FieldTextBoxTabIndex="86" DatabaseField="fhb5fage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5fcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5fcf" FieldTextBoxTabIndex="87" DatabaseField="fhb5fcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Walked up and down stairs</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ga" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ga" FieldTextBoxTabIndex="88" DatabaseField="fhb5ga" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5gage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5gage" FieldTextBoxTabIndex="89" DatabaseField="fhb5gage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5gcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5gcf" FieldTextBoxTabIndex="90" DatabaseField="fhb5gcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">Self Help</TD>
								</TR>
								<TR>
									<TD>h. Daytime bladder control</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ha" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ha" FieldTextBoxTabIndex="91" DatabaseField="fhb5ha" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5hage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5hage" FieldTextBoxTabIndex="92" DatabaseField="fhb5hage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5hcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5hcf" FieldTextBoxTabIndex="93" DatabaseField="fhb5hcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. If yes, any relapses?</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ia" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ia" FieldTextBoxTabIndex="94" DatabaseField="fhb5ia" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5iage" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age at relapse:" FieldTextBoxTabIndex="95"
											DatabaseField="fhb5iage"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5iex" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Explain:" FieldTextBoxTabIndex="96"
											DatabaseField="fhb5iex" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Nighttime bladder control</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ja" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ja" FieldTextBoxTabIndex="97" DatabaseField="fhb5ja" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5jage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5jage" FieldTextBoxTabIndex="98" DatabaseField="fhb5jage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5jcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5jcf" FieldTextBoxTabIndex="99" DatabaseField="fhb5jcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. If yes, any relapses?</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ka" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ka" FieldTextBoxTabIndex="100" DatabaseField="fhb5ka" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5kage" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age at relapse:" FieldTextBoxTabIndex="101"
											DatabaseField="fhb5kage"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5kex" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Explain:" FieldTextBoxTabIndex="102"
											DatabaseField="fhb5kex" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Bowel control</TD>
									<TD>
										<def:datafieldcontrol id="fhb5la" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5la" FieldTextBoxTabIndex="103" DatabaseField="fhb5la" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5lage" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5lage" FieldTextBoxTabIndex="104" DatabaseField="fhb5lage" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5lcf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5lcf" FieldTextBoxTabIndex="105" DatabaseField="fhb5lcf" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. If yes, any relapses?</TD>
									<TD>
										<def:datafieldcontrol id="fhb5ma" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhb5ma" FieldTextBoxTabIndex="106" DatabaseField="fhb5ma" ShowFieldLabel="False" ValidList="0,1,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5mage" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age at relapse:" FieldTextBoxTabIndex="107"
											DatabaseField="fhb5mage"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhb5mex" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Explain:" FieldTextBoxTabIndex="108"
											DatabaseField="fhb5mex" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">C. Biological Father Information</TD>
								</TR>
								<TR>
									<TD>1. Name</TD>
									<TD>
										<def:datafieldcontrol id="fhc1ln" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="Last" FieldTextBoxTabIndex="109" DatabaseField="fhc1ln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhc1fn" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="First" FieldTextBoxTabIndex="110" DatabaseField="fhc1fn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Birthdate</TD>
									<TD>
										<def:datafieldcontrol id="fhc2dob" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc2dob" FieldTextBoxTabIndex="111" DatabaseField="fhc2dob" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3. Ethnic background<br/>
										(use -9 for missing)</TD>
									<TD>
										<def:datafieldcontrol id="fhc3eth" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc3eth" FieldTextBoxTabIndex="112" DatabaseField="fhc3eth" ShowFieldLabel="False"
											ValidList="1,2,3,4,5,6,7,8,9,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhc3bi" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Specify Bi-Racial:" FieldTextBoxTabIndex="113"
											DatabaseField="fhc3bi"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhc3otr" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Specify other:" FieldTextBoxTabIndex="114"
											DatabaseField="fhc3otr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4. Primary language<br/>
										(use -9 for missing)</TD>
									<TD>
										<def:datafieldcontrol id="fhc4lang" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc4lang" FieldTextBoxTabIndex="115" DatabaseField="fhc4lang" ShowFieldLabel="False"
											ValidList="1,2,3,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhc4oth" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Specify other:" FieldTextBoxTabIndex="116" DatabaseField="fhc4oth"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>5. Highest education level<br/>
										(use -9 for missing)</TD>
									<TD>
										<def:datafieldcontrol id="fhc5ed" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc5ed" FieldTextBoxTabIndex="117" DatabaseField="fhc5ed" ShowFieldLabel="False" ValidList="1,2,3,4,5,6,7,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>6. Occupation</TD>
									<TD>
										<def:datafieldcontrol id="fhc6oc" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
											FieldLabelText="fhc6oc" FieldTextBoxTabIndex="118" DatabaseField="fhc6oc" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD colSpan="5">7. Medical History</TD>
								</TR>
								<TR>
									<TD>(1=checked, 0=unchecked)</TD>
									<TD>Father</TD>
									<TD>Father's<br/>
										Mother</TD>
									<TD>Father's<br/>
										Father</TD>
									<TD>Father's Other Family</TD>
								</TR>
								<TR>
									<TD colSpan="5">Social/Developmental</TD>
								</TR>
								<TR>
									<TD>a. Social Awkwardness/Impairment</TD>
									<TD>
										<def:datafieldcontrol id="fhc7af" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7af" FieldTextBoxTabIndex="119" DatabaseField="fhc7af" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7afm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7afm" FieldTextBoxTabIndex="120" DatabaseField="fhc7afm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7aff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7aff" FieldTextBoxTabIndex="121" DatabaseField="fhc7aff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7afotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7afotr" FieldTextBoxTabIndex="122" DatabaseField="fhc7afotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Motor coordination</TD>
									<TD>
										<def:datafieldcontrol id="fhc7bf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7bf" FieldTextBoxTabIndex="123" DatabaseField="fhc7bf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0" DESIGNTIMEDRAGDROP="5023"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7bfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7bfm" FieldTextBoxTabIndex="124" DatabaseField="fhc7bfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7bff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7bff" FieldTextBoxTabIndex="125" DatabaseField="fhc7bff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7bfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7bfotr" FieldTextBoxTabIndex="126" DatabaseField="fhc7bfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Tics or Other Motor problems</TD>
									<TD>
										<def:datafieldcontrol id="fhc7cf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7cf" FieldTextBoxTabIndex="127" DatabaseField="fhc7cf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7cfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7cfm" FieldTextBoxTabIndex="128" DatabaseField="fhc7cfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7cff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7cff" FieldTextBoxTabIndex="129" DatabaseField="fhc7cff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7cfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7cfotr" FieldTextBoxTabIndex="130" DatabaseField="fhc7cfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Learning Problems</TD>
									<TD>
										<def:datafieldcontrol id="fhc7df" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7df" FieldTextBoxTabIndex="131" DatabaseField="fhc7df" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7dfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7dfm" FieldTextBoxTabIndex="132" DatabaseField="fhc7dfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7dff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7dff" FieldTextBoxTabIndex="133" DatabaseField="fhc7dff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7dfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7dfotr" FieldTextBoxTabIndex="134" DatabaseField="fhc7dfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Special Education</TD>
									<TD>
										<def:datafieldcontrol id="fhc7ef" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7ef" FieldTextBoxTabIndex="135" DatabaseField="fhc7ef" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7efm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7efm" FieldTextBoxTabIndex="136" DatabaseField="fhc7efm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7eff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7eff" FieldTextBoxTabIndex="137" DatabaseField="fhc7eff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7efotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7efotr" FieldTextBoxTabIndex="138" DatabaseField="fhc7efotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="5">Medical/Health</TD>
								</TR>
								<TR>
									<TD>f. Cancer</TD>
									<TD>
										<def:datafieldcontrol id="fhc7ff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7ff" FieldTextBoxTabIndex="139" DatabaseField="fhc7ff" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ffm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7ffm" FieldTextBoxTabIndex="140" DatabaseField="fhc7ffm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7fff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7fff" FieldTextBoxTabIndex="141" DatabaseField="fhc7fff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ffotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7ffotr" FieldTextBoxTabIndex="142" DatabaseField="fhc7ffotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Vision problems</TD>
									<TD>
										<def:datafieldcontrol id="fhc7gf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7gf" FieldTextBoxTabIndex="143" DatabaseField="fhc7gf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7gfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7gfm" FieldTextBoxTabIndex="144" DatabaseField="fhc7gfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7gff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7gff" FieldTextBoxTabIndex="145" DatabaseField="fhc7gff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7gfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7gfotr" FieldTextBoxTabIndex="146" DatabaseField="fhc7gfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Hearing problems</TD>
									<TD>
										<def:datafieldcontrol id="fhc7hf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7hf" FieldTextBoxTabIndex="147" DatabaseField="fhc7hf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7hfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7hfm" FieldTextBoxTabIndex="148" DatabaseField="fhc7hfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7hff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7hff" FieldTextBoxTabIndex="149" DatabaseField="fhc7hff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7hfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7hfotr" FieldTextBoxTabIndex="150" DatabaseField="fhc7hfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Attention problems</TD>
									<TD>
										<def:datafieldcontrol id="fhc7if" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7if" FieldTextBoxTabIndex="151" DatabaseField="fhc7if" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ifm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7ifm" FieldTextBoxTabIndex="152" DatabaseField="fhc7ifm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7iff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7iff" FieldTextBoxTabIndex="153" DatabaseField="fhc7iff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ifotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7ifotr" FieldTextBoxTabIndex="154" DatabaseField="fhc7ifotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Hyperactivity</TD>
									<TD>
										<def:datafieldcontrol id="fhc7jf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7jf" FieldTextBoxTabIndex="155" DatabaseField="fhc7jf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7jfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7jfm" FieldTextBoxTabIndex="156" DatabaseField="fhc7jfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7jff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7jff" FieldTextBoxTabIndex="157" DatabaseField="fhc7jff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7jfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7jfotr" FieldTextBoxTabIndex="158" DatabaseField="fhc7jfotr"
											ShowFieldLabel="False" DESIGNTIMEDRAGDROP="7390"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Neurological Diseases</TD>
									<TD>
										<def:datafieldcontrol id="fhc7kf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7kf" FieldTextBoxTabIndex="159" DatabaseField="fhc7kf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7kfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7kfm" FieldTextBoxTabIndex="160" DatabaseField="fhc7kfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7kff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7kff" FieldTextBoxTabIndex="161" DatabaseField="fhc7kff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7kfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7kfotr" FieldTextBoxTabIndex="162" DatabaseField="fhc7kfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Epilepsy/Seizures</TD>
									<TD>
										<def:datafieldcontrol id="fhc7lf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7lf" FieldTextBoxTabIndex="163" DatabaseField="fhc7lf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7lfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7lfm" FieldTextBoxTabIndex="164" DatabaseField="fhc7lfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7lff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7lff" FieldTextBoxTabIndex="165" DatabaseField="fhc7lff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7lfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7lfotr" FieldTextBoxTabIndex="166" DatabaseField="fhc7lfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Turberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="fhc7mf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7mf" FieldTextBoxTabIndex="167" DatabaseField="fhc7mf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7mfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7mfm" FieldTextBoxTabIndex="168" DatabaseField="fhc7mfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7mff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7mff" FieldTextBoxTabIndex="169" DatabaseField="fhc7mff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7mfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7mfotr" FieldTextBoxTabIndex="170" DatabaseField="fhc7mfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="fhc7nf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7nf" FieldTextBoxTabIndex="171" DatabaseField="fhc7nf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7nfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7nfm" FieldTextBoxTabIndex="172" DatabaseField="fhc7nfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7nff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7nff" FieldTextBoxTabIndex="173" DatabaseField="fhc7nff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7nfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7nfotr" FieldTextBoxTabIndex="174" DatabaseField="fhc7nfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Birth Defects</TD>
									<TD>
										<def:datafieldcontrol id="fhc7of" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7of" FieldTextBoxTabIndex="175" DatabaseField="fhc7of" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ofm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7ofm" FieldTextBoxTabIndex="176" DatabaseField="fhc7ofm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7off" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7off" FieldTextBoxTabIndex="177" DatabaseField="fhc7off" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ofotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7ofotr" FieldTextBoxTabIndex="178" DatabaseField="fhc7ofotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Major physical anomaly</TD>
									<TD>
										<def:datafieldcontrol id="fhc7pf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7pf" FieldTextBoxTabIndex="179" DatabaseField="fhc7pf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7pfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7pfm" FieldTextBoxTabIndex="180" DatabaseField="fhc7pfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7pff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7pff" FieldTextBoxTabIndex="181" DatabaseField="fhc7pff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7pfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7pfotr" FieldTextBoxTabIndex="182" DatabaseField="fhc7pfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Minor physical anomaly</TD>
									<TD>
										<def:datafieldcontrol id="fhc7qf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7qf" FieldTextBoxTabIndex="183" DatabaseField="fhc7qf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7qfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7qfm" FieldTextBoxTabIndex="184" DatabaseField="fhc7qfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7qff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7qff" FieldTextBoxTabIndex="185" DatabaseField="fhc7qff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7qfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7qfotr" FieldTextBoxTabIndex="186" DatabaseField="fhc7qfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="5">Psychological/Psychiatric</TD>
								</TR>
								<TR>
									<TD>r. Tourette's Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="fhc7rf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7rf" FieldTextBoxTabIndex="187" DatabaseField="fhc7rf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7rfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7rfm" FieldTextBoxTabIndex="188" DatabaseField="fhc7rfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7rff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7rff" FieldTextBoxTabIndex="189" DatabaseField="fhc7rff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7rfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7rfotr" FieldTextBoxTabIndex="190" DatabaseField="fhc7rfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>s. Obsessive Compulsive Disorder</TD>
									<TD>
										<def:datafieldcontrol id="fhc7sf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7sf" FieldTextBoxTabIndex="191" DatabaseField="fhc7sf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7sfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7sfm" FieldTextBoxTabIndex="192" DatabaseField="fhc7sfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7sff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7sff" FieldTextBoxTabIndex="193" DatabaseField="fhc7sff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7sfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7sfotr" FieldTextBoxTabIndex="194" DatabaseField="fhc7sfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>t. Drug Abuse</TD>
									<TD>
										<def:datafieldcontrol id="fhc7tf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7tf" FieldTextBoxTabIndex="195" DatabaseField="fhc7tf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7tfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7tfm" FieldTextBoxTabIndex="196" DatabaseField="fhc7tfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7tff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7tff" FieldTextBoxTabIndex="197" DatabaseField="fhc7tff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7tfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7tfotr" FieldTextBoxTabIndex="198" DatabaseField="fhc7tfotr"
											ShowFieldLabel="False" DESIGNTIMEDRAGDROP="9678"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>u. Alcoholism</TD>
									<TD>
										<def:datafieldcontrol id="fhc7uf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7uf" FieldTextBoxTabIndex="199" DatabaseField="fhc7uf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ufm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7ufm" FieldTextBoxTabIndex="200" DatabaseField="fhc7ufm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7uff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7uff" FieldTextBoxTabIndex="201" DatabaseField="fhc7uff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7ufotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7ufotr" FieldTextBoxTabIndex="202" DatabaseField="fhc7ufotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>v. Delinquency</TD>
									<TD>
										<def:datafieldcontrol id="fhc7vf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7vf" FieldTextBoxTabIndex="203" DatabaseField="fhc7vf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7vfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7vfm" FieldTextBoxTabIndex="204" DatabaseField="fhc7vfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7vff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7vff" FieldTextBoxTabIndex="205" DatabaseField="fhc7vff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7vfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7vfotr" FieldTextBoxTabIndex="206" DatabaseField="fhc7vfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>w. A history of being admitted</TD>
									<TD>
										<def:datafieldcontrol id="fhc7wf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7wf" FieldTextBoxTabIndex="207" DatabaseField="fhc7wf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7wfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7wfm" FieldTextBoxTabIndex="208" DatabaseField="fhc7wfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7wff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7wff" FieldTextBoxTabIndex="209" DatabaseField="fhc7wff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7wfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7wfotr" FieldTextBoxTabIndex="210" DatabaseField="fhc7wfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>x. Other mental illness</TD>
									<TD>
										<def:datafieldcontrol id="fhc7xf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7xf" FieldTextBoxTabIndex="211" DatabaseField="fhc7xf" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7xfm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7xfm" FieldTextBoxTabIndex="212" DatabaseField="fhc7xfm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7xff" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhc7xff" FieldTextBoxTabIndex="213" DatabaseField="fhc7xff" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhc7xfotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhc7xfotr" FieldTextBoxTabIndex="214" DatabaseField="fhc7xfotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">D. Biological Mother Information</TD>
								</TR>
								<TR>
									<TD>1. Name</TD>
									<TD>
										<def:datafieldcontrol id="fhd1ln" runat="server" FieldLabelWidth="60px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Last" FieldTextBoxTabIndex="215" DatabaseField="fhd1ln"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhd1fn" runat="server" FieldLabelWidth="60px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="First" FieldTextBoxTabIndex="216" DatabaseField="fhd1fn"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Birthdate</TD>
									<TD>
										<def:datafieldcontrol id="fhd2dob" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd2dob" FieldTextBoxTabIndex="217" DatabaseField="fhd2dob" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="31">3. Ethnic Background<br/>
										(use -9 for missing)</TD>
									<TD height="31">
										<def:datafieldcontrol id="fhd3eth" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd3eth" FieldTextBoxTabIndex="218" DatabaseField="fhd3eth" ShowFieldLabel="False"
											ValidList="1,2,3,4,5,6,7,8,9,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhd3bi" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Specify Bi-Racial:" FieldTextBoxTabIndex="219" DatabaseField="fhd3bi"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhd3otr" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Specify other:" FieldTextBoxTabIndex="220" DatabaseField="fhd3otr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="30">4. Primary language<br/>
										(use -9 for missing)</TD>
									<TD height="30">
										<def:datafieldcontrol id="fhd4lang" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd4lang" FieldTextBoxTabIndex="221" DatabaseField="fhd4lang" ShowFieldLabel="False"
											ValidList="1,2,3,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="fhd4oth" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other:" FieldTextBoxTabIndex="222" DatabaseField="fhd4oth"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>5. Highest education<br/>
										(use -9 for missing)</TD>
									<TD>
										<def:datafieldcontrol id="fhd5ed" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd5ed" FieldTextBoxTabIndex="223" DatabaseField="fhd5ed" ShowFieldLabel="False" ValidList="1,2,3,4,5,6,7,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>6. Occupation</TD>
									<TD>
										<def:datafieldcontrol id="fhd6oc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="fhd6oc"
											FieldTextBoxTabIndex="224" DatabaseField="fhd6oc" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD colSpan="5">7. Medical History</TD>
								</TR>
								<TR>
									<TD>(1=checked, 0=unchecked)</TD>
									<TD>Mother</TD>
									<TD>Mother's<br/>
										Mother</TD>
									<TD>Mother's<br/>
										Father</TD>
									<TD>Mother's Other Family</TD>
								</TR>
								<TR>
									<TD colSpan="5">Social/Developmental</TD>
								</TR>
								<TR>
									<TD>a. Social Awkwardness/Impairment</TD>
									<TD>
										<def:datafieldcontrol id="fhd7am" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7am" FieldTextBoxTabIndex="225" DatabaseField="fhd7am" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7amm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7amm" FieldTextBoxTabIndex="226" DatabaseField="fhd7amm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7amf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7amf" FieldTextBoxTabIndex="227" DatabaseField="fhd7amf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7amotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7amotr" FieldTextBoxTabIndex="228" DatabaseField="fhd7amotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Motor coordination</TD>
									<TD>
										<def:datafieldcontrol id="fhd7bm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7bm" FieldTextBoxTabIndex="229" DatabaseField="fhd7bm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7bmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7bmm" FieldTextBoxTabIndex="230" DatabaseField="fhd7bmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7bmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7bmf" FieldTextBoxTabIndex="231" DatabaseField="fhd7bmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7bmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7bmotr" FieldTextBoxTabIndex="232" DatabaseField="fhd7bmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Tics or Other Motor problems</TD>
									<TD>
										<def:datafieldcontrol id="fhd7cm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7cm" FieldTextBoxTabIndex="233" DatabaseField="fhd7cm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7cmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7cmm" FieldTextBoxTabIndex="234" DatabaseField="fhd7cmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7cmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7cmf" FieldTextBoxTabIndex="235" DatabaseField="fhd7cmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7cmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7cmotr" FieldTextBoxTabIndex="236" DatabaseField="fhd7cmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Learning Problems</TD>
									<TD>
										<def:datafieldcontrol id="fhd7dm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7dm" FieldTextBoxTabIndex="237" DatabaseField="fhd7dm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7dmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7dmm" FieldTextBoxTabIndex="238" DatabaseField="fhd7dmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7dmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7dmf" FieldTextBoxTabIndex="239" DatabaseField="fhd7dmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7dmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7dmotr" FieldTextBoxTabIndex="240" DatabaseField="fhd7dmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Special Education</TD>
									<TD>
										<def:datafieldcontrol id="fhd7em" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7em" FieldTextBoxTabIndex="241" DatabaseField="fhd7em" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7emm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7emm" FieldTextBoxTabIndex="242" DatabaseField="fhd7emm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7emf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7emf" FieldTextBoxTabIndex="243" DatabaseField="fhd7emf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7emotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7emotr" FieldTextBoxTabIndex="244" DatabaseField="fhd7emotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="5">Medical/Health</TD>
								</TR>
								<TR>
									<TD>f. Cancer</TD>
									<TD>
										<def:datafieldcontrol id="fhd7fm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7fm" FieldTextBoxTabIndex="245" DatabaseField="fhd7fm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7fmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7fmm" FieldTextBoxTabIndex="246" DatabaseField="fhd7fmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7fmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7fmf" FieldTextBoxTabIndex="247" DatabaseField="fhd7fmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7fmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7fmotr" FieldTextBoxTabIndex="248" DatabaseField="fhd7fmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Vision problems</TD>
									<TD>
										<def:datafieldcontrol id="fhd7gm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7gm" FieldTextBoxTabIndex="249" DatabaseField="fhd7gm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7gmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7gmm" FieldTextBoxTabIndex="250" DatabaseField="fhd7gmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7gmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7gmf" FieldTextBoxTabIndex="251" DatabaseField="fhd7gmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7gmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7gmotr" FieldTextBoxTabIndex="252" DatabaseField="fhd7gmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Hearing problems</TD>
									<TD>
										<def:datafieldcontrol id="fhd7hm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7hm" FieldTextBoxTabIndex="253" DatabaseField="fhd7hm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7hmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7hmm" FieldTextBoxTabIndex="254" DatabaseField="fhd7hmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7hmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7hmf" FieldTextBoxTabIndex="255" DatabaseField="fhd7hmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7hmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7hmotr" FieldTextBoxTabIndex="256" DatabaseField="fhd7hmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Attention problems</TD>
									<TD>
										<def:datafieldcontrol id="fhd7im" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7im" FieldTextBoxTabIndex="257" DatabaseField="fhd7im" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7imm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7imm" FieldTextBoxTabIndex="258" DatabaseField="fhd7imm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7imf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7imf" FieldTextBoxTabIndex="259" DatabaseField="fhd7imf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7imotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7imotr" FieldTextBoxTabIndex="260" DatabaseField="fhd7imotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Hyperactivity</TD>
									<TD>
										<def:datafieldcontrol id="fhd7jm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7jm" FieldTextBoxTabIndex="261" DatabaseField="fhd7jm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7jmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7jmm" FieldTextBoxTabIndex="262" DatabaseField="fhd7jmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7jmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7jmf" FieldTextBoxTabIndex="263" DatabaseField="fhd7jmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7jmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7jmotr" FieldTextBoxTabIndex="264" DatabaseField="fhd7jmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Neurological Diseases</TD>
									<TD>
										<def:datafieldcontrol id="fhd7km" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7km" FieldTextBoxTabIndex="265" DatabaseField="fhd7km" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7kmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7kmm" FieldTextBoxTabIndex="266" DatabaseField="fhd7kmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7kmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7kmf" FieldTextBoxTabIndex="267" DatabaseField="fhd7kmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7kmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7kmotr" FieldTextBoxTabIndex="268" DatabaseField="fhd7kmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Epilepsy/Seizures</TD>
									<TD>
										<def:datafieldcontrol id="fhd7lm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7lm" FieldTextBoxTabIndex="269" DatabaseField="fhd7lm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7lmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7lmm" FieldTextBoxTabIndex="270" DatabaseField="fhd7lmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7lmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7lmf" FieldTextBoxTabIndex="271" DatabaseField="fhd7lmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7lmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7lmotr" FieldTextBoxTabIndex="272" DatabaseField="fhd7lmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Turberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="fhd7mm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7mm" FieldTextBoxTabIndex="273" DatabaseField="fhd7mm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7mmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7mmm" FieldTextBoxTabIndex="274" DatabaseField="fhd7mmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7mmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7mmf" FieldTextBoxTabIndex="275" DatabaseField="fhd7mmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7mmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7mmotr" FieldTextBoxTabIndex="276" DatabaseField="fhd7mmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="fhd7nm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7nm" FieldTextBoxTabIndex="277" DatabaseField="fhd7nm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7nmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7nmm" FieldTextBoxTabIndex="278" DatabaseField="fhd7nmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7nmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7nmf" FieldTextBoxTabIndex="279" DatabaseField="fhd7nmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7nmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7nmotr" FieldTextBoxTabIndex="280" DatabaseField="fhd7nmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Birth Defects</TD>
									<TD>
										<def:datafieldcontrol id="fhd7om" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7om" FieldTextBoxTabIndex="281" DatabaseField="fhd7om" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7omm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7omm" FieldTextBoxTabIndex="282" DatabaseField="fhd7omm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7omf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7omf" FieldTextBoxTabIndex="283" DatabaseField="fhd7omf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7omotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7omotr" FieldTextBoxTabIndex="284" DatabaseField="fhd7omotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Major physical anomaly</TD>
									<TD>
										<def:datafieldcontrol id="fhd7pm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7pm" FieldTextBoxTabIndex="285" DatabaseField="fhd7pm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7pmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7pmm" FieldTextBoxTabIndex="286" DatabaseField="fhd7pmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7pmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7pmf" FieldTextBoxTabIndex="287" DatabaseField="fhd7pmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7pmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7pmotr" FieldTextBoxTabIndex="288" DatabaseField="fhd7pmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>q. Minor physical anomaly</TD>
									<TD>
										<def:datafieldcontrol id="fhd7qm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7qm" FieldTextBoxTabIndex="289" DatabaseField="fhd7qm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7qmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7qmm" FieldTextBoxTabIndex="290" DatabaseField="fhd7qmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7qmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7qmf" FieldTextBoxTabIndex="291" DatabaseField="fhd7qmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7qmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7qmotr" FieldTextBoxTabIndex="292" DatabaseField="fhd7qmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="5">Psychological/Psychiatric</TD>
								</TR>
								<TR>
									<TD>r. Tourette's Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="fhd7rm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7rm" FieldTextBoxTabIndex="293" DatabaseField="fhd7rm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7rmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7rmm" FieldTextBoxTabIndex="294" DatabaseField="fhd7rmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7rmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7rmf" FieldTextBoxTabIndex="295" DatabaseField="fhd7rmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7rmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7rmotr" FieldTextBoxTabIndex="296" DatabaseField="fhd7rmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>s. Obsessive Compulsive Disorder</TD>
									<TD>
										<def:datafieldcontrol id="fhd7sm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7sm" FieldTextBoxTabIndex="297" DatabaseField="fhd7sm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7smm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7smm" FieldTextBoxTabIndex="298" DatabaseField="fhd7smm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7smf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7smf" FieldTextBoxTabIndex="299" DatabaseField="fhd7smf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7smotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7smotr" FieldTextBoxTabIndex="300" DatabaseField="fhd7smotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>t. Drug Abuse</TD>
									<TD>
										<def:datafieldcontrol id="fhd7tm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7tm" FieldTextBoxTabIndex="301" DatabaseField="fhd7tm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7tmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7tmm" FieldTextBoxTabIndex="302" DatabaseField="fhd7tmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7tmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7tmf" FieldTextBoxTabIndex="303" DatabaseField="fhd7tmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7tmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7tmotr" FieldTextBoxTabIndex="304" DatabaseField="fhd7tmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>u. Alcoholism</TD>
									<TD>
										<def:datafieldcontrol id="fhd7um" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7um" FieldTextBoxTabIndex="305" DatabaseField="fhd7um" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7umm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7umm" FieldTextBoxTabIndex="306" DatabaseField="fhd7umm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7umf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7umf" FieldTextBoxTabIndex="307" DatabaseField="fhd7umf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7umotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7umotr" FieldTextBoxTabIndex="308" DatabaseField="fhd7umotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>v. Delinquency</TD>
									<TD>
										<def:datafieldcontrol id="fhd7vm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7vm" FieldTextBoxTabIndex="309" DatabaseField="fhd7vm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7vmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7vmm" FieldTextBoxTabIndex="310" DatabaseField="fhd7vmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7vmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7vmf" FieldTextBoxTabIndex="311" DatabaseField="fhd7vmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7vmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7vmotr" FieldTextBoxTabIndex="312" DatabaseField="fhd7vmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>w. A history of being admitted</TD>
									<TD>
										<def:datafieldcontrol id="fhd7wm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7wm" FieldTextBoxTabIndex="313" DatabaseField="fhd7wm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7wmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7wmm" FieldTextBoxTabIndex="314" DatabaseField="fhd7wmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7wmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7wmf" FieldTextBoxTabIndex="315" DatabaseField="fhd7wmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7wmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7wmotr" FieldTextBoxTabIndex="316" DatabaseField="fhd7wmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>x. Other mental illness</TD>
									<TD>
										<def:datafieldcontrol id="fhd7xm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7xm" FieldTextBoxTabIndex="317" DatabaseField="fhd7xm" ShowFieldLabel="False" ValidList="0,1"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7xmm" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7xmm" FieldTextBoxTabIndex="318" DatabaseField="fhd7xmm" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7xmf" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="fhd7xmf" FieldTextBoxTabIndex="319" DatabaseField="fhd7xmf" ShowFieldLabel="False"
											ValidList="0,1" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="fhd7xmotr" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="fhd7xmotr" FieldTextBoxTabIndex="320" DatabaseField="fhd7xmotr"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="322" DatabaseField="created"
											FieldErrorLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdby" FieldTextBoxTabIndex="323" DatabaseField="createdby"
											FieldErrorLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="324" DatabaseField="updated"
											FieldErrorLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedby" FieldTextBoxTabIndex="325" DatabaseField="updatedby"
											FieldErrorLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
