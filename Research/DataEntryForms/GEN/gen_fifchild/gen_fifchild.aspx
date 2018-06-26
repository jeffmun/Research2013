<%@ Page language="c#" Inherits="gen_fifchild.gen_fifchild" CodeFile="gen_fifchild.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="fif_pk"
							MeasureName="GEN FIF Child" LookupTextBox2Visible="False" LookupTextBox1LabelText="GEN ID:" LookupField1="indid"
							DatabaseTable="gen_fifchild" StudyMeasID="287"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="indid" runat="server" DatabaseField="indid" FieldTextBoxTabIndex="2" FieldLabelText="GEN ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="80px" MinVal="0"
										MaxVal="99999"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<H2>Page 1</H2>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>0=Biological child<BR>
										1=Adopted<BR>
										2=stepchild<BR>
										3=foster child<BR>
										4=other<BR>
										<def:datafieldcontrol id="FC" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Child" FieldTextBoxTabIndex="3" DatabaseField="FC" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCDOB" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="DOB" FieldTextBoxTabIndex="4" DatabaseField="FCDOB" FieldTextBoxMaxLength="50" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>0=Male 1=Female<BR>
										<def:datafieldcontrol id="FCSex" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sex" FieldTextBoxTabIndex="5" DatabaseField="FCSex" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Caucasian<BR>
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
										8=Asian or P. Islander<BR>
										<def:datafieldcontrol id="FCEth" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Ethnicity" FieldTextBoxTabIndex="6" DatabaseField="FCEth" ValidList="1,2,3,4,5,6,7,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Nonverbal
										<BR>
										2=Min. Lang
										<BR>
										3=Verbal<BR>
										<def:datafieldcontrol id="FCLanLev" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Lang.Level" FieldTextBoxTabIndex="7" DatabaseField="FCLanLev" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=English
										<BR>
										2=Spanish
										<BR>
										3=Other<BR>
										<def:datafieldcontrol id="FCLang" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Primary Language" FieldTextBoxTabIndex="8" DatabaseField="FCLang" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>0=NONE
										<BR>
										1=Marijuana
										<BR>
										2=Cocaine
										<BR>
										3=Heroin
										<BR>
										4=Amphet.
										<BR>
										5=Hallucinogens
										<BR>
										6=Other<BR>
										<def:datafieldcontrol id="FCDrgEx" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Drug Exposure in Preg " FieldTextBoxTabIndex="9" DatabaseField="FCDrgEx" ValidList="0,1,2,3,4,5,6"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCDrgamt" runat="server" MaxVal="99" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Amount   " FieldTextBoxTabIndex="10"
											DatabaseField="FCDrgamt"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCDrgdos" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="doses" FieldTextBoxTabIndex="11" DatabaseField="FCDrgdos" ValidList="doses" FieldTextBoxTextDefault="doses"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCDrgtim" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Per (day, week,month,year)" FieldTextBoxTabIndex="12" DatabaseField="FCDrgtim"
											ValidList="day,week,month,year" FieldTextBoxTextDefault="day"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCDrgMo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Exposure: Month of Preg." FieldTextBoxTabIndex="13" DatabaseField="FCDrgMo"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCDrgLM" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="to" FieldTextBoxTabIndex="14" DatabaseField="FCDrgLM" RegExDescription="Must be between 1 and 12"
											RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCAlcEx" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Alcohol Exposure in Preg. (0=No, 1=Yes)" FieldTextBoxTabIndex="15" DatabaseField="FCAlcEx"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCAlcamt" runat="server" MaxVal="99" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Amount" FieldTextBoxTabIndex="16" DatabaseField="FCAlcamt"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCAlcdos" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="drinks" FieldTextBoxTabIndex="17" DatabaseField="FCAlcdos" ValidList="drinks" FieldTextBoxTextDefault="drinks"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCAlctim" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Per (day, week,month,year)" FieldTextBoxTabIndex="18" DatabaseField="FCAlctim"
											ValidList="day,week,month,year" FieldTextBoxTextDefault="day"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCAlcMo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Exposure: Month of Preg." FieldTextBoxTabIndex="19" DatabaseField="FCAlcMo"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCAlcLM" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="to" FieldTextBoxTabIndex="20" DatabaseField="FCAlcLM" RegExDescription="Must be between 1 and 12"
											RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCTobEx" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Tobacco Exposure in Preg. (0=No,1=Yes)" FieldTextBoxTabIndex="21" DatabaseField="FCTobEx"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCTobamt" runat="server" MaxVal="99" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Amount" FieldTextBoxTabIndex="22" DatabaseField="FCTobamt"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCTobdos" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="packs or cigs" FieldTextBoxTabIndex="23" DatabaseField="FCTobdos" ValidList="packs,cigs"
											FieldTextBoxTextDefault="packs"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCTobtim" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Per (day, week,month,year)" FieldTextBoxTabIndex="24" DatabaseField="FCTobtim"
											ValidList="day,week,month,year" FieldTextBoxTextDefault="day"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCTobMo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Exposure: Month of Preg." FieldTextBoxTabIndex="25" DatabaseField="FCTobMo"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCTobLM" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="to" FieldTextBoxTabIndex="26" DatabaseField="FCTobLM" RegExDescription="Must be between 1 and 12"
											RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCXryEx" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="X-ray Exposure in Preg. (0=No,1=Yes)" FieldTextBoxTabIndex="27" DatabaseField="FCXryEx"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCXryamt" runat="server" MaxVal="99" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="# of Xrays" FieldTextBoxTabIndex="28"
											DatabaseField="FCXryamt"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCXryMo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Exposure: Month of Preg." FieldTextBoxTabIndex="29" DatabaseField="FCXryMo"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCXryLM" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="to" FieldTextBoxTabIndex="30" DatabaseField="FCXryLM" RegExDescription="Must be between 1 and 12"
											RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCRxEx" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Prescription Expose in Preg. (0=No,1=Yes)" FieldTextBoxTabIndex="31" DatabaseField="FCRxEx"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCRxamt" runat="server" MaxVal="99" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Amount" FieldTextBoxTabIndex="32" DatabaseField="FCRxamt"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCRxdos" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="doses or mg" FieldTextBoxTabIndex="33" DatabaseField="FCRxdos" ValidList="doses,mg"
											FieldTextBoxTextDefault="doses"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCRxtim" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Per (day, week,month,year)" FieldTextBoxTabIndex="34" DatabaseField="FCRxtim"
											ValidList="day,week,month,year" FieldTextBoxTextDefault="day"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCRxMo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Exposure: Month of Preg." FieldTextBoxTabIndex="35" DatabaseField="FCRxMo"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCRxLM" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="to" FieldTextBoxTabIndex="36" DatabaseField="FCRxLM" RegExDescription="Must be between 1 and 12"
											RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCOthEx" runat="server" FieldTextBoxWidth="50px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Other Exposure in Pregnancy (describe)" FieldTextBoxTabIndex="37"
											DatabaseField="FCOthEx" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCOthamt" runat="server" MaxVal="99" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="# of exposures" FieldTextBoxTabIndex="38"
											DatabaseField="FCOthamt"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCOthMo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Exposure: Month of Preg." FieldTextBoxTabIndex="39" DatabaseField="FCOthMo"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol>
										<def:datafieldcontrol id="FCOthLM" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="to" FieldTextBoxTabIndex="40" DatabaseField="FCOthLM" RegExDescription="Must be between 1 and 12"
											RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<H2>Page 2</H2>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=No<BR>
										1=Yes<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1.Fever" FieldTextBoxTabIndex="41" DatabaseField="FCPro01" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP01FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Fever" FieldTextBoxTabIndex="42" DatabaseField="FCP01FM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP01Lm" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last month Fever" FieldTextBoxTabIndex="43" DatabaseField="FCP01Lm"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2.Flu" FieldTextBoxTabIndex="44" DatabaseField="FCPro02" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP02FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Flu" FieldTextBoxTabIndex="45" DatabaseField="FCP02FM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP02LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Flu" FieldTextBoxTabIndex="46" DatabaseField="FCP02LM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3.Skin Rash" FieldTextBoxTabIndex="47" DatabaseField="FCPro03" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP03FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Skin Rash" FieldTextBoxTabIndex="48" DatabaseField="FCP03FM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP03LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Skin Rash" FieldTextBoxTabIndex="49" DatabaseField="FCP03LM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro04" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4.Spotting/Bleeding" FieldTextBoxTabIndex="50" DatabaseField="FCPro04" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP04FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Spotting/Bleeding" FieldTextBoxTabIndex="51"
											DatabaseField="FCP04FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPO4LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Spotting/Bleeding" FieldTextBoxTabIndex="52"
											DatabaseField="FCPO4LM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro05" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="5.Kidney Infection" FieldTextBoxTabIndex="53" DatabaseField="FCPro05" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP05FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Kidney Infection" FieldTextBoxTabIndex="54"
											DatabaseField="FCP05FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP05LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Kidney Infection" FieldTextBoxTabIndex="55" DatabaseField="FCP05LM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro06" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="6.Vaginal Infection" FieldTextBoxTabIndex="56" DatabaseField="FCPro06" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP06FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First MonthVaginal Infection" FieldTextBoxTabIndex="57"
											DatabaseField="FCP06FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP06LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Vaginal Infection" FieldTextBoxTabIndex="58"
											DatabaseField="FCP06LM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro07" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="7.Other Infection" FieldTextBoxTabIndex="59" DatabaseField="FCPro07" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP07FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Other Infection" FieldTextBoxTabIndex="60" DatabaseField="FCP07FM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP07LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Other Infection" FieldTextBoxTabIndex="61" DatabaseField="FCP07LM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro08" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="8.Generalized Edema" FieldTextBoxTabIndex="62" DatabaseField="FCPro08" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP08FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Generalized Edema" FieldTextBoxTabIndex="63"
											DatabaseField="FCP08FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPO8LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Generalized Edema" FieldTextBoxTabIndex="64"
											DatabaseField="FCPO8LM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro09" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="9.High BP" FieldTextBoxTabIndex="65" DatabaseField="FCPro09" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP09FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month High BP" FieldTextBoxTabIndex="66" DatabaseField="FCP09FM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP09LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month High BP" FieldTextBoxTabIndex="67" DatabaseField="FCP09LM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro10" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10.Psychiatric Treatment" FieldTextBoxTabIndex="68" DatabaseField="FCPro10" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP10FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Psychiatric Treatment" FieldTextBoxTabIndex="69"
											DatabaseField="FCP10FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP10LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Psychiatric Treatment" FieldTextBoxTabIndex="70"
											DatabaseField="FCP10LM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro11" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="11.Maternal Diabetes" FieldTextBoxTabIndex="71" DatabaseField="FCPro11" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP11FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Maternal Diabetes" FieldTextBoxTabIndex="72"
											DatabaseField="FCP11FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP11LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Maternal Diabetes" FieldTextBoxTabIndex="73"
											DatabaseField="FCP11LM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro12" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="12.Gestational Diabetes" FieldTextBoxTabIndex="74" DatabaseField="FCPro12" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP12FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Gestational Diabetes" FieldTextBoxTabIndex="75"
											DatabaseField="FCP12FM"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP12LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Gestational Diabetes" FieldTextBoxTabIndex="76"
											DatabaseField="FCP12LM"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro13" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="13.Proteinuria/Albuminuria" FieldTextBoxTabIndex="77" DatabaseField="FCPro13" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP13FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Proteinuria/Albuminuria" FieldTextBoxTabIndex="78"
											DatabaseField="FCP13FM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP13LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Proteinuria/Albuminuria" FieldTextBoxTabIndex="79"
											DatabaseField="FCP13LM" RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPro14" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="14.Epilepsy" FieldTextBoxTabIndex="80" DatabaseField="FCPro14" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP14FM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="First Month Epilepsy" FieldTextBoxTabIndex="81" DatabaseField="FCP14FM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCP14LM" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Last Month Epilepsy" FieldTextBoxTabIndex="82" DatabaseField="FCP14LM"
											RegExDescription="Must be between 1 and 12" RegEx="^([1-9]|1[0-2])$"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Swelling hands, feet or face" FieldTextBoxTabIndex="83" DatabaseField="FCEx01" ValidList="0,1,9"
											FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="High BP" FieldTextBoxTabIndex="84" DatabaseField="FCEx02" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Dizzy Spells" FieldTextBoxTabIndex="85" DatabaseField="FCEx03" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx04" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Convulsions" FieldTextBoxTabIndex="86" DatabaseField="FCEx04" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx05" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Headaches" FieldTextBoxTabIndex="87" DatabaseField="FCEx05" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx06" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Blurred Vision" FieldTextBoxTabIndex="88" DatabaseField="FCEx06" ValidList="0,1,9"
											FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx07" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Vomiting" FieldTextBoxTabIndex="89" DatabaseField="FCEx07" ValidList="0,1,9" FieldTextBoxTextDefault="0"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCEx08" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Trauma to abdomen " FieldTextBoxTabIndex="90" DatabaseField="FCEx08" ValidList="0,1,9"
											FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCPLeng" runat="server" MaxVal="50" MinVal="0" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pregnancy Length" FieldTextBoxTabIndex="91"
											DatabaseField="FCPLeng" FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMoAge" runat="server" MaxVal="50" MinVal="0" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Mother's Age at Pregnancy" FieldTextBoxTabIndex="92"
											DatabaseField="FCMoAge" FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMwtgn" runat="server" MaxVal="100" MinVal="0" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Mother's Weight Gain" FieldTextBoxTabIndex="93"
											DatabaseField="FCMwtgn" FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCLabLen" runat="server" MaxVal="100" MinVal="0" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length of Labor" FieldTextBoxTabIndex="94"
											DatabaseField="FCLabLen" FieldTextBoxTextDefault="0" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=No<BR>
										1=Yes</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Natural" FieldTextBoxTabIndex="95" DatabaseField="FCBir01" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="C-section" FieldTextBoxTabIndex="96" DatabaseField="FCBir02" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Forceps" FieldTextBoxTabIndex="97" DatabaseField="FCBir03" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir04" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Cord prolapsed/around neck" FieldTextBoxTabIndex="98" DatabaseField="FCBir04" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir05" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Premature rupture of membranes" FieldTextBoxTabIndex="99" DatabaseField="FCBir05"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir06" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Induced labor" FieldTextBoxTabIndex="100" DatabaseField="FCBir06" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir07" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Abnormalities of amniotic fluid" FieldTextBoxTabIndex="101" DatabaseField="FCBir07"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir08" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Breech" FieldTextBoxTabIndex="102" DatabaseField="FCBir08" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir09" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Vacuum extraction" FieldTextBoxTabIndex="103" DatabaseField="FCBir09" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir10" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Epidural anesthesia" FieldTextBoxTabIndex="104" DatabaseField="FCBir10" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir11" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="General anesthesia" FieldTextBoxTabIndex="105" DatabaseField="FCBir11" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir12" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Child severely traumatized" FieldTextBoxTabIndex="106" DatabaseField="FCBir12" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCBir13" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Placenta problems" FieldTextBoxTabIndex="107" DatabaseField="FCBir13" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<H2>Page 3</H2>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="FCCry" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Cry Immediately after birth (0=No,1=Yes, 9=Missing)" FieldTextBoxTabIndex="108" DatabaseField="FCCry"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCApg" runat="server" MaxVal="10" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Apgar Score" FieldTextBoxTabIndex="109"
											DatabaseField="FCApg"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCwt" runat="server" MaxVal="12" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="FLOAT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Birth Weight (pounds)" FieldTextBoxTabIndex="110"
											DatabaseField="FCwt"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCln" runat="server" MaxVal="30" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="FLOAT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length   (inches)" FieldTextBoxTabIndex="111"
											DatabaseField="FCln"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FChc" runat="server" MaxVal="45" MinVal="0" FieldTextBoxWidth="50px" FieldDataType="FLOAT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Head Circumference (cm)" FieldTextBoxTabIndex="112"
											DatabaseField="FChc"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=No<BR>
										1=Yes</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Respitory distress" FieldTextBoxTabIndex="113" DatabaseField="FCInf01" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Resuscitation required" FieldTextBoxTabIndex="114" DatabaseField="FCInf02" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Septicemia/meningitis" FieldTextBoxTabIndex="115" DatabaseField="FCInf03" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf04" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Hyperbilirubinemia (jaundice)" FieldTextBoxTabIndex="116" DatabaseField="FCInf04"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf05" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Oxygen Treatment" FieldTextBoxTabIndex="117" DatabaseField="FCInf05" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf06" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Physical Anomaly" FieldTextBoxTabIndex="118" DatabaseField="FCInf06" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf07" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="RH incompatibility" FieldTextBoxTabIndex="119" DatabaseField="FCInf07" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf08" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Anemia requiring transfusion" FieldTextBoxTabIndex="120" DatabaseField="FCInf08" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf09" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Low neonatal heart rate" FieldTextBoxTabIndex="121" DatabaseField="FCInf09" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf10" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Irritable infant, floppy infant" FieldTextBoxTabIndex="122" DatabaseField="FCInf10"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf11" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Difficulties regulating temperature" FieldTextBoxTabIndex="123" DatabaseField="FCInf11"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf12" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Convulsions" FieldTextBoxTabIndex="124" DatabaseField="FCInf12" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf13" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Phototherapy used" FieldTextBoxTabIndex="125" DatabaseField="FCInf13" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCInf14" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Clinical Dysmaturity" FieldTextBoxTabIndex="126" DatabaseField="FCInf14" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMhos" runat="server" MaxVal="30" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length of Mother's Hospital Stay" FieldTextBoxTabIndex="127"
											DatabaseField="FCMhos"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCChos" runat="server" MaxVal="72" MinVal="1" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Length of Child's Hospital Stay" FieldTextBoxTabIndex="128"
											DatabaseField="FCChos"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCHospro" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Noted problems at hospital" FieldTextBoxTabIndex="129" DatabaseField="FCHospro"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<H2>Page 4</H2>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=No<BR>
										1=Yes<BR>
										9=Unknown</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1.Autism/PDD/Aspergers" FieldTextBoxTabIndex="130" DatabaseField="FCMHx01" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2.Social Awkwardness" FieldTextBoxTabIndex="131" DatabaseField="FCMHx02" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3.Motor Coordination Problems" FieldTextBoxTabIndex="132" DatabaseField="FCMHx03"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx04" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4.Tics or other Motor Problems" FieldTextBoxTabIndex="133" DatabaseField="FCMHx04"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx05" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="5.Mental Retardation" FieldTextBoxTabIndex="134" DatabaseField="FCMHx05" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx06" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="6.Learning Problems" FieldTextBoxTabIndex="135" DatabaseField="FCMHx06" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx07" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="7.Special Education" FieldTextBoxTabIndex="136" DatabaseField="FCMHx07" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx08" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="8.Speech/Language Problems" FieldTextBoxTabIndex="137" DatabaseField="FCMHx08" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx09" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="9.Vision Problems" FieldTextBoxTabIndex="138" DatabaseField="FCMHx09" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx10" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10.Hearing Problems" FieldTextBoxTabIndex="139" DatabaseField="FCMHx10" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx11" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="11.Attention Problems" FieldTextBoxTabIndex="140" DatabaseField="FCMHx11" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx12" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="12.Hyperactivity" FieldTextBoxTabIndex="141" DatabaseField="FCMHx12" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx13" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="13.Neurological Diseases" FieldTextBoxTabIndex="142" DatabaseField="FCMHx13" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx14" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="14.Seizures" FieldTextBoxTabIndex="143" DatabaseField="FCMHx14" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx15" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="15.Epilepsy" FieldTextBoxTabIndex="144" DatabaseField="FCMHx15" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx16" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="16.Fragile X Syndrome" FieldTextBoxTabIndex="145" DatabaseField="FCMHx16" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx17" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="17.Norrie Syndrome" FieldTextBoxTabIndex="146" DatabaseField="FCMHx17" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx18" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="18.Neurofibromatosis" FieldTextBoxTabIndex="147" DatabaseField="FCMHx18" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx19" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="19.Tubersous Sclerosis" FieldTextBoxTabIndex="148" DatabaseField="FCMHx19" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx20" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="20.Phenylketonuria" FieldTextBoxTabIndex="149" DatabaseField="FCMHx20" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx21" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="21.Any Chromosomal Abnormality" FieldTextBoxTabIndex="150" DatabaseField="FCMHx21"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx22" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="22.Inherited/Genetic Disorder" FieldTextBoxTabIndex="151" DatabaseField="FCMHx22"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx23" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="23.Cerebal Palsy" FieldTextBoxTabIndex="152" DatabaseField="FCMHx23" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx24" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="24.Birth Defects" FieldTextBoxTabIndex="153" DatabaseField="FCMHx24" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx25" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="25.Major Physical Anomaly" FieldTextBoxTabIndex="154" DatabaseField="FCMHx25" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx26" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="26.Minor Physical Anomaly" FieldTextBoxTabIndex="155" DatabaseField="FCMHx26" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx27" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="27.Mental Illness" FieldTextBoxTabIndex="156" DatabaseField="FCMHx27" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx28" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="28.Tourette Syndrome" FieldTextBoxTabIndex="157" DatabaseField="FCMHx28" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx29" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="29.Anxiety/Phobias" FieldTextBoxTabIndex="158" DatabaseField="FCMHx29" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx30" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="30.Obsessive Compulsive Disorder" FieldTextBoxTabIndex="159" DatabaseField="FCMHx30"
											ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx31" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="31.Suicide" FieldTextBoxTabIndex="160" DatabaseField="FCMHx31" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx32" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="32.Depression" FieldTextBoxTabIndex="161" DatabaseField="FCMHx32" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx33" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="33.Manic-Depression" FieldTextBoxTabIndex="162" DatabaseField="FCMHx33" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx34" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="34.Drug Abuse" FieldTextBoxTabIndex="163" DatabaseField="FCMHx34" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx35" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="35.Alcoholism" FieldTextBoxTabIndex="164" DatabaseField="FCMHx35" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx36" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="36.Delinquency" FieldTextBoxTabIndex="165" DatabaseField="FCMHx36" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx37" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="37.Chronic Illness" FieldTextBoxTabIndex="166" DatabaseField="FCMHx37" ValidList="0,1,9"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="FCMHx38" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="38.Other" FieldTextBoxTabIndex="167" DatabaseField="FCMHx38" ValidList="0,1,9" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="169" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="170" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="171" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="172" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
