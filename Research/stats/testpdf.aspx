<%@ Page Title="Test PDF" Language="C#" Debug="true" EnableEventValidation="false"  AutoEventWireup="true" %>

<form runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <br />    <br />
    1. When loaded, 'foochart_aspx' is rendered and will be saved to Pdf.
    <asp:Button ID="btnSelectPdf" runat="server" Text="Save to PDF"  OnClick="btnSelectPdf_Click" />
    <br />aspx:<br />
    <div id="chartDiv_aspx"></div>

    <br /><br />

    2. An input button will load a chart on demand, but it doesn't save to Pdf.
    <input id="btn_draw_js" type="button" onclick="drawfoochart_js()" value="Load foochart_js" />
    <br />js_input:<br />
    <div id="chartDiv_js"></div>

    <br /><br />

    3. An asp:button will load a chart on demand, but it disappears after initially being rendered.
    <asp:Button ID="btnASP_draw_js" runat="server" Text="Load foochart_js (ASP)" OnClientClick="drawfoochart_js();"/>
    <br />js_inputASP:<br />
    <div id="chartDiv_jsASP"></div>



    <script type="text/javascript" src="foochart.js"></script>
    <script type="text/javascript" src="foochartASP.js"></script>
    
    <script type="text/javascript"  >
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawfoochart_aspx);

        function drawfoochart_aspx() {
            var data = google.visualization.arrayToDataTable([
            ['X', 'Y'],
            [0,0],[10,10]
            ]);

            var options = {
                title: 'foochart_aspx',
                legend: 'none',
                width: 300,
                heigth: 300
            };

            var chart = new google.visualization.ScatterChart
                   (document.getElementById("chartDiv_aspx"));

            chart.draw(data, options);
        }
        </script>


    <%@ Import  namespace="SelectPdf"%>
    <%@ Import  namespace="System.IO"%>


    <script runat="server">
        protected void btnSelectPdf_Click(object sender, EventArgs e)
        {
            TextWriter myWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(myWriter);

            htmlWriter.Write("This page: " + System.IO.Path.GetFileName(HttpContext.Current.Request.Url.ToString()));


            HtmlToPdf converter = new HtmlToPdf();
            converter.Options.MinPageLoadTime = 2;

            this.Page.RenderControl(htmlWriter);

            SelectPdf.PdfDocument doc = converter.ConvertHtmlString(myWriter.ToString());
            doc.Save(Response, false, "GoogleChart_Sample.pdf");
            doc.Close();
            Response.End();

        }
    </script>

    </form>


