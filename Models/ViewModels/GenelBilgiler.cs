using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class GenelBilgiler
    {
        public string Baslik { get; set; }
        public string Baslik2 { get; set; }
        public string[] Aciklama1 { get; set; }
        public string[] Aciklama2 { get; set; }
        public string[] Aciklama3 { get; set; }
        public List<hkAltGrup> ikGrup { get; set; }
        public List<hkAltGrup> cerezGrup { get; set; }
        public List<hkAltGrup> haberGrup { get; set; }
        public List<hkAltGrup> GizlilikGrup { get; set; }
        public List<hkAltGrup> kvkGrup { get; set; }

    }
    public class hkAltGrup
    {
        public string GrupBaslik { get; set; }
        public string Aciklama { get; set; }
        public byte[] fotograf { get; set; }
    }
}