<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="ViewDoc3.aspx.cs" Inherits="Documents_ViewDoc3" Title="Doc Viewer3" 
 EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


<br />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

        <asp:Label ID="Label13" runat="server" Text="Document Viewer" Font-Underline="true" Font-Bold="true" Font-Size="Smaller" ForeColor="DarkBlue"></asp:Label>
        
        <asp:FormView ID="FormView2" runat="server" DataSourceID="Sql_NextDocVersID" Visible="False">
            <ItemTemplate>
                <asp:Label ID="NextDocVersIDLabel" runat="server" Text='<%# Eval("NextDocVersID") %>'>
                </asp:Label><br />
            </ItemTemplate>
        </asp:FormView>
                
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<br />
        <table >
       
            <tr>
        <%----------------Doc Info-------------%>      
                <td style="vertical-align:top">
                
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SQL_Doc_info"  Font-Names="Arial"   DataKeyNames="DocVersID" 
        OnModeChanging="FormView1_ModeChanging" OnDataBound="FormView1_DataBound" OnModeChanged="FormView1_ModeChanged" 
        OnItemInserting="FormView1_ItemInserting" OnItemUpdated="FormView1_ItemUpdated" OnItemInserted="FormView1_ItemInserted"
         OnItemDeleted="FormView1_ItemDeleted">
           
      
            <ItemTemplate>
                <%---------hidden labels---------%>
                <asp:Label ID="DocStatusIDLabel" runat="server" Text='<%# Eval("DocStatusID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                <asp:Label ID="DocTypeIDLabel" runat="server" Text='<%# Eval("DocTypeID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>

                <asp:Label ID="DocLinkLabel" runat="server" Text='<%# Eval("DocLink") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>

                <%---------------DocInfo--------------%>

                <table  border="0" bordercolor="#ffffff" cellpadding="1" cellspacing="0">
                    

                    <tr>
                        <td colspan="2" width="600px">
                            <asp:Label ID="Label3" runat="server" Text="Title:" ForeColor="Gray"  Font-Size="10pt"></asp:Label>
                            <asp:Label ID="DocTitleLabel" runat="server" Font-Bold="True" Text='<%# Bind("DocTitle") %>' Width = "400px" Font-Size="11pt"></asp:Label>
                            
                                                  
                        </td>
                    </tr>

                    <tr>
                        <td  colspan="2" style="vertical-align:top" width="600px">

                         <asp:Label ID="Label4" runat="server" Text="Version:" ForeColor="Gray"  ></asp:Label>
                            <asp:Label ID="VersionLabel" runat="server" Font-Bold="True" Text='<%# Eval("Version") %>' Font-Size="10pt" ></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                            <asp:Label ID="Label5" runat="server" Text="Type:" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="doctypeLabel" runat="server" Text='<%# Eval("doctype") %>' Font-Size="10pt" ></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label6" runat="server" Text="Status:" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="docstatusLabel" runat="server" Text='<%# Eval("docstatus") %>' Font-Size="10pt"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td  style="vertical-align:top" width="150px">
                            <asp:Label ID="Label9" runat="server" Text="Description:" ForeColor="Gray"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="docdesclabel" runat="server" Text='<%# Eval("DocDesc") %>' Width="400px" Font-Size="10pt" ></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td  style="vertical-align:top" width="150px">
                            <asp:Label ID="Label10" runat="server" Text="Changes in this version:" ForeColor="Gray"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="ChangesDescLabel" runat="server" Text='<%# Bind("ChangesDesc") %>' Width="400px" Font-Size="9pt" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td  colspan="2" style="vertical-align:top" width="600px">
                            <asp:Label ID="Label1" runat="server" Text="DocID:" ForeColor="Gray"></asp:Label>
                                <asp:Label ID="DocIDLabel" runat="server" Text='<%# Bind("DocID") %>' ForeColor="Gray" Font-Size="10pt" ></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Text="DocVersID:" ForeColor="Gray"></asp:Label>
                                <asp:Label ID="DocVersIDLabel" runat="server" Text='<%# Bind("DocVersID") %>' ForeColor="Gray" Font-Size="10pt" ></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label8" runat="server" Text="Uploaded by:" ForeColor="Gray" Font-Size="8pt"></asp:Label>
                            <asp:Label ID="UploadedByLabel" runat="server" Text='<%# Eval("UploadedBy") %>'  ForeColor="Gray" Font-Size="9pt"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="DateSubmittedLabel" runat="server" Text='<%# Eval("DateSubmitted", "{0:d}") %>' ForeColor="Gray" Font-Size="9pt"></asp:Label>
                        </td>
                    </tr>
                </table>

                <br />
        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit Doc Info"  Font-Size="8pt" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="InsertButton" runat="server" Text="Upload new version" CommandName="New"  Width="120px" Font-Size="8pt"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeleteButton" runat="server" Text="Delete this version" OnClick="Show_Confrim_Panel" ForeColor="Red" Width="120px" Font-Size="8pt"/>

                    <asp:UpdatePanel ID="UpdatePanel_ConfirmDelete" runat="server" Visible="false" UpdateMode="Conditional">
                    <ContentTemplate>
                    <br /><br />
                        <asp:Label ID="Label11" runat="server" width = "400px" ForeColor="DarkRed" Font-Size="X-Small" Text="Note that when a document is deleted it is not removed from the server, only the links to it are removed.  A record of the deletion is maintained.  If you wish to recover a deleted document, contact Jeff Munson."></asp:Label>
                        <br/>
                                <asp:Button ID="btnConfirmDelete" runat="server" ForeColor="Red"  CommandName="Delete" Text="Yes, I want to delete this document." />
                                <br /><br />
                                <asp:Button ID="btnCancelDelete" runat="server" OnClick="CancelDelete_Click" Text="No, I do not want to delete this document." />
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnConfirmDelete" />
                        <asp:PostBackTrigger ControlID="btnCancelDelete" />
                    </Triggers>
                    </asp:UpdatePanel>

            </ItemTemplate>  
            
         <EditItemTemplate>

                         <%---------------Edit Item Template:  DocInfo--------------%>

                <table  border="0" bordercolor="#ffffff" cellpadding="1" cellspacing="0">
                    

                    <tr>
                        <td colspan="2" width="600px">
                             <asp:Label ID="Label4" runat="server" Text="Version:" ForeColor="Gray"  Font-Size="10pt"></asp:Label>
                            <asp:Label ID="VersionTextBox" runat="server" Font-Bold="True" Text='<%# Eval("Version") %>' Font-Size="11pt" ></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label3" runat="server" Text="Title:" ForeColor="Gray"  Font-Size="10pt"></asp:Label>
                            <asp:TextBox ID="DocTitleTextBox" runat="server" Font-Bold="True" Text='<%# Bind("DocTitle") %>' ForeColor="DarkGreen"  Width = "500px" Font-Size="11pt"></asp:TextBox>
                      
                        </td>
                    </tr>

                    <tr>
                        <td  colspan="2" style="vertical-align:top" width="600px">
                            <asp:Label ID="Label5" runat="server" Text="Type:" ForeColor="Gray"></asp:Label>
                            <asp:DropDownList ID="DocTypeID_DropDown" runat="server" DataSourceID="Sql_DocType" DataTextField="DocType" DataValueField="DocTypeID" ForeColor="#006600"     />
                            <%--<asp:Label ID="doctypeTextBox" runat="server" Text='<%# Eval("doctype") %>' Font-Size="10pt" ></asp:Label>--%>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label6" runat="server" Text="Status:" ForeColor="Gray"></asp:Label>
                            <asp:DropDownList ID="DocStatusID_DropDown" runat="server" DataSourceID="Sql_DocStatus" DataTextField="DocStatus" DataValueField="DocStatusID" ForeColor="#006600"     />
                            <%--<asp:Label ID="docstatusTextBox" runat="server" Text='<%# Eval("docstatus") %>' Font-Size="10pt"></asp:Label>--%>
                        </td>
                    </tr>

                    <tr>
                        <td  style="vertical-align:top" width="150px">
                            <asp:Label ID="Label9" runat="server" Text="Description:" ForeColor="Gray"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="DocDescTextBox" runat="server" Text='<%# Bind("DocDesc") %>' TextMode="MultiLine" Width="400px" ForeColor="DarkGreen" Height="80px" Font-Size="9pt" ></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td  style="vertical-align:top" width="150px">
                            <asp:Label ID="Label10" runat="server" Text="Changes in this version:" ForeColor="Gray"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ChangesDescTextBox" runat="server" Text='<%# Bind("ChangesDesc") %>' TextMode="MultiLine" ForeColor="DarkGreen" Height="80px" Width="400px" Font-Size="9pt" ></asp:TextBox>
                        </td>
                    </tr>
                                        <tr>
                        <td  colspan="2" style="vertical-align:top" width="600px">
                            <asp:Label ID="Label1" runat="server" Text="DocID:" ForeColor="Gray"></asp:Label>
                                <asp:Label ID="DocIDLabel_Edit" runat="server" Text='<%# Eval("DocID") %>' ForeColor="Gray" Font-Size="10pt" ></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Text="DocVersID:" ForeColor="Gray"></asp:Label>
                                <asp:Label ID="DocVersIDLabel_Edit" runat="server" Text='<%# Eval("DocVersID") %>' ForeColor="Gray" Font-Size="10pt" ></asp:Label>
                        </td>
                    </tr>

                </table>
                <br /><br />
                                            &nbsp &nbsp 
                            <asp:Button ID="EditButton" runat="server"  CommandName="Update" Text="Save" Font-Size="8pt"  OnClick="EditDocumentInfo_Submit" /><span style="font-size: 10pt">
                            &nbsp &nbsp &nbsp &nbsp
                            <asp:Button ID="CancelEditButton" runat="server" CommandName="Cancel" Text="Cancel" Font-Size="8pt"  OnClick="EditDocumentInfo_Cancel"  /><span style="font-size: 10pt">
                <br /><br />
                <span style="font-size: 10pt; font-weight: bold; color: #006600;">If you wish to replace this file, select a new one below.</span>
                <br />
                <asp:FileUpload id="FileUpload2" runat="server" Width="460px" ForeColor="#006600" Enabled=true ></asp:FileUpload>
                <br /><br />
                <asp:Label id="FileUploadLabel2"  runat="server"  Visible=false ForeColor="#006600" Width="230px" ></asp:Label>
                <asp:Label ID="FileExtLabel2" runat="server" Visible=false ForeColor="#006600" Width="187px"></asp:Label><br />

            </EditItemTemplate>
            
            <InsertItemTemplate>
                
              <%-------------- Insert Item Template ---------------%>  
             <table  border="0" bordercolor="#ffffff" cellpadding="1" cellspacing="0" width="600px">
                    <tr>
                        <td width="600px">
                            <asp:Label ID="Label1" runat="server" Text="DocID:" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="DocIDTextBox_Insert" runat="server" Text='<%# Eval("DocID") %>' ForeColor="Gray" Font-Size="10pt" Width="70px"></asp:Label>
                            <asp:Label ID="DocStatusIDTextBox_Insert" runat="server" Text='<%# Eval("DocStatusID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                            <asp:Label ID="DocTypeIDTextBox_Insert" runat="server" Text='<%# Eval("DocTypeID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                            <asp:Label ID="FileExtTextBox_Insert" runat="server" Text='<%# Eval("FileExt") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                        
                        </td>           
                        </tr>                    

                    <tr>
                        <td  >
                            <asp:Label ID="Label3" runat="server" Text="Title:" ForeColor="Gray"  Font-Size="10pt"></asp:Label>
                            <asp:Label ID="DocTitleLabel_Insert" runat="server" Font-Bold="True" Text='<%# Eval("doctitle") %>' ForeColor="Gray"  Width = "500px" Font-Size="11pt"></asp:Label>
                      
                        </td>
                    </tr>

                    <tr>
                        <td   style="vertical-align:top" >
                            <asp:Label ID="Label5" runat="server" Text="Type:" ForeColor="Gray"></asp:Label>
                            <%--<asp:DropDownList ID="DocTypeID_DropDown" runat="server" DataSourceID="Sql_DocType" DataTextField="DocType" DataValueField="DocTypeID" ForeColor="#006600"     />--%>
                            <asp:Label ID="DocTypeLabel_Insert" runat="server" Text='<%# Eval("doctype") %>' ForeColor="Gray" Font-Size="10pt" ></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label6" runat="server" Text="Status:" ForeColor="Gray"></asp:Label>
                            <%--<asp:DropDownList ID="DocStatusID_DropDown" runat="server" DataSourceID="Sql_DocStatus" DataTextField="DocStatus" DataValueField="DocStatusID" ForeColor="#006600"     />--%>
                            <asp:Label ID="DocStatusLabel_Insert" runat="server" Text='<%# Eval("docstatus") %>' ForeColor="Gray" Font-Size="10pt"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td  style="vertical-align:top" >
                            <asp:Label ID="Label9" runat="server" Text="Description:" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="DocDescLabel_Insert" runat="server" Text="" Width="400px" ForeColor="Gray"  Font-Size="9pt" ></asp:Label>
                        </td>

                    </tr>
