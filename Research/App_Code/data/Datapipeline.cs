using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
    /// <summary>
    /// Summary description for Datapipeline
    /// </summary>
    public abstract class Datapipeline
    {
        public ProcessLog _log { get; set; }
        public ProcessLogs _logs { get; set; }

        public Docvers _docvers;

        public Datapipeline()
        {
            //
            // TODO: Add constructor logic here
            //
            _logs = new ProcessLogs();
        }
    }
}
