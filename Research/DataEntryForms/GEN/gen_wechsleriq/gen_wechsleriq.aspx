<%@ Page language="c#" Inherits="gen_wechsleriq.gen_wechsleriq" CodeFile="gen_wechsleriq.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" LookupField1DataType="INT"
							DatabaseTable="GEN_WechslerIQ" LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN Wechsler IQ"
							PrimaryKeyField="IQnum" VerifiedField="verified" LookupField1="indid" StudyMeasID="126" ondocreatenew="DataEntryController1_DoCreateNew" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table>
							<tr>
								<td style="vertical-align:top">
									<table class="tblinsert" id="layout">
										<tr>
											<td>GEN ID</td>
											<td><def:datafieldcontrol id="INDID" runat="server" DatabaseField="INDID" FieldTextBoxTabIndex="2" FieldLabelText="GEN ID"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
													IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="100px" ShowFieldLabel="False" FieldLabelWidth="100px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td>IQ Test</td>
											<td><SELECT id="iqtestlist" onchange="iq_text_OnChange()" name="iq_test" runat="server" tabIndex="3">
													<OPTION value="nothing" selected>Select a test</OPTION>
													<OPTION value="WPPSI-R">WPPSI-R</OPTION>
													<OPTION value="WISC-III">WISC-III</OPTION>
													<OPTION value="WAIS-III">WAIS-III</OPTION>
												</SELECT><def:datafieldcontrol id="iqtest" runat="server" DatabaseField="iqtest" FieldTextBoxTabIndex="7" FieldLabelText="IQ Test"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
													IsInsertField="True" FieldDataType="TEXT" FieldTextBoxCssClass="hideme" FieldTextBoxWidth="100px" ShowFieldLabel="False"
													FieldLabelWidth="100px" ValidList="WPPSI-R,WISC-III,WAIS-III"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td>IQ Date</td>
											<td><def:datafieldcontrol id="iqdate" tabIndex="3" runat="server" DatabaseField="iqdate" FieldTextBoxTabIndex="4"
													FieldLabelText="iqdate" IsDoubleEntryField="false" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FieldTextBoxWidth="100px"
													ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td>Clinician</td>
											<td><def:datafieldcontrol id="iqclin" tabIndex="4" runat="server" DatabaseField="iqclin" FieldTextBoxTabIndex="6"
													FieldLabelText="iqclin" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="100px"
													ShowFieldLabel="False"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="iqdob" runat="server" DatabaseField="iqdob" FieldTextBoxTabIndex="5" FieldLabelText="DOB:"
													IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false" IsEntryField="false" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="IQagemos" runat="server" DatabaseField="IQagemos" FieldTextBoxTabIndex="24"
													FieldLabelText="Age:" IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false" IsEntryField="false"
													IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="100px"
													RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="IQage" runat="server" DatabaseField="IQage" FieldTextBoxTabIndex="23" FieldLabelText="Age (y:m):"
													IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false" IsEntryField="false" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="100px" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="NormTabl" runat="server" DatabaseField="NormTabl" FieldTextBoxTabIndex="22"
													FieldLabelText="Norm Table:" IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false"
													IsEntryField="false" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="100px"
													RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<script language="javascript">
						function iq_text_OnChange()
						{
							var iqtestlist = document.getElementById("<%= iqtestlist.ClientID %>");
							var iqtestfieldtextbox =  document.getElementById("<%= iqtest.ClientID %>_fieldTextBox");
							//alert(iqtestlist.value);
							iqtestfieldtextbox.value = iqtestlist.value;
						}
						
						// if in "INSERTING" state show iqtest selection list box
						// and hide iqtest field
						function loading()
						{
							var iqtestlist = document.getElementById("<%= iqtestlist.ClientID %>");
							var iqtestfieldtextbox =  document.getElementById("<%= iqtest.ClientID %>_fieldTextBox");
							var formstate = document.getElementById("_formstate");
							
							if (formstate.value == "INSERTING")
							{
								iqtestfieldtextbox.className="hideme";
								iqtestlist.className = "";
								
							
							}
							else
							{
								iqtestfieldtextbox.className="fieldtextbox";
								iqtestlist.className = "hideme";
							
								// iq test must exist so arrange controls based on iq test
								SetupControls(iqtestfieldtextbox.value);
							}
						}
						
						function SetupControls(sTest)
						{	
							var vocraw =  document.getElementById("<%= vocraw.ClientID %>_fieldTextBox");
							var compraw =  document.getElementById("<%= compraw.ClientID %>_fieldTextBox");
							var bdraw =  document.getElementById("<%= bdraw.ClientID %>_fieldTextBox");
							var oaraw =  document.getElementById("<%= oaraw.ClientID %>_fieldTextBox");

							var tblvoc =   document.getElementById("tblvoc");
							var tblcomp =   document.getElementById("tblcomp");
							var tblbd =   document.getElementById("tblbd");
							var tbloa =   document.getElementById("tbloa");
													
							var n = 40;
							var top = 0;
							var r1 = (top + n) + "px";
							var r2 = (top + 2*n) + "px";
							var r3 = (top + 3*n) + "px";
							var r4 = (top + 4*n) + "px";
							
							if (sTest == "WPPSI-R")
							{
								tblvoc.style.top= r4;
								tblcomp.style.top = r3;
								tblbd.style.top = r2;
								tbloa.style.top = r1;
								
								vocraw.tabIndex = 14; 
								compraw.tabIndex = 13;
								bdraw.tabIndex = 12;
								oaraw.tabIndex = 11;
							}
							else if (sTest == "WISC-III")
							{
								tblvoc.style.top= r2;
								tblcomp.style.top = r4;
								tblbd.style.top = r1;
								tbloa.style.top = r3;

								vocraw.tabIndex = 12; 
								compraw.tabIndex = 14;
								bdraw.tabIndex = 11;
								oaraw.tabIndex = 12;
							}
							else if (sTest == "WAIS-III")
							{
								tblvoc.style.top= r1;
								tblcomp.style.top = r3;
								tblbd.style.top = r2;
								tbloa.style.top = r4;

								vocraw.tabIndex = 11;
								compraw.tabIndex = 13;
								bdraw.tabIndex = 12;
								oaraw.tabIndex = 14;
							}
						}
						
						</script>
						<asp:panel id="mainPanel" runat="server">
							<TABLE>
								<TR>
									<TD>
										<DIV style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; WIDTH: 400px; BORDER-BOTTOM: black 1px solid; POSITION: relative; HEIGHT: 210px; BACKGROUND-COLOR: gainsboro">
											<TABLE style="LEFT: 0px; POSITION: absolute; TOP: 0px">
												<TR>
													<TD width="120"><FONT color="blue">Use -999 for missing</FONT></TD>
													<TD width="60"><B>Raw score</B></TD>
													<TD width="60"><B>Scaled score</B></TD>
													<TD width="60"><B>Age Equiv</B></TD>
												</TR>
											</TABLE>
											<TABLE id="tblvoc" style="LEFT: 0px; POSITION: absolute; TOP: 40px">
												<TR>
													<TD width="120"><B>Vocabulary</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="vocraw" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="vocraw" FieldTextBoxTabIndex="8" DatabaseField="vocraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="vocss" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vocss" FieldTextBoxTabIndex="12" DatabaseField="vocss"
															RenderReadOnlyAsDiv="True" Width="120px"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="vocaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vocaetxt" FieldTextBoxTabIndex="48" DatabaseField="vocaetxt"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
											<TABLE id="tblcomp" style="LEFT: 0px; POSITION: absolute; TOP: 80px">
												<TR>
													<TD width="120"><B>Comprehension</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="compraw" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="compraw" FieldTextBoxTabIndex="9" DatabaseField="compraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="compss" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="compss" FieldTextBoxTabIndex="13" DatabaseField="compss"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
													<TD width="60">
														<P>
															<def:datafieldcontrol id="compaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
																IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
																IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="compaetxt" FieldTextBoxTabIndex="49"
																DatabaseField="compaetxt" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></P>
													</TD>
												</TR>
											</TABLE>
											<TABLE id="tblbd" style="LEFT: 0px; POSITION: absolute; TOP: 120px">
												<TR>
													<TD width="120"><B>Block Design</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="bdraw" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="bdraw" FieldTextBoxTabIndex="10" DatabaseField="bdraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="bdss" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="bdss" FieldTextBoxTabIndex="14" DatabaseField="bdss"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="bdaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="bdaetxt" FieldTextBoxTabIndex="50" DatabaseField="bdaetxt"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
											<TABLE id="tbloa" style="LEFT: 0px; POSITION: absolute; TOP: 160px">
												<TR>
													<TD width="120"><B>Object Assembly</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="oaraw" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="oaraw" FieldTextBoxTabIndex="11" DatabaseField="oaraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="oass" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="oass" FieldTextBoxTabIndex="15" DatabaseField="oass"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="oaaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="oaaetxt" FieldTextBoxTabIndex="51" DatabaseField="oaaetxt"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
										</DIV>
									</TD>
									<TD>
										<TABLE class="grid" id="table_entry" style="BACKGROUND-COLOR: gainsboro">
											<TR>
												<TD>Full Scale IQ:</TD>
												<TD>
													<def:datafieldcontrol id="wfsiq" runat="server" FieldLabelWidth="110px" ShowFieldLabel="False" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false"
														IsReadOnly="True" IsDoubleEntryField="false" FieldLabelText="Full Scale IQ:" FieldTextBoxTabIndex="16"
														DatabaseField="wfsiq" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Verbal IQ:</TD>
												<TD>
													<def:datafieldcontrol id="wviq" runat="server" FieldLabelWidth="110px" ShowFieldLabel="False" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false"
														IsReadOnly="True" IsDoubleEntryField="false" FieldLabelText="Verbal IQ:" FieldTextBoxTabIndex="17"
														DatabaseField="wviq" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Performance IQ:</TD>
												<TD>
													<def:datafieldcontrol id="wpiq" runat="server" FieldLabelWidth="110px" ShowFieldLabel="False" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false"
														IsReadOnly="True" IsDoubleEntryField="false" FieldLabelText="Performance IQ:" FieldTextBoxTabIndex="18"
														DatabaseField="wpiq" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="IQvld" tabIndex="20" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="Validity (1=valid, 2=Questionnable, 3=Invalid)"
											FieldTextBoxTabIndex="19" DatabaseField="IQvld" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="IQcmnt" tabIndex="21" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="false"
											IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="Comments" FieldTextBoxTabIndex="21"
											DatabaseField="IQcmnt" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="scoremsg" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false" IsReadOnly="True"
								IsDoubleEntryField="false" FieldLabelText="Scoring status:" FieldTextBoxTabIndex="52" DatabaseField="scoremsg"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="70" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="71" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="72" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="73" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
