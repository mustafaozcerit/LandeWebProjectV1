using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class SertifikalarModel
    {
        public string WebDokumanAdi { get; set; }
        public byte[] fotograf { get; set; }

        public string Oid { get; set; }

        public string EngWebDokumanAdi { get; set; }
        public string url { get; set; }

    }
}