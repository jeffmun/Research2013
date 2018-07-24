using System;
using DataEntryFramework;
using System.Collections;
using System.Text.RegularExpressions;

namespace common_wechsleriq
{

    public class WechslerValidator : DataEntryFramework.DefaultValidator
    {

        private Hashtable regEx = new Hashtable();

        private class RegExVal
        {
            public RegExVal(string Regex, string RegexDesc)
            {
                this.Regex = Regex;
                this.RegexDesc = RegexDesc;
            }
            public string Regex;
            public string RegexDesc;
        }

        public WechslerValidator()
        {
            //create data structure for regex's
            const string VOC = "vocraw";
            const string COMP = "compraw";
            const string BD = "bdraw";
            const string OA = "oaraw";
            const string WPPSII = "WPPSI-R";
            const string WISC = "WISC-III";
            const string WAIS = "WAIS-III";


            Hashtable wppsiiRegex = new Hashtable();
            Hashtable wiscRegex = new Hashtable();
            Hashtable waisRegex = new Hashtable();

            wppsiiRegex.Add(VOC, new RegExVal("^([0-9]|[1-3][0-9]|4[0-7]|-999)$", "Value must be between 0-47 or -999"));
            wppsiiRegex.Add(COMP, new RegExVal("^([0-9]|[1-2][0-9]|30|-999)$", "Value must be between 0-30 or -999"));
            wppsiiRegex.Add(BD, new RegExVal("^([0-9]|[1-3][0-9]|4[0-2]|-999)$", "Value must be between 0-42 or -999"));
            wppsiiRegex.Add(OA, new RegExVal("^([0-9]|[1-2][0-9]|3[0-2]|-999)$", "Value must be between 0-32 or -999"));

            wiscRegex.Add(VOC, new RegExVal("^([0-9]|[1-5][0-9]|60|-999)$", "Value must be between 0-60 or -999"));
            wiscRegex.Add(COMP, new RegExVal("^([0-9]|[1-2][0-9]|3[0-6]|-999)$", "Value must be between 0-36 or -999"));
            wiscRegex.Add(BD, new RegExVal("^([0-9]|[1-5][0-9]|6[0-9]|-999)$", "Value must be between 0-69 or -999"));
            wiscRegex.Add(OA, new RegExVal("^([0-9]|[1-3][0-9]|4[0-4]|-999)$", "Value must be between 0-44 or -999"));

            waisRegex.Add(VOC, new RegExVal("^([0-9]|[1-5][0-9]|6[0-6]|-999)$", "Value must be between 0-66 or -999"));
            waisRegex.Add(COMP, new RegExVal("^([0-9]|[1-2][0-9]|3[0-3]|-999)$", "Value must be between 0-33 or -999"));
            waisRegex.Add(BD, new RegExVal("^([0-9]|[1-5][0-9]|6[0-8]|-999)$", "Value must be between 0-68 or -999"));
            waisRegex.Add(OA, new RegExVal("^([0-9]|[1-4][0-9]|5[0-2]|-999)$", "Value must be between 0-52 or -999"));

            regEx.Add(WPPSII, wppsiiRegex);
            regEx.Add(WISC, wiscRegex);
            regEx.Add(WAIS, waisRegex);

        }

        public override bool ValidateForInsert(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            if (!base.ValidateForInsert(dataEntryFields, notifications))
                return false;
            else
                // do test specific field validation
                return ValidateWechsler(dataEntryFields, notifications);
        }


        public override bool ValidateForNoData(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            return base.ValidateForNoData(dataEntryFields, notifications);
        }


        public override bool ValidateForSaveDoubleEntered(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            if (!base.ValidateForSaveDoubleEntered(dataEntryFields, notifications))
                return false;
            else
                // do test specific field validation
                return ValidateWechsler(dataEntryFields, notifications);
        }


        public override bool ValidateForSaveEntering(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            if (!base.ValidateForSaveEntering(dataEntryFields, notifications))
                return false;
            else
                // do test specific field validation
                return ValidateWechsler(dataEntryFields, notifications);
        }


        public override bool ValidateForSaveSingleEntered(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            if (!base.ValidateForSaveSingleEntered(dataEntryFields, notifications))
                return false;
            else
                // do test specific field validation
                return ValidateWechsler(dataEntryFields, notifications);
        }

        public override bool ValidateForScore(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            return base.ValidateForScore(dataEntryFields, notifications);
        }

        public override bool ValidateForVerify(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            if (!base.ValidateForVerify(dataEntryFields, notifications))
                return false;
            else
                // do test specific field validation
                return ValidateWechsler(dataEntryFields, notifications);

        }


        public override bool ValidateForVerifyCorrection(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            if (!base.ValidateForVerifyCorrection(dataEntryFields, notifications))
                return false;
            else
                // do test specific field validation
                return ValidateWechsler(dataEntryFields, notifications);
        }


        // perform iqtest specific field regex validation
        protected bool ValidateWechsler(System.Collections.ArrayList dataEntryFields, System.Collections.ArrayList notifications)
        {
            string sIQtest = LookupIQTest();

            bool valid = true;

            RegExVal regExVal = null;

            foreach (DataFieldControl dfc in dataEntryFields)
            {
                // trap errors
                try
                {

                    // only validate raw score fields
                    string fieldID = dfc.ID;
                    if (fieldID == "vocraw" || fieldID == "compraw" || fieldID == "bdraw" || fieldID == "oaraw")
                    {

                        //get regular express to test agains
                        regExVal = (RegExVal)((Hashtable)regEx[sIQtest])[fieldID];

                        // only validate if it contains something
                        if (dfc.FieldTextBoxText.Trim() != string.Empty)
                        {
                            if (Regex.IsMatch(dfc.FieldTextBoxText, regExVal.Regex) == false)
                            {
                                string err = regExVal.RegexDesc;

                                // set a default value for error text if none specified
                                if (err == string.Empty) { err = "Invalid value."; }

                                dfc.AddError(err);
                                notifications.Add(string.Format("Error in field {0}. ", Shorten(dfc.FieldLabelText)) + err);
                                valid = false;
                            }
                        }
                    }

                } // try
                catch (Exception ex)
                {
                    notifications.Add(string.Format("Unexpected error in ValidateRegEx() while validating {0}: {1}", Shorten(dfc.FieldLabelText), ex.Message));
                    valid = false;

                    //exit loop
                    break;
                }
            }

            return valid;

        }

        private string LookupIQTest()
        {
            //search through all existing fields for one
            //called 'iqtest'.  Return its text.
            string result = string.Empty;
            foreach (DataFieldControl dfc in DataEntryController.AllDataFields)
            {
                if (dfc.ID == "iqtest")
                {
                    result = dfc.FieldTextBoxText;
                    break;
                }
            }
            return result;
        }

    }
}

