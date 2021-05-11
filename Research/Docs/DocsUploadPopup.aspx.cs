using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Web;
using DevExpress.Utils;
using System.Web.UI.WebControls;

using uwac;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Docs_DocsUploadPopup : BasePage
{

    protected void Page_PreLoad(object sender, EventArgs e)
    {
        UploadControlHelper.RemoveOldStorages();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //HtmlTable tblBody = (HtmlTable)Master.FindControl("tblBody");
        //if(tblBody != null) tblBody.Visible = false;
        //Menu oMenu = (Menu)Master.FindControl("oMenu");
        //if (oMenu != null) oMenu.Visible = false;
        Master.HideHeaderAndFooter();

        if (!IsPostBack)
        {
            SubmissionID = UploadControlHelper.GenerateUploadedFilesStorageKey();
            UploadControlHelper.AddUploadedFilesStorage(SubmissionID);
        }

        FormLayout.FindItemOrGroupByName("ResultGroup").Visible = false;
        //TOFIX DemoHelper.Instance.ControlAreaMaxWidth = Unit.Pixel(800);
    }

    protected string SubmissionID
    {
        get
        {
            return HiddenField.Get("SubmissionID").ToString();
        }
        set
        {
            HiddenField.Set("SubmissionID", value);
        }
    }
    UploadedFilesStorage UploadedFilesStorage
    {
        get { return UploadControlHelper.GetUploadedFilesStorageByKey(SubmissionID); }
    }

    protected void ProcessSubmit(string description, List<UploadedFileInfo> fileInfos)
    {
        DescriptionLabel.Value = Server.HtmlEncode(description);

        SQL_utils sql = new SQL_utils("backend");
        foreach (UploadedFileInfo fileInfo in fileInfos)
        {
            // process uploaded files here

            DateTime? filename_date = GetFirstDateFromString(fileInfo.OriginalFileName);


            //Check to see if the filename has already been uploaded
            int exists = sql.IntScalar_from_SQLstring(
                String.Format("select coalesce(count(*),0) result from tblDocVers where origfilename = '{0}'", fileInfo.OriginalFileName));

            int doctypeID = Convert.ToInt32(cboDataUploadType.Value);

            if (exists == 0)
            {
                UploadSettings uploadSettings;
                //int max_datauploadpk = sql.IntScalar_from_SQLstring("select coalesce(max(datauploadpk),0) from def.DataUpload");

                //Save to DB
                uploadSettings = LogTheUpload(fileInfo, fileInfo.OriginalFileName, doctypeID);

                fileInfo.SummaryInfo = uploadSettings.results;
            }
            else
            {
                fileInfo.SummaryInfo = "NOT PROCESSED: The file already exists.";
            }

        }
        sql.Close();

        gvResults.DataSource = fileInfos;
        gvResults.DataBind();
        SubmittedFilesListBox.DataSource = fileInfos;
        SubmittedFilesListBox.DataBind();

        FormLayout.FindItemOrGroupByName("ResultGroup").Visible = true;
    }

    protected int GetEntityID(SQL_utils sql)
    {
        var qs = Request.RawUrl;

        int entityid = -1;
        DbEntityType enttype = (DbEntityType)Convert.ToInt32(Request.QueryString["entitytypeid"]);

        if (enttype == DbEntityType.study)
        {
            entityid = sql.IntScalar_from_SQLstring("select dbo.fnDefaultStudyidByUser()");
        }
        else if (enttype == DbEntityType.subject)
        {
            entityid = Convert.ToInt32(Request.QueryString["entityid"]);
        }

        return entityid;
    }

    protected UploadSettings LogTheUpload(UploadedFileInfo fileInfo, string docTitle, int doctypeID)
    {
        SQL_utils sql = new SQL_utils("backend");
        //Log the upload
        UploadSettings uploadSettings = new UploadSettings(fileInfo.FilePath, fileInfo.OriginalFileName, UploadFiletype.Doc);
        uploadSettings.linked_entitytype = (DbEntityType)Convert.ToInt32(Request.QueryString["entitytypeid"]);
        uploadSettings.linked_entityID = GetEntityID(sql);
        uploadSettings.doctitle = fileInfo.OriginalFileName;
        uploadSettings.doctypeID = doctypeID; // sql.IntScalar_from_SQLstring("select doctypeID from tblDocType_lkup where doctype='Luminex Excel Data'");
        uploadSettings.docstatusID = sql.IntScalar_from_SQLstring("select docstatusID from tblDocStatus_lkup where docstatus='default'");
        uploadSettings.LogUpload();

        string results = "";

        if (uploadSettings.docversID > 0)
        {

            //Copy to webdocs
            string path = Server.MapPath(@"~\webdocs\");
            string newpathname = String.Format("{0}{1}", path, uploadSettings.docfilename);

            try
            {
                File.Copy(fileInfo.FilePath, newpathname);
                //int new_datauploadpk = sql.IntScalar_from_SQLstring(String.Format("select datauploadpk from def.DataUpload where docversID={0}", uploadSettings.docversID));

                results = String.Format("docID={0}, docversID={1}", uploadSettings.docID, uploadSettings.docversID);

                //if (new_datauploadpk == max_datauppk)
                //{
                //    results = String.Format("docID={0}, docversID={1}, datauploadpk={2}", uploadSettings.docID, uploadSettings.docversID, new_datauploadpk);
                //} else 
                //{
                //    results = String.Format("Error logging data upload ({0} != {1}", 
                //}
            }
            catch (Exception ex)
            {
                string err = ex.Message;
                string unlog = uploadSettings.UnlogUpload();
                results = String.Format("{0} {1}", err, unlog);
            }

        }
        uploadSettings.results = results;
        return uploadSettings;
    }


    protected void DocumentsUploadControl_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
    {
        bool isSubmissionExpired = false;
        if (UploadedFilesStorage == null)
        {
            isSubmissionExpired = true;
            UploadControlHelper.AddUploadedFilesStorage(SubmissionID);
        }
        UploadedFileInfo tempFileInfo = UploadControlHelper.AddUploadedFileInfo(SubmissionID, e.UploadedFile.FileName);

        e.UploadedFile.SaveAs(tempFileInfo.FilePath);

        if (e.IsValid)
            e.CallbackData = tempFileInfo.UniqueFileName + "|" + isSubmissionExpired;
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        ValidateInputData();

        List<UploadedFileInfo> resultFileInfos = new List<UploadedFileInfo>();
        string description = cboDataUploadType.Text.ToString();  //DescriptionTextBox.Text;
        bool allFilesExist = true;

        if (UploadedFilesStorage == null)
            UploadedFilesTokenBox.Tokens = new TokenCollection();

        foreach (string fileName in UploadedFilesTokenBox.Tokens)
        {
            UploadedFileInfo demoFileInfo = UploadControlHelper.GetDemoFileInfo(SubmissionID, fileName);
            FileInfo fileInfo = new FileInfo(demoFileInfo.FilePath);

            if (fileInfo.Exists)
            {
                demoFileInfo.FileSize = FormatSize(fileInfo.Length);
                resultFileInfos.Add(demoFileInfo);
            }
            else
                allFilesExist = false;
        }

        if (allFilesExist && resultFileInfos.Count > 0)
        {
            ProcessSubmit(description, resultFileInfos);

            UploadControlHelper.RemoveUploadedFilesStorage(SubmissionID);

            ASPxEdit.ClearEditorsInContainer(FormLayout, true);
        }
        else
        {
            UploadedFilesTokenBox.ErrorText = "Submit failed because files have been removed from the server due to the 5 minute timeout.";
            UploadedFilesTokenBox.IsValid = false;
        }
    }
    void ValidateInputData()
    {
        bool isInvalid = string.IsNullOrEmpty(cboDataUploadType.Value.ToString()) || UploadedFilesTokenBox.Tokens.Count == 0;
        //bool isInvalid = string.IsNullOrEmpty(DescriptionTextBox.Text) || UploadedFilesTokenBox.Tokens.Count == 0;
        if (isInvalid)
            throw new Exception("Invalid input data");
    }


    static DateTime? GetFirstDateFromString(string inputText)
    {
        inputText = inputText.Replace("-", "/").Replace("_", "/");

        var regex = new Regex(@"\d[-/_]\d+[-/_]\d+");
        foreach (Match m in regex.Matches(inputText))
        {
            DateTime dt;
            if (DateTime.TryParseExact(m.Value, "MM/dd/yyyy", null, DateTimeStyles.AssumeLocal, out dt))
                return dt;

            DateTime dt2;
            if (DateTime.TryParseExact(m.Value, "M/dd/yyyy", null, DateTimeStyles.AssumeLocal, out dt2))
                return dt2;


        }
        return null;
    }

    public static string FormatSize(object value)
    {
        double amount = Convert.ToDouble(value);
        string unit = "KB";
        if (amount != 0)
        {
            if (amount <= 1024)
                amount = 1;
            else
                amount /= 1024;

            if (amount > 1024)
            {
                amount /= 1024;
                unit = "MB";
            }
            if (amount > 1024)
            {
                amount /= 1024;
                unit = "GB";
            }
        }
        return String.Format("{0:#,0} {1}", Math.Round(amount, MidpointRounding.AwayFromZero), unit);
    }






    protected void cboDataUploadType_SelectedIndexChanged(object sender, EventArgs e)
    {
        var filetype = cboDataUploadType.Value.ToString();

        SQL_utils sql = new SQL_utils("backend");
        string exts_csv = sql.StringScalar_from_SQLstring(String.Format("select allowedfileext from tbldoctype_lkup where doctypeid={0}", filetype));
        sql.Close();

        string[] exts = exts_csv.Split(',').ToArray();

        DocumentsUploadControl.ValidationSettings.AllowedFileExtensions = exts;
        AllowedFileExtensionsLabel.Text = String.Format("Allowed file extensions: {0}", String.Join(",", exts));

    }

    protected void btnSubmitMissing_Click(object sender, EventArgs e)
    {
        bool isInvalid = string.IsNullOrEmpty(cboDataUploadType.Value.ToString());

        if (!isInvalid)
        {
            int doctypeID = Convert.ToInt32(cboDataUploadType.Value);
            int entitytypeid = Convert.ToInt32(Request.QueryString["entitytypeid"]);
            int entityid = Convert.ToInt32(Request.QueryString["entityid"]);

            SQL_utils sql = new SQL_utils();

            int docid = sql.IntScalar_from_SQLstring("select max(docid)+1 from tbldoc");
            int docversid = sql.IntScalar_from_SQLstring("select max(docversid)+1 from tbldocvers");

            if (docid > 0 & docversid > 0)
            {
                string code1 = String.Format("insert into tbldoc(docid, doctitle, doctypeid, docstatusid) values({0}, 'MISSING', {1}, 5)", docid, doctypeID);
                sql.NonQuery_from_SQLstring(code1);

                string code2 = String.Format("insert into tbldocvers(docid, docversid, docexists) values({0}, {1}, 0)", docid, docversid);
                sql.NonQuery_from_SQLstring(code2);
                string code3 = String.Format("insert into tbldocfk(docid, entitytypeid, entityid) values({0}, {1}, {2})", docid, entitytypeid, entityid);
                sql.NonQuery_from_SQLstring(code3);

                btnSubmitMissing.Visible = false;
                lblMissingLogged.Visible = true;
            }

        }
    }
}




public class UploadedFilesStorage
{
    public string Path { get; set; }
    public string Key { get; set; }
    public DateTime LastUsageTime { get; set; }

    public IList<UploadedFileInfo> Files { get; set; }
}

//public class UploadedFileInfo
//{
//    public string UniqueFileName { get; set; }
//    public string OriginalFileName { get; set; }
//    public string FilePath { get; set; }
//    public string FileSize { get; set; }
//    public string SummaryInfo { get; set; }
//}



public static class UploadControlHelper
{
    const int DisposeTimeout = 5;
    const string TempDirectory = "~/UploadControl/Temp/";
    static readonly object storageListLocker = new object();

    static HttpContext Context { get { return HttpContext.Current; } }
    static string RootDirectory { get { return Context.Request.MapPath(TempDirectory); } }

    static IList<UploadedFilesStorage> uploadedFilesStorageList;
    static IList<UploadedFilesStorage> UploadedFilesStorageList
    {
        get
        {
            return uploadedFilesStorageList;
        }
    }

    static UploadControlHelper()
    {
        uploadedFilesStorageList = new List<UploadedFilesStorage>();
    }

    static string CreateTempDirectoryCore()
    {
        string uploadDirectory = Path.Combine(RootDirectory, Path.GetRandomFileName());
        Directory.CreateDirectory(uploadDirectory);

        return uploadDirectory;
    }
    public static UploadedFilesStorage GetUploadedFilesStorageByKey(string key)
    {
        lock (storageListLocker)
        {
            return GetUploadedFilesStorageByKeyUnsafe(key);
        }
    }
    static UploadedFilesStorage GetUploadedFilesStorageByKeyUnsafe(string key)
    {
        UploadedFilesStorage storage = UploadedFilesStorageList.Where(i => i.Key == key).SingleOrDefault();
        if (storage != null)
            storage.LastUsageTime = DateTime.Now;
        return storage;
    }
    public static string GenerateUploadedFilesStorageKey()
    {
        return Guid.NewGuid().ToString("N");
    }
    public static void AddUploadedFilesStorage(string key)
    {
        lock (storageListLocker)
        {
            UploadedFilesStorage storage = new UploadedFilesStorage
            {
                Key = key,
                Path = CreateTempDirectoryCore(),
                LastUsageTime = DateTime.Now,
                Files = new List<UploadedFileInfo>()
            };
            UploadedFilesStorageList.Add(storage);
        }
    }
    public static void RemoveUploadedFilesStorage(string key)
    {
        lock (storageListLocker)
        {
            UploadedFilesStorage storage = GetUploadedFilesStorageByKeyUnsafe(key);
            if (storage != null)
            {
                Directory.Delete(storage.Path, true);
                UploadedFilesStorageList.Remove(storage);
            }
        }
    }
    public static void RemoveOldStorages()
    {
        if (!Directory.Exists(RootDirectory))
            Directory.CreateDirectory(RootDirectory);

        lock (storageListLocker)
        {
            string[] existingDirectories = Directory.GetDirectories(RootDirectory);
            foreach (string directoryPath in existingDirectories)
            {
                UploadedFilesStorage storage = UploadedFilesStorageList.Where(i => i.Path == directoryPath).SingleOrDefault();
                if (storage == null || (DateTime.Now - storage.LastUsageTime).TotalMinutes > DisposeTimeout)
                {
                    Directory.Delete(directoryPath, true);
                    if (storage != null)
                        UploadedFilesStorageList.Remove(storage);
                }
            }
        }
    }
    public static UploadedFileInfo AddUploadedFileInfo(string key, string originalFileName)
    {
        UploadedFilesStorage currentStorage = GetUploadedFilesStorageByKey(key);
        UploadedFileInfo fileInfo = new UploadedFileInfo
        {
            FilePath = Path.Combine(currentStorage.Path, Path.GetRandomFileName()),
            OriginalFileName = originalFileName,
            UniqueFileName = GetUniqueFileName(currentStorage, originalFileName)
        };
        currentStorage.Files.Add(fileInfo);

        return fileInfo;
    }
    public static UploadedFileInfo GetDemoFileInfo(string key, string fileName)
    {
        UploadedFilesStorage currentStorage = GetUploadedFilesStorageByKey(key);
        return currentStorage.Files.Where(i => i.UniqueFileName == fileName).SingleOrDefault();
    }
    public static string GetUniqueFileName(UploadedFilesStorage currentStorage, string fileName)
    {
        string baseName = Path.GetFileNameWithoutExtension(fileName);
        string ext = Path.GetExtension(fileName);
        int index = 1;

        while (currentStorage.Files.Any(i => i.UniqueFileName == fileName))
            fileName = string.Format("{0} ({1}){2}", baseName, index++, ext);

        return fileName;
    }




}
