<%@ Page language="c#" Inherits="GenericDataEntryForms.IntHx_EducProg.IntHx_EducProg" CodeFile="IntHx_EducProg.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="677" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="inthx_ep_pk" MeasureName="Education Program Description" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_inthx_educprog" LookupColumns="studymeasname,id,epprgnum,epdate{0:d}"
							LookupColumnHeaders="Measure,ID,Program #,Date"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="2" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="100px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="epprgnum" runat="server" DatabaseField="epprgnum" FieldTextBoxTabIndex="8" FieldLabelText="Program Number (Same as # on Calendar)"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server"><BR>
      <TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="epdate" runat="server" DatabaseField="epdate" FieldTextBoxTabIndex="5" FieldLabelText="Date"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epintvwr" runat="server" DatabaseField="epintvwr" FieldTextBoxTabIndex="6" FieldLabelText="Inerviewer"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother,2=Father,3=Other,9=Missing/Unknown<BR>
										<def:datafieldcontrol id="epinf" runat="server" DatabaseField="epinf" FieldTextBoxTabIndex="7" FieldLabelText="Informant"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="50px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
      <H5>B to 3 Services</H5>
      <TABLE class="grid">
								<TR>
									<TD>1=Home<BR>
										2=Center<BR>
										3=Other (specify)<BR>
										9=Missing/unknown<BR>
										<def:datafieldcontrol id="epplace" runat="server" DatabaseField="epplace" FieldTextBoxTabIndex="9" FieldLabelText="1. Place service was delivered"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="300px" FieldTextBoxWidth="40px" ValidList="1,2,3,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="epplcotr" runat="server" DatabaseField="epplcotr" FieldTextBoxTabIndex="9" FieldLabelText="(specify other)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px" FieldTextBoxWidth="250px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Yes,2=No,9=Missing/Unknown<BR>
										<def:datafieldcontrol id="epgrpsvs" runat="server" DatabaseField="epgrpsvs" FieldTextBoxTabIndex="10"
											FieldLabelText="2. Did your child receive any group services?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelWidth="300px" FieldTextBoxWidth="40px" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>If yes, ratio of staff to students:<BR>
										(-8=N/A<BR>
										-9=Missing/Unknown)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epbteach" runat="server" DatabaseField="epbteach" FieldTextBoxTabIndex="11"
											FieldLabelText="number of teachers" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epbsneed" runat="server" DatabaseField="epbsneed" FieldTextBoxTabIndex="12"
											FieldLabelText="number of students with special needs" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epbpeer" runat="server" DatabaseField="epbpeer" FieldTextBoxTabIndex="13" FieldLabelText="number of typical peer models"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epbaides" runat="server" DatabaseField="epbaides" FieldTextBoxTabIndex="14"
											FieldLabelText="number of full time aides" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epbptaid" runat="server" DatabaseField="epbptaid" FieldTextBoxTabIndex="15"
											FieldLabelText="number of part time aides" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="40px" FieldTextBoxTextDefault="-8"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="epautspec" runat="server" DatabaseField="epautspec" FieldTextBoxTabIndex="16"
											FieldLabelText="3. Was this an autism specific service? (1=Yes,2=No,9=Missing/Unknown)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelWidth="300px" FieldTextBoxWidth="40px" FieldLabelCssClass="fieldlabel"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="eptmomch" runat="server" DatabaseField="eptmomch" FieldTextBoxTabIndex="17"
											FieldLabelText="4. How much time was spent working with mother and child together? (Hrs/Week)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="FLOAT" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <H5>Preschool Services</H5>
      <TABLE class="grid">
								<TR>
									<TD>1=General developmental (kids with a mix of special needs)<BR>
										2=Autism specific (only children with autism in class)<BR>
										3=Autism specific with typically developing peer models<BR>
										4=Mixed class with general special needs and peer models<BR>
										5=Typical preschool<BR>
										6=Other (specify)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="eppstype" runat="server" DatabaseField="eppstype" FieldTextBoxTabIndex="18"
											FieldLabelText="1. Type of Program" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" DatabaseField="epstpotr" FieldTextBoxTabIndex="18"
											FieldLabelText="(specify other)" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px"
											FieldTextBoxWidth="250px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>2. 
      Ratio of staff to students:<BR>
      <TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading"># Full time</TD>
									<TD class="heading"># Part time</TD>
								</TR>
								<TR>
									<TD class="heading">Teachers</TD>
									<TD>
										<def:datafieldcontrol id="epteachf" runat="server" DatabaseField="epteachf" FieldTextBoxTabIndex="19"
											FieldLabelText="epteachf" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="epteachp" runat="server" DatabaseField="epteachp" FieldTextBoxTabIndex="20"
											FieldLabelText="epteachp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Aides</TD>
									<TD>
										<def:datafieldcontrol id="epaidef" runat="server" DatabaseField="epaidef" FieldTextBoxTabIndex="21" FieldLabelText="epaidef"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="epaidep" runat="server" DatabaseField="epaidep" FieldTextBoxTabIndex="22" FieldLabelText="epaidep"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
<def:datafieldcontrol id="eptotstf" runat="server" DatabaseField="eptotstf" FieldTextBoxTabIndex="22"
								FieldLabelText="Total # of staff" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol><BR>
      <TABLE>
								<TR>
									<TD>
										<def:datafieldcontrol id="epspneed" runat="server" DatabaseField="epspneed" FieldTextBoxTabIndex="23"
											FieldLabelText="# Students w/special needs" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="eptyp" runat="server" DatabaseField="eptyp" FieldTextBoxTabIndex="24" FieldLabelText="# Typically developing students "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="eptotstu" runat="server" DatabaseField="eptotstu" FieldTextBoxTabIndex="26"
											FieldLabelText="Total # of students" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="28" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" DatabaseField="createdby" FieldTextBoxTabIndex="29"
											FieldLabelText="createdby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="30" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" DatabaseField="updatedby" FieldTextBoxTabIndex="31"
											FieldLabelText="updatedby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE></asp:panel></asp:Content>
