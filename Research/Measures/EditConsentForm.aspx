<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master"  CodeFile="EditConsentForm.aspx.cs" AutoEventWireup="True" Inherits="Measures.EditConsentForm" Title="Consent Forms" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<asp:Label ID="jmError" runat="server" Text="" ForeColor="Lime"></asp:Label>
<br />
	<table class="tblInput" style="MARGIN: 0px; WIDTH: 100%" cellspacing="0">
		<tr class="trTitle">
			<td id="tdTitle" colspan="2" runat="server"></td>
		</tr>
		<tr>
			<td><label for="selConsentFormVersionID">Version</label><br/>
				<asp:dropdownlist id="selConsentFormVersionID" Runat="server" Enabled="False"></asp:dropdownlist></td>
			<td id="tdInfo" width="250" rowspan="3" runat="server">
			    <div style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; FONT-WEIGHT: bold; PADDING-BOTTOM: 2px; WIDTH: 100%; PADDING-TOP: 2px; BACKGROUND-COLOR: #a1b5cf; TEXT-ALIGN: center">Other 
					Info.
				</div>
			</td>
		</tr>
		<tr>
			<td><label for="txtDateSigned">Date Signed</label><br/>
				<asp:textbox id="txtDateSigned" Runat="server" Width="200"></asp:textbox>
				<img id="imgCalendar" alt="Select Date" src="<% =Request.ApplicationPath %>/images/dlcalendar_2.gif"/>
			</td>
		</tr>
        <tr>
			<td><label for="txtTimeSigned">Time Signed</label><br/>
				<asp:textbox id="txtTimeSigned" Runat="server" Width="200"></asp:textbox></td>
        </tr>
        <tr>
		    <td><label for="selConsentFormStatusID">Status</label><br/>
			    <asp:dropdownlist id="selConsentFormStatusID" Runat="server" Enabled="True"></asp:dropdownlist></td>
	    </tr>
		<tr>
			<td><label for="txtNotes">Notes</label><br/>
				<asp:textbox id="txtNotes" Runat="server" Rows="7" TextMode="MultiLine" Width="300px"></asp:textbox></td>
			<td id="tdDocuments" width="250" rowspan="2" runat="server">
				<div style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; FONT-WEIGHT: bold; PADDING-BOTTOM: 2px; WIDTH: 100%; PADDING-TOP: 2px; BACKGROUND-COLOR: #a1b5cf; TEXT-ALIGN: center">Documents
				</div>
			</td>
		</tr>
		<tr>
			<td id="tdConsentItems" runat="server">
        <asp:repeater id="rpConsentItems" runat="server" OnItemDataBound="rpConsentItems_ItemDataBound">
        <HeaderTemplate>
				<table cellpadding="5" cellspacing="0" border="0">
                    <tr>
                        <td style="font-weight:bold">cioID</td>
                        <td style="font-weight:bold">Consent Item</td>
                        <td style="font-weight:bold">Consented</td>
                        <td style="font-weight:bold">Date Signed</td>
                        <td style="font-weight:bold">Time Signed</td>
                        <td style="font-weight:bold">Item Notes</td>
                    </tr>
        </HeaderTemplate>
        <ItemTemplate>
                    <tr>
			            <td><asp:Label id="txtcioID" Runat="server" ></asp:Label></td>
                        <td><asp:Label ID="lblConsentItem" Runat="server"></asp:Label>
					        <input type="hidden" id="txtSubjConsentItemID" runat="server" name="txtSubjConsentItemID"/></td>
					    <td><asp:DropDownList ID="ddlConsentItem" Runat="server"></asp:DropDownList></td>
			            <td>
                            <asp:textbox id="txtItemDateSigned" Runat="server" Width="100"></asp:textbox>
                           
			            </td>
			            <td><asp:textbox id="txtItemTimeSigned" Runat="server" Width="100"></asp:textbox></td>
			            <td><asp:textbox id="txtSubjConsentItemNotes" Runat="server" Width="350px" MaxLength="50"></asp:textbox></td>
                    </tr>
		</ItemTemplate>
        <FooterTemplate>
                </table>
        </FooterTemplate>
       
		</asp:repeater>
            </td>
		</tr>
		<tr>
			<td colspan="2"><asp:button id="btnSaveChanges" onclick="SaveChanges" Runat="server" Text="Save Changes"></asp:button>
			<input id="hidSubjConsentID" type="hidden" name="hidSubjConsentID" runat="server"/>
			</td>
		</tr>
	</table>

    <br />
    <asp:Label ID="jmInfo" runat="server"></asp:Label>

<%--<table cellspacing="0" class="tblInput" style="margin: 0px; width: 100%;">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td>
			<label for="selConsentFormVersionID">Version</label><br/>
			<asp:DropDownList ID="selConsentFormVersionID" Runat="server" />
		</td>
		<td rowspan="2" id="tdInfo" runat="server" style="border-left: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Other Info.
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<label for="txtDateSigned">Date Signed</label><br/>
			<asp:TextBox ID="txtDateSigned" Runat="server" style="width: 200px;" />
			<img src="/images/dlcalendar_2.gif" id="imgCalendar" alt="Select Date" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="txtNotes">Notes</label><br/>
			<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Rows="7" style="width: 90%;" />
		</td>
		<td rowspan="2" id="tdDocuments" runat="server" style="border-left: solid 1px #336699; border-bottom: solid 1px #336699; width: 250px; padding: 0px;">
			<div style="text-align: center; width: 100%; background-color: #a1b5cf; font-weight: bold; padding: 2px;">
				Documents
			</div>
		</td>
	</tr>
	<tr>
		<td id="tdConsentItems" runat="server" style="border-bottom: solid 1px #336699;"></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
			<input type="hidden" id="hidSubjConsentID" name="hidSubjConsentID" runat="server" />
		</td>
	</tr>
</table>
--%>
<dlcalendar click_element_id="imgCalendar" input_element_id="<% =txtDateSigned.ClientID %>"></dlcalendar>

</asp:Content>