using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class RaporlarModel
    {
        public string WebDokumanAdi { get; set; }
        public byte[] fotograf { get; set; }

        public string Oid { get; set; }
        
        public string EngWebDokumanAdi { get; set; }
    }
}