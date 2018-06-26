
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.IntHx_EducProg.IntHx_EDSEducProg" CodeFile="IntHx_EDSEducProg.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupColumnHeaders="Measure,ID,Program #,Date"
							LookupColumns="studymeasname,id,epprgnum,epdate{0:d}" DatabaseTable="all_inthx_edseducprog" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="EDS Education Program Description"
							PrimaryKeyField="inthx_ep_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="680,683"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="80px" FieldDataType="TEXT"
										IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID" FieldTextBoxTabIndex="2" DatabaseField="id"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="epprgnum" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="150px" FieldDataType="INT"
										IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Program Number (Same as # on Calendar)"
										FieldTextBoxTabIndex="8" DatabaseField="epprgnum"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server"><BR>
      <TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="epdate" runat="server" DatabaseField="epdate" FieldTextBoxTabIndex="5" FieldLabelText="Date"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epintvwr" runat="server" DatabaseField="epintvwr" FieldTextBoxTabIndex="6" FieldLabelText="Interviewer"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother,2=Father,3=Other,9=Missing/Unknown<BR>
										<def:datafieldcontrol id="epinf" runat="server" DatabaseField="epinf" FieldTextBoxTabIndex="7" FieldLabelText="Informant"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="50px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <H4>B to 3 SERVICES Items</H4>
      <TABLE class="grid">
								<TR>
									<TD>A=Home<BR>
										B=Center<BR>
										C=Other<BR>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" DatabaseField="epplace" FieldTextBoxTabIndex="9"
											FieldLabelText="1. Place Service was delivered" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="200px"
											FieldTextBoxWidth="30px" ValidList="A,a,B,b,C,c" DESIGNTIMEDRAGDROP="3552"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" DatabaseField="epgrsvc" FieldTextBoxTabIndex="9"
											FieldLabelText="2. Did the child receive any group services? (Y, N)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldLabelWidth="200px" FieldTextBoxWidth="30px" ValidList="Y,y,N,n" DESIGNTIMEDRAGDROP="3379"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>If yes: What was the ratio of<BR>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" DatabaseField="epsrata" FieldTextBoxTabIndex="9"
											FieldLabelText="adults" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="50px"
											FieldTextBoxWidth="40px"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" DatabaseField="epsratk" FieldTextBoxTabIndex="9"
											FieldLabelText="to kids" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="50px"
											FieldTextBoxWidth="40px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" DatabaseField="epautsp" FieldTextBoxTabIndex="9"
											FieldLabelText="3. Was this an autism specific service? (Y, N)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldLabelWidth="200px" FieldTextBoxWidth="30px" ValidList="Y,y,N,n"></def:datafieldcontrol><BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" DatabaseField="ephrswk" FieldTextBoxTabIndex="9"
											FieldLabelText="4. How much time was spent working with child and mother together (Hours/Week)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="FLOAT" FieldLabelWidth="200px" FieldTextBoxWidth="40px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <H4>Preschool SERVICES Items</H4>
      <TABLE class="grid">
								<TR>
									<TD>A=General developmental (kids with mixed and special needs)<BR>
										B=Autism specific (only children with autism in class)<BR>
										C=Autism specific with peer models<BR>
										D=Mixed class with general special needs and peer models<BR>
										E=Typical preschool only<BR>
										F=Other<BR>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" DatabaseField="eppstype" FieldTextBoxTabIndex="9"
											FieldLabelText="1. Type of Program" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="200px"
											FieldTextBoxWidth="30px" ValidList="A,a,B,b,C,c,D,d,E,e,F,f" DESIGNTIMEDRAGDROP="3722"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" DatabaseField="epptoth" FieldTextBoxTabIndex="9"
											FieldLabelText="Specify Other:" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px"
											FieldTextBoxWidth="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2. Ratio of staff to students<BR>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" DatabaseField="epstf" FieldTextBoxTabIndex="9"
											FieldLabelText="# staff:" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="50px"
											FieldTextBoxWidth="30px" DESIGNTIMEDRAGDROP="3879"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" DatabaseField="epsnstu" FieldTextBoxTabIndex="9"
											FieldLabelText="# students with special needs:" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="30px" DESIGNTIMEDRAGDROP="3965"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" DatabaseField="eptypstu" FieldTextBoxTabIndex="9"
											FieldLabelText="# typical peer models:" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="30px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>
      <H4>Items from other versions</H4>
      <TABLE class="grid">
								<TR>
									<TD>9=Missing/unknown<BR>
										8=N/A<BR>
										P=Preschool<BR>
										K=Kindergarten<BR>
										1=First Grade<BR>
										2=Second Grade<BR>
										3=Third Grade<BR>
										4=Fourth Grade<BR>
										5=Fifth Grade<BR>
										6=Sixth Grade<BR>
										7=Other (specify below)
										<BR>
										<def:datafieldcontrol id="epgrd" runat="server" DatabaseField="epgrd" FieldTextBoxTabIndex="9" FieldLabelText="1. What is your child's grade level?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="200px" FieldTextBoxWidth="30px" ValidList="0,P,p,K,k,1,2,3,4,5,6,7,8,9"
											DESIGNTIMEDRAGDROP="2965"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="epgrdot" runat="server" DatabaseField="epgrdot" FieldTextBoxTabIndex="9" FieldLabelText="Specify Other:"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="130px" FieldTextBoxWidth="200px"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="epaide" runat="server" DatabaseField="epaide" FieldTextBoxTabIndex="9" FieldLabelText="Personal Aide? (0=N/A, 1=No Aide, 2=Part-Time, 3=Full-Time, 8=N/A, 9=Missing)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="300px" FieldTextBoxWidth="40px" ValidList="0,1,2,3,8,9"></def:datafieldcontrol><BR>
										<BR>
									</TD>
								</TR>
								<TR>
									<TD>1=Regular education only<BR>
										2=Special education only<BR>
										3=Mixed regular education/special education classroom all day<BR>
										4=Part of the day spent in a regular education classroom,<BR>
										part in a special education classroom<BR>
										5=Other (specify below)<BR>
										8=N/A<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="epclstyp" runat="server" DatabaseField="epclstyp" FieldTextBoxTabIndex="10"
											FieldLabelText="2. What type of classroom is your child in?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelWidth="300px" FieldTextBoxWidth="40px" ValidList="1,2,3,4,5,8,9" DESIGNTIMEDRAGDROP="1910"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="epclsoth" runat="server" DatabaseField="epclsoth" FieldTextBoxTabIndex="10"
											FieldLabelText="Specify other:" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px"
											FieldTextBoxWidth="250px" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" DatabaseField="epreghr" FieldTextBoxTabIndex="10"
											FieldLabelText="Hours/day in regular classroom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FieldLabelWidth="200px"
											FieldTextBoxWidth="40px" FormatString="{0:f}"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="epspehr" FieldTextBoxTabIndex="10"
											FieldLabelText="Hours/day in spec-ed classroom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FieldLabelWidth="200px"
											FieldTextBoxWidth="40px" FormatString="{0:f}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE><BR>3. 
      Enter number of staff<BR>
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
											FieldLabelText="epteachf" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="epteachp" runat="server" DatabaseField="epteachp" FieldTextBoxTabIndex="20"
											FieldLabelText="epteachp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Aides</TD>
									<TD>
										<def:datafieldcontrol id="epaidef" runat="server" DatabaseField="epaidef" FieldTextBoxTabIndex="21" FieldLabelText="epaidef"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="20"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="epaidep" runat="server" DatabaseField="epaidep" FieldTextBoxTabIndex="22" FieldLabelText="epaidep"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
<def:datafieldcontrol id="epatot" runat="server" DatabaseField="epatot" FieldTextBoxTabIndex="22" FieldLabelText="Total # Staff"
								IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
								IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" FieldLabelWidth="85px" FieldTextBoxWidth="40px" ShowFieldLabel="True"></def:datafieldcontrol><BR><BR>
      <TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="epspneed" runat="server" DatabaseField="epspneed" FieldTextBoxTabIndex="23"
											FieldLabelText="# Students w/special needs" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"
											FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="eptyp" runat="server" DatabaseField="eptyp" FieldTextBoxTabIndex="24" FieldLabelText="# Typical Peer Models "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px" FieldTextBoxWidth="50px" DESIGNTIMEDRAGDROP="98"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="epstot" runat="server" DatabaseField="epstot" FieldTextBoxTabIndex="24" FieldLabelText="Total # Students"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></TD>
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
