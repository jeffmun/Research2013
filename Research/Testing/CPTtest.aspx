<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="CPTtest.aspx.cs" Inherits="Testing_CPTtest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


		<style type="text/css">
		.cssForTacoma {
			font:11px Verdana;
			background-color: lightpink;
			color:darkred;
		}

		.cssForABA{
			font:11px Verdana;
			background:LightBlue;
		}
		.cssForNoShow{
			font:14px Verdana;
			background:Red;
		}

		/* unvisited link */
		a:link {
			color: purple;
			text-decoration-line:none;
		}

		/* visited link */
		a:visited {
			color: green;
		}

		/* mouse over link */
		a:hover {
			color: hotpink;
		}

		</style>


	<br />
	<asp:Label ID="lblYr" runat="server" Text="Yr:"></asp:Label>
	<asp:TextBox ID="txtYr" runat="server" Text="2016"></asp:TextBox> 
	<asp:CheckBox ID="chkCount" runat="server" Text="Include count" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" /><br />
	<br />

	<asp:Panel ID="panel1" runat="server"></asp:Panel>

</asp:Content>

