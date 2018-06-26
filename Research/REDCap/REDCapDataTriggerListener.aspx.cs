using System;
using System.Net;
using System.Drawing;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

public partial class Info_REDCapDataTriggerListener : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpListener newListener = new HttpListener();

        newListener.Prefixes.Add("https://uwac.autism.washington.edu/research/Info/");

        if (newListener.Prefixes.Count == 0)
        {
            Console.WriteLine("There are no prefixes.");
        }
        foreach (string prefix in newListener.Prefixes)
        {
            Console.WriteLine(prefix);
        }
        // Show the listening state. 
        if (newListener.IsListening)
        {
            Console.WriteLine("The server is listening.");
        }

        SimpleListenerExample(newListener.Prefixes);
    }

    public static void SimpleListenerExample(HttpListenerPrefixCollection prefixes)
    {
        if (!HttpListener.IsSupported)
        {
            Console.WriteLine("Windows XP SP2 or Server 2003 is required to use the HttpListener class.");
            return;
        }
        // URI prefixes are required, 
        // for example "http://contoso.com:8080/index/".

        if (prefixes == null)
            throw new ArgumentException("prefixes");

        // Create a listener.
        HttpListener listener = new HttpListener();
        // Add the prefixes. 
        foreach (string s in prefixes)
        {
            listener.Prefixes.Add(s);
        }
        listener.Start();
        Console.WriteLine("Listening...");

        // Note: The GetContext method blocks while waiting for a request. 
        HttpListenerContext context = listener.GetContext();

        HttpListenerRequest request = context.Request;
        // Obtain a response object.
        HttpListenerResponse response = context.Response;
        // Construct a response. 

        string responseString = "<HTML><BODY> Hello world!</BODY></HTML>";
        byte[] buffer = System.Text.Encoding.UTF8.GetBytes(responseString);
        // Get a response stream and write the response to it.
        response.ContentLength64 = buffer.Length;
        System.IO.Stream output = response.OutputStream;
        output.Write(buffer, 0, buffer.Length);
        // You must close the output stream.
        output.Close();
        listener.Stop();
    }
}



