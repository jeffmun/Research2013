<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="CurrentConnections.aspx.cs" Inherits="Admin_CurrentConnections" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">



<%--		<script type="text/javascript">
			function SelectDetail(oRecord) {
				var pkvalue = parseInt(oRecord[0].master_pk);

				// load selected Customer details 
				ob_post.AddParam("pkvalue", pkvalue);
				ob_post.post(null, "Log_pkvalue", UpdateDetails);
				//document.getElementById("order_label").innerHTML = "Orders made by " + oRecord[0].CustomerName;
			}

			function UpdateDetails() {
				//var ogrid_detail = document.getElementById("ogrid_detail");

				ogrid_detail.refresh();
			}
		</script>--%>

	<br />
<asp:Label ID="lblStudy" runat="server" Text="" Font-Size="Large" Font-Bold="true" ForeColor="ForestGreen"></asp:Label><br />
<br />


<asp:Label ID="lblTitle" runat="server" Text="Current Connections" Font-Size="Medium" Font-Bold="true"></asp:Label><br />
<asp:Label ID="Label1" runat="server" Text="Staff with connections within the past 30 mins are highlighted." Font-Size="Small" Font-Bold="false" ForeColor="ForestGreen"></asp:Label><br />
<br />
<br />


	<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="false" >
		<Columns>
			<dx:GridViewDataColumn FieldName="staffID"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="lastname"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="firstname"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="NETID"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="numHits"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="unqHits"></dx:GridViewDataColumn>
			<dx:GridViewDataDateColumn FieldName="hitTime" PropertiesDateEdit-DisplayFormatString="MM/dd/yy HH:mm"></dx:GridViewDataDateColumn>
			<dx:GridViewDataColumn FieldName="lastHit"></dx:GridViewDataColumn>
			<dx:GridViewDataColumn FieldName="mins_since_lastHit" Visible="false"></dx:GridViewDataColumn>

		</Columns>
		<FormatConditions>
			<dx:GridViewFormatConditionHighlight FieldName="lastname" Expression="[mins_since_lastHit] < 30" Format="GreenFillWithDarkGreenText" />
			<dx:GridViewFormatConditionHighlight FieldName="firstname" Expression="[mins_since_lastHit] < 30" Format="GreenFillWithDarkGreenText" />
			<dx:GridViewFormatConditionHighlight FieldName="NETID" Expression="[mins_since_lastHit] < 30" Format="GreenFillWithDarkGreenText" />
		</FormatConditions>
	</dx:ASPxGridView>






</asp:Content>

