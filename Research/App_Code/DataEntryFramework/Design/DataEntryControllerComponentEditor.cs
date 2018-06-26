using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Windows.Forms;
using System.Windows.Forms.Design;
using DataEntryFramework;
using System.Data.SqlClient;


namespace DataEntryFramework.Design

{

	public class DataEntryControllerComponentEditor : WindowsFormsComponentEditor
	{

		public override bool EditComponent( ITypeDescriptorContext context, 
			object component,
			IWin32Window owner)
		{
			DataEntryController dec = component as DataEntryController;
			if ( dec == null) 
			{
				throw new ArgumentException("Component must be a DataEntryController object", "component");
			}

			bool changed = false;

			//throw an exception if all required designer properties aren't set before showing designer
			// HACK: really should have a way to set these in the designer, but I'll do that later
			//throw an error if any required controller property ismissing
			if (dec.PrimaryKeyField == string.Empty || dec.VerifiedField == string.Empty
				|| dec.DatabaseTable == string.Empty || dec.LookupField1 == string.Empty)
				throw new Exception("The controller is missing some required properties: PrimaryKeyField, VerifiedField, DatabaseTable, and LookupField1 are required.");

			SqlConnection conn = GetSqlConnection(dec, Settings.SQL_CONNECTION_COMPONENTNAME);
			if (conn == null)
				throw new Exception(string.Format("Add a SqlConnection component to the form called {0}.",Settings.SQL_CONNECTION_COMPONENTNAME));

			
			//DataEntryControllerComponentEditorForm form = new DataEntryControllerComponentEditorForm(dec, _cd);
			DataEntryControllerComponentEditorForm form = new DataEntryControllerComponentEditorForm(dec);
			

			if (form.ShowDialog(owner) == DialogResult.OK)
				changed = true;

			return changed;


		}

		private SqlConnection GetSqlConnection(DataEntryController dec, string componentName)
		{
			IDesignerHost idh = null;
			idh = (IDesignerHost)dec.Page.Site.GetService(typeof(IDesignerHost));

			SqlConnection sc = null;
			if (idh != null) 
			{
				foreach (Object c in idh.Container.Components)
				{
					sc = c as SqlConnection;
					if(sc != null)
					{
						if (sc.Site.Name == componentName)
							break;
						else
							sc = null;
					}
				}
			}
			return sc;
		}


//		public bool  EditComponent(IComponent c, DataEntryControllerDesigner cd) 
//		{
//			_cd = cd;
//			return EditComponent(c);
//		}


		/*
		public override bool EditComponent( ITypeDescriptorContext context, 
			object component,
			IWin32Window owner)
		{
			DataEntryController dec = component as DataEntryController;
			if ( dec == null) 
			{
				throw new ArgumentException("Component must be a DataEntryController object", "component");
			}

			IServiceProvider site = dec.Site;
			IComponentChangeService changeService = null;

			DesignerTransaction transaction = null;
			bool changed = false;


			try // try 1
			{


				if (site != null)
				{
					IDesignerHost designerHost= (IDesignerHost) site.GetService(typeof(IDesignerHost));
					transaction = designerHost.CreateTransaction("Property Builder");

					changeService = (IComponentChangeService) site.GetService(typeof(IComponentChangeService));

					if (changeService != null)
					{
					
						try 
						{
							changeService.OnComponentChanging(dec, null);
						}
						catch (CheckoutException ex) 
						{
							if (ex == CheckoutException.Canceled)
								return false;

							throw ex;
						}
					}
				}


				try // try 2
				{

					DataEntryControllerComponentEditorForm form = new DataEntryControllerComponentEditorForm(dec);
					
					if (form.ShowDialog(owner) == DialogResult.OK)
						changed = true;

				} // try 2
				finally // finally 2
				{
					if (changed && changeService != null) 
						changeService.OnComponentChanged(dec, null, null, null);
					
				} // finally 2
			
			} // try 1
			
			finally // finally 1
			{
				if (transaction != null)
				{
					if (changed) 
						transaction.Commit();
					else
						transaction.Cancel();
				}
			}// finally 1

			return changed;

		} // EditComponent()
		
		*/

	} //class DataEntryComponentEditor

} //namespace DataEntryFramework.Design
