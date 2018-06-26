
<%@ Page language="c#" Inherits="GenericDataEntryForms.cts.cts_lookup" CodeFile="cts_lookup.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<h3>Lookup CTS</h3>
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
						<asp:Button id="cmdLookup" runat="server" Text="Lookup"></asp:Button><br>
						<a href="cts1.aspx">Click to Enter New Toddler Temperament Scale</a><br>
						<br>
						<a href="cts2.aspx">Click to Enter New Behavioral Style Questionnaire</a><br>
						<br>
						<a href="cts3.aspx">Click to Enter New Middle Childhood Questionnaire</a><br>
						<br>
						<asp:TextBox id="txtAllowedStudyMeasures" runat="server" Visible="False">519, 529</asp:TextBox>
						<br>
					</asp:Content>
