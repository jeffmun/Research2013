
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.fmri.fmri" ValidateRequest="false" CodeFile="fmri.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="404" DatabaseTable="all_fmri"
							LookupField1="id" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="fMRI"
							PrimaryKeyField="fmri_pk" VerifiedField="verified" ShowScoreButton="False" LookupField1DataType="TEXT"
							LookupColumns="studymeasname,id,mridate{0:d},mriexnum" LookupColumnHeaders="Measure,ID,fMRI Date,Exam Number"></def:dataentrycontroller><br>
						<A href="https://autism.washington.edu/sqlreportserver?/FACE/fMRI1">View FACE fMRI 
							report</A><br>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="80px" DatabaseField="ID"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="mridate" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="80px" DatabaseField="mridate"
										FieldTextBoxTabIndex="5" FieldLabelText="MRI Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="mriexnum" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="80px" DatabaseField="mriexnum"
										FieldTextBoxTabIndex="6" FieldLabelText="Exam Number" IsDoubleEntryField="True" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True"
										FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Experiment</TD>
									<TD class="heading" width="133">Series Number</TD>
									<TD class="heading">Is Series Usable?<BR>
										(0=NO,1=YES,9=Unknown)</TD>
								</TR>
								<TR>
									<TD class="heading">Faces Up vs. House Up</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriord1" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Series Order #1"
											FieldTextBoxTabIndex="7" DatabaseField="mriFacesUpVHouseUpNo" FieldLabelWidth="100px" FieldTextBoxWidth="90px"
											FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="154" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #1" FieldTextBoxTabIndex="7" DatabaseField="mriFacesUpVHouseUpU"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Familiar Face vs. Unfamiliar Face</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriord2" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Series Order #2"
											FieldTextBoxTabIndex="8" DatabaseField="mriFamFaceVUnfFaceNo" FieldLabelWidth="100px" FieldTextBoxWidth="90px"
											FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="156" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #2" FieldTextBoxTabIndex="8" DatabaseField="mriFamFaceVUnfFaceU"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Faces Up vs. Inverted Faces</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriord3" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Series Order #3"
											FieldTextBoxTabIndex="9" DatabaseField="mriFaceVInvFaceNo" FieldLabelWidth="100px" FieldTextBoxWidth="90px"
											FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="158" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #3" FieldTextBoxTabIndex="9" DatabaseField="mriFaceVInvFaceU"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Familiar Face vs. House</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriord4" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Series Order #4"
											FieldTextBoxTabIndex="10" DatabaseField="mriFamFaceVHouseNo" FieldLabelWidth="100px" FieldTextBoxWidth="90px"
											FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="64" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriFamFaceVHouseU"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" DESIGNTIMEDRAGDROP="66"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 1:" FieldTextBoxTabIndex="10" DatabaseField="mriOtherExperiment1"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="182"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD width="133">
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment1No" FieldTextBoxTabIndex="10" DatabaseField="mriOtherExperiment1No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="183"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment1U" FieldTextBoxTabIndex="10" DatabaseField="mriOtherExperiment1U"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" DESIGNTIMEDRAGDROP="184"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 2:" FieldTextBoxTabIndex="10" DatabaseField="mriOtherExperiment2"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="185"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD width="133">
										<def:datafieldcontrol id="Datafieldcontrol18" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment2No" FieldTextBoxTabIndex="10" DatabaseField="mriOtherExperiment2No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol19" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment2U" FieldTextBoxTabIndex="10" DatabaseField="mriOtherExperiment2U"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">Structural Series</TD>
									<TD class="heading">Series Number</TD>
								</TR>
								<TR>
									<TD class="heading">Sagittal localizer</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriSagittalNo"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="445"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Screenshot of slice locations</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriScreenshotNo"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="446"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">T1 axial - 21 slices</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriT1AxialNo"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="447"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">EPI preview</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriEPIPreview"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="448"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">3D SPGR sagittal</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mri3DSPGRNo"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="92"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol20" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 1:" FieldTextBoxTabIndex="10" DatabaseField="mriOtherStructural1"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="194"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol22" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriOtherStructural1No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" DESIGNTIMEDRAGDROP="196"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol21" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 2:" FieldTextBoxTabIndex="10" DatabaseField="mriOtherStructural2"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" FieldTextBoxTextDefault="<none>" ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol23" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="10" DatabaseField="mriOtherStructural2No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" FieldTextBoxTextDefault="<none>" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Motion restraints used? (0=NO, 1=YES, 9=Unknown)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrircol" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Collar"
											FieldTextBoxTabIndex="11" DatabaseField="mrircol" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirpad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Padding top of head"
											FieldTextBoxTabIndex="12" DatabaseField="mrirpad" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirtape" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Tape on forehead"
											FieldTextBoxTabIndex="13" DatabaseField="mrirtape" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirvac" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Vacuum bead bag"
											FieldTextBoxTabIndex="14" DatabaseField="mrirvac" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirothr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Other"
											FieldTextBoxTabIndex="15" DatabaseField="mrirothr" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" DESIGNTIMEDRAGDROP="561" ValidList="0,1,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="mrirottx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="(Specify)"
											FieldTextBoxTabIndex="16" DatabaseField="mrirottx" FieldLabelWidth="150px" FieldTextBoxWidth="200px"
											FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="True" FieldLabelText="Water phantom on left?(0=No,1=Yes,9=Unknown)" FieldTextBoxTabIndex="17"
								DatabaseField="mriWaterPhantom" FieldLabelWidth="150px" FieldTextBoxWidth="30px" FieldTextBoxTextDefault="9"
								ValidList="0,1,9"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">Head Coil Used? (0=No,1=Yes,9=Unknown)</TD>
								</TR>
								<TR>
									<TD class="heading">GE Head Coil</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Datafieldcontrol12" FieldTextBoxTabIndex="18" DatabaseField="mriGEHeadCoil"
											FieldLabelWidth="150px" FieldTextBoxWidth="30px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Custom Head Coil (Cecil 2)</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Datafieldcontrol13" FieldTextBoxTabIndex="18" DatabaseField="mriCustomHeadCoil"
											FieldLabelWidth="150px" FieldTextBoxWidth="30px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="mriFreqEncoding" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Frequency Encoding (0=L/R,1=A/P,9=Unknown)"
								FieldTextBoxTabIndex="18" DatabaseField="mriFreqEncoding" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
								FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="mricmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Session Notes:"
								FieldTextBoxTabIndex="19" DatabaseField="mriSessionNotes" FieldLabelWidth="100px" FieldTextBoxWidth="600px"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Yes/No checkboxes based on debriefing form: (0=NO, 1=YES, 
										9=Unknown)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridund" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="problems understanding/performing task?"
											FieldTextBoxTabIndex="19" DatabaseField="mridund" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mriduncm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="uncomfortable?"
											FieldTextBoxTabIndex="20" DatabaseField="mriduncm" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridtanx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="tense, anxious?"
											FieldTextBoxTabIndex="21" DatabaseField="mridtanx" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridmov" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="do you recall moving?"
											FieldTextBoxTabIndex="22" DatabaseField="mridmov" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridawak" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="awake and concentrated?"
											FieldTextBoxTabIndex="23" DatabaseField="mridawak" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldTextBoxTextDefault="9" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridnote" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Debriefing Notes:"
											FieldTextBoxTabIndex="24" DatabaseField="mridnote" FieldLabelWidth="100px" FieldTextBoxWidth="400px"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">0=NO,1=YES,9=Unknown</TD>
								</TR>
								<TR>
									<TD>Bring subject back for repeat of *THIS* MR session?</TD>
									<TD>
										<def:datafieldcontrol id="mriusabl" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriusabl"
											FieldTextBoxTabIndex="25" DatabaseField="mriBringBack" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldTextBoxTextDefault="9" ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Is this a rescan?</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol24" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriIsRescan" FieldTextBoxTabIndex="25" DatabaseField="mriIsRescan"
											FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Good candidate for phase II?</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol25" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriPhase2" FieldTextBoxTabIndex="25" DatabaseField="mriPhase2"
											FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldTextBoxTextDefault="9" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Comments:" FieldTextBoxTabIndex="25" DatabaseField="mriComments"
								FieldLabelWidth="100px" FieldTextBoxWidth="600px" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"
								FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="28" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="29" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="30" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="31" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
