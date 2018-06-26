<%@ Page language="c#" Inherits="edst3_qps_lifeevents.edst3_qps_lifeevents" CodeFile="edst3_qps_lifeevents.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_qps_lifeevents" LookupField1="edsid"
							LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" MeasureName="EDST3 Spouse Life Events"
							PrimaryKeyField="le_pk" VerifiedField="verified" StudyMeasID="321"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDSID"
										FieldTextBoxTabIndex="1" DatabaseField="EDSID" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="grid" id="table_entry">
											<TR>
												<TD class="heading">Occur:
													<BR>
													0=NA<BR>
													1=Good<BR>
													2=Bad<BR>
													9=Missing<BR>
												</TD>
												<TD class="heading">Effect:<BR>
													0=None<BR>
													1=Some<BR>
													2=Moderate<BR>
													3=Great<BR>
													9=Missing/NA<BR>
												</TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">I. Personal Events</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC01" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC01" FieldTextBoxTabIndex="3"
														FieldLabelText="1.  Major change in sleeping habits (much more or m" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF01" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF01" FieldTextBoxTabIndex="65"
														FieldLabelText="LE1EF01" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC02" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC02" FieldTextBoxTabIndex="4"
														FieldLabelText="2.  Major change in eating habits (much more or muc" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF02" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF02" FieldTextBoxTabIndex="66"
														FieldLabelText="LE1EF02" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC03" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC03" FieldTextBoxTabIndex="5"
														FieldLabelText="3.  Pregnancy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF03" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF03" FieldTextBoxTabIndex="67"
														FieldLabelText="LE1EF03" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC04" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC04" FieldTextBoxTabIndex="6"
														FieldLabelText="4.  Abortion" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF04" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF04" FieldTextBoxTabIndex="68"
														FieldLabelText="LE1EF04" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC05" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC05" FieldTextBoxTabIndex="7"
														FieldLabelText="5.  Major personal illness or injury" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF05" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF05" FieldTextBoxTabIndex="69"
														FieldLabelText="LE1EF05" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC06" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC06" FieldTextBoxTabIndex="8"
														FieldLabelText="6.  Outstanding personal achievement" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF06" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF06" FieldTextBoxTabIndex="70"
														FieldLabelText="LE1EF06" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">II. Changes in makeup of your household</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC07" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC07" FieldTextBoxTabIndex="9"
														FieldLabelText="7.  Change in residence" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF07" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF07" FieldTextBoxTabIndex="71"
														FieldLabelText="LE1EF07" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC08" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC08" FieldTextBoxTabIndex="10"
														FieldLabelText="8.  Major change in living conditions (new home, re" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF08" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF08" FieldTextBoxTabIndex="72"
														FieldLabelText="LE1EF08" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC09" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC09" FieldTextBoxTabIndex="11"
														FieldLabelText="9.  Detained in jail or other institution" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF09" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF09" FieldTextBoxTabIndex="73"
														FieldLabelText="LE1EF09" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC10" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC10" FieldTextBoxTabIndex="12"
														FieldLabelText="10.  Partner in jail or other institution" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF10" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF10" FieldTextBoxTabIndex="74"
														FieldLabelText="LE1EF10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">III. Financial changes</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC11" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC11" FieldTextBoxTabIndex="13"
														FieldLabelText="11.  Major change in financial status (a lot better" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF11" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF11" FieldTextBoxTabIndex="75"
														FieldLabelText="LE1EF11" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC12" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC12" FieldTextBoxTabIndex="14"
														FieldLabelText="12.  Foreclosure on mortgage or loan" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF12" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF12" FieldTextBoxTabIndex="76"
														FieldLabelText="LE1EF12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC13" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC13" FieldTextBoxTabIndex="15"
														FieldLabelText="13.  Borrowing more than $10,000 (buying a home, bu" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF13" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF13" FieldTextBoxTabIndex="77"
														FieldLabelText="LE1EF13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC14" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC14" FieldTextBoxTabIndex="16"
														FieldLabelText="14.  Borrowing less than $10,000 (buying a car, TV," IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF14" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF14" FieldTextBoxTabIndex="78"
														FieldLabelText="LE1EF14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">IV. Changes in work</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC15" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC15" FieldTextBoxTabIndex="17"
														FieldLabelText="15.  New job" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF15" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF15" FieldTextBoxTabIndex="79"
														FieldLabelText="LE1EF15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC16" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC16" FieldTextBoxTabIndex="18"
														FieldLabelText="16.  Changes in work situation (different responsib" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF16" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF16" FieldTextBoxTabIndex="80"
														FieldLabelText="LE1EF16" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC17" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC17" FieldTextBoxTabIndex="19"
														FieldLabelText="17.  Trouble with employer" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF17" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF17" FieldTextBoxTabIndex="81"
														FieldLabelText="LE1EF17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC18" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC18" FieldTextBoxTabIndex="20"
														FieldLabelText="18.  Being tired from job" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF18" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF18" FieldTextBoxTabIndex="82"
														FieldLabelText="LE1EF18" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC19" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC19" FieldTextBoxTabIndex="21"
														FieldLabelText="19.  Retirement from work" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF19" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF19" FieldTextBoxTabIndex="83"
														FieldLabelText="LE1EF19" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">V. Changes in your partner</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC20" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC20" FieldTextBoxTabIndex="22"
														FieldLabelText="20.  Engagement" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF20" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF20" FieldTextBoxTabIndex="84"
														FieldLabelText="LE1EF20" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC21" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC21" FieldTextBoxTabIndex="23"
														FieldLabelText="21.  Marriage" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF21" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF21" FieldTextBoxTabIndex="85"
														FieldLabelText="LE1EF21" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC22" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC22" FieldTextBoxTabIndex="24"
														FieldLabelText="22.  Sexual difficulties" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF22" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF22" FieldTextBoxTabIndex="86"
														FieldLabelText="LE1EF22" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC23" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC23" FieldTextBoxTabIndex="25"
														FieldLabelText="23.  Major change in number of arguments (many more" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF23" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF23" FieldTextBoxTabIndex="87"
														FieldLabelText="LE1EF23" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC24" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC24" FieldTextBoxTabIndex="26"
														FieldLabelText="24.  Breaking up with boyfriend" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF24" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF24" FieldTextBoxTabIndex="88"
														FieldLabelText="LE1EF24" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC25" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC25" FieldTextBoxTabIndex="27"
														FieldLabelText="25.  Separation from spouse (due to work, travel, e" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF25" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF25" FieldTextBoxTabIndex="89"
														FieldLabelText="LE1EF25" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC26" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC26" FieldTextBoxTabIndex="28"
														FieldLabelText="26.  Separation from spouse (due to conflict)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF26" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF26" FieldTextBoxTabIndex="90"
														FieldLabelText="LE1EF26" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC27" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC27" FieldTextBoxTabIndex="29"
														FieldLabelText="27.  Reconciliation with boyfriend" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF27" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF27" FieldTextBoxTabIndex="91"
														FieldLabelText="LE1EF27" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC28" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC28" FieldTextBoxTabIndex="30"
														FieldLabelText="28.  Reconciliation with husband" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF28" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF28" FieldTextBoxTabIndex="92"
														FieldLabelText="LE1EF28" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC29" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC29" FieldTextBoxTabIndex="31"
														FieldLabelText="29.  Change in husband/partner's work (new lob. new" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF29" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF29" FieldTextBoxTabIndex="93"
														FieldLabelText="LE1EF29" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC30" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC30" FieldTextBoxTabIndex="32"
														FieldLabelText="30.  Divorce" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF30" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF30" FieldTextBoxTabIndex="94"
														FieldLabelText="LE1EF30" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC31" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC31" FieldTextBoxTabIndex="33"
														FieldLabelText="31.  Death of husband" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF31" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF31" FieldTextBoxTabIndex="95"
														FieldLabelText="LE1EF31" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid" id="table_entry2">
											<TR>
												<TD class="heading">Occur:
													<BR>
													0=NA<BR>
													1=Good<BR>
													2=Bad<BR>
													9=Missing<BR>
												</TD>
												<TD class="heading">Effect:<BR>
													0=None<BR>
													1=Some<BR>
													2=Moderate<BR>
													3=Great<BR>
													9=Missing/NA<BR>
												</TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">VI. Changes in your family</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC32" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC32" FieldTextBoxTabIndex="34"
														FieldLabelText="32.  Major change in closeness of family" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF32" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF32" FieldTextBoxTabIndex="96"
														FieldLabelText="LE1EF32" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC33" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC33" FieldTextBoxTabIndex="35"
														FieldLabelText="33.  Trouble with in-laws" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF33" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF33" FieldTextBoxTabIndex="97"
														FieldLabelText="LE1EF33" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC34" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC34" FieldTextBoxTabIndex="36"
														FieldLabelText="34.  Gaining a new family member (through birth, ad" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF34" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF34" FieldTextBoxTabIndex="98"
														FieldLabelText="LE1EF34" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC35" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC35" FieldTextBoxTabIndex="37"
														FieldLabelText="35.  Son or daughter leaving home (school. marriage" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF35" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF35" FieldTextBoxTabIndex="99"
														FieldLabelText="LE1EF35" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC36" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC36" FieldTextBoxTabIndex="38"
														FieldLabelText="36.  Leaving home for the first time yourself" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF36" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF36" FieldTextBoxTabIndex="100"
														FieldLabelText="LE1EF36" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37A" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37A" FieldTextBoxTabIndex="39"
														FieldLabelText="37a.  Serious illness or injury of Father" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37A" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37A" FieldTextBoxTabIndex="101"
														FieldLabelText="LE1EF37A" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37B" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37B" FieldTextBoxTabIndex="40"
														FieldLabelText="37b.  Serious illness or injury of Mother" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37B" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37B" FieldTextBoxTabIndex="102"
														FieldLabelText="LE1EF37B" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37C" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37C" FieldTextBoxTabIndex="41"
														FieldLabelText="37c.  Serious illness or injury of Sister" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37C" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37C" FieldTextBoxTabIndex="103"
														FieldLabelText="LE1EF37C" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37D" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37D" FieldTextBoxTabIndex="42"
														FieldLabelText="37d.  Serious illness or injury of Brother" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37D" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37D" FieldTextBoxTabIndex="104"
														FieldLabelText="LE1EF37D" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37E" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37E" FieldTextBoxTabIndex="43"
														FieldLabelText="37e.  Serious illness or injury of Grandfather" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37E" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37E" FieldTextBoxTabIndex="105"
														FieldLabelText="LE1EF37E" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37F" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37F" FieldTextBoxTabIndex="44"
														FieldLabelText="37f.  Serious illness or injury of Grandmother" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37F" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37F" FieldTextBoxTabIndex="106"
														FieldLabelText="LE1EF37F" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37G" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37G" FieldTextBoxTabIndex="45"
														FieldLabelText="37g.  Serious illness or injury of Husband" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37G" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37G" FieldTextBoxTabIndex="107"
														FieldLabelText="LE1EF37G" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC37H" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC37H" FieldTextBoxTabIndex="46"
														FieldLabelText="37h.  Serious illness or injury of Other (specify)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF37H" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF37H" FieldTextBoxTabIndex="108"
														FieldLabelText="LE1EF37H" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38A" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38A" FieldTextBoxTabIndex="47"
														FieldLabelText="38a.  Death of Father" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38A" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38A" FieldTextBoxTabIndex="109"
														FieldLabelText="LE1EF38A" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38B" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38B" FieldTextBoxTabIndex="48"
														FieldLabelText="38b.  Death of Mother" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38B" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38B" FieldTextBoxTabIndex="110"
														FieldLabelText="LE1EF38B" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38C" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38C" FieldTextBoxTabIndex="49"
														FieldLabelText="38c.  Death of Sister" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38C" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38C" FieldTextBoxTabIndex="111"
														FieldLabelText="LE1EF38C" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38D" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38D" FieldTextBoxTabIndex="50"
														FieldLabelText="38d.  Death of Brother" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38D" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38D" FieldTextBoxTabIndex="112"
														FieldLabelText="LE1EF38D" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38E" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38E" FieldTextBoxTabIndex="51"
														FieldLabelText="38e.  Death of Grandfather" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38E" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38E" FieldTextBoxTabIndex="113"
														FieldLabelText="LE1EF38E" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38F" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38F" FieldTextBoxTabIndex="52"
														FieldLabelText="38f.  Death of Grandmother" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38F" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38F" FieldTextBoxTabIndex="114"
														FieldLabelText="LE1EF38F" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38G" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38G" FieldTextBoxTabIndex="53"
														FieldLabelText="38g.  Death of Husband" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38G" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38G" FieldTextBoxTabIndex="115"
														FieldLabelText="LE1EF38G" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC38H" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC38H" FieldTextBoxTabIndex="54"
														FieldLabelText="38h.  Death of Other (specify)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF38H" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF38H" FieldTextBoxTabIndex="116"
														FieldLabelText="LE1EF38H" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading" colSpan="2">VII. Changes in friends and social events</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC39" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC39" FieldTextBoxTabIndex="55"
														FieldLabelText="39.  Serious injury or illness of a close friend" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF39" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF39" FieldTextBoxTabIndex="117"
														FieldLabelText="LE1EF39" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC40" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC40" FieldTextBoxTabIndex="56"
														FieldLabelText="40.  Death of a close friend" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF40" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF40" FieldTextBoxTabIndex="118"
														FieldLabelText="LE1EF40" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC41" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC41" FieldTextBoxTabIndex="57"
														FieldLabelText="41.  Minor law violations (like traffic violations)" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF41" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF41" FieldTextBoxTabIndex="119"
														FieldLabelText="LE1EF41" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC42" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC42" FieldTextBoxTabIndex="58"
														FieldLabelText="42.  Major change in usual type and/or amount of re" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF42" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF42" FieldTextBoxTabIndex="120"
														FieldLabelText="LE1EF42" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC43" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC43" FieldTextBoxTabIndex="59"
														FieldLabelText="43.  Major change in social activities (kind or amo" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF43" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF43" FieldTextBoxTabIndex="121"
														FieldLabelText="LE1EF43" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC44" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC44" FieldTextBoxTabIndex="60"
														FieldLabelText="44.  Major change In church activities (Increased o" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF44" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF44" FieldTextBoxTabIndex="122"
														FieldLabelText="LE1EF44" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC45" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC45" FieldTextBoxTabIndex="61"
														FieldLabelText="45.  End of formal schooling" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF45" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF45" FieldTextBoxTabIndex="123"
														FieldLabelText="LE1EF45" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC46A" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC46A" FieldTextBoxTabIndex="62"
														FieldLabelText="46a.  Other experience #1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF46A" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF46A" FieldTextBoxTabIndex="124"
														FieldLabelText="LE1EF46A" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC46B" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC46B" FieldTextBoxTabIndex="63"
														FieldLabelText="46b.  Other experience #2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF46B" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF46B" FieldTextBoxTabIndex="125"
														FieldLabelText="LE1EF46B" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="LE1OC46C" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1OC46C" FieldTextBoxTabIndex="64"
														FieldLabelText="46c.  Other experience #3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="LE1EF46C" runat="server" FieldTextBoxWidth="30px" DatabaseField="LE1EF46C" FieldTextBoxTabIndex="126"
														FieldLabelText="LE1EF46C" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="128"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="129"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="130"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="131"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
