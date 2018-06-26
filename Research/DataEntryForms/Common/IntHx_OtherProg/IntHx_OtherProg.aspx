<%@ Page language="c#" Inherits="GenericDataEntryForms.IntHx_OtherProg.IntHx_OtherProg" CodeFile="IntHx_OtherProg.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="inthx_op_pk" MeasureName="Other Home Program Description" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_inthx_otherprog" LookupColumns="studymeasname,id,opprgnum,opdate{0:d}"
							AllowedStudyMeasures="679,682,685" LookupColumnHeaders="Measure,ID,Program #,Date"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="opprgnum" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Program Number (Same as # on Calendar)"
										FieldTextBoxTabIndex="8" DatabaseField="opprgnum" FieldTextBoxWidth="40px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<def:datafieldcontrol id="opdate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="opdate"
								FieldTextBoxTabIndex="5" FieldLabelText="Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
								IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="opintvwr" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="opintvwr"
								FieldTextBoxTabIndex="6" FieldLabelText="Interviewer" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="opinf" runat="server" FieldTextBoxWidth="40px" DatabaseField="opinf" FieldTextBoxTabIndex="7"
								FieldLabelText="Informant (1=Mother,2=Father,3=Other,9=Missing/Unknown)" IsDoubleEntryField="True"
								IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol>
							<BR>
							<BR>
							<H5>Characteristics of Supervisor</H5>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>1=Parent<BR>
										2=SLP<BR>
										3=Psychologist<BR>
										4=Educator<BR>
										5=Other<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="opsupvsr" runat="server" FieldTextBoxWidth="40px" DatabaseField="opsupvsr" FieldTextBoxTabIndex="9"
											FieldLabelText="1. Who is supervising this program?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=PhD in related field<BR>
										2=MA in related field<BR>
										3=BA in related field<BR>
										4=Less than BA or degree in unrelated field<BR>
										5=Some specialized training<BR>
										6=Read some books<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="opsuptrn" runat="server" FieldTextBoxWidth="40px" DatabaseField="opsuptrn" FieldTextBoxTabIndex="10"
											FieldLabelText="2.What is the training of the individual?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<H5>Characteristics of Program</H5>
							<TABLE class="grid">
								<TR>
									<TD>1=Developmental Play Therapy<BR>
										2=Options Institute<BR>
										3=Integrated Model<BR>
										4=TEACCH work time<BR>
										5=Other<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="opprchar" runat="server" FieldTextBoxWidth="40px" DatabaseField="opprchar" FieldTextBoxTabIndex="11"
											FieldLabelText="1. Characterize this program" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="opnumhrs" runat="server" FieldTextBoxWidth="40px" DatabaseField="opnumhrs" FieldTextBoxTabIndex="12"
											FieldLabelText="2. Number of hours per week" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=On every drill<BR>
										2=Most of the time<BR>
										3=Infrequently<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="opdattak" runat="server" FieldTextBoxWidth="40px" DatabaseField="opdattak" FieldTextBoxTabIndex="13"
											FieldLabelText="3. How often is data taken?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Systematic<BR>
										2=Non-systematic<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="opgoals" runat="server" FieldTextBoxWidth="40px" DatabaseField="opgoals" FieldTextBoxTabIndex="14"
											FieldLabelText="4. How are goals developed?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Systematic<BR>
										2=Non-systematic<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="opprog" runat="server" FieldTextBoxWidth="40px" DatabaseField="opprog" FieldTextBoxTabIndex="15"
											FieldLabelText="5. How is progress assessed?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="opthrcnt" runat="server" FieldTextBoxWidth="40px" DatabaseField="opthrcnt" FieldTextBoxTabIndex="16"
											FieldLabelText="6. How many therapists provide therapy?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="opthschd" runat="server" FieldTextBoxWidth="40px" DatabaseField="opthschd" FieldTextBoxTabIndex="17"
											FieldLabelText="7.  Do therapists have regular schedules? (1=Yes,2=No,9=Missing/Unknown)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="19"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldLabelWidth="80px" DatabaseField="createdby" FieldTextBoxTabIndex="20"
											FieldLabelText="createdby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="21"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldLabelWidth="80px" DatabaseField="updatedby" FieldTextBoxTabIndex="22"
											FieldLabelText="updatedby" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
