using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;


namespace uwac.trk {
	/// <summary>
	/// Summary description for color
	/// </summary>
	public class color
	{
		public color()
		{
			//
			// TODO: Add constructor logic here
			//

		}


		public enum StatusType
		{
			Subject = 1,
			Action = 2,
			Measure = 3
		}


		private static Color GetActionStatus_Color(string ActionStatus, int amt)
			{
				float amount = (100 - amt) / 100f;

				Color color = new Color();
				switch (ActionStatus)
				{
					case "AgedOut":
						color = Color.DarkRed;
						break;
					case "Canceled":
						color = Color.Red;
						break;
					case "Complete":
						color = Color.ForestGreen;
						break;
					case "Contact Later":
						color = Color.Orange;
						break;
					case "Declined SPARK":
						color = Color.Red;
						break;
					case "Declined to Complete":
						color = Color.Red;
						break;
					case "Fail":
						color = Color.Red;
						break;
					case "In Process":
						color = Color.Orange;
						break;
					case "In Progress":
						color = Color.Orange;
						break;
					case "Incomplete/Need to Follow Up":
						color = Color.Orange;
						break;
					case "Incomplete/No need to Follow Up":
						color = Color.Orange;
						break;
					case "Incomplete/See Notes":
						color = Color.Orange;
						break;
					case "Ineligible":
						color = Color.Red;
						break;
					case "Missed":
						color = Color.Red;
						break;
					case "NA":
						color = Color.Gray;
						break;
					case "NA - old DB":
						color = Color.Gray;
						break;
					case "NA Due to Subj. Status":
						color = Color.Gray;
						break;
					case "NA for Group":
						color = Color.Gray;
						break;
					case "NA_Not going to use anymore":
						color = Color.Gray;
						break;
					case "Need to Follow Up":
						color = Color.Orange;
						break;
					case "No":
						color = Color.Red;
						break;
					case "No Show":
						color = Color.Red;
						break;
					case "No, but interested":
						color = Color.YellowGreen;
						break;
					case "No-DQ":
						color = Color.Red;
						break;
					case "No-Family Withdrew":
						color = Color.Gray;
						break;
					case "Not Recorded":
						color = Color.Red;
						break;
					case "Not Requested":
						color = Color.Red;
						break;
					case "Not Yet Scheduled":
						color = Color.CornflowerBlue;
						break;
					case "Not_Yet_Used_in_Study":
						color = Color.Gray;
						break;
					case "Pass":
						color = Color.ForestGreen;
						break;
					case "Possible/Follow Up":
						color = Color.Yellow;
						break;
					case "Provided":
						color = Color.ForestGreen;
						break;
					case "Requested":
						color = Color.ForestGreen;
						break;
					case "Scheduled":
						color = Color.Lime;
						break;
					case "Signed Prior Consent":
						color = Color.ForestGreen;
						break;
					case "Tentative":
						color = Color.Yellow;
						break;
					case "To Be Done":
						color = Color.CornflowerBlue;
						break;
					case "To be scheduled":
						color = Color.CornflowerBlue;
						break;
					case "To Review":
						color = Color.Lime;
						break;
					case "Unknown":
						color = Color.Yellow;
						break;
					case "Wait to pass to SPARK":
						color = Color.Gray;
						break;
					case "Withdrew":
						color = Color.Gray;
						break;
					case "Yes":
						color = Color.ForestGreen;
						break;
					case "Yes - Home Visit":
						color = Color.ForestGreen;
						break;
					case "YES - Informed":
						color = Color.ForestGreen;
						break;
					case "Yes - Lab Visit":
						color = Color.ForestGreen;
						break;
					case "YES - Not Informed":
						color = Color.ForestGreen;
						break;
					case "Yes, passed to SPARK":
						color = Color.Green;
						break;
					default:
						color = Color.White;
						break;

			}

			return ChangeColorBrightness(color, amount);
			}


