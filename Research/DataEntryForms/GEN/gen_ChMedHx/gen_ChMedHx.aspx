<%@ Page language="c#" Inherits="gen_ChMedHx.gen_ChMedHx" CodeFile="gen_ChMedHx.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="cm_pk"
							MeasureName="GEN Child Medical Hx" LookupTextBox2Visible="False" LookupTextBox1LabelText="GEN ID:" LookupField1="indid"
							DatabaseTable="gen_chmedhx" StudyMeasID="142"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" DatabaseField="INDID" FieldTextBoxTabIndex="2" FieldLabelText="GEN ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">Use -9 for missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="01. Difficulties sleeping? (0=Y, 1=N)" FieldTextBoxTabIndex="3" DatabaseField="CMH01"
											ValidList="0,1,-9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="CMH01A" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText=" if yes, describe:" FieldTextBoxTabIndex="4" DatabaseField="CMH01A"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="02. Difficulties nursing/sucking? (0=Y, 1=N)" FieldTextBoxTabIndex="5" DatabaseField="CMH02"
											ValidList="0,1,-9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="CMH02A" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText=" if yes, describe:" FieldTextBoxTabIndex="6" DatabaseField="CMH02A"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=low, quiet, 2=moderate, avg., 3=hi,active<BR>
										<def:datafieldcontrol id="CMH03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="03. Amount of baby's activity" FieldTextBoxTabIndex="7" DatabaseField="CMH03" ValidList="1,2,3,-9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="CMH03A" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Describe amount of baby's activity (very active, restless, quite, etc.)"
											FieldTextBoxTabIndex="8" DatabaseField="CMH03A" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Code all ages in months (use -9 for missing), Use -8 for ages 
										that are N/A</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH04A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="04a. At what age did your child sit without support? (months)" FieldTextBoxTabIndex="9"
											DatabaseField="CMH04A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH04B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="04b. At what age did your child walk without support? (months)" FieldTextBoxTabIndex="10"
											DatabaseField="CMH04B"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH05" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="05. Did your child make babbling snds as  infant? (0=Y, 1=N)" FieldTextBoxTabIndex="11"
											DatabaseField="CMH05" ValidList="0,1,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH06A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="06a. At what age did your child first speak words? (months)" FieldTextBoxTabIndex="12"
											DatabaseField="CMH06A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH06B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="06b. At what age did your child first speak simple sentences? (months)" FieldTextBoxTabIndex="13"
											DatabaseField="CMH06B"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH07A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="07a. Has training started for bowel control (0=Y, 1=N)?" FieldTextBoxTabIndex="14"
											DatabaseField="CMH07A" ValidList="0,1,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH07B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="07b. At what age was control established?  (months)" FieldTextBoxTabIndex="15" DatabaseField="CMH07B"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH07C" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="07c. Were there any relapses? (0=Y, 1=N)" FieldTextBoxTabIndex="16" DatabaseField="CMH07C"
											ValidList="0,1,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="CMH07D" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age:" FieldTextBoxTabIndex="17" DatabaseField="CMH07D"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH07E" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="07e. Describe the relapse:" FieldTextBoxTabIndex="18" DatabaseField="CMH07E"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH08A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="08a. Has your child stopped wetting at night  (0=Y, 1=N)?" FieldTextBoxTabIndex="19"
											DatabaseField="CMH08A" ValidList="0,1,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH08B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="08b. Has your child stopped wetting during the day (0=Y, 1=N)?" FieldTextBoxTabIndex="20"
											DatabaseField="CMH08B" ValidList="0,1,-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Enter all ages in months! (0=Y, 1=N, -9 = missing), Use -8 for 
										ages that are N/A</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH09" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="09. Did/Does your child have temper tantrums?" FieldTextBoxTabIndex="21" DatabaseField="CMH09"
											ValidList="0,1,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="CMH09A" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age:" FieldTextBoxTabIndex="22" DatabaseField="CMH09A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH09B" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="09b. Describe - temper tantrums?" FieldTextBoxTabIndex="23"
											DatabaseField="CMH09B" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH10" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10. Did/Does your child have aggressive or self-injurious behavi" FieldTextBoxTabIndex="24"
											DatabaseField="CMH10" ValidList="0,1,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="CMH10A" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age:" FieldTextBoxTabIndex="25" DatabaseField="CMH10A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH10B" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="10b. Describe - aggressive" FieldTextBoxTabIndex="26" DatabaseField="CMH10B"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH11" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="11. Did/Does your child have fears, such as fear of darkness, do" FieldTextBoxTabIndex="27"
											DatabaseField="CMH11" ValidList="0,1,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="CMH11A" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age:" FieldTextBoxTabIndex="28" DatabaseField="CMH11A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH11B" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="11b. Describe - fears" FieldTextBoxTabIndex="29" DatabaseField="CMH11B"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH12" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="12. Did/Does your child have any sleep disturbances?" FieldTextBoxTabIndex="30" DatabaseField="CMH12"
											ValidList="0,1,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="CMH12A" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age:" FieldTextBoxTabIndex="31" DatabaseField="CMH12A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH12B" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="12b. Describe - any sleep probs?" FieldTextBoxTabIndex="32"
											DatabaseField="CMH12B" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH13" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="13. Did/Does your child have any eating problems?" FieldTextBoxTabIndex="33" DatabaseField="CMH13"
											ValidList="0,1,-9"></def:datafieldcontrol>
										<def:datafieldcontrol id="CMH13A" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Age:" FieldTextBoxTabIndex="34" DatabaseField="CMH13A"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CMH13B" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="13b. Describe - any eating problems?" FieldTextBoxTabIndex="35"
											DatabaseField="CMH13B" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<H3>** For the remaining items, leave blank if nothing is entered on the form **</H3>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Physician</TD>
									<TD class="heading">Date</TD>
									<TD class="heading">Results<BR>
										0=normal<BR>
										1=abnormal</TD>
								</TR>
								<TR>
									<TD>14a1. Neurological Exam</TD>
									<TD>
										<def:datafieldcontrol id="CMH14A1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CMH14A1"
											FieldTextBoxTabIndex="36" DatabaseField="CMH14A1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14A2" runat="server" FieldTextBoxWidth="60px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14A2" FieldTextBoxTabIndex="37" DatabaseField="CMH14A2"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14A3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14A3" FieldTextBoxTabIndex="38" DatabaseField="CMH14A3"
											ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">
										<def:datafieldcontrol id="CMH14A4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Description of results" FieldTextBoxTabIndex="39" DatabaseField="CMH14A4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14b1. Magnetic Resonance Imaging (MRI)</TD>
									<TD>
										<def:datafieldcontrol id="CMH14B1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CMH14B1"
											FieldTextBoxTabIndex="40" DatabaseField="CMH14B1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14B2" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14B2" FieldTextBoxTabIndex="41" DatabaseField="CMH14B2"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14B3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14B3" FieldTextBoxTabIndex="42" DatabaseField="CMH14B3"
											ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">
										<def:datafieldcontrol id="CMH14B4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Description of results" FieldTextBoxTabIndex="43" DatabaseField="CMH14B4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14c1. Clinical EEG</TD>
									<TD>
										<def:datafieldcontrol id="CMH14C1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CMH14C1"
											FieldTextBoxTabIndex="44" DatabaseField="CMH14C1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14C2" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14C2" FieldTextBoxTabIndex="45" DatabaseField="CMH14C2"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14C3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14C3" FieldTextBoxTabIndex="46" DatabaseField="CMH14C3"
											ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">
										<def:datafieldcontrol id="CMH14C4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Description of results" FieldTextBoxTabIndex="47" DatabaseField="CMH14C4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14d1. Neuropsychological Testing</TD>
									<TD>
										<def:datafieldcontrol id="CMH14D1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CMH14D1"
											FieldTextBoxTabIndex="48" DatabaseField="CMH14D1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14D2" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14D2" FieldTextBoxTabIndex="49" DatabaseField="CMH14D2"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14D3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14D3" FieldTextBoxTabIndex="50" DatabaseField="CMH14D3"
											ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">
										<def:datafieldcontrol id="CMH14D4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Description of results" FieldTextBoxTabIndex="51" DatabaseField="CMH14D4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14e1. Genetic Evaluation (eg. Fragile X)</TD>
									<TD>
										<def:datafieldcontrol id="CMH14E1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CMH14E1"
											FieldTextBoxTabIndex="52" DatabaseField="CMH14E1" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14E2" runat="server" FieldTextBoxWidth="70px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14E2" FieldTextBoxTabIndex="53" DatabaseField="CMH14E2"
											ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH14E3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH14E3" FieldTextBoxTabIndex="54" DatabaseField="CMH14E3"
											ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">
										<def:datafieldcontrol id="CMH14E4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Description of results" FieldTextBoxTabIndex="55" DatabaseField="CMH14E4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Name</TD>
									<TD class="heading">Age<BR>
										(in mos)</TD>
									<TD class="heading">Length<BR>
										(in days)</TD>
									<TD class="heading">Hi Fever/<BR>
										Unconc.<BR>
										0=Y,1=N</TD>
									<TD class="heading">Tx/<BR>
										Aftereffects</TD>
								</TR>
								<TR>
									<TD>15a1. Illness #1</TD>
									<TD>
										<def:datafieldcontrol id="CMH15A1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH15A1"
											FieldTextBoxTabIndex="56" DatabaseField="CMH15A1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15A2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15A2" FieldTextBoxTabIndex="57" DatabaseField="CMH15A2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15A3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15A3" FieldTextBoxTabIndex="58" DatabaseField="CMH15A3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15A4" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15A4" FieldTextBoxTabIndex="59" DatabaseField="CMH15A4"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15A5" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH15A5" FieldTextBoxTabIndex="60" DatabaseField="CMH15A5"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15b1. Illness #2</TD>
									<TD>
										<def:datafieldcontrol id="CMH15B1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH15B1"
											FieldTextBoxTabIndex="61" DatabaseField="CMH15B1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15B2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15B2" FieldTextBoxTabIndex="62" DatabaseField="CMH15B2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15B3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15B3" FieldTextBoxTabIndex="63" DatabaseField="CMH15B3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15B4" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15B4" FieldTextBoxTabIndex="64" DatabaseField="CMH15B4"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15B5" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH15B5" FieldTextBoxTabIndex="65" DatabaseField="CMH15B5"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="4075"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15c1. Illness #3</TD>
									<TD>
										<def:datafieldcontrol id="CMH15C1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH15C1"
											FieldTextBoxTabIndex="66" DatabaseField="CMH15C1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15C2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15C2" FieldTextBoxTabIndex="67" DatabaseField="CMH15C2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15C3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15C3" FieldTextBoxTabIndex="68" DatabaseField="CMH15C3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15C4" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15C4" FieldTextBoxTabIndex="69" DatabaseField="CMH15C4"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15C5" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH15C5" FieldTextBoxTabIndex="70" DatabaseField="CMH15C5"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15d1. Illness #4</TD>
									<TD>
										<def:datafieldcontrol id="CMH15D1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH15D1"
											FieldTextBoxTabIndex="71" DatabaseField="CMH15D1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15D2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15D2" FieldTextBoxTabIndex="72" DatabaseField="CMH15D2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15D3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15D3" FieldTextBoxTabIndex="73" DatabaseField="CMH15D3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15D4" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15D4" FieldTextBoxTabIndex="74" DatabaseField="CMH15D4"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15D5" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH15D5" FieldTextBoxTabIndex="75" DatabaseField="CMH15D5"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15e1. Illness #5</TD>
									<TD>
										<def:datafieldcontrol id="CMH15E1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH15E1"
											FieldTextBoxTabIndex="76" DatabaseField="CMH15E1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15E2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15E2" FieldTextBoxTabIndex="77" DatabaseField="CMH15E2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15E3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15E3" FieldTextBoxTabIndex="78" DatabaseField="CMH15E3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15E4" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH15E4" FieldTextBoxTabIndex="79" DatabaseField="CMH15E4"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH15E5" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH15E5" FieldTextBoxTabIndex="80" DatabaseField="CMH15E5"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Name</TD>
									<TD class="heading">Age<BR>
										(in mos)</TD>
									<TD class="heading">Length<BR>
										(in days)</TD>
									<TD class="heading">Tx/<BR>
										Aftereffects</TD>
								</TR>
								<TR>
									<TD>16a1. Oper. #1</TD>
									<TD>
										<def:datafieldcontrol id="CMH16A1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH16A1"
											FieldTextBoxTabIndex="81" DatabaseField="CMH16A1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16A2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16A2" FieldTextBoxTabIndex="82" DatabaseField="CMH16A2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16A3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16A3" FieldTextBoxTabIndex="83" DatabaseField="CMH16A3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16A4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH16A4" FieldTextBoxTabIndex="84" DatabaseField="CMH16A4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16b1. Oper. #2</TD>
									<TD>
										<def:datafieldcontrol id="CMH16B1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH16B1"
											FieldTextBoxTabIndex="85" DatabaseField="CMH16B1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16B2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16B2" FieldTextBoxTabIndex="86" DatabaseField="CMH16B2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16B3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16B3" FieldTextBoxTabIndex="87" DatabaseField="CMH16B3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16B4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH16B4" FieldTextBoxTabIndex="88" DatabaseField="CMH16B4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16c1. Oper. #3</TD>
									<TD>
										<def:datafieldcontrol id="CMH16C1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH16C1"
											FieldTextBoxTabIndex="89" DatabaseField="CMH16C1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16C2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16C2" FieldTextBoxTabIndex="90" DatabaseField="CMH16C2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16C3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16C3" FieldTextBoxTabIndex="91" DatabaseField="CMH16C3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16C4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH16C4" FieldTextBoxTabIndex="92" DatabaseField="CMH16C4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16d1. Oper. #4</TD>
									<TD>
										<def:datafieldcontrol id="CMH16D1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH16D1"
											FieldTextBoxTabIndex="93" DatabaseField="CMH16D1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16D2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16D2" FieldTextBoxTabIndex="94" DatabaseField="CMH16D2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16D3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16D3" FieldTextBoxTabIndex="95" DatabaseField="CMH16D3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16D4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH16D4" FieldTextBoxTabIndex="96" DatabaseField="CMH16D4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16e1. Oper. #5</TD>
									<TD>
										<def:datafieldcontrol id="CMH16E1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH16E1"
											FieldTextBoxTabIndex="97" DatabaseField="CMH16E1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16E2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16E2" FieldTextBoxTabIndex="98" DatabaseField="CMH16E2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16E3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH16E3" FieldTextBoxTabIndex="99" DatabaseField="CMH16E3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH16E4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH16E4" FieldTextBoxTabIndex="100" DatabaseField="CMH16E4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Name</TD>
									<TD class="heading">Age<BR>
										(in mos)</TD>
									<TD class="heading">Length<BR>
										(in days)</TD>
									<TD class="heading">Tx/<BR>
										Aftereffects</TD>
								</TR>
								<TR>
									<TD>17a1. Hosp. #1</TD>
									<TD>
										<def:datafieldcontrol id="CMH17A1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH17A1"
											FieldTextBoxTabIndex="101" DatabaseField="CMH17A1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17A2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17A2" FieldTextBoxTabIndex="102" DatabaseField="CMH17A2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17A3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17A3" FieldTextBoxTabIndex="103" DatabaseField="CMH17A3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17A4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH17A4" FieldTextBoxTabIndex="104" DatabaseField="CMH17A4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17b1. Hosp. #2</TD>
									<TD>
										<def:datafieldcontrol id="CMH17B1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH17B1"
											FieldTextBoxTabIndex="105" DatabaseField="CMH17B1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17B2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17B2" FieldTextBoxTabIndex="106" DatabaseField="CMH17B2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17B3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17B3" FieldTextBoxTabIndex="107" DatabaseField="CMH17B3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17B4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH17B4" FieldTextBoxTabIndex="108" DatabaseField="CMH17B4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17c1. Hosp. #3</TD>
									<TD>
										<def:datafieldcontrol id="CMH17C1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH17C1"
											FieldTextBoxTabIndex="109" DatabaseField="CMH17C1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17C2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17C2" FieldTextBoxTabIndex="110" DatabaseField="CMH17C2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17C3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17C3" FieldTextBoxTabIndex="111" DatabaseField="CMH17C3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17C4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH17C4" FieldTextBoxTabIndex="112" DatabaseField="CMH17C4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17d1. Hosp. #4</TD>
									<TD>
										<def:datafieldcontrol id="CMH17D1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH17D1"
											FieldTextBoxTabIndex="113" DatabaseField="CMH17D1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17D2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17D2" FieldTextBoxTabIndex="114" DatabaseField="CMH17D2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17D3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17D3" FieldTextBoxTabIndex="115" DatabaseField="CMH17D3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17D4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH17D4" FieldTextBoxTabIndex="116" DatabaseField="CMH17D4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17e1. Hosp. #5</TD>
									<TD>
										<def:datafieldcontrol id="CMH17E1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="CMH17E1"
											FieldTextBoxTabIndex="117" DatabaseField="CMH17E1" FieldTextBoxMaxLength="255" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17E2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17E2" FieldTextBoxTabIndex="118" DatabaseField="CMH17E2"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17E3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="CMH17E3" FieldTextBoxTabIndex="119" DatabaseField="CMH17E3"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="CMH17E4" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="CMH17E4" FieldTextBoxTabIndex="120" DatabaseField="CMH17E4"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="122" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="123" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="124" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="125" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
