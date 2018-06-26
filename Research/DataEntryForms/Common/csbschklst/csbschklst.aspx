<%@ Page language="c#" Inherits="GenericDataEntryForms.csbschklst.csbschklst" CodeFile="csbschklst.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_csbschklst" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="CSBS Checklist" PrimaryKeyField="csbs_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="438,592,1291,1415,1541,2653"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="100px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="CSBSdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="CSBSdate" FieldTextBoxWidth="100px" FieldLabelWidth="100px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="completedby" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Completed By (1=mother, 2=father, 3=other, 9=missing/blank)"
										FieldTextBoxTabIndex="4" DatabaseField="completedby" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
										ValidList="1,2,3,9"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" id="mainPanel">
							<DIV><BR>
								0-Not Yet<BR>
								1-Sometimes<BR>
								2-Often<BR>
								9-Missing/Blank<BR>
								<BR>
							</DIV>
							<TABLE class="grid" id="table_entry" width="500">
								<TR>
									<TD class="heading">Emotion and Eye Gaze</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS01"
											FieldTextBoxTabIndex="5"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS02"
											FieldTextBoxTabIndex="6"   IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS03"
											FieldTextBoxTabIndex="7"   IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS04"
											FieldTextBoxTabIndex="8"   IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Communication</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS05"
											FieldTextBoxTabIndex="9"   IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS06"
											FieldTextBoxTabIndex="10"   IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS07"
											FieldTextBoxTabIndex="11"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS08"
											FieldTextBoxTabIndex="12"   IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Gestures</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS09"
											FieldTextBoxTabIndex="13"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS10"
											FieldTextBoxTabIndex="14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS11"
											FieldTextBoxTabIndex="15"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS12"
											FieldTextBoxTabIndex="16"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS13"
											FieldTextBoxTabIndex="17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Sounds</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS14"
											FieldTextBoxTabIndex="18"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS15"
											FieldTextBoxTabIndex="19"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS16"
											FieldTextBoxTabIndex="20"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
										<DIV>0=None<BR>
											1=1-2<BR>
											2=3-4<BR>
											3=5-8<BR>
											4=over 8<BR>
											9=Missing/Blank<BR>
										</DIV>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Words</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS17"
											FieldTextBoxTabIndex="21"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
										<DIV>0=None<BR>
											1=1-3<BR>
											2=4-10<BR>
											3=11-30<BR>
											4=over 30<BR>
											9=Missing/Blank<BR>
										</DIV>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS18"
											FieldTextBoxTabIndex="22"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Understanding</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS19"
											FieldTextBoxTabIndex="23"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS20"
											FieldTextBoxTabIndex="24" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
										<DIV>0=None<BR>
											1=1-3<BR>
											2=4-10<BR>
											3=11-30<BR>
											4=over 30<BR>
											9=Missing/Blank<BR>
										</DIV>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Object Use</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS21"
											FieldTextBoxTabIndex="25"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS22"
											FieldTextBoxTabIndex="26"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
										<DIV>0=None<BR>
											1=1-2<BR>
											2=3-4<BR>
											3=5-8<BR>
											4=over 8<BR>
											9=Missing/Blank<BR>
										</DIV>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS23"
											FieldTextBoxTabIndex="27"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol>
										<DIV>0=None<BR>
											1=2 blocks<BR>
											2=3-4 blocks<BR>
											3=5 or more<BR>
											9=Missing/Blank<BR>
										</DIV>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBS24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="CSBS24"
											FieldTextBoxTabIndex="28"  IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" width="200">
								<TR>
									<TD class="heading">Concerns</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CSBSc" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="100px" DatabaseField="CSBSc"
											FieldTextBoxTabIndex="29" FieldLabelText="Concerns? (1=yes, 2=no, 9=missing/blank)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="concerns" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" DatabaseField="concerns"
											FieldTextBoxTabIndex="30" FieldLabelText="Describe concerns" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="500" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="32"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="33"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="34"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="35"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
