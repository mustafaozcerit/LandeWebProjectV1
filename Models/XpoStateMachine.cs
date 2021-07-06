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
    
    public partial class XpoStateMachine
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public XpoStateMachine()
        {
            this.XpoState = new HashSet<XpoState>();
        }
    
        public System.Guid Oid { get; set; }
        public string Name { get; set; }
        public Nullable<bool> Active { get; set; }
        public string TargetObjectType { get; set; }
        public string StatePropertyName { get; set; }
        public Nullable<System.Guid> StartState { get; set; }
        public Nullable<bool> ExpandActionsInDetailView { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XpoState> XpoState { get; set; }
        public virtual XpoState XpoState1 { get; set; }
    }
}
