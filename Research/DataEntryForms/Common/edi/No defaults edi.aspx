<%@ Page language="c#" Inherits="kt_edi.kt_edi" CodeFile="edi.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">




		<script language="javascript">

function edi_onBlur(sFieldID)
{
	unselectField();
			

	switch (sFieldID) {
	
		case "<%= EDIinj.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIinj1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIinj2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIinj3.ClientID %>", "8");
			}
			break;
		case "<%= EDIdear.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIdear1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIdear2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIdear3.ClientID %>", "8");
			}
			break;
		case "<%= EDIconf.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIconf1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIconf2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIconf3.ClientID %>", "8");			
			}
			break;
		case "<%= EDIlegl.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIlegl1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIlegl2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIlegl3.ClientID %>", "8");
			}
			break;
		case "<%= EDIemp.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIemp1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIemp2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIemp3.ClientID %>", "8");
			}
			break;
		case "<%= EDIcrim.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIcrim1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIcrim2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIcrim3.ClientID %>", "8");
			}
			break;
		case "<%= EDIsotA.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIsotA1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIsotA2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIsotA3.ClientID %>", "8");
			}
			break;
		case "<%= EDIsotB.ClientID %>":
			if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank("<%= EDIsotB1.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIsotB2.ClientID %>", "8");
				setFieldValueIfBlank("<%= EDIsotB3.ClientID %>", "8");
			}
			break;
	}
}


	
		</script>


						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_edi" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="EDI" PrimaryKeyField="edi_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" ShowScoreButton="True"
							AllowedStudyMeasures="343,557,568,1688,1727,1772,1812,1830,1856,1873,1874,1875"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="EDIdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interview Date"
										FieldTextBoxTabIndex="3" DatabaseField="EDIdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="EDIintv" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interviewer"
										FieldTextBoxTabIndex="4" DatabaseField="EDIintv" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel id="mainPanel" Runat="server">
							<def:datafieldcontrol id="EDIscmsg" runat="server" FieldLabelWidth="100px" DatabaseField="EDIscmsg" FieldTextBoxTabIndex="231"
								FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>AGE</TD>
									<TD class="heading">Comm</TD>
									<TD class="heading">Regulatory</TD>
									<TD class="heading">Rep<BR>
										Behavior</TD>
									<TD class="heading">Social</TD>
									<TD class="heading">Sensory</TD>
									<TD class="heading">Tone</TD>
									<TD class="heading">Other</TD>
									<TD>TOTALS</TD>
								</TR>
								<TR>
									<TD class="heading">0-3</TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIrg_00" runat="server" DatabaseField="EDIrg_00" FieldTextBoxTabIndex="168"
											FieldLabelText="EDIrg_00" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_00" runat="server" DatabaseField="EDIse_00" FieldTextBoxTabIndex="169"
											FieldLabelText="EDIse_00" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIt_00" runat="server" DatabaseField="EDIt_00" FieldTextBoxTabIndex="170" FieldLabelText="EDIt_00"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_00" runat="server" DatabaseField="EDIx_00" FieldTextBoxTabIndex="171" FieldLabelText="EDIx_00"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_00" runat="server" DatabaseField="EDIat_00" FieldTextBoxTabIndex="212"
											FieldLabelText="EDIat_00" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">4-6</TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIrg_04" runat="server" DatabaseField="EDIrg_04" FieldTextBoxTabIndex="172"
											FieldLabelText="EDIrg_04" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_04" runat="server" DatabaseField="EDIs_04" FieldTextBoxTabIndex="173" FieldLabelText="EDIs_04"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_04" runat="server" DatabaseField="EDIse_04" FieldTextBoxTabIndex="174"
											FieldLabelText="EDIse_04" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIt_04" runat="server" DatabaseField="EDIt_04" FieldTextBoxTabIndex="175" FieldLabelText="EDIt_04"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_04" runat="server" DatabaseField="EDIx_04" FieldTextBoxTabIndex="176" FieldLabelText="EDIx_04"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_04" runat="server" DatabaseField="EDIat_04" FieldTextBoxTabIndex="213"
											FieldLabelText="EDIat_04" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">7-9</TD>
									<TD>
										<def:datafieldcontrol id="EDIc_07" runat="server" DatabaseField="EDIc_07" FieldTextBoxTabIndex="177" FieldLabelText="EDIc_07"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIrg_07" runat="server" DatabaseField="EDIrg_07" FieldTextBoxTabIndex="178"
											FieldLabelText="EDIrg_07" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_07" runat="server" DatabaseField="EDIs_07" FieldTextBoxTabIndex="179" FieldLabelText="EDIs_07"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_07" runat="server" DatabaseField="EDIse_07" FieldTextBoxTabIndex="180"
											FieldLabelText="EDIse_07" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIt_07" runat="server" DatabaseField="EDIt_07" FieldTextBoxTabIndex="181" FieldLabelText="EDIt_07"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_07" runat="server" DatabaseField="EDIx_07" FieldTextBoxTabIndex="182" FieldLabelText="EDIx_07"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_07" runat="server" DatabaseField="EDIat_07" FieldTextBoxTabIndex="214"
											FieldLabelText="EDIat_07" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">10-12</TD>
									<TD>
										<def:datafieldcontrol id="EDIc_10" runat="server" DatabaseField="EDIc_10" FieldTextBoxTabIndex="183" FieldLabelText="EDIc_10"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIrg_10" runat="server" DatabaseField="EDIrg_10" FieldTextBoxTabIndex="185"
											FieldLabelText="EDIrg_10" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIr_10" runat="server" DatabaseField="EDIr_10" FieldTextBoxTabIndex="184" FieldLabelText="EDIr_10"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_10" runat="server" DatabaseField="EDIs_10" FieldTextBoxTabIndex="186" FieldLabelText="EDIs_10"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_10" runat="server" DatabaseField="EDIse_10" FieldTextBoxTabIndex="187"
											FieldLabelText="EDIse_10" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIt_10" runat="server" DatabaseField="EDIt_10" FieldTextBoxTabIndex="188" FieldLabelText="EDIt_10"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_10" runat="server" DatabaseField="EDIx_10" FieldTextBoxTabIndex="189" FieldLabelText="EDIx_10"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_10" runat="server" DatabaseField="EDIat_10" FieldTextBoxTabIndex="215"
											FieldLabelText="EDIat_10" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">13-15</TD>
									<TD>
										<def:datafieldcontrol id="EDIc_13" runat="server" DatabaseField="EDIc_13" FieldTextBoxTabIndex="190" FieldLabelText="EDIc_13"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIrg_13" runat="server" DatabaseField="EDIrg_13" FieldTextBoxTabIndex="192"
											FieldLabelText="EDIrg_13" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIr_13" runat="server" DatabaseField="EDIr_13" FieldTextBoxTabIndex="191" FieldLabelText="EDIr_13"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_13" runat="server" DatabaseField="EDIs_13" FieldTextBoxTabIndex="193" FieldLabelText="EDIs_13"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_13" runat="server" DatabaseField="EDIse_13" FieldTextBoxTabIndex="194"
											FieldLabelText="EDIse_13" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIt_13" runat="server" DatabaseField="EDIt_13" FieldTextBoxTabIndex="195" FieldLabelText="EDIt_13"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_13" runat="server" DatabaseField="EDIx_13" FieldTextBoxTabIndex="196" FieldLabelText="EDIx_13"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_13" runat="server" DatabaseField="EDIat_13" FieldTextBoxTabIndex="216"
											FieldLabelText="EDIat_13" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="1503" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">16-18</TD>
									<TD>
										<def:datafieldcontrol id="EDIc_16" runat="server" DatabaseField="EDIc_16" FieldTextBoxTabIndex="197" FieldLabelText="EDIc_16"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIr_16" runat="server" DatabaseField="EDIr_16" FieldTextBoxTabIndex="198" FieldLabelText="EDIr_16"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_16" runat="server" DatabaseField="EDIs_16" FieldTextBoxTabIndex="199" FieldLabelText="EDIs_16"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_16" runat="server" DatabaseField="EDIse_16" FieldTextBoxTabIndex="200"
											FieldLabelText="EDIse_16" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_16" runat="server" DatabaseField="EDIx_16" FieldTextBoxTabIndex="201" FieldLabelText="EDIx_16"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_16" runat="server" DatabaseField="EDIat_16" FieldTextBoxTabIndex="217"
											FieldLabelText="EDIat_16" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">19-21</TD>
									<TD>
										<def:datafieldcontrol id="EDIc_19" runat="server" DatabaseField="EDIc_19" FieldTextBoxTabIndex="202" FieldLabelText="EDIc_19"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIr_19" runat="server" DatabaseField="EDIr_19" FieldTextBoxTabIndex="203" FieldLabelText="EDIr_19"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_19" runat="server" DatabaseField="EDIs_19" FieldTextBoxTabIndex="204" FieldLabelText="EDIs_19"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_19" runat="server" DatabaseField="EDIse_19" FieldTextBoxTabIndex="205"
											FieldLabelText="EDIse_19" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_19" runat="server" DatabaseField="EDIx_19" FieldTextBoxTabIndex="206" FieldLabelText="EDIx_19"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_19" runat="server" DatabaseField="EDIat_19" FieldTextBoxTabIndex="218"
											FieldLabelText="EDIat_19" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">22-24</TD>
									<TD>
										<def:datafieldcontrol id="EDIc_22" runat="server" DatabaseField="EDIc_22" FieldTextBoxTabIndex="207" FieldLabelText="EDIc_22"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIr_22" runat="server" DatabaseField="EDIr_22" FieldTextBoxTabIndex="208" FieldLabelText="EDIr_22"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIs_22" runat="server" DatabaseField="EDIs_22" FieldTextBoxTabIndex="209" FieldLabelText="EDIs_22"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIse_22" runat="server" DatabaseField="EDIse_22" FieldTextBoxTabIndex="210"
											FieldLabelText="EDIse_22" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD>
										<def:datafieldcontrol id="EDIx_22" runat="server" DatabaseField="EDIx_22" FieldTextBoxTabIndex="211" FieldLabelText="EDIx_22"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIat_22" runat="server" DatabaseField="EDIat_22" FieldTextBoxTabIndex="219"
											FieldLabelText="EDIat_22" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>TOTALS</TD>
									<TD>
										<def:datafieldcontrol id="EDIct_c" runat="server" DatabaseField="EDIct_c" FieldTextBoxTabIndex="220" FieldLabelText="EDIct_c"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIct_rg" runat="server" DatabaseField="EDIct_rg" FieldTextBoxTabIndex="222"
											FieldLabelText="EDIct_rg" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIct_r" runat="server" DatabaseField="EDIct_r" FieldTextBoxTabIndex="221" FieldLabelText="EDIct_r"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIct_s" runat="server" DatabaseField="EDIct_s" FieldTextBoxTabIndex="223" FieldLabelText="EDIct_s"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIct_se" runat="server" DatabaseField="EDIct_se" FieldTextBoxTabIndex="224"
											FieldLabelText="EDIct_se" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIct_t" runat="server" DatabaseField="EDIct_t" FieldTextBoxTabIndex="225" FieldLabelText="EDIct_t"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIct_x" runat="server" DatabaseField="EDIct_x" FieldTextBoxTabIndex="226" FieldLabelText="EDIct_x"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1513" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIgtot" runat="server" DatabaseField="EDIgtot" FieldTextBoxTabIndex="227" FieldLabelText="EDIgtot"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="1514" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="EDIfamt" runat="server" FieldLabelWidth="100px" DatabaseField="EDIfamt" FieldTextBoxTabIndex="228"
								FieldLabelText="Family Changes:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="EDImedt" runat="server" FieldLabelWidth="100px" DatabaseField="EDImedt" FieldTextBoxTabIndex="229"
								FieldLabelText="Child Medical Events:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="EDIstrt" runat="server" FieldLabelWidth="100px" DatabaseField="EDIstrt" FieldTextBoxTabIndex="230"
								FieldLabelText="Stressful Event:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD bgColor="#a1b5cf">0-3 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI01" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI01"
											FieldTextBoxTabIndex="5" FieldLabelText="1. Difficult to hold, cuddle? (no molding to body)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI02" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI02"
											FieldTextBoxTabIndex="6" FieldLabelText="2. Exceptionally fussy, difficult to soothe? (not related to colic)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI03" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI03"
											FieldTextBoxTabIndex="7" FieldLabelText="3. Exceptionally easy baby, content doing own thing?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI04" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI04"
											FieldTextBoxTabIndex="8" FieldLabelText="4. Overly sensitive/lack of sensitivity to noise, tactile input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI05" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI05"
											FieldTextBoxTabIndex="9" FieldLabelText="5. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI06" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI06"
											FieldTextBoxTabIndex="10" FieldLabelText="6. Feeding problems? (sucking problems, choking, regurgitation, arching, anxiousness, refusal to feed)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI07" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI07"
											FieldTextBoxTabIndex="11" FieldLabelText="7. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI08" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI08"
											FieldTextBoxTabIndex="13" FieldLabelText="8. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI08ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI08ot" FieldTextBoxTabIndex="13"
											FieldLabelText="EDI08ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">4-6 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI09" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI09"
											FieldTextBoxTabIndex="14" FieldLabelText="9. Difficult to hold, cuddle? (no molding to body)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI10" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI10"
											FieldTextBoxTabIndex="15" FieldLabelText="10. Exceptionally fussy, difficult to soothe? (not related to colic)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI11" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI11"
											FieldTextBoxTabIndex="16" FieldLabelText="11. Exceptionally easy baby (content doing own thing)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI12" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI12"
											FieldTextBoxTabIndex="17" FieldLabelText="12. Overly sensitive/lack of sensitivity to noise, tactile input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI13" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI13"
											FieldTextBoxTabIndex="18" FieldLabelText="13. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI14" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI14"
											FieldTextBoxTabIndex="19" FieldLabelText="14. Feeding problems? (sucking problems, choking, regurgitation, arching, anxiousness, refusal to feed)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI15" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI15"
											FieldTextBoxTabIndex="20" FieldLabelText="15. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI16" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI16"
											FieldTextBoxTabIndex="21" FieldLabelText="16.  Lack of smiling at people?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI17" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI17"
											FieldTextBoxTabIndex="22" FieldLabelText="17. Exceptionally long attention span for nonsocial things?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI18" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI18"
											FieldTextBoxTabIndex="23" FieldLabelText="18. Exceptionally long attention span for social things (i.e. watching people)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI19" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI19"
											FieldTextBoxTabIndex="25" FieldLabelText="19. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI19ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI19ot" FieldTextBoxTabIndex="25"
											FieldLabelText="EDI19ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">7-9 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI20" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI20"
											FieldTextBoxTabIndex="26" FieldLabelText="20. Difficult to hold, cuddle? (no molding to body)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI21" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI21"
											FieldTextBoxTabIndex="27" FieldLabelText="21. Exceptionally fussy, difficult to soothe?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI22" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI22"
											FieldTextBoxTabIndex="28" FieldLabelText="22. Exceptionally easy baby (content doing own thing)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI23" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI23"
											FieldTextBoxTabIndex="29" FieldLabelText="23. Overly sensitive/lack of sensitivity to noise, tactile input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI24" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI24"
											FieldTextBoxTabIndex="30" FieldLabelText="24. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI25" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI25"
											FieldTextBoxTabIndex="31" FieldLabelText="25. Feeding problems? (sucking problems, choking, regurgitation, arching, anxiousness, refusal to feed)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI26" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI26"
											FieldTextBoxTabIndex="32" FieldLabelText="26. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI27" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI27"
											FieldTextBoxTabIndex="33" FieldLabelText="27. Lack of smiling at people?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI28" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI28"
											FieldTextBoxTabIndex="34" FieldLabelText="28. Difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI29" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI29"
											FieldTextBoxTabIndex="35" FieldLabelText="29. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI30" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI30"
											FieldTextBoxTabIndex="36" FieldLabelText="30. Failure to use vocalizations socially?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI31" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI31"
											FieldTextBoxTabIndex="37" FieldLabelText="31. Exceptionally long attention span for nonsocial things?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI32" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI32"
											FieldTextBoxTabIndex="38" FieldLabelText="32. Exceptionally long attention span for social things (i.e. watching people, social games)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI33" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI33"
											FieldTextBoxTabIndex="40" FieldLabelText="33. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI33ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI33ot" FieldTextBoxTabIndex="40"
											FieldLabelText="EDI33ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">10-12 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI31b" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI31b"
											FieldTextBoxTabIndex="40" FieldLabelText="31. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI32b" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI32b"
											FieldTextBoxTabIndex="40" FieldLabelText="32. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI33b" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI33b"
											FieldTextBoxTabIndex="40" FieldLabelText="33. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI34" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI34"
											FieldTextBoxTabIndex="41" FieldLabelText="34. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI35" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI35"
											FieldTextBoxTabIndex="42" FieldLabelText="35. Excessive mouthing? (frequent mouthing when not teething)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI36" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI36"
											FieldTextBoxTabIndex="43" FieldLabelText="36. Lack of smiling at people?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI37" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI37"
											FieldTextBoxTabIndex="44" FieldLabelText="37. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI38" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI38"
											FieldTextBoxTabIndex="45" FieldLabelText="38. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI39" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI39"
											FieldTextBoxTabIndex="46" FieldLabelText="39. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI40" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI40"
											FieldTextBoxTabIndex="47" FieldLabelText="40. Lack of babbling?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI41" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI41"
											FieldTextBoxTabIndex="48" FieldLabelText="41. Failure to use vocalizations socially/lack of imitative babbling?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI42" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI42"
											FieldTextBoxTabIndex="50" FieldLabelText="42. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI42ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI42ot" FieldTextBoxTabIndex="50"
											FieldLabelText="EDI42ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">13-15 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI43" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI43"
											FieldTextBoxTabIndex="51" FieldLabelText="43. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI44" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI44"
											FieldTextBoxTabIndex="52" FieldLabelText="44. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI45" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI45"
											FieldTextBoxTabIndex="53" FieldLabelText="45. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI46" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI46"
											FieldTextBoxTabIndex="54" FieldLabelText="46. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI47" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI47"
											FieldTextBoxTabIndex="55" FieldLabelText="47. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI48" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI48"
											FieldTextBoxTabIndex="56" FieldLabelText="48. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI49" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI49"
											FieldTextBoxTabIndex="57" FieldLabelText="49. Lack of interest in interactive baby games? (did not actively participate)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI50" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI50"
											FieldTextBoxTabIndex="58" FieldLabelText="50. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI51" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI51"
											FieldTextBoxTabIndex="59" FieldLabelText="51. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI52" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI52"
											FieldTextBoxTabIndex="60" FieldLabelText="52. Failure to show objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI53" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI53"
											FieldTextBoxTabIndex="61" FieldLabelText="53. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI54" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI54"
											FieldTextBoxTabIndex="62" FieldLabelText="54. Failure to use words meaningfully?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI55" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI55"
											FieldTextBoxTabIndex="64" FieldLabelText="55. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI55ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI55ot" FieldTextBoxTabIndex="64"
											FieldLabelText="EDI55ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">16-18 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI56" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI56"
											FieldTextBoxTabIndex="65" FieldLabelText="56. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI57" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI57"
											FieldTextBoxTabIndex="66" FieldLabelText="57. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI58" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI58"
											FieldTextBoxTabIndex="67" FieldLabelText="58. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI59" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI59"
											FieldTextBoxTabIndex="68" FieldLabelText="59. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI60" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI60"
											FieldTextBoxTabIndex="69" FieldLabelText="60. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI61" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI61"
											FieldTextBoxTabIndex="70" FieldLabelText="61. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI62" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI62"
											FieldTextBoxTabIndex="71" FieldLabelText="62. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI63" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI63"
											FieldTextBoxTabIndex="72" FieldLabelText="63. Failure to increase vocabulary/language from previous timepoint?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI64" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI64"
											FieldTextBoxTabIndex="73" FieldLabelText="64. Failure to imitate actions on objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI65" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI65"
											FieldTextBoxTabIndex="74" FieldLabelText="65. Failure to use formal gestures (e.g. waving bye-bye, clapping at appropriate times)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI66" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI66"
											FieldTextBoxTabIndex="75" FieldLabelText="66. Placed adult's hand on desired objects/moved adult's hand?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI67" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI67"
											FieldTextBoxTabIndex="77" FieldLabelText="67.  Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI67ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI67ot" FieldTextBoxTabIndex="77"
											FieldLabelText="EDI67ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">19-21 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI68" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI68"
											FieldTextBoxTabIndex="78" FieldLabelText="68. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI69" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI69"
											FieldTextBoxTabIndex="79" FieldLabelText="69. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI70" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI70"
											FieldTextBoxTabIndex="80" FieldLabelText="70. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI71" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI71"
											FieldTextBoxTabIndex="81" FieldLabelText="71. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI72" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI72"
											FieldTextBoxTabIndex="82" FieldLabelText="72. Failure to follow point/gaze?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI73" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI73"
											FieldTextBoxTabIndex="83" FieldLabelText="73. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI74" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI74"
											FieldTextBoxTabIndex="84" FieldLabelText="74. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI75" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI75"
											FieldTextBoxTabIndex="85" FieldLabelText="75. Failure to increase vocabulary/language from previous timepoint?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI76" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI76"
											FieldTextBoxTabIndex="86" FieldLabelText="76.  Failure to use formal gestures? (e.g. waving bye-bye, clapping at appropriate times)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI77" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI77"
											FieldTextBoxTabIndex="87" FieldLabelText="77. Failure to imitate actions on objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI78" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI78"
											FieldTextBoxTabIndex="88" FieldLabelText="78. Placed adult's hand on desired objects/moved adult's hand?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI79" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI79"
											FieldTextBoxTabIndex="90" FieldLabelText="79. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI79ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI79ot" FieldTextBoxTabIndex="90"
											FieldLabelText="EDI79ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">22-24 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI80" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI80"
											FieldTextBoxTabIndex="91" FieldLabelText="80. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI81" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI81"
											FieldTextBoxTabIndex="92" FieldLabelText="81. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI82" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI82"
											FieldTextBoxTabIndex="93" FieldLabelText="82. Lack of orienting name?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI83" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI83"
											FieldTextBoxTabIndex="94" FieldLabelText="83. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI84" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI84"
											FieldTextBoxTabIndex="95" FieldLabelText="84. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI85" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI85"
											FieldTextBoxTabIndex="96" FieldLabelText="85. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI86" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI86"
											FieldTextBoxTabIndex="97" FieldLabelText="86. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI87" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI87"
											FieldTextBoxTabIndex="98" FieldLabelText="87. Failure to use increase language/vocabulary from previous timepoint?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI88" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI88"
											FieldTextBoxTabIndex="99" FieldLabelText="88. Failure to combine words?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI89" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI89"
											FieldTextBoxTabIndex="100" FieldLabelText="89. Failure to use formal gestures? (e.g. waving bye-bye, clapping at appropriate times)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI90" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI90"
											FieldTextBoxTabIndex="101" FieldLabelText="90. Placed adult's hand on desired objects/moved adult's hand?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI91" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI91"
											FieldTextBoxTabIndex="102" FieldLabelText="91. Had routines/rituals?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI92" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI92"
											FieldTextBoxTabIndex="103" FieldLabelText="92. Had unusual attachments to objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI93" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI93"
											FieldTextBoxTabIndex="105" FieldLabelText="93. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI93ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI93ot" FieldTextBoxTabIndex="105"
											FieldLabelText="EDI93ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">Family Changes</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIbir" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIbir"
											FieldTextBoxTabIndex="106" FieldLabelText="Birth of sibling" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIdea" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIdea"
											FieldTextBoxTabIndex="107" FieldLabelText="Death of familiar family member" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIdiv" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIdiv"
											FieldTextBoxTabIndex="108" FieldLabelText="Divorce of parents" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDImar" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDImar"
											FieldTextBoxTabIndex="109" FieldLabelText="Marriage of a parent" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDImov" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDImov"
											FieldTextBoxTabIndex="110" FieldLabelText="Move to a new home" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDItem" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDItem"
											FieldTextBoxTabIndex="111" FieldLabelText="Temporary absence of a family member" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIper" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIper"
											FieldTextBoxTabIndex="112" FieldLabelText="Permanent absence of a family member" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIchc" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIchc"
											FieldTextBoxTabIndex="113" FieldLabelText="Changes in caretakers" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIchs" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIchs"
											FieldTextBoxTabIndex="114" FieldLabelText="Changes in schedule/work" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">Child Medical Events</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIsei" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIsei"
											FieldTextBoxTabIndex="115" FieldLabelText="Seizure" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIhea" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIhea"
											FieldTextBoxTabIndex="116" FieldLabelText="Head injury" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIothi" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIothi"
											FieldTextBoxTabIndex="117" FieldLabelText="Other injuries and minor physical traumas" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIhifv" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIhifv"
											FieldTextBoxTabIndex="118" FieldLabelText="High fever" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIhosp" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIhosp"
											FieldTextBoxTabIndex="119" FieldLabelText="Hospitalization" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDImill" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDImill"
											FieldTextBoxTabIndex="120" FieldLabelText="Minor illness" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD bgColor="#a1b5cf" colSpan="5">Stressful Events</TD>
								</TR>
								<TR>
									<TD colSpan="2">Stressful Event<BR>
										<B>0</B>=No, <B>1</B>=possible, <B>2</B>=definite, <B>9</B>=missing<BR>
										(if 0 then enter 8's for all 3 trimesters)</TD>
									<TD colSpan="3">Trimester
										<BR>
										<B>0</B>=event did not occur within, <B>1</B>=event occured anytime within, <B>8</B>=N/A,
										<B>9</B>=missing</TD>
								</TR>
								<TR>
									<TD colSpan="2"></TD>
									<TD align="center">1</TD>
									<TD align="center">2</TD>
									<TD align="center">3</TD>
								</TR>
								<TR>
									<TD>Injury/illness to relatives or friends</TD>
									<TD>
										<def:datafieldcontrol id="EDIinj" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIinj"
											FieldTextBoxTabIndex="121" FieldLabelText="Injury/illness to relatives or friends" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" ShowFieldLabel="False" CallOnBlur="edi_onBlur" DESIGNTIMEDRAGDROP="1398"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIinj1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIinj1" FieldTextBoxTabIndex="121"
											FieldLabelText="EDIinj1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIinj3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIinj3" FieldTextBoxTabIndex="121"
											FieldLabelText="EDIinj3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIinj2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIinj2" FieldTextBoxTabIndex="121"
											FieldLabelText="EDIinj2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Death of relative/friend</TD>
									<TD>
										<def:datafieldcontrol id="EDIdear" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIdear"
											FieldTextBoxTabIndex="122" FieldLabelText="Death of relative/friend" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIdear1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIdear1" FieldTextBoxTabIndex="122"
											FieldLabelText="EDIdear1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIdear2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIdear2" FieldTextBoxTabIndex="122"
											FieldLabelText="EDIdear2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIdear3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIdear3" FieldTextBoxTabIndex="122"
											FieldLabelText="EDIdear3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Conflict in relationship with spouse/partner</TD>
									<TD>
										<def:datafieldcontrol id="EDIconf" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIconf"
											FieldTextBoxTabIndex="123" FieldLabelText="Conflict in relationship with spouse/partner" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIconf1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIconf1" FieldTextBoxTabIndex="123"
											FieldLabelText="EDIconf1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIconf2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIconf2" FieldTextBoxTabIndex="123"
											FieldLabelText="EDIconf2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIconf3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIconf3" FieldTextBoxTabIndex="123"
											FieldLabelText="EDIconf3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Legal matters for self or partner</TD>
									<TD>
										<def:datafieldcontrol id="EDIlegl" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIlegl"
											FieldTextBoxTabIndex="124" FieldLabelText="Legal matters for self or partner" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIlegl1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIlegl1" FieldTextBoxTabIndex="124"
											FieldLabelText="EDIlegl1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIlegl2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIlegl2" FieldTextBoxTabIndex="124"
											FieldLabelText="EDIlegl2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIlegl3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIlegl3" FieldTextBoxTabIndex="124"
											FieldLabelText="EDIlegl3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Employment/financial problems for self or partner</TD>
									<TD>
										<def:datafieldcontrol id="EDIemp" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIemp"
											FieldTextBoxTabIndex="125" FieldLabelText="Employment/financial problems for self or partner" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIemp1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIemp1" FieldTextBoxTabIndex="125"
											FieldLabelText="EDIemp1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIemp2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIemp2" FieldTextBoxTabIndex="125"
											FieldLabelText="EDIemp2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIemp3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIemp3" FieldTextBoxTabIndex="125"
											FieldLabelText="EDIemp3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Criminal matters for self, partner, or family</TD>
									<TD>
										<def:datafieldcontrol id="EDIcrim" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIcrim"
											FieldTextBoxTabIndex="126" FieldLabelText="Criminal matters for self, partner, or family" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIcrim1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIcrim1" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIcrim1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIcrim2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIcrim2" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIcrim2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIcrim3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIcrim3" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIcrim3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIsotAt" runat="server" FieldLabelWidth="70px" FieldTextBoxWidth="200px" DatabaseField="EDIsotAt"
											FieldTextBoxTabIndex="126" FieldLabelText="Other 1" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="200"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotA" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIsotA"
											FieldTextBoxTabIndex="126" FieldLabelText="Other 1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"
											ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotA1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIsotA1" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIsotA1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotA2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIsotA2" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIsotA2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotA3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIsotA3" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIsotA3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIsotBt" runat="server" FieldLabelWidth="70px" FieldTextBoxWidth="200px" DatabaseField="EDIsotBt"
											FieldTextBoxTabIndex="126" FieldLabelText="Other 2" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="200"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotB" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIsotB"
											FieldTextBoxTabIndex="126" FieldLabelText="Other 2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"
											ShowFieldLabel="False" CallOnBlur="edi_onBlur"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotB1" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIsotB1" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIsotB1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotB2" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIsotB2" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIsotB2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="EDIsotB3" runat="server" FieldTextBoxWidth="30px" DatabaseField="EDIsotB3" FieldTextBoxTabIndex="126"
											FieldLabelText="EDIsotB3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="EDICMNT" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="EDICMNT"
								FieldTextBoxTabIndex="127" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
								IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="129"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="130"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="131"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="132"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="115" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="116" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
