<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="code6.aspx.cs" Inherits="Tracking_code6" %>


<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="LocalHead" ContentPlaceHolderID="headContent" runat="server">
    
    <script type="text/javascript">
        var fileNumber = 0;
        var fileName = "";
        var startDate = null;
        function UploadControl_OnFileUploadStart() {
            startDate = new Date();
            ClearProgressInfo();
            pcProgress.Show();
        }
        function UploadControl_OnFilesUploadComplete(e) {
            pcProgress.Hide();
            if (e.errorText)
                ShowMessage(e.errorText);
            else {
                var info = e.callbackData;
                var hassuccess = info.indexOf("Success");

                if (hassuccess >= 0) {

                    ShowMessage("File uploading: " + e.callbackData);
                }
            }
        }
        function ShowMessage(message) {
            window.setTimeout(function() { window.alert(message); }, 0);
        }
        // Progress Dialog
        function UploadControl_OnUploadingProgressChanged(args) {
            if(!pcProgress.IsVisible())
                return;
            if(args.currentFileName != fileName) {
                fileName = args.currentFileName;
                fileNumber++;
            }
            SetCurrentFileUploadingProgress(args.currentFileName, args.currentFileUploadedContentLength, args.currentFileContentLength);
            progress1.SetPosition(args.currentFileProgress);
            SetTotalUploadingProgress(fileNumber, args.fileCount, args.uploadedContentLength, args.totalContentLength);
            progress2.SetPosition(args.progress);
            UpdateProgressStatus(args.uploadedContentLength, args.totalContentLength);
        }
        function SetCurrentFileUploadingProgress(fileName, uploadedLength, fileLength) {
            lblFileName.SetText("Current File Progress: " + fileName);
            lblFileName.GetMainElement().title = fileName;
            lblCurrentUploadedFileLength.SetText( GetContentLengthString(uploadedLength) + " / " + GetContentLengthString(fileLength) );
        }
        function SetTotalUploadingProgress(number, count, uploadedLength, totalLength) {
            lblUploadedFiles.SetText("Total Progress: " + number + ' of ' + count + " file(s)");
            lblUploadedFileLength.SetText(GetContentLengthString(uploadedLength) + " / " + GetContentLengthString(totalLength));
        }
        function ClearProgressInfo() {
            SetCurrentFileUploadingProgress("", 0, 0);
            progress1.SetPosition(0);
            SetTotalUploadingProgress(0, 0, 0, 0);
            progress2.SetPosition(0);
            lblProgressStatus.SetText('Elapsed time: 00:00:00 &ensp; Estimated time: 00:00:00 &ensp; Speed: ' + GetContentLengthString(0) + '/s');
            fileNumber = 0;
            fileName = "";
        }
        function UpdateProgressStatus(uploadedLength, totalLength) {
            var currentDate = new Date();
            var elapsedDateMilliseconds = currentDate - startDate;
            var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
            var elapsedDate = new Date(elapsedDateMilliseconds);
            var elapsedTime = GetTimeString(elapsedDate);
            var estimatedMilliseconds = Math.floor((totalLength - uploadedLength) / speed) * 1000;
            var estimatedDate = new Date(estimatedMilliseconds);
            var estimatedTime = GetTimeString(estimatedDate);
            var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
            lblProgressStatus.SetText('Elapsed time: ' + elapsedTime + ' &ensp; Estimated time: ' + estimatedTime + ' &ensp; Speed: ' + GetContentLengthString(speed) + '/s');
        }
        function GetContentLengthString(contentLength) {
            var sizeDimensions = [ 'bytes', 'KB', 'MB', 'GB', 'TB' ];
            var index = 0;
            var length = contentLength;
            var postfix = sizeDimensions[index];
            while(length > 1024) {
                length = length / 1024;
                postfix = sizeDimensions[++index];
            }
            var numberRegExpPattern = /[-+]?[0-9]*(?:\.|\,)[0-9]{0,2}|[0-9]{0,2}/;
            var results = numberRegExpPattern.exec(length);
            length = results ? results[0] : Math.floor(length);
            return length.toString() + ' ' + postfix;
        }
        function GetTimeString(date) {
            var timeRegExpPattern = /\d{1,2}:\d{1,2}:\d{1,2}/;
            var results = timeRegExpPattern.exec(date.toUTCString());
            return results ? results[0] : "00:00:00";
        }



         function ToggleGrid2(s) {
             var isvisible = gridFailed.GetVisible();
             if (isvisible) {
                 gridFailed.SetClientVisible(false);
                 btnToggleGrid2.SetText("Show Failed OtherID's");
             } else {
                 gridFailed.SetClientVisible(true);
                 btnToggleGrid2.SetText("Hide Failed OtherID's");
             }
        }

    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <script type="text/javascript">
        function grid_SelectionChanged(s,e) {
            s.GetSelectedFieldValues("studyname",GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
            selList.BeginUpdate();
            try {
                selList.ClearItems();
                for(var i=0;i<values.length;i++) {
                    selList.AddItem(values[i]);
                }
            } finally {
                selList.EndUpdate();
            }
            document.getElementById("selCount").innerHTML=gridStudy.GetSelectedRowCount();
        }


        var fieldSeparator = "|";
        function FileUploadStart() {
            document.getElementById("uploadedListFiles").innerHTML = "";
        }
        function FileUploaded(s, e) {
            if(e.isValid) {
                var linkFile = document.createElement("a");
                var indexSeparator = e.callbackData.indexOf(fieldSeparator);
                var fileName = e.callbackData.substring(0, indexSeparator);
                var pictureUrl = e.callbackData.substring(indexSeparator + fieldSeparator.length);
                var date = new Date();
                var imgSrc = "UploadImages/" + pictureUrl + "?dx=" + date.getTime();
                linkFile.innerHTML = fileName;
                linkFile.setAttribute("href", imgSrc);
                linkFile.setAttribute("target", "_blank");
                var container = document.getElementById("uploadedListFiles");
                container.appendChild(linkFile);
                container.appendChild(document.createElement("br"));
            }
        }
    </script>



    <br />
    <table>
        <tr>
            <td style="vertical-align: top">

   <dx:ASPxUploadControl ID="UploadControl" runat="server" ClientInstanceName="UploadControl" Width="380" Height="50"
        NullText="Select file to upload otherID's..." UploadMode="Advanced" AutoStartUpload="True"
        OnFilesUploadComplete="UploadControl_FilesUploadComplete"  AllowedFileExtensions=".xlsx">
        <AdvancedModeSettings EnableMultiSelect="True" EnableDragAndDrop="True" />
        <ValidationSettings MaxFileSize="10000000" ShowErrors="false"></ValidationSettings>
        <ClientSideEvents FilesUploadStart="function(s, e) { UploadControl_OnFileUploadStart(); }"
                          FilesUploadComplete="function(s, e) { UploadControl_OnFilesUploadComplete(e); }"
                          UploadingProgressChanged="function(s, e) { UploadControl_OnUploadingProgressChanged(e); }" />
    </dx:ASPxUploadControl>
    <p class="Note">
        <b>Note</b>: Max file size is 10 MB.
    <dx:ASPxLabel ID="AllowedFileExtensionsLabel" runat="server" Text="Allowed file extensions: .xlsx." Font-Size="8pt"></dx:ASPxLabel>
    </p>
            </td>
            <td style="width: 100px"></td>
            <td style="vertical-align:top">
                 <dx:ASPxButton ID="btnToggleGrid2" runat="server" ClientInstanceName="btnToggleGrid2" Text="Show Failed OtherID's" ClientSideEvents-Click="ToggleGrid2" AutoPostBack="false" ></dx:ASPxButton>
                <dx:ASPxLabel ID="lblNumFailed" runat="server" ClientInstanceName="lblNumFailed" ></dx:ASPxLabel>
                <dx:ASPxGridView ID="gridFailed"  runat="server" ClientInstanceName="gridFailed" AutoGenerateColumns="false"
                    DataSourceID="sql__failed" ClientVisible="false" >
                    <Columns>
                        <dx:GridViewDataColumn FieldName="studyname" Caption="Study"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="studyID"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ID"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="otherID"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="otherIDsiteID" Caption="siteID"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="sitename" Caption="Site"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="created"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="createdBy"></dx:GridViewDataColumn>
                        
                    </Columns>
                </dx:ASPxGridView>
            </td>
        </tr>
    </table>
    
<%--             <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="300px" 
             ClientInstanceName="RoundPanel"
             HeaderText="Uploaded files (jpeg, gif)" Height="100%">
             <panelcollection>
                 <dx:PanelContent runat="server">
                     <div id="uploadedListFiles" style="height: 150px; font-family: Arial;">
                     </div>
                 </dx:PanelContent>
             </panelcollection>
         </dx:ASPxRoundPanel>--%>

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="pcProgress" Modal="True" HeaderText="Uploading"
        PopupAnimationType="None" CloseAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="460px"
        AllowDragging="true" ShowPageScrollbarWhenModal="True" ShowCloseButton="False" ShowFooter="True">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                <table style="width: 100%;">
                    <tr><td style="width: 100%;">
                        <div style="overflow: hidden; width: 280px;">
                            <dx:ASPxLabel ID="lblFileName" runat="server" ClientInstanceName="lblFileName" Text=""
                                Wrap="False"></dx:ASPxLabel>
                        </div>
                    </td><td class="NoWrap" style="text-align: right">
                        <dx:ASPxLabel ID="lblCurrentUploadedFileLength" runat="server" ClientInstanceName="lblCurrentUploadedFileLength"
                            Text="" Wrap="False"></dx:ASPxLabel>
                    </td></tr>
                    <tr><td colspan="2" class="TopPadding" >
                        <dx:ASPxProgressBar ID="ASPxProgressBar1" runat="server" Height="21px" Width="100%"
                            ClientInstanceName="progress1"></dx:ASPxProgressBar>
                    </td></tr>
                    <tr><td colspan="2">
                        <div class="Spacer" style="height: 12px;"></div>
                    </td></tr>
                    <tr><td style="width: 100%;">
                        <dx:ASPxLabel ID="lblUploadedFiles" runat="server" ClientInstanceName="lblUploadedFiles" Text=""
                            Wrap="False"></dx:ASPxLabel>
                    </td><td class="NoWrap" style="text-align: right">
                        <dx:ASPxLabel ID="lblUploadedFileLength" runat="server" ClientInstanceName="lblUploadedFileLength"
                            Text="" Wrap="False"></dx:ASPxLabel>
                    </td></tr>
                    <tr><td colspan="2" class="TopPadding" >
                        <dx:ASPxProgressBar ID="ASPxProgressBar2" runat="server" CssClass="BottomMargin" Height="21px" Width="100%"
                            ClientInstanceName="progress2"></dx:ASPxProgressBar>
                    </td></tr>
                    <tr><td colspan="2">
                        <div class="Spacer" style="height: 12px;"></div>
                    </td></tr>
                    <tr><td colspan="2">
                        <dx:ASPxLabel ID="lblProgressStatus" runat="server" ClientInstanceName="lblProgressStatus" Text=""
                            Wrap="False"></dx:ASPxLabel>
                    </td></tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterTemplate>
            <div style="overflow: hidden;">
                <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="Cancel" ClientInstanceName="btnCancel" Width="100px" style="float: right">
                    <ClientSideEvents Click="function(s, e) { UploadControl.Cancel(); }" />
                </dx:ASPxButton>
            </div>
        </FooterTemplate>
        <FooterStyle><Paddings Padding="5px" PaddingRight="10px" /></FooterStyle>
    </dx:ASPxPopupControl>

    <hr />
    <br />
    <br />

    <asp:Label ID="lblTitle" runat="server" Text="Create 'code6' ID files" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlLab" runat="server" DataTextField="labname" DataValueField="labID" AutoPostBack="true" OnSelectedIndexChanged="ddlLab_SelectedIndexChanged" ></asp:DropDownList>
    <br />
    <br />

    <asp:Panel ID="panel_filters" runat="server" Visible ="false">

    <table>
        <tr>
            <td style="vertical-align:top; width:500px">

                <asp:Button ID="btnGetIDList" runat="server" OnClick="btnGetIDList_Click" Text="Download stacked code6 file (.csv)" />

            </td>
            <td style="vertical-align:top">
                <asp:Label ID="lblSingle" runat="server" Text="Enter single code6 to lookup:" Font-Size="XX-Small"></asp:Label><br />
                <asp:TextBox ID="txtCode6" runat="server" Width="100" ></asp:TextBox><br /><br />
                <asp:Button ID="btnSingle" runat="server" OnClick="btnSingle_Click" Text="Get Other ID's" /><br /><br />
                <asp:GridView ID="gvSingle" runat="server" AutoGenerateColumns="true"></asp:GridView>


            </td>
            <td style="vertical-align:top">
                <asp:Panel ID="panelDups" runat="server" Visible="false">
                <asp:Label ID="lblDups" runat="server" Text="Duplicates - same otherID is assigned to different people." Font-Size="Small" Font-Bold="true"   ></asp:Label>
                <br /><br />
                <asp:GridView ID="gvDups" runat="server" AutoGenerateColumns="true"></asp:GridView>
                    </asp:Panel>
            </td>

        </tr>
    </table>





    <br />
    <br />
    <table >
        <tr>
            <td></td>
            <td>Select Studies:</td>
<%--        <td><i>UNDER CONSTRUCTION</i><br />Select Groups:  <asp:Button ID="btnLoadGroups" runat="server" OnClick="btnLoadGroups_Click" Text="refresh" Font-Size="XX-Small" ></asp:Button></td>--%>
        </tr>
        <tr>
            <td style="vertical-align:top; padding:10px"> 
                <dx:ASPxListBox ID="selList" ClientInstanceName="selList" runat="server"  Height="350px" Width="100%" />&nbsp;&nbsp;&nbsp;
                <br />
                    Selected count: <span id="selCount" style="font-weight: bold">0</span>
                

            </td>
            <td style="vertical-align:top; padding:10px" >
                <dx:ASPxGridView id="gridStudy" runat="server" ClientInstanceName="gridStudy"
                     KeyFieldName="studyID">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="AllPages" />
                        <dx:GridViewDataColumn FieldName="studyname" Caption="Study"></dx:GridViewDataColumn>
                    </Columns>
                    <ClientSideEvents SelectionChanged="grid_SelectionChanged" />
                    <SettingsPager PageSize="15"></SettingsPager>
                </dx:ASPxGridView>
            </td>
            <td style="vertical-align:top">

            </td>
        </tr>

    </table>

        <br />

    <asp:Button ID="btnPivot" runat="server" OnClick="btnPivot_Click" Text="Create wide code6 file, with Filters" />

    <asp:CheckBox ID="chkXLSX" runat="server" Text="Save to .xlsx" ></asp:CheckBox>
    <asp:CheckBox ID="chkDisplayOnPage" runat="server" Text="Display on page" ></asp:CheckBox>

        <asp:Label ID="lblSelectOne" runat="server" Visible="false" Text="Select the output method." Font-Size="XX-Small" ForeColor="Red"></asp:Label>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="panel_wide" runat="server" >

    </asp:Panel>

         <asp:SqlDataSource ID="sql__failed" runat="server" SelectCommandType="Text"
         SelectCommand="select coalesce(studyname, '*UNKNOWN*') as studyname, coalesce(sitename, '*UNKNOWN*') as sitename, a.* from tblOtherID_failed a left join tblStudy b ON a.studyID=b.studyID left join tblsite c ON a.otherIDsiteID = c.siteID" 
         ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
     </asp:SqlDataSource>


</asp:Content>

