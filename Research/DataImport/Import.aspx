<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Import.aspx.cs" Inherits="DataImport_Import" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>


<dx:ASPxUploadControl runat="server" ID="DocumentsUploadControl" ClientInstanceName="DocumentsUploadControl" Width="100%"
                                                AutoStartUpload="true" ShowProgressPanel="True" ShowTextBox="false" BrowseButton-Text="Add documents" FileUploadMode="OnPageLoad"
                                                OnFileUploadComplete="DocumentsUploadControl_FileUploadComplete">
                                                <AdvancedModeSettings EnableMultiSelect="false" EnableDragAndDrop="true" ExternalDropZoneID="dropZone" />
                                                <ValidationSettings
                                                    AllowedFileExtensions=".csv, .xls, .xlsx"
                                                    MaxFileSize="103809024">
                                                </ValidationSettings>
                                                <ClientSideEvents
                                                    FileUploadComplete="onFileUploadComplete"
                                                    FilesUploadComplete="onFilesUploadComplete"
                                                    FilesUploadStart="onFileUploadStart" />
                                            </dx:ASPxUploadControl>