		private static Color GetMeasStatus_Color(string sms_dd_status, int amt)
		{
			float amount = (100 - amt) / 100f;

			Color color = new Color();
			switch (sms_dd_status)
			{
				case "??":
					color = Color.Magenta;
					break;

				case "CK_e":
					color = Color.DarkOrange;
					break;

				case "CK_g":
					color = Color.DarkOrange;
					break;

				case "CK_h":
					color = Color.DarkOrange;
					break;

				case "D_ND":
					color = Color.DarkOrange;
					break;

				case "DC":
					color = Color.DarkGreen;
					break;

				case "D0":
					color = Color.DarkGreen;
					break;

				case "D1":
					color = Color.ForestGreen;
					break;

				case "D2":
					color = Color.DarkGreen;
					break;

				case "NA":
					color = Color.Gray;
					break;

				case "NA_D1":
					color = Color.DarkOrange;
					break;

				case "NA_D2":
					color = Color.DarkOrange;
					break;

				case "NA_ND":
					color = Color.DarkRed;
					break;

				case "ND":
					color = Color.DarkRed;
					break;

				case "ND.":
					color = Color.Red;
					break;

				case "ND??":
					color = Color.Magenta;
					break;

				case "ND_":
					color = Color.Red;
					break;

				case "ND_D1":
					color = Color.DarkOrange;
					break;

				case "ND_D2":
					color = Color.DarkOrange;
					break;

				case "NDL":
					color = Color.Red;
					break;

				case "TBC":
					color = Color.CornflowerBlue;
					break;

				case "TBC.":
					color = Color.CornflowerBlue;
					break;

				case "TBC_D1":
					color = Color.Yellow;
					break;

				case "TBC_D2":
					color = Color.Yellow;
					break;

				case "TBC_ND":
					color = Color.DarkOrange;
					break;

				case "TE":
					color = Color.Lime;
					break;

				case "TE.":
					color = Color.Lime;
					break;
				default:
					color = Color.White;
					break;


			}

			return ChangeColorBrightness(color, amount);
			//return color;
		}


		private static Color GetSubjStatus_Color(string subjstatus, int amt)
		{
			float amount = (100 - amt) / 100f;

			Color color = new Color();
			switch (subjstatus)
			{
				case "To Be Scheduled":
					color = Color.CornflowerBlue;
					break;

				case "Active":
					color = Color.Lime;
					break;
					
				case "Inactive":
					color = Color.DarkOrange;
					break;

				case "Finished":
					color = Color.DarkGreen;
					break;

				case "Not Participating":
					color = Color.Gray;
					break;

					
				case "DQ":
					color = Color.Red;
					break;
					
		
				default:
					color = Color.White;
					break;


			}

			return ChangeColorBrightness(color, amount);
			//return color;
		}


		public static Color GetStatus_Color(StatusType type, string status)
		{
			return GetStatus_Color(type, status, 100);
		}

		public static Color GetStatus_Color(StatusType type, string status, int amt)
		{
			if (status == null || status == "")
			{
				return Color.White;
			}
			else
			{
				Color newcolor = Color.White;
				switch (type)
				{
					case StatusType.Subject:
						newcolor = GetSubjStatus_Color(status, amt);
						break;
					case StatusType.Action:
						newcolor = GetActionStatus_Color(status, amt);
						break;
					case StatusType.Measure:
						newcolor = GetMeasStatus_Color(status, amt);
						break;

				}
				return newcolor;

			}
		}

		

		/// <summary>
		/// Creates color with corrected brightness.
		/// </summary>
		/// <param name="color">Color to correct.</param>
		/// <param name="correctionFactor">The brightness correction factor. Must be between -1 and 1. 
		/// Negative values produce darker colors.</param>
		/// <returns>
		/// Corrected <see cref="Color"/> structure.
		/// </returns>
		public static Color ChangeColorBrightness(Color color, float correctionFactor)
		{
			float red = (float)color.R;
			float green = (float)color.G;
			float blue = (float)color.B;

			if (correctionFactor < 0)
			{
				correctionFactor = 1 + correctionFactor;
				red *= correctionFactor;
				green *= correctionFactor;
				blue *= correctionFactor;
			}
			else
			{
				red = (255 - red) * correctionFactor + red;
				green = (255 - green) * correctionFactor + green;
				blue = (255 - blue) * correctionFactor + blue;
			}

			return Color.FromArgb(color.A, (int)red, (int)green, (int)blue);
		}



		public static int GetColorLevel()
		{
			SQL_utils sql = new SQL_utils("backend");
			int colorlevel = 50;  //use 50% as default 
			try
			{
				colorlevel = sql.IntScalar_from_SQLstring("exec trk.spGet_ColorLevel_for_User ");
			}
			catch (Exception) { };
			sql.Close();
			return colorlevel;
		}


	}

}