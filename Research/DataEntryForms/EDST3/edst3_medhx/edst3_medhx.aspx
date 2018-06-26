<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_medhx.edst3_medhx" CodeFile="edst3_medhx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_medhx" LookupField1="edsid"
							LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" MeasureName="EDST3 Family Information Update"
							PrimaryKeyField="medhx_pk" VerifiedField="verified" StudyMeasID="209"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" MaxVal="1000" MinVal="0" DatabaseField="edsid" FieldTextBoxTabIndex="2"
										FieldLabelText="EDS ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="80px"
										FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<table class="layout">
							<tr>
								<td><def:datafieldcontrol id="hxa_date" runat="server" DatabaseField="hxa_date" FieldTextBoxTabIndex="3" FieldLabelText="Date Completed"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldTextBoxWidth="80px" FormatString="{0:d}" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Symptom<BR>
										1 = Yes<BR>
										2 = If yes, began before 6...<BR>
										3 = If yes, began between 6 and 9<BR>
										4 = No<BR>
										5 = Uknown<BR>
										9 = Missing/Blank
									</TD>
									<TD class="heading">Comments/Explanation</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb101" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="1. Autism/PDD/Aspergers Syndrome" FieldTextBoxTabIndex="7" DatabaseField="hxb101"
											ValidList="1,2,3,4,5,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb101c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb101c" FieldTextBoxTabIndex="45" DatabaseField="hxb101c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb102" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="2. Social Awkwardness/Impairment" FieldTextBoxTabIndex="8" DatabaseField="hxb102"
											ValidList="1,2,3,4,5,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb102c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb102c" FieldTextBoxTabIndex="46" DatabaseField="hxb102c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb103" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. Motor Coordination Problems" FieldTextBoxTabIndex="9" DatabaseField="hxb103" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb103c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb103c" FieldTextBoxTabIndex="47" DatabaseField="hxb103c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb104" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="4. Tics" FieldTextBoxTabIndex="10" DatabaseField="hxb104" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb104c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb104c" FieldTextBoxTabIndex="48" DatabaseField="hxb104c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb105" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="5. Motor Problems" FieldTextBoxTabIndex="11" DatabaseField="hxb105" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb105c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb105c" FieldTextBoxTabIndex="49" DatabaseField="hxb105c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb106" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="6. Mental Retardation" FieldTextBoxTabIndex="12" DatabaseField="hxb106" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb106c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb106c" FieldTextBoxTabIndex="50" DatabaseField="hxb106c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb107" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="7. Learning Problems" FieldTextBoxTabIndex="13" DatabaseField="hxb107" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb107c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb107c" FieldTextBoxTabIndex="51" DatabaseField="hxb107c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb108" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="8. Special Education" FieldTextBoxTabIndex="14" DatabaseField="hxb108" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb108c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb108c" FieldTextBoxTabIndex="52" DatabaseField="hxb108c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb109" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="9. Speech/Language Problems" FieldTextBoxTabIndex="15" DatabaseField="hxb109" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb109c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb109c" FieldTextBoxTabIndex="53" DatabaseField="hxb109c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb110" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10. Vision Problems" FieldTextBoxTabIndex="16" DatabaseField="hxb110" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb110c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb110c" FieldTextBoxTabIndex="54" DatabaseField="hxb110c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb111" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="11. Hearing Problems" FieldTextBoxTabIndex="17" DatabaseField="hxb111" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb111c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb111c" FieldTextBoxTabIndex="55" DatabaseField="hxb111c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb112" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="12. Attention Problems" FieldTextBoxTabIndex="18" DatabaseField="hxb112" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb112c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb112c" FieldTextBoxTabIndex="56" DatabaseField="hxb112c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb113" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="13. Hyperactivity" FieldTextBoxTabIndex="19" DatabaseField="hxb113" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb113c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb113c" FieldTextBoxTabIndex="57" DatabaseField="hxb113c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb114" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="14. Neurological Disease" FieldTextBoxTabIndex="20" DatabaseField="hxb114" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb114c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb114c" FieldTextBoxTabIndex="58" DatabaseField="hxb114c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb115" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="15. Norrie Syndrome" FieldTextBoxTabIndex="21" DatabaseField="hxb115" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb115c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb115c" FieldTextBoxTabIndex="59" DatabaseField="hxb115c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb116" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="16. Neurofibromatosis" FieldTextBoxTabIndex="22" DatabaseField="hxb116" ValidList="1,2,3,4,5,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb116c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb116c" FieldTextBoxTabIndex="60" DatabaseField="hxb116c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb117" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="17. Tuberous Sclerosis" FieldTextBoxTabIndex="23" DatabaseField="hxb117" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb117c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb117c" FieldTextBoxTabIndex="61" DatabaseField="hxb117c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb118" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="18. Cerebral Palsy" FieldTextBoxTabIndex="24" DatabaseField="hxb118" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb118c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb118c" FieldTextBoxTabIndex="62" DatabaseField="hxb118c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb120" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="20. Tourette Syndrome" FieldTextBoxTabIndex="26" DatabaseField="hxb120" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb120c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb120c" FieldTextBoxTabIndex="64" DatabaseField="hxb120c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb121" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="21. Anxiety/Phobias" FieldTextBoxTabIndex="27" DatabaseField="hxb121" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb121c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb121c" FieldTextBoxTabIndex="65" DatabaseField="hxb121c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb122" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="22. Obsessive Compulsive Disorder" FieldTextBoxTabIndex="28" DatabaseField="hxb122"
											ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb122c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb122c" FieldTextBoxTabIndex="66" DatabaseField="hxb122c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb123" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="23. Suicidal thoughts or gestures" FieldTextBoxTabIndex="29" DatabaseField="hxb123"
											ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb123c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb123c" FieldTextBoxTabIndex="67" DatabaseField="hxb123c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb124" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="24. Depression" FieldTextBoxTabIndex="30" DatabaseField="hxb124" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb124c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb124c" FieldTextBoxTabIndex="68" DatabaseField="hxb124c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb125" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="25. Manic-Depression" FieldTextBoxTabIndex="31" DatabaseField="hxb125" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb125c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb125c" FieldTextBoxTabIndex="69" DatabaseField="hxb125c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb126" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="26. Delinquency" FieldTextBoxTabIndex="32" DatabaseField="hxb126" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb126c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb126c" FieldTextBoxTabIndex="70" DatabaseField="hxb126c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb127" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="27. Chronic Illness" FieldTextBoxTabIndex="33" DatabaseField="hxb127" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb127c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb127c" FieldTextBoxTabIndex="71" DatabaseField="hxb127c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb128" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="28. Head trauma " FieldTextBoxTabIndex="34" DatabaseField="hxb128" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb128c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb128c" FieldTextBoxTabIndex="72" DatabaseField="hxb128c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb129" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="29. Loss of Consciousness" FieldTextBoxTabIndex="35" DatabaseField="hxb129" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb129c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb129c" FieldTextBoxTabIndex="73" DatabaseField="hxb129c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb130" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="30. Encephalitis/Meningitis" FieldTextBoxTabIndex="36" DatabaseField="hxb130" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb130c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb130c" FieldTextBoxTabIndex="74" DatabaseField="hxb130c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb131" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="31. Metal implants (protheses or braces)" FieldTextBoxTabIndex="37" DatabaseField="hxb131"
											ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb131c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb131c" FieldTextBoxTabIndex="75" DatabaseField="hxb131c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb132" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="32. Cerebral vascular disease" FieldTextBoxTabIndex="38" DatabaseField="hxb132" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb132c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb132c" FieldTextBoxTabIndex="76" DatabaseField="hxb132c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb133" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="33. Cardiovascular problems" FieldTextBoxTabIndex="39" DatabaseField="hxb133" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb133c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb133c" FieldTextBoxTabIndex="77" DatabaseField="hxb133c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb134" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="34. Lung Disease" FieldTextBoxTabIndex="40" DatabaseField="hxb134" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb134c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb134c" FieldTextBoxTabIndex="78" DatabaseField="hxb134c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb135" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="35. Chronic Bronchitis or chronic coughing" FieldTextBoxTabIndex="41" DatabaseField="hxb135"
											ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb135c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb135c" FieldTextBoxTabIndex="79" DatabaseField="hxb135c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb136" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="36. Asthma" FieldTextBoxTabIndex="42" DatabaseField="hxb136" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb136c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb136c" FieldTextBoxTabIndex="80" DatabaseField="hxb136c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb137" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="37. Thyroid Disease" FieldTextBoxTabIndex="43" DatabaseField="hxb137" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb137c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb137c" FieldTextBoxTabIndex="81" DatabaseField="hxb137c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb138" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="38. Other Immune Disorder" FieldTextBoxTabIndex="44" DatabaseField="hxb138" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb138c" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb138c" FieldTextBoxTabIndex="82" DatabaseField="hxb138c"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="hxb2gen" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Has your participating child EVER had genetic testing? (1=yes, 2=no, 9=missing/blank)"
											FieldTextBoxTabIndex="83" DatabaseField="hxb2gen" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb2date" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="100px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="date" FieldTextBoxTabIndex="85" DatabaseField="hxb2date"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Genetic testing results
										<BR>
										1=yes, 2=no, 9=missing/blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb201" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Fragile X" FieldTextBoxTabIndex="86" DatabaseField="hxb201" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb202" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Phenylketonuria (PKU)" FieldTextBoxTabIndex="87" DatabaseField="hxb202" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb203" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Down's syndrome" FieldTextBoxTabIndex="88" DatabaseField="hxb203" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb204" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="William's Syndrome" FieldTextBoxTabIndex="89" DatabaseField="hxb204" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb205" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Tuberous Sclerosis" FieldTextBoxTabIndex="90" DatabaseField="hxb205" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb206" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Neurofibromatosis" FieldTextBoxTabIndex="91" DatabaseField="hxb206" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb207" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Rett Syndrome" FieldTextBoxTabIndex="92" DatabaseField="hxb207" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb208" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Prader Willi Syndrome" FieldTextBoxTabIndex="93" DatabaseField="hxb208" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb209" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Angelman Syndrome" FieldTextBoxTabIndex="94" DatabaseField="hxb209" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb210" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Any Chromosomal Abnormality" FieldTextBoxTabIndex="95" DatabaseField="hxb210" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb211" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Inherited/Genetic Disorder:" FieldTextBoxTabIndex="96" DatabaseField="hxb211" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="hxb211nm" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="name" FieldTextBoxTabIndex="97" DatabaseField="hxb211nm"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb212" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="other" FieldTextBoxTabIndex="98" DatabaseField="hxb212" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="hxb212ot" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="(specify)" FieldTextBoxTabIndex="98" DatabaseField="hxb212ot"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1=yes, 2=no, 9=missing/blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb301" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="3. suspected seizures" FieldTextBoxTabIndex="99" DatabaseField="hxb301" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb302" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="tested for seizures" FieldTextBoxTabIndex="100" DatabaseField="hxb302" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb303" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="clinical EEG" FieldTextBoxTabIndex="101" DatabaseField="hxb303" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb3date" runat="server" FieldTextBoxWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Date" FieldTextBoxTabIndex="103" DatabaseField="hxb3date"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">1=yes, 2=no,<BR>
										3=unknown, 9=missing</TD>
									<TD class="heading">Age of Onset (months)<BR>
										Use -999 for N/A or missing</TD>
									<TD class="heading">Current<BR>
										(1=yes, 2=no, 9=missing)</TD>
								</TR>
								<TR>
									<TD class="heading">Febrile Seizures</TD>
									<TD>
										<def:datafieldcontrol id="hxb3febr" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb3febr" FieldTextBoxTabIndex="104" DatabaseField="hxb3febr" ValidList="1,2,3,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb3fage" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb3fage" FieldTextBoxTabIndex="105" DatabaseField="hxb3fage" MaxVal="900" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb3fcur" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb3fcur" FieldTextBoxTabIndex="106" DatabaseField="hxb3fcur" ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Seizures/<BR>
										Epilepsy</TD>
									<TD>
										<def:datafieldcontrol id="hxb3seiz" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb3seiz" FieldTextBoxTabIndex="107" DatabaseField="hxb3seiz" ValidList="1,2,3,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb3sage" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb3sage" FieldTextBoxTabIndex="108" DatabaseField="hxb3sage" MaxVal="900" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb3scur" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb3scur" FieldTextBoxTabIndex="109" DatabaseField="hxb3scur" ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="hxb4med" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
								FieldLabelText="4. medications on a regular basis? (1=yes,2=no,9=missing/blank)" FieldTextBoxTabIndex="110"
								DatabaseField="hxb4med" ValidList="1,2,9"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Name of Medicine</TD>
									<TD class="heading">Reason</TD>
									<TD class="heading">Date Began<BR>
										mm/yyyy</TD>
									<TD class="heading">Currently<BR>
										Taking?<BR>
										1=yes,2=no,9=missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb401n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb401n" FieldTextBoxTabIndex="111" DatabaseField="hxb401n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb401r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb401r"
											FieldTextBoxTabIndex="112" DatabaseField="hxb401r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb401d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="113" DatabaseField="hxb401dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="113" DatabaseField="hxb401dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb401c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb401c" FieldTextBoxTabIndex="114" DatabaseField="hxb401c"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb402n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb402n" FieldTextBoxTabIndex="115" DatabaseField="hxb402n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb402r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb402r"
											FieldTextBoxTabIndex="116" DatabaseField="hxb402r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb402d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="117" DatabaseField="hxb402dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="117" DatabaseField="hxb402dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb402c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb402c" FieldTextBoxTabIndex="118" DatabaseField="hxb402c"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb403n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb403n" FieldTextBoxTabIndex="119" DatabaseField="hxb403n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb403r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb403r"
											FieldTextBoxTabIndex="120" DatabaseField="hxb403r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb403d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="121" DatabaseField="hxb403dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="121" DatabaseField="hxb403dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb403c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb403c" FieldTextBoxTabIndex="122" DatabaseField="hxb403c"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb404n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb404n" FieldTextBoxTabIndex="123" DatabaseField="hxb404n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb404r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb404r"
											FieldTextBoxTabIndex="124" DatabaseField="hxb404r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb404d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="125" DatabaseField="hxb404dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="125" DatabaseField="hxb404dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb404c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb404c" FieldTextBoxTabIndex="126" DatabaseField="hxb404c"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb405n" runat="server" FieldTextBoxWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb405n" FieldTextBoxTabIndex="127" DatabaseField="hxb405n"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb405r" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb405r"
											FieldTextBoxTabIndex="128" DatabaseField="hxb405r" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb405d" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="40px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="m:" FieldTextBoxTabIndex="129" DatabaseField="hxb405dm"
											ShowFieldLabel="True"></def:datafieldcontrol>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="20px" FieldTextBoxWidth="50px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="y:" FieldTextBoxTabIndex="129" DatabaseField="hxb405dy"
											ShowFieldLabel="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb405c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb405c" FieldTextBoxTabIndex="130" DatabaseField="hxb405c"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Illness</TD>
									<TD class="heading">Age (months)</TD>
									<TD class="heading">Length<BR>
										of illness (days)</TD>
									<TD class="heading">High Fever<BR>
										or Unconscious<BR>
										(1=yes, 2= No, 9=missing)</TD>
									<TD class="heading">Treatment/<BR>
										Aftereffects</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb501i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501i"
											FieldTextBoxTabIndex="131" DatabaseField="hxb501i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ia" FieldTextBoxTabIndex="132" DatabaseField="hxb501ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501il" FieldTextBoxTabIndex="133" DatabaseField="hxb501il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ih" FieldTextBoxTabIndex="134" DatabaseField="hxb501ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501it"
											FieldTextBoxTabIndex="135" DatabaseField="hxb501it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb502i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502i"
											FieldTextBoxTabIndex="136" DatabaseField="hxb502i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ia" FieldTextBoxTabIndex="137" DatabaseField="hxb502ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502il" FieldTextBoxTabIndex="138" DatabaseField="hxb502il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ih" FieldTextBoxTabIndex="139" DatabaseField="hxb502ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502it"
											FieldTextBoxTabIndex="140" DatabaseField="hxb502it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb503i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503i"
											FieldTextBoxTabIndex="141" DatabaseField="hxb503i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ia" FieldTextBoxTabIndex="142" DatabaseField="hxb503ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503il" FieldTextBoxTabIndex="143" DatabaseField="hxb503il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ih" FieldTextBoxTabIndex="144" DatabaseField="hxb503ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503it"
											FieldTextBoxTabIndex="145" DatabaseField="hxb503it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb504i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb504i"
											FieldTextBoxTabIndex="146" DatabaseField="hxb504i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb504ia" FieldTextBoxTabIndex="147" DatabaseField="hxb504ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb504il" FieldTextBoxTabIndex="148" DatabaseField="hxb504il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb504ih" FieldTextBoxTabIndex="149" DatabaseField="hxb504ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb504it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb504it"
											FieldTextBoxTabIndex="150" DatabaseField="hxb504it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb505i" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb505i"
											FieldTextBoxTabIndex="151" DatabaseField="hxb505i" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505ia" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb505ia" FieldTextBoxTabIndex="152" DatabaseField="hxb505ia"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505il" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb505il" FieldTextBoxTabIndex="153" DatabaseField="hxb505il"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505ih" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb505ih" FieldTextBoxTabIndex="154" DatabaseField="hxb505ih"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb505it" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb505it"
											FieldTextBoxTabIndex="155" DatabaseField="hxb505it" ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Operations</TD>
									<TD class="heading">Age (months)</TD>
									<TD class="heading">Length of<BR>
										time in Hospital (days)</TD>
									<TD class="heading">Aftereffects/How was<BR>
										child prepared</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb501o" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501o"
											FieldTextBoxTabIndex="156" DatabaseField="hxb501o" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501oa" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501oa" FieldTextBoxTabIndex="157" DatabaseField="hxb501oa"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ol" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ol" FieldTextBoxTabIndex="158" DatabaseField="hxb501ol"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501oh" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb501oh" FieldTextBoxTabIndex="159" DatabaseField="hxb501oh"
											ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb502o" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502o"
											FieldTextBoxTabIndex="160" DatabaseField="hxb502o" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502oa" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502oa" FieldTextBoxTabIndex="161" DatabaseField="hxb502oa"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ol" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ol" FieldTextBoxTabIndex="162" DatabaseField="hxb502ol"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502oh" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb502oh" FieldTextBoxTabIndex="163" DatabaseField="hxb502oh"
											ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb503o" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503o"
											FieldTextBoxTabIndex="164" DatabaseField="hxb503o" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503oa" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503oa" FieldTextBoxTabIndex="165" DatabaseField="hxb503oa"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ol" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ol" FieldTextBoxTabIndex="166" DatabaseField="hxb503ol"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503oh" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="hxb503oh" FieldTextBoxTabIndex="167" DatabaseField="hxb503oh"
											ShowFieldLabel="False" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Other<BR>
										Hospitalizations</TD>
									<TD class="heading">Age (months)</TD>
									<TD class="heading">Time in<BR>
										Hospital (days)</TD>
									<TD class="heading">Aftereffects</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb501h" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb501h"
											FieldTextBoxTabIndex="168" DatabaseField="hxb501h" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501ha" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501ha" FieldTextBoxTabIndex="169" DatabaseField="hxb501ha"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501hl" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb501hl" FieldTextBoxTabIndex="170" DatabaseField="hxb501hl"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb501hd" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb501hd" FieldTextBoxTabIndex="171" DatabaseField="hxb501hd" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb502h" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb502h"
											FieldTextBoxTabIndex="172" DatabaseField="hxb502h" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502ha" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502ha" FieldTextBoxTabIndex="173" DatabaseField="hxb502ha"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502hl" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb502hl" FieldTextBoxTabIndex="174" DatabaseField="hxb502hl"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb502hd" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb502hd" FieldTextBoxTabIndex="175" DatabaseField="hxb502hd" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb503h" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="hxb503h"
											FieldTextBoxTabIndex="176" DatabaseField="hxb503h" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503ha" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503ha" FieldTextBoxTabIndex="177" DatabaseField="hxb503ha"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503hl" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxb503hl" FieldTextBoxTabIndex="178" DatabaseField="hxb503hl"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxb503hd" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="hxb503hd" FieldTextBoxTabIndex="179" DatabaseField="hxb503hd" ShowFieldLabel="False"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">6. Digestive Problems<BR>
										0=No problem, 1=Mild, 2=Moderate, 3=Severe, 4=Incapacitating, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb601" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Diarrhea" FieldTextBoxTabIndex="181" DatabaseField="hxb601" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb602" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Constipation" FieldTextBoxTabIndex="182" DatabaseField="hxb602" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb603" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Poor Appetite" FieldTextBoxTabIndex="183" DatabaseField="hxb603" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb604" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Bloating" FieldTextBoxTabIndex="184" DatabaseField="hxb604" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb605" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Flatulence" FieldTextBoxTabIndex="185" DatabaseField="hxb605" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb606" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Abdominal Pain" FieldTextBoxTabIndex="186" DatabaseField="hxb606" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="hxb77a" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7a. Has training started for bowel control? (1=yes, 2=no)"
											FieldTextBoxTabIndex="187" DatabaseField="hxb77a" ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb77aag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="Age (months)" FieldTextBoxTabIndex="188" DatabaseField="hxb77aag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb77bag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="7b. At what age was control established?" FieldTextBoxTabIndex="189"
											DatabaseField="hxb77bag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb77c" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="7c. Were there any relapses? (1=yes, 2=no)" FieldTextBoxTabIndex="190"
											DatabaseField="hxb77c" ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb77cag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="relapse age (months)" FieldTextBoxTabIndex="191" DatabaseField="hxb77cag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb77crl" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="If Yes, Describe the relapse" FieldTextBoxTabIndex="192"
											DatabaseField="hxb77crl" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">
										<def:datafieldcontrol id="hxb88a" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8a. Has your child stopped wetting at night? (1=yes,2=no)"
											FieldTextBoxTabIndex="193" DatabaseField="hxb88a" ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb88aag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="stop wetting age (months)?" FieldTextBoxTabIndex="194" DatabaseField="hxb88aag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb88b" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="8b. during the day?" FieldTextBoxTabIndex="195" DatabaseField="hxb88b"
											ValidList="1,2"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb88bag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="during day age (months)?" FieldTextBoxTabIndex="196" DatabaseField="hxb88bag"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">9. Sleep Disturbances (1=yes, 2=no, 9=missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb901" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="9. Has your child experienced sleep disturbances?" FieldTextBoxTabIndex="197" DatabaseField="hxb901"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb901ag" runat="server" FieldTextBoxWidth="60px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="disturbances age (months)?" FieldTextBoxTabIndex="198" DatabaseField="hxb901ag"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb902" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sleep-wake schedule disturbances" FieldTextBoxTabIndex="199" DatabaseField="hxb902"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb903" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Difficulty initiating sleep" FieldTextBoxTabIndex="200" DatabaseField="hxb903" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb904" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Difficulty maintaining sleep/night wakings" FieldTextBoxTabIndex="201" DatabaseField="hxb904"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb905" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Hypersomnia/ excessive sleepiness" FieldTextBoxTabIndex="202" DatabaseField="hxb905"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb906" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Insomnia/ lack of sleepiness" FieldTextBoxTabIndex="203" DatabaseField="hxb906" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb907" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Breathing-related sleep disorder" FieldTextBoxTabIndex="204" DatabaseField="hxb907"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb908" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Narcolepsy" FieldTextBoxTabIndex="205" DatabaseField="hxb908" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb909" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Parasomnia/unusual behavior while sleeping" FieldTextBoxTabIndex="206" DatabaseField="hxb909"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb910" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sleep terrors" FieldTextBoxTabIndex="207" DatabaseField="hxb910" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb911" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Sleep walking" FieldTextBoxTabIndex="208" DatabaseField="hxb911" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb912" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="If yes, is this possibly due to medications your child is taking?" FieldTextBoxTabIndex="209"
											DatabaseField="hxb912" ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb912m" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Please specify medications"
											FieldTextBoxTabIndex="210" DatabaseField="hxb912m" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb913" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Is it due to another medical condition?" FieldTextBoxTabIndex="211" DatabaseField="hxb913"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb913mc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="specify"
											FieldTextBoxTabIndex="212" DatabaseField="hxb913mc" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">10. Eating Problems (1=yes, 2=no, 9=missing)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1001" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="10. Has your child displayed any eating problems?" FieldTextBoxTabIndex="213" DatabaseField="hxb1001"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb1001a" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="At what age?"
											FieldTextBoxTabIndex="214" DatabaseField="hxb1001a"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1002" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Pica/eating non-food substances" FieldTextBoxTabIndex="215" DatabaseField="hxb1002"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1003" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Rumination Disorder/ repeated regurgitation and swallowing of food" FieldTextBoxTabIndex="216"
											DatabaseField="hxb1003" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1005" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Failure to eat adequately " FieldTextBoxTabIndex="218" DatabaseField="hxb1005" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1006" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Overeating" FieldTextBoxTabIndex="219" DatabaseField="hxb1006" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxb1007" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Specific food preferences or avoidance" FieldTextBoxTabIndex="220" DatabaseField="hxb1007"
											ValidList="1,2,9"></def:datafieldcontrol>
										<def:datafieldcontrol id="hxb1007d" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Describe here" FieldTextBoxTabIndex="221" DatabaseField="hxb1007d"
											FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">C. Family Medical Information Update</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxcbiom" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Biological Mother’s Name" FieldTextBoxTabIndex="222" DatabaseField="hxcbiom"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxcbiof" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Biological Father’s Name" FieldTextBoxTabIndex="223" DatabaseField="hxcbiof"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxcsib1" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Sibling 1" FieldTextBoxTabIndex="224" DatabaseField="hxcsib1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxcsib2" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Sibling 2" FieldTextBoxTabIndex="225" DatabaseField="hxcsib2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxcsib3" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="False" FieldLabelText="Sibling 3" FieldTextBoxTabIndex="226" DatabaseField="hxcsib3"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Mother</TD>
									<TD class="heading">Father</TD>
									<TD class="heading">Sibling 1</TD>
									<TD class="heading">Sibling 2</TD>
									<TD class="heading">Sibling 3</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc01m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="1. Autism/PDD/Aspergers Syndrome" FieldTextBoxTabIndex="227"
											DatabaseField="hxc01m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc01f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc01f" FieldTextBoxTabIndex="228" DatabaseField="hxc01f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc01s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc01s1" FieldTextBoxTabIndex="229" DatabaseField="hxc01s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc01s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc01s2" FieldTextBoxTabIndex="230" DatabaseField="hxc01s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc01s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc01s3" FieldTextBoxTabIndex="231" DatabaseField="hxc01s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc02m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="2. Social Awkwardness/Impairment" FieldTextBoxTabIndex="232"
											DatabaseField="hxc02m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc02f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc02f" FieldTextBoxTabIndex="233" DatabaseField="hxc02f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc02s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc02s1" FieldTextBoxTabIndex="234" DatabaseField="hxc02s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc02s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc02s2" FieldTextBoxTabIndex="235" DatabaseField="hxc02s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc02s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc02s3" FieldTextBoxTabIndex="236" DatabaseField="hxc02s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc03m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="3. Motor Coordination Problems" FieldTextBoxTabIndex="237"
											DatabaseField="hxc03m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc03f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc03f" FieldTextBoxTabIndex="238" DatabaseField="hxc03f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc03s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc03s1" FieldTextBoxTabIndex="239" DatabaseField="hxc03s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc03s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc03s2" FieldTextBoxTabIndex="240" DatabaseField="hxc03s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc03s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc03s3" FieldTextBoxTabIndex="241" DatabaseField="hxc03s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc04m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="4. Tics" FieldTextBoxTabIndex="242" DatabaseField="hxc04m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc04f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc04f" FieldTextBoxTabIndex="243" DatabaseField="hxc04f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc04s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc04s1" FieldTextBoxTabIndex="244" DatabaseField="hxc04s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc04s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc04s2" FieldTextBoxTabIndex="245" DatabaseField="hxc04s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc04s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc04s3" FieldTextBoxTabIndex="246" DatabaseField="hxc04s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc05m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="5. Motor Problems" FieldTextBoxTabIndex="247" DatabaseField="hxc05m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc05f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc05f" FieldTextBoxTabIndex="248" DatabaseField="hxc05f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc05s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc05s1" FieldTextBoxTabIndex="249" DatabaseField="hxc05s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc05s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc05s2" FieldTextBoxTabIndex="250" DatabaseField="hxc05s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc05s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc05s3" FieldTextBoxTabIndex="251" DatabaseField="hxc05s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc06m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="6. Mental Retardation" FieldTextBoxTabIndex="252" DatabaseField="hxc06m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc06f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc06f" FieldTextBoxTabIndex="253" DatabaseField="hxc06f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc06s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc06s1" FieldTextBoxTabIndex="254" DatabaseField="hxc06s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc06s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc06s2" FieldTextBoxTabIndex="255" DatabaseField="hxc06s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc06s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc06s3" FieldTextBoxTabIndex="256" DatabaseField="hxc06s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc07m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="7. Learning Problems" FieldTextBoxTabIndex="257" DatabaseField="hxc07m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc07f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc07f" FieldTextBoxTabIndex="258" DatabaseField="hxc07f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc07s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc07s1" FieldTextBoxTabIndex="259" DatabaseField="hxc07s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc07s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc07s2" FieldTextBoxTabIndex="260" DatabaseField="hxc07s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc07s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc07s3" FieldTextBoxTabIndex="261" DatabaseField="hxc07s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc08m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="8. Special Education" FieldTextBoxTabIndex="262" DatabaseField="hxc08m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc08f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc08f" FieldTextBoxTabIndex="263" DatabaseField="hxc08f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc08s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc08s1" FieldTextBoxTabIndex="264" DatabaseField="hxc08s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc08s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc08s2" FieldTextBoxTabIndex="265" DatabaseField="hxc08s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc08s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc08s3" FieldTextBoxTabIndex="266" DatabaseField="hxc08s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc09m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="9. Speech/Language Problems" FieldTextBoxTabIndex="267"
											DatabaseField="hxc09m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc09f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc09f" FieldTextBoxTabIndex="268" DatabaseField="hxc09f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc09s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc09s1" FieldTextBoxTabIndex="269" DatabaseField="hxc09s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc09s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc09s2" FieldTextBoxTabIndex="270" DatabaseField="hxc09s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc09s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc09s3" FieldTextBoxTabIndex="271" DatabaseField="hxc09s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc10m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="10. Vision Problems" FieldTextBoxTabIndex="272" DatabaseField="hxc10m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc10f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc10f" FieldTextBoxTabIndex="273" DatabaseField="hxc10f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc10s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc10s1" FieldTextBoxTabIndex="274" DatabaseField="hxc10s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc10s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc10s2" FieldTextBoxTabIndex="275" DatabaseField="hxc10s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc10s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc10s3" FieldTextBoxTabIndex="276" DatabaseField="hxc10s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc11m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="11. Hearing Problems" FieldTextBoxTabIndex="277" DatabaseField="hxc11m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc11f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc11f" FieldTextBoxTabIndex="278" DatabaseField="hxc11f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc11s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc11s1" FieldTextBoxTabIndex="279" DatabaseField="hxc11s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc11s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc11s2" FieldTextBoxTabIndex="280" DatabaseField="hxc11s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc11s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc11s3" FieldTextBoxTabIndex="281" DatabaseField="hxc11s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc12m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="12. Attention Problems" FieldTextBoxTabIndex="282" DatabaseField="hxc12m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc12f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc12f" FieldTextBoxTabIndex="283" DatabaseField="hxc12f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc12s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc12s1" FieldTextBoxTabIndex="284" DatabaseField="hxc12s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc12s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc12s2" FieldTextBoxTabIndex="285" DatabaseField="hxc12s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc12s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc12s3" FieldTextBoxTabIndex="286" DatabaseField="hxc12s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD height="27">
										<def:datafieldcontrol id="hxc13m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="13. Hyperactivity" FieldTextBoxTabIndex="287" DatabaseField="hxc13m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD height="27">
										<def:datafieldcontrol id="hxc13f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc13f" FieldTextBoxTabIndex="288" DatabaseField="hxc13f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="27">
										<def:datafieldcontrol id="hxc13s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc13s1" FieldTextBoxTabIndex="289" DatabaseField="hxc13s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="27">
										<def:datafieldcontrol id="hxc13s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc13s2" FieldTextBoxTabIndex="290" DatabaseField="hxc13s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD height="27">
										<def:datafieldcontrol id="hxc13s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc13s3" FieldTextBoxTabIndex="291" DatabaseField="hxc13s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc14m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="14. Neurological Disease" FieldTextBoxTabIndex="292" DatabaseField="hxc14m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc14f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc14f" FieldTextBoxTabIndex="293" DatabaseField="hxc14f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc14s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc14s1" FieldTextBoxTabIndex="294" DatabaseField="hxc14s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc14s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc14s2" FieldTextBoxTabIndex="295" DatabaseField="hxc14s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc14s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc14s3" FieldTextBoxTabIndex="296" DatabaseField="hxc14s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc15m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="15. Norrie Syndrome" FieldTextBoxTabIndex="297" DatabaseField="hxc15m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc15f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc15f" FieldTextBoxTabIndex="298" DatabaseField="hxc15f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc15s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc15s1" FieldTextBoxTabIndex="299" DatabaseField="hxc15s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc15s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc15s2" FieldTextBoxTabIndex="300" DatabaseField="hxc15s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc15s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc15s3" FieldTextBoxTabIndex="301" DatabaseField="hxc15s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc16m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="16. Neurofibromatosis" FieldTextBoxTabIndex="302" DatabaseField="hxc16m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc16f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc16f" FieldTextBoxTabIndex="303" DatabaseField="hxc16f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc16s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc16s1" FieldTextBoxTabIndex="304" DatabaseField="hxc16s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc16s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc16s2" FieldTextBoxTabIndex="305" DatabaseField="hxc16s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc16s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc16s3" FieldTextBoxTabIndex="306" DatabaseField="hxc16s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc17m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="17. Tuberous Sclerosis" FieldTextBoxTabIndex="307" DatabaseField="hxc17m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc17f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc17f" FieldTextBoxTabIndex="308" DatabaseField="hxc17f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc17s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc17s1" FieldTextBoxTabIndex="309" DatabaseField="hxc17s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc17s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc17s2" FieldTextBoxTabIndex="310" DatabaseField="hxc17s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc17s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc17s3" FieldTextBoxTabIndex="311" DatabaseField="hxc17s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc18m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="18. Cerebral Palsy" FieldTextBoxTabIndex="312" DatabaseField="hxc18m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc18f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc18f" FieldTextBoxTabIndex="313" DatabaseField="hxc18f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc18s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc18s1" FieldTextBoxTabIndex="314" DatabaseField="hxc18s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc18s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc18s2" FieldTextBoxTabIndex="315" DatabaseField="hxc18s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc18s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc18s3" FieldTextBoxTabIndex="316" DatabaseField="hxc18s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc20m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="20. Tourette Syndrome" FieldTextBoxTabIndex="322" DatabaseField="hxc20m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc20f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc20f" FieldTextBoxTabIndex="323" DatabaseField="hxc20f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc20s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc20s1" FieldTextBoxTabIndex="324" DatabaseField="hxc20s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc20s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc20s2" FieldTextBoxTabIndex="325" DatabaseField="hxc20s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc20s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc20s3" FieldTextBoxTabIndex="326" DatabaseField="hxc20s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc21m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="21. Anxiety/Phobias" FieldTextBoxTabIndex="327" DatabaseField="hxc21m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc21f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc21f" FieldTextBoxTabIndex="328" DatabaseField="hxc21f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc21s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc21s1" FieldTextBoxTabIndex="329" DatabaseField="hxc21s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc21s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc21s2" FieldTextBoxTabIndex="330" DatabaseField="hxc21s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc21s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc21s3" FieldTextBoxTabIndex="331" DatabaseField="hxc21s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc22m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="22. Obsessive Compulsive Disorder" FieldTextBoxTabIndex="332"
											DatabaseField="hxc22m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc22f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc22f" FieldTextBoxTabIndex="333" DatabaseField="hxc22f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc22s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc22s1" FieldTextBoxTabIndex="334" DatabaseField="hxc22s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc22s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc22s2" FieldTextBoxTabIndex="335" DatabaseField="hxc22s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc22s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc22s3" FieldTextBoxTabIndex="336" DatabaseField="hxc22s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc23m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="23. Suicidal thoughts or gestures" FieldTextBoxTabIndex="337"
											DatabaseField="hxc23m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc23f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc23f" FieldTextBoxTabIndex="338" DatabaseField="hxc23f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc23s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc23s1" FieldTextBoxTabIndex="339" DatabaseField="hxc23s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc23s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc23s2" FieldTextBoxTabIndex="340" DatabaseField="hxc23s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc23s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc23s3" FieldTextBoxTabIndex="341" DatabaseField="hxc23s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc24m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="24. Depression" FieldTextBoxTabIndex="342" DatabaseField="hxc24m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc24f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc24f" FieldTextBoxTabIndex="343" DatabaseField="hxc24f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc24s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc24s1" FieldTextBoxTabIndex="344" DatabaseField="hxc24s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc24s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc24s2" FieldTextBoxTabIndex="345" DatabaseField="hxc24s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc24s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc24s3" FieldTextBoxTabIndex="346" DatabaseField="hxc24s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc25m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="25. Manic-Depression" FieldTextBoxTabIndex="347" DatabaseField="hxc25m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc25f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc25f" FieldTextBoxTabIndex="348" DatabaseField="hxc25f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc25s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc25s1" FieldTextBoxTabIndex="349" DatabaseField="hxc25s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc25s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc25s2" FieldTextBoxTabIndex="350" DatabaseField="hxc25s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc25s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc25s3" FieldTextBoxTabIndex="351" DatabaseField="hxc25s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc26m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="26. Delinquency" FieldTextBoxTabIndex="352" DatabaseField="hxc26m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc26f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc26f" FieldTextBoxTabIndex="353" DatabaseField="hxc26f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc26s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc26s1" FieldTextBoxTabIndex="354" DatabaseField="hxc26s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc26s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc26s2" FieldTextBoxTabIndex="355" DatabaseField="hxc26s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc26s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc26s3" FieldTextBoxTabIndex="356" DatabaseField="hxc26s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc27m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="27. Chronic Illness" FieldTextBoxTabIndex="357" DatabaseField="hxc27m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc27f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc27f" FieldTextBoxTabIndex="358" DatabaseField="hxc27f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc27s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc27s1" FieldTextBoxTabIndex="359" DatabaseField="hxc27s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc27s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc27s2" FieldTextBoxTabIndex="360" DatabaseField="hxc27s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc27s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc27s3" FieldTextBoxTabIndex="361" DatabaseField="hxc27s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc28m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="28. Head trauma " FieldTextBoxTabIndex="362" DatabaseField="hxc28m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc28f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc28f" FieldTextBoxTabIndex="363" DatabaseField="hxc28f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc28s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc28s1" FieldTextBoxTabIndex="364" DatabaseField="hxc28s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc28s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc28s2" FieldTextBoxTabIndex="365" DatabaseField="hxc28s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc28s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc28s3" FieldTextBoxTabIndex="366" DatabaseField="hxc28s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc29m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="29. Loss of Consciousness" FieldTextBoxTabIndex="367" DatabaseField="hxc29m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc29f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc29f" FieldTextBoxTabIndex="368" DatabaseField="hxc29f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc29s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc29s1" FieldTextBoxTabIndex="369" DatabaseField="hxc29s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc29s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc29s2" FieldTextBoxTabIndex="370" DatabaseField="hxc29s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc29s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc29s3" FieldTextBoxTabIndex="371" DatabaseField="hxc29s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc30m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="30. Encephalitis/Meningitis" FieldTextBoxTabIndex="372"
											DatabaseField="hxc30m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc30f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc30f" FieldTextBoxTabIndex="373" DatabaseField="hxc30f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc30s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc30s1" FieldTextBoxTabIndex="374" DatabaseField="hxc30s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc30s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc30s2" FieldTextBoxTabIndex="375" DatabaseField="hxc30s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc30s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc30s3" FieldTextBoxTabIndex="376" DatabaseField="hxc30s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc31m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="31. Metal implants (protheses or braces)" FieldTextBoxTabIndex="377"
											DatabaseField="hxc31m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc31f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc31f" FieldTextBoxTabIndex="378" DatabaseField="hxc31f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc31s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc31s1" FieldTextBoxTabIndex="379" DatabaseField="hxc31s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc31s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc31s2" FieldTextBoxTabIndex="380" DatabaseField="hxc31s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc31s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc31s3" FieldTextBoxTabIndex="381" DatabaseField="hxc31s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc32m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="32. Cerebral vascular disease" FieldTextBoxTabIndex="382"
											DatabaseField="hxc32m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc32f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc32f" FieldTextBoxTabIndex="383" DatabaseField="hxc32f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc32s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc32s1" FieldTextBoxTabIndex="384" DatabaseField="hxc32s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc32s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc32s2" FieldTextBoxTabIndex="385" DatabaseField="hxc32s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc32s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc32s3" FieldTextBoxTabIndex="386" DatabaseField="hxc32s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc33m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="33. Cardiovascular problems" FieldTextBoxTabIndex="387"
											DatabaseField="hxc33m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc33f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc33f" FieldTextBoxTabIndex="388" DatabaseField="hxc33f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc33s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc33s1" FieldTextBoxTabIndex="389" DatabaseField="hxc33s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc33s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc33s2" FieldTextBoxTabIndex="390" DatabaseField="hxc33s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc33s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc33s3" FieldTextBoxTabIndex="391" DatabaseField="hxc33s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc34m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="34. Lung Disease" FieldTextBoxTabIndex="392" DatabaseField="hxc34m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc34f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc34f" FieldTextBoxTabIndex="393" DatabaseField="hxc34f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc34s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc34s1" FieldTextBoxTabIndex="394" DatabaseField="hxc34s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc34s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc34s2" FieldTextBoxTabIndex="395" DatabaseField="hxc34s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc34s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc34s3" FieldTextBoxTabIndex="396" DatabaseField="hxc34s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc35m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="35. Chronic Bronchitis or chronic coughing" FieldTextBoxTabIndex="397"
											DatabaseField="hxc35m" ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc35f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc35f" FieldTextBoxTabIndex="398" DatabaseField="hxc35f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc35s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc35s1" FieldTextBoxTabIndex="399" DatabaseField="hxc35s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc35s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc35s2" FieldTextBoxTabIndex="400" DatabaseField="hxc35s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc35s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc35s3" FieldTextBoxTabIndex="401" DatabaseField="hxc35s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc36m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="36. Asthma" FieldTextBoxTabIndex="402" DatabaseField="hxc36m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc36f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc36f" FieldTextBoxTabIndex="403" DatabaseField="hxc36f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc36s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc36s1" FieldTextBoxTabIndex="404" DatabaseField="hxc36s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc36s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc36s2" FieldTextBoxTabIndex="405" DatabaseField="hxc36s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc36s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc36s3" FieldTextBoxTabIndex="406" DatabaseField="hxc36s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc37m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="37. Thyroid Disease" FieldTextBoxTabIndex="407" DatabaseField="hxc37m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc37f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc37f" FieldTextBoxTabIndex="408" DatabaseField="hxc37f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc37s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc37s1" FieldTextBoxTabIndex="409" DatabaseField="hxc37s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc37s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc37s2" FieldTextBoxTabIndex="410" DatabaseField="hxc37s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc37s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc37s3" FieldTextBoxTabIndex="411" DatabaseField="hxc37s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="hxc38m" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="38. Other Immune Disorder" FieldTextBoxTabIndex="412" DatabaseField="hxc38m"
											ValidList="1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc38f" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc38f" FieldTextBoxTabIndex="413" DatabaseField="hxc38f"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc38s1" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc38s1" FieldTextBoxTabIndex="414" DatabaseField="hxc38s1"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc38s2" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc38s2" FieldTextBoxTabIndex="415" DatabaseField="hxc38s2"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="hxc38s3" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
											IsDoubleEntryField="True" FieldLabelText="hxc38s3" FieldTextBoxTabIndex="416" DatabaseField="hxc38s3"
											ValidList="1,2,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="418" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="419" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="420" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="421" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
