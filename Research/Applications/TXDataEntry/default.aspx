<%@ Page language="C#"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
					<h4>Measures</h4>
					<p>
						<a href="<%= Request.ApplicationPath %>/DataEntryForms/Common/bdi2/bdi2.aspx">Battelle 
							2nd Edition</a><br>
						<a href="<%= Request.ApplicationPath %>/Applications/PhysGrowth/TXPhysGrowth.aspx">Phys. 
							Growth</a><br>
						<a href="<%= Request.ApplicationPath %>/DataEntryForms/Common/TherapistEval/TherapistEval.aspx">Therapist Evaluation</a><br>
						<a href="<%= Request.ApplicationPath %>/DataEntryForms/Common/SessionReliability/SessionReliability.aspx">Session Reliability</a><br>
					</p>
					<h4>Fidelity Data Entry</h4>
					<p>
						<a href="<%= Request.ApplicationPath %>/DataEntryForms/Common/tx_fidelity/tx_fidelity.aspx">
							Fidelity Data Entry Form</a>
					</p>
					<h4>Intervention Study Data Entry</h4>
					<p>
						<a href="tatxhrs2.aspx">Edit TA Treatment Hours</a><br>
						<a href="patxhrs2.aspx">Edit Parent Treatment Hours</a><br>
						<a href="uwtxhrs2.aspx">Edit UW Treatment Hours</a>
					</p>
					<h4>Intervention Study Reports</h4>
					<p>
						<a href="/sqlreportserver?/Treatment Study/All Treatment Hours by Subject and Week&rs:Format=EXCEL&rs:Command=Render">
							View All Treatment Hours in EXCEL</a><br>
						<br>
						<table class="grid">
							<tr>
								<td>Hint #1<br>
									If Excel displays annoying green triangles in the corners of cells:<br>
									1. Select Options... from the Tools menu<br>
									2. Select the Error Checking tab<br>
									3. In the list of Rules turn off 'Number stored as text' and click OK<br><br>
									Hint #2<br>
									To keep the row and column labels from scrolling:<br>
									1. Click in cell D6<br>
									2. Select Freeze Panes from the Window menu<br>
									
									
								</td>
							</tr>
							
						</table>
						<br>
						<a href="/sqlreportserver?/Treatment Study/All Treatment Hours by Subject and Week&rs:Format=HTML4.0&rs:Command=Render">
							View All Treatment Hours in Browser</a><br>
							
						<a href="/sqlreportserver?/Treatment Study/View Treatment Action Detail&rs:Format=HTML4.0&rs:Command=Render">
							View Subject Actions Status in Browser</a><br>

						<a href="/sqlreportserver?/Treatment Study/Print Treatment Action Detail&rs:Format=PDF&rs:Command=Render">
						View Subject Action Status as PDF (use this for printing)</a><br>
							
					</p>
					<h4>Intervention Study Tracking</h4>
					<p>
						<a href="<%= Request.ApplicationPath %>/Applications/TXTracking/WeeklyActions.aspx">Weekly Actions</a><br>
						<a href="<%= Request.ApplicationPath %>/Applications/TXTracking/IntakeActions.aspx">Intake Actions</a><br>
						<a href="<%= Request.ApplicationPath %>/Applications/TXTracking/PastDueActions.aspx">Past Due Actions</a><br>
						<a href="<%= Request.ApplicationPath %>/Applications/TXTracking/StaffEditActions.aspx">Assigned Actions</a><br>
					</p><br><br>

</asp:Content>
