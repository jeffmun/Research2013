<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="upload_gev.aspx.cs" Inherits="genetics_upload_gev" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <style>

    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      ></asp:ScriptManager>
    
      <br />

    <%--    from:  http://stackoverflow.com/questions/18858538/additional-onchange-event-for-fileupload-with-validators--%>
<%--  Not used however, this is for client-side processing the FileUpload control "change" event --%>
<%--    <script type="text/javascript" >
        function disableEnableUploadButton(btnUpload, FileUpload1) {
        var button = document.getElementById(btnUpload);
        var uploader = document.getElementById(FileUpload1);
        button.disabled = false;
        for (var i = 0; i < uploader.Validators.length; i++) {
            // Looping through each validator.
            if (uploader.Validators[i].isvalid == false) {
                // Looks like this validator isn't valid.  Better disable the upload button.
                button.disabled = true;
                break;
            }
        }
    }
    
</script>--%>
       <table>
       <tr>
           <td width="800px">
               <asp:Label ID="Label1" runat="server" Text="Upload Gene Events" Font-Bold="true" Font-Size="Large"></asp:Label>
           </td>
           <td align="right"> 
               <asp:Button ID="Button1" runat="server" Text="Search Gene Events" Font-Size="X-small" PostBackUrl="~/Genetics/search_gev.aspx" />
<%--               <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Genetics/search_gev.aspx">LinkButton</asp:LinkButton>
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Genetics/upload_gev.aspx">Search Gene Events files</asp:HyperLink>--%>
           </td>
       </tr>
   </table>

    <br />
    <br />

    <table>
        <tr>
            <td>
                <asp:Label ID="lblIntro" runat="server" Text="Select an Excel file containing Gene Events:" Font-Italic="true"></asp:Label> <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="XX-Small" Width="400px"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpload" runat="server" Text="Upload Excel File" OnClick="btnUpload_Click" Font-Size="XX-Small" Visible="true" />
                <br />
                <asp:RegularExpressionValidator  ID="uplValidator" runat="server" ControlToValidate="FileUpload1"
                        ErrorMessage="Only .xls, .xlsx formats are allowed" ForeColor="Red"   
                        ValidationExpression= "^.*\.xls[x]?$"></asp:RegularExpressionValidator>
                <br />

            </td>
            <td width="90px"></td>
            <td style="vertical-align:top" width="800px">
                <asp:Label ID="lblCurrentFiles" runat="server" Text="Current GeneEvent files:" Font-Bold="true" Font-Size="XX-Small"></asp:Label><br />
                <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="false" CssClass="tblInputSmall" OnRowCommand="gvFiles_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" Font-Size="XX-Small" ForeColor="DarkRed"
                                      CommandName="DeleteThisFile" CommandArgument='<%# Eval("filepk") %>' CausesValidation="True" UseSubmitBehavior="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
        </tr>
    </table>


    <br />
    <asp:Label ID="lblSubmitInfo" runat="server"></asp:Label>
    <asp:Label ID="lblExcelError" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />

    <table>
        <tr>
            <td style="vertical-align:top">
                <asp:Panel ID="panelSheets" runat="server" Visible="false"  >
                   
                        <asp:Label ID="lbl0" runat="server" Text="This file contains the following worksheets:"></asp:Label><br />
                        <asp:GridView id="gvSheets" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvSheets_RowDataBound"
                             OnRowCommand="gvSheets_RowCommand">
                            <Columns>
                                <asp:BoundField HeaderText="Sheet #" DataField="SheetNum" />
                                <asp:BoundField HeaderText="Sheet Name" DataField="SheetName" ItemStyle-Font-Bold="true" />
                                <asp:BoundField HeaderText="# Rows" DataField="NumRows" />
                                <asp:BoundField DataField="cols" Visible="false" />
                                <asp:TemplateField>
                                    <HeaderTemplate>View Data</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnViewData" runat="server" Text="View" CommandArgument='<%# Eval("SheetNum") %>'  CommandName="ViewData" Font-Size="XX-Small" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>ID</HeaderTemplate>
                                    <ItemTemplate><asp:DropDownList ID="ddl0" runat="server" CssClass="font8"></asp:DropDownList></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Method</HeaderTemplate>
                                    <ItemTemplate><asp:DropDownList ID="ddl1" runat="server" CssClass="font8"></asp:DropDownList></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Gene</HeaderTemplate>
                                    <ItemTemplate><asp:DropDownList ID="ddl2" runat="server" CssClass="font8"></asp:DropDownList></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Region</HeaderTemplate>
                                    <ItemTemplate><asp:DropDownList ID="ddl3" runat="server" CssClass="font8"></asp:DropDownList></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Event_type</HeaderTemplate>
                                    <ItemTemplate><asp:DropDownList ID="ddl4" runat="server" CssClass="font8"></asp:DropDownList></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Inheritance</HeaderTemplate>
                                    <ItemTemplate><asp:DropDownList ID="ddl5" runat="server" CssClass="font8"></asp:DropDownList></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Save Data</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnSaveData" runat="server" Text="Save" CommandArgument='<%# Eval("SheetNum") %>'  CommandName="SaveData" Font-Size="XX-Small" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                    <%--<Triggers>
                        <asp:PostBackTrigger ControlID="gvSheets" />
                    </Triggers>--%>
                </asp:Panel>
            </td>

        </tr>
    </table>
    <br /><br />

    <asp:Panel ID="PanelAddMethod" runat="server" BackColor="AliceBlue" Width ="260px">
        <asp:Label ID="lblAddMethod" runat="server" Text="Add new <b>Method</b> to dropdown:" Font-Size="XX-Small"></asp:Label>
        <asp:TextBox ID="txtAddMethod" runat="server" Font-Size="XX-Small" Width="60px" ></asp:TextBox>
        <asp:Button ID="btnAddMethod" runat="server" Text="Add" Font-Size="XX-Small" OnClick="btnAddMethod_Click" />

    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="Panel2" runat="server">
        <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="true"></asp:GridView>

        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="true"  ></asp:GridView>
    </asp:Panel>


<%--    from:  http://stackoverflow.com/questions/18858538/additional-onchange-event-for-fileupload-with-validators--%>
<%--    <script type="text/javascript">
        // This is not in a function, so it fires when the markup is being processed.  That's why it appears after everything else.
        var upl = document.getElementById('<%=FileUpload1.ClientID %>');
        $(upl).bind('change', function () { disableEnableUploadButton('<%=uplValidator.ClientID %>', '<%=btnUpload.ClientID %>'); });
    </script>--%>

    <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Magenta"></asp:Label>
</asp:Content>

