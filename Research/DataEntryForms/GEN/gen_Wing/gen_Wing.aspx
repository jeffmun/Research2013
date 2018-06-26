<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="gen_Wing.gen_Wing" CodeFile="gen_Wing.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_wing" LookupField1="indid"
							LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN Wing Questionnaire"
							PrimaryKeyField="wing_pk" VerifiedField="verified" StudyMeasID="140"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="INDID" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Never<BR>
										1=Very Rarely<BR>
										2=Rarely<BR>
										3=Sometimes<BR>
										4=Frequently<BR>
										5=Very Frequently<BR>
										6=Always<BR>
										8=Use if best is N/A<BR>
										9=Missing/blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD width="173">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG011" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG011"
														FieldTextBoxTabIndex="3" FieldLabelText="1-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG012" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG012"
														FieldTextBoxTabIndex="4" FieldLabelText="1-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG013" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG013"
														FieldTextBoxTabIndex="5" FieldLabelText="1-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG014" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG014"
														FieldTextBoxTabIndex="6" FieldLabelText="1-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG01BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG01BST"
														FieldTextBoxTabIndex="7" FieldLabelText="1-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG021" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG021"
														FieldTextBoxTabIndex="8" FieldLabelText="2-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG022" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG022"
														FieldTextBoxTabIndex="9" FieldLabelText="2-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG023" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG023"
														FieldTextBoxTabIndex="10" FieldLabelText="2-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG024" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG024"
														FieldTextBoxTabIndex="11" FieldLabelText="2-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG02BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG02BST"
														FieldTextBoxTabIndex="12" FieldLabelText="2-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG031" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG031"
														FieldTextBoxTabIndex="13" FieldLabelText="3-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG032" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG032"
														FieldTextBoxTabIndex="14" FieldLabelText="3-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG033" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG033"
														FieldTextBoxTabIndex="15" FieldLabelText="3-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG03BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG03BST"
														FieldTextBoxTabIndex="17" FieldLabelText="3-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG041" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG041"
														FieldTextBoxTabIndex="18" FieldLabelText="4-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG042" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG042"
														FieldTextBoxTabIndex="19" FieldLabelText="4-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG043" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG043"
														FieldTextBoxTabIndex="20" FieldLabelText="4-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG044" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG044"
														FieldTextBoxTabIndex="21" FieldLabelText="4-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG04BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG04BST"
														FieldTextBoxTabIndex="22" FieldLabelText="4-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG051" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG051"
														FieldTextBoxTabIndex="23" FieldLabelText="5-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG052" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG052"
														FieldTextBoxTabIndex="24" FieldLabelText="5-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG053" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG053"
														FieldTextBoxTabIndex="25" FieldLabelText="5-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG054" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG054"
														FieldTextBoxTabIndex="26" FieldLabelText="5-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG05BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG05BST"
														FieldTextBoxTabIndex="27" FieldLabelText="5-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG061" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG061"
														FieldTextBoxTabIndex="28" FieldLabelText="6-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG062" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG062"
														FieldTextBoxTabIndex="29" FieldLabelText="6-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG063" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG063"
														FieldTextBoxTabIndex="30" FieldLabelText="6-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG064" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG064"
														FieldTextBoxTabIndex="31" FieldLabelText="6-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG06BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG06BST"
														FieldTextBoxTabIndex="32" FieldLabelText="6-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG071" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG071"
														FieldTextBoxTabIndex="33" FieldLabelText="7-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG072" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG072"
														FieldTextBoxTabIndex="34" FieldLabelText="7-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG073" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG073"
														FieldTextBoxTabIndex="35" FieldLabelText="7-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG074" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG074"
														FieldTextBoxTabIndex="36" FieldLabelText="7-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG07BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG07BST"
														FieldTextBoxTabIndex="37" FieldLabelText="7-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG081" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG081"
														FieldTextBoxTabIndex="38" FieldLabelText="8-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG082" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG082"
														FieldTextBoxTabIndex="39" FieldLabelText="8-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG083" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG083"
														FieldTextBoxTabIndex="40" FieldLabelText="8-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG084" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG084"
														FieldTextBoxTabIndex="41" FieldLabelText="8-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG08BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG08BST"
														FieldTextBoxTabIndex="42" FieldLabelText="8-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG091" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG091"
														FieldTextBoxTabIndex="43" FieldLabelText="9-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG092" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG092"
														FieldTextBoxTabIndex="44" FieldLabelText="9-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG093" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG093"
														FieldTextBoxTabIndex="45" FieldLabelText="9-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG094" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG094"
														FieldTextBoxTabIndex="46" FieldLabelText="9-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG09BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG09BST"
														FieldTextBoxTabIndex="47" FieldLabelText="9-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG101"
														FieldTextBoxTabIndex="48" FieldLabelText="10-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG102"
														FieldTextBoxTabIndex="49" FieldLabelText="10-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG103"
														FieldTextBoxTabIndex="50" FieldLabelText="10-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG104"
														FieldTextBoxTabIndex="51" FieldLabelText="10-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG10BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG10BST"
														FieldTextBoxTabIndex="52" FieldLabelText="10-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG111"
														FieldTextBoxTabIndex="53" FieldLabelText="11-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG112"
														FieldTextBoxTabIndex="54" FieldLabelText="11-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG113"
														FieldTextBoxTabIndex="55" FieldLabelText="11-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG114"
														FieldTextBoxTabIndex="56" FieldLabelText="11-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG11BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG11BST"
														FieldTextBoxTabIndex="57" FieldLabelText="11-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG121"
														FieldTextBoxTabIndex="58" FieldLabelText="12-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG122"
														FieldTextBoxTabIndex="59" FieldLabelText="12-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG123"
														FieldTextBoxTabIndex="60" FieldLabelText="12-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG12BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG12BST"
														FieldTextBoxTabIndex="62" FieldLabelText="12-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG131"
														FieldTextBoxTabIndex="63" FieldLabelText="13-1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG132"
														FieldTextBoxTabIndex="64" FieldLabelText="13-2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG133"
														FieldTextBoxTabIndex="65" FieldLabelText="13-3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG134"
														FieldTextBoxTabIndex="66" FieldLabelText="13-4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="WNG13BST" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="WNG13BST"
														FieldTextBoxTabIndex="67" FieldLabelText="13-Best" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="69"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="70"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="71"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="72"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
