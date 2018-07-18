using System;

namespace DataEntryFramework4
{
    public interface IFieldMetadata
    {
        string FldName { get; }
        FieldDataType FieldDataType { get; }
        string FieldLabelText { get; }
        bool IsValueRequired { get; }
        string IsValueRequiredParam { get; }
        bool IsDoubleEntryRequired { get; }
        bool IsReadOnly { get; }
        string MaxVal { get; }
        string MinVal { get; }
        string MissVal { get; }
        string RegEx { get; }
        string RegExDescription { get; }
        string ValidList { get; }
        string FieldNameAndLabel { get; }
    }
}