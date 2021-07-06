using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LandeWebProjectV1.Models.ViewModels
{
    public class BaseModel
    {
        // GET: BaseModel
        public LayoutModel layout { get; set; }

        public AnasayfaModel AnasayfaModel { get; set; }

        public List<UrunModel> urunModel { get; set; }
        public List<UrunSeriModel> seriModel { get; set; }
        public List<AksesuarDetailModel> aksesuarDetail { get; set; }
        public List<ProductGrup> productGrup { get; set; }
        public List<ProductSeri> productSeri { get; set; }
        public string SayfaLinkBaslik { get; set; }
        public string SayfaAciklama { get; set; }

        public List<KatalogModel> katalogModels { get; set; }

        public List<TeknikSartnameModel> teknikSartnameModels { get; set; }

        public List<SertifikalarModel> sertifikalarModels { get; set; }

        public List<KaliteDokumanlariModel> kaliteDokumanlariModels { get; set; }

        public List<RaporlarModel> raporlarModels { get; set; }

        public List<GenelKatalogModel> genelKatalogModels { get; set; }
        public List<KatalogBaslikModel> katalogBaslikModels { get; set; }

        public List<VideoBaslikModel> videoBaslikModels { get; set; }

        public List<VideoModel> videoModels { get; set; }
        public List<BannerModel> bannerModels { get; set; }
        public List<UrunModelDetail> urunmodelDetails { get; set; }

        public GenelBilgiler genelBilgiler { get; set; }
        public IletisimModel iletisimModel { get; set; }

        public SearchModel search { get; set; }
        public List<YonetimKadrosu> aboutUsModels { get; set; }

        public HakkimizdaVeAltBilgi altBilgiModel { get; set; }
    }
}