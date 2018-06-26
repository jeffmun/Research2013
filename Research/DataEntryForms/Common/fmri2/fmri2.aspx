<%@ Page language="c#" Inherits="GenericDataEntryForms.fmri2.fmri2" ValidateRequest="false" CodeFile="fmri2.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" AllowedStudyMeasures="405" DatabaseTable="all_fmri2"
							LookupField1="id" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="fMRI"
							PrimaryKeyField="fmri2_pk" VerifiedField="verified" ShowScoreButton="False" LookupField1DataType="TEXT"
							LookupColumns="studymeasname,id,mridate{0:d},mriexnum" LookupColumnHeaders="Measure,ID,fMRI Date,Exam Number"></def:dataentrycontroller><br>
						<A href="https://autism.washington.edu/sqlreportserver?/FACE/fMRI2">View FACE fMRI2 
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
							<def:datafieldcontrol id="mriHandedness" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Handedness (R, L, or A)"
								FieldTextBoxTabIndex="6" DatabaseField="mriHandedness" FieldLabelWidth="80px" FieldTextBoxWidth="40px"
								ValidList="R,L,A,r,l,a"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">Behavioral Pretest</TD>
								</TR>
								<TR>
									<TD class="heading">A.&nbsp;11.7 ms</TD>
									<TD>
										<def:datafieldcontrol id="mri13ms" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mri13ms"
											FieldTextBoxTabIndex="6" DatabaseField="mri13ms" FieldTextBoxWidth="50px" ShowFieldLabel="False" RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">B.&nbsp;23.4 ms</TD>
									<TD>
										<def:datafieldcontrol id="mri26ms" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mri26ms"
											FieldTextBoxTabIndex="6" DatabaseField="mri26ms" FieldTextBoxWidth="50px" ShowFieldLabel="False" RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">C.&nbsp;35.1 ms</TD>
									<TD>
										<def:datafieldcontrol id="mri39ms" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mri39ms"
											FieldTextBoxTabIndex="6" DatabaseField="mri39ms" FieldTextBoxWidth="50px" ShowFieldLabel="False" RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">D.&nbsp;58.5 ms</TD>
									<TD>
										<def:datafieldcontrol id="mri66ms" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mri66ms"
											FieldTextBoxTabIndex="6" DatabaseField="mri66ms" FieldTextBoxWidth="50px" ShowFieldLabel="False" RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Subliminal FMRI Version</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">A = 11.7 ms<BR>
										B = 23.4 ms<BR>
										C = 35.1 ms<BR>
										<def:datafieldcontrol id="mriSubliminalFMRI" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminalFMRI" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminalFMRI"
											FieldTextBoxWidth="40px" ValidList="A,B,C,a,b,c" ShowFieldLabel="False"></def:datafieldcontrol>(A, 
										B, or C)</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Experiment</TD>
									<TD class="heading" width="133">Series Number</TD>
									<TD class="heading" width="112">Is Series Usable?<BR>
										(0=NO,1=YES, 9=Unknown)</TD>
									<TD class="heading">Hits</TD>
									<TD class="heading">Misses</TD>
									<TD class="heading">Inc</TD>
									<TD class="heading">FAlarms</TD>
								</TR>
								<TR>
									<TD class="heading">Subliminal 1</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriSubliminal1No" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1No" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal1No"
											FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD width="112">
										<def:datafieldcontrol id="mriSubliminal1U" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U"
											FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal1U" FieldTextBoxWidth="40px" ValidList="0,1,9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal1Hits"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal1Miss"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal1Inc"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal1FA"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" height="31">Subliminal 2</TD>
									<TD width="133" height="31">
										<def:datafieldcontrol id="mriSubliminal2No" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal2No" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal2No"
											FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD width="112" height="31">
										<def:datafieldcontrol id="mriSubliminal2U" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriSubliminal2U"
											FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal2U" FieldTextBoxWidth="40px" ValidList="0,1,9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
									<TD height="31">
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal2Hits"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="31">
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal2Miss"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="31">
										<def:datafieldcontrol id="Datafieldcontrol25" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal2Inc"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="31">
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriSubliminal2FA"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Emotion Matching</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriEmotionMatchingNo" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriEmotionMatchingNo" FieldTextBoxTabIndex="6" DatabaseField="mriEmotionMatchingNo"
											FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD width="112">
										<def:datafieldcontrol id="mriEmotionMatchingU" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriEmotionMatchingU" FieldTextBoxTabIndex="6" DatabaseField="mriEmotionMatchingU"
											FieldTextBoxWidth="40px" ValidList="0,1,9" ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol26" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriEmotionMatchingHits"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol27" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriEmotionMatchingMiss"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol29" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriEmotionMatchingInc"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol28" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriSubliminal1U" FieldTextBoxTabIndex="6" DatabaseField="mriEmotionMatchingFA"
											FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Right Amygdala (pfile)</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriRAmygdalaNo" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriRAmygdalaNo"
											FieldTextBoxTabIndex="6" DatabaseField="mriRAmygdalaNo" FieldTextBoxWidth="90px" ShowFieldLabel="False"
											FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD width="112">
										<def:datafieldcontrol id="mriRAmygdalaU" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriRAmygdalaU"
											FieldTextBoxTabIndex="6" DatabaseField="mriRAmygdalaU" FieldTextBoxWidth="40px" ValidList="0,1,9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD class="heading">Left Amygdala (pfile)</TD>
									<TD width="133">
										<def:datafieldcontrol id="mriLAmygdalaNo" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriLAmygdalaNo"
											FieldTextBoxTabIndex="6" DatabaseField="mriLAmygdalaNo" FieldTextBoxWidth="90px" ShowFieldLabel="False"
											FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD width="112">
										<def:datafieldcontrol id="mriLAmygdalaU" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriLAmygdalaU"
											FieldTextBoxTabIndex="6" DatabaseField="mriLAmygdalaU" FieldTextBoxWidth="40px" ValidList="0,1,9"
											ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 1:" FieldTextBoxTabIndex="6" DatabaseField="mriOtherExperiment1"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" ShowFieldLabel="True" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="182"></def:datafieldcontrol></TD>
									<TD width="133">
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment1No" FieldTextBoxTabIndex="6" DatabaseField="mriOtherExperiment1No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="183"></def:datafieldcontrol></TD>
									<TD width="112">
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment1U" FieldTextBoxTabIndex="6" DatabaseField="mriOtherExperiment1U"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" ValidList="0,1,9" ShowFieldLabel="False" FieldTextBoxTextDefault="9"
											DESIGNTIMEDRAGDROP="184"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 2:" FieldTextBoxTabIndex="6" DatabaseField="mriOtherExperiment2"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" ShowFieldLabel="True" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="185"></def:datafieldcontrol></TD>
									<TD width="133">
										<def:datafieldcontrol id="Datafieldcontrol18" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment2No" FieldTextBoxTabIndex="6" DatabaseField="mriOtherExperiment2No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD width="112">
										<def:datafieldcontrol id="Datafieldcontrol19" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriOtherExperiment2U" FieldTextBoxTabIndex="6" DatabaseField="mriOtherExperiment2U"
											FieldLabelWidth="100px" FieldTextBoxWidth="40px" ValidList="0,1,9" ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
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
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="6" DatabaseField="mriSagittalNo"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="445"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Screenshot of slice locations</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="6" DatabaseField="mriScreenshotNo"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="446"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">EPI preview</TD>
									<TD>
										<def:datafieldcontrol id="mriEPIPreviewNo" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mriEPIPreviewNo"
											FieldTextBoxTabIndex="6" DatabaseField="mriEPIPreviewNo" FieldTextBoxWidth="90px" ShowFieldLabel="False"
											FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">3D SPGR Coronal</TD>
									<TD>
										<def:datafieldcontrol id="mri3DSPGRCoronalNo" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mri3DSPGRCoronalNo" FieldTextBoxTabIndex="6" DatabaseField="mri3DSPGRCoronalNo"
											FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol20" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 1:" FieldTextBoxTabIndex="6" DatabaseField="mriOtherStructural1"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" ShowFieldLabel="True" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="194"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol22" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="6" DatabaseField="mriOtherStructural1No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"
											DESIGNTIMEDRAGDROP="196"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="Datafieldcontrol21" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Other 2:" FieldTextBoxTabIndex="6" DatabaseField="mriOtherStructural2"
											FieldLabelWidth="60px" FieldTextBoxWidth="200px" ShowFieldLabel="True" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol23" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Series Order #4" FieldTextBoxTabIndex="6" DatabaseField="mriOtherStructural2No"
											FieldLabelWidth="100px" FieldTextBoxWidth="90px" ShowFieldLabel="False" FieldTextBoxTextDefault="<none>"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="mriGenetics" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Genetics (Y or N)"
								FieldTextBoxTabIndex="6" DatabaseField="mriGenetics" FieldLabelWidth="100px" FieldTextBoxWidth="40px"
								ValidList="Y,N,y,n"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="mriEDR" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="EDR (Y or N)"
								FieldTextBoxTabIndex="6" DatabaseField="mriEDR" FieldLabelWidth="100px" FieldTextBoxWidth="40px" ValidList="Y,N,y,n"></def:datafieldcontrol>
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
											ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirpad" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Padding top of head"
											FieldTextBoxTabIndex="12" DatabaseField="mrirpad" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirtape" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Tape on forehead"
											FieldTextBoxTabIndex="13" DatabaseField="mrirtape" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirvac" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Vacuum bead bag"
											FieldTextBoxTabIndex="14" DatabaseField="mrirvac" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mrirothr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Other"
											FieldTextBoxTabIndex="15" DatabaseField="mrirothr" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											ValidList="0,1,9" FieldTextBoxTextDefault="9" DESIGNTIMEDRAGDROP="561"></def:datafieldcontrol><BR>
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
								DatabaseField="mriWaterPhantom" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,9"
								FieldTextBoxTextDefault="9"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="mriFreqEncoding" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Frequency Encoding (0=L/R,1=A/P,9=Unknown)"
								FieldTextBoxTabIndex="18" DatabaseField="mriFreqEncoding" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
								ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="mricmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Session Notes:"
								FieldTextBoxTabIndex="19" DatabaseField="mriSessionNotes" FieldLabelWidth="100px" FieldTextBoxWidth="600px"
								FieldTextBoxMaxLength="1000" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Yes/No checkboxes based on debriefing form: (0=NO, 1=YES, 
										9=Unknown)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridund" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="See Faces?"
											FieldTextBoxTabIndex="19" DatabaseField="mridSeeFaces" FieldLabelWidth="100px" FieldTextBoxWidth="30px"
											ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mriduncm" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="See Emotions?"
											FieldTextBoxTabIndex="20" DatabaseField="mridSeeEmotions" FieldLabelWidth="100px" FieldTextBoxWidth="30px"
											ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Debriefing Notes</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="See faces/houses?" FieldTextBoxTabIndex="24" DatabaseField="mridNoteSeeFacesHouses"
											FieldLabelWidth="100px" FieldTextBoxWidth="400px" DESIGNTIMEDRAGDROP="1137" FieldTextBoxMaxLength="1000"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="See emotions?" FieldTextBoxTabIndex="24" DatabaseField="mridNoteSeeEmotions"
											FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="1000" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mridnote" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other:"
											FieldTextBoxTabIndex="24" DatabaseField="mridNoteOther" FieldLabelWidth="100px" FieldTextBoxWidth="400px"
											DESIGNTIMEDRAGDROP="885" FieldTextBoxMaxLength="1000" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
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
											ValidList="0,1,9" ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Is this a rescan?</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol24" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="mriIsRescan" FieldTextBoxTabIndex="25" DatabaseField="mriIsRescan"
											FieldLabelWidth="200px" FieldTextBoxWidth="40px" ValidList="0,1,9" ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Comments:" FieldTextBoxTabIndex="25" DatabaseField="mriComments"
								FieldLabelWidth="100px" FieldTextBoxWidth="600px" FieldTextBoxMaxLength="1000" FieldTextBoxHeight="150px"
								FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
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
