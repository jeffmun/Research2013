<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Uploaded.aspx.cs" Inherits="Data_Uploaded" 
    Debug="true" MasterPageFile="~/UWAC.master"  Title ="Uploaded Data" EnableEventValidation="true" %>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


    <script type="text/javascript">
        var keyValue;
        function OnMoreInfoClick(element, key) {
            callbackPanel.SetContentHtml("");
            popup.ShowAtElement(element);
            keyValue = key;
        }
        function popup_Shown(s, e) {
            callbackPanel.PerformCallback(keyValue);
        }
    </script>



    	<br/>
	<dx:ASPxLabel ID="lbl" runat="server" Text="Summary of Uploaded Data Files" Font-Bold="true" Font-Size="Medium" ForeColor="Gray"></dx:ASPxLabel>
	<br/><br/>


    <table>
        <tr>
			<td style="vertical-align:top; padding-left:10px">
				<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Processing Status" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
				
				<dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="doctypeid" DataSourceID="sql_UploadedSummary" Styles-Header-Wrap="True" >
					<Columns>
						<dx:GridViewDataColumn FieldName="doctype"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="nfiles" Caption="# Files Uploaded" Width="70"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="nfiles_C" Caption="# Files Completed Processing" Width="70"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="nfiles_A" Caption="# Files Not yet processed"  Width="80" CellStyle-ForeColor="Red" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="nfiles_B" Caption="# Files With ERRORS"  Width="80" CellStyle-ForeColor="Red" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
						<dx:GridViewDataHyperLinkColumn FieldName="link" Caption="Page Link for processing files" ></dx:GridViewDataHyperLinkColumn>
					</Columns>
                    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
				</dx:ASPxGridView>

                <br />
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="" Font-Bold="true" Font-Size="Medium" ForeColor="Blue"></dx:ASPxLabel>

			</td>
			<td style="vertical-align:top; padding-left:50px">
				<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Processing Errors" Font-Bold="true" Font-Size="Medium" ForeColor="DarkRed"></dx:ASPxLabel>
				<dx:ASPxGridView ID="gverrors" runat="server"   DataSourceID="sql_processingErrors" >
					<Columns>
						<dx:GridViewDataColumn FieldName="ErrorType" Width="250" CellStyle-ForeColor="DarkRed"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Details" Width="600"></dx:GridViewDataColumn>
					</Columns>
				</dx:ASPxGridView>

                <br /><br />
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Need to add more types of processing errors!!!" Font-Bold="true" Font-Size="Medium" ForeColor="DarkRed"></dx:ASPxLabel>

			</td>
		</tr>
</table>

    
    <br/>
    <br/>

    <dx:ASPxPageControl ID="pages" runat="server">
        <TabPages>
            <dx:TabPage Text="Uploaded not yet Processed">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:ASPxLabel ID="lblA" runat="server" Text="Uploaded not yet Processed" Font-Bold="true" Font-Size="Medium" ForeColor="Red"></dx:ASPxLabel>

                         <dx:ASPxGridView ID="gvA" runat="server"  SettingsBehavior-AllowGroup="true" 
                     OnCustomButtonInitialize="gv_CustomButtonInitialize"  OnCustomButtonCallback="gv_CustomButtonCallback"
                SettingsDataSecurity-AllowDelete="true" >
                <Columns>
                    <dx:GridViewDataColumn FieldName="processing_status" GroupIndex="0" ></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="doctype" GroupIndex="1" Width="150"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="docid" Width="45" Visible="false"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="docversid" Caption="docversid" Width="75" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn> 
<%--                    <dx:GridViewDataColumn FieldName="datauploadpk" Width="105" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn> --%>
                    <dx:GridViewDataHyperLinkColumn FieldName="FileName" UnboundType="String"  UnboundExpression="'?dvID='+[docversid]" Width="270px">  
                                <PropertiesHyperLinkEdit TextField="origfilename" DisplayFormatString="{0}" 
                                    NavigateUrlFormatString="~/Library/Doc.aspx{0}"></PropertiesHyperLinkEdit>  
                    </dx:GridViewDataHyperLinkColumn>
