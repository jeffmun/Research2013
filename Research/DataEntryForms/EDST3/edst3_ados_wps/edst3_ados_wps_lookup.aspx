
<%@ Page language="c#" Inherits="edst3_ados_wps.edst3_ados_wps_lookup" CodeFile="edst3_ados_wps_lookup.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<DIV><b>Lookup EDS T3 ADOS WPS</b></DIV>
						<P>
							<br/>
							<br/>
							<asp:Label id="lblErrors" runat="server" Width="352px" Height="32px" ForeColor="Red" Visible="False"></asp:Label><br/>
							<br/>
							EDS ID: &nbsp;<asp:TextBox id="txtEDSID" runat="server"></asp:TextBox>&nbsp;
							<asp:Button id="cmdLookup" runat="server" Text="Lookup"></asp:Button><br/>
							<br/>
						</P>
						<P>
							<a href="edst3_ados_wps_mod1.aspx">Click to Enter New Module 1</a><br/>
							<br/>
							<a href="edst3_ados_wps_mod2.aspx">Click to Enter New Module 2</a><br/>
							<br/>
							<a href="edst3_ados_wps_mod3.aspx">Click to Enter New Module 3</a><br/>
							<br/>
							<a href="edst3_ados_wps_mod4.aspx">Click to Enter New Module 4</a><br/>
							<br/>
						</P>
					</asp:Content>
