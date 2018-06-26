using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Web.UI;
using System.Web.UI.Design;

namespace DataEntryFramework.Old.Design
{

	public class DataEntryControllerDesigner: System.Web.UI.Design.ControlDesigner
	{

		private DesignerVerbCollection _designerVerbs;
		public override DesignerVerbCollection Verbs 
		{
			get 
			{
				if (_designerVerbs == null)
				{
					_designerVerbs = new DesignerVerbCollection();
					_designerVerbs.Add(new DesignerVerb("Form Builder...", new EventHandler(this.OnFormBuilder)));
					_designerVerbs.Add(new DesignerVerb("Field Editor...", new EventHandler(this.OnFieldEdit)));
				}

				return _designerVerbs;
			}
		}
		
		private void OnFormBuilder(object sender, EventArgs e) 
		{
			DataEntryControllerComponentEditor compEditor = new DataEntryControllerComponentEditor();
			compEditor.EditComponent(Component);
			
		}


		private void OnFieldEdit(object sender, EventArgs e) 
		{
			DataEntryControllerFieldEditor compEditor = new DataEntryControllerFieldEditor();
			compEditor.EditComponent(Component);
			
		}
		
		
		public override string GetDesignTimeHtml() 
		{
			// Retrieve the controls to ensure they are created.
			ControlCollection controls = ((Control)Component).Controls;
			return base.GetDesignTimeHtml();
		}


		public override void Initialize(IComponent component) 
		{
			if (!(component is Control) &&
				!(component is INamingContainer)) 
			{
				throw new ArgumentException(
					"Component must be a container control.", "component");
			}
			base.Initialize(component);
		}
	}
}
