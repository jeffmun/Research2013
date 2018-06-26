<%@ Page language="c#" Inherits="KTDissDataEntryForms.kt_mcdiwg.kt_mcdiwg" CodeFile="mcdiwg.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_mcdiwg" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="MCDI: Words and Gestures"
							PrimaryKeyField="mcdiwg_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="576"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="mcdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="mcdate" FormatString="{0:d}" FieldTextBoxWidth="80px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<H3>PART I EARLY WORDS</H3>
							<TABLE class="grid">
								<TR>
									<TD class="heading">A. FIRST SIGNS OF UNDERSTANDING (1=Yes, 0= No, 9=Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc1a01" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc1a01"
											FieldTextBoxTabIndex="4" FieldLabelText="1. Respond when name is called (e.g., by turning and looking at source)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc1a02" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc1a02"
											FieldTextBoxTabIndex="5" FieldLabelText="2. Respond to 'no no' (by stopping what he/she is doing, at least for a moment)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc1a03" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc1a03"
											FieldTextBoxTabIndex="6" FieldLabelText="3. React to 'there's mommy/daddy' by looking around for them."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">B. PHRASES (1= marked)</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b01" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b01"
														FieldTextBoxTabIndex="7" FieldLabelText="Are you hungry?" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b02" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b02"
														FieldTextBoxTabIndex="8" FieldLabelText="Are you tired/sleepy?" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b03" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b03"
														FieldTextBoxTabIndex="9" FieldLabelText="Be careful." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b04" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b04"
														FieldTextBoxTabIndex="10" FieldLabelText="Be quiet." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b05" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b05"
														FieldTextBoxTabIndex="11" FieldLabelText="Clap your hands." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b06" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b06"
														FieldTextBoxTabIndex="12" FieldLabelText="Change diaper." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b07" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b07"
														FieldTextBoxTabIndex="13" FieldLabelText="Come here/come on." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b08" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b08"
														FieldTextBoxTabIndex="14" FieldLabelText="Daddy's/mommy's home." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b09" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b09"
														FieldTextBoxTabIndex="15" FieldLabelText="Do you want more?" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b10" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b10"
														FieldTextBoxTabIndex="16" FieldLabelText="Don't do that." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b11" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b11"
														FieldTextBoxTabIndex="17" FieldLabelText="Don't touch." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b12" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b12"
														FieldTextBoxTabIndex="18" FieldLabelText="Get up." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b13" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b13"
														FieldTextBoxTabIndex="19" FieldLabelText="Give it to mommy." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b14" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b14"
														FieldTextBoxTabIndex="20" FieldLabelText="Give me a hug." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b15" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b15"
														FieldTextBoxTabIndex="21" FieldLabelText="Give me a kiss." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b16" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b16"
														FieldTextBoxTabIndex="22" FieldLabelText="Go get___." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b17" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b17"
														FieldTextBoxTabIndex="23" FieldLabelText="Good girl/boy." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b18" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b18"
														FieldTextBoxTabIndex="24" FieldLabelText="Hold still." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b19" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b19"
														FieldTextBoxTabIndex="25" FieldLabelText="Let's go bye bye." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b20" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b20"
														FieldTextBoxTabIndex="26" FieldLabelText="Look/look here." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b21" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b21"
														FieldTextBoxTabIndex="27" FieldLabelText="Open your mouth." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b22" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b22"
														FieldTextBoxTabIndex="28" FieldLabelText="Sit down." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b23" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b23"
														FieldTextBoxTabIndex="29" FieldLabelText="Spit it out." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b24" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b24"
														FieldTextBoxTabIndex="30" FieldLabelText="Stop it." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b25" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b25"
														FieldTextBoxTabIndex="31" FieldLabelText="TIme to go night night." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b26" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b26"
														FieldTextBoxTabIndex="32" FieldLabelText="Throw the ball." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b27" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b27"
														FieldTextBoxTabIndex="33" FieldLabelText="This little piggy." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1b28" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1b28"
														FieldTextBoxTabIndex="34" FieldLabelText="Want to go for a ride?" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">C. STARTING TO TALK (0=Never, 1=Sometimes, 2=Often, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc1c01" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc1c01"
											FieldTextBoxTabIndex="35" FieldLabelText="1. How often does your child imitate words?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc1c02" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc1c02"
											FieldTextBoxTabIndex="36" FieldLabelText="2. Naming and labeling" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">D. VOCABULARY CHECKLIST (1=Understands, 
										2=Understands and Says)</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">1. SOUND EFFECTS AND ANIMAL SOUNDS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0101" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0101"
														FieldTextBoxTabIndex="37" FieldLabelText="baa baa" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0102" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0102"
														FieldTextBoxTabIndex="38" FieldLabelText="choo choo" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0103" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0103"
														FieldTextBoxTabIndex="39" FieldLabelText="cockadoodledoo" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0104" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0104"
														FieldTextBoxTabIndex="40" FieldLabelText="grrr" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0105" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0105"
														FieldTextBoxTabIndex="41" FieldLabelText="meow" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0106" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0106"
														FieldTextBoxTabIndex="42" FieldLabelText="moo" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0107" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0107"
														FieldTextBoxTabIndex="43" FieldLabelText="ouch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0108" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0108"
														FieldTextBoxTabIndex="44" FieldLabelText="quack quack" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0109" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0109"
														FieldTextBoxTabIndex="45" FieldLabelText="uh oh" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0110" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0110"
														FieldTextBoxTabIndex="46" FieldLabelText="vroom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0111" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0111"
														FieldTextBoxTabIndex="47" FieldLabelText="woof woof" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0112" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0112"
														FieldTextBoxTabIndex="48" FieldLabelText="yum yum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">2. ANIMAL NAMES</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0201" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0201"
														FieldTextBoxTabIndex="49" FieldLabelText="animal" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0202" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0202"
														FieldTextBoxTabIndex="50" FieldLabelText="bear" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0203" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0203"
														FieldTextBoxTabIndex="51" FieldLabelText="bee" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0204" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0204"
														FieldTextBoxTabIndex="52" FieldLabelText="bird" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0205" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0205"
														FieldTextBoxTabIndex="53" FieldLabelText="bug" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0206" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0206"
														FieldTextBoxTabIndex="54" FieldLabelText="bunny" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0207" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0207"
														FieldTextBoxTabIndex="55" FieldLabelText="butterfly" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0208" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0208"
														FieldTextBoxTabIndex="56" FieldLabelText="cat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0209" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0209"
														FieldTextBoxTabIndex="57" FieldLabelText="chicken" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0210" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0210"
														FieldTextBoxTabIndex="58" FieldLabelText="cow" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0211" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0211"
														FieldTextBoxTabIndex="59" FieldLabelText="deer" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0212" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0212"
														FieldTextBoxTabIndex="60" FieldLabelText="dog" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0213" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0213"
														FieldTextBoxTabIndex="61" FieldLabelText="donkey" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0214" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0214"
														FieldTextBoxTabIndex="62" FieldLabelText="duck" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0215" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0215"
														FieldTextBoxTabIndex="63" FieldLabelText="elephant" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0216" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0216"
														FieldTextBoxTabIndex="64" FieldLabelText="fish" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0217" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0217"
														FieldTextBoxTabIndex="65" FieldLabelText="frog" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0218" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0218"
														FieldTextBoxTabIndex="66" FieldLabelText="giraffe" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0219" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0219"
														FieldTextBoxTabIndex="67" FieldLabelText="goose" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0220" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0220"
														FieldTextBoxTabIndex="68" FieldLabelText="horse" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0221" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0221"
														FieldTextBoxTabIndex="69" FieldLabelText="kitty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0222" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0222"
														FieldTextBoxTabIndex="70" FieldLabelText="Iamb" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0223" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0223"
														FieldTextBoxTabIndex="71" FieldLabelText="lion" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0224" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0224"
														FieldTextBoxTabIndex="72" FieldLabelText="monkey" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0225" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0225"
														FieldTextBoxTabIndex="73" FieldLabelText="mouse" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0226" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0226"
														FieldTextBoxTabIndex="74" FieldLabelText="owl" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0227" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0227"
														FieldTextBoxTabIndex="75" FieldLabelText="penguin" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0228" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0228"
														FieldTextBoxTabIndex="76" FieldLabelText="pig" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0229" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0229"
														FieldTextBoxTabIndex="77" FieldLabelText="pony" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0230" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0230"
														FieldTextBoxTabIndex="78" FieldLabelText="puppy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0231" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0231"
														FieldTextBoxTabIndex="79" FieldLabelText="sheep" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0232" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0232"
														FieldTextBoxTabIndex="80" FieldLabelText="squirrel" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0233" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0233"
														FieldTextBoxTabIndex="81" FieldLabelText="teddy bear" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0234" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0234"
														FieldTextBoxTabIndex="82" FieldLabelText="tiger" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0235" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0235"
														FieldTextBoxTabIndex="83" FieldLabelText="turkey" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0236" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0236"
														FieldTextBoxTabIndex="84" FieldLabelText="turtle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">3. VEHICLES</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0301" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0301"
														FieldTextBoxTabIndex="85" FieldLabelText="airplane" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0302" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0302"
														FieldTextBoxTabIndex="86" FieldLabelText="bicycle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0303" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0303"
														FieldTextBoxTabIndex="87" FieldLabelText="bus" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0304" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0304"
														FieldTextBoxTabIndex="88" FieldLabelText="car" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0305" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0305"
														FieldTextBoxTabIndex="89" FieldLabelText="firetruck" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0306" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0306"
														FieldTextBoxTabIndex="90" FieldLabelText="motorcycle" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0307" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0307"
														FieldTextBoxTabIndex="91" FieldLabelText="stroller" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0308" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0308"
														FieldTextBoxTabIndex="92" FieldLabelText="train" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0309" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0309"
														FieldTextBoxTabIndex="93" FieldLabelText="truck" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">4. TOYS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0401" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0401"
														FieldTextBoxTabIndex="94" FieldLabelText="ball" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0402" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0402"
														FieldTextBoxTabIndex="95" FieldLabelText="balloon" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0403" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0403"
														FieldTextBoxTabIndex="96" FieldLabelText="block" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0404" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0404"
														FieldTextBoxTabIndex="97" FieldLabelText="book" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0405" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0405"
														FieldTextBoxTabIndex="98" FieldLabelText="bubbles" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0406" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0406"
														FieldTextBoxTabIndex="99" FieldLabelText="doll" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0407" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0407"
														FieldTextBoxTabIndex="100" FieldLabelText="pen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0408" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0408"
														FieldTextBoxTabIndex="101" FieldLabelText="toy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">5. FOOD AND DRINK</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0501" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0501"
														FieldTextBoxTabIndex="102" FieldLabelText="apple" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0502" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0502"
														FieldTextBoxTabIndex="103" FieldLabelText="banana" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0503" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0503"
														FieldTextBoxTabIndex="104" FieldLabelText="bread" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0504" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0504"
														FieldTextBoxTabIndex="105" FieldLabelText="butter" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0505" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0505"
														FieldTextBoxTabIndex="106" FieldLabelText="cake" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0506" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0506"
														FieldTextBoxTabIndex="107" FieldLabelText="candy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0507" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0507"
														FieldTextBoxTabIndex="108" FieldLabelText="carrots" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0508" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0508"
														FieldTextBoxTabIndex="109" FieldLabelText="cereal" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0509" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0509"
														FieldTextBoxTabIndex="110" FieldLabelText="cheerios" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0510" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0510"
														FieldTextBoxTabIndex="111" FieldLabelText="cheese" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0511" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0511"
														FieldTextBoxTabIndex="112" FieldLabelText="chicken" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0512" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0512"
														FieldTextBoxTabIndex="113" FieldLabelText="coffee" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0513" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0513"
														FieldTextBoxTabIndex="114" FieldLabelText="cookie" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0514" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0514"
														FieldTextBoxTabIndex="115" FieldLabelText="cracker" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0515" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0515"
														FieldTextBoxTabIndex="116" FieldLabelText="drink" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0516" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0516"
														FieldTextBoxTabIndex="117" FieldLabelText="egg" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0517" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0517"
														FieldTextBoxTabIndex="118" FieldLabelText="fish" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0518" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0518"
														FieldTextBoxTabIndex="119" FieldLabelText="food" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0519" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0519"
														FieldTextBoxTabIndex="120" FieldLabelText="ice cream" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0520" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0520"
														FieldTextBoxTabIndex="121" FieldLabelText="juice" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0521" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0521"
														FieldTextBoxTabIndex="122" FieldLabelText="meat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0522" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0522"
														FieldTextBoxTabIndex="123" FieldLabelText="milk" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0523" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0523"
														FieldTextBoxTabIndex="124" FieldLabelText="noodles" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0524" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0524"
														FieldTextBoxTabIndex="125" FieldLabelText="orange" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0525" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0525"
														FieldTextBoxTabIndex="126" FieldLabelText="peas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0526" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0526"
														FieldTextBoxTabIndex="127" FieldLabelText="pizza" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0527" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0527"
														FieldTextBoxTabIndex="128" FieldLabelText="raisin" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0528" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0528"
														FieldTextBoxTabIndex="129" FieldLabelText="spaghetti" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0529" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0529"
														FieldTextBoxTabIndex="130" FieldLabelText="toast" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0530" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0530"
														FieldTextBoxTabIndex="131" FieldLabelText="water" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">6. CLOTHING</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0601" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0601"
														FieldTextBoxTabIndex="132" FieldLabelText="beads" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0602" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0602"
														FieldTextBoxTabIndex="133" FieldLabelText="bib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0603" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0603"
														FieldTextBoxTabIndex="134" FieldLabelText="boots" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0604" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0604"
														FieldTextBoxTabIndex="135" FieldLabelText="button" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0605" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0605"
														FieldTextBoxTabIndex="136" FieldLabelText="coat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0606" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0606"
														FieldTextBoxTabIndex="137" FieldLabelText="diaper" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0607" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0607"
														FieldTextBoxTabIndex="138" FieldLabelText="dress" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0608" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0608"
														FieldTextBoxTabIndex="139" FieldLabelText="hat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0609" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0609"
														FieldTextBoxTabIndex="140" FieldLabelText="jacket" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0610" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0610"
														FieldTextBoxTabIndex="141" FieldLabelText="jeans" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0611" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0611"
														FieldTextBoxTabIndex="142" FieldLabelText="necklace" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0612" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0612"
														FieldTextBoxTabIndex="143" FieldLabelText="pajamas" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0613" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0613"
														FieldTextBoxTabIndex="144" FieldLabelText="pants" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0614" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0614"
														FieldTextBoxTabIndex="145" FieldLabelText="shirt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0615" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0615"
														FieldTextBoxTabIndex="146" FieldLabelText="shoe" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0616" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0616"
														FieldTextBoxTabIndex="147" FieldLabelText="shorts" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0617" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0617"
														FieldTextBoxTabIndex="148" FieldLabelText="sock" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0618" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0618"
														FieldTextBoxTabIndex="149" FieldLabelText="sweater" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0619" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0619"
														FieldTextBoxTabIndex="150" FieldLabelText="zipper" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">7. BODY PARTS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0701" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0701"
														FieldTextBoxTabIndex="151" FieldLabelText="arm" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0702" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0702"
														FieldTextBoxTabIndex="152" FieldLabelText="belly buttor" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0703" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0703"
														FieldTextBoxTabIndex="153" FieldLabelText="cheek" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0704" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0704"
														FieldTextBoxTabIndex="154" FieldLabelText="ear" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0705" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0705"
														FieldTextBoxTabIndex="155" FieldLabelText="eye" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0706" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0706"
														FieldTextBoxTabIndex="156" FieldLabelText="face" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0707" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0707"
														FieldTextBoxTabIndex="157" FieldLabelText="foot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0708" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0708"
														FieldTextBoxTabIndex="158" FieldLabelText="finger" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0709" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0709"
														FieldTextBoxTabIndex="159" FieldLabelText="hair" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0710" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0710"
														FieldTextBoxTabIndex="160" FieldLabelText="hand" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0711" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0711"
														FieldTextBoxTabIndex="161" FieldLabelText="head" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0712" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0712"
														FieldTextBoxTabIndex="162" FieldLabelText="knee" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0713" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0713"
														FieldTextBoxTabIndex="163" FieldLabelText="leg" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0714" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0714"
														FieldTextBoxTabIndex="164" FieldLabelText="mouth" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0715" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0715"
														FieldTextBoxTabIndex="165" FieldLabelText="nose" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0716" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0716"
														FieldTextBoxTabIndex="166" FieldLabelText="owie/boo boo" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0717" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0717"
														FieldTextBoxTabIndex="167" FieldLabelText="tooth" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0718" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0718"
														FieldTextBoxTabIndex="168" FieldLabelText="toe" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0719" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0719"
														FieldTextBoxTabIndex="169" FieldLabelText="tongue" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0720" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0720"
														FieldTextBoxTabIndex="170" FieldLabelText="tummy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">8. FURNITURE AND ROOMS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0801" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0801"
														FieldTextBoxTabIndex="171" FieldLabelText="bathroom" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0802" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0802"
														FieldTextBoxTabIndex="172" FieldLabelText="bathtub" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0803" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0803"
														FieldTextBoxTabIndex="173" FieldLabelText="bed" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0804" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0804"
														FieldTextBoxTabIndex="174" FieldLabelText="bedroom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0805" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0805"
														FieldTextBoxTabIndex="175" FieldLabelText="chair" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0806" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0806"
														FieldTextBoxTabIndex="176" FieldLabelText="couch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0807" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0807"
														FieldTextBoxTabIndex="177" FieldLabelText="crib" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0808" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0808"
														FieldTextBoxTabIndex="178" FieldLabelText="door" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0809" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0809"
														FieldTextBoxTabIndex="179" FieldLabelText="drawer" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0810" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0810"
														FieldTextBoxTabIndex="180" FieldLabelText="garage" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0811" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0811"
														FieldTextBoxTabIndex="181" FieldLabelText="high chair" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0812" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0812"
														FieldTextBoxTabIndex="182" FieldLabelText="kitchen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0813" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0813"
														FieldTextBoxTabIndex="183" FieldLabelText="living room" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0814" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0814"
														FieldTextBoxTabIndex="184" FieldLabelText="oven" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0815" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0815"
														FieldTextBoxTabIndex="185" FieldLabelText="play pen" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0816" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0816"
														FieldTextBoxTabIndex="186" FieldLabelText="potty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0817" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0817"
														FieldTextBoxTabIndex="187" FieldLabelText="refrigerator" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0818" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0818"
														FieldTextBoxTabIndex="188" FieldLabelText="rocking chair" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0819" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0819"
														FieldTextBoxTabIndex="189" FieldLabelText="sink" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0820" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0820"
														FieldTextBoxTabIndex="190" FieldLabelText="stairs" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0821" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0821"
														FieldTextBoxTabIndex="191" FieldLabelText="stove" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0822" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0822"
														FieldTextBoxTabIndex="192" FieldLabelText="table" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0823" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0823"
														FieldTextBoxTabIndex="193" FieldLabelText="TV" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0824" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0824"
														FieldTextBoxTabIndex="194" FieldLabelText="window" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">9. SMALL HOUSEHOLD ITEMS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0901" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0901"
														FieldTextBoxTabIndex="195" FieldLabelText="blanket" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0902" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0902"
														FieldTextBoxTabIndex="196" FieldLabelText="bottle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0903" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0903"
														FieldTextBoxTabIndex="197" FieldLabelText="bowl" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0904" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0904"
														FieldTextBoxTabIndex="198" FieldLabelText="box" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0905" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0905"
														FieldTextBoxTabIndex="199" FieldLabelText="broom" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0906" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0906"
														FieldTextBoxTabIndex="200" FieldLabelText="brush" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0907" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0907"
														FieldTextBoxTabIndex="201" FieldLabelText="clock" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0908" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0908"
														FieldTextBoxTabIndex="202" FieldLabelText="comb" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0909" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0909"
														FieldTextBoxTabIndex="203" FieldLabelText="cup" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0910" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0910"
														FieldTextBoxTabIndex="204" FieldLabelText="dish" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0911" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0911"
														FieldTextBoxTabIndex="205" FieldLabelText="fork" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0912" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0912"
														FieldTextBoxTabIndex="206" FieldLabelText="glass" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0913" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0913"
														FieldTextBoxTabIndex="207" FieldLabelText="glasses" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0914" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0914"
														FieldTextBoxTabIndex="208" FieldLabelText="hammer" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0915" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0915"
														FieldTextBoxTabIndex="209" FieldLabelText="keys" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0916" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0916"
														FieldTextBoxTabIndex="210" FieldLabelText="lamp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0917" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0917"
														FieldTextBoxTabIndex="211" FieldLabelText="light" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0918" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0918"
														FieldTextBoxTabIndex="212" FieldLabelText="medicine" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0919" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0919"
														FieldTextBoxTabIndex="213" FieldLabelText="money" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0920" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0920"
														FieldTextBoxTabIndex="214" FieldLabelText="paper" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0921" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0921"
														FieldTextBoxTabIndex="215" FieldLabelText="penny" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0922" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0922"
														FieldTextBoxTabIndex="216" FieldLabelText="picture" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0923" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0923"
														FieldTextBoxTabIndex="217" FieldLabelText="pillow" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0924" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0924"
														FieldTextBoxTabIndex="218" FieldLabelText="plant" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0925" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0925"
														FieldTextBoxTabIndex="219" FieldLabelText="plate" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0926" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0926"
														FieldTextBoxTabIndex="220" FieldLabelText="purse" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0927" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0927"
														FieldTextBoxTabIndex="221" FieldLabelText="radio" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0928" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0928"
														FieldTextBoxTabIndex="222" FieldLabelText="scissors" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0929" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0929"
														FieldTextBoxTabIndex="223" FieldLabelText="soap" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0930" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0930"
														FieldTextBoxTabIndex="224" FieldLabelText="spoon" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0931" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0931"
														FieldTextBoxTabIndex="225" FieldLabelText="telephone" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0932" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0932"
														FieldTextBoxTabIndex="226" FieldLabelText="toothbrush" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0933" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0933"
														FieldTextBoxTabIndex="227" FieldLabelText="towel" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0934" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0934"
														FieldTextBoxTabIndex="228" FieldLabelText="trash" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0935" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0935"
														FieldTextBoxTabIndex="229" FieldLabelText="vacuum" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d0936" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d0936"
														FieldTextBoxTabIndex="230" FieldLabelText="watch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">10. OUTSIDE THINGS AND PLACES TO GO</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1001" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1001"
														FieldTextBoxTabIndex="231" FieldLabelText="backyard" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1002" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1002"
														FieldTextBoxTabIndex="232" FieldLabelText="beach" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1003" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1003"
														FieldTextBoxTabIndex="233" FieldLabelText="church *" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1004" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1004"
														FieldTextBoxTabIndex="234" FieldLabelText="flower" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1005" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1005"
														FieldTextBoxTabIndex="235" FieldLabelText="garden" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1006" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1006"
														FieldTextBoxTabIndex="236" FieldLabelText="home" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1007" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1007"
														FieldTextBoxTabIndex="237" FieldLabelText="house" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1008" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1008"
														FieldTextBoxTabIndex="238" FieldLabelText="moon" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1009" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1009"
														FieldTextBoxTabIndex="239" FieldLabelText="outside" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1010" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1010"
														FieldTextBoxTabIndex="240" FieldLabelText="park" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1011" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1011"
														FieldTextBoxTabIndex="241" FieldLabelText="party" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1012" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1012"
														FieldTextBoxTabIndex="242" FieldLabelText="pool" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1013" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1013"
														FieldTextBoxTabIndex="243" FieldLabelText="rain" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1014" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1014"
														FieldTextBoxTabIndex="244" FieldLabelText="rock" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1015" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1015"
														FieldTextBoxTabIndex="245" FieldLabelText="school" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1016" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1016"
														FieldTextBoxTabIndex="246" FieldLabelText="shovel" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1017" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1017"
														FieldTextBoxTabIndex="247" FieldLabelText="sky" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1018" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1018"
														FieldTextBoxTabIndex="248" FieldLabelText="slide" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1019" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1019"
														FieldTextBoxTabIndex="249" FieldLabelText="snow" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1020" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1020"
														FieldTextBoxTabIndex="250" FieldLabelText="star" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1021" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1021"
														FieldTextBoxTabIndex="251" FieldLabelText="store" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1022" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1022"
														FieldTextBoxTabIndex="252" FieldLabelText="sun" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1023" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1023"
														FieldTextBoxTabIndex="253" FieldLabelText="swing" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1024" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1024"
														FieldTextBoxTabIndex="254" FieldLabelText="tree" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1025" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1025"
														FieldTextBoxTabIndex="255" FieldLabelText="water" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1026" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1026"
														FieldTextBoxTabIndex="256" FieldLabelText="work" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1027" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1027"
														FieldTextBoxTabIndex="257" FieldLabelText="zoo" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">11. PEOPLE</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1101" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1101"
														FieldTextBoxTabIndex="258" FieldLabelText="aunt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1102" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1102"
														FieldTextBoxTabIndex="259" FieldLabelText="baby" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1103" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1103"
														FieldTextBoxTabIndex="260" FieldLabelText="babysitter" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1104" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1104"
														FieldTextBoxTabIndex="261" FieldLabelText="babysitter's name" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1105" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1105"
														FieldTextBoxTabIndex="262" FieldLabelText="boy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1106" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1106"
														FieldTextBoxTabIndex="263" FieldLabelText="brother" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1107" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1107"
														FieldTextBoxTabIndex="264" FieldLabelText="child" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1108" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1108"
														FieldTextBoxTabIndex="265" FieldLabelText="daddy *" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1109" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1109"
														FieldTextBoxTabIndex="266" FieldLabelText="girl" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1110" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1110"
														FieldTextBoxTabIndex="267" FieldLabelText="grandma *" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1111" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1111"
														FieldTextBoxTabIndex="268" FieldLabelText="grandpa *" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1112" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1112"
														FieldTextBoxTabIndex="269" FieldLabelText="lady" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1113" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1113"
														FieldTextBoxTabIndex="270" FieldLabelText="man" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1114" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1114"
														FieldTextBoxTabIndex="271" FieldLabelText="mommy *" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1115" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1115"
														FieldTextBoxTabIndex="272" FieldLabelText="child's own name" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1116" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1116"
														FieldTextBoxTabIndex="273" FieldLabelText="people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1117" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1117"
														FieldTextBoxTabIndex="274" FieldLabelText="person" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1118" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1118"
														FieldTextBoxTabIndex="275" FieldLabelText="sister" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1119" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1119"
														FieldTextBoxTabIndex="276" FieldLabelText="teacher" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1120" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1120"
														FieldTextBoxTabIndex="277" FieldLabelText="uncle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">12. GAMES AND ROUTINES</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1201" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1201"
														FieldTextBoxTabIndex="278" FieldLabelText="bath" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1202" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1202"
														FieldTextBoxTabIndex="279" FieldLabelText="breakfast" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1203" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1203"
														FieldTextBoxTabIndex="280" FieldLabelText="bye or bye bye" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1204" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1204"
														FieldTextBoxTabIndex="281" FieldLabelText="dinner" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1205" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1205"
														FieldTextBoxTabIndex="282" FieldLabelText="don't" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1206" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1206"
														FieldTextBoxTabIndex="283" FieldLabelText="hello" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1207" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1207"
														FieldTextBoxTabIndex="284" FieldLabelText="hi" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1208" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1208"
														FieldTextBoxTabIndex="285" FieldLabelText="lunch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1209" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1209"
														FieldTextBoxTabIndex="286" FieldLabelText="nap" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1210" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1210"
														FieldTextBoxTabIndex="287" FieldLabelText="night night" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1211" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1211"
														FieldTextBoxTabIndex="288" FieldLabelText="no" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1212" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1212"
														FieldTextBoxTabIndex="289" FieldLabelText="patty cake" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1213" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1213"
														FieldTextBoxTabIndex="290" FieldLabelText="peekaboo" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1214" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1214"
														FieldTextBoxTabIndex="291" FieldLabelText="please" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1215" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1215"
														FieldTextBoxTabIndex="292" FieldLabelText="shh/shush/hush" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1216" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1216"
														FieldTextBoxTabIndex="293" FieldLabelText="thank you" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1217" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1217"
														FieldTextBoxTabIndex="294" FieldLabelText="wait" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1218" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1218"
														FieldTextBoxTabIndex="295" FieldLabelText="wanna/want to" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1219" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1219"
														FieldTextBoxTabIndex="296" FieldLabelText="yes" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">13. ACTION WORDS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1301" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1301"
														FieldTextBoxTabIndex="297" FieldLabelText="bite" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1302" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1302"
														FieldTextBoxTabIndex="298" FieldLabelText="blow" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1303" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1303"
														FieldTextBoxTabIndex="299" FieldLabelText="break" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1304" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1304"
														FieldTextBoxTabIndex="300" FieldLabelText="bring" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1305" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1305"
														FieldTextBoxTabIndex="301" FieldLabelText="bump" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1306" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1306"
														FieldTextBoxTabIndex="302" FieldLabelText="clean" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1307" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1307"
														FieldTextBoxTabIndex="303" FieldLabelText="close" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1308" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1308"
														FieldTextBoxTabIndex="304" FieldLabelText="cry" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1309" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1309"
														FieldTextBoxTabIndex="305" FieldLabelText="dance" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1310" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1310"
														FieldTextBoxTabIndex="306" FieldLabelText="draw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1311" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1311"
														FieldTextBoxTabIndex="307" FieldLabelText="drink" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1312" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1312"
														FieldTextBoxTabIndex="308" FieldLabelText="drive" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1313" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1313"
														FieldTextBoxTabIndex="309" FieldLabelText="eat" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1314" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1314"
														FieldTextBoxTabIndex="310" FieldLabelText="fall" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1315" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1315"
														FieldTextBoxTabIndex="311" FieldLabelText="feed" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1316" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1316"
														FieldTextBoxTabIndex="312" FieldLabelText="finish" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1317" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1317"
														FieldTextBoxTabIndex="313" FieldLabelText="get" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1318" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1318"
														FieldTextBoxTabIndex="314" FieldLabelText="give" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1319" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1319"
														FieldTextBoxTabIndex="315" FieldLabelText="go" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1320" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1320"
														FieldTextBoxTabIndex="316" FieldLabelText="help" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1321" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1321"
														FieldTextBoxTabIndex="317" FieldLabelText="hit" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1322" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1322"
														FieldTextBoxTabIndex="318" FieldLabelText="hug" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1323" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1323"
														FieldTextBoxTabIndex="319" FieldLabelText="hurry" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1324" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1324"
														FieldTextBoxTabIndex="320" FieldLabelText="jump" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1325" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1325"
														FieldTextBoxTabIndex="321" FieldLabelText="kick" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1326" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1326"
														FieldTextBoxTabIndex="322" FieldLabelText="kiss" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1327" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1327"
														FieldTextBoxTabIndex="323" FieldLabelText="look" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1328" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1328"
														FieldTextBoxTabIndex="324" FieldLabelText="love" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1329" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1329"
														FieldTextBoxTabIndex="325" FieldLabelText="open" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1330" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1330"
														FieldTextBoxTabIndex="326" FieldLabelText="play" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1331" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1331"
														FieldTextBoxTabIndex="327" FieldLabelText="pull" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1332" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1332"
														FieldTextBoxTabIndex="328" FieldLabelText="push" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1333" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1333"
														FieldTextBoxTabIndex="329" FieldLabelText="put" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1334" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1334"
														FieldTextBoxTabIndex="330" FieldLabelText="read" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1335" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1335"
														FieldTextBoxTabIndex="331" FieldLabelText="ride" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1336" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1336"
														FieldTextBoxTabIndex="332" FieldLabelText="run" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1337" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1337"
														FieldTextBoxTabIndex="333" FieldLabelText="say" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1338" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1338"
														FieldTextBoxTabIndex="334" FieldLabelText="see" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1339" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1339"
														FieldTextBoxTabIndex="335" FieldLabelText="show" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1340" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1340"
														FieldTextBoxTabIndex="336" FieldLabelText="sing" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1341" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1341"
														FieldTextBoxTabIndex="337" FieldLabelText="sleep" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1342" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1342"
														FieldTextBoxTabIndex="338" FieldLabelText="smile" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1343" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1343"
														FieldTextBoxTabIndex="339" FieldLabelText="splash" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1344" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1344"
														FieldTextBoxTabIndex="340" FieldLabelText="stop" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1345" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1345"
														FieldTextBoxTabIndex="341" FieldLabelText="swim" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1346" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1346"
														FieldTextBoxTabIndex="342" FieldLabelText="swing" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1347" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1347"
														FieldTextBoxTabIndex="343" FieldLabelText="take" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1348" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1348"
														FieldTextBoxTabIndex="344" FieldLabelText="throw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1349" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1349"
														FieldTextBoxTabIndex="345" FieldLabelText="tickle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1350" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1350"
														FieldTextBoxTabIndex="346" FieldLabelText="touch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1351" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1351"
														FieldTextBoxTabIndex="347" FieldLabelText="watch" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1352" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1352"
														FieldTextBoxTabIndex="348" FieldLabelText="walk" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1353" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1353"
														FieldTextBoxTabIndex="349" FieldLabelText="wash" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1354" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1354"
														FieldTextBoxTabIndex="350" FieldLabelText="wipe" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1355" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1355"
														FieldTextBoxTabIndex="351" FieldLabelText="write" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">14. WORDS ABOUT TIME</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1401" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1401"
														FieldTextBoxTabIndex="352" FieldLabelText="day" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1402" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1402"
														FieldTextBoxTabIndex="353" FieldLabelText="later" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1403" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1403"
														FieldTextBoxTabIndex="354" FieldLabelText="morning" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1404" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1404"
														FieldTextBoxTabIndex="355" FieldLabelText="night" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1405" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1405"
														FieldTextBoxTabIndex="356" FieldLabelText="now" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1406" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1406"
														FieldTextBoxTabIndex="357" FieldLabelText="today" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1407" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1407"
														FieldTextBoxTabIndex="358" FieldLabelText="tomorrow" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1408" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1408"
														FieldTextBoxTabIndex="359" FieldLabelText="tonight" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">15. DESCRIPTIVE WORDS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1501" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1501"
														FieldTextBoxTabIndex="360" FieldLabelText="all gone" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1502" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1502"
														FieldTextBoxTabIndex="361" FieldLabelText="asleep" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1503" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1503"
														FieldTextBoxTabIndex="362" FieldLabelText="bad" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1504" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1504"
														FieldTextBoxTabIndex="363" FieldLabelText="big" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1505" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1505"
														FieldTextBoxTabIndex="364" FieldLabelText="blue" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1506" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1506"
														FieldTextBoxTabIndex="365" FieldLabelText="broken" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1507" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1507"
														FieldTextBoxTabIndex="366" FieldLabelText="careful" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1508" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1508"
														FieldTextBoxTabIndex="367" FieldLabelText="clean" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1509" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1509"
														FieldTextBoxTabIndex="368" FieldLabelText="cold" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1510" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1510"
														FieldTextBoxTabIndex="369" FieldLabelText="cute" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1511" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1511"
														FieldTextBoxTabIndex="370" FieldLabelText="dark" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1512" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1512"
														FieldTextBoxTabIndex="371" FieldLabelText="dirty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1513" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1513"
														FieldTextBoxTabIndex="372" FieldLabelText="dry" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1514" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1514"
														FieldTextBoxTabIndex="373" FieldLabelText="empty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1515" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1515"
														FieldTextBoxTabIndex="374" FieldLabelText="fast" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1516" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1516"
														FieldTextBoxTabIndex="375" FieldLabelText="fine" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1517" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1517"
														FieldTextBoxTabIndex="376" FieldLabelText="gentle" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1518" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1518"
														FieldTextBoxTabIndex="377" FieldLabelText="good" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1519" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1519"
														FieldTextBoxTabIndex="378" FieldLabelText="happy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1520" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1520"
														FieldTextBoxTabIndex="379" FieldLabelText="hard" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1521" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1521"
														FieldTextBoxTabIndex="380" FieldLabelText="hot" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1522" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1522"
														FieldTextBoxTabIndex="381" FieldLabelText="hungry" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1523" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1523"
														FieldTextBoxTabIndex="382" FieldLabelText="hurt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1524" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1524"
														FieldTextBoxTabIndex="383" FieldLabelText="little" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1525" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1525"
														FieldTextBoxTabIndex="384" FieldLabelText="naughty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1526" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1526"
														FieldTextBoxTabIndex="385" FieldLabelText="nice" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1527" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1527"
														FieldTextBoxTabIndex="386" FieldLabelText="old" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1528" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1528"
														FieldTextBoxTabIndex="387" FieldLabelText="pretty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1529" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1529"
														FieldTextBoxTabIndex="388" FieldLabelText="red" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1530" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1530"
														FieldTextBoxTabIndex="389" FieldLabelText="scared" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1531" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1531"
														FieldTextBoxTabIndex="390" FieldLabelText="sick" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1532" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1532"
														FieldTextBoxTabIndex="391" FieldLabelText="sleepy" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1533" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1533"
														FieldTextBoxTabIndex="392" FieldLabelText="soft" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1534" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1534"
														FieldTextBoxTabIndex="393" FieldLabelText="thirsty" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1535" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1535"
														FieldTextBoxTabIndex="394" FieldLabelText="tired" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1536" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1536"
														FieldTextBoxTabIndex="395" FieldLabelText="wet" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1537" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1537"
														FieldTextBoxTabIndex="396" FieldLabelText="yucky" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">16. PRONOUNS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1601" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1601"
														FieldTextBoxTabIndex="397" FieldLabelText="his" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1602" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1602"
														FieldTextBoxTabIndex="398" FieldLabelText="her" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1603" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1603"
														FieldTextBoxTabIndex="399" FieldLabelText="I" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1604" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1604"
														FieldTextBoxTabIndex="400" FieldLabelText="it" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1605" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1605"
														FieldTextBoxTabIndex="401" FieldLabelText="me" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1606" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1606"
														FieldTextBoxTabIndex="402" FieldLabelText="mine" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1607" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1607"
														FieldTextBoxTabIndex="403" FieldLabelText="my" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1608" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1608"
														FieldTextBoxTabIndex="404" FieldLabelText="that" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1609" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1609"
														FieldTextBoxTabIndex="405" FieldLabelText="this" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1610" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1610"
														FieldTextBoxTabIndex="406" FieldLabelText="you" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1611" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1611"
														FieldTextBoxTabIndex="407" FieldLabelText="your" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">17. QUESTION WORDS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1701" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1701"
														FieldTextBoxTabIndex="408" FieldLabelText="how" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1702" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1702"
														FieldTextBoxTabIndex="409" FieldLabelText="what" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1705" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1705"
														FieldTextBoxTabIndex="412" FieldLabelText="who" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1706" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1706"
														FieldTextBoxTabIndex="413" FieldLabelText="why" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1703" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1703"
														FieldTextBoxTabIndex="410" FieldLabelText="when" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1704" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1704"
														FieldTextBoxTabIndex="411" FieldLabelText="where" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">18. PREPOSITIONS AND LOCATIONS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1801" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1801"
														FieldTextBoxTabIndex="414" FieldLabelText="away" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1802" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1802"
														FieldTextBoxTabIndex="415" FieldLabelText="back" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1803" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1803"
														FieldTextBoxTabIndex="416" FieldLabelText="down" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1804" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1804"
														FieldTextBoxTabIndex="417" FieldLabelText="in" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1805" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1805"
														FieldTextBoxTabIndex="418" FieldLabelText="inside" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1806" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1806"
														FieldTextBoxTabIndex="419" FieldLabelText="off" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1807" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1807"
														FieldTextBoxTabIndex="420" FieldLabelText="on" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1808" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1808"
														FieldTextBoxTabIndex="421" FieldLabelText="out" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1809" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1809"
														FieldTextBoxTabIndex="422" FieldLabelText="there" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1810" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1810"
														FieldTextBoxTabIndex="423" FieldLabelText="under" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1811" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1811"
														FieldTextBoxTabIndex="424" FieldLabelText="up" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">19. QUANTIFIERS</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1901" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1901"
														FieldTextBoxTabIndex="425" FieldLabelText="all" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1902" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1902"
														FieldTextBoxTabIndex="426" FieldLabelText="another" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1903" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1903"
														FieldTextBoxTabIndex="427" FieldLabelText="more" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1904" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1904"
														FieldTextBoxTabIndex="428" FieldLabelText="none" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1905" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1905"
														FieldTextBoxTabIndex="429" FieldLabelText="not" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1906" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1906"
														FieldTextBoxTabIndex="430" FieldLabelText="other" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1907" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1907"
														FieldTextBoxTabIndex="431" FieldLabelText="same" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="mc1d1908" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="mc1d1908"
														FieldTextBoxTabIndex="432" FieldLabelText="some" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<H3>PART II ACTIONS AND GESTURES</H3>
							<TABLE class="grid">
								<TR>
									<TD class="heading">A. FIRST COMMUNICATIVE GESTURES<BR>
										(0=Not Yet, 1=Sometimes, 2= Often, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a01" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a01"
											FieldTextBoxTabIndex="433" FieldLabelText="1. Extends arm to show you something he/she is holding."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a02" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a02"
											FieldTextBoxTabIndex="434" FieldLabelText="2. Reaches out and gives you a toy or some object that he/she is holding."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a03" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a03"
											FieldTextBoxTabIndex="435" FieldLabelText="3. Points (with arm and index finger extended) at some interesting object or event."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a04" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a04"
											FieldTextBoxTabIndex="436" FieldLabelText="4. Waves bye-bye on his/her own when someone leaves." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a05" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a05"
											FieldTextBoxTabIndex="437" FieldLabelText="5. Extends his/her arm upward to signal a wish to be picked up."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a06" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a06"
											FieldTextBoxTabIndex="438" FieldLabelText="6. Shakes head 'no'." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a07" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a07"
											FieldTextBoxTabIndex="439" FieldLabelText="7. Nods head 'yes'." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a08" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a08"
											FieldTextBoxTabIndex="440" FieldLabelText="8. Gestures 'hush' by placing finger to lips." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a09" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a09"
											FieldTextBoxTabIndex="441" FieldLabelText="9. Requests something by extending arm and opening and closing hand."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a10" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a10"
											FieldTextBoxTabIndex="442" FieldLabelText="10. Blows kisses from a distance." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a11" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a11"
											FieldTextBoxTabIndex="443" FieldLabelText="11. Smacks lips in a 'yum yum' gesture to indicate that something taste good."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2a12" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="mc2a12"
											FieldTextBoxTabIndex="444" FieldLabelText="12. Shrugs to indicate 'all gone' or 'where'd it go'."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">B. GAMES AND ROUTINES (1=Yes, 2=No, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2b01" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2b01"
											FieldTextBoxTabIndex="445" FieldLabelText="1. Play peekaboo." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2b02" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2b02"
											FieldTextBoxTabIndex="446" FieldLabelText="2. Play patty cake." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2b03" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2b03"
											FieldTextBoxTabIndex="447" FieldLabelText="3. Play 'so big'." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2b04" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2b04"
											FieldTextBoxTabIndex="448" FieldLabelText="4. Play chasing games." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2b05" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2b05"
											FieldTextBoxTabIndex="449" FieldLabelText="5. Sing." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2b06" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2b06"
											FieldTextBoxTabIndex="450" FieldLabelText="6. Dance." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">C. ACTIONS WITH OBJECTS(1=Yes, 2=No, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c01" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c01"
											FieldTextBoxTabIndex="451" FieldLabelText="1. Eat with a spoon or fork." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c02" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c02"
											FieldTextBoxTabIndex="452" FieldLabelText="2. Drink from a cup containing liquid." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c03" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c03"
											FieldTextBoxTabIndex="453" FieldLabelText="3. Comb or brush own hair." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c04" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c04"
											FieldTextBoxTabIndex="454" FieldLabelText="4. Brush teeth." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c05" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c05"
											FieldTextBoxTabIndex="455" FieldLabelText="5. Wipe face or hands with a towel or cloth." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c06" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c06"
											FieldTextBoxTabIndex="456" FieldLabelText="6. Put on hat." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c07" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c07"
											FieldTextBoxTabIndex="457" FieldLabelText="7. Put on a shoe or sock." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c08" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c08"
											FieldTextBoxTabIndex="458" FieldLabelText="8. Put on a necklace, bracelet, or watch." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c09" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c09"
											FieldTextBoxTabIndex="459" FieldLabelText="9. Lay head on hands and squeeze eyes shut as if sleeping."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c10" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c10"
											FieldTextBoxTabIndex="460" FieldLabelText="10. Blow to indicate something is hot." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c11" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c11"
											FieldTextBoxTabIndex="461" FieldLabelText="11. Hold plane and make it 'fly'." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c12" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c12"
											FieldTextBoxTabIndex="462" FieldLabelText="12. Put telephone to ear." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c13" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c13"
											FieldTextBoxTabIndex="463" FieldLabelText="13. Sniff flowers." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c14" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c14"
											FieldTextBoxTabIndex="464" FieldLabelText="14. Push toy car or truck." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c15" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c15"
											FieldTextBoxTabIndex="465" FieldLabelText="15. Throw a ball." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c16" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c16"
											FieldTextBoxTabIndex="466" FieldLabelText="16. Pour pretend liquid from one container to another."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2c17" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2c17"
											FieldTextBoxTabIndex="467" FieldLabelText="17. Stir pretend liquid in a cup or pan with a spoon."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">D. PRETENDING TO BE A PARENT (1=Yes, 2= No, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d01" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d01"
											FieldTextBoxTabIndex="468" FieldLabelText="1. Put to bed." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d02" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d02"
											FieldTextBoxTabIndex="469" FieldLabelText="2. Cover with blanket." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d03" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d03"
											FieldTextBoxTabIndex="470" FieldLabelText="3. Feed with bottle." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d04" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d04"
											FieldTextBoxTabIndex="471" FieldLabelText="4. Feed with spoon." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d05" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d05"
											FieldTextBoxTabIndex="472" FieldLabelText="5. Brush/comb its hair." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d06" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d06"
											FieldTextBoxTabIndex="473" FieldLabelText="6. Pat or burp it." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d07" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d07"
											FieldTextBoxTabIndex="474" FieldLabelText="7. Push in stroller/buggy." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d08" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d08"
											FieldTextBoxTabIndex="475" FieldLabelText="8. Rock it." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d09" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d09"
											FieldTextBoxTabIndex="476" FieldLabelText="9. Kiss or hug it." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d10" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d10"
											FieldTextBoxTabIndex="477" FieldLabelText="10. Try to put shoe or sock or hat on it." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d11" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d11"
											FieldTextBoxTabIndex="478" FieldLabelText="11. Wipe its face or hands." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d12" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d12"
											FieldTextBoxTabIndex="479" FieldLabelText="12. Talk to it." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2d13" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2d13"
											FieldTextBoxTabIndex="480" FieldLabelText="13. Try to put diaper on it." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">E. IMITATING OTHER ADULT ACTIONS (1=Yes, 2=No, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e01" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e01"
											FieldTextBoxTabIndex="481" FieldLabelText="1. Sweep with broom or mop." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e02" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e02"
											FieldTextBoxTabIndex="482" FieldLabelText="2. Put key in door or lock." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e03" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e03"
											FieldTextBoxTabIndex="483" FieldLabelText="3. Pound with hammer or mallet." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e04" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e04"
											FieldTextBoxTabIndex="484" FieldLabelText="4. Attempt to use saw." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e05" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e05"
											FieldTextBoxTabIndex="485" FieldLabelText="5. 'Type' at a typewriter or computer keyboard." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e06" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e06"
											FieldTextBoxTabIndex="486" FieldLabelText="6. 'Read' (opens book, turns page)." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e07" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e07"
											FieldTextBoxTabIndex="487" FieldLabelText="7. Vacuum." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e08" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e08"
											FieldTextBoxTabIndex="488" FieldLabelText="8. Water plants." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e09" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e09"
											FieldTextBoxTabIndex="489" FieldLabelText="9. Play musical instrument (e.g., piano, trumpet)." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e10" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e10"
											FieldTextBoxTabIndex="490" FieldLabelText="10. 'Drive' car by turning steering wheel." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e11" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e11"
											FieldTextBoxTabIndex="491" FieldLabelText="11. Wash dishes." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e12" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e12"
											FieldTextBoxTabIndex="492" FieldLabelText="12. Clean with cloth or duster." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e13" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e13"
											FieldTextBoxTabIndex="493" FieldLabelText="13. Write with a pen, pencil, or marker." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e14" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e14"
											FieldTextBoxTabIndex="494" FieldLabelText="14. Dig with a shovel." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2e15" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2e15"
											FieldTextBoxTabIndex="495" FieldLabelText="15. Put on glasses." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">F. PRETEND OBJECTS (1=Yes, 2=No, 9= Missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mc2f01" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="mc2f01"
											FieldTextBoxTabIndex="496" FieldLabelText="During play, children sometimes use an object as a replacement for another..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="250px" DatabaseField="mc2f01t"
											FieldTextBoxTabIndex="496" FieldLabelText="Examples" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="400" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldTextBoxWidth="250px" DatabaseField="mccmt"
											FieldTextBoxTabIndex="496" FieldLabelText="Other Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="400" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="498"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="499"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="500"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="501"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
