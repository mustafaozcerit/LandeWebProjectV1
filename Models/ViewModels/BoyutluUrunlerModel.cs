using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class BoyutluUrunlerModel 
    {
        public string URL { get; set; }
        public string Baslik { get; set; }
        public string Aciklama { get; set; }
        public byte[] fotograf { get; set; }

        public string KatalogKodu { get; set; }
        public string Yukseklik { get; set; }
        public string Genislik { get; set; }
        public string Derinlik { get; set; }
        public string Renk { get; set; }
    }
}