<%@ Page Title="Gene Events" Debug="true" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="search_gev.aspx.cs" Inherits="genetics_search_gev" 
        EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >

           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      >
    </asp:ScriptManager>

  <br />

       <table>
       <tr>
           <td width="800px">
               <asp:Label ID="Label2" runat="server" Text="Search Gene Events" Font-Bold="true" Font-Size="Large"></asp:Label>
           </td>
           <td align="right"> 
               <asp:Button ID="Button1" runat="server" Text="Upload Gene Events" Font-Size="X-Small" PostBackUrl="~/Genetics/upload_gev.aspx" />
<%--               <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Genetics/search_gev.aspx">LinkButton</asp:LinkButton>
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Genetics/upload_gev.aspx">Search Gene Events files</asp:HyperLink>--%>
           </td>
       </tr>
   </table>

    <br />
    <br />


    <asp:Label ID="lblInfo" runat="server"></asp:Label>
  <br />


 <asp:Label ID="Label1" runat="server" Text="Search Parameters:" Font-Bold="true" Font-Italic="true" Font-Size="XX-Small"></asp:Label>
<br />
    <asp:UpdatePanel ID="UpdatePanel0" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

        <table>
            <tr>
                <td style="vertical-align:top">
                    <asp:Label ID="lblStudy" runat="server" Text="Study" Font-Bold="true" ></asp:Label>
                </td>
                <td style="vertical-align:top">
                    <asp:Label ID="lblMethod" runat="server" Text="Method" Font-Bold="true" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblGene" runat="server" Text="Gene"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblRegion" runat="server" Text="Region"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEvent_type" runat="server" Text="Event type"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <table>
                        <tr>
                            <td><asp:Label ID="lblInheritance" runat="server" Text="Inheritance"  Font-Bold="true"></asp:Label></td>
                            <td><asp:Button ID="btnResetSearchParams" runat="server" Text="Reset search parameters" ForeColor="DarkRed" Font-Size="XX-Small"
                                    OnClick="btnResetSearchParams_Click"  /></td>
                        </tr>
                    </table>
                    
                    
                </td>
                <td width="700px">
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top">
                    <%--<asp:Label ID="Study" runat="server" Text="" Font-Bold="true" ></asp:Label>--%>
                </td>
                <td style="vertical-align:top">
<%--                    <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true" ></asp:Label>--%>
                </td>
                <td>
                    <asp:TextBox ID="txtGene" runat="server" Text=""  Font-Size="X-Small"  Width="80px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtRegion" runat="server" Text=""  Font-Size="X-Small"  Width="80px" ></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtEvent_type" runat="server" Text=""  Font-Size="X-Small"   Width="80px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtInheritance" runat="server" Text=""  Font-Size="X-Small"   Width="80px"></asp:TextBox>
                </td>
                <td width="700px">
                </td>
            </tr>

            <tr>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstStudy" runat="server" SelectionMode="Multiple" Font-Size="X-Small" EnableViewState="true" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstMethod" runat="server" SelectionMode="Multiple" Font-Size="X-Small" EnableViewState="true" Rows="12"  />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstGene" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstRegion" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstEvent_type" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstInheritance" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>               
                <td style="vertical-align:top">    
                     <asp:Label ID="lblNGeneEvents" runat="server" Text="" Font-Bold="true" Font-Size="XX-Small"></asp:Label><br /><br />
                    
                     <asp:Label ID="lblCurrentFiles" runat="server" Text="Current GeneEvent files:" Font-Bold="true" Font-Size="XX-Small"></asp:Label><br />
                    <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="false" CssClass="tblInputSmall" >
                        <Columns>
                            <asp:BoundField HeaderText="pk" DataField="filepk" />
                            <asp:BoundField HeaderText="FileName" DataField="filename" />
                            <asp:BoundField HeaderText="SheetName" DataField="sheetname" />
                            <asp:BoundField HeaderText="# rows" DataField="numrows" />
                            <asp:BoundField HeaderText="# cols" DataField="numcols" />
                            <asp:BoundField HeaderText="uploaded" DataField="uploaded" />
                            <asp:BoundField HeaderText="uploadedBy" DataField="uploadedBy" />
                        </Columns>
                    </asp:GridView>


                </td>
                <td>

                </td>
            </tr>
        </table>
        <br />
        <br />
            <table>
                <tr>
                    <td width="200" valign="bottom">
                        <asp:Label ID="Label3" runat="server" Text="Search by ID:" ></asp:Label><br />
                        <asp:TextBox ID="txtIDToFind" runat="server"></asp:TextBox>
                    </td>
                    <td width="200" valign="bottom">
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"  />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnResetSearchParams" />
        </Triggers>
    </asp:UpdatePanel>

    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="false" UpdateMode="Conditional">
        <ContentTemplate>
            
<%--             <asp:Label ID="lblFileinfo" runat="server" Text=""  Font-Size="X-Small"></asp:Label> <br />--%>
<%--            <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="true" />--%>

    <table>
        <tr>
            <td style="vertical-align:top">
                <br />
                <asp:Label ID="lblResults" runat="server" Text=""  Font-Size="Medium" Font-Bold="true" ForeColor="ForestGreen"></asp:Label> 
                <asp:GridView ID="gvSearchParams" runat="server" AutoGenerateColumns="true" ForeColor="ForestGreen" />
                <br /><br />
                <asp:Button ID="btnViewDetails" runat="server" Text="View Details" Font-Size="Small" Visible="true" OnClick="btnViewDetails_Click" />
                <br /><br /><br />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export Results to Excel" Font-Size="Small" Visible="true" OnClick="btnExportToExcel_Click" />

            </td>
            <td width="60px"></td>
            <td style="vertical-align:top">

                <br />
                <asp:Button ID="btnCheckAll" runat="server" Text="Check All" Font-Size="XX-Small" Visible="true" OnClick="btnCheckAll_Click" />
                <asp:Button ID="btnUncheckAll" runat="server" Text="Uncheck All" Font-Size="XX-Small" Visible="false" OnClick="btnUncheckAll_Click"  />
            
                <asp:GridView ID="gvGeneEvents" runat="server" AutoGenerateColumns="false" > <%--OnRowDataBound="gvGeneEvents_RowDataBound"--%>
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>View
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkView" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="study"          DataField="studyname"         />
                        <asp:BoundField HeaderText="ID"          DataField="id"         />
                        <asp:BoundField HeaderText="Method"      DataField="Method"      />
                        <asp:BoundField HeaderText="Region"      DataField="region"      />
                        <asp:BoundField HeaderText="Gene"        DataField="gene"        />
                        <asp:BoundField HeaderText="EventType"  DataField="event_type" />
                        <asp:BoundField HeaderText="Inheritance" DataField="inheritance" />
                        <asp:BoundField HeaderText="filepk" DataField="filepk" />
                        <asp:BoundField HeaderText="pk" DataField="pk" />
                        <asp:BoundField HeaderText="personID" DataField="personID" />
                    </Columns>
                </asp:GridView>
       
            </td>
        </tr>
    </table>



    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSearch" />
        <asp:PostBackTrigger ControlID="btnViewDetails" />
        <asp:PostBackTrigger ControlID="btnExportToExcel" />

    </Triggers>
    </asp:UpdatePanel>
    
    <br />
    <br />
<asp:Panel ID="Panel_Details" runat="server" ></asp:Panel>

</asp:Content>