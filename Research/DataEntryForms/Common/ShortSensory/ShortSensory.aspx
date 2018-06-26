<%@ Page language="c#" Inherits="GenericDataEntryForms.ShortSensory.ShortSensory" CodeFile="ShortSensory.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="False"
							VerifiedField="verified" PrimaryKeyField="pk" MeasureName="Short Sensory Profile" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_ShortSensoryProfile"
							AllowedStudyMeasures="137,206,267,353,493,738,764,1954"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="SS1DATE" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="SS1DATE" FieldTextBoxWidth="100px" FieldLabelWidth="80px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<FONT color="red">IMPORTANT: The order of the sections DOES NOT match paper form 
								used by TAP.<BR>
								WITHIN a section the fields are in the same order for all studies.<BR>
							</FONT>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Respondant</TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="SS1resp" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="130px" DatabaseField="SS1resp"
											FieldTextBoxTabIndex="2" FieldLabelText="Respondant" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="SS1respt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="130px" DatabaseField="SS1respt"
											FieldTextBoxTabIndex="2" FieldLabelText="(specify if 3 or 4)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<DIV><BR>
								1-Always<BR>
								2-Frequently<BR>
								3-Occasionally<BR>
								4-Seldom<BR>
								5-Never<BR>
								8-N/A<BR>
								9-Missing/Blank<BR>
								<BR>
							</DIV>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">TACTILE SENSITIVITY</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC1" FieldTextBoxTabIndex="4"
											FieldLabelText="1. Expresses distress during grooming (i.e., haircutting, fa" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC2" FieldTextBoxTabIndex="5"
											FieldLabelText="2. Prefers long sleeved clothing when it's warm or short sle" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC3" FieldTextBoxTabIndex="6"
											FieldLabelText="3. Avoids going barefoot especially in sand or grass" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC4" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC4" FieldTextBoxTabIndex="7"
											FieldLabelText="4.Reacts emotionally or aggressively to touch" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC5" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC5" FieldTextBoxTabIndex="8"
											FieldLabelText="5. Withdraws from splashing water" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC6" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC6" FieldTextBoxTabIndex="9"
											FieldLabelText="6. Has difficulty standing in line or close to other people" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAC7" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAC7" FieldTextBoxTabIndex="10"
											FieldLabelText="7. Rubs or scratches out a spot which has been touched" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">TASTE/SMELL SENSITIVITY</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAS1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAS1" FieldTextBoxTabIndex="11"
											FieldLabelText="1. Avoids certain tastes/smells that are typically part of c" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAS2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAS2" FieldTextBoxTabIndex="12"
											FieldLabelText="2. Will only eat certain tastes" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAS3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAS3" FieldTextBoxTabIndex="13"
											FieldLabelText="3. Limits self to particular food temperatures" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1TAS4" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1TAS4" FieldTextBoxTabIndex="14"
											FieldLabelText="4. Picky eater regarding textures" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">UNDER-RESPONSIVE/SEEKS SENSATION</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND1" FieldTextBoxTabIndex="15"
											FieldLabelText="1. Enjoys strange noises/seeks to make noise for noise sake" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND2" FieldTextBoxTabIndex="16"
											FieldLabelText="2. Seeks all kinds of movement and this interferes with dail" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND3" FieldTextBoxTabIndex="17"
											FieldLabelText="3. Becomes overly excitable after a movement activity" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND4" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND4" FieldTextBoxTabIndex="18"
											FieldLabelText="4. Always touching people and objects" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND5" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND5" FieldTextBoxTabIndex="19"
											FieldLabelText="5. Doesn't seem to notice when face or hands are messy" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND6" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND6" FieldTextBoxTabIndex="20"
											FieldLabelText="6. Jumps from one activity to another so frequently it inter" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1UND7" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1UND7" FieldTextBoxTabIndex="21"
											FieldLabelText="7. Leaves clothing twisted on body" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">AUDITORY FILTERING</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1AUD1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1AUD1" FieldTextBoxTabIndex="22"
											FieldLabelText="1. Is distracted or has trouble functioning if there is a lo" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1AUD2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1AUD2" FieldTextBoxTabIndex="23"
											FieldLabelText="2. Appears not to hear what you say" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1AUD3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1AUD3" FieldTextBoxTabIndex="24"
											FieldLabelText="3. Can't work with background noise (i.e., fan, refrigerator" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1AUD4" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1AUD4" FieldTextBoxTabIndex="25"
											FieldLabelText="4. Has trouble completing tasks when the radio is on" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1AUD5" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1AUD5" FieldTextBoxTabIndex="26"
											FieldLabelText="5. Doesn't respond when name is called" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1AUD6" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1AUD6" FieldTextBoxTabIndex="27"
											FieldLabelText="6. Difficulty paying attention" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VISUAL/AUDITORY SENSITIVITY</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1SEN1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1SEN1" FieldTextBoxTabIndex="28"
											FieldLabelText="1. Responds negatively to unexpected or loud noises (i.e., v" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1SEN2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1SEN2" FieldTextBoxTabIndex="29"
											FieldLabelText="2. Holds hands over ears" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1SEN3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1SEN3" FieldTextBoxTabIndex="30"
											FieldLabelText="3. Is bothered by bright lights after others have adapted to" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1SEN4" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1SEN4" FieldTextBoxTabIndex="31"
											FieldLabelText="4. Watches everyone when they move around the room" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1SEN5" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1SEN5" FieldTextBoxTabIndex="32"
											FieldLabelText="5. Covers eyes or squints in bright lights" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">LOW ENERGY/WEAK</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1LOW1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1LOW1" FieldTextBoxTabIndex="33"
											FieldLabelText="1. Seems to have weak muscles" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1LOW2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1LOW2" FieldTextBoxTabIndex="34"
											FieldLabelText="2. Tires easily, especially when standing or holding particu" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1LOW3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1LOW3" FieldTextBoxTabIndex="35"
											FieldLabelText="3. Has a weak grasp" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1LOW4" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1LOW4" FieldTextBoxTabIndex="36"
											FieldLabelText="4. Can't lift heavy objects" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1LOW5" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1LOW5" FieldTextBoxTabIndex="37"
											FieldLabelText="5. Props to support self" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1LOW6" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1LOW6" FieldTextBoxTabIndex="38"
											FieldLabelText="6. Poor endurance/tires easily" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">MOVEMENT SENSITIVITY</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1MOV1" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1MOV1" FieldTextBoxTabIndex="39"
											FieldLabelText="1. Becomes anxious or distressed when feet leave ground" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1MOV2" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1MOV2" FieldTextBoxTabIndex="40"
											FieldLabelText="2. Fears falling or heights" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SS1MOV3" runat="server" FieldTextBoxWidth="30px" DatabaseField="SS1MOV3" FieldTextBoxTabIndex="41"
											FieldLabelText="3. Dislikes activities where head is upside down (i.e., some" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table3">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="44"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="45"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="46"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="47"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
