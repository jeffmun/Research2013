<%@ Page language="c#" Inherits="gen_soc.gen_soc" CodeFile="gen_soc.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_soc" LookupField1="indid"
							LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN Social Anxiety &amp; Behavior"
							PrimaryKeyField="soc_pk" VerifiedField="verified" StudyMeasID="138"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="INDID" FieldLabelWidth="150px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="QPDATE" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date QP Completed"
										FieldTextBoxTabIndex="3" DatabaseField="QPDATE" FieldLabelWidth="150px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="QPWHO" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Who completed QP (1=Mother, 2=Father, 3=Other)"
										FieldTextBoxTabIndex="4" DatabaseField="QPWHO" FieldLabelWidth="150px" FieldTextBoxWidth="80px" ValidList="1,2,3"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="QPOTHER" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(specify other)"
										FieldTextBoxTabIndex="5" DatabaseField="QPOTHER" FieldLabelWidth="150px" FieldTextBoxWidth="150px"
										FieldTextBoxMaxLength="255"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=True<BR>
										2=False<BR>
										9=Missing/blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX01"
											FieldTextBoxTabIndex="8" FieldLabelText="1.  My son/daughter feels relaxed even in unfamiliar social situations."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX02"
											FieldTextBoxTabIndex="9" FieldLabelText="2.  My son/daughter tries to avoid situations which force him/her to be very sociable."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX03"
											FieldTextBoxTabIndex="10" FieldLabelText="3.  It is easy for my son/daughter to relax when with strangers."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX04"
											FieldTextBoxTabIndex="11" FieldLabelText="4.  My son/daughter has no particular desire to avoid people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX05"
											FieldTextBoxTabIndex="12" FieldLabelText="5.  My son/daughter often finds social occasions upsetting."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX06"
											FieldTextBoxTabIndex="13" FieldLabelText="6.  My son/daughter usually feels calm and comfortable at social occasions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX07"
											FieldTextBoxTabIndex="14" FieldLabelText="7.  My son/daughter is usually at ease when talking to someone of the opposite sex. (if applicable)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX08"
											FieldTextBoxTabIndex="15" FieldLabelText="8.  My son/daughter tries to avoid talking to people unless he/she knows them well."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX09"
											FieldTextBoxTabIndex="16" FieldLabelText="9.  If the chance comes to meet new people, my son/daughter often takes it."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX10"
											FieldTextBoxTabIndex="17" FieldLabelText="10.  My son/daughter often feels nervous or tense in casual get-togethers in which both sexes are present. (if applicable)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX11"
											FieldTextBoxTabIndex="18" FieldLabelText="11.  My son/daughter is usually nervous with people unless he/she knows them well."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX12"
											FieldTextBoxTabIndex="19" FieldLabelText="12.  My son/daughter usually feels relaxed when with a group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX13"
											FieldTextBoxTabIndex="20" FieldLabelText="13.  My son/daughter often wants to get away from people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX14"
											FieldTextBoxTabIndex="21" FieldLabelText="14.  My son/daughter usually feels uncomfortable when in a group of people he/she doesn't know."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX15"
											FieldTextBoxTabIndex="22" FieldLabelText="15.  My son/daughter usually feels relaxed when meeting someone for the first time."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX16"
											FieldTextBoxTabIndex="23" FieldLabelText="16.  Being introduced to people makes my son/daughter tense and nervous."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX17"
											FieldTextBoxTabIndex="24" FieldLabelText="17.  Even though a room is full of strangers, my son/daughter may enter it anyway."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX18"
											FieldTextBoxTabIndex="25" FieldLabelText="18.  My son/daughter would avoid walking up and joining a large group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX19"
											FieldTextBoxTabIndex="26" FieldLabelText="19.  When my son/daughter's superiors (or teachers) want to talk with him/her, my son/daughter talks willingly."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX20"
											FieldTextBoxTabIndex="27" FieldLabelText="20.  My son/daughter often feels on edge when with a group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX21"
											FieldTextBoxTabIndex="28" FieldLabelText="21.  My son/daughter tends to withdraw from people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX22"
											FieldTextBoxTabIndex="29" FieldLabelText="22.  My son/daughter doesn't mind talking to people at parties or social gatherings."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX23"
											FieldTextBoxTabIndex="30" FieldLabelText="23.  My son/daughter is seldom at ease in a large group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX24"
											FieldTextBoxTabIndex="31" FieldLabelText="24.  My son/daughter often thinks up excuses in order to avoid social engagements."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX25"
											FieldTextBoxTabIndex="32" FieldLabelText="25.  My son/daughter sometimes takes the responsibility for introducing people to each other."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX26"
											FieldTextBoxTabIndex="33" FieldLabelText="26.  My son/daughter tries to avoid formal social occasions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX27"
											FieldTextBoxTabIndex="34" FieldLabelText="27.  My son/daughter usually goes to whatever social engagement he/she has."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCANX28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCANX28"
											FieldTextBoxTabIndex="35" FieldLabelText="28.  My son/daughter finds it easy to relax with other people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1=Not at all<BR>
										2=A little<BR>
										3=Quite a lot<BR>
										4=A great deal<BR>
										9=Missing/blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH01"
											FieldTextBoxTabIndex="36" FieldLabelText="1.  Starts a conversation with someone he/she doesn't know well but would like to get to know better."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH02"
											FieldTextBoxTabIndex="37" FieldLabelText="2.  Is confident in his/her ability to make friends, even in a situation where he/she knows few people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH03"
											FieldTextBoxTabIndex="38" FieldLabelText="3.  Is able to mix well in a group." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH04"
											FieldTextBoxTabIndex="39" FieldLabelText="4.  Feels uncomfortable looking at other people directly."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH05"
											FieldTextBoxTabIndex="40" FieldLabelText="5.  Has trouble keeping a conversation going when he/she is just getting to know someone."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH06"
											FieldTextBoxTabIndex="41" FieldLabelText="6.  Finds it hard to let a person know that he/she wants to become closer friends with him/her."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH07"
											FieldTextBoxTabIndex="42" FieldLabelText="7.  Enjoys social gatherings just to be with people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH08"
											FieldTextBoxTabIndex="43" FieldLabelText="8.  Has problems getting other people to notice him/her."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH09"
											FieldTextBoxTabIndex="44" FieldLabelText="9.  Feels confident of his/her social behavior." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOCBEH10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="SOCBEH10"
											FieldTextBoxTabIndex="45" FieldLabelText="10.  Seeks out social encounters because he/she enjoys being with other people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="47"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="48"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="49"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="50"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
