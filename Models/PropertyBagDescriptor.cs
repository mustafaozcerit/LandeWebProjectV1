//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LandeWebProjectV1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PropertyBagDescriptor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PropertyBagDescriptor()
        {
            this.PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags = new HashSet<PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags>();
        }
    
        public System.Guid Oid { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags> PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags { get; set; }
    }
}
