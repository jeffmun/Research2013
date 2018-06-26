using System;

namespace DataEntryFramework3
{
    public interface IFieldMetadata
    {
        string DatabaseField { get; }
        FieldDataType FieldDataType { get; }
        string FieldLabelText { get; }
        bool IsValueRequired { get; }
        string IsValueRequiredParam { get; }
        string MaxVal { get; }
        string MinVal { get; }
        string MissVal { get; }
        string RegEx { get; }
        string RegExDescription { get; }
        string ValidList { get; }
    }
}