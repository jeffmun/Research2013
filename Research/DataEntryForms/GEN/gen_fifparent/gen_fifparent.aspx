<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="gen_fifparent.gen_fifparent" CodeFile="gen_fifparent.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="fif_pk"
							MeasureName="GEN FIF Parent" LookupTextBox2Visible="False" LookupTextBox1LabelText="GEN ID:" LookupField1="indid"
							DatabaseTable="gen_fifparent" StudyMeasID="286"></def:dataentrycontroller>
						<table class="tblinsert" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="indid" runat="server" DatabaseField="indid" FieldTextBoxTabIndex="2" FieldLabelText="GEN ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="80px" MinVal="0"
										MaxVal="99999"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>0=no info
										<BR>
										1=bio
										<BR>
										2=bio, lives elsewhere
										<BR>
										3=step-parent
										<BR>
										4=adoptive parent
										<BR>
										5=foster parent
										<BR>
										6=step, MH on bio
										<BR>
										7=adoptive, MH on bio
										<BR>
										8=foster, MH on bio
										<BR>
										9=other<BR>
										<def:datafieldcontrol id="FP" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Parent" FieldTextBoxTabIndex="3" DatabaseField="FP" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FPDOB" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Parent DOB" FieldTextBoxTabIndex="4" DatabaseField="FPDOB" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Caucasian
										<BR>
										2=African American
										<BR>
										3=American Indian
										<BR>
										4=Bi-Racial
										<BR>
										5=Other
										<BR>
										6=Eskimo
										<BR>
										7=Hispanic/Latino
										<BR>
										8=Asian/Pac. Islander<BR>
										<def:datafieldcontrol id="FPEth" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Ethnicity" FieldTextBoxTabIndex="5" DatabaseField="FPEth" ValidList="1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=English
										<BR>
										2=Spanish
										<BR>
										3=Other
										<BR>
										<def:datafieldcontrol id="FPLang" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Primary Language" FieldTextBoxTabIndex="6" DatabaseField="FPLang"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=&lt; 7th Grade
										<BR>
										2=Some Jr. High
										<BR>
										3=Some High School
										<BR>
										4=High School
										<BR>
										5=Some College
										<BR>
										6=College Graduate
										<BR>
										7=Graduate Degree<BR>
										<def:datafieldcontrol id="FPEduc" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Education Level" FieldTextBoxTabIndex="7" DatabaseField="FPEduc" ValidList="1,2,3,4,5,6,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FPOcc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Occupation"
											FieldTextBoxTabIndex="8" DatabaseField="FPOcc"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=$0-$25,000
										<BR>
										2=$25,000-$50,000
										<BR>
										3=$75,000-$100,000
										<BR>
										4=$100,000-$250,000
										<BR>
										5=$250,000 or more<BR>
										<def:datafieldcontrol id="FPBval" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Business Value" FieldTextBoxTabIndex="10" DatabaseField="FPBval"
											ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">0=No, 1=Yes 9=Unknown</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FPBioc" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Biological Parent" FieldTextBoxTabIndex="11" DatabaseField="FPBioc" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FPMPP" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Mother's Pregnancy Problems" FieldTextBoxTabIndex="12" DatabaseField="FPMPP" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FPMPFT" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Mother's Pregnancy Full-Term" FieldTextBoxTabIndex="13" DatabaseField="FPMPFT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FPMDELP" runat="server" FieldTextBoxWidth="40px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Mother's Delivery Problems" FieldTextBoxTabIndex="14" DatabaseField="FPMDELP" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="5">0=no, 1=yes, 9=missing/blank</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD width="46">Parent<BR>
										MedHx</TD>
									<TD>Mother's
										<BR>
										MedHx</TD>
									<TD>Father's
										<BR>
										MedHx</TD>
									<TD>Siblings
										<BR>
										MedHx</TD>
								</TR>
								<TR>
									<TD>1.Autism/PDD/Aspergers</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx01" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx01" FieldTextBoxTabIndex="15" DatabaseField="FPMHx01" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx01" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx01" FieldTextBoxTabIndex="53" DatabaseField="FPMMHx01" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx01" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx01" FieldTextBoxTabIndex="91" DatabaseField="FPFMHx01" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx01" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx01" FieldTextBoxTabIndex="129" DatabaseField="FPSMHx01" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2.Social Awkwardness</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx02" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx02" FieldTextBoxTabIndex="16" DatabaseField="FPMHx02" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx02" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx02" FieldTextBoxTabIndex="54" DatabaseField="FPMMHx02" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx02" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx02" FieldTextBoxTabIndex="92" DatabaseField="FPFMHx02" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx02" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx02" FieldTextBoxTabIndex="130" DatabaseField="FPSMHx02" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3.Motor Coordination Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx03" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx03" FieldTextBoxTabIndex="17" DatabaseField="FPMHx03" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx03" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx03" FieldTextBoxTabIndex="55" DatabaseField="FPMMHx03" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx03" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx03" FieldTextBoxTabIndex="93" DatabaseField="FPFMHx03" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx03" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx03" FieldTextBoxTabIndex="131" DatabaseField="FPSMHx03" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4.Tics or other Motor Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx04" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx04" FieldTextBoxTabIndex="18" DatabaseField="FPMHx04" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx04" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx04" FieldTextBoxTabIndex="56" DatabaseField="FPMMHx04" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx04" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx04" FieldTextBoxTabIndex="94" DatabaseField="FPFMHx04" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx04" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx04" FieldTextBoxTabIndex="132" DatabaseField="FPSMHx04" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>5.Mental Retardation</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx05" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx05" FieldTextBoxTabIndex="19" DatabaseField="FPMHx05" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx05" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx05" FieldTextBoxTabIndex="57" DatabaseField="FPMMHx05" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx05" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx05" FieldTextBoxTabIndex="95" DatabaseField="FPFMHx05" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx05" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx05" FieldTextBoxTabIndex="133" DatabaseField="FPSMHx05" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>6.Learning Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx06" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx06" FieldTextBoxTabIndex="20" DatabaseField="FPMHx06" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx06" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx06" FieldTextBoxTabIndex="58" DatabaseField="FPMMHx06" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx06" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx06" FieldTextBoxTabIndex="96" DatabaseField="FPFMHx06" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx06" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx06" FieldTextBoxTabIndex="134" DatabaseField="FPSMHx06" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>7.Special Education</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx07" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx07" FieldTextBoxTabIndex="21" DatabaseField="FPMHx07" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx07" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx07" FieldTextBoxTabIndex="59" DatabaseField="FPMMHx07" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx07" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx07" FieldTextBoxTabIndex="97" DatabaseField="FPFMHx07" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx07" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx07" FieldTextBoxTabIndex="135" DatabaseField="FPSMHx07" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>8.Speech/Language Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx08" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx08" FieldTextBoxTabIndex="22" DatabaseField="FPMHx08" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx08" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx08" FieldTextBoxTabIndex="60" DatabaseField="FPMMHx08" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx08" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx08" FieldTextBoxTabIndex="98" DatabaseField="FPFMHx08" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx08" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx08" FieldTextBoxTabIndex="136" DatabaseField="FPSMHx08" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>9.Vision Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx09" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx09" FieldTextBoxTabIndex="23" DatabaseField="FPMHx09" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx09" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx09" FieldTextBoxTabIndex="61" DatabaseField="FPMMHx09" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx09" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx09" FieldTextBoxTabIndex="99" DatabaseField="FPFMHx09" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx09" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx09" FieldTextBoxTabIndex="137" DatabaseField="FPSMHx09" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>10.Hearing Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx10" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx10" FieldTextBoxTabIndex="24" DatabaseField="FPMHx10" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx10" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx10" FieldTextBoxTabIndex="62" DatabaseField="FPMMHx10" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx10" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx10" FieldTextBoxTabIndex="100" DatabaseField="FPFMHx10" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx10" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx10" FieldTextBoxTabIndex="138" DatabaseField="FPSMHx10" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>11.Attention Problems</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx11" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx11" FieldTextBoxTabIndex="25" DatabaseField="FPMHx11" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx11" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx11" FieldTextBoxTabIndex="63" DatabaseField="FPMMHx11" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx11" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx11" FieldTextBoxTabIndex="101" DatabaseField="FPFMHx11" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx11" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx11" FieldTextBoxTabIndex="139" DatabaseField="FPSMHx11" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>12.Hyperactivity</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx12" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx12" FieldTextBoxTabIndex="26" DatabaseField="FPMHx12" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx12" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx12" FieldTextBoxTabIndex="64" DatabaseField="FPMMHx12" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx12" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx12" FieldTextBoxTabIndex="102" DatabaseField="FPFMHx12" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx12" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx12" FieldTextBoxTabIndex="140" DatabaseField="FPSMHx12" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>13.Neurological Diseases</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx13" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx13" FieldTextBoxTabIndex="27" DatabaseField="FPMHx13" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx13" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx13" FieldTextBoxTabIndex="65" DatabaseField="FPMMHx13" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx13" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx13" FieldTextBoxTabIndex="103" DatabaseField="FPFMHx13" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx13" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx13" FieldTextBoxTabIndex="141" DatabaseField="FPSMHx13" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14.Seizure</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx14" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx14" FieldTextBoxTabIndex="28" DatabaseField="FPMHx14" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx14" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx14" FieldTextBoxTabIndex="66" DatabaseField="FPMMHx14" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx14" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx14" FieldTextBoxTabIndex="104" DatabaseField="FPFMHx14" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx14" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx14" FieldTextBoxTabIndex="142" DatabaseField="FPSMHx14" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15.Epilepsy</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx15" FieldTextBoxTabIndex="29" DatabaseField="FPMHx15" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx15" FieldTextBoxTabIndex="67" DatabaseField="FPMMHx15" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx15" FieldTextBoxTabIndex="105" DatabaseField="FPFMHx15" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx15" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx15" FieldTextBoxTabIndex="143" DatabaseField="FPSMHx15" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16.Fragile X Syndrome</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx16" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx16" FieldTextBoxTabIndex="30" DatabaseField="FPMHx16" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx16" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx16" FieldTextBoxTabIndex="68" DatabaseField="FPMMHx16" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx16" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx16" FieldTextBoxTabIndex="106" DatabaseField="FPFMHx16" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx16" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx16" FieldTextBoxTabIndex="144" DatabaseField="FPSMHx16" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17.Norrie Syndrome</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx17" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx17" FieldTextBoxTabIndex="31" DatabaseField="FPMHx17" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx17" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx17" FieldTextBoxTabIndex="69" DatabaseField="FPMMHx17" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx17" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx17" FieldTextBoxTabIndex="107" DatabaseField="FPFMHx17" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx17" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx17" FieldTextBoxTabIndex="145" DatabaseField="FPSMHx17" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>18.Neurofibromatosis</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx18" FieldTextBoxTabIndex="32" DatabaseField="FPMHx18" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx18" FieldTextBoxTabIndex="70" DatabaseField="FPMMHx18" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx18" FieldTextBoxTabIndex="108" DatabaseField="FPFMHx18" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx18" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx18" FieldTextBoxTabIndex="146" DatabaseField="FPSMHx18" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>19.Tubersous Sclerosis</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx19" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx19" FieldTextBoxTabIndex="33" DatabaseField="FPMHx19" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx19" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx19" FieldTextBoxTabIndex="71" DatabaseField="FPMMHx19" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx19" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx19" FieldTextBoxTabIndex="109" DatabaseField="FPFMHx19" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx19" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx19" FieldTextBoxTabIndex="147" DatabaseField="FPSMHx19" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>20.Phenylketonuria</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx20" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx20" FieldTextBoxTabIndex="34" DatabaseField="FPMHx20" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx20" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx20" FieldTextBoxTabIndex="72" DatabaseField="FPMMHx20" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx20" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx20" FieldTextBoxTabIndex="110" DatabaseField="FPFMHx20" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx20" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx20" FieldTextBoxTabIndex="148" DatabaseField="FPSMHx20" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>21.Any Chromosomal Abnormality</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx21" FieldTextBoxTabIndex="35" DatabaseField="FPMHx21" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx21" FieldTextBoxTabIndex="73" DatabaseField="FPMMHx21" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx21" FieldTextBoxTabIndex="111" DatabaseField="FPFMHx21" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx21" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx21" FieldTextBoxTabIndex="149" DatabaseField="FPSMHx21" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>22.Inherited/Genetic Disorder</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx22" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx22" FieldTextBoxTabIndex="36" DatabaseField="FPMHx22" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx22" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx22" FieldTextBoxTabIndex="74" DatabaseField="FPMMHx22" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx22" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx22" FieldTextBoxTabIndex="112" DatabaseField="FPFMHx22" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx22" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx22" FieldTextBoxTabIndex="150" DatabaseField="FPSMHx22" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>23.Cerebal Palsy</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx23" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx23" FieldTextBoxTabIndex="37" DatabaseField="FPMHx23" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx23" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx23" FieldTextBoxTabIndex="75" DatabaseField="FPMMHx23" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx23" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx23" FieldTextBoxTabIndex="113" DatabaseField="FPFMHx23" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx23" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx23" FieldTextBoxTabIndex="151" DatabaseField="FPSMHx23" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>24.Birth Defects</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx24" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx24" FieldTextBoxTabIndex="38" DatabaseField="FPMHx24" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx24" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx24" FieldTextBoxTabIndex="76" DatabaseField="FPMMHx24" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx24" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx24" FieldTextBoxTabIndex="114" DatabaseField="FPFMHx24" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx24" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx24" FieldTextBoxTabIndex="152" DatabaseField="FPSMHx24" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>25.Major Physical Anomaly</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx25" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx25" FieldTextBoxTabIndex="39" DatabaseField="FPMHx25" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx25" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx25" FieldTextBoxTabIndex="77" DatabaseField="FPMMHx25" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx25" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx25" FieldTextBoxTabIndex="115" DatabaseField="FPFMHx25" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx25" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx25" FieldTextBoxTabIndex="153" DatabaseField="FPSMHx25" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>26.Minor Physical Anomaly</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx26" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx26" FieldTextBoxTabIndex="40" DatabaseField="FPMHx26" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx26" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx26" FieldTextBoxTabIndex="78" DatabaseField="FPMMHx26" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx26" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx26" FieldTextBoxTabIndex="116" DatabaseField="FPFMHx26" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx26" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx26" FieldTextBoxTabIndex="154" DatabaseField="FPSMHx26" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>27.Mental Illness</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx27" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx27" FieldTextBoxTabIndex="41" DatabaseField="FPMHx27" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx27" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx27" FieldTextBoxTabIndex="79" DatabaseField="FPMMHx27" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx27" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx27" FieldTextBoxTabIndex="117" DatabaseField="FPFMHx27" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx27" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx27" FieldTextBoxTabIndex="155" DatabaseField="FPSMHx27" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>28.Tourette Syndrome</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx28" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx28" FieldTextBoxTabIndex="42" DatabaseField="FPMHx28" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx28" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx28" FieldTextBoxTabIndex="80" DatabaseField="FPMMHx28" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx28" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx28" FieldTextBoxTabIndex="118" DatabaseField="FPFMHx28" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx28" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx28" FieldTextBoxTabIndex="156" DatabaseField="FPSMHx28" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>29.Anxiety/Phobias</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx29" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx29" FieldTextBoxTabIndex="43" DatabaseField="FPMHx29" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx29" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx29" FieldTextBoxTabIndex="81" DatabaseField="FPMMHx29" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx29" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx29" FieldTextBoxTabIndex="119" DatabaseField="FPFMHx29" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx29" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx29" FieldTextBoxTabIndex="157" DatabaseField="FPSMHx29" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>30.Obsessive Compulsive Disorder</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx30" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx30" FieldTextBoxTabIndex="44" DatabaseField="FPMHx30" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx30" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx30" FieldTextBoxTabIndex="82" DatabaseField="FPMMHx30" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx30" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx30" FieldTextBoxTabIndex="120" DatabaseField="FPFMHx30" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx30" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx30" FieldTextBoxTabIndex="158" DatabaseField="FPSMHx30" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>31.Suicide</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx31" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx31" FieldTextBoxTabIndex="45" DatabaseField="FPMHx31" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx31" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx31" FieldTextBoxTabIndex="83" DatabaseField="FPMMHx31" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx31" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx31" FieldTextBoxTabIndex="121" DatabaseField="FPFMHx31" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx31" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx31" FieldTextBoxTabIndex="159" DatabaseField="FPSMHx31" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>32.Depression</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx32" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx32" FieldTextBoxTabIndex="46" DatabaseField="FPMHx32" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx32" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx32" FieldTextBoxTabIndex="84" DatabaseField="FPMMHx32" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx32" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx32" FieldTextBoxTabIndex="122" DatabaseField="FPFMHx32" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx32" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx32" FieldTextBoxTabIndex="160" DatabaseField="FPSMHx32" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>33.Manic-Depression</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx33" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx33" FieldTextBoxTabIndex="47" DatabaseField="FPMHx33" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx33" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx33" FieldTextBoxTabIndex="85" DatabaseField="FPMMHx33" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx33" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx33" FieldTextBoxTabIndex="123" DatabaseField="FPFMHx33" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx33" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx33" FieldTextBoxTabIndex="161" DatabaseField="FPSMHx33" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>34.Drug Abuse</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx34" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx34" FieldTextBoxTabIndex="48" DatabaseField="FPMHx34" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx34" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx34" FieldTextBoxTabIndex="86" DatabaseField="FPMMHx34" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx34" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx34" FieldTextBoxTabIndex="124" DatabaseField="FPFMHx34" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx34" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx34" FieldTextBoxTabIndex="162" DatabaseField="FPSMHx34" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>35.Alcoholism</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx35" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx35" FieldTextBoxTabIndex="49" DatabaseField="FPMHx35" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx35" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx35" FieldTextBoxTabIndex="87" DatabaseField="FPMMHx35" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx35" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx35" FieldTextBoxTabIndex="125" DatabaseField="FPFMHx35" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx35" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx35" FieldTextBoxTabIndex="163" DatabaseField="FPSMHx35" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>36.Delinquency</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx36" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx36" FieldTextBoxTabIndex="50" DatabaseField="FPMHx36" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx36" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx36" FieldTextBoxTabIndex="88" DatabaseField="FPMMHx36" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx36" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx36" FieldTextBoxTabIndex="126" DatabaseField="FPFMHx36" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx36" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx36" FieldTextBoxTabIndex="164" DatabaseField="FPSMHx36" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>37.Chronic Illness</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx37" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx37" FieldTextBoxTabIndex="51" DatabaseField="FPMHx37" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx37" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx37" FieldTextBoxTabIndex="89" DatabaseField="FPMMHx37" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx37" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx37" FieldTextBoxTabIndex="127" DatabaseField="FPFMHx37" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx37" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx37" FieldTextBoxTabIndex="165" DatabaseField="FPSMHx37" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>38.Other</TD>
									<TD width="46">
										<def:datafieldcontrol id="FPMHx38" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMHx38" FieldTextBoxTabIndex="52" DatabaseField="FPMHx38" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPMMHx38" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPMMHx38" FieldTextBoxTabIndex="90" DatabaseField="FPMMHx38" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPFMHx38" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPFMHx38" FieldTextBoxTabIndex="128" DatabaseField="FPFMHx38" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="FPSMHx38" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="FPSMHx38" FieldTextBoxTabIndex="166" DatabaseField="FPSMHx38" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1st Pregnancy</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg1yr" runat="server" MaxVal="2999" MinVal="1900" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Year" FieldTextBoxTabIndex="168" DatabaseField="Fprg1yr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg1ln" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length" FieldTextBoxTabIndex="169" DatabaseField="Fprg1ln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg1dif" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Difficulties (0=N, 1=Y, 9=Missing/blank)" FieldTextBoxTabIndex="170"
											DatabaseField="Fprg1dif" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg1lv" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Living (0=N,1=Y,9=Missing/Blank)" FieldTextBoxTabIndex="171"
											DatabaseField="Fprg1lv"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">2nd Pregnancy</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg2yr" runat="server" MaxVal="2999" MinVal="1900" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Year" FieldTextBoxTabIndex="172" DatabaseField="Fprg2yr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg2ln" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length" FieldTextBoxTabIndex="173" DatabaseField="Fprg2ln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg2dif" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Difficulties (0=N, 1=Y, 9=Missing/blank)" FieldTextBoxTabIndex="174"
											DatabaseField="Fprg2dif" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg2lv" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Living (0=N,1=Y,9=Missing/Blank)" FieldTextBoxTabIndex="175"
											DatabaseField="Fprg2lv"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">3rd Pregnancy</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg3yr" runat="server" MaxVal="2999" MinVal="1900" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Year" FieldTextBoxTabIndex="176" DatabaseField="Fprg3yr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg3ln" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length" FieldTextBoxTabIndex="177" DatabaseField="Fprg3ln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg3dif" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Difficulties (0=N, 1=Y, 9=Missing/blank)" FieldTextBoxTabIndex="178"
											DatabaseField="Fprg3dif" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg3lv" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Living (0=N,1=Y,9=Missing/Blank)" FieldTextBoxTabIndex="179"
											DatabaseField="Fprg3lv"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">4th Pregnancy</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg4yr" runat="server" MaxVal="2999" MinVal="1900" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Year" FieldTextBoxTabIndex="180" DatabaseField="Fprg4yr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg4ln" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length" FieldTextBoxTabIndex="181" DatabaseField="Fprg4ln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg4dif" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Difficulties (0=N, 1=Y, 9=Missing/blank)" FieldTextBoxTabIndex="182"
											DatabaseField="Fprg4dif" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg4lv" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Living (0=N,1=Y,9=Missing/Blank)" FieldTextBoxTabIndex="183"
											DatabaseField="Fprg4lv"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">5th Pregnancy</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg5yr" runat="server" MaxVal="2999" MinVal="1900" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Year" FieldTextBoxTabIndex="184" DatabaseField="Fprg5yr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg5ln" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length" FieldTextBoxTabIndex="185" DatabaseField="Fprg5ln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg5dif" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Difficulties (0=N, 1=Y, 9=Missing/blank)" FieldTextBoxTabIndex="186"
											DatabaseField="Fprg5dif" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg5lv" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Living (0=N,1=Y,9=Missing/Blank)" FieldTextBoxTabIndex="187"
											DatabaseField="Fprg5lv"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">6th Pregnancy</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg6yr" runat="server" MaxVal="2999" MinVal="1900" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Year" FieldTextBoxTabIndex="188" DatabaseField="Fprg6yr"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg6ln" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length" FieldTextBoxTabIndex="189" DatabaseField="Fprg6ln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg6dif" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Difficulties (0=N, 1=Y, 9=Missing/blank)" FieldTextBoxTabIndex="190"
											DatabaseField="Fprg6dif" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Fprg6lv" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Living (0=N,1=Y,9=Missing/Blank)" FieldTextBoxTabIndex="191"
											DatabaseField="Fprg6lv"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="192" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="193" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="194" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="195" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
