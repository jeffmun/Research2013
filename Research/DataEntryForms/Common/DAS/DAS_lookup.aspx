
<%@ Page language="c#" Inherits="GenericDataEntryForms.DAS.DAS_lookup" CodeFile="DAS_lookup.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<b>Lookup DAS Upper Preschool/Schoolage</b><br>
						<asp:Label id="lblErrors" runat="server" Width="352px" Height="32px" ForeColor="Red" Visible="False"></asp:Label><br>
						<table>
							<tr>
								<td>Study Measure:</td>
								<td><asp:DropDownList id="ddlStudyMeasID" runat="server"></asp:DropDownList></td>
							</tr>
							<tr>
								<td>Subject ID:</td>
								<td><asp:TextBox id="txtID" runat="server"></asp:TextBox></td>
							</tr>
						</table>
						<br>
						<asp:Button id="cmdLookup" runat="server" Text="Lookup" onclick="cmdLookup_Click"></asp:Button><br>
						<a href="DASUpperPreschool.aspx">Click to Enter New Upper Preschool DAS</a><br>
						<br>
						<a href="DASSchoolAge.aspx">Click to Enter New Schoolage DAS</a><br>
						<asp:TextBox id="txtAllowedStudyMeasures" runat="server" Visible="False">103,242,525,536,627,694</asp:TextBox>
						<br>
					</asp:Content>
