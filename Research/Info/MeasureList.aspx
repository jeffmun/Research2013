<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MeasureList.aspx.cs" AutoEventWireup="true"
 Inherits="Info_MeasureList" Title="Measure List" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

 <asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


 
 <br />
 <br />
 <table>
 <tr>
 <td width = "500px">             <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
            <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label></td>
 <td width="200px"><asp:Label ID="Label1" runat="server" Text="sort table by:" ForeColor="Navy" Font-Size="Smaller" ></asp:Label>
     <asp:DropDownList ID="ddl_sortmethod" runat="server"  ForeColor="Navy" OnSelectedIndexChanged="Change_SortMethod" AutoPostBack="true">
        <asp:ListItem Text="Measure Name" Value="measname" />
        <asp:ListItem Text="Category" Value="Category" />
        <asp:ListItem Text="Method" Value="method" />
        <asp:ListItem Text="Focus" Value="Focus" />
     </asp:DropDownList></td>
     <td >
         <asp:Button ID="btnRefresh" runat="server" Font-Size="X-Small" Text="Refresh" OnClick="btnRefresh_Click" />
     </td>
 </tr>
 </table>



     <br />
     <br />
     <asp:Label ID="Label2" runat="server" Text="Click on the measure name for detailed info." Font-Italic="true" ForeColor="Navy" Font-Size="X-Small" ></asp:Label>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="sql_measlist">
     <Columns>
     
     <asp:TemplateField><HeaderTemplate>mID</HeaderTemplate><ItemTemplate><asp:Label ID="measureID" runat="server" ForeColor="Gray" Text='<%#  DataBinder.Eval(Container.DataItem, "[measureID]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Category</HeaderTemplate><ItemTemplate><asp:Label ID="Category" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Category]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>MeasName</HeaderTemplate><ItemTemplate><asp:HyperLink ID="MeasName" runat="server" Target="_blank" Font-Bold="true" Text='<%#  DataBinder.Eval(Container.DataItem, "[MeasName]") %>' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[MeasInfoLink]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>MeasFullName</HeaderTemplate><ItemTemplate><asp:Label ID="MeasFullName" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[MeasFullName]") %>'></asp:Label></ItemTemplate></asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Time Points</HeaderTemplate><ItemTemplate><asp:Label ID="lblTPpattern" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[TPpattern]") %>'  ></asp:Label></ItemTemplate></asp:TemplateField>

     <asp:TemplateField><HeaderTemplate>Data Form</HeaderTemplate><ItemTemplate><asp:HyperLink ID="DataForm_link" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[DataForm_LinkLabel]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[DataForm_Link]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Data Entry</HeaderTemplate><ItemTemplate><asp:HyperLink ID="DataForm_link" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[DE_LinkLabel]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[DE_Link]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>

     <asp:TemplateField><HeaderTemplate>Respondent</HeaderTemplate><ItemTemplate><asp:Label ID="Respondent" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Respondent]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Method</HeaderTemplate><ItemTemplate><asp:Label ID="Method" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Method]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Focus</HeaderTemplate><ItemTemplate><asp:Label ID="Focus" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Focus]") %>'></asp:Label></ItemTemplate></asp:TemplateField>

     <asp:TemplateField><HeaderTemplate>Desc Stats</HeaderTemplate><ItemTemplate><asp:HyperLink ID="Desc_link" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Desc_LinkLabel]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[Desc_Link]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>
   
     
           <asp:TemplateField><HeaderTemplate>DataTable</HeaderTemplate><ItemTemplate><asp:Label ID="DataTable" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[DataTable]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
<%--
     <asp:TemplateField><HeaderTemplate>UW NDAR view</HeaderTemplate><ItemTemplate><asp:HyperLink ID="UW_NDARview" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[UW_NDARview]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[UW_NDARviewLink]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>NDAR Data Dict</HeaderTemplate><ItemTemplate><asp:HyperLink ID="ViewNDARdatadict" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ViewNDARdatadict]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[NDARlink]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>
--%>
     <asp:TemplateField><HeaderTemplate>Numrecs</HeaderTemplate><ItemTemplate><asp:Label ID="Numrecs" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[# recs]") %>'></asp:Label></ItemTemplate></asp:TemplateField>

     <asp:TemplateField><HeaderTemplate>Scoring Proc</HeaderTemplate><ItemTemplate><asp:HyperLink ID="Scoring_Proc" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Scoring_Proc]") %>'    NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[ScoreProcLink]") %>'></asp:HyperLink></ItemTemplate></asp:TemplateField>

     <asp:TemplateField><HeaderTemplate># Docs</HeaderTemplate><ItemTemplate><asp:Label ID="Num_Docs_Meas" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Num_Docs_Meas]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Admin time</HeaderTemplate><ItemTemplate><asp:Label ID="AdminTime" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[AdminTime]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Data Entry time</HeaderTemplate><ItemTemplate><asp:Label ID="DEesttime" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[DEesttime]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
        
              
              </Columns>

     </asp:GridView>
 

     <br /><br /><br />
     <asp:Label id="sm_label" runat="server" Text="Study Measure List" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label><br />
     <asp:button runat="server"  Text="Sort by Measure" OnClick="sm_sort_1" Font-Size="Smaller" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:button runat="server"  Text="Sort by Time point" OnClick="sm_sort_2" Font-Size="Smaller" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:button runat="server"  Text="Sort by studymeasID" OnClick="sm_sort_3" Font-Size="Smaller" />
     <br />
     <br />

     <asp:Panel id="sm_panel" runat="server">
     </asp:Panel> 


<%-- UW_NDARview, UW_NDARviewLink , ViewNDARdatadict, NDARlink--%>

     <asp:SqlDataSource ID="sql_measlist" runat="server" SelectCommandType="Text" SelectCommand="exec spStudyDesign__MeasureList_by_StudyID @sortmethod" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
    
     <SelectParameters><asp:ControlParameter ControlID="ddl_sortmethod" Name="sortmethod" DefaultValue="measname" PropertyName="SelectedValue" /></SelectParameters>
     </asp:SqlDataSource>

 
 
 </asp:Content>