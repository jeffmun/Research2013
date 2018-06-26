
<%@ Page language="c#" Inherits="ados" CodeFile="ados.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<b>Lookup ADOS G/WPS</b><br>
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
							<tr>
								<td>Indexnum:</td>
								<td><asp:TextBox id="txtIndexnum" runat="server"></asp:TextBox>
									<br>
									(This defaults to 1 as most studies collect only 1 ADOS)
								</td>
							</tr>
						</table>
						<br>
						<asp:Button id="cmdLookup" runat="server" Text="Lookup"></asp:Button><br>
						<asp:Literal id="LookupResults" runat="server"></asp:Literal><br>
						<a href="ados_wps_mod1.aspx">Click to Enter New ADOS-WPS Module 1</a><br>
						<br>
						<a href="ados_wps_mod2.aspx">Click to Enter New ADOS-WPS Module 2</a><br>
						<br>
						<a href="ados_wps_mod3.aspx">Click to Enter New ADOS-WPS Module 3</a><br>
						<br>
						<a href="ados_wps_mod4.aspx">Click to Enter New ADOS-WPS Module 4</a><br>
						<br>
						<a href="ados_g_mod1.aspx">Click to Enter New ADOS-G Module 1</a><br>
						<br>
						<a href="ados_g_mod2.aspx">Click to Enter New ADOS-G Module 2</a><br>
						<br>
						<a href="ados_g_mod3.aspx">Click to Enter New ADOS-G Module 3</a><br>
						<br>
						<a href="ados_g_mod4.aspx">Click to Enter New ADOS-G Module 4</a><br>
						<asp:TextBox id="txtAllowedStudyMeasures" runat="server" Visible="False">125,192,215,339,379,544,545,585,623,660,726,788,923,928,947,950,951,963,1050,1238,1301,1345,1418,1502,1505,1544,1545,1640,1641,1669,1675,1678,1679,1854,1881,1882,1906,1961,1973,2015,2067,2089,2244,2296,2329,2411,2485,2503,2504,2505,2617,2657,2663,2693,2731,2732,2733,2734,2812,2828,3231,3562</asp:TextBox>
						<br>
					</asp:Content>
