<%@ Page language="c#" Inherits="kt_anotb.kt_anotb" CodeFile="anotb.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



		<script language="javascript">
function unselectAB1TRAIN()
{
	unselectField();
	
	if (getFieldValue("<%= AB1TRAIN.ClientID %>") == 0 )
	{

		setFieldValueIfBlank("<%= AB1SSIDE.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB11RV5.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB12RV5.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB13RV12.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB14RV12.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB15OCO.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB15OTR.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB112OCO.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB112OTR.ClientID %>", "-9");
		setFieldValueIfBlank("<%= AB1VLD.ClientID %>", "1");

		setFieldValueIfBlank("<%= AB101.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB102.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB103.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB104.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB105.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB106.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB107.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB108.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB109.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB110.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB111.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB112.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB113.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB114.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB115.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB116.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB117.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB118.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB119.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB120.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB121.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB122.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB123.ClientID %>", "9");
		setFieldValueIfBlank("<%= AB124.ClientID %>", "9");
	}
}
		</script>

						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_anotb" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="A Not B" PrimaryKeyField="anotb_pk"
							VerifiedField="verified" LookupField1DataType="TEXT"  ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"
							AllowedStudyMeasures="351,482,570,587,1732,1776,1836,1861,2053"
							></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="AB1DATE" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="AB1DATE"
										FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="AB1CLIN" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="AB1CLIN"
										FieldTextBoxTabIndex="4" FieldLabelText="Experimenter" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<def:datafieldcontrol id="AB1TRAIN" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Passed Training? (0=Did not pass, 1=Passed, 9=Unknown)"
								FieldTextBoxTabIndex="5" DatabaseField="AB1TRAIN" FieldTextBoxWidth="30px" CallOnBlur="unselectAB1TRAIN"
								ValidList="0,1,9"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="AB1SSIDE" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Start Side (0=Left, 1=Right, 9=Unknown/NA)"
								FieldTextBoxTabIndex="5" DatabaseField="AB1SSIDE" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top" width="151">
										<TABLE class="grid">
											<TR>
												<TD class="heading">0=Incorrect<BR>
													1=Correct<BR>
													9=Missing/No Trial</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1."
														FieldTextBoxTabIndex="23" DatabaseField="AB101" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2."
														FieldTextBoxTabIndex="24" DatabaseField="AB102" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3."
														FieldTextBoxTabIndex="25" DatabaseField="AB103" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4."
														FieldTextBoxTabIndex="26" DatabaseField="AB104" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB105" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5."
														FieldTextBoxTabIndex="27" DatabaseField="AB105" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB106" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6."
														FieldTextBoxTabIndex="28" DatabaseField="AB106" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB107" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7."
														FieldTextBoxTabIndex="29" DatabaseField="AB107" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB108" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8."
														FieldTextBoxTabIndex="30" DatabaseField="AB108" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB109" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9."
														FieldTextBoxTabIndex="31" DatabaseField="AB109" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB110" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10."
														FieldTextBoxTabIndex="32" DatabaseField="AB110" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB111" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11."
														FieldTextBoxTabIndex="33" DatabaseField="AB111" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB112" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12."
														FieldTextBoxTabIndex="34" DatabaseField="AB112" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB113" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13."
														FieldTextBoxTabIndex="35" DatabaseField="AB113" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB114" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14."
														FieldTextBoxTabIndex="36" DatabaseField="AB114" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB115" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15."
														FieldTextBoxTabIndex="37" DatabaseField="AB115" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB116" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16."
														FieldTextBoxTabIndex="38" DatabaseField="AB116" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB117" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17."
														FieldTextBoxTabIndex="39" DatabaseField="AB117" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB118" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18."
														FieldTextBoxTabIndex="40" DatabaseField="AB118" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB119" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19."
														FieldTextBoxTabIndex="41" DatabaseField="AB119" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB120" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20."
														FieldTextBoxTabIndex="42" DatabaseField="AB120" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB121" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21."
														FieldTextBoxTabIndex="43" DatabaseField="AB121" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB122" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22."
														FieldTextBoxTabIndex="44" DatabaseField="AB122" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB123" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23."
														FieldTextBoxTabIndex="45" DatabaseField="AB123" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB124" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24."
														FieldTextBoxTabIndex="46" DatabaseField="AB124" FieldTextBoxWidth="40px" FieldLabelWidth="30px" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top"><SPAN style="COLOR: green">Calculated values are in 
            green</SPAN>
										<TABLE class="grid" height="177">
											<TR>
												<TD class="heading">Reversal Item (Use -9 for missing reversals)</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB11RV5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="First (5 seconds)"
														FieldTextBoxTabIndex="50" DatabaseField="AB11RV5" FieldTextBoxWidth="40px" FieldLabelWidth="150px"
														FieldTextBoxTextDefault="-9" MaxVal="24"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB1REV1C" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB1REV1C"
															FieldTextBoxTabIndex="6" DatabaseField="AB1REV1C" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
											<TR>
												<TD width="311">
													<def:datafieldcontrol id="AB12RV5" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Second (5 seconds)"
														FieldTextBoxTabIndex="51" DatabaseField="AB12RV5" FieldTextBoxWidth="40px" FieldLabelWidth="150px"
														FieldTextBoxTextDefault="-9" MaxVal="24"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB1REV2C" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB1REV2C"
															FieldTextBoxTabIndex="6" DatabaseField="AB1REV2C" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
											<TR>
												<TD width="311">
													<def:datafieldcontrol id="AB13RV12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Third (12 seconds)"
														FieldTextBoxTabIndex="52" DatabaseField="AB13RV12" FieldTextBoxWidth="40px" FieldLabelWidth="150px"
														FieldTextBoxTextDefault="-9" MaxVal="24"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB1REV3C" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB1REV3C"
															FieldTextBoxTabIndex="6" DatabaseField="AB1REV3C" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
											<TR>
												<TD width="311">
													<def:datafieldcontrol id="AB14RV12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Fourth (12 seconds)"
														FieldTextBoxTabIndex="53" DatabaseField="AB14RV12" FieldTextBoxWidth="40px" FieldLabelWidth="150px"
														FieldTextBoxTextDefault="-9" MaxVal="24"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB1REV4C" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB1REV4C"
															FieldTextBoxTabIndex="6" DatabaseField="AB1REV4C" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="815"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
										</TABLE>
                    <BR />
										<TABLE class="grid" height="107">
											<TR>
												<TD class="heading">Trial Confirmation (Use -9 for missing information)</TD>
											</TR>
											<TR>
												<TD>
									      	<def:datafieldcontrol id="AB1DE12C" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="First 12 sec trial:"
														FieldTextBoxTabIndex="53" DatabaseField="AB1DE12C" FieldTextBoxWidth="40px" FieldLabelWidth="150px"
														FieldTextBoxTextDefault="-9" MaxVal="24"></def:datafieldcontrol><SPAN style="COLOR: green">
											      <def:datafieldcontrol id="AB1FS12C" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
												      IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB1FS12C"
												      FieldTextBoxTabIndex="6" DatabaseField="AB1FS12C" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
												      ShowFieldLabel="False"></def:datafieldcontrol>
										      </SPAN>
										    </TD>
										  </TR>
										  <TR>
										    <TD>
									      	<def:datafieldcontrol id="AB1DELASTC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Last trial:"
														FieldTextBoxTabIndex="53" DatabaseField="AB1DELASTC" FieldTextBoxWidth="40px" FieldLabelWidth="150px"
														FieldTextBoxTextDefault="-9" MaxVal="24"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB1LASTC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
												      IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB1LASTC"
												      FieldTextBoxTabIndex="6" DatabaseField="AB1LASTC" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
												      ShowFieldLabel="False"></def:datafieldcontrol>
											  </TD>
											</TR>
									  </TABLE>
									  <BR />
										<TABLE class="grid" height="161">
											<TR>
												<TD width="125">use -9 for missing values
												</TD>
												<TD class="heading" width="79"># Correct</TD>
												<TD class="heading" width="79"># Trials</TD>
												<TD class="heading" width="79">% Correct</TD>
											</TR>
											<TR>
												<TD class="heading" width="125">5 sec-overall</TD>
												<TD width="79">
													<def:datafieldcontrol id="AB15OCO" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB15OCO"
														FieldTextBoxTabIndex="54" DatabaseField="AB15OCO" FieldTextBoxWidth="50px" MaxVal="24" ShowFieldLabel="False"
														DESIGNTIMEDRAGDROP="238"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB15OCC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB15OCC"
															FieldTextBoxTabIndex="6" DatabaseField="AB15OCC" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="884"></def:datafieldcontrol>
													</SPAN></TD>
												<TD>
													<def:datafieldcontrol id="AB15OTR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB15OTR"
														FieldTextBoxTabIndex="55" DatabaseField="AB15OTR" FieldTextBoxWidth="50px" MaxVal="24" RenderReadOnlyAsDiv="False"
														ShowFieldLabel="False" DESIGNTIMEDRAGDROP="117"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB15OTC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB15OTC"
															FieldTextBoxTabIndex="6" DatabaseField="AB15OTC" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="885"></def:datafieldcontrol>
													</SPAN></TD>
												<TD><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB15OPCT" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB15OPCT"
															FieldTextBoxTabIndex="6" DatabaseField="AB15OPCT" FieldTextBoxWidth="30px" FormatString="{0:f}" MaxVal="24"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="24"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
											<TR>
												<TD class="heading" width="125">5 sec-reversals</TD>
												<TD width="79">
													<def:datafieldcontrol id="AB15RCOU" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB15RCOU"
														FieldTextBoxTabIndex="55" DatabaseField="AB15RCOU" FieldTextBoxWidth="50px" MaxVal="24" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB15RCO" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB15RCO"
															FieldTextBoxTabIndex="7" DatabaseField="AB15RCO" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="23" Width="103px"></def:datafieldcontrol>
													</SPAN></TD>
												<TD>
													<def:datafieldcontrol id="AB15RTRU" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB15RTRU"
														FieldTextBoxTabIndex="55" DatabaseField="AB15RTRU" FieldTextBoxWidth="50px" MaxVal="24" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB15RTR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB15RTR"
															FieldTextBoxTabIndex="8" DatabaseField="AB15RTR" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="146"></def:datafieldcontrol>
													</SPAN></TD>
												<TD><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB15RPCT" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB15RPCT"
															FieldTextBoxTabIndex="8" DatabaseField="AB15RPCT" FieldTextBoxWidth="30px" FormatString="{0:f}" MaxVal="24"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
											<TR>
												<TD class="heading" width="125">12 sec-overall</TD>
												<TD width="79">
													<def:datafieldcontrol id="AB112OCO" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB112OCO"
														FieldTextBoxTabIndex="56" DatabaseField="AB112OCO" FieldTextBoxWidth="50px" MaxVal="24" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB112OCC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB112OCC"
															FieldTextBoxTabIndex="6" DatabaseField="AB112OCC" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="886"></def:datafieldcontrol>
													</SPAN></TD>
												<TD>
													<def:datafieldcontrol id="AB112OTR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB112OTR"
														FieldTextBoxTabIndex="57" DatabaseField="AB112OTR" FieldTextBoxWidth="50px" MaxVal="24" RenderReadOnlyAsDiv="False"
														ShowFieldLabel="False" DESIGNTIMEDRAGDROP="153"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB112OTC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB112OTC"
															FieldTextBoxTabIndex="6" DatabaseField="AB112OTC" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
												<TD><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB112OPC" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB112OPC"
															FieldTextBoxTabIndex="10" DatabaseField="AB112OPC" FieldTextBoxWidth="30px" FormatString="{0:f}" MaxVal="24"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
											<TR>
												<TD class="heading" width="125">12 sec-reversals</TD>
												<TD width="79">
													<def:datafieldcontrol id="AB112RCU" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB112RCU"
														FieldTextBoxTabIndex="57" DatabaseField="AB112RCU" FieldTextBoxWidth="50px" MaxVal="24" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB112RCO" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB112RCO"
															FieldTextBoxTabIndex="11" DatabaseField="AB112RCO" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
												<TD>
													<def:datafieldcontrol id="AB112RTU" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="AB112RTU"
														FieldTextBoxTabIndex="57" DatabaseField="AB112RTU" FieldTextBoxWidth="50px" MaxVal="24" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB112RTR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB112RTR"
															FieldTextBoxTabIndex="12" DatabaseField="AB112RTR" FieldTextBoxWidth="30px" MaxVal="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False" DESIGNTIMEDRAGDROP="160"></def:datafieldcontrol>
													</SPAN></TD>
												<TD><SPAN style="COLOR: green">
														<def:datafieldcontrol id="AB112RPC" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
															IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="AB112RPC"
															FieldTextBoxTabIndex="12" DatabaseField="AB112RPC" FieldTextBoxWidth="30px" FormatString="{0:f}" MaxVal="24"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol>
													</SPAN></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="AB1SCMSG" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Status:"
											FieldTextBoxTabIndex="7" DatabaseField="AB1SCMSG" FieldLabelWidth="90px" MaxVal="24" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="True" Width="103px"></def:datafieldcontrol><BR>
										<TABLE class="layout" id="table_entry">
											<TR>
												<TD>
													<def:datafieldcontrol id="AB1VLD" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=Valid, 2=Questionable, 3=Invalid)"
														FieldTextBoxTabIndex="60" DatabaseField="AB1VLD" FieldTextBoxWidth="30px" FieldLabelWidth="150px"
														ValidList="1,2,3"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AB1BCMNT" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
														FieldTextBoxTabIndex="61" DatabaseField="AB1BCMNT" FieldTextBoxWidth="200px" FieldLabelWidth="150px"
														FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid" width="300">
											<TR>
												<TD class="heading">Enter a 1 below to override calculated values.<BR>
													<BR>
													The scoring program will use entered values instead of attempting to calculate 
													them. Enter comments describing what happened.<BR>
													<BR>
													After saving, you must still click the 'SCORE' button.
												</TD>
											</TR>
										</TABLE>
										<BR>
										<def:datafieldcontrol id="overrideScoring" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Override Calculated Values (1=YES, 0=NO)"
											FieldTextBoxTabIndex="61" DatabaseField="overrideScoring" FieldTextBoxWidth="50px" FieldLabelWidth="150px"
											FieldTextBoxTextDefault="0" ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="17" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="18" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="19" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="20" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scored" FieldTextBoxTabIndex="19" DatabaseField="scored"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scoredBy" FieldTextBoxTabIndex="20" DatabaseField="scoredBy"
											FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel>
					</asp:Content>