<%--                    <tr>
                        <td  >
                             <asp:Label ID="Label11" runat="server" Text="Version:" ForeColor="Gray"  Font-Size="10pt"></asp:Label>
                            <asp:TextBox ID="VersionTextBox_Insert" runat="server" Font-Bold="True" Text='<%# Bind("Version") %>' Width="80px" Font-Size="11pt" ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="VersionTextBox_Insert" 
                                runat="server" ErrorMessage="Enter a version." Font-Size="8pt"></asp:RequiredFieldValidator>

                        </td>
                    </tr>--%>
                    <tr>
                        <td  style="vertical-align:top" width="150px">
                            <asp:Label ID="Label10" runat="server" Text="Changes in this version:" ForeColor="Gray"></asp:Label>
                            <asp:TextBox ID="ChangesDescTextBox_Insert" runat="server" Text='<%# Bind("ChangesDesc") %>' TextMode="MultiLine" ForeColor="DarkGreen" Height="80px" Width="400px" Font-Size="9pt" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ChangesDescTextBox_Insert" 
                                runat="server" ErrorMessage="Enter what changes exist in this version." Font-Size="8pt"></asp:RequiredFieldValidator><br />                                

                        </td>
                    </tr>


                    <tr>
                        <td  style="vertical-align:top" >
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"  OnClick="UploadButton_Click" Text="Upload New Version" Font-Size="8pt"></asp:Button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Font-Size="8pt"> </asp:Button>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <br /><br />
                            <asp:Label ID="Label12" runat="server" Text="Select a file to upload:"  Font-Bold="true"  ForeColor="#006600"></asp:Label>
                            <br />
                            <asp:FileUpload id="FileUpload1" runat="server" Width="373px" ForeColor="#006600" Enabled="true"  > </asp:FileUpload><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="FileUpload1" 
                                runat="server" ErrorMessage="A file must be selected." Font-Size="8pt"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>

                </table>
        

                <br />

            </InsertItemTemplate>

     
            <EmptyDataTemplate>
                <span style="color: #cc0033">
                No Document Version with this ID. </span>
            </EmptyDataTemplate>
            
        </asp:FormView>

                </td>

        <%---------------- Other Versions ---------------%>
        <td>
                <table>
                <tr>
                    <td></td>
                    <td style="vertical-align:top" style="width: 400px">
                        &nbsp;<span style="font-size: 9pt;">Other versions of this document: &nbsp;</span><span style="font-size: 8pt; color: Blue;">(Click version # to view)</span>
                        <br />
                                                                                                                                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DocVersID"
            DataSourceID="Sql_Doc_Info_OtherVersions" Font-Names="Arial" Font-Size="9pt" HorizontalAlign="Left" >
            <Columns>
                <asp:HyperLinkField DataTextField="Version" DataNavigateUrlFields="ViewLink"  HeaderText="Version" SortExpression="Version" ControlStyle-ForeColor=Blue >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="ChangesDesc" HeaderText="Changes in this version" SortExpression="ChangesDesc" >
                    <ControlStyle Width="40px" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="DateSubmitted" HeaderText="DateSubmitted" SortExpression="DateSubmitted" DataFormatString="{0:M/dd/yy}" HtmlEncode="False" />
                
            </Columns>
            <EmptyDataTemplate>
                <span style="color: #cc0033">No other versions of this document have been entered into the system.</span>
            </EmptyDataTemplate>
        </asp:GridView>
                    </td>
                </tr>
                </table>
        </td>

        <%---------------- Linked to entities ---------------%>
        <td>
        
            <table>
            <tr>
                <td style="vertical-align:top">
            
                    <asp:Label ID="Label7" runat="server" Text="This document is linked to the following objects:" Font-Size="9pt"></asp:Label>
                    <br />
                    <asp:GridView ID="GridView2" runat="server" 
                        DataSourceID="Sql_EntityInfo" Font-Names="Arial" Font-Size="9pt" HeaderStyle-HorizontalAlign="Left" 
                         Width="342px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AutoGenerateColumns="false" >
                        <EmptyDataTemplate>
                            <span style="color: #cc0033">Document not linked to other objects in the database.</span>
                        </EmptyDataTemplate>
                        <HeaderStyle Font-Bold="False" HorizontalAlign="Left" />
                        <Columns>
                        <asp:BoundField DataField="EntityType" HeaderText="EntityType" />
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="EntityName" HeaderText="EntityName" />
                        <asp:TemplateField>
                            <HeaderTemplate >Link</HeaderTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "linklabel") %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "link") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
        </td>

            </tr>
        </table>
        
