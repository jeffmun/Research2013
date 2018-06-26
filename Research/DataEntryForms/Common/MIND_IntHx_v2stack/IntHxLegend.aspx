<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IntHxLegend.aspx.cs" Inherits="DataEntryForms_Common_MIND_IntHx_v2stack_IntHxLegend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<asp:Label ID="lblTitle" runat="server" Text ="Legend for IntHx Categories" Font-Bold="true" Font-Underline="true" Font-Size="Medium" ></asp:Label>		
			
			<br /><br />
	<table>
		<tr>
			<td style="vertical-align:top">
			<%--<obout:Grid ID="GridTxCat" runat="server" DataSourceID="sqlTxCat" AutoGenerateColumns="true"   
				AllowEdit="false"   OnRowDataBound="GridTxCat_RowDataBound" 
				AllowPaging="false"  FolderStyle="~/App_Obout/Grid/styles/premiere_blue" PageSize="-1" Width="500px" >
				<Columns>
				</Columns>
			</obout:Grid>--%>

				<asp:GridView ID="gv1" runat="server" DataSourceID="sqlTxCat" AutoGenerateColumns="false">
					<Columns>
						<asp:BoundField DataField="txcatID" HeaderText="txcatID" />
						<asp:TemplateField HeaderText="color">
							<ItemTemplate>
								<asp:Label ID="lbl1" runat="server"  Text="_____" BackColor='<%# System.Drawing.ColorTranslator.FromHtml(@"#" + Eval("txcatcolor")) %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>						<asp:BoundField DataField="txcat" HeaderText="txcat" />

					</Columns>
				</asp:GridView>


			</td>
			<td width="50"></td>
			<td style="vertical-align:top">


				
				<asp:GridView ID="gv2" runat="server" DataSourceID="sqlTxType" AutoGenerateColumns="false">
					<Columns>
						<asp:BoundField DataField="txtypeID" HeaderText="txtypeID" />
						<asp:TemplateField HeaderText="color">
							<ItemTemplate>
								<asp:Label ID="lbl1" runat="server" Text="_____" BackColor='<%# System.Drawing.ColorTranslator.FromHtml(@"#" + Eval("txtypecolor")) %>' ></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>						<asp:BoundField DataField="txtype" HeaderText="txtype" />
						<asp:BoundField DataField="txcat" HeaderText="txcat" />

					</Columns>
				</asp:GridView>
			</td>
		</tr>
	</table>


			<asp:SqlDataSource ID="sqlTxCat" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommand="select * from const_MIND_IntHXv2_TxCat">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlTxType" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommand="select a.txtypeID, txtype, txcat, txtypecolor 
						from const_MIND_IntHXv2_TxType a join const_MIND_IntHXv2_TxCat b ON a.txcatID = b.txcatID
						order by txcat, txtypeID">
	</asp:SqlDataSource>


	</div>
	</form>
</body>
</html>
