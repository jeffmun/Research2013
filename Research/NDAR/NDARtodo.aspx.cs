using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;

public partial class NDAR_NDARtodo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DirectoryInfo dirInfo = new DirectoryInfo("//autism-sql.autism.washington.edu/ndarcsv");

        GetFilesAndFolders(dirInfo);


        // output the directory into a node
        TreeNode RootNode = OutputDirectory(dirInfo, null);

        // add the output to the tree
        TreeView1.Nodes.Add(RootNode);

    }


    public void GetFilesAndFolders(DirectoryInfo dirInfo)  
   {  
       //DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("autism-sql.autism.washington.edu/ndarcsv"));
       FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);  
       GridView1.DataSource = fileInfo;  
       GridView1.DataBind();        
   }



     TreeNode OutputDirectory(System.IO.DirectoryInfo directory, TreeNode parentNode)
     {
         // validate param
         if (directory == null) return null;

         // create a node for this directory
         TreeNode DirNode = new TreeNode(directory.Name);

         // get subdirectories of the current directory
         System.IO.DirectoryInfo[] SubDirectories = directory.GetDirectories();

         // output each subdirectory
         for (int DirectoryCount = 0; DirectoryCount < SubDirectories.Length; DirectoryCount++)
         {
             OutputDirectory(SubDirectories[DirectoryCount], DirNode);
         }

         // output the current directories files
         System.IO.FileInfo[] Files = directory.GetFiles();

         for (int FileCount = 0; FileCount < Files.Length; FileCount++)
         {
             DirNode.ChildNodes.Add(new TreeNode(Files[FileCount].Name));
         }

         // if the parent node is null, return this node
         // otherwise add this node to the parent and return the parent
         if (parentNode == null)
         {
             return DirNode;
         }
         else
         {
             parentNode.ChildNodes.Add(DirNode);
             return parentNode;
         }
     }



}