<%--                    
                    <span style="font-size: 10pt">
                    <span style="color: #006600">
                    </span>
                </span>--%>
        

<br />


    
    <asp:Button ID="DisplayDoc_Button" runat="server" Font-Size="9pt"  
        ForeColor="Black" OnClick="DisplayDoc_Button_Click" Text="Display Document" Visible="false" />

    <asp:Button ID="SaveLocal_Button" runat="server" 
        ForeColor="Black" OnClick="SaveLocal_Button_Click"  Text="Save Local Copy" Font-Size="9pt" Visible="false"  />
        <br />
        <asp:Label ID="Label_Error" runat="server" ForeColor="DarkRed"></asp:Label>&nbsp;<br />

        <asp:Label ID="jmInfo" runat="server" ForeColor="Red" Text=""></asp:Label>&nbsp;<br />
        <asp:Label ID="jmError" runat="server" ForeColor="Red" Text=""></asp:Label>&nbsp;<br />

        <asp:Hyperlink ID="linkDownloadFile" runat="server" Visible="false" Font-Size="Medium" Text="Download File"></asp:Hyperlink>
        
        <br />
        
        <asp:PlaceHolder ID="theFrameHolder" runat="server" /> 
        <br />



<%--------------------- SQL Data Sources---------------------%>
            
        <asp:SqlDataSource 
            ID="SQL_Doc_info" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetDocVersByDocVersID" SelectCommandType="StoredProcedure"  
            UpdateCommand="spDocVers_Update" UpdateCommandType="StoredProcedure"
            InsertCommand="spDocVers_Insert" InsertCommandType="StoredProcedure"
            DeleteCommand="spDocVers_Delete" DeleteCommandType="StoredProcedure"
             ProviderName="<%$ ConnectionStrings:TRACKING_CONN_STRING.ProviderName %>" 
             
             OnInserting="SQL_Doc_info_Inserting"
             OnUpdating="SQL_Doc_info_Updating" 
             OnUpdated="SQL_Doc_info_Updated">
            
            <SelectParameters> 
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type="Int32" />
            </SelectParameters>
            
            <DeleteParameters>
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type="Int32" />
            </DeleteParameters>
            
               <UpdateParameters>
                    <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type=Int32 />
                    <asp:FormParameter Name="DocTitle" FormField="DocTitleTextBox" Type=String />
                    <asp:FormParameter Name="DocDesc" FormField="DocDescTextBox" Type=String/>
                    <asp:FormParameter Name="ChangesDesc" FormField="ChangesDescTextBox" Type=String/>
                    <asp:FormParameter Name="DocTypeID" FormField="DocTypeID_DropDown" Type=int32 />
                    <asp:FormParameter Name="DocStatusID" FormField="DocStatusID_DropDown" Type=int32 />
                    <asp:ControlParameter Name="DocFileName" ControlID="FormView1$FileUploadLabel2" PropertyName="Text"  Type=String/>
                    <asp:ControlParameter Name="FileExt" ControlID="FormView1$FileExtLabel2" PropertyName="Text"  Type=String/>
                  <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
               </UpdateParameters>
               
            <InsertParameters>
                <asp:ControlParameter Name="DocID" ControlID="FormView1$DocIDTextBox_Insert" PropertyName="Text"  Type=String/>
                <asp:FormParameter Name="ChangesDesc" FormField="FormView1$ChangesDescTextBox_Insert" Type=String/>
                <asp:ControlParameter Name="FileExt" ControlID="FormView1$FileExtTextBox_Insert" PropertyName="Text"  Type=String/>
                <asp:ControlParameter Name="OrigFileName" ControlID="FormView1$FileUpload1" PropertyName="FileName" />
               
            </InsertParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Sql_Doc_Info_OtherVersions" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetDocVersByDocVersID_others" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Sql_EntityInfo" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetEntityInfo_from_DocVersID" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" DefaultValue="2" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        

        <asp:SqlDataSource ID="Sql_NextDocVersID" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="select ident_current('tbldocvers') + 1 as NextDocVersID" SelectCommandType="Text">
        </asp:SqlDataSource>
        
        
        <asp:SqlDataSource ID="Sql_DocStatus" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="Select * from tblDocStatus_lkup" SelectCommandType="Text">    
        </asp:SqlDataSource>

        
        <asp:SqlDataSource ID="Sql_DocType" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="Select DocTypeID, DocType from tblDocType_lkup" SelectCommandType="Text">    
        </asp:SqlDataSource>

        

        
</asp:Content>

