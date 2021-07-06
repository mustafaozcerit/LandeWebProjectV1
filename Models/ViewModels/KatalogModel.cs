using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class KatalogModel
    {
        public string uRL { get; set; }
        public string baslik { get; set; }
        public string katalogAdi { get; set; }
        public byte[] fotograf { get; set; }

        public FileData katalog { get; set; }
        public string Oid { get; set; }

        public string Baslikeng { get; set; }

        public string EngWebDokumanAdi { get; set; }
    }
}