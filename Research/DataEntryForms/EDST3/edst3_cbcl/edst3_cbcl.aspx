<%@ Page language="c#" Inherits="edst3_cbcl.edst3_cbcl" CodeFile="edst3_cbcl.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="cb_pk"
							MeasureName="EDST3 CBCL" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" LookupField1="edsid"
							DatabaseTable="edst3_cbcl" StudyMeasID="474"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
										FieldTextBoxTabIndex="2" DatabaseField="edsid" FieldLabelWidth="80px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="cbdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="cbdate" FieldLabelWidth="80px" FieldTextBoxWidth="60px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="cbclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="cbclin" FieldLabelWidth="80px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="cbgrade" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="cbgrade"
											FieldTextBoxTabIndex="5" FieldLabelText="Grade in school (-9=missing)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbnosch" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="cbnosch"
											FieldTextBoxTabIndex="6" FieldLabelText="1=Not Attending School" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbfawork" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="150px" DatabaseField="cbfawork"
											FieldTextBoxTabIndex="7" FieldLabelText="Father's Work" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbmowork" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="150px" DatabaseField="cbmowork"
											FieldTextBoxTabIndex="8" FieldLabelText="Mother's Work" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbgen" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbgen" FieldTextBoxTabIndex="9"
											FieldLabelText="Your Gender (1=Male, 2=Female, 9=Missing)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">1=Biological Parent<BR>
										2=Adoptive Parent<BR>
										3=Step Parent<BR>
										4=Foster Parent<BR>
										5=Grandparent<BR>
										6=Other (specify)<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbrelat" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="150px" DatabaseField="cbrelat"
											FieldTextBoxTabIndex="10" FieldLabelText="Relation to child" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbrelot" runat="server" FieldLabelWidth="70px" DatabaseField="cbrelot" FieldTextBoxTabIndex="11"
											FieldLabelText="Other:" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">I. Sports</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprtn" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="cbsprtn"
											FieldTextBoxTabIndex="12" FieldLabelText="1=None" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
									<TD>1=Less Than Average<BR>
										2=Average<BR>
										3=More Than Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
									<TD>1=Below Average<BR>
										2=Average<BR>
										3=Above Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprta" runat="server" FieldLabelWidth="20px" DatabaseField="cbsprta" FieldTextBoxTabIndex="13"
											FieldLabelText="a." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtat" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbsprtat" FieldTextBoxTabIndex="13"
											FieldLabelText="cbsprtat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtaw" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbsprtaw" FieldTextBoxTabIndex="13"
											FieldLabelText="cbsprtaw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprtb" runat="server" FieldLabelWidth="20px" DatabaseField="cbsprtb" FieldTextBoxTabIndex="14"
											FieldLabelText="b." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtbt" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbsprtbt" FieldTextBoxTabIndex="14"
											FieldLabelText="cbsprtbt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtbw" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbsprtbw" FieldTextBoxTabIndex="14"
											FieldLabelText="cbsprtbw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbsprtc" runat="server" FieldLabelWidth="20px" DatabaseField="cbsprtc" FieldTextBoxTabIndex="15"
											FieldLabelText="c." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtct" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbsprtct" FieldTextBoxTabIndex="15"
											FieldLabelText="cbsprtct" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbsprtcw" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbsprtcw" FieldTextBoxTabIndex="15"
											FieldLabelText="cbsprtcw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">II. Hobbies</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhobn" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="cbhobn"
											FieldTextBoxTabIndex="22" FieldLabelText="1=None" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
									<TD>1=Less Than Average<BR>
										2=Average<BR>
										3=More Than Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
									<TD>1=Below Average<BR>
										2=Average<BR>
										3=Above Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhoba" runat="server" FieldLabelWidth="20px" DatabaseField="cbhoba" FieldTextBoxTabIndex="23"
											FieldLabelText="a." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobat" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbhobat" FieldTextBoxTabIndex="23"
											FieldLabelText="cbhobat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobaw" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbhobaw" FieldTextBoxTabIndex="23"
											FieldLabelText="cbhobaw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhobb" runat="server" FieldLabelWidth="20px" DatabaseField="cbhobb" FieldTextBoxTabIndex="24"
											FieldLabelText="b." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobbt" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbhobbt" FieldTextBoxTabIndex="24"
											FieldLabelText="cbhobbt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobbw" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbhobbw" FieldTextBoxTabIndex="24"
											FieldLabelText="cbhobbw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbhobc" runat="server" FieldLabelWidth="20px" DatabaseField="cbhobc" FieldTextBoxTabIndex="25"
											FieldLabelText="c." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobct" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbhobct" FieldTextBoxTabIndex="25"
											FieldLabelText="cbhobct" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbhobcw" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbhobcw" FieldTextBoxTabIndex="25"
											FieldLabelText="cbhobcw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">III. Organizations</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborgn" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="cborgn"
											FieldTextBoxTabIndex="32" FieldLabelText="1=None" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
									<TD width="141">1= Less Active<BR>
										2=Average<BR>
										3= More Active<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborga" runat="server" FieldLabelWidth="20px" DatabaseField="cborga" FieldTextBoxTabIndex="33"
											FieldLabelText="a." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD width="141">
										<def:datafieldcontrol id="cborgat" runat="server" FieldTextBoxWidth="30px" DatabaseField="cborgat" FieldTextBoxTabIndex="33"
											FieldLabelText="cborgat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborgb" runat="server" FieldLabelWidth="20px" DatabaseField="cborgb" FieldTextBoxTabIndex="34"
											FieldLabelText="b." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD width="141">
										<def:datafieldcontrol id="cborgbt" runat="server" FieldTextBoxWidth="30px" DatabaseField="cborgbt" FieldTextBoxTabIndex="34"
											FieldLabelText="cborgbt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cborgc" runat="server" FieldLabelWidth="20px" DatabaseField="cborgc" FieldTextBoxTabIndex="35"
											FieldLabelText="c." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD width="141">
										<def:datafieldcontrol id="cborgct" runat="server" FieldTextBoxWidth="30px" DatabaseField="cborgct" FieldTextBoxTabIndex="35"
											FieldLabelText="cborgct" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">IV. Jobs</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjobn" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="60px" DatabaseField="cbjobn"
											FieldTextBoxTabIndex="39" FieldLabelText="1=None" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
									<TD>1=Below Average<BR>
										2=Average<BR>
										3=Above Average<BR>
										4=Don't Know<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjoba" runat="server" FieldLabelWidth="20px" DatabaseField="cbjoba" FieldTextBoxTabIndex="40"
											FieldLabelText="a." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbjobat" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbjobat" FieldTextBoxTabIndex="40"
											FieldLabelText="cbjobat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjobb" runat="server" FieldLabelWidth="20px" DatabaseField="cbjobb" FieldTextBoxTabIndex="41"
											FieldLabelText="b." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbjobbt" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbjobbt" FieldTextBoxTabIndex="41"
											FieldLabelText="cbjobbt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbjobc" runat="server" FieldLabelWidth="20px" DatabaseField="cbjobc" FieldTextBoxTabIndex="42"
											FieldLabelText="c." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cbjobct" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbjobct" FieldTextBoxTabIndex="42"
											FieldLabelText="cbjobct" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">V.</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbfrnd" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="cbfrnd"
											FieldTextBoxTabIndex="46" FieldLabelText="1. How many close friends?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>0=none<BR>
										1=1<BR>
										2=2 or 3<BR>
										3=4 or more<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbfrtim" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="cbfrtim"
											FieldTextBoxTabIndex="47" FieldLabelText="2. How many times a week does your child do things with friends? "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,2,3,9"></def:datafieldcontrol></TD>
									<TD>0 = Less Than 1<BR>
										2=1 or 2<BR>
										3 = 3 or more<BR>
										9=Missing</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VI. Compared to others how well does your child:<BR>
										1=Worse<BR>
										2=Average<BR>
										3=Better<BR>
										9=Missing
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbnosib" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbnosib" FieldTextBoxTabIndex="48"
											FieldLabelText="1=Has no brothers or sisters" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbalsib" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbalsib" FieldTextBoxTabIndex="49"
											FieldLabelText="a. Get along with brothers and sisters" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbalkids" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbalkids" FieldTextBoxTabIndex="50"
											FieldLabelText="b. Get along with other kids?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbbehpar" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbbehpar" FieldTextBoxTabIndex="51"
											FieldLabelText="c. Behave with his/her parents?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbplalon" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbplalon" FieldTextBoxTabIndex="52"
											FieldLabelText="d. Play and work alone?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VII. Performance in academic subjects.</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbnoschl" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="cbnoschl"
											FieldTextBoxTabIndex="53" FieldLabelText="1=Does not attend school" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbnoschlr" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="60px" DatabaseField="cbnoschlr"
											FieldTextBoxTabIndex="54" FieldLabelText="because:" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Failing<BR>
										2=Below Average<BR>
										3=Average<BR>
										4=Above Average</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacada" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacada" FieldTextBoxTabIndex="55"
											FieldLabelText="a. Reading, English..." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadb" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacadb" FieldTextBoxTabIndex="56"
											FieldLabelText="b. History or Social Studies" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadc" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacadc" FieldTextBoxTabIndex="57"
											FieldLabelText="c. Arithmetic or Math" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacadd"
											FieldTextBoxTabIndex="57" FieldLabelText="d. Science" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacades" runat="server" FieldLabelWidth="20px" DatabaseField="cbacades" FieldTextBoxTabIndex="58"
											FieldLabelText="e. " IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbacade" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacade" FieldTextBoxTabIndex="59"
											FieldLabelText="cbacade" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadfs" runat="server" FieldLabelWidth="20px" DatabaseField="cbacadfs" FieldTextBoxTabIndex="60"
											FieldLabelText="f. " IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbacadf" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacadf" FieldTextBoxTabIndex="61"
											FieldLabelText="cbacadf" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacadgs" runat="server" FieldLabelWidth="20px" DatabaseField="cbacadgs" FieldTextBoxTabIndex="62"
											FieldLabelText="g." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol>
										<def:datafieldcontrol id="cbacadg" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacadg" FieldTextBoxTabIndex="63"
											FieldLabelText="cbacadg" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbspeced" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbspeced" FieldTextBoxTabIndex="64"
											FieldLabelText="2. Does your child receive special education...? (1=yes, 2=no)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbspeckd" runat="server" FieldTextBoxWidth="200px" DatabaseField="cbspeckd"
											FieldTextBoxTabIndex="65" FieldLabelText="If yes, describe:" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbrepgr" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbrepgr" FieldTextBoxTabIndex="66"
											FieldLabelText="3. Has your child repeated any grades? (1=yes, 2=no)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbrepgrr" runat="server" FieldTextBoxWidth="200px" DatabaseField="cbrepgrr"
											FieldTextBoxTabIndex="67" FieldLabelText="Grade and reasons:" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbacprb" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacprb" FieldTextBoxTabIndex="68"
											FieldLabelText="4. Has your child had any academic or other problems...? (1=yes, 2=no)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacprbd" runat="server" FieldTextBoxWidth="200px" DatabaseField="cbacprbd"
											FieldTextBoxTabIndex="69" FieldLabelText="Describe:" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacprst" runat="server" DatabaseField="cbacprst" FieldTextBoxTabIndex="70"
											FieldLabelText="When did these problems start?" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacpre" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbacpre" FieldTextBoxTabIndex="71"
											FieldLabelText="Have these problems ended? (1=yes, 2=no)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbacprew" runat="server" DatabaseField="cbacprew" FieldTextBoxTabIndex="72"
											FieldLabelText="If yes, when?" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbill" runat="server" FieldTextBoxWidth="30px" DatabaseField="cbill" FieldTextBoxTabIndex="73"
											FieldLabelText="Does your child have any illness...? (1=yes, 2=no)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cbilldes" runat="server" FieldTextBoxWidth="200px" DatabaseField="cbilldes"
											FieldTextBoxTabIndex="74" FieldLabelText="If yes, describe:" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbcncrn" runat="server" FieldTextBoxWidth="200px" DatabaseField="cbcncrn" FieldTextBoxTabIndex="75"
											FieldLabelText="What concerns you most about your child?" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cbbest" runat="server" FieldTextBoxWidth="200px" DatabaseField="cbbest" FieldTextBoxTabIndex="76"
											FieldLabelText="Please describe the best things about your child." IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Not True<BR>
										1=Somewhat or Sometimes True<BR>
										2=Very True or Often True<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb01" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb01" FieldTextBoxTabIndex="78"
											FieldLabelText="1. Acts too young for his/her age" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb02" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb02" FieldTextBoxTabIndex="79"
											FieldLabelText="2. Drinks alcohol without parents' approval" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb02des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb02des" FieldTextBoxTabIndex="80"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="100"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb03" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb03" FieldTextBoxTabIndex="81"
											FieldLabelText="3. Argues a lot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb04" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb04" FieldTextBoxTabIndex="82"
											FieldLabelText="4. Fails to finish things he/she starts" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb05" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb05" FieldTextBoxTabIndex="83"
											FieldLabelText="5. There is very little he/she enjoys" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb06" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb06" FieldTextBoxTabIndex="84"
											FieldLabelText="6. Bowel movements outside toilet" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb07" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb07" FieldTextBoxTabIndex="85"
											FieldLabelText="7. Bragging, boasting" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb08" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb08" FieldTextBoxTabIndex="86"
											FieldLabelText="8. Can't concentrate, can't pay attention for long" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb09" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb09" FieldTextBoxTabIndex="87"
											FieldLabelText="9. Can't get his/her mind off certain thoughts; obsessions" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb09des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb09des" FieldTextBoxTabIndex="88"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb10" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb10" FieldTextBoxTabIndex="89"
											FieldLabelText="10. Can't sit still, restless, or hyperactive" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb11" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb11" FieldTextBoxTabIndex="90"
											FieldLabelText="11. Clings to adults or too dependent" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb12" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb12" FieldTextBoxTabIndex="91"
											FieldLabelText="12. Complains of loneliness" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb13" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb13" FieldTextBoxTabIndex="92"
											FieldLabelText="13. Confused or seems to be in a fog" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb14" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb14" FieldTextBoxTabIndex="93"
											FieldLabelText="14. Cries a lot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb15" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb15" FieldTextBoxTabIndex="94"
											FieldLabelText="15. Cruel to animals" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb16" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb16" FieldTextBoxTabIndex="95"
											FieldLabelText="16. Cruelty, bullying, or meanness to others" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb17" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb17" FieldTextBoxTabIndex="96"
											FieldLabelText="17. Daydreams or gets lost in his/her thoughts" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb18" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb18" FieldTextBoxTabIndex="97"
											FieldLabelText="18. Deliberately harms self or attempts suicide" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb19" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb19" FieldTextBoxTabIndex="98"
											FieldLabelText="19. Demands a lot of attention" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb20" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb20" FieldTextBoxTabIndex="99"
											FieldLabelText="20. Destroys his/her own things" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb21" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb21" FieldTextBoxTabIndex="100"
											FieldLabelText="21. Destroys things belonging to his/her family or others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb22" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb22" FieldTextBoxTabIndex="101"
											FieldLabelText="22. Disobedient at home" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb23" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb23" FieldTextBoxTabIndex="102"
											FieldLabelText="23. Disobedient at school" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb24" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb24" FieldTextBoxTabIndex="103"
											FieldLabelText="24. Doesn't eat well" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb25" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb25" FieldTextBoxTabIndex="104"
											FieldLabelText="25. Doesn't get along with other kids" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb26" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb26" FieldTextBoxTabIndex="105"
											FieldLabelText="26. Doesn't seem to feel guilty after misbehaving" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb27" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb27" FieldTextBoxTabIndex="106"
											FieldLabelText="27. Easily jealous" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb28" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb28" FieldTextBoxTabIndex="107"
											FieldLabelText="28. Breaks rules at home, school, or elsewhere" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb29" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb29" FieldTextBoxTabIndex="108"
											FieldLabelText="29. Fears certain animals, situations, or places, other than school " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb29des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb29des" FieldTextBoxTabIndex="109"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb30" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb30" FieldTextBoxTabIndex="110"
											FieldLabelText="30. Fears going to school" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb31" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb31" FieldTextBoxTabIndex="111"
											FieldLabelText="31. Fears he/she might think or do something bad" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb32" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb32" FieldTextBoxTabIndex="112"
											FieldLabelText="32. Feels he/she has to be perfect" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb33" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb33" FieldTextBoxTabIndex="113"
											FieldLabelText="33. Feels or complains that no one loves him/her" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb34" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb34" FieldTextBoxTabIndex="114"
											FieldLabelText="34. Feels others are out to get him/her" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb35" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb35" FieldTextBoxTabIndex="115"
											FieldLabelText="35. Feels worthless or inferior" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb36" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb36" FieldTextBoxTabIndex="116"
											FieldLabelText="36. Gets hurt a lot, accident-prone" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb37" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb37" FieldTextBoxTabIndex="117"
											FieldLabelText="37. Gets in many fights" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb38" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb38" FieldTextBoxTabIndex="118"
											FieldLabelText="38. Gets teased a lot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb39" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb39" FieldTextBoxTabIndex="119"
											FieldLabelText="39. Hangs around with others who get in trouble" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb40" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb40" FieldTextBoxTabIndex="120"
											FieldLabelText="40. Hears sounds or voices that aren't there" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb40des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb40des" FieldTextBoxTabIndex="121"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb41" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb41" FieldTextBoxTabIndex="122"
											FieldLabelText=" 41. Impulsive or acts without thinking" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb42" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb42" FieldTextBoxTabIndex="123"
											FieldLabelText="42. Would rather be alone than with others" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb43" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb43" FieldTextBoxTabIndex="124"
											FieldLabelText="43. Lying or cheating" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb44" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb44" FieldTextBoxTabIndex="125"
											FieldLabelText="44. Bites fingernails" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb45" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb45" FieldTextBoxTabIndex="126"
											FieldLabelText="45. Nervous, highstrung, or tense" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb46" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb46" FieldTextBoxTabIndex="127"
											FieldLabelText="46. Nervous movements or twitching" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb46des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb46des" FieldTextBoxTabIndex="128"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb47" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb47" FieldTextBoxTabIndex="129"
											FieldLabelText="47. Nightmares" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb48" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb48" FieldTextBoxTabIndex="130"
											FieldLabelText="48. Not liked by other kids" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb49" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb49" FieldTextBoxTabIndex="131"
											FieldLabelText="49. Constipated, doesn't move bowels" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb50" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb50" FieldTextBoxTabIndex="132"
											FieldLabelText="50. Too fearful or anxious" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb51" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb51" FieldTextBoxTabIndex="133"
											FieldLabelText="51. Feels dizzy or lightheaded" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb52" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb52" FieldTextBoxTabIndex="134"
											FieldLabelText="52. Feels too guilty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb53" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb53" FieldTextBoxTabIndex="135"
											FieldLabelText="53. Overeating" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb54" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb54" FieldTextBoxTabIndex="136"
											FieldLabelText="54. Overtired without good reason" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb55" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb55" FieldTextBoxTabIndex="137"
											FieldLabelText="55. Overweight" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56a" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56a" FieldTextBoxTabIndex="138"
											FieldLabelText="a. Aches or pains (not stomach or headaches)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56b" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56b" FieldTextBoxTabIndex="139"
											FieldLabelText="b. Headaches" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56c" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56c" FieldTextBoxTabIndex="140"
											FieldLabelText="c. Nausea, feels sick" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56d" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56d" FieldTextBoxTabIndex="141"
											FieldLabelText="d. Problems with eyes (not if corrected by glasses)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56ddes" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb56ddes"
											FieldTextBoxTabIndex="142" FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56e" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56e" FieldTextBoxTabIndex="143"
											FieldLabelText="e. Rashes or other skin problems" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56f" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56f" FieldTextBoxTabIndex="144"
											FieldLabelText="f. Rashes or other skin problems" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56g" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56g" FieldTextBoxTabIndex="145"
											FieldLabelText="g. Vomiting, throwing up" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56h" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb56h" FieldTextBoxTabIndex="146"
											FieldLabelText="h. Other" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb56hdes" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb56hdes"
											FieldTextBoxTabIndex="147" FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb57" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb57" FieldTextBoxTabIndex="148"
											FieldLabelText="57. Physically attacks people " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb58" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb58" FieldTextBoxTabIndex="149"
											FieldLabelText="58. Picks nose, skin, or other parts of body " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb58des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb58des" FieldTextBoxTabIndex="150"
											FieldLabelText="(describe): " IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb59" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb59" FieldTextBoxTabIndex="151"
											FieldLabelText="59. Plays with own sex parts in public " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb60" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb60" FieldTextBoxTabIndex="152"
											FieldLabelText="60. Plays with own sex parts too much " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb61" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb61" FieldTextBoxTabIndex="153"
											FieldLabelText="61. Poor school work " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb62" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb62" FieldTextBoxTabIndex="154"
											FieldLabelText="62. Poorly coordinated or clumsy " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb63" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb63" FieldTextBoxTabIndex="155"
											FieldLabelText="63. Prefers being with older kids " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb64" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb64" FieldTextBoxTabIndex="156"
											FieldLabelText="64. Prefers being with younger kids " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb65" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb65" FieldTextBoxTabIndex="157"
											FieldLabelText="65. Refuses to talk " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb66" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb66" FieldTextBoxTabIndex="158"
											FieldLabelText="66. Repeats certain acts over and over; compulsions " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb66des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb66des" FieldTextBoxTabIndex="159"
											FieldLabelText="(describe): " IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb67" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb67" FieldTextBoxTabIndex="160"
											FieldLabelText="67. Runs away from home " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb68" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb68" FieldTextBoxTabIndex="161"
											FieldLabelText="68. Screams a lot " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb69" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb69" FieldTextBoxTabIndex="162"
											FieldLabelText="69. Secretive, keeps things to self " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb70" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb70" FieldTextBoxTabIndex="163"
											FieldLabelText="70. Sees things that aren't there (describe):-" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb70des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb70des" FieldTextBoxTabIndex="164"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb71" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb71" FieldTextBoxTabIndex="165"
											FieldLabelText="71. Self-conscious or easily embarrassed " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb72" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb72" FieldTextBoxTabIndex="166"
											FieldLabelText="72. Sets fires " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb73" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb73" FieldTextBoxTabIndex="167"
											FieldLabelText="73. Sexual problems" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb73des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb73des" FieldTextBoxTabIndex="168"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb74" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb74" FieldTextBoxTabIndex="169"
											FieldLabelText="74. Showing off or clowning " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb75" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb75" FieldTextBoxTabIndex="170"
											FieldLabelText="75. Too shy or timid " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb76" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb76" FieldTextBoxTabIndex="171"
											FieldLabelText="76. Sleeps less than most kids " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb77" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb77" FieldTextBoxTabIndex="172"
											FieldLabelText="77. Sleeps more than most kids during day and/or night " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb77des" runat="server" DatabaseField="cb77des" FieldTextBoxTabIndex="173" FieldLabelText="(describe): "
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb78" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb78" FieldTextBoxTabIndex="174"
											FieldLabelText="78. Inattentive or easily distracted " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb79" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb79" FieldTextBoxTabIndex="175"
											FieldLabelText="79. Speech problem" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb79des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb79des" FieldTextBoxTabIndex="176"
											FieldLabelText=" (describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb80" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb80" FieldTextBoxTabIndex="177"
											FieldLabelText="80. Stares blankly " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb81" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb81" FieldTextBoxTabIndex="178"
											FieldLabelText="81. Steals at home " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb82" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb82" FieldTextBoxTabIndex="179"
											FieldLabelText="82. Steals outside the home " IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb83" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb83" FieldTextBoxTabIndex="180"
											FieldLabelText="83. Stores up too many things he/she doesn't need" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb83des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb83des" FieldTextBoxTabIndex="181"
											FieldLabelText="(describe): " IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb84" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb84" FieldTextBoxTabIndex="182"
											FieldLabelText="84. Strange behavior" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb84des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb84des" FieldTextBoxTabIndex="183"
											FieldLabelText=" (describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb85" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb85" FieldTextBoxTabIndex="184"
											FieldLabelText="85. Strange ideas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb85des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb85des" FieldTextBoxTabIndex="185"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb86" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb86" FieldTextBoxTabIndex="186"
											FieldLabelText="86. Stubborn, sullen, or irritable" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb87" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb87" FieldTextBoxTabIndex="187"
											FieldLabelText="87. Sudden changes in mood or feelings" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb88" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb88" FieldTextBoxTabIndex="188"
											FieldLabelText="88. Sulks a lot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb89" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb89" FieldTextBoxTabIndex="189"
											FieldLabelText="89. Suspicious" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb90" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb90" FieldTextBoxTabIndex="190"
											FieldLabelText="90. Swearing or obscene language" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb91" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb91" FieldTextBoxTabIndex="191"
											FieldLabelText="91. Talks about killing self" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb92" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb92" FieldTextBoxTabIndex="192"
											FieldLabelText="92. Talks or walks in sleep" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb92des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb92des" FieldTextBoxTabIndex="193"
											FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb93" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb93" FieldTextBoxTabIndex="194"
											FieldLabelText="93. Talks too much" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb94" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb94" FieldTextBoxTabIndex="195"
											FieldLabelText="94. Teases a lot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb95" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb95" FieldTextBoxTabIndex="196"
											FieldLabelText="95. Temper tantrums or hot temper" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb96" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb96" FieldTextBoxTabIndex="197"
											FieldLabelText="96. Thinks about sex too much" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb97" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb97" FieldTextBoxTabIndex="198"
											FieldLabelText="97. Threatens people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb98" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb98" FieldTextBoxTabIndex="199"
											FieldLabelText="98. Thumb-sucking" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb99" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb99" FieldTextBoxTabIndex="200"
											FieldLabelText="99. Smokes, chews, or sniffs tobacco" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb100" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb100" FieldTextBoxTabIndex="201"
											FieldLabelText="100. Trouble sleeping" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb100des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb100des"
											FieldTextBoxTabIndex="202" FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb101" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb101" FieldTextBoxTabIndex="203"
											FieldLabelText="101. Truancy, skips school" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb102" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb102" FieldTextBoxTabIndex="204"
											FieldLabelText="102. Underactive, slow moving, or lacks energy" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb103" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb103" FieldTextBoxTabIndex="205"
											FieldLabelText="103. Unhappy, sad, or depressed" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb104" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb104" FieldTextBoxTabIndex="206"
											FieldLabelText="104. Unusually loud" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb105" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb105" FieldTextBoxTabIndex="207"
											FieldLabelText="105. Uses drugs for nonmedical purposes (don't include alcohol or tobacco)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb105des" runat="server" FieldTextBoxWidth="200px" DatabaseField="cb105des"
											FieldTextBoxTabIndex="208" FieldLabelText="(describe):" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb106" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb106" FieldTextBoxTabIndex="209"
											FieldLabelText="106. Vandalism" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb107" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb107" FieldTextBoxTabIndex="210"
											FieldLabelText="107. Wets self during the day" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb108" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb108" FieldTextBoxTabIndex="211"
											FieldLabelText="108. Wets the bed" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb109" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb109" FieldTextBoxTabIndex="212"
											FieldLabelText="109. Whining" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb110" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb110" FieldTextBoxTabIndex="213"
											FieldLabelText="110. Wishes to be of opposite sex" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb111" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb111" FieldTextBoxTabIndex="214"
											FieldLabelText="111. Withdrawn, doesn't get involved with others" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb112" runat="server" FieldTextBoxWidth="30px" DatabaseField="cb112" FieldTextBoxTabIndex="215"
											FieldLabelText="112. Worries" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Write in any problems not listed above:</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb113des" runat="server" FieldLabelWidth="40px" DatabaseField="cb113des" FieldTextBoxTabIndex="216"
											FieldLabelText="113 a." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol>
										<def:datafieldcontrol id="cb113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="40px" DatabaseField="cb113"
											FieldTextBoxTabIndex="216" FieldLabelText="Rating:" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb114des" runat="server" FieldLabelWidth="40px" DatabaseField="cb114des" FieldTextBoxTabIndex="218"
											FieldLabelText="113 b." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol>
										<def:datafieldcontrol id="cb114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="40px" DatabaseField="cb114"
											FieldTextBoxTabIndex="218" FieldLabelText="Rating:" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cb115des" runat="server" FieldLabelWidth="40px" DatabaseField="cb115des" FieldTextBoxTabIndex="220"
											FieldLabelText="113 c." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol>
										<def:datafieldcontrol id="cb115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="40px" DatabaseField="cb115"
											FieldTextBoxTabIndex="220" FieldLabelText="Rating:" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="221"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="222"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="223"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="224"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