<%--                    <dx:GridViewDataColumn FieldName="origfilename" Width="180"></dx:GridViewDataColumn> --%>
                    <dx:GridViewDataColumn FieldName="fileext" Caption="File Ext" Width="70"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="filesize_units" Caption="File Size" Width="80"></dx:GridViewDataColumn> 


                    <dx:GridViewDataColumn FieldName="nrows_attempted" Caption="# rows<br/>attempted<br/>to save" Width="95"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="numerrors" Caption="# Errors<br/>during<br/>processing" Width="95"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="numwarnings" Caption="# Warnings<br/>during<br/>processing" Width="95"></dx:GridViewDataColumn> 

<%--                    <dx:GridViewDataTextColumn FieldName="processing_results" Caption="Processing Results" Width="300" PropertiesTextEdit-EncodeHtml="false"></dx:GridViewDataTextColumn> --%>
         <%--           <dx:GridViewDataColumn Caption="Processing Results" VisibleIndex="8" Width="15%">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">More Info...</a>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>--%>

                    <dx:GridViewDataColumn FieldName="rows_of_data_extracted" Caption="# data rows<br/>extracted" Width="95"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="rows_of_valid_data" Caption="# valid<br/>data rows" Width="85"></dx:GridViewDataColumn> 
                    <dx:GridViewDataTextColumn FieldName="uploaddate" Width="170" >
                        <PropertiesTextEdit DisplayFormatString="g"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn FieldName="time_since_upload" Caption="Time<br/>Since" Width="80"></dx:GridViewDataColumn>
                    <dx:GridViewCommandColumn >
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnDelA" Text="Delete"></dx:GridViewCommandColumnCustomButton>
                            <dx:GridViewCommandColumnCustomButton ID="btnZipA" Text="Zip"></dx:GridViewCommandColumnCustomButton>

                        </CustomButtons>
                    </dx:GridViewCommandColumn>

                </Columns>
                <GroupSummary>
                    <dx:ASPxSummaryItem FieldName="docid" SummaryType="Count" />
                </GroupSummary>
                <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowGroupPanel="true" ShowFooter="true" />
                <SettingsBehavior AutoExpandAllGroups="true"  />
                <SettingsPager Mode="ShowAllRecords" PageSizeItemSettings-ShowAllItem="true" ></SettingsPager> 
                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="docversid" SummaryType="Count" />
                    <dx:ASPxSummaryItem FieldName="rows_of_data_extracted" SummaryType="Sum"   ValueDisplayFormat="N0" />
                </TotalSummary>
            </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
               <dx:TabPage Text="Uploaded with ERRORS when Processed">
				<ContentCollection>
                    <dx:ContentControl>
        <dx:ASPxLabel ID="lblB" runat="server" Text="Uploaded with ERRORS when Processed" Font-Bold="true" ForeColor="Red" Font-Size="Medium"></dx:ASPxLabel>


            <dx:ASPxGridView ID="gvB" runat="server"  SettingsBehavior-AllowGroup="true" 
                     OnCustomButtonInitialize="gv_CustomButtonInitialize"  OnCustomButtonCallback="gv_CustomButtonCallback"
                SettingsDataSecurity-AllowDelete="true" >
                <Columns>
                    <dx:GridViewDataColumn FieldName="processing_status" GroupIndex="0" ></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="doctype" GroupIndex="1" Width="150"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="docid" Width="45" Visible="false"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="docversid" Caption="doc<br/>vers<br/>id" Width="65" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="datauploadpk" Caption="data<br/>upload<br/>pk" Width="65" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn> 
                    <dx:GridViewDataHyperLinkColumn FieldName="FileName" UnboundType="String"  UnboundExpression="'?dvID='+[docversid]" Width="270px">  
                                <PropertiesHyperLinkEdit TextField="origfilename" DisplayFormatString="{0}" 
                                    NavigateUrlFormatString="~/Library/Doc.aspx{0}"></PropertiesHyperLinkEdit>  
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataColumn FieldName="fileext" Caption="File<br/>Ext" Width="60"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="filesize_units" Caption="File Size" Width="75"></dx:GridViewDataColumn> 

                    <dx:GridViewDataColumn FieldName="nrows_attempted" Caption="# rows<br/>attempted<br/>to save" Width="75"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="numerrors" Caption="# Errors<br/>during<br/>processing" Width="75"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="numwarnings" Caption="# Warnings<br/>during<br/>processing" Width="75"></dx:GridViewDataColumn> 
                    <dx:GridViewDataTextColumn FieldName="processing_results" Caption="Processing Results" Width="400" PropertiesTextEdit-EncodeHtml="false" ></dx:GridViewDataTextColumn> 

         <%--           <dx:GridViewDataColumn Caption="Processing Results" VisibleIndex="8" Width="15%">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">More Info...</a>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>--%>

                    <dx:GridViewDataColumn FieldName="rows_of_data_extracted" Caption="# data<br/>rows<br/>extracted" Width="75"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="rows_of_valid_data" Caption="# valid<br/>data rows" Width="65"></dx:GridViewDataColumn> 
                    <dx:GridViewDataTextColumn FieldName="uploaddate" Width="140" >
                        <PropertiesTextEdit DisplayFormatString="g"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn FieldName="time_since_upload" Caption="Time<br/>Since" Width="80"></dx:GridViewDataColumn>
                    <dx:GridViewCommandColumn >
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnDelB" Text="Delete"></dx:GridViewCommandColumnCustomButton>
                            <dx:GridViewCommandColumnCustomButton ID="btnZipB" Text="Zip"></dx:GridViewCommandColumnCustomButton>

                        </CustomButtons>
                    </dx:GridViewCommandColumn>

                </Columns>
                <GroupSummary>
                    <dx:ASPxSummaryItem FieldName="docid" SummaryType="Count" />
                </GroupSummary>
                <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowGroupPanel="true" ShowFooter="true" />
                <SettingsBehavior AutoExpandAllGroups="true"  />
                <SettingsPager Mode="ShowAllRecords" PageSizeItemSettings-ShowAllItem="true" ></SettingsPager> 
                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="docversid" SummaryType="Count" />
                    <dx:ASPxSummaryItem FieldName="rows_of_data_extracted" SummaryType="Sum"   ValueDisplayFormat="N0" />
                </TotalSummary>
            </dx:ASPxGridView>
                        </dx:ContentControl>

                    				</ContentCollection>

            </dx:TabPage>
            <dx:TabPage Text="Uploaded and Processed">
				<ContentCollection>
                    <dx:ContentControl>
        <dx:ASPxLabel ID="lblC" runat="server" Text="Uploaded and Processed Data Files" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>

            <dx:ASPxGridView ID="gvC" runat="server"  SettingsBehavior-AllowGroup="true" 
                     OnCustomButtonInitialize="gv_CustomButtonInitialize"  OnCustomButtonCallback="gv_CustomButtonCallback"
                SettingsDataSecurity-AllowDelete="true" >
                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Command="ShowCustomizationWindow" />
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Columns>
                    <dx:GridViewDataColumn FieldName="processing_status" GroupIndex="0" ></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="doctype" GroupIndex="1" Width="150"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="docid" Width="45" Visible="false"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="docversid" Caption="doc<br/>vers<br/>id" Width="65" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn> 
