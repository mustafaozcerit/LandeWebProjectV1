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
    
    public partial class aksesuarDeger
    {
        public System.Guid Oid { get; set; }
        public Nullable<System.DateTime> OlusturmaTarihi { get; set; }
        public string OlusturanKisi { get; set; }
        public string Deger { get; set; }
        public string EngDeger { get; set; }
        public Nullable<System.Guid> aksesuar { get; set; }
        public Nullable<System.Guid> degerler { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
        public Nullable<System.DateTime> SonGuncellemeTarihi { get; set; }
    
        public virtual Aksesuar Aksesuar1 { get; set; }
        public virtual Degerler Degerler1 { get; set; }
    }
}
