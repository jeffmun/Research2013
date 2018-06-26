<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_distress.tap_distress" CodeFile="tap_distress.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_distress" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP Response to Distress"
							PrimaryKeyField="distress_pk" VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="366"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" FieldLabelWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<br/>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px"
											DatabaseField="testdate" FieldTextBoxTabIndex="3" FieldLabelText="Test Date" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px"
											DatabaseField="testclin" FieldTextBoxTabIndex="3" FieldLabelText="Experimenter" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CODER" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="30px" DatabaseField="CODER"
											FieldTextBoxTabIndex="3" FieldLabelText="Coder" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CoderTxt" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="200px" DatabaseField="CoderTxt"
											FieldTextBoxTabIndex="4" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="30px"
											DatabaseField="STARTC" FieldTextBoxTabIndex="5" FieldLabelText="Starting Condition (0=Distress, 1=Neutral)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,-9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="30px"
											DatabaseField="STARTT" FieldTextBoxTabIndex="6" FieldLabelText="Starting Toy (0=Natural, 1=White)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="14">Distress</TD>
								</TR>
								<TR>
									<TD colSpan="4">ATTENTION</TD>
									<TD bgColor="black"></TD>
									<TD colSpan="4">PLAY</TD>
									<TD bgColor="#000000"></TD>
									<TD colSpan="4">SOCIAL REF</TD>
								</TR>
								<TR>
									<TD>T</TD>
									<TD>E</TD>
									<TD>A</TD>
									<TD>U</TD>
									<TD bgColor="#000000"></TD>
									<TD>A</TD>
									<TD>P</TD>
									<TD>N</TD>
									<TD>U</TD>
									<TD bgColor="#000000"></TD>
									<TD>S</TD>
									<TD>T</TD>
									<TD>N</TD>
									<TD>U</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DATTOY" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DATTOY" FieldTextBoxTabIndex="6" FieldLabelText="T"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DAATEXP" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DAATEXP" FieldTextBoxTabIndex="7" FieldLabelText="E"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DATAWY" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DATAWY" FieldTextBoxTabIndex="8" FieldLabelText="A"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DATUN" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DATUN" FieldTextBoxTabIndex="9" FieldLabelText="U"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD bgColor="#000000"></TD>
									<TD>
										<def:datafieldcontrol id="DPLAACT" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DPLAACT" FieldTextBoxTabIndex="10"
											FieldLabelText="A" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DPLAPAS" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DPLAPAS" FieldTextBoxTabIndex="11"
											FieldLabelText="P" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DPLANO" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DPLANO" FieldTextBoxTabIndex="12" FieldLabelText="N"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DPLAUN" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DPLAUN" FieldTextBoxTabIndex="13" FieldLabelText="U"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD bgColor="#000000"></TD>
									<TD>
										<def:datafieldcontrol id="DSRFSRF" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DSRFSRF" FieldTextBoxTabIndex="14"
											FieldLabelText="S" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DSRFTTP" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DSRFTTP" FieldTextBoxTabIndex="15"
											FieldLabelText="T" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DSRFNO" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DSRFNO" FieldTextBoxTabIndex="16" FieldLabelText="N"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="DSRFUN" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DSRFUN" FieldTextBoxTabIndex="17" FieldLabelText="U"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="14">
										<def:datafieldcontrol id="DHSEC" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DHSEC" FieldTextBoxTabIndex="17" FieldLabelText="Total Half Seconds"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="14">
										<def:datafieldcontrol id="DLATENCY" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DLATENCY" FieldTextBoxTabIndex="17"
											FieldLabelText="Latency" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="14">
										<def:datafieldcontrol id="DCONCERN" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="DCONCERN"
											FieldTextBoxTabIndex="18" FieldLabelText="Overall Concern" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="14">Hum</TD>
								</TR>
								<TR>
									<TD colSpan="4">ATTENTION</TD>
									<TD bgColor="#000000"></TD>
									<TD colSpan="4">PLAY</TD>
									<TD bgColor="#000000"></TD>
									<TD colSpan="4">SOCIAL REF</TD>
								</TR>
								<TR>
									<TD>T</TD>
									<TD>E</TD>
									<TD>A</TD>
									<TD>U</TD>
									<TD bgColor="#000000"></TD>
									<TD>A</TD>
									<TD>P</TD>
									<TD>N</TD>
									<TD>U</TD>
									<TD bgColor="#000000"></TD>
									<TD>S</TD>
									<TD>T</TD>
									<TD>N</TD>
									<TD>U</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="HATTOY" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HATTOY" FieldTextBoxTabIndex="21" FieldLabelText="T"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HAATEXP" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HAATEXP" FieldTextBoxTabIndex="22"
											FieldLabelText="E" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HATAWY" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HATAWY" FieldTextBoxTabIndex="23" FieldLabelText="A"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HATUN" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HATUN" FieldTextBoxTabIndex="24" FieldLabelText="U"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD bgColor="#000000"></TD>
									<TD>
										<def:datafieldcontrol id="HPLAACT" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HPLAACT" FieldTextBoxTabIndex="25"
											FieldLabelText="A" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HPLAPAS" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HPLAPAS" FieldTextBoxTabIndex="26"
											FieldLabelText="P" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HPLANO" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HPLANO" FieldTextBoxTabIndex="27" FieldLabelText="N"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HPLAUN" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HPLAUN" FieldTextBoxTabIndex="28" FieldLabelText="U"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD bgColor="#000000"></TD>
									<TD>
										<def:datafieldcontrol id="HSRFSRF" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HSRFSRF" FieldTextBoxTabIndex="29"
											FieldLabelText="S" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HSRFTTP" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HSRFTTP" FieldTextBoxTabIndex="30"
											FieldLabelText="T" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HSRFNO" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HSRFNO" FieldTextBoxTabIndex="31" FieldLabelText="N"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HSRFUN" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HSRFUN" FieldTextBoxTabIndex="32" FieldLabelText="U"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="14">
										<def:datafieldcontrol id="HHSEC" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HHSEC" FieldTextBoxTabIndex="33" FieldLabelText="Total Half Seconds"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="14">
										<def:datafieldcontrol id="HLATENCY" runat="server" RegExDescription="Must be between 0 and 60 or -9" RegEx="^([0-9]|[1-5][0-9]|60|-9)$"
											FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HLATENCY" FieldTextBoxTabIndex="34"
											FieldLabelText="Latency" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="14">
										<def:datafieldcontrol id="HCONCERN" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="HCONCERN"
											FieldTextBoxTabIndex="34" FieldLabelText="Overall Concern" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,-9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="36"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="37"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="38"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="39"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
