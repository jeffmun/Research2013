using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;

namespace uwac
{
    /// <summary>
    /// Summary description for utilColor
    /// </summary>
    public class utilColor
    {
        public utilColor()
        {
            //
            // TODO: Add constructor logic here
            //
        }



        class ColorList : IList
        {

            private object[] _contents = new object[8];

            public Color col;
            public List<string> values;
            private int _count; 

            public ColorList()
            {
                _count = 0;
            }

            // IList Members
            public int Add(object value)
            {
                if (_count < _contents.Length)
                {
                    _contents[_count] = value;
                    _count++;

                    return (_count - 1);
                }
                else
                {
                    return -1;
                }
            }

            public void Clear()
            {
                _count = 0;
            }

            public bool Contains(object value)
            {
                bool inList = false;
                for (int i = 0; i < Count; i++)
                {
                    if (_contents[i] == value)
                    {
                        inList = true;
                        break;
                    }
                }
                return inList;
            }

            public int IndexOf(object value)
            {
                int itemIndex = -1;
                for (int i = 0; i < Count; i++)
                {
                    if (_contents[i] == value)
                    {
                        itemIndex = i;
                        break;
                    }
                }
                return itemIndex;
            }

            public void Insert(int index, object value)
            {
                if ((_count + 1 <= _contents.Length) && (index < Count) && (index >= 0))
                {
                    _count++;

                    for (int i = Count - 1; i > index; i--)
                    {
                        _contents[i] = _contents[i - 1];
                    }
                    _contents[index] = value;
                }
            }

            public bool IsFixedSize
            {
                get
                {
                    return true;
                }
            }

            public bool IsReadOnly
            {
                get
                {
                    return false;
                }
            }

            public void Remove(object value)
            {
                RemoveAt(IndexOf(value));
            }

            public void RemoveAt(int index)
            {
                if ((index >= 0) && (index < Count))
                {
                    for (int i = index; i < Count - 1; i++)
                    {
                        _contents[i] = _contents[i + 1];
                    }
                    _count--;
                }
            }

            public object this[int index]
            {
                get
                {
                    return _contents[index];
                }
                set
                {
                    _contents[index] = value;
                }
            }

            // ICollection Members

            public void CopyTo(Array array, int index)
            {
                int j = index;
                for (int i = 0; i < Count; i++)
                {
                    array.SetValue(_contents[i], j);
                    j++;
                }
            }

            public int Count
            {
                get
                {
                    return _count;
                }
            }

            public bool IsSynchronized
            {
                get
                {
                    return false;
                }
            }

            // Return the current instance since the underlying store is not
            // publicly available.
            public object SyncRoot
            {
                get
                {
                    return this;
                }
            }

            // IEnumerable Members

            public IEnumerator GetEnumerator()
            {
                // Refer to the IEnumerator documentation for an example of
                // implementing an enumerator.
                throw new Exception("The method or operation is not implemented.");
            }

            public void PrintContents()
            {
                Console.WriteLine("List has a capacity of {0} and currently has {1} elements.", _contents.Length, _count);
                Console.Write("List contents:");
                for (int i = 0; i < Count; i++)
                {
                    Console.Write(" {0}", _contents[i]);
                }
                Console.WriteLine();
            }

        }


        public static Color GetCellColor(string mode, string status)
        {
            System.Drawing.Color col = new Color();
            List<ColorList> color_list = new List<ColorList>();

            //ColorList[]  color_list = new ColorList()[12]; 


            if (mode == "M")
            {
                color_list.Add(new ColorList() { col = Color.DarkGreen, values = { "D0", "D2" } });
                color_list.Add(new ColorList() { col = Color.ForestGreen, values = { "D1" } });
                color_list.Add(new ColorList() { col = Color.Lime, values = { "TE", "TE." } });
                color_list.Add(new ColorList() { col = Color.DarkRed, values = { "ND" } });
                color_list.Add(new ColorList() { col = Color.Red, values = { "ND.", "ND_" } });
                color_list.Add(new ColorList() { col = Color.DarkOrange, values = { "CK_e", "CK_g", "CK_h", "D_ND", "ND_D1", "ND_D2", "TBC_ND" } });
                color_list.Add(new ColorList() { col = Color.Yellow, values = { "TBC_D1", "TBC_D2" } });
                color_list.Add(new ColorList() { col = Color.Gray, values = { "NA" } });
                color_list.Add(new ColorList() { col = Color.CornflowerBlue, values = { "TBC", "TBC." } });
            }
            else if (mode == "A")
            {
                color_list.Add(new ColorList() { col = Color.ForestGreen, values = { "Pass", "COMP", "Yes" } });
                color_list.Add(new ColorList() { col = Color.Lime, values = { "Sched" } });
                color_list.Add(new ColorList() { col = Color.DarkRed, values = { "ND" } });
                color_list.Add(new ColorList() { col = Color.Red, values = { "Missed", "No", "DC", "NoShow", "Fail" } });
                color_list.Add(new ColorList() { col = Color.Yellow, values = { "Inc/Fup" } });
                color_list.Add(new ColorList() { col = Color.Gray, values = { "NA", "NA-ss" } });
                color_list.Add(new ColorList() { col = Color.CornflowerBlue, values = { "TBD" } });

            }
            else if (mode == "C")
            {
                color_list.Add(new ColorList() { col = Color.ForestGreen, values = { "Comp" } });
            }


            foreach (ColorList collist in color_list)
            {
                if (collist.values.Any(status.Contains)) col = collist.col;
            }


            return col;
        }



    }
}