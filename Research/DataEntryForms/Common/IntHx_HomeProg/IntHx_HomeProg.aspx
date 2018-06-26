
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.IntHx_HomeProg.IntHx_HomeProg" CodeFile="IntHx_HomeProg.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="inthx_hp_pk" MeasureName="Home Program Description" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_inthx_homeprog" LookupColumns="studymeasname,id,hpprgnum,hpdate{0:d}"
							AllowedStudyMeasures="678,681,684" LookupColumnHeaders="Measure,ID,Program #,Date"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="hpprgnum" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Program Number (Same as # on Calendar)"
										FieldTextBoxTabIndex="8" DatabaseField="hpprgnum" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<def:datafieldcontrol id="hpdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="hpdate"
								FieldTextBoxTabIndex="5" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
								IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="hpintvwr" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="hpintvwr"
								FieldTextBoxTabIndex="6" FieldLabelText="Interviewer" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="hpinf" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="300px" DatabaseField="hpinf"
								FieldTextBoxTabIndex="7" FieldLabelText="Informant (1=Mother,2=Father,3=Other,9=Missing/Unknown)"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
								IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol>
							<BR>
							<BR>
							<H4>ABA</H4>
							<H5>Characteristics of Supervisor</H5>
							<STRONG>(Use -9 for missing values)</STRONG>
							<TABLE class="grid">
								<TR>
									<TD>1=Private consultant (specify)<BR>
										2=PACE<BR>
										3=Parent<BR>
										4=Other (specify)<BR>
										<def:datafieldcontrol id="hpsupvs" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpsupvs" FieldTextBoxTabIndex="9"
											FieldLabelText="1. Who is supervising this program?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,-9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="hpsupprv" runat="server" FieldTextBoxWidth="200px" DatabaseField="hpsupprv"
											FieldTextBoxTabIndex="10" FieldLabelText="(specify private consultant)" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="hpsupoth" runat="server" FieldTextBoxWidth="200px" DatabaseField="hpsupoth"
											FieldTextBoxTabIndex="11" FieldLabelText="(specify other)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=ABA institute for at least 1 year<BR>
										2=Less than 1 year from specialized training institute<BR>
										3=On the job training from someone with qualifications as in #1<BR>
										4=Some training from any program<BR>
										5=Reading books<BR>
										<def:datafieldcontrol id="hpsuptrn" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpsuptrn" FieldTextBoxTabIndex="12"
											FieldLabelText="2. Training of supervisor (Enter all that apply seperated by commas)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Under BA<BR>
										2=BA in related field<BR>
										3=MA/MS in related field<BR>
										4=PhD in related field<BR>
										<def:datafieldcontrol id="hpsupedu" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpsupedu" FieldTextBoxTabIndex="13"
											FieldLabelText="3. Education of supervisor" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<H5>Characteristics of Program</H5>
							<STRONG>(Use -9 for missing values)</STRONG>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="hp1to1hr" runat="server" FieldTextBoxWidth="40px" DatabaseField="hp1to1hr" FieldTextBoxTabIndex="14"
											FieldLabelText="1. How many hours/week does your child spend in 1 to 1 drill work?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=On every drill<BR>
										2=Most of the time<BR>
										3=Infrequently<BR>
										<def:datafieldcontrol id="hpdatcol" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpdatcol" FieldTextBoxTabIndex="15"
											FieldLabelText="2. How often is data collected?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hpdatana" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpdatana" FieldTextBoxTabIndex="16"
											FieldLabelText="3. How often is data analyzed per month?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hptmmeet" runat="server" FieldTextBoxWidth="40px" DatabaseField="hptmmeet" FieldTextBoxTabIndex="17"
											FieldLabelText="4. How often does the whole team meet with the supervisor per month?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" DESIGNTIMEDRAGDROP="20"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hpthrcnt" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpthrcnt" FieldTextBoxTabIndex="18"
											FieldLabelText="5. How many therapists work with your child" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hpregsch" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpregsch" FieldTextBoxTabIndex="19"
											FieldLabelText="6. Do they generally have a regular weekly schedule? (1=Yes,2=No)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hpvissup" runat="server" FieldTextBoxWidth="40px" DatabaseField="hpvissup" FieldTextBoxTabIndex="20"
											FieldLabelText="7. Are visual supports used? (1=Yes,2=No)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="22"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldLabelWidth="80px" DatabaseField="createdby" FieldTextBoxTabIndex="23"
											FieldLabelText="createdby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="24"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldLabelWidth="80px" DatabaseField="updatedby" FieldTextBoxTabIndex="25"
											FieldLabelText="updatedby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel></asp:Content>
