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
    
    public partial class HakkimizdaAltGrup
    {
        public System.Guid Oid { get; set; }
        public byte[] fotograf { get; set; }
        public string GrupBaslik { get; set; }
        public string GrupAciklama { get; set; }
        public string EngGrupBaslik2 { get; set; }
        public string EngGrupAciklama { get; set; }
        public Nullable<System.Guid> Hakkimizda { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
        public Nullable<System.DateTime> SonGuncellemeTarihi { get; set; }
    
        public virtual HakkimizdaVeAltBilgi HakkimizdaVeAltBilgi { get; set; }
    }
}
