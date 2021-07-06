using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class UrunSeriModel
    {
        public string URL { get; set; }
        public string Baslik { get; set; }
        public string Aciklama { get; set; }
        public byte[] fotograf { get; set; }
        public string KatalogKodu { get; set; }
    }
}