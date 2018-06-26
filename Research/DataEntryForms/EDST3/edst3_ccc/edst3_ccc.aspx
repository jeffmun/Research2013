<%@ Page language="c#" Inherits="edst3_ccc.edst3_ccc" CodeFile="edst3_ccc.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
					
					
					
					
					
		<script language="javascript">
function edst3_ccc_onBlur(sFieldID)
{
	unselectField();
	
	switch (sFieldID) {
	
		case "<%= ccca4.ClientID %>":
			// answer is 2 (kid can't string words together) then set remaining items to 9
			//
			if (getFieldValue(sFieldID) == 2)
			{
			    nc = "<%= ccca4.NamingContainer.ClientID %>";
			    
				for(var i = 1; i<71; i++)
				{	
					if (i < 10)
						f = "_ccc0" + i;
					else
						f = "_ccc" + i;
					setFieldValueIfBlank(nc + f, "9");
				}
			}
			break;

	} // end switch
} // end function


		</script>					
						<def:dataentrycontroller id="DataEntryController1" runat="server" PrimaryKeyField="ccc_pk" VerifiedField="verified"
							MeasureName="EDST3 CCC-R" LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:" LookupField1="edsid"
							DatabaseTable="edst3_ccc" StudyMeasID="201"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="EDSID" FieldTextBoxTabIndex="1" FieldLabelText="EDS ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="80px" FieldLabelWidth="100px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="cccdate" runat="server" DatabaseField="cccdate" FieldTextBoxTabIndex="2" FieldLabelText="Date Filled Out"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" FieldTextBoxWidth="80px" FieldLabelWidth="100px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1=Yes, 2=No, 9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccca1" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A. permanent hearing loss" FieldTextBoxTabIndex="3"
											DatabaseField="ccca1" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccca2" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B. permanent physical handicap" FieldTextBoxTabIndex="4"
											DatabaseField="ccca2" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccca3" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C. is english the main language" FieldTextBoxTabIndex="5"
											DatabaseField="ccca3" ValidList="1,2,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cccdtls" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Details if no" FieldTextBoxTabIndex="6"
											DatabaseField="cccdtls" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccca4" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D. able to string words together" FieldTextBoxTabIndex="7"
											DatabaseField="ccca4" ValidList="1,2,9" CallOnBlur="edst3_ccc_onBlur"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">0=less than once a week (or never)<BR>
										1=at least once a week, but not every day<BR>
										2=once or twice a day<BR>
										3=several times (more than twice) a day (or always)<BR>
										9=Missing/Blank
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc01" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Gets mixed up between he and she so might say 'he' when t..."
											FieldTextBoxTabIndex="11" DatabaseField="ccc01" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc02" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Simplifies words by leaving out some sounds, e.g. 'crocod..."
											FieldTextBoxTabIndex="12" DatabaseField="ccc02" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc03" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Appears anxious in the company of other children "
											FieldTextBoxTabIndex="13" DatabaseField="ccc03" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc04" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Makes false starts, and appears to grope for the right wo..."
											FieldTextBoxTabIndex="14" DatabaseField="ccc04" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc05" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Talks repetitively about things that no-one is interested..."
											FieldTextBoxTabIndex="15" DatabaseField="ccc05" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc06" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Forgets words s/he knows - e.g. instead of 'rhinoceros' m..."
											FieldTextBoxTabIndex="16" DatabaseField="ccc06" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc07" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. With familiar adults, seems inattentive, distant or preoc..."
											FieldTextBoxTabIndex="17" DatabaseField="ccc07" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc08" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Looks blank in a situation where most children would show..."
											FieldTextBoxTabIndex="18" DatabaseField="ccc08" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc09" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. When given the opportunity to do what s/he likes, chooses..."
											FieldTextBoxTabIndex="19" DatabaseField="ccc09" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc10" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Uses terms like 'he' or 'it' without making it clear wha..."
											FieldTextBoxTabIndex="20" DatabaseField="ccc10" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc11" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Says things that he does not seem to fully understand (m..."
											FieldTextBoxTabIndex="21" DatabaseField="ccc11" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc12" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Mixes up words of similar meaning. e.g., might say 'dog'..."
											FieldTextBoxTabIndex="22" DatabaseField="ccc12" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc13" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Is babied, teased, or bullied by other children"
											FieldTextBoxTabIndex="23" DatabaseField="ccc13" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc14" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Does not look at the person s/he is talking to "
											FieldTextBoxTabIndex="24" DatabaseField="ccc14" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc15" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Misses the point of jokes and puns (though may be amused..."
											FieldTextBoxTabIndex="25" DatabaseField="ccc15" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc16" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Is left out of joint activities by other children "
											FieldTextBoxTabIndex="26" DatabaseField="ccc16" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc17" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Gets mixed up between he/him or she/her, so might say 'h..."
											FieldTextBoxTabIndex="27" DatabaseField="ccc17" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc18" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Uses favourite phrases, sentences or longer sequences in..."
											FieldTextBoxTabIndex="28" DatabaseField="ccc18" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc19" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Gets confused when a word is used with a different meani..."
											FieldTextBoxTabIndex="29" DatabaseField="ccc19" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc20" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Stands too close to other people when talking to them "
											FieldTextBoxTabIndex="30" DatabaseField="ccc20" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc21" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Talks to people too readily: e.g. without any encouragem..."
											FieldTextBoxTabIndex="31" DatabaseField="ccc21" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc22" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Talks about lists of things s/he has memorized e.g., the..."
											FieldTextBoxTabIndex="32" DatabaseField="ccc22" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc23" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Pronounces words in an over-precise manner: accent may s..."
											FieldTextBoxTabIndex="33" DatabaseField="ccc23" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc24" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Pronounces words in a babyish way, such as 'chimbley' fo..."
											FieldTextBoxTabIndex="34" DatabaseField="ccc24" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc25" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Can be hard to tell if s/he is talking about something r..."
											FieldTextBoxTabIndex="35" DatabaseField="ccc25" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc26" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Moves the conversation to a favorite topic, even if othe..."
											FieldTextBoxTabIndex="36" DatabaseField="ccc26" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc27" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Produces utterances that sound babyish because they are ..."
											FieldTextBoxTabIndex="37" DatabaseField="ccc27" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc28" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Ability to communicate varies from situation to situatio..."
											FieldTextBoxTabIndex="38" DatabaseField="ccc28" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc29" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Leaves off beginnings or ends of words, e.g. says 'roe' ..."
											FieldTextBoxTabIndex="39" DatabaseField="ccc29" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc30" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Repeats back what others have just said. For instance, i..."
											FieldTextBoxTabIndex="40" DatabaseField="ccc30" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc31" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Ignores conversational overtures from others (e.g. if as..."
											FieldTextBoxTabIndex="41" DatabaseField="ccc31" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc32" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Mixes up words that sound similar. e.g. might say 'telep..."
											FieldTextBoxTabIndex="42" DatabaseField="ccc32" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc33" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Hurts or upsets other children without meaning to "
											FieldTextBoxTabIndex="43" DatabaseField="ccc33" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc34" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. Takes in just 1-2 words in a sentence, and so misinterpr..."
											FieldTextBoxTabIndex="44" DatabaseField="ccc34" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc35" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. It's difficult to stop him/her from talking "
											FieldTextBoxTabIndex="45" DatabaseField="ccc35" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc36" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Leaves off past tense-ed endings on words, so might say ..."
											FieldTextBoxTabIndex="46" DatabaseField="ccc36" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc37" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Tells people things they know already "
											FieldTextBoxTabIndex="47" DatabaseField="ccc37" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc38" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Makes mistakes in pronouncing long words; e.g. says 'veg..."
											FieldTextBoxTabIndex="48" DatabaseField="ccc38" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc39" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Fails to recognize when other people are upset or angry "
											FieldTextBoxTabIndex="49" DatabaseField="ccc39" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc40" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Gets the sequence of events muddled up when trying to te..."
											FieldTextBoxTabIndex="50" DatabaseField="ccc40" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc41" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Is over-literal, sometimes with (unintentionally) humoro..."
											FieldTextBoxTabIndex="51" DatabaseField="ccc41" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc42" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Includes over-precise information (e.g. exact date or ti..."
											FieldTextBoxTabIndex="52" DatabaseField="ccc42" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc43" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Leaves out 'is', and so says 'Daddy going to work' rathe..."
											FieldTextBoxTabIndex="53" DatabaseField="ccc43" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc44" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Mispronounces 'th' for 's' or 'w' for 'r'. E.g. says 'th..."
											FieldTextBoxTabIndex="54" DatabaseField="ccc44" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc45" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Asks a question, even though s/he has been given the ans..."
											FieldTextBoxTabIndex="55" DatabaseField="ccc45" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc46" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Is vague in choice of words, making it unclear what s/he..."
											FieldTextBoxTabIndex="56" DatabaseField="ccc46" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc47" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Shows interest in things or activities that most people ..."
											FieldTextBoxTabIndex="57" DatabaseField="ccc47" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc48" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Doesn't explain what s/he is talking about to someone wh..."
											FieldTextBoxTabIndex="58" DatabaseField="ccc48" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc49" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Surprises people by his/her knowledge of unusual words -..."
											FieldTextBoxTabIndex="59" DatabaseField="ccc49" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc50" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. It is hard to make sense of what s/he is saying (even th..."
											FieldTextBoxTabIndex="60" DatabaseField="ccc50" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc51" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Speaks clearly so that the words can easily be understoo..."
											FieldTextBoxTabIndex="61" DatabaseField="ccc51" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc52" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Reacts positively when a new and unfamiliar activity is ..."
											FieldTextBoxTabIndex="62" DatabaseField="ccc52" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc53" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. Talks clearly about what s/he plans to do in the future ..."
											FieldTextBoxTabIndex="63" DatabaseField="ccc53" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc54" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. Appreciates the humor expressed by irony. Would be amuse..."
											FieldTextBoxTabIndex="64" DatabaseField="ccc54" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc55" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. Produces long and complicated sentences such as: 'When w..."
											FieldTextBoxTabIndex="65" DatabaseField="ccc55" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc56" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="56. Makes good use of gestures to get his/her meaning across..."
											FieldTextBoxTabIndex="66" DatabaseField="ccc56" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc57" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. Shows concern when other people are upset "
											FieldTextBoxTabIndex="67" DatabaseField="ccc57" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc58" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. Speaks fluently and clearly, producing all speech sounds..."
											FieldTextBoxTabIndex="68" DatabaseField="ccc58" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc59" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="59. Keeps quiet in situations where someone else is trying t..."
											FieldTextBoxTabIndex="69" DatabaseField="ccc59" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc60" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="60. Realizes the need to be polite - would pretend to be ple..."
											FieldTextBoxTabIndex="70" DatabaseField="ccc60" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc61" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="61. When answering a question, provides enough information w..."
											FieldTextBoxTabIndex="71" DatabaseField="ccc61" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc62" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="62. You can have an enjoyable, interesting conversation with..."
											FieldTextBoxTabIndex="72" DatabaseField="ccc62" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc63" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="63. Shows flexibility in adapting to unexpected situations: ..."
											FieldTextBoxTabIndex="73" DatabaseField="ccc63" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc64" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="64. Uses abstract words that refer to general concepts rathe..."
											FieldTextBoxTabIndex="74" DatabaseField="ccc64" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc65" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="65. Smiles appropriately when talking to people "
											FieldTextBoxTabIndex="75" DatabaseField="ccc65" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc66" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="66. Uses words that refer to whole classes of objects, rathe..."
											FieldTextBoxTabIndex="76" DatabaseField="ccc66" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc67" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="67. Talks about his/her friends; shows interest in what they..."
											FieldTextBoxTabIndex="77" DatabaseField="ccc67" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc68" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="68. Explains a past event (e.g. what s/he did at school, or ..."
											FieldTextBoxTabIndex="78" DatabaseField="ccc68" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc69" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="69. Produces sentences containing 'because' such as 'John ha..."
											FieldTextBoxTabIndex="79" DatabaseField="ccc69" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ccc70" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="70. Talks to others about their interests, rather than his/h..."
											FieldTextBoxTabIndex="80" DatabaseField="ccc70" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="81" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="82" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="83" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="84" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
