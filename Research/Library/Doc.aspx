<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Doc.aspx.cs" AutoEventWireup="true"
 Inherits="Library_Doc" Title="Document"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">

    <style>
        .buttonContainer {
            padding-top: 12px;
            width: 400px;
            text-align: right;
        }
        .buttonContent {
            display: inline-block;
        }
        .leftPadding {
            padding-left: 8px;
        }
        .buttonWidth {
            width: 150px;
        }
        @media(max-width:480px) {
            .smallScreenEditorsWidth, .buttonContainer, .buttonWidth {
                width: 290px !important;
            }
            .leftPadding {
                padding-left: 0;
            }
            .topPadding {
                padding-top: 8px;
            }
        }
    </style>
    
<script type="text/javascript">
    var isDirty = false;
    var initialState = {};
    function onControlsInitialized() {
        ASPxClientEdit.AttachEditorModificationListener(onEditorsChanged, function (control) {
            return control.GetParentControl() === form_docvers // Gets standalone editors nested inside the form layout control
        });
        //ASPxClientUtils.AttachEventToElement(window, "beforeunload", onBeforeUnload);
        initialState = ASPxClientUtils.GetEditorValuesInContainer(form_docvers.GetMainElement());
    }
    function onEditorsChanged(s, e) {
        SaveButton.SetEnabled(true);
        CancelButton.SetEnabled(true);
        SaveButton.SetVisible(true);
        CancelButton.SetVisible(true);
        isDirty = true;
    }

    function onHtmlEditorChanged(s, e) {
        SaveButton.SetEnabled(true);
        CancelButton.SetEnabled(true);
        SaveButton.SetVisible(true);
        CancelButton.SetVisible(true);
        isDirty = true;
    }

    function cancelChanges(s, e) {
        ASPxClientUtils.SetEditorValues(initialState);
        isDirty = false;
        SaveButton.SetEnabled(false);
        CancelButton.SetEnabled(false);
        SaveButton.SetVisible(false);
        CancelButton.SetVisible(false);
    }
    function onBeforeUnload(e) {
        if (!isDirty)
            return;
        e.returnValue = "";
    }
    function onSubmitForm() {
        isDirty = false;
    }
</script>


        <script type="text/javascript">
            function OnExceptionOccurred(s, e) {
                e.handled = true;
                alert(e.message);
                window.location.reload();
            }

            function OnInit(s, e) {
                //s.SetFullscreenMode(true); 
            }

            function ShowDetails(s, e) {
                var vis = form.GetVisible();
                if (vis == true) {
                    //alert("the form should be visible");
                    form.SetVisible(false);
                    btnShowDetails.SetText("Show Details");
                }
                else {
                    //alert("the form should NOT be visible");
                    btnShowDetails.SetText("Hide Details");
                    form.SetVisible(true);
                }
            }

            function onDeleteClick(s, e) {
                if (confirm("Confirm Delete?"))
                    alert("gotcha.");
                //grid.DeleteRow(index);
            }


            function ConfirmDelete(s, e) {
                btnDelete.SetVisible(false);
                panelDel.SetVisible(true);
            }

            function CancelDelete(s, e) {
                btnDelete.SetVisible(true);
                panelDel.SetVisible(false);
            }

        </script>
</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

    <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server" ClientSideEvents-ControlsInitialized="onControlsInitialized"></dx:ASPxGlobalEvents>

    <dx:ASPxPanel id="panel1" runat="server">
        <PanelCollection>
            <dx:PanelContent>
                <dx:ASPxLabel ID="lbl1" runat="server" Text="Document Viewer" Font-Bold="true"></dx:ASPxLabel>

