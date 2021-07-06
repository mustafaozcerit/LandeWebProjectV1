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
    
    public partial class DigerDokumanlar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DigerDokumanlar()
        {
            this.Revizeler = new HashSet<Revizeler>();
            this.Taglar = new HashSet<Taglar>();
        }
    
        public System.Guid Oid { get; set; }
        public Nullable<System.Guid> File { get; set; }
        public Nullable<System.Guid> aksesuar { get; set; }
        public Nullable<System.Guid> parcalar { get; set; }
        public string OlusturanKisi { get; set; }
        public Nullable<bool> Web { get; set; }
        public Nullable<System.Guid> urunAilesi { get; set; }
        public Nullable<System.Guid> urunGrubu { get; set; }
        public Nullable<System.Guid> urunSerisi { get; set; }
        public Nullable<System.Guid> urunler { get; set; }
        public string DokumanAdi { get; set; }
        public string dokumanUzanti { get; set; }
        public Nullable<int> DokumanType { get; set; }
        public Nullable<System.DateTime> OlusturmaTarihi { get; set; }
        public Nullable<int> OptimisticLockField { get; set; }
        public Nullable<int> GCRecord { get; set; }
        public Nullable<bool> onay { get; set; }
        public Nullable<bool> red { get; set; }
        public string OcrText { get; set; }
        public byte[] fotograf { get; set; }
        public string WebDokumanAdi { get; set; }
        public Nullable<bool> EngWeb { get; set; }
        public string EngWebDokumanAdi { get; set; }
        public Nullable<bool> DigerDokumanlarSayfasi { get; set; }
        public Nullable<System.DateTime> SonGuncellemeTarihi { get; set; }
    
        public virtual Aksesuar Aksesuar1 { get; set; }
        public virtual FileData FileData { get; set; }
        public virtual Parcalar Parcalar1 { get; set; }
        public virtual UrunAilesi UrunAilesi1 { get; set; }
        public virtual UrunGrubu UrunGrubu1 { get; set; }
        public virtual Urunler Urunler1 { get; set; }
        public virtual UrunSerisi UrunSerisi1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Revizeler> Revizeler { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Taglar> Taglar { get; set; }
    }
}
