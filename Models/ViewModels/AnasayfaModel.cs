using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class AnasayfaModel
    {
        public List<Haberler> Haberler { get; set; }

        public List<YoutubeVideo> Videolar { get; set; }

        public Reklamlar Reklamlar { get; set; }
    }
}