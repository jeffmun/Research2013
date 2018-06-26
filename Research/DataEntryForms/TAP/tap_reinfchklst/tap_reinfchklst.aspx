<%@ Page language="c#" Inherits="tap_reinfchklst.tap_reinfchklst" CodeFile="tap_reinfchklst.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_reinfchklst" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP Reinf.  Checklist" PrimaryKeyField="reinf_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="439"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapidx" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldLabelWidth="150px" FieldTextBoxWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="REINFdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="REINFdate"
										FieldTextBoxTabIndex="3" DatabaseField="REINFdate" FieldTextBoxWidth="100px" FieldLabelWidth="150px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="completedby" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Completed By (1=mother, 2=father, 3=other, 9=missing/blank)"
										FieldTextBoxTabIndex="4" DatabaseField="completedby" FieldTextBoxWidth="30px" FieldLabelWidth="150px"
										ValidList="1,2,3,9"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<div><br/>
							0-Not rewarding<br/>
							1-Mildly rewarding<br/>
							2-Moderately rewarding<br/>
							3-Strongly rewarding<br/>
							4-Extremely rewarding<br/>
							8-N/A<br/>
							9-Missing/Blank<br/>
							<br/>
						</div>
						<table class="layout">
							<tr>
								<td style="vertical-align:top">
									<table id="table_entry" class="layout">
										<tr>
											<td><def:datafieldcontrol id="MandMs" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MandMs"
													FieldTextBoxTabIndex="5" DatabaseField="MandMs" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Coloredchalk" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Coloredchalk"
													FieldTextBoxTabIndex="6" DatabaseField="Coloredchalk" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pushingbuttons" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pushingbuttons"
													FieldTextBoxTabIndex="7" DatabaseField="Pushingbuttons" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Licorice" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Licorice"
													FieldTextBoxTabIndex="8" DatabaseField="Licorice" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Spinningself" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Spinningself"
													FieldTextBoxTabIndex="9" DatabaseField="Spinningself" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Candycanes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Candycanes"
													FieldTextBoxTabIndex="10" DatabaseField="Candycanes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Ridingincar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Ridingincar"
													FieldTextBoxTabIndex="11" DatabaseField="Ridingincar" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Gum" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Gum"
													FieldTextBoxTabIndex="12" DatabaseField="Gum" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Timealone" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Timealone"
													FieldTextBoxTabIndex="13" DatabaseField="Timealone" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Smarties" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Smarties"
													FieldTextBoxTabIndex="14" DatabaseField="Smarties" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Lollipops" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Lollipops"
													FieldTextBoxTabIndex="15" DatabaseField="Lollipops" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Blocks" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Blocks"
													FieldTextBoxTabIndex="16" DatabaseField="Blocks" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Drawing" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Drawing"
													FieldTextBoxTabIndex="17" DatabaseField="Drawing" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Nailpolish" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Nailpolish"
													FieldTextBoxTabIndex="18" DatabaseField="Nailpolish" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithtools" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingwithtools"
													FieldTextBoxTabIndex="19" DatabaseField="Playingwithtools" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Fruitloops" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Fruitloops"
													FieldTextBoxTabIndex="20" DatabaseField="Fruitloops" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Holdingthings" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Holdingthings"
													FieldTextBoxTabIndex="21" DatabaseField="Holdingthings" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Tickles" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Tickles"
													FieldTextBoxTabIndex="22" DatabaseField="Tickles" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sanddirtplay" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sanddirtplay"
													FieldTextBoxTabIndex="23" DatabaseField="Sanddirtplay" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Raisins" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Raisins"
													FieldTextBoxTabIndex="24" DatabaseField="Raisins" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingball" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingball"
													FieldTextBoxTabIndex="25" DatabaseField="Playingball" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Bananas" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Bananas"
													FieldTextBoxTabIndex="26" DatabaseField="Bananas" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Milk" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Milk"
													FieldTextBoxTabIndex="27" DatabaseField="Milk" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Letters" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Letters"
													FieldTextBoxTabIndex="28" DatabaseField="Letters" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sittinginsameseat" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Sittinginsameseat" FieldTextBoxTabIndex="29" DatabaseField="Sittinginsameseat" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Soda" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Soda"
													FieldTextBoxTabIndex="30" DatabaseField="Soda" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Masks" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Masks"
													FieldTextBoxTabIndex="31" DatabaseField="Masks" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Lemonade" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Lemonade"
													FieldTextBoxTabIndex="32" DatabaseField="Lemonade" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithmoney" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingwithmoney"
													FieldTextBoxTabIndex="33" DatabaseField="Playingwithmoney" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Popsicle" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Popsicle"
													FieldTextBoxTabIndex="34" DatabaseField="Popsicle" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sprinklingglitter" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Sprinklingglitter" FieldTextBoxTabIndex="35" DatabaseField="Sprinklingglitter" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Icecream" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Icecream"
													FieldTextBoxTabIndex="36" DatabaseField="Icecream" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Slidingonmats" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Slidingonmats"
													FieldTextBoxTabIndex="37" DatabaseField="Slidingonmats" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Basketball" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Basketball"
													FieldTextBoxTabIndex="38" DatabaseField="Basketball" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cheese" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cheese"
													FieldTextBoxTabIndex="39" DatabaseField="Cheese" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Chase" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Chase"
													FieldTextBoxTabIndex="40" DatabaseField="Chase" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cottagecheese" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cottagecheese"
													FieldTextBoxTabIndex="41" DatabaseField="Cottagecheese" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Peanutbutter" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Peanutbutter"
													FieldTextBoxTabIndex="42" DatabaseField="Peanutbutter" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="JamJelly" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="JamJelly"
													FieldTextBoxTabIndex="43" DatabaseField="JamJelly" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cake" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cake"
													FieldTextBoxTabIndex="44" DatabaseField="Cake" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Talkingonphone" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Talkingonphone"
													FieldTextBoxTabIndex="45" DatabaseField="Talkingonphone" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Goldfishcrackers" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Goldfishcrackers"
													FieldTextBoxTabIndex="46" DatabaseField="Goldfishcrackers" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Frosting" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Frosting"
													FieldTextBoxTabIndex="47" DatabaseField="Frosting" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Hats" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Hats"
													FieldTextBoxTabIndex="48" DatabaseField="Hats" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pretzels" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pretzels"
													FieldTextBoxTabIndex="49" DatabaseField="Pretzels" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cornchips" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cornchips"
													FieldTextBoxTabIndex="50" DatabaseField="Cornchips" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cheezeballscurls" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cheezeballscurls"
													FieldTextBoxTabIndex="51" DatabaseField="Cheezeballscurls" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithglue" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingwithglue"
													FieldTextBoxTabIndex="52" DatabaseField="Playingwithglue" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Doritos" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Doritos"
													FieldTextBoxTabIndex="53" DatabaseField="Doritos" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cookies" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cookies"
													FieldTextBoxTabIndex="54" DatabaseField="Cookies" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Animalcrackers" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Animalcrackers"
													FieldTextBoxTabIndex="55" DatabaseField="Animalcrackers" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Makingpictures" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Makingpictures"
													FieldTextBoxTabIndex="56" DatabaseField="Makingpictures" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pullingawagon" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pullingawagon"
													FieldTextBoxTabIndex="57" DatabaseField="Pullingawagon" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Stopwatch" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Stopwatch"
													FieldTextBoxTabIndex="58" DatabaseField="Stopwatch" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Runningoutside" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Runningoutside"
													FieldTextBoxTabIndex="59" DatabaseField="Runningoutside" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Handcream" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Handcream"
													FieldTextBoxTabIndex="60" DatabaseField="Handcream" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sillyputty" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sillyputty"
													FieldTextBoxTabIndex="61" DatabaseField="Sillyputty" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithzippers" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Playingwithzippers" FieldTextBoxTabIndex="62" DatabaseField="Playingwithzippers" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Bubbles" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Bubbles"
													FieldTextBoxTabIndex="63" DatabaseField="Bubbles" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Goingforwalks" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Goingforwalks"
													FieldTextBoxTabIndex="64" DatabaseField="Goingforwalks" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Chapstick" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Chapstick"
													FieldTextBoxTabIndex="65" DatabaseField="Chapstick" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Stickers" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Stickers"
													FieldTextBoxTabIndex="66" DatabaseField="Stickers" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Lookingatpictures" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Lookingatpictures" FieldTextBoxTabIndex="67" DatabaseField="Lookingatpictures" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Perfume" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Perfume"
													FieldTextBoxTabIndex="68" DatabaseField="Perfume" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Powder" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Powder"
													FieldTextBoxTabIndex="69" DatabaseField="Powder" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Toyinstruments" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Toyinstruments"
													FieldTextBoxTabIndex="70" DatabaseField="Toyinstruments" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Puzzles" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Puzzles"
													FieldTextBoxTabIndex="71" DatabaseField="Puzzles" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Beads" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Beads"
													FieldTextBoxTabIndex="72" DatabaseField="Beads" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Feedingfish" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Feedingfish"
													FieldTextBoxTabIndex="73" DatabaseField="Feedingfish" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="Stamps" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Stamps"
													FieldTextBoxTabIndex="74" DatabaseField="Stamps" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Crayons" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Crayons"
													FieldTextBoxTabIndex="75" DatabaseField="Crayons" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Listeningtomusic" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Listeningtomusic"
													FieldTextBoxTabIndex="76" DatabaseField="Listeningtomusic" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Climbonperson" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Climbonperson"
													FieldTextBoxTabIndex="77" DatabaseField="Climbonperson" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Fans" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Fans"
													FieldTextBoxTabIndex="78" DatabaseField="Fans" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Trix" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Trix"
													FieldTextBoxTabIndex="79" DatabaseField="Trix" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Balloons" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Balloons"
													FieldTextBoxTabIndex="80" DatabaseField="Balloons" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Liningupobjects" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Liningupobjects"
													FieldTextBoxTabIndex="81" DatabaseField="Liningupobjects" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Badges" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Badges"
													FieldTextBoxTabIndex="82" DatabaseField="Badges" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithlips" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingwithlips"
													FieldTextBoxTabIndex="83" DatabaseField="Playingwithlips" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Books" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Books"
													FieldTextBoxTabIndex="84" DatabaseField="Books" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Candykisses" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Candykisses"
													FieldTextBoxTabIndex="85" DatabaseField="Candykisses" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Openingclosingdoors" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Openingclosingdoors" FieldTextBoxTabIndex="86" DatabaseField="Openingclosingdoors"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Coloringbooks" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Coloringbooks"
													FieldTextBoxTabIndex="87" DatabaseField="Coloringbooks" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Whistles" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Whistles"
													FieldTextBoxTabIndex="88" DatabaseField="Whistles" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="CrackerJack" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CrackerJack"
													FieldTextBoxTabIndex="89" DatabaseField="CrackerJack" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Paints" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Paints"
													FieldTextBoxTabIndex="90" DatabaseField="Paints" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Rocking" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rocking"
													FieldTextBoxTabIndex="91" DatabaseField="Rocking" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Brushinghair" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Brushinghair"
													FieldTextBoxTabIndex="92" DatabaseField="Brushinghair" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Clappinghands" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Clappinghands"
													FieldTextBoxTabIndex="93" DatabaseField="Clappinghands" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Hideandseek" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Hideandseek"
													FieldTextBoxTabIndex="94" DatabaseField="Hideandseek" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Blowingbubbles" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Blowingbubbles"
													FieldTextBoxTabIndex="95" DatabaseField="Blowingbubbles" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Straws" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Straws"
													FieldTextBoxTabIndex="96" DatabaseField="Straws" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Piggybackrides" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Piggybackrides"
													FieldTextBoxTabIndex="97" DatabaseField="Piggybackrides" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Chocolatemilk" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Chocolatemilk"
													FieldTextBoxTabIndex="98" DatabaseField="Chocolatemilk" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Singingsongs" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Singingsongs"
													FieldTextBoxTabIndex="99" DatabaseField="Singingsongs" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Waterplay" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Waterplay"
													FieldTextBoxTabIndex="100" DatabaseField="Waterplay" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cheerios" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cheerios"
													FieldTextBoxTabIndex="101" DatabaseField="Cheerios" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Racing" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Racing"
													FieldTextBoxTabIndex="102" DatabaseField="Racing" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Puppets" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Puppets"
													FieldTextBoxTabIndex="103" DatabaseField="Puppets" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sandplay" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sandplay"
													FieldTextBoxTabIndex="104" DatabaseField="Sandplay" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Trampolines" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Trampolines"
													FieldTextBoxTabIndex="105" DatabaseField="Trampolines" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Dancing" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Dancing"
													FieldTextBoxTabIndex="106" DatabaseField="Dancing" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Bringingtoyfrom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Bringingtoyfrom"
													FieldTextBoxTabIndex="107" DatabaseField="Bringingtoyfrom" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Turnlightsonoff" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Turnlightsonoff"
													FieldTextBoxTabIndex="108" DatabaseField="Turnlightsonoff" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Marshmallows" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Marshmallows"
													FieldTextBoxTabIndex="109" DatabaseField="Marshmallows" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pouringliquids" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pouringliquids"
													FieldTextBoxTabIndex="110" DatabaseField="Pouringliquids" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Oranges" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Oranges"
													FieldTextBoxTabIndex="111" DatabaseField="Oranges" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Watchingcarsgoby" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Watchingcarsgoby"
													FieldTextBoxTabIndex="112" DatabaseField="Watchingcarsgoby" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Stories" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Stories"
													FieldTextBoxTabIndex="113" DatabaseField="Stories" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Twirlinginair" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Twirlinginair"
													FieldTextBoxTabIndex="114" DatabaseField="Twirlinginair" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Blanketsoverhead" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Blanketsoverhead"
													FieldTextBoxTabIndex="115" DatabaseField="Blanketsoverhead" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Goingtotrash" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Goingtotrash"
													FieldTextBoxTabIndex="116" DatabaseField="Goingtotrash" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Rolldownhill" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rolldownhill"
													FieldTextBoxTabIndex="117" DatabaseField="Rolldownhill" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Tighthugssqueezes" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Tighthugssqueezes" FieldTextBoxTabIndex="118" DatabaseField="Tighthugssqueezes" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cupcakes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cupcakes"
													FieldTextBoxTabIndex="119" DatabaseField="Cupcakes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playinginboxes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playinginboxes"
													FieldTextBoxTabIndex="120" DatabaseField="Playinginboxes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Dressingup" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Dressingup"
													FieldTextBoxTabIndex="121" DatabaseField="Dressingup" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playdoh" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playdoh"
													FieldTextBoxTabIndex="122" DatabaseField="Playdoh" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Cuttingpictures" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Cuttingpictures"
													FieldTextBoxTabIndex="123" DatabaseField="Cuttingpictures" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Doughnuts" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Doughnuts"
													FieldTextBoxTabIndex="124" DatabaseField="Doughnuts" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Fingerpaint" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Fingerpaint"
													FieldTextBoxTabIndex="125" DatabaseField="Fingerpaint" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Treasurehunt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Treasurehunt"
													FieldTextBoxTabIndex="126" DatabaseField="Treasurehunt" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="CDs" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="CDs"
													FieldTextBoxTabIndex="127" DatabaseField="CDs" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Wagonrides" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Wagonrides"
													FieldTextBoxTabIndex="128" DatabaseField="Wagonrides" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Throwninair" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Throwninair"
													FieldTextBoxTabIndex="129" DatabaseField="Throwninair" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Wateringplants" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Wateringplants"
													FieldTextBoxTabIndex="130" DatabaseField="Wateringplants" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Makingtreats" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Makingtreats"
													FieldTextBoxTabIndex="131" DatabaseField="Makingtreats" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Mirrors" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Mirrors"
													FieldTextBoxTabIndex="132" DatabaseField="Mirrors" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Icingcupcakes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Icingcupcakes"
													FieldTextBoxTabIndex="133" DatabaseField="Icingcupcakes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Makingpopcorn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Makingpopcorn"
													FieldTextBoxTabIndex="134" DatabaseField="Makingpopcorn" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Videotapes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Videotapes"
													FieldTextBoxTabIndex="135" DatabaseField="Videotapes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Birthdayparties" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Birthdayparties"
													FieldTextBoxTabIndex="136" DatabaseField="Birthdayparties" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Swimming" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Swimming"
													FieldTextBoxTabIndex="137" DatabaseField="Swimming" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwcomputer" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingwcomputer"
													FieldTextBoxTabIndex="138" DatabaseField="Playingwcomputer" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Stringingbeads" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Stringingbeads"
													FieldTextBoxTabIndex="139" DatabaseField="Stringingbeads" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Turningwateronoff" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Turningwateronoff" FieldTextBoxTabIndex="140" DatabaseField="Turningwateronoff" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Smellingspices" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Smellingspices"
													FieldTextBoxTabIndex="141" DatabaseField="Smellingspices" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="DVDs" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="DVDs"
													FieldTextBoxTabIndex="142" DatabaseField="DVDs" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="Grabbag" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Grabbag"
													FieldTextBoxTabIndex="143" DatabaseField="Grabbag" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Surprisebox" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Surprisebox"
													FieldTextBoxTabIndex="144" DatabaseField="Surprisebox" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Spinningobjects" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Spinningobjects"
													FieldTextBoxTabIndex="145" DatabaseField="Spinningobjects" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Hugs" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Hugs"
													FieldTextBoxTabIndex="146" DatabaseField="Hugs" FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Grabhands" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Grabhands"
													FieldTextBoxTabIndex="147" DatabaseField="Grabhands" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Juice" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Juice"
													FieldTextBoxTabIndex="148" DatabaseField="Juice" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Wigglearms" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Wigglearms"
													FieldTextBoxTabIndex="149" DatabaseField="Wigglearms" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Shakinghands" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Shakinghands"
													FieldTextBoxTabIndex="150" DatabaseField="Shakinghands" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Kisses" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Kisses"
													FieldTextBoxTabIndex="151" DatabaseField="Kisses" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Tickles2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Tickles2"
													FieldTextBoxTabIndex="152" DatabaseField="Tickles2" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="HighFive" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="HighFive"
													FieldTextBoxTabIndex="153" DatabaseField="HighFive" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Rubbingnoses" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rubbingnoses"
													FieldTextBoxTabIndex="154" DatabaseField="Rubbingnoses" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Smiling" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Smiling"
													FieldTextBoxTabIndex="155" DatabaseField="Smiling" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Whistling" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Whistling"
													FieldTextBoxTabIndex="156" DatabaseField="Whistling" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Patting" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Patting"
													FieldTextBoxTabIndex="157" DatabaseField="Patting" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Praise" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Praise"
													FieldTextBoxTabIndex="158" DatabaseField="Praise" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Backrubscratch" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Backrubscratch"
													FieldTextBoxTabIndex="159" DatabaseField="Backrubscratch" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pinchingcheeks" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pinchingcheeks"
													FieldTextBoxTabIndex="160" DatabaseField="Pinchingcheeks" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Bellyrub" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Bellyrub"
													FieldTextBoxTabIndex="161" DatabaseField="Bellyrub" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Nodding" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Nodding"
													FieldTextBoxTabIndex="162" DatabaseField="Nodding" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Carryupsidedown" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Carryupsidedown"
													FieldTextBoxTabIndex="163" DatabaseField="Carryupsidedown" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Jellybeans" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Jellybeans"
													FieldTextBoxTabIndex="164" DatabaseField="Jellybeans" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Fingerplay" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Fingerplay"
													FieldTextBoxTabIndex="165" DatabaseField="Fingerplay" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Flashlights" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Flashlights"
													FieldTextBoxTabIndex="166" DatabaseField="Flashlights" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Imitating" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Imitating"
													FieldTextBoxTabIndex="167" DatabaseField="Imitating" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Shoulderrides" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Shoulderrides"
													FieldTextBoxTabIndex="168" DatabaseField="Shoulderrides" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Flushingthetoilet" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Flushingthetoilet" FieldTextBoxTabIndex="169" DatabaseField="Flushingthetoilet" FieldTextBoxWidth="30px"
													FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Rollingball" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Rollingball"
													FieldTextBoxTabIndex="170" DatabaseField="Rollingball" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Beanbags" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Beanbags"
													FieldTextBoxTabIndex="171" DatabaseField="Beanbags" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="WatchingTVtapes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="WatchingTVtapes"
													FieldTextBoxTabIndex="172" DatabaseField="WatchingTVtapes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pushingwalker" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pushingwalker"
													FieldTextBoxTabIndex="173" DatabaseField="Pushingwalker" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Squeezingtoothpaste" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Squeezingtoothpaste" FieldTextBoxTabIndex="174" DatabaseField="Squeezingtoothpaste"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Markersandpens" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Markersandpens"
													FieldTextBoxTabIndex="175" DatabaseField="Markersandpens" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pudding" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pudding"
													FieldTextBoxTabIndex="176" DatabaseField="Pudding" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Pushingacart" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Pushingacart"
													FieldTextBoxTabIndex="177" DatabaseField="Pushingacart" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Havingmominclass" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Havingmominclass"
													FieldTextBoxTabIndex="178" DatabaseField="Havingmominclass" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Havingmomleave" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Havingmomleave"
													FieldTextBoxTabIndex="179" DatabaseField="Havingmomleave" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Vegetables" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Vegetables"
													FieldTextBoxTabIndex="180" DatabaseField="Vegetables" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Helpingcook" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Helpingcook"
													FieldTextBoxTabIndex="181" DatabaseField="Helpingcook" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Climbing" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Climbing"
													FieldTextBoxTabIndex="182" DatabaseField="Climbing" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Climbinginboxes" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Climbinginboxes"
													FieldTextBoxTabIndex="183" DatabaseField="Climbinginboxes" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Jello" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Jello"
													FieldTextBoxTabIndex="184" DatabaseField="Jello" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithjewelry" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Playingwithjewelry" FieldTextBoxTabIndex="185" DatabaseField="Playingwithjewelry"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Beingabletokeepshoeson" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Beingabletokeepshoeson" FieldTextBoxTabIndex="186" DatabaseField="Beingabletokeepshoeson"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Crawlingundertables" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Crawlingundertables" FieldTextBoxTabIndex="187" DatabaseField="Crawlingundertables"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Shreddingpaper" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Shreddingpaper"
													FieldTextBoxTabIndex="188" DatabaseField="Shreddingpaper" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Watchingfireengines" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Watchingfireengines" FieldTextBoxTabIndex="189" DatabaseField="Watchingfireengines"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Wateringplants2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Wateringplants2"
													FieldTextBoxTabIndex="190" DatabaseField="Wateringplants2" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Machines" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Machines"
													FieldTextBoxTabIndex="191" DatabaseField="Machines" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Peekaboo" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Peekaboo"
													FieldTextBoxTabIndex="192" DatabaseField="Peekaboo" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Apples" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Apples"
													FieldTextBoxTabIndex="193" DatabaseField="Apples" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="String" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="String"
													FieldTextBoxTabIndex="194" DatabaseField="String" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sticks" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sticks"
													FieldTextBoxTabIndex="195" DatabaseField="Sticks" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Popcorn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Popcorn"
													FieldTextBoxTabIndex="196" DatabaseField="Popcorn" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Combs" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Combs"
													FieldTextBoxTabIndex="197" DatabaseField="Combs" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Numbers" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Numbers"
													FieldTextBoxTabIndex="198" DatabaseField="Numbers" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Sunshineshadows" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Sunshineshadows"
													FieldTextBoxTabIndex="199" DatabaseField="Sunshineshadows" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Hinges" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Hinges"
													FieldTextBoxTabIndex="200" DatabaseField="Hinges" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Yogurt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Yogurt"
													FieldTextBoxTabIndex="201" DatabaseField="Yogurt" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Playingwithbody" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Playingwithbodyparts"
													FieldTextBoxTabIndex="202" DatabaseField="Playingwithbody" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Chocolate" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Chocolate"
													FieldTextBoxTabIndex="204" DatabaseField="Chocolate" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Puttingintakingout" runat="server" FieldDataType="INT" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
													FieldLabelText="Puttingintakingout" FieldTextBoxTabIndex="205" DatabaseField="Puttingintakingout"
													FieldTextBoxWidth="30px" FieldLabelWidth="100px" ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Other1" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Other1"
													FieldTextBoxTabIndex="206" DatabaseField="Other1" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Other1txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other1txt"
													FieldTextBoxTabIndex="207" DatabaseField="Other1txt" FieldTextBoxWidth="100px" FieldLabelWidth="100px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Other2" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Other2"
													FieldTextBoxTabIndex="208" DatabaseField="Other2" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Other2txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other2txt"
													FieldTextBoxTabIndex="209" DatabaseField="Other2txt" FieldTextBoxWidth="100px" FieldLabelWidth="100px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Other3" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Other3"
													FieldTextBoxTabIndex="210" DatabaseField="Other3" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
													ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Other3txt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Other3txt"
													FieldTextBoxTabIndex="211" DatabaseField="Other3txt" FieldTextBoxWidth="100px" FieldLabelWidth="100px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br/>
						<table id="table_readonly" class="layout">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
										FieldTextBoxTabIndex="213" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="214" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="215" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
										FieldTextBoxTabIndex="216" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
					</asp:Content>
