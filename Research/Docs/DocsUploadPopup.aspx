<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DocsUploadPopup.aspx.cs" Inherits="Docs_DocsUploadPopup"
   Debug="true" Title ="Docs Upload" EnableEventValidation="true" MasterPageFile="~/UWAC.master"  %>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
     <script type="text/javascript">
        var uploadInProgress = false,
            submitInitiated = false,
            uploadErrorOccurred = false;
            uploadedFiles = [];
        function onFileUploadComplete(s, e) {
            var callbackData = e.callbackData.split("|"),
                uploadedFileName = callbackData[0],
                isSubmissionExpired = callbackData[1] === "True";
            uploadedFiles.push(uploadedFileName);
            if(e.errorText.length > 0 || !e.isValid)
                uploadErrorOccurred = true;
            if(isSubmissionExpired && UploadedFilesTokenBox.GetText().length > 0) {
                var removedAfterTimeoutFiles = UploadedFilesTokenBox.GetTokenCollection().join("\n");
                alert("The following files have been removed from the server due to the defined 5 minute timeout: \n\n" + removedAfterTimeoutFiles);
                UploadedFilesTokenBox.ClearTokenCollection();
            }
        }
        function onFileUploadStart(s, e) {
            uploadInProgress = true;
            uploadErrorOccurred = false;
            UploadedFilesTokenBox.SetIsValid(true);
        }
        function onFilesUploadComplete(s, e) {
            uploadInProgress = false;
            for(var i = 0; i < uploadedFiles.length; i++)
                UploadedFilesTokenBox.AddToken(uploadedFiles[i]);
            updateTokenBoxVisibility();
            uploadedFiles = [];
            if(submitInitiated) {
                SubmitButton.SetEnabled(true);
                SubmitButton.DoClick();
            }
        }
        function onSubmitButtonInit(s, e) {
            s.SetEnabled(true);
        }
        function onSubmitButtonClick(s, e) {
            ASPxClientEdit.ValidateGroup();
            if(!formIsValid())
                e.processOnServer = false;
            else if(uploadInProgress) {
                s.SetEnabled(false);
                submitInitiated = true;
                e.processOnServer = false;
            }
        }
        function onTokenBoxValidation(s, e) {
            var isValid = DocumentsUploadControl.GetText().length > 0 || UploadedFilesTokenBox.GetText().length > 0;
            e.isValid = isValid;
            if(!isValid) {
                e.errorText = "No files have been uploaded. Upload at least one file.";
            }
        }
        function onTokenBoxValueChanged(s, e) {
            updateTokenBoxVisibility();
        }
        function updateTokenBoxVisibility() {
            var isTokenBoxVisible = UploadedFilesTokenBox.GetTokenCollection().length > 0;
            UploadedFilesTokenBox.SetVisible(isTokenBoxVisible);
        }
        function formIsValid() {
            return !ValidationSummary.IsVisible() && cboDataUploadType.GetIsValid() && UploadedFilesTokenBox.GetIsValid() && !uploadErrorOccurred;
        }
     </script>

