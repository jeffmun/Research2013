
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="VStudyNs.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_VStudyNs" Title="Study Ns"   Theme="Skin1" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style>  p {color: DarkBlue; }
  .fs14 {    font-size: 12px;  }
</style>
	 
<style> big {font-size:14pt; }</style>

<style type="text/css">
	foo
	{
		color: red;
		position: relative !important;
		top:-2px !important;
		left: -2px !important;
	}
</style>




	<br />

	<asp:Label ID="LabelTitle" runat="server" Text="Study N's" Font-Size="Medium" Font-Bold="false"></asp:Label>

		<br />
		<br />
	<asp:Label ID="lbl1" runat="server" Text="" Font-Size="Medium" Font-Bold="false"></asp:Label>
	<br />
	<asp:Label ID="vlbl1" runat="server" Text="" Font-Size="Medium" Font-Bold="false"></asp:Label>

		<br />
		<br />

	<asp:DropDownList ID="ddlPI" runat="server"  DataTextField="pi_name" DataValueField="staffID" 
		AutoPostBack="true" OnSelectedIndexChanged="ddlPI_SelectedIndexChanged" EnableViewState="true" ></asp:DropDownList>


	<br />
	<br />


	<asp:Label ID="label1" runat="server" Text="By Study" Font-Bold="true" Visible="false"></asp:Label><br />
	<asp:Panel ID="panel1" runat="server"/>
	<br />
	<br />
	<asp:Label ID="label2" runat="server" Text="By Study & GroupType" Font-Bold="true"  Visible="false"></asp:Label><br />
	<asp:Panel ID="panel2" runat="server"/>
	<br />
	<br />
	<asp:Label ID="label3" runat="server" Text="By Study & Group" Font-Bold="true"  Visible="false"></asp:Label><br />
	<asp:Panel ID="panel3" runat="server"/>
	<br />
	<br />

<%--	<asp:Label ID="label3" runat="server" Text="Subjects" Font-Bold="true"></asp:Label><br />
	<asp:Panel ID="panel3" runat="server"/>
	<br />
	<br />--%>






<%--
	<asp:SqlDataSource ID="sqlPI" runat="server" ConnectionString="<%$ ConnectionStrings:VTRACKING_CONN_STRING %>"
		 SelectCommandType="Text"
		 SelectCommand="select -1 staffID, '<select PI>' pi_name union select staffID, firstname + ' ' + lastname as pi_name from tblStaff where staffID in (select distinct(PI) from tblstudy where PI is not null)"></asp:SqlDataSource>--%>

</asp:Content>




