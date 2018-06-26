<%@ Page language="c#" Inherits="gen_meas.gen_meas" CodeFile="gen_meas.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="meas_pk"
							MeasureName="GEN Measurements" LookupTextBox2Visible="False" LookupTextBox1LabelText="GEN ID:" LookupField1="indid"
							DatabaseTable="gen_meas" StudyMeasID="288"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="INDid" runat="server" DatabaseField="INDid" FieldTextBoxTabIndex="2" FieldLabelText="GEN ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="MeasDate" runat="server" DatabaseField="MeasDate" FieldTextBoxTabIndex="3" FieldLabelText="Date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
						</table>
						<script language="javascript">
						
						function doConvertToCM(e)
						{
						
							
							if(e.keyCode==13)
							{
								//alert(e.srcElement.value);
								var val = parseFloat(e.srcElement.value);
								if (!isNaN(val))
								{
									e.srcElement.value = val * 2.54;
									e.keyCode=9;
									
								}
							
							
							} 
						}
						
						</script>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">Convert inches to cm:</TD>
								</TR>
								<TR>
									<TD>Enter inches the hit return: <INPUT id="convert" onkeydown="doConvertToCM(event);" type="text"></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="3">Convert fractions to decimals:</TD>
								</TR>
								<TR>
									<TD>1/8 = 0.125<BR>
										3/8 = 0.375<BR>
										5/8 = 0.625<BR>
										7/8 = 0.875</TD>
									<TD>1/16 = 0.0625<BR>
										3/16 = 0.1875<BR>
										5/16 = 0.3125<BR>
										7/16 = 0.4375</TD>
									<TD>9/16 = 0.5625<BR>
										11/16 = 0.6875<BR>
										13/16 = 0.8125<BR>
										15/16 = 0.9375</TD>
								</TR>
							</TABLE>
							<BR>
							<H4>Enter -999 for missing values.</H4>
							<TABLE class="grid">
								<TR>
									<TD class="heading"></TD>
									<TD class="heading">Circ (cm):</TD>
									<TD class="heading">Length (in):</TD>
									<TD class="heading">Width (in):</TD>
									<TD class="heading">Height (cm):</TD>
								</TR>
								<TR>
									<TD class="heading">1</TD>
									<TD>
										<def:datafieldcontrol id="CIRC" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="CIRC" FieldTextBoxTabIndex="4" DatabaseField="CIRC" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="LENG" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="LENG" FieldTextBoxTabIndex="5" DatabaseField="LENG" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="WIDTH" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="WIDTH" FieldTextBoxTabIndex="6" DatabaseField="WIDTH" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HEIGHT" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="HEIGHT" FieldTextBoxTabIndex="7" DatabaseField="HEIGHT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">2</TD>
									<TD>
										<def:datafieldcontrol id="CIRC2" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="CIRC2" FieldTextBoxTabIndex="8" DatabaseField="CIRC2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="LENG2" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="LENG2" FieldTextBoxTabIndex="9" DatabaseField="LENG2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="WIDTH2" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="WIDTH2" FieldTextBoxTabIndex="10" DatabaseField="WIDTH2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HEIGHT2" runat="server" FieldTextBoxWidth="70px" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="HEIGHT2" FieldTextBoxTabIndex="11" DatabaseField="HEIGHT2" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">Measurement</TD>
									<TD class="heading">Z</TD>
									<TD class="heading">Detail</TD>
								</TR>
								<TR>
									<TD class="heading">Mean OFC</TD>
									<TD>
										<def:datafieldcontrol id="OFC" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC"
											FieldTextBoxTabIndex="14" DatabaseField="OFC" ShowFieldLabel="False" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="496"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="OFC_Z" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC_Z"
											FieldTextBoxTabIndex="17" DatabaseField="OFC_Z" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="OFC_txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC_txt"
											FieldTextBoxTabIndex="20" DatabaseField="OFC_txt" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">OFC 1</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False"
											FieldLabelText="OFC" FieldTextBoxTabIndex="14" DatabaseField="CIRC" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="561"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="OFC1_Z" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC1_Z"
											FieldTextBoxTabIndex="15" DatabaseField="OFC1_Z" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="OFC1_txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC1_txt"
											FieldTextBoxTabIndex="18" DatabaseField="OFC1_txt" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">OFC 2</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False"
											FieldLabelText="CIRC2" FieldTextBoxTabIndex="14" DatabaseField="CIRC2" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="OFC2_Z" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC2_Z"
											FieldTextBoxTabIndex="16" DatabaseField="OFC2_Z" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="OFC2_txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="OFC2_txt"
											FieldTextBoxTabIndex="19" DatabaseField="OFC2_txt" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Mean HT</TD>
									<TD>
										<def:datafieldcontrol id="HT" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT"
											FieldTextBoxTabIndex="21" DatabaseField="HT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="518"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HT_Z" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT_Z"
											FieldTextBoxTabIndex="24" DatabaseField="HT_Z" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HT_txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT_txt"
											FieldTextBoxTabIndex="27" DatabaseField="HT_txt" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">HT 1</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="HT" FieldTextBoxTabIndex="21" DatabaseField="HEIGHT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True" DESIGNTIMEDRAGDROP="563"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HT1_Z" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT1_Z"
											FieldTextBoxTabIndex="22" DatabaseField="HT1_Z" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HT1_txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT1_txt"
											FieldTextBoxTabIndex="25" DatabaseField="HT1_txt" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">HT 2</TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="FLOAT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="HT" FieldTextBoxTabIndex="21" DatabaseField="HEIGHT2" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HT2_Z" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT2_Z"
											FieldTextBoxTabIndex="23" DatabaseField="HT2_Z" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HT2_txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="HT2_txt"
											FieldTextBoxTabIndex="26" DatabaseField="HT2_txt" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="MeasComments" runat="server" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="12"
											DatabaseField="MeasComments" FieldTextBoxMaxLength="100" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="VLD" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="Validity (1=valid, 2=questionable,3=invalid)" FieldTextBoxTabIndex="13" DatabaseField="VLD"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="15" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="16" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="17" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="18" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
