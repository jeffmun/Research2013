using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Windows.Forms;
using System.Windows.Forms.Design;
using DataEntryFramework;
using System.Data.SqlClient;

namespace DataEntryFramework.Old.Design
{

	public class DataEntryControllerFieldEditor  : WindowsFormsComponentEditor
	{

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

			bool changed = false;

			
			//DataEntryControllerComponentEditorForm form = new DataEntryControllerComponentEditorForm(dec, _cd);
			DataEntryControllerFieldEditorForm form = new DataEntryControllerFieldEditorForm(dec);
			

			if (form.ShowDialog(owner) == DialogResult.OK)
				changed = true;

			return changed;


		}

*/

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

					DataEntryControllerFieldEditorForm form = new DataEntryControllerFieldEditorForm(dec);
					
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

		} // end EditComponent()
		





	} // end class
}
