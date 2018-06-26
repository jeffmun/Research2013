<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="gen_dsmdx.gen_dsmdx" CodeFile="gen_dsmdx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_dsmdx" LookupField1="indid"
							LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN DSM Dx" PrimaryKeyField="dsmdx_pk"
							VerifiedField="verified" StudyMeasID="144"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="indid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="indid" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dsmclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="3" DatabaseField="dsmclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<P>Enter 1 for a checked or endorsed symptom. Enter 0 for blanks or symptoms not 
								endorsed.
							</P>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">A. Social</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc1" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc1"
											FieldTextBoxTabIndex="3" FieldLabelText="a. Impaired nonverbals " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc2"
											FieldTextBoxTabIndex="4" FieldLabelText="b. Lack of peer relations " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc3"
											FieldTextBoxTabIndex="5" FieldLabelText="c. Lack of shared enjoyment " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc4" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc4"
											FieldTextBoxTabIndex="6" FieldLabelText="d. Lack of social/emotional  reciprocity " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">B. Communication</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom1" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom1"
											FieldTextBoxTabIndex="7" FieldLabelText="a. Delay in language, no compensation " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom2"
											FieldTextBoxTabIndex="8" FieldLabelText="b. Impaired conversation " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom3"
											FieldTextBoxTabIndex="9" FieldLabelText="c. Sterotyped, repetitive language" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom4" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom4"
											FieldTextBoxTabIndex="10" FieldLabelText="d. Impaired pretend play " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">C. Restricted, repetitive, stereotyped patterns</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep1" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep1"
											FieldTextBoxTabIndex="11" FieldLabelText="a. Preccupation, restricted interest " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep2"
											FieldTextBoxTabIndex="12" FieldLabelText="b. Inflexible routines/rituals " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep3"
											FieldTextBoxTabIndex="13" FieldLabelText="c. Stereotyped motor movements" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep4" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep4"
											FieldTextBoxTabIndex="14" FieldLabelText="d. Preoccupation with parts of objects" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">DSM Clinical Dx. Click one of:<BR>
										<A href="javascript:setFieldValue('dsmdx','Autism');giveFieldFocus('dsmdxcur')">Autism</A>,
										<A href="javascript:setFieldValue('dsmdx','PDD-NOS');giveFieldFocus('dsmdxcur')">PDD-NOS</A>,
										<A href="javascript:setFieldValue('dsmdx','Asperger\'s');giveFieldFocus('dsmdxcur')">
											Asperger's</A>, <A href="javascript:setFieldValue('dsmdx','Broader Phen');giveFieldFocus('dsmdxcur')">
											Broader Phen</A>, <A href="javascript:setFieldValue('dsmdx','No Dx');giveFieldFocus('dsmdxcur')">
											No Dx</A>, <A href="javascript:setFieldValue('dsmdx','Need more info');giveFieldFocus('dsmdxcur')">
											Need more info</A>, <A href="javascript:setFieldValue('dsmdx','Rett\'s Synd');giveFieldFocus('dsmdxcur')">
											Rett's Synd</A>, <A href="javascript:setFieldValue('dsmdx','Down Synd');giveFieldFocus('dsmdxcur')">
											Down Synd</A>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmdx" runat="server" DatabaseField="dsmdx" FieldTextBoxTabIndex="16" FieldLabelText="DSM dx:"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ValidList="Autism, PDD-NOS, Asperger's, Broader Phen, No Dx, Need more info, Rett's Synd, Down Synd"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Current Dx, if different from ever.
										<BR>
										Leave blank if current and ever are the same.<BR>
										Click one of:<BR>
										<A href="javascript:setFieldValue('dsmdxcur','Autism');giveFieldFocus('dsmcmnt')">Autism</A>,
										<A href="javascript:setFieldValue('dsmdxcur','PDD-NOS');giveFieldFocus('dsmcmnt')">PDD-NOS</A>,
										<A href="javascript:setFieldValue('dsmdxcur','Asperger\'s');giveFieldFocus('dsmcmnt')">
											Asperger's</A>, <A href="javascript:setFieldValue('dsmdxcur','Broader Phen');giveFieldFocus('dsmcmnt')">
											Broader Phen</A>, <A href="javascript:setFieldValue('dsmdxcur','No Dx');giveFieldFocus('dsmcmnt')">
											No Dx</A>, <A href="javascript:setFieldValue('dsmdxcur','Need more info');giveFieldFocus('dsmcmnt')">
											Need more info</A>, <A href="javascript:setFieldValue('dsmdxcur','Rett\'s Synd');giveFieldFocus('dsmcmnt')">
											Rett's Synd</A>, <A href="javascript:setFieldValue('dsmdxcur','Down Synd');giveFieldFocus('dsmcmnt')">
											Down Synd</A>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmdxcur" runat="server" DatabaseField="dsmdxcur" FieldTextBoxTabIndex="17"
											FieldLabelText="Current Dx:" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ValidList="Autism, PDD-NOS, Asperger's, Broader Phen, No Dx, Need more info, Rett's Synd, Down Synd"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="dsmcmnt" FieldTextBoxTabIndex="22"
											FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="80"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="23"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="24"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="25"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="26"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
