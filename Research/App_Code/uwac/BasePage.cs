using System;
using System.Diagnostics;
using System.Data;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace uwac
{
	/// <summary>
	/// Summary description for BasePage
	/// </summary>

	public class BasePage : System.Web.UI.Page
	{
		//private Logger logger = LogManager.GetCurrentClassLogger();
		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			RegisterEvents();
		}

		protected virtual void ExecutingSqlDatasource(object sender, SqlDataSourceCommandEventArgs e)
		{

			string orig_cmdtext = e.Command.CommandText;
			string new_cmdtext = String.Format("EXEC sec.spSetUserContext '{0}'; {1}", Session["netid"], orig_cmdtext);

			Debug.WriteLine(String.Format("old: {0}  ", orig_cmdtext));
			Debug.WriteLine(String.Format("new: {0}  ", new_cmdtext));

			e.Command.CommandText = new_cmdtext;
			
		}

		//protected virtual void ExecutedSqlDatasource(object sender, SqlDataSourceStatusEventArgs e)
		//{
		//	var stopWatch = Context.Items[e.Command.CommandText] as Stopwatch;
		//	stopWatch.Stop();
		//	logger.Info(string.Format("{0} takes {1}", e.Command.CommandText, stopWatch.Elapsed.ToString()));
		//	if (e.Exception == null)
		//	{
		//		e.Command.Transaction.Commit();
		//	}
		//	else
		//	{
		//		e.Command.Transaction.Rollback();
		//	}
		//}

		private void RegisterEvents()
		{

			//var contentplaceholder = this.Page.Controls("oBodyPlaceHolder");
			//var sqlDataSourceCollection = contentplaceholder.Controls.OfType<SqlDataSource>();
			var sqlDataSourceCollection = this.GetAllControlsOfType<SqlDataSource>();

			foreach (var sqlDataSource in sqlDataSourceCollection)
			{

				if (!string.IsNullOrEmpty(sqlDataSource.SelectCommand))
				{
					if (sqlDataSource.SelectCommandType == SqlDataSourceCommandType.Text)
					sqlDataSource.Selecting += ExecutingSqlDatasource;
					//sqlDataSource.Selected += ExecutedSqlDatasource;
				}
				if (!string.IsNullOrEmpty(sqlDataSource.InsertCommand))
				{
					if (sqlDataSource.InsertCommandType == SqlDataSourceCommandType.Text)
						sqlDataSource.Inserting += ExecutingSqlDatasource;
					//sqlDataSource.Inserted += ExecutedSqlDatasource;
				}
				if (!string.IsNullOrEmpty(sqlDataSource.UpdateCommand))
				{
					if (sqlDataSource.UpdateCommandType == SqlDataSourceCommandType.Text)
						sqlDataSource.Updating += ExecutingSqlDatasource;
					//sqlDataSource.Updated += ExecutedSqlDatasource;
				}
				if (!string.IsNullOrEmpty(sqlDataSource.DeleteCommand))
				{
					if (sqlDataSource.DeleteCommandType == SqlDataSourceCommandType.Text)
						sqlDataSource.Deleting += ExecutingSqlDatasource;
					//sqlDataSource.Deleted += ExecutedSqlDatasource;
				}
			}
		}
	}

	public static class ControlExtensions
	{
		public static IEnumerable<T> GetAllControlsOfType<T>(this Control parent) where T : Control
		{
			var result = new List<T>();
			foreach (Control control in parent.Controls)
			{
				if (control is T)
				{
					result.Add((T)control);
				}
				if (control.HasControls())
				{
					result.AddRange(control.GetAllControlsOfType<T>());
				}
			}
			return result;
		}
	}

}