<%--                    <dx:GridViewDataColumn FieldName="datauploadpk" Caption="data<br/>upload<br/>pk" Width="65" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn> --%>
                    <dx:GridViewDataHyperLinkColumn FieldName="FileName" UnboundType="String"  UnboundExpression="'?dvID='+[docversid]" Width="250px">  
                                <PropertiesHyperLinkEdit TextField="origfilename" DisplayFormatString="{0}" 
                                    NavigateUrlFormatString="~/Library/Doc.aspx{0}"></PropertiesHyperLinkEdit>  
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataColumn FieldName="fileext" Caption="File<br/>Ext" Width="55"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="filesize_units" Caption="File Size" Width="70"></dx:GridViewDataColumn> 

                    <dx:GridViewDataColumn FieldName="nrows_attempted" Caption="# rows<br/>attempted<br/>to save" Width="70"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="numerrors" Caption="# Errors<br/>during<br/>processing" Width="70"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="numwarnings" Caption="# Warnings<br/>during<br/>processing" Width="75"></dx:GridViewDataColumn> 
                    <dx:GridViewDataTextColumn FieldName="processing_results" Caption="Processing Results" Width="400" PropertiesTextEdit-EncodeHtml="false" ></dx:GridViewDataTextColumn> 

         <%--           <dx:GridViewDataColumn Caption="Processing Results" VisibleIndex="8" Width="15%">
                        <DataItemTemplate>
                            <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">More Info...</a>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>--%>

                    <dx:GridViewDataColumn FieldName="rows_of_data_extracted" Caption="# data<br/>rows<br/>extracted" Width="75"></dx:GridViewDataColumn> 
                    <dx:GridViewDataColumn FieldName="rows_of_valid_data" Caption="# valid<br/>data rows" Width="65"></dx:GridViewDataColumn> 
                    <dx:GridViewDataTextColumn FieldName="uploaddate" Width="140" >
                        <PropertiesTextEdit DisplayFormatString="g"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn FieldName="time_since_upload" Caption="Time<br/>Since" Width="80"></dx:GridViewDataColumn>
                    <dx:GridViewCommandColumn  Width="90">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnDelC" Text="Delete"></dx:GridViewCommandColumnCustomButton>
                            <dx:GridViewCommandColumnCustomButton ID="btnZipC" Text="Zip"></dx:GridViewCommandColumnCustomButton>

                        </CustomButtons>
                    </dx:GridViewCommandColumn>

                </Columns>
                <GroupSummary>
                    <dx:ASPxSummaryItem FieldName="docid" SummaryType="Count" />
                </GroupSummary>
                <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowGroupPanel="true" ShowFooter="true" />
                <SettingsBehavior AutoExpandAllGroups="true" AllowEllipsisInText="true" EnableCustomizationWindow="true"  />
                <SettingsPager Mode="ShowAllRecords" PageSizeItemSettings-ShowAllItem="true" ></SettingsPager> 
                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="docversid" SummaryType="Count" />
                    <dx:ASPxSummaryItem FieldName="rows_of_data_extracted" SummaryType="Sum"   ValueDisplayFormat="N0" />
                </TotalSummary>
            </dx:ASPxGridView>
                        </dx:ContentControl>

                    				</ContentCollection>

            </dx:TabPage>
         
        </TabPages>
    </dx:ASPxPageControl>
 


    <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="true"
        PopupHorizontalAlign="OutsideRight" HeaderText="Processing Results">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="callbackPanel" ClientInstanceName="callbackPanel" runat="server"
                    Width="600px" Height="400px" OnCallback="callbackPanel_Callback" RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table class="InfoTable">
                                <tr>
                                    <td>
                                        <asp:Literal ID="litText" runat="server" Text="" />
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="800" />
        <ClientSideEvents Shown="popup_Shown" />
    </dx:ASPxPopupControl>

    <br />
    <br />
    <dx:ASPxButton id="btnLogWebdocs" runat="server" Text="Log WebDocs" OnClick="btnLogWebdocs_Click"></dx:ASPxButton>


	<asp:SqlDataSource ID="sql_UploadedSummary" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from vwDocVers_ProcessingStatus_Summary order by link"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_processingErrors" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from vwProcessingErrors"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>	


    
    </asp:Content>