<%--                <dx:ASPxLabel ID="lblLoadError" runat="server" Text="<br/><br/><br/>File not found.<br/><br/><br/>" EncodeHtml="false" ForeColor="DarkRed" Font-Bold ="true" Visible="false"></dx:ASPxLabel>--%>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>



    
    <dx:ASPxSplitter ID="Splitter1" runat="server" Height="750px"    >
        <Styles ></Styles>
        <Panes>
            <dx:SplitterPane ShowCollapseBackwardButton="True" runat="server" Size="500px"  >
               <ContentCollection>
                   <dx:SplitterContentControl>

                       <dx:ASPxButton ID="btnDownload" runat="server" Text="Download this document" OnClick="btnDownload_Click"></dx:ASPxButton>

    <asp:FormView ID="fv" runat="server" DefaultMode="Edit" DataSourceID="sql_docvers" Width="95%" DataKeyNames="docversid">

	  <EditItemTemplate>
    
   <div class="buttonContainer">
        <div class="buttonContent">
            <%--<dx:ASPxButton ID="btn" runat="server" Text="Update" OnClick="btn_Click"></dx:ASPxButton>--%>

 <%--          --%>
            <dx:ASPxButton ID="SaveButton" ClientInstanceName="SaveButton" runat="server"
                Text="Save Changes" Width="100%" CssClass="buttonWidth"  ClientVisible="false"  OnClick="SaveButton_Click" ForeColor="ForestGreen" >
                <%--<ClientSideEvents Click="onSubmitForm" />--%>
            </dx:ASPxButton>
        </div>
        <div class="buttonContent leftPadding topPadding">
            <dx:ASPxButton ID="CancelButton" ClientInstanceName="CancelButton" runat="server"
                Text="Cancel Changes" Width="100%" CssClass="buttonWidth" AutoPostBack="false"  ClientVisible="false" ForeColor="Red">
                <ClientSideEvents Click="cancelChanges" />
            </dx:ASPxButton>
        </div>
    </div>

            <dx:ASPxFormLayout ID="form_docvers" ClientInstanceName="form_docvers"  runat="server" Width="100%"  >
                <Items>
                    <dx:LayoutGroup  ColumnCount="1"  Caption="Document details" >
                        <Items>

                            <dx:LayoutItem FieldName="doctypeid"  Caption="Doc Type:" CaptionStyle-ForeColor="Gray">
                                <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxComboBox ID="cbo_doctypeid" runat="server" Font-Bold="true"  DataSourceID="sql_doctype" 
                                            Value='<%# Bind("doctypeid") %>'   Text='<%# Bind("doctype") %>' 
                                            TextField="doctype" ValueField="doctypeid" Width="100%"  ></dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem FieldName="docids"  Caption="DocID (DocVersID):" CaptionSettings-Location="Left"  CaptionStyle-ForeColor="Gray">
                                <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="lbl_docids" runat="server" Width="100%" ForeColor="Gray" Text='<%# Bind("docids") %>'  />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="origfilename"  Caption="Orig Filename:" CaptionSettings-Location="Left" CaptionStyle-ForeColor="Gray">
                                <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="lbl_origfilename" runat="server" Width="100%"  Font-Bold="true"  Text='<%# Bind("origfilename") %>'/>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>                    
                            <dx:LayoutItem FieldName="doctitle"  Caption="Title:" CaptionSettings-Location="Left" CaptionStyle-ForeColor="Gray">
                                <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="txt_doctitle" runat="server" Width="100%"  Font-Bold="false"  Text='<%# Bind("doctitle") %>'/>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>                   
 
 
                   <%--         <dx:LayoutItem FieldName="filesize_units"  Caption="File size:" CaptionStyle-ForeColor="Gray">
                                <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Width="100%"   Text='<%# Bind("filesize_units") %>'/>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>--%>

                                <dx:LayoutItem FieldName="datesubmitted"  Caption="Date uploaded:" CaptionStyle-ForeColor="Gray">
                                    <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="lbl_datesubmitted" runat="server" Width="100%"   Text='<%# Bind("datesubmitted") %>'/>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="docstatusid"  Caption="Doc Status:" CaptionStyle-ForeColor="Gray">
                                    <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxComboBox ID="cbo_docstatusid" runat="server" Width="100%" DataSourceID="sql_docstatus"
                                                  Value='<%# Bind("docstatusid") %>'   Text='<%# Bind("docstatus") %>'  TextField="docstatus" ValueField="docstatusid"/>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="version"  Caption="Version:" CaptionStyle-ForeColor="Gray">
                                    <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel id="lbl_version" runat="server" Width="100%"  Text='<%# Bind("version") %>'/>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="uploadedby"  Caption="Uploaded by:" CaptionStyle-ForeColor="Gray">
                                    <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel id="lbl_uploadedby" runat="server" Width="100%"  Text='<%# Bind("uploadedby") %>'/>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
 
                                <dx:LayoutItem FieldName="docdesc"  Caption="Description:"  CaptionSettings-Location="Top" >
                                    <ParentContainerStyle Paddings-PaddingRight="2"></ParentContainerStyle>
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                          <%--  <dx:ASPxMemo ID="memo_docdesc" runat="server" Width="100%" Height="60px"  Text='<%# Bind("docdesc") %>'/>--%>
                                            <dx:ASPxHtmlEditor ID="htmledit_docdesc" runat="server"  Width="460px" Height="300px" ToolbarMode="Ribbon" >
                                                <Settings AllowHtmlView="False" ></Settings>
                                                <ClientSideEvents HtmlChanged="onHtmlEditorChanged" />
                                                
                                            </dx:ASPxHtmlEditor>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
                     
	  </EditItemTemplate>
        </asp:FormView>
                       <br />
                       <table id="tblLinks" runat="server">
                           <tr>
                               <td style="padding-left:10px">
                                   <dx:ASPxLabel ID="lblLinks" runat="server" Text="This document linked to:" ></dx:ASPxLabel>
                                   <dx:ASPxGridView ID="gvLinks" runat="server" DataSourceID="sql_linked_entities" AutoGenerateColumns="true">
                                       <Columns>
                                           <dx:GridViewDataColumn FieldName="entitytype" Caption="Entity"></dx:GridViewDataColumn>
                                           <dx:GridViewDataColumn FieldName="linked_to" Caption="Instance"></dx:GridViewDataColumn>
                                       </Columns>
                                   </dx:ASPxGridView>
                               </td>
                               <td style="padding-left:10px">
                                    <dx:ASPxButton ID="btnNewLink" runat="server" ClientInstanceName="btnNewLink" ClientVisible="true" 
                                        Text="Link Doc to New Entity" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e) { cbo_NewEntity.SetVisible(true); btnNewLink.SetVisible(false); btnCreateNew.SetVisible(true);}" />
                                    </dx:ASPxButton> 
                                   <dx:ASPxComboBox ID="cbo_NewEntity" runat="server" ClientInstanceName="cbo_NewEntity" ClientVisible="false"
                                       DataSourceID="sql_newentity" TextField="entityname" ValueField="entityid" NullText="Select new..."></dx:ASPxComboBox>
                                   <br /><br />
                                    <dx:ASPxButton ID="btnCreateNew" runat="server" ClientInstanceName="btnCreateNew" ClientVisible="false" 
                                        Text="Insert Link" AutoPostBack="true" OnClick="btnCreateNew_Click">
                                    </dx:ASPxButton> 
                                   
                               </td>
                           </tr>
                           <tr>
                               <td style="padding-left:10px; padding-top:40px">
                                   <dx:ASPxButton ID="btnDelete" ClientInstanceName="btnDelete" runat="server" Text="Delete this file" ForeColor="Red" AutoPostBack="false" Visible="false">
                                       <ClientSideEvents Click="ConfirmDelete" />
                                   </dx:ASPxButton>
                                   <dx:ASPxPanel ID="panelDel" ClientInstanceName="panelDel" runat="server" ClientVisible="false">
                                       <PanelCollection>
                                           <dx:PanelContent>
                                               <dx:ASPxLabel ID="lblConfirm" runat="server" Text="Are you sure you want to delete this file?"  ForeColor="Red"  ></dx:ASPxLabel>
                                               <br /><br />
                                               <table>
                                                   <tr>
                                                       <td>
                                                           <dx:ASPxButton ID="btnConfirmDelete" runat="server" Text="Yes, delete it" OnClick="btnConfirmDelete_Click" ForeColor="Red"   ></dx:ASPxButton>
                                                       </td>
                                                       <td style="padding-left:25px">
                                                           <dx:ASPxButton ID="btnCancel" runat="server" Text="No (Cancel)"  ForeColor="Black" AutoPostBack="false"  >
                                                               <ClientSideEvents Click="CancelDelete" />
                                                           </dx:ASPxButton>
                                                       </td>
                                                   </tr>
                                               </table>

                                           </dx:PanelContent>
                                       </PanelCollection>
                                   </dx:ASPxPanel>
                               </td>
                           </tr>
                       </table>
                       
                   </dx:SplitterContentControl>
               </ContentCollection> 

            </dx:SplitterPane>

            <dx:SplitterPane Name="ContentUrlPane" ScrollBars="Auto" ContentUrlIFrameName="contentUrlPane" ShowCollapseForwardButton="True" AutoHeight="True" >
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        
                        <dx:ASPxLabel ID="lblLoadError" runat="server" Text="<br/><br/><br/>File not found.<br/><br/><br/>" EncodeHtml="false" ForeColor="DarkRed" Font-Bold ="true" Visible="false"></dx:ASPxLabel>

                        <dx:ASPxRichEdit ID="dxricheditDoc" runat="server" Width="100%" Height="700px"  ActiveTabIndex="0" >
                            <ClientSideEvents CallbackError="OnExceptionOccurred" Init="OnInit" ></ClientSideEvents>
                        </dx:ASPxRichEdit>

                        <dx:ASPxSpreadsheet ID="dxSpreadsheet" runat="server" Width="100%" Height="700px"></dx:ASPxSpreadsheet>

                         <dx:ASPxImage ID="dxImage" runat="server"  ></dx:ASPxImage>

                        <dx:ASPxGridView ID="gvZip" runat="server" AutoGenerateColumns="false" Caption="Zip Archive Contents"
                             KeyFieldName="index">
                            <Columns>
                                <dx:GridViewDataColumn FieldName="index"></dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="type"></dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="name"></dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="uncompressed_size"></dx:GridViewDataColumn>

                                 <dx:GridViewCommandColumn ShowClearFilterButton="true" ShowApplyFilterButton="true"  />
                            </Columns>
                            <SettingsPager PageSize="20"></SettingsPager>
                               <SettingsSearchPanel Visible="true" />
                        </dx:ASPxGridView>

                    </dx:SplitterContentControl>

                </ContentCollection>
            </dx:SplitterPane>


        </Panes>
    </dx:ASPxSplitter>


    <asp:SqlDataSource ID="sql_docvers" runat="server" SelectCommandType="Text" UpdateCommandType="Text"  
		SelectCommand="select cast(docid as varchar) + ' (' + cast(docversid as varchar) + ')' docids, * from vwDocVers where docversid = @docversid"
        UpdateCommand="update tbldoc set doctypeid=@doctypeid, doctitle=@doctitle, docdesc=@docdesc, docstatusid=@docstatusid where docid in (select docid from tbldocvers where docversid=@docversid)"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
            <SelectParameters>
                <asp:QueryStringParameter Name="docversid" QueryStringField="dvID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="docversid" QueryStringField="dvID" />
                <asp:Parameter Name="doctypeid" Type="int32" />
                <asp:Parameter Name="doctitle" Type="string" />
                <asp:Parameter Name="docdesc" Type="string" />
                <asp:Parameter Name="docstatusid" Type="int32" />
            </UpdateParameters>
	</asp:SqlDataSource>

    
    <asp:SqlDataSource ID="sql_doctype" runat="server" SelectCommandType="Text"  
		SelectCommand="select doctype, doctypeid from tbldoctype_lkup where doctypeid in (select doctypeid from tblStudyDoc where studyid in  (select studyID from dbo.fnMySelectedStudies() ))"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
            <SelectParameters>
                <asp:QueryStringParameter Name="docversid" QueryStringField="dvID" />
            </SelectParameters>
	</asp:SqlDataSource>

    
    <asp:SqlDataSource ID="sql_docstatus" runat="server" SelectCommandType="Text"  
		SelectCommand="select docstatus, docstatusid from tbldocstatus_lkup"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

    
    <asp:SqlDataSource ID="sql_linked_entities" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from vwDocs_Linked_Entities where docversid=@docversid"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
            <SelectParameters>
                <asp:QueryStringParameter Name="docversid" QueryStringField="dvID" />
            </SelectParameters>
	</asp:SqlDataSource>

    
    <asp:SqlDataSource ID="sql_newentity" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from vwNewEntities where entitytypeid in  (select entitytypeid from vwdocvers where docversid=@docversid) order by entityname"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
            <SelectParameters>
                <asp:QueryStringParameter Name="docversid" QueryStringField="dvID" />
            </SelectParameters>
	</asp:SqlDataSource>


</asp:Content>