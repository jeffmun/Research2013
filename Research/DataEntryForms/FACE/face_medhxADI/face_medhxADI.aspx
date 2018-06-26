
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="face_medhxADI.face_medhxADI" CodeFile="face_medhxADI.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" VerifiedField="verified"
							PrimaryKeyField="medhx_pk" MeasureName="FACE Medical History-ADI" LookupTextBox1LabelText="FACE ID:"
							LookupTextBox2Visible="False" LookupField1="faceid" DatabaseTable="face_medhxADI" StudyMeasID="375"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="faceid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FACE ID"
										FieldTextBoxTabIndex="2" DatabaseField="faceid" FieldTextBoxWidth="60px" FieldLabelWidth="60px" RegExDescription="FACE ID must  look like FACE###"
										RegEx="^[F][A][C][E][0-9][0-9][0-9]$"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="hxweek" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="hxweek"
											FieldTextBoxTabIndex="3" FieldLabelText="Week" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxdate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="hxdate"
											FieldTextBoxTabIndex="4" FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" DatabaseField="hxrater"
											FieldTextBoxTabIndex="5" FieldLabelText="Rate Name" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxrphon" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="hxrphon"
											FieldTextBoxTabIndex="5" FieldLabelText="1=Phone" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxrprsn" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="hxrprsn"
											FieldTextBoxTabIndex="6" FieldLabelText="1=In person" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
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
									<TD>Subject</TD>
									<TD>Staff</TD>
									<TD>Other</TD>
								</TR>
								<TR>
									<TD>Primary Source</TD>
									<TD>
										<def:datafieldcontrol id="hxrelm" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxrelm" FieldTextBoxTabIndex="7"
											FieldLabelText="hxrelm" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelfa" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxrelfa" FieldTextBoxTabIndex="7"
											FieldLabelText="hxrelfa" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelsb" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxrelsb" FieldTextBoxTabIndex="7"
											FieldLabelText="hxrelsb" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelstf" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxrelstf" FieldTextBoxTabIndex="7"
											FieldLabelText="hxrelstf" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxrelo" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxrelo" FieldTextBoxTabIndex="7"
											FieldLabelText="hxrelo" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxreloth" runat="server" FieldLabelWidth="50px" DatabaseField="hxreloth" FieldTextBoxTabIndex="7"
											FieldLabelText="(specify)" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
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
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">1. Pregnancy History</TD>
								</TR>
								<TR>
									<TD>a. Date of Birth</TD>
									<TD>
										<def:datafieldcontrol id="hx1b1" runat="server" FieldTextBoxWidth="70px" DatabaseField="hx1a" FieldTextBoxTabIndex="9"
											FieldLabelText="hx1a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Week of delivery<BR>
										0=Greater than 37<BR>
										1=Less than 28<BR>
										2=Between 28 and 32<BR>
										3=Between 32 and 37<BR>
										4=Unknown</TD>
									<TD>
										<def:datafieldcontrol id="hx1c1" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx1b" FieldTextBoxTabIndex="10"
											FieldLabelText="hx1c1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,-8,-9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">2. Medical History</TD>
								</TR>
								<TR>
									<TD width="412">Disorder</TD>
									<TD>0=No<BR>
										1=YES<BR>
										2=NOT SURE</TD>
									<TD>Comments</TD>
								</TR>
								<TR>
									<TD width="412">a. Autism Spectrum Disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx3ahas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxahas" FieldTextBoxTabIndex="56"
											FieldLabelText="hx3ahas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3aotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxacmt" FieldTextBoxTabIndex="69"
											FieldLabelText="hx3aotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="25012"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">b. Fragile X</TD>
									<TD>
										<def:datafieldcontrol id="hx3bhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxbhas" FieldTextBoxTabIndex="75"
											FieldLabelText="hx3bhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3botr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxbcmt" FieldTextBoxTabIndex="88"
											FieldLabelText="hx3botr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">c. Tuberous Sclerosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3chas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxchas" FieldTextBoxTabIndex="89"
											FieldLabelText="hx3chas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3cotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxccmt" FieldTextBoxTabIndex="102"
											FieldLabelText="hx3cotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">d. Neurofibromatosis</TD>
									<TD>
										<def:datafieldcontrol id="hx3dhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxdhas" FieldTextBoxTabIndex="103"
											FieldLabelText="hx3dhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3dotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxdcmt" FieldTextBoxTabIndex="116"
											FieldLabelText="hx3dotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">e. Rett Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ehas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxehas" FieldTextBoxTabIndex="117"
											FieldLabelText="hx3ehas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3eotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxecmt" FieldTextBoxTabIndex="130"
											FieldLabelText="hx3eotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">f. Childhood Disintegration Disorder (CDD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3fhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxfhas" FieldTextBoxTabIndex="131"
											FieldLabelText="hx3fhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3fotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxfcmt" FieldTextBoxTabIndex="144"
											FieldLabelText="hx3fotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">g. Prader Willi Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3ghas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxghas" FieldTextBoxTabIndex="145"
											FieldLabelText="hx3ghas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3gotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxgcmt" FieldTextBoxTabIndex="158"
											FieldLabelText="hx3gotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">h. Angelman Syndrome</TD>
									<TD>
										<def:datafieldcontrol id="hx3hhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxhhas" FieldTextBoxTabIndex="159"
											FieldLabelText="hx3hhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3hotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxhcmt" FieldTextBoxTabIndex="172"
											FieldLabelText="hx3hotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">i. Other chromosomal abnormality, disorder or syndrome (please 
										specify)
										<def:datafieldcontrol id="hx3is" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxisp" FieldTextBoxTabIndex="173"
											FieldLabelText="hx3is" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ihas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxihas" FieldTextBoxTabIndex="174"
											FieldLabelText="hx3ihas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3iotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxicmt" FieldTextBoxTabIndex="187"
											FieldLabelText="hx3iotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">j. Congenital rubella</TD>
									<TD>
										<def:datafieldcontrol id="hx3jhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxjhas" FieldTextBoxTabIndex="188"
											FieldLabelText="hx3jhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3jotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxjcmt" FieldTextBoxTabIndex="201"
											FieldLabelText="hx3jotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">k. PKU</TD>
									<TD>
										<def:datafieldcontrol id="hx3khas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxkhas" FieldTextBoxTabIndex="202"
											FieldLabelText="hx3khas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3kotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxkcmt" FieldTextBoxTabIndex="215"
											FieldLabelText="hx3kotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">l. Hydrocephalus (water on the brain)</TD>
									<TD>
										<def:datafieldcontrol id="hx3lhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxlhas" FieldTextBoxTabIndex="216"
											FieldLabelText="hx3lhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3lotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxlcmt" FieldTextBoxTabIndex="229"
											FieldLabelText="hx3lotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">m. Cerebral Palsy</TD>
									<TD>
										<def:datafieldcontrol id="hx3mhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxmhas" FieldTextBoxTabIndex="230"
											FieldLabelText="hx3mhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3motr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxmcmt" FieldTextBoxTabIndex="243"
											FieldLabelText="hx3motr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">n. Mental retardation</TD>
									<TD>
										<def:datafieldcontrol id="hx3nhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxnhas" FieldTextBoxTabIndex="244"
											FieldLabelText="hx3nhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3notr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxncmt" FieldTextBoxTabIndex="257"
											FieldLabelText="hx3notr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">o. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx3ohas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxohas" FieldTextBoxTabIndex="258"
											FieldLabelText="hx3ohas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3ootr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxocmt" FieldTextBoxTabIndex="271"
											FieldLabelText="hx3ootr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">p. Speech delay requiring therapy</TD>
									<TD>
										<def:datafieldcontrol id="hx3phas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxphas" FieldTextBoxTabIndex="272"
											FieldLabelText="hx3phas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3potr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxpcmt" FieldTextBoxTabIndex="285"
											FieldLabelText="hx3potr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">q. Attention Deficit Disorder (ADD)</TD>
									<TD>
										<def:datafieldcontrol id="hx3qhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxqhas" FieldTextBoxTabIndex="286"
											FieldLabelText="hx3qhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3qotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxqcmt" FieldTextBoxTabIndex="299"
											FieldLabelText="hx3qotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">r. Panic or anxiety disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx3rhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxrhas" FieldTextBoxTabIndex="300"
											FieldLabelText="hx3rhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3rotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxrcmt" FieldTextBoxTabIndex="313"
											FieldLabelText="hx3rotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">s. Depression</TD>
									<TD>
										<def:datafieldcontrol id="hx3shas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxshas" FieldTextBoxTabIndex="314"
											FieldLabelText="hx3shas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3sotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxscmt" FieldTextBoxTabIndex="327"
											FieldLabelText="hx3sotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">t. Manic depression/Bipolar</TD>
									<TD>
										<def:datafieldcontrol id="hx3thas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxthas" FieldTextBoxTabIndex="328"
											FieldLabelText="hx3thas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3totr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxtcmt" FieldTextBoxTabIndex="341"
											FieldLabelText="hx3totr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">u. Schizophrenia</TD>
									<TD>
										<def:datafieldcontrol id="hx3uhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxuhas" FieldTextBoxTabIndex="342"
											FieldLabelText="hx3uhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3uotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxucmt" FieldTextBoxTabIndex="355"
											FieldLabelText="hx3uotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">v. Been admitted to a hospital for psychiatric illness</TD>
									<TD>
										<def:datafieldcontrol id="hx3vhas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxvhas" FieldTextBoxTabIndex="356"
											FieldLabelText="hx3vhas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3votr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxvcmt" FieldTextBoxTabIndex="369"
											FieldLabelText="hx3votr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="412">w. Birth defects (e.g., cleft lip or palate, open spine)</TD>
									<TD>
										<def:datafieldcontrol id="hx3whas" runat="server" FieldTextBoxWidth="30px" DatabaseField="hxwhas" FieldTextBoxTabIndex="370"
											FieldLabelText="hx3whas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3wotr" runat="server" FieldTextBoxWidth="150px" DatabaseField="hxwcmt" FieldTextBoxTabIndex="383"
											FieldLabelText="hx3wotr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">3. Assisted Reproductive Technology?</TD>
									<TD>(0=NO, 1=YES)
										<def:datafieldcontrol id="hx3" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3" FieldTextBoxTabIndex="412"
											FieldLabelText="hx3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. Ovulation induction</TD>
									<TD>
										<def:datafieldcontrol id="hx3a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3a" FieldTextBoxTabIndex="412"
											FieldLabelText="hx3a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. In Vitro</TD>
									<TD>
										<def:datafieldcontrol id="hx3b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3b" FieldTextBoxTabIndex="412"
											FieldLabelText="hx3b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. GIFT or ZIFT</TD>
									<TD>
										<def:datafieldcontrol id="hx3c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3c" FieldTextBoxTabIndex="412"
											FieldLabelText="hx3c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Intracytoplasmic sperm injection (ICSI)</TD>
									<TD>
										<def:datafieldcontrol id="hx3d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3d" FieldTextBoxTabIndex="412"
											FieldLabelText="hx3d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Sperm donor</TD>
									<TD>
										<def:datafieldcontrol id="hx3e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3e" FieldTextBoxTabIndex="412"
											FieldLabelText="hx3e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Egg donor</TD>
									<TD>
										<def:datafieldcontrol id="hx3f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3f" FieldTextBoxTabIndex="413"
											FieldLabelText="hx3f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Eggs or embryos frozen</TD>
									<TD>
										<def:datafieldcontrol id="hx3g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3g" FieldTextBoxTabIndex="414"
											FieldLabelText="hx3g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Other (specify)<BR>
										<def:datafieldcontrol id="hx3hs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx3hs" FieldTextBoxTabIndex="415"
											FieldLabelText="hx3hs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx3h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx3h" FieldTextBoxTabIndex="416"
											FieldLabelText="hx3h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">4. At any time in this pregnancy did the mother 
										have any of the following health problems?</TD>
								</TR>
								<TR>
									<TD>a. Fever</TD>
									<TD>(0=NO, 1=YES)
										<def:datafieldcontrol id="hx4a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4a" FieldTextBoxTabIndex="417"
											FieldLabelText="hx4a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx4b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4b" FieldTextBoxTabIndex="418"
											FieldLabelText="hx4b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Viral illness</TD>
									<TD>
										<def:datafieldcontrol id="hx4c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4c" FieldTextBoxTabIndex="419"
											FieldLabelText="hx4c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Diabetes</TD>
									<TD>
										<def:datafieldcontrol id="hx4d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4d" FieldTextBoxTabIndex="420"
											FieldLabelText="hx4d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Preterm labor</TD>
									<TD>
										<def:datafieldcontrol id="hx4e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4e" FieldTextBoxTabIndex="421"
											FieldLabelText="hx4e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other major illness
										<def:datafieldcontrol id="hx4fs" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx4fs" FieldTextBoxTabIndex="422"
											FieldLabelText="hx4fs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx4f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx4f" FieldTextBoxTabIndex="422"
											FieldLabelText="hx4f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">5. In this pregnancy, did the doctor tell you that 
										the<BR>
										baby had any of the following health problems?</TD>
								</TR>
								<TR>
									<TD>a. Screen positive on a blood test</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx5a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5a" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal ultrasound or sonogram (specify)<BR>
										<def:datafieldcontrol id="hx5bs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx5bs" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5bs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx5b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5b" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Abnormality based on results of amniocentesis or CVS (specify)<BR>
										<def:datafieldcontrol id="hx5cs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx5cs" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5cs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx5c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5c" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Other (specify)<BR>
										<def:datafieldcontrol id="hx5ds" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx5ds" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5ds" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx5d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx5d" FieldTextBoxTabIndex="422"
											FieldLabelText="hx5d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">6. In this pregnancy, was the adult child exposed 
										to any of the following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<BR>
										1=Yes<BR>
										2=Not Sure</TD>
									<TD>Comments</TD>
								</TR>
								<TR>
									<TD>a. Antibiotics</TD>
									<TD>
										<def:datafieldcontrol id="hx6a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6a" FieldTextBoxTabIndex="428"
											FieldLabelText="hx6a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6awhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6awhen"
											FieldTextBoxTabIndex="429" FieldLabelText="hx6awhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Medications for Acne</TD>
									<TD>
										<def:datafieldcontrol id="hx6b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6b" FieldTextBoxTabIndex="430"
											FieldLabelText="hx6b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6bwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6bwhen"
											FieldTextBoxTabIndex="431" FieldLabelText="hx6bwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Medications for birth control</TD>
									<TD>
										<def:datafieldcontrol id="hx6c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6c" FieldTextBoxTabIndex="432"
											FieldLabelText="hx6c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6cwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6cwhen"
											FieldTextBoxTabIndex="433" FieldLabelText="hx6cwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Antihypertensives</TD>
									<TD>
										<def:datafieldcontrol id="hx6d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6d" FieldTextBoxTabIndex="434"
											FieldLabelText="hx6d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6dwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6dwhen"
											FieldTextBoxTabIndex="435" FieldLabelText="hx6dwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Meds for heart or cardiac problems</TD>
									<TD>
										<def:datafieldcontrol id="hx6e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6e" FieldTextBoxTabIndex="436"
											FieldLabelText="hx6e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6ewhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6ewhen"
											FieldTextBoxTabIndex="437" FieldLabelText="hx6ewhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Meds for Attention Deficit Disorder</TD>
									<TD>
										<def:datafieldcontrol id="hx6f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6f" FieldTextBoxTabIndex="438"
											FieldLabelText="hx6f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6fwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6fwhen"
											FieldTextBoxTabIndex="439" FieldLabelText="hx6fwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="8557"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Antiepileptics or anti-seizure meds</TD>
									<TD>
										<def:datafieldcontrol id="hx6g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6g" FieldTextBoxTabIndex="440"
											FieldLabelText="hx6g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6gwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6gwhen"
											FieldTextBoxTabIndex="441" FieldLabelText="hx6gwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Meds to control diabetes</TD>
									<TD>
										<def:datafieldcontrol id="hx6h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6h" FieldTextBoxTabIndex="442"
											FieldLabelText="hx6h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6hwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6hwhen"
											FieldTextBoxTabIndex="443" FieldLabelText="hx6hwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Meds to regulate thyroid</TD>
									<TD>
										<def:datafieldcontrol id="hx6i" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6i" FieldTextBoxTabIndex="444"
											FieldLabelText="hx6i" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6iwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6iwhen"
											FieldTextBoxTabIndex="445" FieldLabelText="hx6iwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>j. Antidepressants</TD>
									<TD>
										<def:datafieldcontrol id="hx6j" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6j" FieldTextBoxTabIndex="446"
											FieldLabelText="hx6j" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6jwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6jwhen"
											FieldTextBoxTabIndex="447" FieldLabelText="hx6jwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>k. Mood stabilizers</TD>
									<TD>
										<def:datafieldcontrol id="hx6k" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6k" FieldTextBoxTabIndex="448"
											FieldLabelText="hx6k" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6kwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6kwhen"
											FieldTextBoxTabIndex="449" FieldLabelText="hx6kwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>l. Tranquilizers</TD>
									<TD>
										<def:datafieldcontrol id="hx6l" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6l" FieldTextBoxTabIndex="450"
											FieldLabelText="hx6l" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6lwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6lwhen"
											FieldTextBoxTabIndex="451" FieldLabelText="hx6lwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>m. Pain Killers</TD>
									<TD>
										<def:datafieldcontrol id="hx6m" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6m" FieldTextBoxTabIndex="452"
											FieldLabelText="hx6m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6mwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6mwhen"
											FieldTextBoxTabIndex="453" FieldLabelText="hx6mwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>n. Sedatives or sleeping pills</TD>
									<TD>
										<def:datafieldcontrol id="hx6n" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6n" FieldTextBoxTabIndex="454"
											FieldLabelText="hx6n" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6nwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6nwhen"
											FieldTextBoxTabIndex="455" FieldLabelText="hx6nwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>o. Anti-inflammatory or Anti-immune drugs</TD>
									<TD>
										<def:datafieldcontrol id="hx6o" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6o" FieldTextBoxTabIndex="456"
											FieldLabelText="hx6o" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6owhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6owhen"
											FieldTextBoxTabIndex="457" FieldLabelText="hx6owhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>p. Treatment for HIV</TD>
									<TD>
										<def:datafieldcontrol id="hx6p" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6p" FieldTextBoxTabIndex="458"
											FieldLabelText="hx6p" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6pwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6pwhen"
											FieldTextBoxTabIndex="459" FieldLabelText="hx6pwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Thalidomide (specify why prescribed)<BR>
										<def:datafieldcontrol id="hx6qwhy" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx6qwhy" FieldTextBoxTabIndex="460"
											FieldLabelText="hx6qwhy" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6q" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6q" FieldTextBoxTabIndex="460"
											FieldLabelText="hx6q" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6qwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6qwhen"
											FieldTextBoxTabIndex="461" FieldLabelText="hx6qwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Misoprostol (specify why prescribed)<BR>
										<def:datafieldcontrol id="hx6rwhy" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx6rwhy" FieldTextBoxTabIndex="463"
											FieldLabelText="hx6rwhy" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6r" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6r" FieldTextBoxTabIndex="463"
											FieldLabelText="hx6r" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6rwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6rwhen"
											FieldTextBoxTabIndex="464" FieldLabelText="hx6rwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Other (specify med and why prescribed)<BR>
										<def:datafieldcontrol id="hx6sspec" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx6sspec"
											FieldTextBoxTabIndex="466" FieldLabelText="hx6sspec" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6s" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx6s" FieldTextBoxTabIndex="466"
											FieldLabelText="hx6s" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx6swhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx6swhen"
											FieldTextBoxTabIndex="467" FieldLabelText="hx6swhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">7. In this pregnancy, did you do any of the 
										following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<BR>
										1=Yes</TD>
									<TD>Comments</TD>
								</TR>
								<TR>
									<TD>a. Drink alcohol</TD>
									<TD>
										<def:datafieldcontrol id="hx7a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx7a" FieldTextBoxTabIndex="476"
											FieldLabelText="hx7a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7awhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx7awhen"
											FieldTextBoxTabIndex="477" FieldLabelText="hx7awhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Smoke cigarettes or other tobacco</TD>
									<TD>
										<def:datafieldcontrol id="hx7b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx7b" FieldTextBoxTabIndex="478"
											FieldLabelText="hx7b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx7bwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx7bwhen"
											FieldTextBoxTabIndex="479" FieldLabelText="hx7bwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">8. In this pregnancy did you do any of the 
										following?</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>0=No<BR>
										1=Yes</TD>
									<TD>Comments</TD>
								</TR>
								<TR>
									<TD>a. Smoke marijuana</TD>
									<TD>
										<def:datafieldcontrol id="hx8a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8a" FieldTextBoxTabIndex="480"
											FieldLabelText="hx8a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8awhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8awhen"
											FieldTextBoxTabIndex="481" FieldLabelText="hx8awhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Use Cocaine</TD>
									<TD>
										<def:datafieldcontrol id="hx8b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8b" FieldTextBoxTabIndex="482"
											FieldLabelText="hx8b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8bwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8bwhen"
											FieldTextBoxTabIndex="483" FieldLabelText="hx8bwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Use Heroin</TD>
									<TD>
										<def:datafieldcontrol id="hx8c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8c" FieldTextBoxTabIndex="484"
											FieldLabelText="hx8c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8cwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8cwhen"
											FieldTextBoxTabIndex="485" FieldLabelText="hx8cwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Take Methadone</TD>
									<TD>
										<def:datafieldcontrol id="hx8d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8d" FieldTextBoxTabIndex="486"
											FieldLabelText="hx8d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8dwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8dwhen"
											FieldTextBoxTabIndex="487" FieldLabelText="hx8dwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Take Amphetamines</TD>
									<TD>
										<def:datafieldcontrol id="hx8e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8e" FieldTextBoxTabIndex="488"
											FieldLabelText="hx8e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8ewhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8ewhen"
											FieldTextBoxTabIndex="489" FieldLabelText="hx8ewhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Take Ecstasy</TD>
									<TD>
										<def:datafieldcontrol id="hx8f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8f" FieldTextBoxTabIndex="490"
											FieldLabelText="hx8f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8fwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8fwhen"
											FieldTextBoxTabIndex="491" FieldLabelText="hx8fwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>g. Take Hallucinogens</TD>
									<TD>
										<def:datafieldcontrol id="hx8g" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8g" FieldTextBoxTabIndex="492"
											FieldLabelText="hx8g" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8gwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8gwhen"
											FieldTextBoxTabIndex="493" FieldLabelText="hx8gwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>h. Take inhalants</TD>
									<TD>
										<def:datafieldcontrol id="hx8h" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8h" FieldTextBoxTabIndex="494"
											FieldLabelText="hx8h" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0" DESIGNTIMEDRAGDROP="20847"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8hwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8hwhen"
											FieldTextBoxTabIndex="495" FieldLabelText="hx8hwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>i. Other (specify)<BR>
										<def:datafieldcontrol id="hx8is" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8is" FieldTextBoxTabIndex="496"
											FieldLabelText="hx8is" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8i" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx8i" FieldTextBoxTabIndex="496"
											FieldLabelText="hx8i" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx8iwhen" runat="server" FieldTextBoxWidth="150px" DatabaseField="hx8iwhen"
											FieldTextBoxTabIndex="497" FieldLabelText="hx8iwhen" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>9. Were you given any meds to induce labor?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx9" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx9" FieldTextBoxTabIndex="499"
											FieldLabelText="hx9" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>10. How much did the child weigh at birth?</TD>
									<TD>
										<def:datafieldcontrol id="hx10wtpd" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx10wtpd" FieldTextBoxTabIndex="501"
											FieldLabelText="Pounds" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol>
										<def:datafieldcontrol id="hx10wtoz" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx10wtoz" FieldTextBoxTabIndex="502"
											FieldLabelText="ounces" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">11. Did this child need any of the following during labor?</TD>
									<TD>0=No<BR>
										1=Yes</TD>
								</TR>
								<TR>
									<TD>a. Resuscitation</TD>
									<TD>
										<def:datafieldcontrol id="hx11" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx11" FieldTextBoxTabIndex="505"
											FieldLabelText="hx11a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" height="78">
								<TR>
									<TD class="heading" colSpan="2">12. Did this child stay in the neonatal intensive 
										care unit?<BR>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx12" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12" FieldTextBoxTabIndex="519"
											FieldLabelText="hx12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>a. If yes, how long?</TD>
									<TD>
										<def:datafieldcontrol id="hx12d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12d" FieldTextBoxTabIndex="520"
											FieldLabelText="Days" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol><B>OR
											<def:datafieldcontrol id="hx12hr" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx12hr" FieldTextBoxTabIndex="521"
												FieldLabelText="Hours" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
												IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></B></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">13. How many days or hours did this child stay in hospital?</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx13d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx13d" FieldTextBoxTabIndex="522"
											FieldLabelText="Days" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol><B>OR</B>
										<def:datafieldcontrol id="hx13hr" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx13hr" FieldTextBoxTabIndex="523"
											FieldLabelText="Hours" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">14. Has this child ever had seizures or 
										convulsions?<BR>
										(0=NO,1=YES)
										<def:datafieldcontrol id="hx14" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14" FieldTextBoxTabIndex="524"
											FieldLabelText="hx14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
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
										<def:datafieldcontrol id="hx14a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14a" FieldTextBoxTabIndex="525"
											FieldLabelText="hx14a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Does this child have seizures now?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx14b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14b" FieldTextBoxTabIndex="526"
											FieldLabelText="hx14b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Did the seizures only occur when this child had a fever</TD>
									<TD>
										<def:datafieldcontrol id="hx14c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14c" FieldTextBoxTabIndex="527"
											FieldLabelText="hx14c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Does this child now take meds to control seizures</TD>
									<TD>
										<def:datafieldcontrol id="hx14d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx14d" FieldTextBoxTabIndex="528"
											FieldLabelText="hx14d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">15. Has child ever...</TD>
								</TR>
								<TR>
									<TD>a. Had an abnormal picture of the brain</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx15a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15a" FieldTextBoxTabIndex="529"
											FieldLabelText="hx15a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="30">b. Been hospitalized for meningitis</TD>
									<TD height="30">
										<def:datafieldcontrol id="hx15b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15b" FieldTextBoxTabIndex="530"
											FieldLabelText="hx15b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Lost consciousness due to a head injury</TD>
									<TD>
										<def:datafieldcontrol id="hx15c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx15c" FieldTextBoxTabIndex="531"
											FieldLabelText="hx15c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
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
										<def:datafieldcontrol id="hx15c1y" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" DatabaseField="hx15c1y"
											FieldTextBoxTabIndex="532" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx15c1m" runat="server" FieldTextBoxWidth="40px" DatabaseField="hx15c1m" FieldTextBoxTabIndex="533"
											FieldLabelText="hx15c1m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx15c2y" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" DatabaseField="hx15c2y"
											FieldTextBoxTabIndex="534" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx15c2m" runat="server" FieldTextBoxWidth="40px" DatabaseField="hx15c2m" FieldTextBoxTabIndex="535"
											FieldLabelText="hx15c2m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hx15c3y" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" DatabaseField="hx15c3y"
											FieldTextBoxTabIndex="536" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx15c3m" runat="server" FieldTextBoxWidth="40px" DatabaseField="hx15c3m" FieldTextBoxTabIndex="537"
											FieldLabelText="hx15c3m" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">16. Did your child have any of the following birth 
										defects?</TD>
								</TR>
								<TR>
									<TD>a. Cleft lip of palate</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx16a" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16a" FieldTextBoxTabIndex="538"
											FieldLabelText="hx16a" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>b. Abnormal shape of hands, feet, arms or legs</TD>
									<TD>
										<def:datafieldcontrol id="hx16b" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16b" FieldTextBoxTabIndex="539"
											FieldLabelText="hx16b" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>c. Open spine</TD>
									<TD>
										<def:datafieldcontrol id="hx16c" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16c" FieldTextBoxTabIndex="540"
											FieldLabelText="hx16c" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>d. Heart defect (specify)<BR>
										<def:datafieldcontrol id="hx16ds" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx16ds" FieldTextBoxTabIndex="541"
											FieldLabelText="hx16ds" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16d" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16d" FieldTextBoxTabIndex="541"
											FieldLabelText="hx16d" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>e. Kidney defect (specify)<BR>
										<def:datafieldcontrol id="hx16es" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx16es" FieldTextBoxTabIndex="543"
											FieldLabelText="hx16es" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16e" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16e" FieldTextBoxTabIndex="543"
											FieldLabelText="hx16e" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>f. Other defect (specify)<BR>
										<def:datafieldcontrol id="hx16fs" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx16fs" FieldTextBoxTabIndex="545"
											FieldLabelText="hx16fs" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hx16f" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx16f" FieldTextBoxTabIndex="545"
											FieldLabelText="hx16f" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD width="273">17. Does the child have any other chronic medical problems?</TD>
									<TD>(0=NO,1=YES)
										<def:datafieldcontrol id="hx17" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17" FieldTextBoxTabIndex="547"
											FieldLabelText="hx17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">a. Medical problem #1</TD>
									<TD>
										<def:datafieldcontrol id="hx17apr" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx17apr" FieldTextBoxTabIndex="548"
											FieldLabelText="hx17apr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #1</TD>
									<TD>
										<def:datafieldcontrol id="hx17ah" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17ah" FieldTextBoxTabIndex="549"
											FieldLabelText="hx17ah" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">b. Medical problem #2</TD>
									<TD>
										<def:datafieldcontrol id="hx17bpr" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx17bpr" FieldTextBoxTabIndex="551"
											FieldLabelText="hx17bpr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #2</TD>
									<TD>
										<def:datafieldcontrol id="hx17bh" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17bh" FieldTextBoxTabIndex="552"
											FieldLabelText="hx17bh" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">c. Medical problem #3</TD>
									<TD>
										<def:datafieldcontrol id="hx17cpr" runat="server" FieldTextBoxWidth="200px" DatabaseField="hx17cpr" FieldTextBoxTabIndex="554"
											FieldLabelText="hx17cpr" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="273">1. Was the child hospitalized for #3</TD>
									<TD>
										<def:datafieldcontrol id="hx17ch" runat="server" FieldTextBoxWidth="30px" DatabaseField="hx17ch" FieldTextBoxTabIndex="555"
											FieldLabelText="hx17ch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9,-7,-8,-9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="190"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldLabelWidth="80px" DatabaseField="createdby" FieldTextBoxTabIndex="191"
											FieldLabelText="createdby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="192"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldLabelWidth="80px" DatabaseField="updatedby" FieldTextBoxTabIndex="193"
											FieldLabelText="updatedby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
