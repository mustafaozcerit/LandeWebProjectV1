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
    
    public partial class Banner
    {
        public System.Guid Oid { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
        public Nullable<System.Guid> UrunSerisi { get; set; }
        public byte[] fotograf { get; set; }
        public byte[] fotografENG { get; set; }
        public Nullable<System.Guid> IK_VizyonPolitika { get; set; }
        public Nullable<System.Guid> GizlilikPolitikasi { get; set; }
        public Nullable<System.Guid> CerezPolitikasi { get; set; }
        public Nullable<System.Guid> AydinlatmaMetni { get; set; }
        public Nullable<System.Guid> UrunGrup { get; set; }
        public Nullable<bool> TumSeriler { get; set; }
        public Nullable<System.DateTime> SonGuncellemeTarihi { get; set; }
        public Nullable<System.Guid> AksesuarGrup { get; set; }
    
        public virtual AksesuarGrubu AksesuarGrubu { get; set; }
        public virtual AydinlatmaMetni AydinlatmaMetni1 { get; set; }
        public virtual CerezPolitikasi CerezPolitikasi1 { get; set; }
        public virtual GizlilikPolitikasi GizlilikPolitikasi1 { get; set; }
        public virtual IK_VizyonPolitika IK_VizyonPolitika1 { get; set; }
        public virtual UrunGrubu UrunGrubu { get; set; }
        public virtual UrunSerisi UrunSerisi1 { get; set; }
    }
}