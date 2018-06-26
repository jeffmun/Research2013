<%@ Page language="c#" Inherits="TAP_mullen.tap_mullen" CodeFile="tap_mullen.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="mullen_pk" MeasureName="Mullen" LookupTextBox1LabelText="TAP ID:"
							LookupTextBox2Visible="False" LookupField1="muid" DatabaseTable="tap_mullen" StudyMeasID="354" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="muid" runat="server" DatabaseField="muid" FieldTextBoxTabIndex="2" FieldLabelText="TAP ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="100px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must  look like TAP###" FieldTextBoxWidth="100px"></def:datafieldcontrol></td>
							</tr>
							<TR>
								<TD>
									<def:datafieldcontrol id="mudate" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" FieldDataType="DATE"
										IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
										IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Test date" FieldTextBoxTabIndex="3" DatabaseField="mudate"
										FormatString="{0:d}"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="muclin" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" FieldDataType="TEXT"
										IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Examiner" FieldTextBoxTabIndex="9" DatabaseField="muclin"></def:datafieldcontrol></TD>
							</TR>
						</table>
						<asp:panel id="mainPanel" runat="server">
							<br/>
							<TABLE class="grid" id="Table1">
								<TR>
									<TD vAlign="baseline" width="148"></TD>
									<TD class="heading" width="109">Raw Score<br/>
										(use -999 for<br/>
										missing/blank scores)
									</TD>
									<TD class="heading">T Score</TD>
									<TD class="heading" width="77">Percentile Rank</TD>
									<TD class="heading">Descriptive Category</TD>
									<TD class="heading">Age Equivalent</TD>
								</TR>
								<TR>
									<TD class="heading" width="148">Gross Motor</TD>
									<TD width="109">
										<def:datafieldcontrol id="mugmraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 36, or -999"
											RegEx="^([0-9]|[1-2][0-9]|[3][0-6]|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mugmraw"
											FieldTextBoxTabIndex="10" DatabaseField="mugmraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mugmts" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mugmts" FieldTextBoxTabIndex="15" DatabaseField="mugmts"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="77">
										<def:datafieldcontrol id="mugmpctr" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mugmpctr" FieldTextBoxTabIndex="20" DatabaseField="mugmpctr"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="115">
										<def:datafieldcontrol id="mugmdcat" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mugmdcat" FieldTextBoxTabIndex="25" DatabaseField="mugmdcat"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mugmagee" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mugmagee" FieldTextBoxTabIndex="30" DatabaseField="mugmagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="148">Visual Reception</TD>
									<TD width="109">
										<def:datafieldcontrol id="muvrraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 50 or -999"
											RegEx="^([0-9]|[1-4][0-9]|50|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="muvrraw"
											FieldTextBoxTabIndex="11" DatabaseField="muvrraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="muvrts" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muvrts" FieldTextBoxTabIndex="16" DatabaseField="muvrts"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="77">
										<def:datafieldcontrol id="muvrpctr" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muvrpctr" FieldTextBoxTabIndex="21" DatabaseField="muvrpctr"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="115">
										<def:datafieldcontrol id="muvrdcat" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muvrdcat" FieldTextBoxTabIndex="26" DatabaseField="muvrdcat"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="muvragee" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muvragee" FieldTextBoxTabIndex="31" DatabaseField="muvragee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="148">Fine Motor</TD>
									<TD width="109">
										<def:datafieldcontrol id="mufmraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 49 or -999"
											RegEx="^([0-9]|[1-3][0-9]|[4][0-9]|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="mufmraw"
											FieldTextBoxTabIndex="12" DatabaseField="mufmraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mufmts" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mufmts" FieldTextBoxTabIndex="17" DatabaseField="mufmts"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="77">
										<def:datafieldcontrol id="mufmpctr" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mufmpctr" FieldTextBoxTabIndex="22" DatabaseField="mufmpctr"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="115">
										<def:datafieldcontrol id="mufmdcat" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mufmdcat" FieldTextBoxTabIndex="27" DatabaseField="mufmdcat"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mufmagee" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mufmagee" FieldTextBoxTabIndex="32" DatabaseField="mufmagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="148">Receptive Language</TD>
									<TD width="109">
										<def:datafieldcontrol id="murlraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 48 or -999"
											RegEx="^([0-9]|[1-3][0-9]|[4][0-8]|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="murlraw"
											FieldTextBoxTabIndex="13" DatabaseField="murlraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="murlts" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="murlts" FieldTextBoxTabIndex="18" DatabaseField="murlts"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="77">
										<def:datafieldcontrol id="murlpctr" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="murlpctr" FieldTextBoxTabIndex="23" DatabaseField="murlpctr"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="115">
										<def:datafieldcontrol id="murldcat" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="murldcat" FieldTextBoxTabIndex="28" DatabaseField="murldcat"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="murlagee" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="murlagee" FieldTextBoxTabIndex="33" DatabaseField="murlagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="148">Expressive Language</TD>
									<TD width="109">
										<def:datafieldcontrol id="muelraw" runat="server" FieldTextBoxWidth="50px" RegExDescription="must be between 0 and 50 or -999"
											RegEx="^([0-9]|[1-4][0-9]|50|-999)$" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="muelraw"
											FieldTextBoxTabIndex="14" DatabaseField="muelraw" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="muelts" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muelts" FieldTextBoxTabIndex="19" DatabaseField="muelts"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="77">
										<def:datafieldcontrol id="muelpctr" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muelpctr" FieldTextBoxTabIndex="24" DatabaseField="muelpctr"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD width="115">
										<def:datafieldcontrol id="mueldcat" runat="server" FieldTextBoxWidth="100px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mueldcat" FieldTextBoxTabIndex="29" DatabaseField="mueldcat"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="muelagee" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="muelagee" FieldTextBoxTabIndex="34" DatabaseField="muelagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<def:datafieldcontrol id="mutssum" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
								IsDoubleEntryField="False" FieldLabelText="Cognitive T Score Sum:" FieldTextBoxTabIndex="35" DatabaseField="mutssum"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<br/>
							<TABLE class="grid" id="Table2">
								<TR>
									<TD class="heading" width="93" rowSpan="2">Early Learning Composite</TD>
									<TD class="heading">Standard Score</TD>
									<TD class="heading">Percentile Rank</TD>
									<TD class="heading">Descriptive Category</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mucss" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="mucss"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mucpctr" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mucpctr" FieldTextBoxTabIndex="37" DatabaseField="mucpctr"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="mucdcat" runat="server" FieldTextBoxWidth="100px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="mucdcat" FieldTextBoxTabIndex="38" DatabaseField="mucdcat"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">Ratio IQ</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>Age<br/>
										Equivalent</TD>
									<TD>IQ</TD>
								</TR>
								<TR>
									<TD class="heading">Composite</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="mucoagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="mucoiq"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Non-Verbal</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="munvagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="munviq"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Verbal</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="muvagee"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False"
											IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="mucss" FieldTextBoxTabIndex="36" DatabaseField="muviq"
											ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid" id="Table3">
								<TR>
									<TD>
										<def:datafieldcontrol id="mudob" runat="server" FieldLabelWidth="150px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Birth date:" FieldTextBoxTabIndex="4" DatabaseField="mudob"
											FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="muagem" runat="server" FieldLabelWidth="150px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Age used (months):" FieldTextBoxTabIndex="8" DatabaseField="muagem"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mucageym" runat="server" FieldLabelWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Chronological Age (y-m):" FieldTextBoxTabIndex="6" DatabaseField="mucageym"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR> <!--
								<TR>
									<TD>
										<def:datafieldcontrol id="muadob" runat="server" FieldLabelWidth="150px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Adjusted birth date:" FieldTextBoxTabIndex="4" DatabaseField="muadob"
											FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mugagew" runat="server" FieldLabelWidth="150px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="No. Weeks Gestation (G.A.):" FieldTextBoxTabIndex="5" DatabaseField="mugagew"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="muaageym" runat="server" FieldLabelWidth="150px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Adjusted Age (y:m) (blank if unadjusted):" FieldTextBoxTabIndex="7"
											DatabaseField="muaageym" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								--></TABLE>
							<br/>
							<def:datafieldcontrol id="muvld" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="False"
								IsDoubleEntryField="True" FieldLabelText="Validity (1=Valid, 2=Questionnable Validity, 3=Invalid)"
								FieldTextBoxTabIndex="15" DatabaseField="muvld" ValidList="1,2,3"></def:datafieldcontrol>
							<br/>
							<def:datafieldcontrol id="mucmts" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
								IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="16" DatabaseField="mucmts"
								FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="100px" FieldTextBoxMaxLength="400"></def:datafieldcontrol>
							<TABLE class="layout" id="Table4">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="42" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdby" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdby" FieldTextBoxTabIndex="43" DatabaseField="createdby"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="44" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedby" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedby" FieldTextBoxTabIndex="45" DatabaseField="updatedby"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel>
					</asp:Content>
