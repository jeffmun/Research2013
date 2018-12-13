using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using uwac;


namespace uwac
{
	/// <summary>
	/// Summary description for DbEntityInstance
	/// </summary>
	public class DbEntityInstance
	{

		DbEntity ent  { get; set; }
		string instance_name { get; set; }
		int instance_pkval { get; set; }


		public DbEntityInstance(DbEntity myent, int mypkval)
		{
			ent = myent;
			instance_pkval = mypkval;
		}

		public string Name()
		{
			string x = String.Format("select {0} from {1}.{2}.{3} where {4} = {5}"
			, ent.namefld
			, ent.fulldb
			, ent.schema
			, ent.table_name
			, ent.pkfld
			, this.instance_pkval);
			SQL_utils sql = new SQL_utils(ent.db);
			string name = sql.StringScalar_from_SQLstring(x);
			sql.Close();
			return name;
		}

		//
		public string WhereIn(DbEntityType entTypeToFind)
		{
			DbEntity entToFind = new DbEntity(entTypeToFind);

			string x = String.Format(" where {0} IN (select {0} from {1}.{2}.{3} where {4}={5})"
				, entToFind.pkfld
				, ent.fulldb
				, ent.schema
				, ent.table_name
				, ent.pkfld
				, instance_pkval);
			return x;
		}

		public string NameOfRelatedEntity(DbEntityType relatedEntType)
		{
			string where = WhereIn(relatedEntType);
			DbEntity relatedEnt = new DbEntity(relatedEntType);
			string x = String.Format("select {0} from {1}.{2}.{3} {4}"
				, relatedEnt.namefld
				, relatedEnt.fulldb
				, relatedEnt.schema
				, relatedEnt.table_name
				, where);
			SQL_utils sql = new SQL_utils(relatedEnt.db);
			string name = sql.StringScalar_from_SQLstring(x);
			sql.Close();
			return name;
		}

		public int PkvalOfRelatedEntity(DbEntityType relatedEntType)
		{
			string where = WhereIn(relatedEntType);
			DbEntity relatedEnt = new DbEntity(relatedEntType);
			string x = String.Format("select {0} from {1}.{2}.{3} {4}"
				, relatedEnt.pkfld
				, relatedEnt.fulldb
				, relatedEnt.schema
				, relatedEnt.table_name
				, where);
			SQL_utils sql = new SQL_utils(relatedEnt.db);
			int pkval = sql.IntScalar_from_SQLstring(x);
			sql.Close();
			return pkval;
		}


		public string NameOfRelatedEntity2(DbEntityType relatedEntType1, DbEntityType relatedEntType2)
		{
			string where = WhereIn(relatedEntType1);
			DbEntity relatedEnt1 = new DbEntity(relatedEntType1);
			DbEntity relatedEnt2 = new DbEntity(relatedEntType2);

			string x = String.Format("select {0} from {1}.{2}.{3} where {4} in (select {5} from {6}.{7}.{8} {9})"
				, relatedEnt2.namefld
				, relatedEnt2.fulldb
				, relatedEnt2.schema
				, relatedEnt2.table_name
				, relatedEnt1.pkfld
				, relatedEnt1.pkfld
				, relatedEnt1.fulldb
				, relatedEnt1.schema
				, relatedEnt1.table_name
				, where);


			SQL_utils sql = new SQL_utils(relatedEnt2.db);
			string name = sql.StringScalar_from_SQLstring(x);
			sql.Close();
			return name;
		}


	}

}