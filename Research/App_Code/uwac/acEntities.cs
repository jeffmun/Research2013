using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

namespace uwac
{

    /// <summary>
    /// Summary description for acEntities
    /// </summary>
    public class acEntity
    {
        public acEntity()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static string CreateTblQueryString(Entity tbl)
        {

            Dictionary<string, string> d = new Dictionary<string, string> { { "tbl", GetEntityTablename(tbl) }, 
            { "schema", "ac" }  };

            string qs = CreateEncryptedQueryString(d);

            return qs;
        }

        public static string CreateTblQueryString(string tbl, string schema)
        {

            Dictionary<string, string> d = new Dictionary<string, string> { { "tbl", tbl }, 
            { "schema", schema }  };

            string qs = CreateEncryptedQueryString(d);

            return qs;
        }

        public static string CreateMasterDetailQueryString(Entity tbl, Entity detail)
        {
            string link = GetLinkingTablename(tbl, detail);

            Dictionary<string, string> d = new Dictionary<string, string> { { "tbl", GetEntityTablename(tbl) }, 
            { "detail", GetEntityTablename(detail) }, 
            { "schema", "ac" }  };

            if (link != null)
            {
                d.Add("linktable", link);
            }

            string qs = CreateEncryptedQueryString(d);

            return qs;
        }


        public static string CreateMasterDetailQueryString(string tbl, string detail)
        {
            Dictionary<string, string> d = new Dictionary<string, string> { { "tbl", tbl }, { "detail", detail } };

            string qs = CreateEncryptedQueryString(d);

            return qs;
        }



        public static string CreateEncryptedQueryString(Dictionary<string, string> d)
        {
            List<string> qs = new List<string>();

            foreach (KeyValuePair<string, string> pair in d)
            {
                string s = pair.Key + "=" + utilCrypt.Encrypt(pair.Value);
                qs.Add(s);
            }

            string qs_all = String.Join("&", qs);
            return qs_all;
        }


        public static string GetEntityTablename (Entity ent)
        {
            SQL_utils sql = new SQL_utils("backend");
            int id = (int)ent;
            string t = sql.StringScalar_from_SQLstring("select entitytbl from ac.enumEntity where entityID = " + id.ToString());
            sql.Close();
            return t;
            
        }

        public static string GetLinkingTablename(Entity ent1, Entity ent2)
        {
            SQL_utils sql = new SQL_utils("backend");
            int id1 = (int)ent1;
            int id2 = (int)ent2;

            string sqlcode = "select entitytbl from ac.enumEntity where entity1ID = " + id1.ToString() + " and entity2ID = " + id2.ToString();
            string t = sql.StringScalar_from_SQLstring(sqlcode);
            sql.Close(); 
            return t;

        }


        public static string GetEntityName(Entity ent)
        {
            SQL_utils sql = new SQL_utils("backend");
            int id = (int)ent;
            string t = sql.StringScalar_from_SQLstring("select entity from ac.enumEntity where entityID = " + id.ToString());
            sql.Close();
            return t;

        }


        // see 
        //         select enumDef from  ac.vw_create_acEntity_definition 
        // to get the info to create this enum
        public enum Entity
        {
            Entity = 1,
            Service = 2,
            Doc = 3,
            Event = 4,
            Status = 5,
            Insurance = 6,
            Organization = 7,
            Diagnosis = 8,
            Family = 101,
            Person = 102,
            Email = 103,
            Phone = 104,
            Address = 105,
            Contact = 106,
            Client = 107,
            UWAC_Staff = 108,
            Service_Doc = 201,
            Service_Event = 202,
            Entity_Status = 203,
            Client_Diagnosis = 301,
            Client_Service = 302,
            Client_Service_Doc = 303,
            Client_Service_Event = 304, 
        }


    }

}