</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

 <asp:Label ID="lbl1" runat="server" Text="Upload Documents" Font-Size="Medium" Font-Bold="true"></asp:Label>
    <br /><br />
 <dx:ASPxHiddenField runat="server" ID="HiddenField" ClientInstanceName="HiddenField" />
    <dx:ASPxFormLayout ID="FormLayout" runat="server" Width="100%" ColCount="2" UseDefaultPaddings="false">
        <Items>
            <dx:LayoutGroup ShowCaption="False" GroupBoxDecoration="None" Width="35%" UseDefaultPaddings="false" >
                <Items>
                    <dx:LayoutItem Caption="Document Type" CaptionSettings-Location="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>


                                            <dx:ASPxComboBox runat="server" ID="cboDataUploadType" DataSourceID="sql_doctype" ClientInstanceName="cboDataUploadType" Width="100%" 
                                                 TextField="doctype" ValueField="doctypeid" OnSelectedIndexChanged="cboDataUploadType_SelectedIndexChanged" AutoPostBack="true">
                                            </dx:ASPxComboBox>
                                            <br />
                                            <dx:ASPxButton ID="btnSubmitMissing" runat="server" Text="Submit as missing document" OnClick="btnSubmitMissing_Click"></dx:ASPxButton>

                                            <dx:ASPxLabel ID="lblMissingLogged" runat="server" Text="Missing document logged." Visible="false"></dx:ASPxLabel>


                                <br /><br />
                                <dx:ASPxLabel ID="lblOR" runat="server" Text="OR" Font-Size="Large"></dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutGroup Caption="Files">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <div id="dropZone">
                                            <dx:ASPxUploadControl runat="server" ID="DocumentsUploadControl" ClientInstanceName="DocumentsUploadControl" Width="100%"
                                                AutoStartUpload="true" ShowProgressPanel="True" ShowTextBox="false" BrowseButton-Text="Add documents" FileUploadMode="OnPageLoad"
                                                OnFileUploadComplete="DocumentsUploadControl_FileUploadComplete">
                                                <AdvancedModeSettings EnableMultiSelect="true" EnableDragAndDrop="true" ExternalDropZoneID="dropZone" />
                                                <ValidationSettings
                                                    AllowedFileExtensions=".none"
                                                    MaxFileSize="1500000000">
                                                </ValidationSettings>
                                                <ClientSideEvents
                                                    FileUploadComplete="onFileUploadComplete"
                                                    FilesUploadComplete="onFilesUploadComplete"
                                                    FilesUploadStart="onFileUploadStart" />
                                            </dx:ASPxUploadControl>
                                            <br />
                                            <dx:ASPxTokenBox runat="server" Width="100%" ID="UploadedFilesTokenBox" ClientInstanceName="UploadedFilesTokenBox"
                                                NullText="Select the documents to submit" AllowCustomTokens="false" ClientVisible="false">
                                                <ClientSideEvents Init="updateTokenBoxVisibility" ValueChanged="onTokenBoxValueChanged" Validation="onTokenBoxValidation" />
                                                <ValidationSettings EnableCustomValidation="true" />
                                            </dx:ASPxTokenBox>
                                            <br />
                                            <p class="Note">
                                                <dx:ASPxLabel ID="AllowedFileExtensionsLabel" runat="server" Text="Select a document type." Font-Size="8pt" />
                                                <br />
                                                <dx:ASPxLabel ID="MaxFileSizeLabel" runat="server" Text="Maximum file size: 1.5 GB." Font-Size="8pt" />
                                            </p>
                                            <dx:ASPxValidationSummary runat="server" ID="ValidationSummary" ClientInstanceName="ValidationSummary"
                                                RenderMode="Table" Width="250px" ShowErrorAsLink="true" />
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxButton runat="server" ID="SubmitButton" ClientInstanceName="SubmitButton" Text="Submit documents" AutoPostBack="False"
                                    OnClick="SubmitButton_Click" ValidateInvisibleEditors="true" ClientEnabled="false">
                                    <ClientSideEvents Init="onSubmitButtonInit" Click="onSubmitButtonClick" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem Height="5" />
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup GroupBoxDecoration="None" ShowCaption="False" Name="ResultGroup" Visible="false" Width="60%" UseDefaultPaddings="false">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxRoundPanel ID="RoundPanel" runat="server" HeaderText="Uploaded files" Width="100%">
                                    <PanelCollection>
                                        <dx:PanelContent>
                                            <b>Description:</b>
                                            <dx:ASPxLabel runat="server" ID="DescriptionLabel" />
                                            <br />
                                            <br />
                                            <dx:ASPxListBox ID="SubmittedFilesListBox" runat="server" Width="100%" Height="150px" Visible="false">
                                                <ItemStyle CssClass="ResultFileName" />
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="OriginalFileName" Width="15%" />
                                                    <dx:ListBoxColumn FieldName="FileSize" Width="8%"/>
                                                    <dx:ListBoxColumn FieldName="SummaryInfo" Width="32%"/>
                                                </Columns>
                                            </dx:ASPxListBox>

                                            <dx:ASPxGridView ID="gvResults" runat="server" Width="100%">
                                                <Columns>
                                                    <dx:GridViewDataColumn  FieldName="OriginalFileName" Width="15%" />
                                                    <dx:GridViewDataColumn  FieldName="FileSize" Width="8%"/>
                                                    <dx:GridViewDataTextColumn  FieldName="SummaryInfo" Width="32%">
                                                        <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit> 
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsPager PageSize="100"></SettingsPager>
                                            </dx:ASPxGridView>

                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxRoundPanel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
    </dx:ASPxFormLayout>



    	<asp:SqlDataSource ID="sql_doctype" runat="server" SelectCommandType="Text" 
            SelectCommand="exec spAvailableDoctypesByEntity @entitytypeid" 
            ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
			<SelectParameters>
				<asp:QueryStringParameter QueryStringField="entitytypeid" Name="entitytypeid" DbType="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>


    
    	<asp:SqlDataSource ID="sql_doctype_data" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommandType="text"
		SelectCommand="select doctypeid,  doctype_desc  from tbldoctype_lkup  ">
	 </asp:SqlDataSource> 

</asp:Content>
