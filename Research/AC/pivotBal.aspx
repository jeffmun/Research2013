<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="pivotBal.aspx.cs" Inherits="pivotBal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="Server">

      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
      <script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
      <script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
    

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <style type="text/css">
        .cssForTacoma {
            font: 11px Verdana;
            background-color: lightpink;
            color: darkred;
        }

        .cssForABA {
            font: 11px Verdana;
            background: LightBlue;
        }

        .cssForNoShow {
            font: 14px Verdana;
            background: Red;
        }

        /* unvisited link */
        a:link {
            color: purple;
            text-decoration-line: none;
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

    <asp:Label ID="Label0" runat="server" />

    <br />
    <asp:Label ID="Labelyyz" runat="server" Text="Query:"></asp:Label>

    <%--  <asp:Label ID="lblYr" runat="server" Text="Yr:"></asp:Label>--%>




    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" EnableViewState="true" ChildrenAsTriggers="true">

        <ContentTemplate>

            <%--<asp:TextBox ID="txtYr" runat="server" Text="2017"></asp:TextBox>--%>

            <asp:Label ID="Label1" runat="server" Text="Budget:"></asp:Label>

            <asp:DropDownList ID="BudgetDDL" runat="server" AutoPostBack="true" ></asp:DropDownList>
                       <asp:Label ID="Label12" runat="server" Text="Year:"></asp:Label>
            <asp:DropDownList ID="YearDDL" runat="server" AutoPostBack="true"></asp:DropDownList>

            <asp:CheckBox ID="chkCount" runat="server" Text="Include count" Visible="False" />



        </ContentTemplate>

        <Triggers>

            <%--<asp:AsyncPostBackTrigger ControlID="CheckBox1" EventName="CheckedChanged" />--%>

            <%--<asp:PostBackTrigger ControlID="txtYr" />--%>
            <asp:PostBackTrigger ControlID="BudgetDDL" />
            <asp:PostBackTrigger ControlID="YearDDL" />
        </Triggers>

    </asp:UpdatePanel>

         <%--       	<asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" Visible="false" /><br />--%>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <br />

    <asp:Panel ID="panel1" runat="server"></asp:Panel>
    
    <asp:Literal ID="ltrChart" runat="server"></asp:Literal>


           <asp:Label ID="Label2" runat="server" />
           <asp:Label ID="Label3" runat="server" />
           <asp:Label ID="Label4" runat="server" />
           <asp:Label ID="Label5" runat="server" />
           <asp:Label ID="Label6" runat="server" />
           <asp:Label ID="Label7" runat="server" />
           <asp:Label ID="Label8" runat="server" />
           <asp:Label ID="Label9" runat="server" />
           <asp:Label ID="Label10" runat="server" />
           <asp:Label ID="Label11" runat="server" />

        <asp:Panel ID="panel2" runat="server"></asp:Panel>
</asp:Content>

