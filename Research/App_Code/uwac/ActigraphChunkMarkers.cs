using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ActigraphChunkMarkers
/// </summary>

namespace uwac
{

	public class ActigraphChunkMarkers : List<ChunkMarker>
	{

		public ActigraphChunkMarkers(int measureID)
		{
			SQL_utils sql = new SQL_utils("backend");
			//int timepointID = sql.IntScalar_from_SQLstring("select timepointID from tblstudymeas where studymeasID=" + studymeasID.ToString());
			//int measureID = sql.IntScalar_from_SQLstring("select measureID from tblstudymeas where studymeasID=" + studymeasID.ToString());


			List<string> markers = PopulateMarkers(measureID);
			//List<string> markers = new List<string>{
			//	 "-------------------- Subject Properties--------------------"
			//	,"----------------- Actiwatch Data Properties ----------------"
			//	,"--------------------- Analysis Inputs ----------------------"
			//	,"------------------------ Statistics ------------------------"
			//	,"--------------------- Marker/Score List --------------------"
			//	,"-------------------- Epoch-by-Epoch Data -------------------"
			//	};

			//List<int> measureIDs = new List<int> { 4855, 4855, 4855, 3842, -1, 4853 };  //For now Marker/Score List not processed

			for (int i = 0; i < markers.Count; i++)
			{
				string m = markers[i];
				//int smID = studymeasID;
				//int smID = (measureIDs[i] > 0) ? sql.IntScalar_from_SQLstring(
				//	String.Format("select studymeasID from tblstudymeas where measureID={0} and timepointID={1}"
				//	 , measureIDs[i], timepointID)) : -1;

				ChunkMarker cm = new ChunkMarker() { text = m, text_end = PopulateMarkerEnd(m), measureID = measureID };
				this.Add(cm);
			}
			sql.Close();

		}

		public List<string> PopulateMarkers(int measureID)
		{
			List<string> markers = new List<string>();

			if (measureID == 3842)  // All_ActigraphStats
			{
				markers = new List<string>{
				 "------------------------ Statistics ------------------------"
				};
			}
			else if (measureID == 4855)  // All_ActigraphProps
			{
				markers = new List<string>{
				 "-------------------- Subject Properties--------------------"
				,"----------------- Actiwatch Data Properties ----------------"
				,"--------------------- Analysis Inputs ----------------------"
				};

			}
			else if (measureID == 4853)  // All_ActigraphEpoch
			{
				markers = new List<string>{
				"-------------------- Epoch-by-Epoch Data -------------------"
				};
			}


			return markers;
		}

		public string PopulateMarkerEnd(string marker)
		{
			if (marker == "-------------------- Subject Properties--------------------") return "----------------- Actiwatch Data Properties ----------------";
			else if (marker == "----------------- Actiwatch Data Properties ----------------") return "--------------------- Analysis Inputs ----------------------";
			else if (marker == "--------------------- Analysis Inputs ----------------------") return "------------------------ Statistics ------------------------";
			else if (marker == "------------------------ Statistics ------------------------") return "--------------------- Marker/Score List --------------------";
			else if (marker == "-------------------- Epoch-by-Epoch Data -------------------") return "EOF";

			return "EOF";
		}



		public void PopulateIndices(List<string> textlines)
		{

			foreach (ChunkMarker cm in this)
			{
				int index = textlines.FindIndex(x => x.Contains(cm.text));
				int index_end = textlines.FindIndex(x => x.Contains(cm.text_end));


				cm.linenumber_start = index + 1;  //add 1 so it is not zero indexed

				if (index_end == -1) cm.linenumber_end = textlines.Count;
				else if (index_end > index) cm.linenumber_end = index_end;

			}


			//for(int i=0; i < (this.Count - 1); i++)
			//{
			//	this[i].linenumber_end = this[i+1].linenumber_start - 1;
			//}

			//this[(this.Count - 1)].linenumber_end = textlines.Count;
		}

		public void PopulateIndices(DataTable dt)
		{

			foreach (ChunkMarker cm in this)
			{
				int index = dt.AsEnumerable().Select(f => f.Field<string>("Column1")).ToList().FindIndex(x => x == cm.text);
				int index_end = dt.AsEnumerable().Select(f => f.Field<string>("Column1")).ToList().FindIndex(x => x == cm.text_end);

				//cm.linenumber_start = index + 1;  //add 1 so it is not zero indexed
				cm.linenumber_start = index;

				if (index_end == -1) cm.linenumber_end = dt.Rows.Count;
				else if (index_end > index) cm.linenumber_end = index_end - 1;

			}


			//for(int i=0; i < (this.Count - 1); i++)
			//{
			//	this[i].linenumber_end = this[i+1].linenumber_start - 1;
			//}

			//this[(this.Count - 1)].linenumber_end = textlines.Count;
		}

	}

}

