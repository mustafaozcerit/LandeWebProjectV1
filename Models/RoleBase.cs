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
    
    public partial class RoleBase
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RoleBase()
        {
            this.PersistentPermission = new HashSet<PersistentPermission>();
        }
    
        public System.Guid Oid { get; set; }
        public string Name { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
        public Nullable<int> ObjectType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersistentPermission> PersistentPermission { get; set; }
        public virtual Role Role { get; set; }
        public virtual XPObjectType XPObjectType { get; set; }
    }
}