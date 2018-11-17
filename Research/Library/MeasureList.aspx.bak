<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MeasureList.aspx.cs" AutoEventWireup="true"
 Inherits="Library_MeasureList" Title="Measure List" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


 <asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

     <script>
         function ToggleGrid(s) {
             var isvisible = grid.GetVisible();
             if (isvisible) {
                 grid.SetClientVisible(false);
                 btnToggleGrid.SetText("Show measures");
             } else {
                 grid.SetClientVisible(true);
                 btnToggleGrid.SetText("Hide measures");
             }
         }
        function ToggleGrid2(s) {
             var isvisible = grid2.GetVisible();
             if (isvisible) {
                 grid2.SetClientVisible(false);
                 btnToggleGrid2.SetText("Show study measures");
             } else {
                 grid2.SetClientVisible(true);
                 btnToggleGrid2.SetText("Hide study measures");
             }
         }

     </script>

 
      <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="Measure Library: " Font-Bold="true"></dx:ASPxLabel>
<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Large" Font-Bold="true"></asp:Label>
 <br />

<table>
 <tr>
     <td style="width:500px">
     </td>
     <td style="width:200px">
         <dx:ASPxButton ID="btnToggleGrid" runat="server" ClientInstanceName="btnToggleGrid" Text="Hide Measures" ClientSideEvents-Click="ToggleGrid" AutoPostBack="false" ></dx:ASPxButton>
     </td>
 </tr>
 </table>



     <br />
     <br />
     <asp:Label ID="Label2" runat="server" Text="Click on the measure name for detailed info." Font-Italic="true" ForeColor="Navy" Font-Size="X-Small"  ></asp:Label>

 
     <dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid"    Styles-AlternatingRow-BackColor="Whitesmoke" 
         DataSourceID="sql_measlist">
         <Settings ShowGroupPanel="true" />
         <SettingsPager PageSize="50"></SettingsPager>
         <Columns>
            <dx:GridViewDataColumn FieldName="measureID" Caption="mID" />
            <dx:GridViewDataColumn FieldName="Category" />

             <dx:GridViewDataHyperLinkColumn FieldName="DE_Link" Caption="Measure">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_DE" runat="server" Text='<%# Eval("MeasName") %>' NavigateUrl='<%# "~/Library/Measure.aspx?mID=" + Eval("measureID") %>' Font-Bold="true">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>

            <dx:GridViewDataColumn FieldName="MeasFullName" Caption="Measure Full Name" />

            <dx:GridViewDataHyperLinkColumn FieldName="DE_Link" Caption="Data Dict">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_DD" runat="server" Text="Dict" NavigateUrl='<%# "~/Data/Dictionary.aspx?mID=" + Eval("measureID") %>' Font-Bold="false">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>


            <dx:GridViewDataHyperLinkColumn FieldName="DE_Link" Caption="DE Link">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_DE" runat="server" Text='<%# Eval("DE_LinkLabel") %>' NavigateUrl='<%# Eval("DE_Link") %>'>
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>

<%--            <dx:GridViewDataHyperLinkColumn FieldName="DataForm_Link" Caption="Form Links">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_Form" runat="server" Text="Form" NavigateUrl='<%# Eval("DataForm_Link") %>'>
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>--%>

             
            <dx:GridViewDataColumn FieldName="Respondent" />
            <dx:GridViewDataColumn FieldName="Method" />
            <dx:GridViewDataColumn FieldName="Focus" />
            <dx:GridViewDataColumn FieldName="# studies using" />
            <dx:GridViewDataColumn FieldName="tblpk" />
            <dx:GridViewDataColumn FieldName="DataTable" />
            <dx:GridViewDataColumn FieldName="# recs" />

            <dx:GridViewDataHyperLinkColumn FieldName="Scoring_Proc" Caption="Scoring Proc">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_ScoreProc" runat="server" Text='<%# Eval("Scoring_Proc") %>' NavigateUrl='<%#  "~/Data/ScoreProc.aspx?tblpk=" + Eval("tblpk") %>'>
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
             
            <dx:GridViewDataColumn FieldName="Num_Docs_Meas" Caption="# Docs Meas" />
            <dx:GridViewDataColumn FieldName="NumManuals" Caption="# Manuals" />
            <dx:GridViewDataColumn FieldName="NumArticles" Caption="# Articles" />
            <dx:GridViewDataColumn FieldName="AdminTime" Caption="Admin Time" />
            <dx:GridViewDataColumn FieldName="DEesttime" Caption="DE estim time" />
            <%--<dx:GridViewDataColumn FieldName="tblpk" />--%>
         </Columns>
     </dx:ASPxGridView>


     <br /><br /><br />



<table>
 <tr>
     <td style="width:500px">
         <asp:Label ID="Label1" runat="server" Text="Study Measure List" Font-Size="Medium" Font-Bold="true" Font-Underline="true"></asp:Label>
     </td>
     <td style="width:200px">
         <dx:ASPxButton ID="btnToggleGrid2" runat="server" ClientInstanceName="btnToggleGrid2" Text="Hide Study Measures" ClientSideEvents-Click="ToggleGrid2" AutoPostBack="false" ></dx:ASPxButton>
     </td>
 </tr>
 </table>
     <br />


      <dx:ASPxGridView ID="grid2" runat="server" ClientInstanceName="grid2"    Styles-AlternatingRow-BackColor="Whitesmoke" 
         DataSourceID="sql_studymeas">
         <Settings ShowGroupPanel="true" />
         <SettingsPager PageSize="50"></SettingsPager>
         <Columns>
            <dx:GridViewDataColumn FieldName="mID" Caption="mID" />
            <dx:GridViewDataColumn FieldName="Measname" Caption="Measure" />
            <dx:GridViewDataColumn FieldName="TimePoint" Caption="TimePoint" />
            <dx:GridViewDataColumn FieldName="studymeasID" Caption="smID" />
            <dx:GridViewDataColumn FieldName="StudyMeasName" Caption="StudyMeasName" />

             </Columns>
          </dx:ASPxGridView>


     <asp:Panel id="sm_panel" runat="server">
     </asp:Panel> 


<%-- UW_NDARview, UW_NDARviewLink , ViewNDARdatadict, NDARlink--%>

     <asp:SqlDataSource ID="sql_measlist" runat="server" SelectCommandType="Text"
         SelectCommand="select *  from vwStudyDesign__MeasureList where measureID in (select measureID from tblstudymeas where studyID = @studyID) " 
         ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
         <SelectParameters>
                 <asp:SessionParameter SessionField="master_studyID" Name="studyID" DbType="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>

 
     <asp:SqlDataSource ID="sql_studymeas" runat="server" SelectCommandType="Text"
         SelectCommand="select measureID mID, Measname, TimePoint_text as TimePoint, studymeasID, StudyMeasName from vwMasterStatus_StudyMeas where studyID = @studyID order by Measname, TimePoint_text" 
         ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
         <SelectParameters>
             <asp:SessionParameter SessionField="master_studyID" Name="studyID" DbType="Int32" /></SelectParameters>
     </asp:SqlDataSource>


 
 </asp:Content>