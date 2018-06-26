<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="AdverseEvents.aspx.cs" Inherits="Study_Tadpole_AdverseEvents" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">



<br /><br />
    <asp:Label ID="lblStudyname" runat="server" Text ="" Font-Bold="true" Font-Size="Medium"></asp:Label>

<br /><br />
    <asp:Label ID="lblAdvEv" runat="server" Text ="Serious Adverse Events" Font-Bold="true" Font-Size="Medium" ForeColor="DarkRed"></asp:Label>

<br /><br />
<asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" EmptyDataText="None.">
    <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="link" Text="View" HeaderText="View Details" />
        <asp:BoundField DataField="ID" HeaderText="ID" />
        <asp:BoundField DataField="Event_Date" HeaderText="Event Date" DataFormatString="{0:d}" />
        <asp:BoundField DataField="Time_Since_Event" HeaderText="Time Since Event" />

        <asp:BoundField DataField="Event_DateKnown"  HeaderText="Event Date Known" DataFormatString="{0:d}" />
        <asp:BoundField DataField="isSerious"  HeaderText="Is Serious?"/>
        <asp:BoundField DataField="AdvEv_Description"  HeaderText="Event Description" ItemStyle-Width="350px" />
        <asp:BoundField DataField="Serious_Event_Outcome"  HeaderText="Serious Event Outcome" ItemStyle-Width="250px"/>
        <asp:BoundField DataField="Event_Outcome" HeaderText="Event during study treatment session?" />
        <asp:BoundField DataField="Relat_to_study" HeaderText="Any Relationship with study procedure?" />
        <asp:BoundField DataField="Alter_risk" HeaderText="Event alter risks to past, present, or future subjects?" />

        <asp:BoundField DataField="actions_taken" HeaderText="Actions taken" />
        
    </Columns>

</asp:GridView>
    <br /><br />
    <asp:Label ID="Label1" runat="server" Text ="Other Adverse Events" Font-Bold="true" Font-Size="Medium"></asp:Label>

<br /><br />
<asp:GridView ID="gv2" runat="server" AutoGenerateColumns="false" EmptyDataText="None.">
    <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="link" Text="View" HeaderText="View Details" />
        <asp:BoundField DataField="ID" HeaderText="ID" />
        <asp:BoundField DataField="Event_Date" HeaderText="Event Date" DataFormatString="{0:d}"  />
        <asp:BoundField DataField="Time_Since_Event" HeaderText="Time Since Event" />
        <asp:BoundField DataField="Event_DateKnown"  HeaderText="Event Date Known" DataFormatString="{0:d}" />
        <asp:BoundField DataField="isSerious"  HeaderText="Is Serious?"/>
        <asp:BoundField DataField="AdvEv_Description"  HeaderText="Event Description" ItemStyle-Width="350px" />
        <asp:BoundField DataField="Serious_Event_Outcome"  HeaderText="Serious Event Outcome" ItemStyle-Width="250px"/>
        <asp:BoundField DataField="Event_Outcome" HeaderText="Event during study treatment session?" />
        <asp:BoundField DataField="Relat_to_study" HeaderText="Any Relationship with study procedure?" />
        <asp:BoundField DataField="Alter_risk" HeaderText="Event alter risks to past, present, or future subjects?" />

        <asp:BoundField DataField="actions_taken" HeaderText="Actions taken" />
        
    </Columns>

</asp:GridView>
  

</asp:Content>

