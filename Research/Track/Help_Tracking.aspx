<%@ Page Language="C#"   Debug="false" MasterPageFile="~/UWAC.master" CodeFile="Help_Tracking.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_Help_Tracking" Title="Measure Info"      %>
  <%--Theme="Skin1" EnableEventValidation="true"--%>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
    </asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



<div class="right">
    <table style="width:98%">

        <tr>
            <td>
                <h2>New Subject Tracking Pages</h2>
            </td>
            <td style="text-align: right">        
                <br /><br />
                <dx:ASPxButton ID="btnReturn" runat="server" Text="Return to " OnClick="btn_Click" Width="100px"></dx:ASPxButton>
            </td>
        </tr>
        </table>
    </div>

    <br />
    <h3>Instructions for Measures pages</h3>
    <asp:Label ID="lblSubtitle2" runat="server" Text="In general, we will be updating pages with grids and tables that work the same way as those described here." Font-Size="12" ></asp:Label>
    <br />
    <asp:Label ID="lblSubtitle1" runat="server" Text="These instructions illustrate using the Measures page, however, the Subjects & Actions pages work in similar ways." Font-Bold="false"  Font-Size="12" ></asp:Label>
    <br />
    <br />
            <dx:ASPxImageSlider ID="ASPxImageSlider" runat="server" BackColor="White" ForeColor="White" Width="80%" ImageSourceFolder="~/Help/Images/">
                <SettingsImageArea NavigationButtonVisibility="Always" AnimationType="Fade"  />
                <Styles>
                  <PassePartout BackColor="Transparent" />
                </Styles>
            </dx:ASPxImageSlider>
 


    </asp:Content>