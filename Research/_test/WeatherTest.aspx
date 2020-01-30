<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="WeatherTest.aspx.cs" Inherits="_test_WeatherTest" Async="true" 
	 EnableEventValidation="false" Title="Weather Test"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


    <asp:Label ID="lbl1" runat="server" Text="Weather Test - retrieve data from the DarkSky API" Font-Bold="true" Font-Size="Small"></asp:Label>

    <table>
        <tr>
            <td style="padding: 10px">
                <dx:ASPxTextBox ID="txtlat" runat="server" Caption="Lat:" Text="40.909615"></dx:ASPxTextBox>
            </td>
            <td style="padding: 10px">
                <dx:ASPxTextBox ID="txtlong" runat="server" Caption="Long:" Text="-73.113439"></dx:ASPxTextBox>
            </td>

            <td style="padding: 10px">
                    <dx:ASPxDateEdit ID="date1" ClientInstanceName="date1" runat="server" Caption="Date:"></dx:ASPxDateEdit>
            </td>
            <td style="padding: 10px">
            </td>
            <td style="padding: 10px">
                    <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" AutoPostBack="true"></dx:ASPxButton>
            </td>
        </tr>
    </table>

    <br />
    <br />
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="true" Visible="false">
        <SettingsPager PageSize="30" ></SettingsPager>
    </dx:ASPxGridView>
    <asp:Label ID="lblResults" runat="server" Visible="true"></asp:Label>    
    <asp:PlaceHolder ID="holder" runat="server"></asp:PlaceHolder>

</asp:Content>
