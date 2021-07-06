using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class LayoutModel
    {
        public string KurumsalLogoKullanimi { get; set; }
        public List<Kabinetler> kabinetler { get; set; }
        public List<VeriMerkezi> veriMerkezi { get; set; }
        public List<Akseuarlar> akseuarlar { get; set; }
        public List<EndustriyelUygulamalar> endustriyelUygulamalar { get; set; }
        public List<UzaktanErisimSistemleri> uzaktanErisimSistemleri { get; set; }
        public List<GucDagitimUniteleri> gucDagitimUniteleri { get; set; }
        public List<HomeOffice> homeOffice { get; set; }
        public string footerAciklama { get; set; }
    }

    public class Kabinetler
    {
        public string Baslik { get; set; }

        public string URL { get; set; }
    }

    public class VeriMerkezi
    {
        public string Baslik { get; set; }

        public string URL { get; set; }
    }
    public class Akseuarlar
    {
        public string Baslik { get; set; }

        public string URL { get; set; }

    }

    public class EndustriyelUygulamalar
    {
        public string Baslik { get; set; }

        public string URL { get; set; }
    }
    public class UzaktanErisimSistemleri
    {
        public string Baslik { get; set; }

        public string URL { get; set; }
    }
    public class GucDagitimUniteleri
    {
        public string Baslik { get; set; }

        public string URL { get; set; }
    }
    public class HomeOffice
    {
        public string Baslik { get; set; }

        public string URL { get; set; }
    }
}