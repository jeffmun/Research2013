<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.cars.cars" CodeFile="cars.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="cars_pk" MeasureName="CARS" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_cars" AllowedStudyMeasures="521,532" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="4" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="DATE" IsInsertField="false"
										IsInsertValueRequired="false" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
										FieldLabelText="Test Date" FieldTextBoxTabIndex="4" DatabaseField="carsdate" FieldLabelWidth="80px"
										FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="TEXT" IsInsertField="false"
										IsInsertValueRequired="false" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
										FieldLabelText="Rater" FieldTextBoxTabIndex="4" DatabaseField="carsratr" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<BR>
							<def:datafieldcontrol id="carstot" runat="server" FieldLabelWidth="80px" DatabaseField="carstot" FieldTextBoxTabIndex="20"
								FieldLabelText="Total Score:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="80px" DatabaseField="carsdx"
								FieldTextBoxTabIndex="20" FieldLabelText="CARS DX:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="100px" DatabaseField="scoremsg"
								FieldTextBoxTabIndex="20" FieldLabelText="Scoring Errors:" IsDoubleEntryField="False" IsReadOnly="True"
								IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="cars01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars01"
											FieldTextBoxTabIndex="5" FieldLabelText="cars01" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars02"
											FieldTextBoxTabIndex="6" FieldLabelText="cars02" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars03"
											FieldTextBoxTabIndex="7" FieldLabelText="cars03" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars04"
											FieldTextBoxTabIndex="8" FieldLabelText="cars04" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars05" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars05"
											FieldTextBoxTabIndex="9" FieldLabelText="cars05" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars06" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars06"
											FieldTextBoxTabIndex="10" FieldLabelText="cars06" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars07" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars07"
											FieldTextBoxTabIndex="11" FieldLabelText="cars07" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars08" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars08"
											FieldTextBoxTabIndex="12" FieldLabelText="cars08" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars09" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars09"
											FieldTextBoxTabIndex="13" FieldLabelText="cars09" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars10" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars10"
											FieldTextBoxTabIndex="14" FieldLabelText="cars10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars11" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars11"
											FieldTextBoxTabIndex="15" FieldLabelText="cars11" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars12" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars12"
											FieldTextBoxTabIndex="16" FieldLabelText="cars12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars13" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars13"
											FieldTextBoxTabIndex="17" FieldLabelText="cars13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars14" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars14"
											FieldTextBoxTabIndex="18" FieldLabelText="cars14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cars15" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="60px" DatabaseField="cars15"
											FieldTextBoxTabIndex="19" FieldLabelText="cars15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" ValidList="1,1.5,2,2.5,3,3.5,4"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="22"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="23"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="24"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="25"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="237"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="238"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
