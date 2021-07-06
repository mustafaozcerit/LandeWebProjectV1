using LandeWebProjectV1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Drawing;
using System.Security.Cryptography;
using System.Data.Entity;
using System.Runtime.CompilerServices;
using System.Data.SqlTypes;
using Org.BouncyCastle.Crypto;
using System.Configuration;
using System.Net.Http.Headers;
using System.Web;
using System.Reflection.Emit;
using Microsoft.Ajax.Utilities;
using System.IO;
using LandeWebProjectV1.Models.ViewModels;
using System.Threading.Tasks;

namespace LandeWebProjectV1.Controllers
{
    public class ProductGroupController : Controller
    {
        public class SearchBox
        {
            public string SearchValue { get; set; }
        }
        public async Task<BaseModel> Layout(string dil)
        {

            BaseModel baseModel = new BaseModel();
            LayoutModel layout = new LayoutModel();
            layout.akseuarlar = new List<Akseuarlar>();
            layout.endustriyelUygulamalar = new List<EndustriyelUygulamalar>();
            layout.gucDagitimUniteleri = new List<GucDagitimUniteleri>();
            layout.kabinetler = new List<Kabinetler>();
            layout.uzaktanErisimSistemleri = new List<UzaktanErisimSistemleri>();
            layout.veriMerkezi = new List<VeriMerkezi>();
            layout.homeOffice = new List<HomeOffice>();
            List<UrunGrubu> urunGrubu = new List<UrunGrubu>();
            List<UrunSerisi> urunSerisi = new List<UrunSerisi>();
            List<AksesuarGrubu> aksesuarGrubu = new List<AksesuarGrubu>();

            baseModel.layout = layout;
            switch (dil)
            {
                case "en":
                    Guid footerOid = Guid.Parse("E447425A-9D92-4A3D-AF78-0C11F00CF190");
                    HeaderFooter footer = db.HeaderFooter.Where(y => y.Oid == footerOid).FirstOrDefault();
                    layout.footerAciklama = footer.EngAltBilgi;

                    urunGrubu = db.UrunGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    urunSerisi = db.UrunSerisi.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    aksesuarGrubu = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).Take(5).ToList();
                    ViewData["GenelKatalog"] = db.Kataloglar.Where(x => x.GCRecord == null && x.EngWeb == true && x.EngLandeGenelKatalog == true).OrderBy(x => x.index).Take(5).ToList();
                    foreach (var item in urunGrubu)
                    {
                        switch (item.urunAilesi.ToString().ToUpper())
                        {
                            case "C145E526-AF17-49AC-B046-BFC9147E9052":
                                Kabinetler kabinetler = new Kabinetler();
                                kabinetler.Baslik = item.EngUrunGrubuAdi;
                                kabinetler.URL = "en/cabinets/" + item.EngWebUrl;

                                baseModel.layout.kabinetler.Add(kabinetler);
                                break;

                        }
                    }
                    foreach (var item in urunSerisi)
                    {
                        VeriMerkezi veriMerkezi = new VeriMerkezi();
                        EndustriyelUygulamalar endustriyelUygulamalar = new EndustriyelUygulamalar();
                        UzaktanErisimSistemleri uzaktanErisimSistemleri = new UzaktanErisimSistemleri();
                        GucDagitimUniteleri gucDagitimUniteleri = new GucDagitimUniteleri();
                        HomeOffice homeOffice = new HomeOffice();
                        string url = "";
                        switch (item.urunAilesi.ToString().ToUpper())
                        {
                            case "513C1AE6-115B-49EE-BB09-E4209527929C"://
                                veriMerkezi.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                veriMerkezi.URL = "en/data_center_solutions/" + url;
                                baseModel.layout.veriMerkezi.Add(veriMerkezi);
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543"://
                                veriMerkezi.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                veriMerkezi.URL = "en/data_center_solutions/" + url;
                                baseModel.layout.veriMerkezi.Add(veriMerkezi);
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442"://
                                endustriyelUygulamalar.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                endustriyelUygulamalar.URL = "en/industrial_applications_and_security_systems/" + url;
                                baseModel.layout.endustriyelUygulamalar.Add(endustriyelUygulamalar);
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90"://
                                endustriyelUygulamalar.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                endustriyelUygulamalar.URL = "en/industrial_applications_and_security_systems/" + url;
                                baseModel.layout.endustriyelUygulamalar.Add(endustriyelUygulamalar);
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E"://
                                uzaktanErisimSistemleri.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                uzaktanErisimSistemleri.URL = "en/remote_management_systems/" + url;
                                baseModel.layout.uzaktanErisimSistemleri.Add(uzaktanErisimSistemleri);

                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821"://568E233E-6EAF-4DF3-AC2C-954DDF609C36
                                gucDagitimUniteleri.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                gucDagitimUniteleri.URL = "en/power_distribution_units/" + url;
                                baseModel.layout.gucDagitimUniteleri.Add(gucDagitimUniteleri);
                                break;
                            case "A486842E-A247-4B67-A2E4-EBD34396E393":
                                homeOffice.Baslik = item.EngUrunSerisiAdi;
                                url = item.EngWebUrl;
                                homeOffice.URL = "en/lande_home_office_products/" + url;
                                baseModel.layout.homeOffice.Add(homeOffice);
                                break;
                        }

                    }
                    foreach (var item in aksesuarGrubu)
                    {
                        Models.ViewModels.Akseuarlar akseuarlar = new Models.ViewModels.Akseuarlar();
                        akseuarlar.Baslik = item.EngAksesuarGrupAdi;
                        string url = item.EngWebUrl;
                        akseuarlar.URL = "en/accessories/" + url;
                        baseModel.layout.akseuarlar.Add(akseuarlar);
                       
                    }



                    break;
                case "tr":
                    Guid footerOidEng = Guid.Parse("E447425A-9D92-4A3D-AF78-0C11F00CF190");
                    HeaderFooter footerEng = db.HeaderFooter.Where(y => y.Oid == footerOidEng).FirstOrDefault();
                    layout.footerAciklama = footerEng.AltBilgi;

                    urunGrubu = db.UrunGrubu.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();
                    urunSerisi = db.UrunSerisi.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();
                    aksesuarGrubu = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).Take(5).ToList();
                    ViewData["GenelKatalog"] = db.Kataloglar.Where(x => x.GCRecord == null && x.LandeGenelKatalog == true).OrderBy(x => x.index).Take(5).ToList();

                    foreach (var item in urunGrubu)
                    {
                        switch (item.urunAilesi.ToString().ToUpper())
                        {
                            case "C145E526-AF17-49AC-B046-BFC9147E9052":
                                Kabinetler kabinetler = new Kabinetler();
                                kabinetler.Baslik = item.UrunGrubuAdi;
                                kabinetler.URL = "tr/kabinetler/" + item.WebUrl;

                                baseModel.layout.kabinetler.Add(kabinetler);
                                break;

                        }
                    }

                    foreach (var item in urunSerisi)
                    {
                        VeriMerkezi veriMerkezi = new VeriMerkezi();
                        EndustriyelUygulamalar endustriyelUygulamalar = new EndustriyelUygulamalar();
                        UzaktanErisimSistemleri uzaktanErisimSistemleri = new UzaktanErisimSistemleri();
                        GucDagitimUniteleri gucDagitimUniteleri = new GucDagitimUniteleri();
                        HomeOffice homeOffice = new HomeOffice();
                        string Link = "";
                        switch (item.urunAilesi.ToString().ToUpper())
                        {

                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                veriMerkezi.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                veriMerkezi.URL = "tr/veri_merkezi_cozumleri/" + Link;
                                baseModel.layout.veriMerkezi.Add(veriMerkezi);
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                veriMerkezi.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                veriMerkezi.URL = "tr/veri_merkezi_cozumleri/" + Link;
                                baseModel.layout.veriMerkezi.Add(veriMerkezi);
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                endustriyelUygulamalar.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                endustriyelUygulamalar.URL = "tr/endustriyel_uygulamalar_ve_guvenlik_sistemleri/" + Link;
                                baseModel.layout.endustriyelUygulamalar.Add(endustriyelUygulamalar);
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                endustriyelUygulamalar.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                endustriyelUygulamalar.URL = "tr/endustriyel_uygulamalar_ve_guvenlik_sistemleri/" + Link;
                                baseModel.layout.endustriyelUygulamalar.Add(endustriyelUygulamalar);
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                uzaktanErisimSistemleri.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                uzaktanErisimSistemleri.URL = "tr/uzaktan_erisim_sistemleri/" + Link;
                                baseModel.layout.uzaktanErisimSistemleri.Add(uzaktanErisimSistemleri);
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                gucDagitimUniteleri.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                gucDagitimUniteleri.URL = "tr/guc_dagitim_uniteleri/" + Link;
                                baseModel.layout.gucDagitimUniteleri.Add(gucDagitimUniteleri);
                                break;
                            case "A486842E-A247-4B67-A2E4-EBD34396E393":
                                homeOffice.Baslik = item.UrunSerisiAdi;
                                Link = item.WebUrl;
                                homeOffice.URL = "tr/lande_home_office_urunleri/" + Link;
                                baseModel.layout.homeOffice.Add(homeOffice);
                                break;
                        }


                    }
                    List<Akseuarlar> akseuarlar1 = new List<Akseuarlar>();
                    foreach (var item in aksesuarGrubu)
                    {
                        Models.ViewModels.Akseuarlar akseuarlar = new Models.ViewModels.Akseuarlar();
                        akseuarlar.Baslik = item.AksesuarGrupAdi;
                        String Link = item.WebUrl;
                        akseuarlar.URL = "tr/aksesuarlar/" + Link;
                        akseuarlar1.Add(akseuarlar);


                    }
                    baseModel.layout.akseuarlar = akseuarlar1;
                    break;

            }








            return baseModel;

            //switch (dil)
            //{
            //    case "TR":
            //        ViewData["LayoutList"] = db.UrunGrubu.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();

            //        ViewData["LayoutTumSeri"] = db.UrunSerisi.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();

            //        ViewData["AksGroup"] = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).Take(10).ToList();

            //        ViewData["GenelKatalog"] = db.Kataloglar.Where(x => x.GCRecord == null && x.LandeGenelKatalog == true).Take(10).ToList();

            //        break;

            //    case "ENG":
            //        ViewData["LayoutList"] = db.UrunGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();

            //        ViewData["LayoutTumSeri"] = db.UrunSerisi.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();

            //        ViewData["AksGroup"] = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).Take(10).ToList();

            //        ViewData["GenelKatalog"] = db.Kataloglar.Where(x => x.GCRecord == null && x.EngLandeGenelKatalog == true).Take(10).ToList();

            //        break;

            //    default:
            //        ViewData["LayoutList"] = db.UrunGrubu.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();

            //        ViewData["LayoutTumSeri"] = db.UrunSerisi.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();

            //        ViewData["AksGroup"] = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).Take(10).ToList();

            //        ViewData["GenelKatalog"] = db.Kataloglar.Where(x => x.GCRecord == null && x.LandeGenelKatalog == true).Take(10).ToList();


            //        break;
            //}
        }

        // GET: ProductGroup

        private readonly test3Entities db = new test3Entities();
        public static string urunOidForAks;
        public static string urunSerisiOid;
        public static List<BoyutluUrunlerModel> BUM = new List<BoyutluUrunlerModel>(); // Boyutlu Ürünler içine Kaydedilecek.


        public async Task<ActionResult> Index(string dil, BaseModel baseModel)
        {

            dil = dil == null ? "tr" : dil;
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            AnasayfaModel anasayfaModel = new AnasayfaModel();
            anasayfaModel.Haberler = new List<Haberler>();
            anasayfaModel.Reklamlar = new Reklamlar();
            anasayfaModel.Videolar = new List<YoutubeVideo>();
            baseModel.AnasayfaModel = anasayfaModel;

            switch (dil)
            {
                case "tr":
                    baseModel.AnasayfaModel.Haberler = db.Haberler.Where(x => x.GCRecord == null && x.Web == 0).OrderBy(x => x.Index).ToList();
                    baseModel.AnasayfaModel.Videolar = db.YoutubeVideo.Where(x => x.GCRecord == null && x.AnasayfadaGoster == true).OrderBy(x => x.Index).ToList();
                    baseModel.AnasayfaModel.Reklamlar = db.Reklamlar.FirstOrDefault(x => x.GCRecord == null && x.Aktif == true && x.Web == 0);

                    break;
                case "en":
                    baseModel.AnasayfaModel.Haberler = db.Haberler.Where(x => x.GCRecord == null && x.Web == 1).OrderBy(x => x.Index).ToList();
                    baseModel.AnasayfaModel.Videolar = db.YoutubeVideo.Where(x => x.GCRecord == null && x.AnasayfadaGoster == true).OrderBy(x => x.Index).ToList();
                    baseModel.AnasayfaModel.Reklamlar = db.Reklamlar.FirstOrDefault(x => x.GCRecord == null && x.Aktif == true && x.Web == 1);
                    break;
            }


            //switch (dil)
            //{
            //    case "TR":

            //        ViewData["HaberlerList"] = db.Haberler.Where(x => x.GCRecord == null && x.Web == 0).OrderBy(x => x.Index).ToList();

            //        ViewData["VideoList"] = db.YoutubeVideo.Where(x => x.GCRecord == null && x.AnasayfadaGoster == true).OrderBy(x => x.Index).ToList();

            //        ViewData["Reklam"] = db.Reklamlar.FirstOrDefault(x => x.GCRecord == null && x.Aktif == true && x.Web == 0);
            //        break;

            //    case "ENG":

            //        ViewData["HaberlerList"] = db.Haberler.Where(x => x.GCRecord == null && x.Web == 1).OrderBy(x => x.Index).ToList();

            //        ViewData["VideoList"] = db.YoutubeVideo.Where(x => x.GCRecord == null && x.AnasayfadaGoster == true).OrderBy(x => x.Index).ToList();

            //        ViewBag.Reklam = db.Reklamlar.FirstOrDefault(x => x.GCRecord == null && x.Aktif == true && x.Web == 1);
            //        break;

            //    default:

            //        ViewData["HaberlerList"] = db.Haberler.Where(x => x.GCRecord == null).OrderBy(x => x.Index).ToList();

            //        ViewData["VideoList"] = db.YoutubeVideo.Where(x => x.GCRecord == null && x.AnasayfadaGoster == true).OrderBy(x => x.Index).OrderBy(x => x.Index).ToList();

            //        ViewBag.Reklam = db.Reklamlar.FirstOrDefault(x => x.GCRecord == null && x.Aktif == true && x.Web == 0);

            //        break;
            //}


            return View(baseModel);
        }

        [HttpPost]
        public async Task<ActionResult> Search(string dil, string keyword, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.seriModel = new List<UrunSeriModel>();
            baseModel.aksesuarDetail = new List<AksesuarDetailModel>();
            switch (dil)
            {
                case "tr":
                    #region TR Search
                    List<Urunler> urunlers = db.Urunler.Where(x => (x.KatalogKodu.Contains(keyword) || x.UrunSerisi1.UrunSerisiAdi.Contains(keyword)) && x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();
                    List<UrunSerisi> urunSeries = db.UrunSerisi.Where(x => x.UrunGrubu1.UrunGrubuAdi.Contains(keyword) && x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();
                    List<Aksesuar> aksesuars = db.Aksesuar.Where(x => (x.AksesuarKodu.Contains(keyword) || x.AksesuarGrubu1.AksesuarGrupAdi.Contains(keyword)) && x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();
                    //List<Kataloglar> katalogs = db.Kataloglar.Where(x => x.KatalogAdi.Contains(keyword) && x.GCRecord == null).OrderBy(x => x.Index).ToList();

                    foreach (UrunSerisi item in urunSeries)
                    {
                        UrunSeriModel um = new UrunSeriModel();
                        um.Baslik = item.UrunSerisiAdi;
                        um.Aciklama = item.Aciklama;
                        WebFotograf foti = db.WebFotograf.FirstOrDefault(x => x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid);
                        //Fotograflar foti = db.Fotograflar.FirstOrDefault(x => x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid);
                        um.fotograf = foti != null ? foti.fotograf : null;
                        string uzanti = "tr";
                        switch (item.UrunAilesi1.Oid.ToString().ToUpper())
                        {
                            case "C145E526-AF17-49AC-B046-BFC9147E9052":
                                uzanti += "/kabinetler/";
                                break;
                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                uzanti += "/veri_merkezi_cozumleri/";
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                uzanti += "/veri_merkezi_cozumleri/";
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                uzanti += "/endustriyel_uygulamalar_ve_guvenlik_sistemleri/";
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                uzanti += "/endustriyel_uygulamalar_ve_guvenlik_sistemleri/";
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                uzanti += "/uzaktan_erisim_sistemleri/";
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                uzanti += "/guc_dagitim_uniteleri/";
                                break;
                            default:
                                break;
                        }
                        uzanti += item.UrunGrubu1.WebUrl + "/" + item.WebUrl;
                        um.URL = uzanti;
                        baseModel.seriModel.Add(um);
                    }
                    foreach (Urunler item in urunlers)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.KatalogKodu;
                        um.Aciklama = item.Aciklama;
                        WebFotograf foti = db.WebFotograf.FirstOrDefault(x => x.GCRecord == null && x.Urunler.Oid == item.Oid);
                        //Fotograflar foti = db.Fotograflar.FirstOrDefault(x => x.GCRecord == null && x.Urunler1.Oid == item.Oid);
                        um.fotograf = foti != null ? foti.fotograf : null;
                        string uzanti = "tr";
                        switch (item.UrunAilesi1.Oid.ToString().ToUpper())
                        {
                            case "C145E526-AF17-49AC-B046-BFC9147E9052":
                                uzanti += "/kabinetler/";
                                break;
                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                uzanti += "/veri_merkezi_cozumleri/";
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                uzanti += "/veri_merkezi_cozumleri/";
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                uzanti += "/endustriyel_uygulamalar_ve_guvenlik_sistemleri/";
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                uzanti += "/endustriyel_uygulamalar_ve_guvenlik_sistemleri/";
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                uzanti += "/uzaktan_erisim_sistemleri/";
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                uzanti += "/guc_dagitim_uniteleri/";
                                break;
                            default:
                                break;
                        }
                        uzanti += item.UrunGrubu1.WebUrl + "/" + item.UrunSerisi1.WebUrl + "/" + item.WebUrl;
                        um.URL = uzanti;
                        baseModel.urunModel.Add(um);
                    }
                    foreach (Aksesuar item in aksesuars)
                    {
                        AksesuarDetailModel um = new AksesuarDetailModel();
                        um.Baslik = item.AksesuarKodu;
                        um.Aciklama = item.Aciklama;
                        //Fotograflar foti = db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid);
                        WebFotograf foti = db.WebFotograf.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid);
                        um.foti = foti == null ? null : foti.fotograf;

                        //string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "SeriUrlBos" : item.WebUrl;
                        string uzanti = "tr/aksesuarlar/" + item.AksesuarGrubu1.WebUrl + "/" + item.WebUrl;
                        um.URL = uzanti;
                        baseModel.aksesuarDetail.Add(um);
                    }
                    //foreach (Kataloglar item in katalogs)
                    //{
                    //    UrunModel um = new UrunModel();
                    //    um.Baslik = item.KatalogAdi;
                    //    um.Aciklama = "";
                    //    um.fotograf = item.fotograf;
                    ////    string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "SeriUrlBos" : item.WebUrl;
                    //    string uzanti = "tr/kabinetler/" + item.WebUrl;
                    //    um.URL = uzanti;
                    //    baseModel.urunModel.Add(um);
                    //}
                    #endregion
                    break;
                case "en":
                    #region ENG Search
                    List<Urunler> urunlerEng = db.Urunler.Where(x => (x.KatalogKodu.Contains(keyword) || x.UrunSerisi1.EngUrunSerisiAdi.Contains(keyword)) && x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    List<UrunSerisi> urunSerieEng = db.UrunSerisi.Where(x => x.UrunGrubu1.EngUrunGrubuAdi.Contains(keyword) && x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    List<Aksesuar> aksesuarEng = db.Aksesuar.Where(x => (x.AksesuarKodu.Contains(keyword) || x.AksesuarGrubu1.EngAksesuarGrupAdi.Contains(keyword)) && x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    //List<Kataloglar> katalogs = db.Kataloglar.Where(x => x.KatalogAdi.Contains(keyword) && x.GCRecord == null).OrderBy(x => x.Index).ToList();

                    foreach (UrunSerisi item in urunSerieEng)
                    {
                        UrunSeriModel um = new UrunSeriModel();
                        um.Baslik = item.EngUrunSerisiAdi;
                        um.Aciklama = item.EngAciklama;
                        WebFotograf foti = db.WebFotograf.FirstOrDefault(x => x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid);
                        um.fotograf = foti != null ? foti.fotograf : null;

                        string uzanti = "en";
                        switch (item.UrunAilesi1.Oid.ToString().ToUpper())
                        {
                            case "C145E526-AF17-49AC-B046-BFC9147E9052":
                                uzanti += "/cabinets/";
                                break;
                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                uzanti += "/data_center_solutions/";
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                uzanti += "/data_center_solutions/";
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                uzanti += "/industrial_applications_and_security_systems/";
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                uzanti += "/industrial_applications_and_security_systems/";
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                uzanti += "/remote_management_systems/";
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                uzanti += "/power_distribution_units/";
                                break;
                            default:
                                break;
                        }
                        uzanti += item.UrunGrubu1.EngWebUrl + "/" + item.EngWebUrl;
                        um.URL = uzanti;
                        baseModel.seriModel.Add(um);
                    }
                    foreach (Urunler item in urunlerEng)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.KatalogKodu;
                        um.Aciklama = item.Aciklama;
                        WebFotograf foti = db.WebFotograf.FirstOrDefault(x => x.GCRecord == null && x.Urunler.Oid == item.Oid);
                        um.fotograf = foti != null ? foti.fotograf : null;
                        string uzanti = "en";
                        switch (item.UrunAilesi1.Oid.ToString().ToUpper())
                        {
                            case "C145E526-AF17-49AC-B046-BFC9147E9052":
                                uzanti += "/cabinets/";
                                break;
                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                uzanti += "/data_center_solutions/";
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                uzanti += "/data_center_solutions/";
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                uzanti += "/industrial_applications_and_security_systems/";
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                uzanti += "/industrial_applications_and_security_systems/";
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                uzanti += "/remote_management_systems/";
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                uzanti += "/power_distribution_units/";
                                break;
                            default:
                                break;
                        }
                        uzanti += item.UrunGrubu1.EngWebUrl + "/" + item.UrunSerisi1.EngWebUrl + "/" + item.EngWebUrl;
                        um.URL = uzanti;
                        baseModel.urunModel.Add(um);
                    }
                    foreach (Aksesuar item in aksesuarEng)
                    {
                        AksesuarDetailModel um = new AksesuarDetailModel();
                        um.Baslik = item.AksesuarKodu;
                        um.Aciklama = item.EngAciklama;
                        //Fotograflar foti = db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid);
                        WebFotograf foti = db.WebFotograf.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid);
                        um.foti = foti == null ? null : foti.fotograf;
                        string uzanti = "en/accessories/" + item.AksesuarGrubu1.EngWebUrl + "/" + item.EngWebUrl;
                        um.URL = uzanti;
                        baseModel.aksesuarDetail.Add(um);
                    }
                    //foreach (Kataloglar item in katalogs)
                    //{
                    //    UrunModel um = new UrunModel();
                    //    um.Baslik = item.KatalogAdi;
                    //    um.Aciklama = "";
                    //    um.fotograf = item.fotograf;
                    ////    string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "SeriUrlBos" : item.WebUrl;
                    //    string uzanti = "en/catalogue/" + item.EngWebUrl;
                    //    um.URL = uzanti;
                    //    baseModel.urunModel.Add(um);
                    //}
                    #endregion
                    break;
                default:
                    break;
            }


            return View(baseModel);
        }

        public ActionResult SearchSayfasi(string Value)
        {
            ViewBag.dene = db.Urunler.Where(x => x.KatalogKodu.Contains(Value) && x.Web == true).ToList();
            return View();
        }

        public async Task<ActionResult> AboutUs(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.genelBilgiler = new GenelBilgiler();
            baseModel.aboutUsModels = new List<YonetimKadrosu>();
            List<YonetimKadrosu> aboutUs = new List<YonetimKadrosu>();
            HakkimizdaVeAltBilgi hakkimizdaVeAltBilgis = new HakkimizdaVeAltBilgi();
            HakkimizdaVeAltBilgi hk = new HakkimizdaVeAltBilgi();
            List<HakkimizdaAltGrup> altgrup = new List<HakkimizdaAltGrup>();
            GenelBilgiler gb = new GenelBilgiler();
            gb.ikGrup = new List<hkAltGrup>();
            gb.haberGrup = new List<hkAltGrup>();
            gb.cerezGrup = new List<hkAltGrup>();
            gb.GizlilikGrup = new List<hkAltGrup>();
            gb.kvkGrup = new List<hkAltGrup>();
            Guid oid = Guid.Parse("56552B45-7BFB-47EE-912C-E34701E0F094");
            hk = db.HakkimizdaVeAltBilgi.Where(y => y.Oid == oid).FirstOrDefault();
            altgrup = db.HakkimizdaAltGrup.Where(y => y.HakkimizdaVeAltBilgi.Oid == oid).ToList();
            aboutUs = db.YonetimKadrosu.Where(x => x.GCRecord == null).ToList();
            hakkimizdaVeAltBilgis = db.HakkimizdaVeAltBilgi.FirstOrDefault(x => x.GCRecord == null);
            switch (dil)
            {
                case "tr":
                    gb.Baslik = hk.HakkimizdaBaslk;
                    gb.Aciklama1 = MetinDuzenle(hk.HakkimizdaAciklama);
                    gb.Baslik2 = hk.HakkimizdaBaslk2;
                    gb.Aciklama2 = MetinDuzenle(hk.HakkimizdaAciklama2);
                    foreach (HakkimizdaAltGrup item in altgrup)
                    {
                        hkAltGrup hkgrup = new hkAltGrup();
                        hkgrup.GrupBaslik = item.GrupBaslik;
                        hkgrup.Aciklama = item.GrupAciklama;
                        hkgrup.fotograf = item.fotograf;
                        switch (item.Oid.ToString().ToUpper())
                        {
                            case "105E9B94-6AD6-4000-BDA7-A26C435220A5":
                                gb.ikGrup.Add(hkgrup);
                                break;
                            case "3C612D39-E3AA-448A-A7FE-0C6432723CF1":
                                gb.haberGrup.Add(hkgrup);
                                break;
                            case "4AEA42AA-3071-4E82-ADAC-EFA05BDE23BC":
                                gb.cerezGrup.Add(hkgrup);
                                break;
                            case "427AF77E-A35D-49C2-86DD-E7265C2AF5FA":
                                gb.GizlilikGrup.Add(hkgrup);
                                break;
                            case "C8F6B38C-4D04-4180-8532-CA860917C248":
                                gb.kvkGrup.Add(hkgrup);
                                break;
                            default:
                                break;
                        }
                    }
                    break;
                case "en":
                    gb.Baslik = hk.EngHakkimizdaBaslk;
                    gb.Aciklama1 = MetinDuzenle(hk.EngHakkimizdaAciklama);
                    gb.Baslik2 = hk.EngHakkimizdaBaslk2;
                    gb.Aciklama2 = MetinDuzenle(hk.EngHakkimizdaAciklama2);
                    foreach (HakkimizdaAltGrup item in altgrup)
                    {
                        hkAltGrup hkgrup = new hkAltGrup();
                        hkgrup.GrupBaslik = item.EngGrupBaslik2;
                        hkgrup.Aciklama = item.EngGrupAciklama;
                        hkgrup.fotograf = item.fotograf;
                        switch (item.Oid.ToString().ToUpper())
                        {
                            case "105E9B94-6AD6-4000-BDA7-A26C435220A5":
                                gb.ikGrup.Add(hkgrup);
                                break;
                            case "3C612D39-E3AA-448A-A7FE-0C6432723CF1":
                                gb.haberGrup.Add(hkgrup);
                                break;
                            case "4AEA42AA-3071-4E82-ADAC-EFA05BDE23BC":
                                gb.cerezGrup.Add(hkgrup);
                                break;
                            case "427AF77E-A35D-49C2-86DD-E7265C2AF5FA":
                                gb.GizlilikGrup.Add(hkgrup);
                                break;
                            case "C8F6B38C-4D04-4180-8532-CA860917C248":
                                gb.kvkGrup.Add(hkgrup);
                                break;
                            default:
                                break;
                        }
                    }
                    break;
                default:
                    break;
            }
            baseModel.aboutUsModels = aboutUs;
            baseModel.genelBilgiler = gb;
            baseModel.altBilgiModel = hakkimizdaVeAltBilgis;
            return View(baseModel);
        }

        [HttpGet]
        public async Task<ActionResult> HR(string dil, BaseModel baseModel)
        {//İnsan Kaynakları ve Vizyon
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.bannerModels = new List<BannerModel>();
            IK_VizyonPolitika ik = new IK_VizyonPolitika();
            GenelBilgiler gb = new GenelBilgiler();
            Guid oid = Guid.Parse("2C1209AE-F691-424F-8A3F-3F2664CC78D6");
            ik = db.IK_VizyonPolitika.Where(y => y.Oid == oid).FirstOrDefault();
            switch (dil)
            {
                case "tr":
                    gb.Baslik = ik.Baslik;
                    gb.Aciklama1 = MetinDuzenle(ik.Vizyonumuz);
                    gb.Aciklama2 = MetinDuzenle(ik.Politikamiz);
                    break;
                case "en":
                    gb.Baslik = ik.EngBaslik;
                    gb.Aciklama1 = MetinDuzenle(ik.EngVizyonumuz);
                    gb.Aciklama2 = MetinDuzenle(ik.Politikamiz);
                    break;
                default:
                    break;
            }
            baseModel.genelBilgiler = gb;

            #region Banner
            Banner Banner = new Banner();
            try
            {
                Banner = db.Banner.Where(z => z.GCRecord == null && z.IK_VizyonPolitika1.Oid == oid).FirstOrDefault();
                BannerModel urunModel = new BannerModel();
                urunModel.fotograf = (dil == "tr") ? Banner.fotograf : Banner.fotografENG;
                baseModel.bannerModels.Add(urunModel);
            }
            catch (Exception)
            {
            }

            #endregion

            return View(baseModel);
        }
        public async Task<ActionResult> Contact(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            Iletisim iletisim = new Iletisim();
            IletisimModel im = new IletisimModel();
            Guid oid = Guid.Parse("4D05053A-6CA7-4CFA-83C2-B9F3C1A5D799");
            iletisim = db.Iletisim.Where(y => y.Oid == oid).FirstOrDefault();
            im.istTelefon = iletisim.IstTelefon;
            im.istFax = iletisim.IstFax;
            im.istAdres = iletisim.IstAdres;
            im.eskTelefon = iletisim.EskTelefon;
            im.eskFax = iletisim.EskFax;
            im.eskAdres = iletisim.EskAdres;
            baseModel.iletisimModel = im;

            return View(baseModel);
        }
        [HttpGet]
        public async Task<ActionResult> Cookies(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.bannerModels = new List<BannerModel>();
            CerezPolitikasi cp = new CerezPolitikasi();
            GenelBilgiler gb = new GenelBilgiler();
            Guid oid = Guid.Parse("29B798C4-6D7D-4C96-A8B7-A82531D28E1B");
            cp = db.CerezPolitikasi.Where(y => y.Oid == oid).FirstOrDefault();
            switch (dil)
            {
                case "tr":
                    gb.Baslik = cp.Baslik;
                    gb.Aciklama1 = MetinDuzenle(cp.Aciklama);
                    break;
                case "en":
                    gb.Baslik = cp.EngBaslik;
                    gb.Aciklama1 = MetinDuzenle(cp.EngAciklama);
                    break;
                default:
                    break;
            }
            baseModel.genelBilgiler = gb;
            #region Banner
            Banner Banner = new Banner();
            try
            {
                Banner = db.Banner.Where(z => z.GCRecord == null && z.CerezPolitikasi1.Oid == oid).FirstOrDefault();
                BannerModel urunModel = new BannerModel();
                urunModel.fotograf = (dil == "tr") ? Banner.fotograf : Banner.fotografENG;
                baseModel.bannerModels.Add(urunModel);
            }
            catch (Exception) { }

            #endregion

            return View(baseModel);
        }
        [HttpGet]
        public async Task<ActionResult> PrivacyNotice(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.bannerModels = new List<BannerModel>();
            GenelBilgiler gb = new GenelBilgiler();
            GizlilikPolitikasi gizlilikPolitikasi = new GizlilikPolitikasi();
            Guid oid = Guid.Parse("C07B380C-57CE-4ECC-B9F6-0D7EB5AC8442");
            gizlilikPolitikasi = db.GizlilikPolitikasi.Where(y => y.Oid == oid).FirstOrDefault();
            switch (dil)
            {
                case "tr":
                    gb.Baslik = gizlilikPolitikasi.Baslik;
                    gb.Aciklama1 = MetinDuzenle(gizlilikPolitikasi.Aciklama);
                    break;
                case "en":
                    gb.Baslik = gizlilikPolitikasi.EngBaslik;
                    gb.Aciklama1 = MetinDuzenle(gizlilikPolitikasi.EngAciklama);
                    break;
                default:
                    break;
            }
            baseModel.genelBilgiler = gb;

            #region Banner
            Banner Banner = new Banner();
            try
            {
                Banner = db.Banner.Where(z => z.GCRecord == null && z.GizlilikPolitikasi1.Oid == oid).FirstOrDefault();
                BannerModel urunModel = new BannerModel();
                urunModel.fotograf = (dil == "tr") ? Banner.fotograf : Banner.fotografENG;
                baseModel.bannerModels.Add(urunModel);
            }
            catch (Exception) { }

            #endregion

            return View(baseModel);
        }
        public string[] MetinDuzenle(string metin)
        {
            metin = metin.Replace("\r\n", "æ");
            string[] metinList = metin.Split('æ');
            return metinList;
        }
        [HttpGet]
        public async Task<ActionResult> PersonalDataProtection(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.bannerModels = new List<BannerModel>();
            AydinlatmaMetni aymet = new AydinlatmaMetni();
            GenelBilgiler gb = new GenelBilgiler();
            Guid oid = Guid.Parse("5DFF2503-27B8-4869-81A7-D19C06B2D94F");
            try
            {
                aymet = db.AydinlatmaMetni.Where(y => y.Oid == oid).FirstOrDefault();
                switch (dil)
                {
                    case "tr":
                        gb.Baslik = aymet.Baslik;
                        gb.Aciklama1 = MetinDuzenle(aymet.Aciklama);
                        gb.Aciklama2 = MetinDuzenle(aymet.Aciklama2);
                        gb.Aciklama3 = MetinDuzenle(aymet.Aciklama3);
                        break;
                    case "en":
                        gb.Baslik = aymet.EngBaslik;
                        gb.Aciklama1 = MetinDuzenle(aymet.EngAciklama);
                        gb.Aciklama2 = MetinDuzenle(aymet.EngAciklama2);
                        gb.Aciklama3 = MetinDuzenle(aymet.EngAciklama3);
                        break;
                    default:
                        break;
                }
            }
            catch (Exception)
            {

            }

            baseModel.genelBilgiler = gb;

            #region Banner
            Banner Banner = new Banner();
            try
            {
                Banner = db.Banner.Where(z => z.GCRecord == null && z.AydinlatmaMetni1.Oid == oid).FirstOrDefault();
                BannerModel urunModel = new BannerModel();
                urunModel.fotograf = (dil == "tr") ? Banner.fotograf : Banner.fotografENG;
                baseModel.bannerModels.Add(urunModel);
            }
            catch (Exception) { }
            #endregion
            return View(baseModel);
        }
        [HttpPost]
        public ActionResult SendEmail(string kisiadi, string comment, string contactEmail, string contactPhone, string contactCompany, string contactPersonType, string contactCountry, string contactSubject, string dil)
        {
            SendContactEmail(kisiadi, comment, contactEmail, contactPhone, contactCompany, contactPersonType, contactCountry, contactSubject, dil);
            return RedirectToAction("Contact");

        }
        public void SendContactEmail(string kisiadi, string comment, string contactEmail, string contactPhone, string contactCompany, string contactPersonType, string contactCountry, string contactSubject, string dil)
        {
            try
            {
                dil = dil.ToLower();
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("ldms@lande.com.tr", "ldms2020!");

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress(contactEmail, kisiadi);

                switch (dil)
                {
                    case "tr":
                        mailMessage.To.Add(new MailAddress("satis@lande.com.tr"));
                        break;
                    case "en":
                        mailMessage.To.Add(new MailAddress("sales@lande.com.tr"));
                        break;
                    default:
                        mailMessage.To.Add(new MailAddress("sales@lande.com.tr"));
                        break;
                }


                //mailMessage.Bcc.Add(new MailAddress());""
                mailMessage.Subject = contactSubject;
                mailMessage.IsBodyHtml = false;

                string body = comment + Environment.NewLine + Environment.NewLine;
                body += kisiadi + Environment.NewLine;
                body += contactPhone + Environment.NewLine;
                body += contactEmail + Environment.NewLine;
                body += contactPersonType;
                //body += contactCompany + " - ";
                //body += contactCountry;
                mailMessage.Body = body;

                client.Send(mailMessage);

            }
            catch (Exception)
            {

            }
        }
        public async Task<ActionResult> Video(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.videoModels = new List<VideoModel>();
            baseModel.videoBaslikModels = new List<VideoBaslikModel>();
            switch (dil)
            {
                case "tr":

                    List<YoutubeVideo> youtubeVideos = db.YoutubeVideo.Where(x => x.GCRecord == null && x.videolarSayfasi != null).OrderBy(x => x.Index).ToList();
                    List<VideolarSayfasi> videolarSayfasis = db.VideolarSayfasi.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();

                    foreach (var item in youtubeVideos)
                    {
                        VideoModel videoModel = new VideoModel();
                        videoModel.Oid = item.Oid.ToString();
                        videoModel.Value = item.Value;
                        videoModel.aciklama = item.aciklama;
                        videoModel.ResimLinki = item.ResimLinki;
                        videoModel.VideolarSayfasi1 = item.VideolarSayfasi1.Oid.ToString();
                        baseModel.videoModels.Add(videoModel);

                    }
                    foreach (var item in videolarSayfasis)
                    {
                        VideoBaslikModel videoBaslikModel = new VideoBaslikModel();
                        videoBaslikModel.Baslik = item.Baslik;
                        videoBaslikModel.Oid = item.Oid.ToString();
                        baseModel.videoBaslikModels.Add(videoBaslikModel);
                    }
                    return View(baseModel);
                case "en":
                    List<YoutubeVideo> engyoutubeVideos = db.YoutubeVideo.Where(x => x.GCRecord == null && x.videolarSayfasi != null).OrderBy(x => x.Index).ToList();
                    List<VideolarSayfasi> engvideolarSayfasis = db.VideolarSayfasi.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();


                    foreach (var item in engyoutubeVideos)
                    {
                        VideoModel videoModel = new VideoModel();
                        videoModel.Oid = item.Oid.ToString();
                        videoModel.Value = item.Value;
                        videoModel.EngAciklama = item.EngAciklama;
                        videoModel.ResimLinki = item.ResimLinki;
                        videoModel.VideolarSayfasi1 = item.VideolarSayfasi1.Oid.ToString();
                        baseModel.videoModels.Add(videoModel);
                    }
                    foreach (var item in engvideolarSayfasis)
                    {
                        VideoBaslikModel videoBaslikModel = new VideoBaslikModel();
                        videoBaslikModel.BaslikEng = item.BaslikEng;
                        videoBaslikModel.Oid = item.Oid.ToString();
                        baseModel.videoBaslikModels.Add(videoBaslikModel);
                    }
                    return View(baseModel);
                default:
                    break;
            }

            return View();
        }
        //public ActionResult _Layout()
        //{
        //    List<UrunGrubu> listlayout = db.UrunGrubu.Where(x => x.GCRecord == null).ToList();
        //    ViewData["LayoutList"] = listlayout;

        //    List<UrunSerisi> listSeri = db.UrunSerisi.Where(x => x.GCRecord == null).ToList();
        //    List<AksesuarGrubu> aksList = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).ToList();
        //    ViewData["AksGroup"] = aksList;
        //    ViewData["LayoutTumSeri"] = listSeri;
        //    List<Urunler> ortamList = db.Urunler.Where(x => x.GCRecord == null && x.Web == true && x.UrunSerisi1.UrunSerisiAdi.Equals("Ortam İzleme ve Yönetim Sistemi")).OrderBy(x => x.Index).ToList();
        //    ViewData["OrtamUrunler"] = ortamList;
        //    List<Kataloglar> genelK = db.Kataloglar.Where(x => x.GCRecord == null && x.LandeGenelKatalog == true).ToList(); ViewData["GenelKatalog"] = genelK;

        //    return View(listlayout);
        //}
        //public ActionResult ProductFamily(string dil)
        //{
        //    dil = dil.ToUpper();
        //    ViewBag.dil = dil;
        //    Layout(dil);
        //    List<UrunAilesi> ProductFamilyList = db.UrunAilesi.Where(x => x.GCRecord == null).ToList();

        //    ViewData["ProductFamily"] = ProductFamilyList;

        //    return View(ProductFamilyList);
        //}

        //public ActionResult ProductGroup()
        //{
        //    List<UrunGrubu> ProductGroupList = db.UrunGrubu.Where(x => x.GCRecord == null).ToList();
        //    ViewData["ProductGroup"] = ProductGroupList;
        //    ViewData["LayoutList"] = ProductGroupList;

        //    List<UrunSerisi> listSeri = db.UrunSerisi.Where(x => x.GCRecord == null).ToList();
        //    ViewData["LayoutTumSeri"] = listSeri;
        //    List<AksesuarGrubu> aksList = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).ToList();
        //    ViewData["AksGroup"] = aksList;
        //    List<Urunler> ortamList = db.Urunler.Where(x => x.GCRecord == null && x.Web == true && x.UrunSerisi1.UrunSerisiAdi.Equals("Ortam İzleme ve Yönetim Sistemi")).OrderBy(x => x.Index).ToList();
        //    ViewData["OrtamUrunler"] = ortamList;
        //    List<Kataloglar> genelK = db.Kataloglar.Where(x => x.GCRecord == null && x.LandeGenelKatalog == true).ToList(); ViewData["GenelKatalog"] = genelK;

        //    return View(ProductGroupList);
        //}
        public async Task<ActionResult> KabinetlerUrunGrubu(string UrunGrubuAdi, string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productGrup = new List<ProductGrup>();
            baseModel.bannerModels = new List<BannerModel>();

            if (string.IsNullOrEmpty(UrunGrubuAdi))
            {
                return View("~/Views/Shared/Error.cshtml");
            }
            else
            {
                try
                {
                    Guid urunGrubuOid = Guid.Empty;

                    UrunGrubu urungrup;
                    switch (dil)
                    {
                        case "tr":
                            try
                            {
                                urungrup = db.UrunGrubu.Where(x => x.GCRecord == null && x.WebUrl.Equals(UrunGrubuAdi)).FirstOrDefault();
                                urunGrubuOid = urungrup.Oid;
                            }
                            catch (Exception)
                            {
                                urungrup = db.UrunGrubu.Where(x => x.GCRecord == null && x.WebUrl.Equals(UrunGrubuAdi)).FirstOrDefault();
                                urunGrubuOid = urungrup.Oid;
                            }
                            baseModel.SayfaLinkBaslik = urungrup.UrunGrubuAdi;

                            ProductGrup pg = new ProductGrup();
                            pg.grupAdi = urungrup.UrunGrubuAdi;
                            pg.grupUrl = "tr/kabinetler/" + urungrup.WebUrl;
                            baseModel.productGrup.Add(pg);

                            List<UrunSerisi> ProductSeriesList = db.UrunSerisi.Where(x => x.UrunGrubu1.Oid == urunGrubuOid && x.GCRecord == null && x.UrunGrubu1 != null && x.UrunGrubu1.UrunGrubuAdi != null && x.Web == true).OrderBy(x => x.Index).ToList();

                            foreach (UrunSerisi item in ProductSeriesList)
                            {
                                UrunModel urunModel = new UrunModel();
                                urunModel.Baslik = item.UrunSerisiAdi;
                                urunModel.Aciklama = item.Aciklama;
                                //urunModel.fotograf = db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.Web == true && x.urunler == null).fotograf;
                                WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid && z.Urunler == null).FirstOrDefault();
                                urunModel.fotograf = Foti == null ? null : Foti.fotograf;
                                string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "SeriUrlBos" : item.WebUrl;
                                urunModel.URL = "tr/kabinetler/" + UrunGrubuAdi + "/" + uzanti;
                                baseModel.urunModel.Add(urunModel);
                            }
                            #region Banner
                            Banner banner = new Banner();
                            BannerModel bannerModel = new BannerModel();
                            try
                            {
                                banner = db.Banner.Where(z => z.GCRecord == null && z.UrunGrup == urunGrubuOid).FirstOrDefault();
                                bannerModel.fotograf = banner.fotograf;
                                baseModel.bannerModels.Add(bannerModel);
                            }
                            catch (Exception) { }
                            #endregion
                            break;
                        case "en":
                            try
                            {
                                urungrup = db.UrunGrubu.Where(x => x.GCRecord == null && x.EngWebUrl.Equals(UrunGrubuAdi)).FirstOrDefault();
                                urunGrubuOid = urungrup.Oid;

                            }
                            catch (Exception)
                            {
                                urungrup = db.UrunGrubu.Where(x => x.GCRecord == null && x.EngWebUrl.Equals(UrunGrubuAdi)).FirstOrDefault();
                                urunGrubuOid = urungrup.Oid;
                            }
                            baseModel.SayfaLinkBaslik = urungrup.EngUrunGrubuAdi;

                            ProductGrup pgEng = new ProductGrup();
                            pgEng.grupAdi = urungrup.EngUrunGrubuAdi;
                            pgEng.grupUrl = "en/cabinets/" + urungrup.EngWebUrl;
                            baseModel.productGrup.Add(pgEng);

                            List<UrunSerisi> engProductSeriesList = db.UrunSerisi.Where(x => x.UrunGrubu1.Oid == urunGrubuOid && x.GCRecord == null && x.UrunGrubu1 != null && x.UrunGrubu1.UrunGrubuAdi != null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                            foreach (UrunSerisi item in engProductSeriesList)
                            {
                                UrunModel urunModel = new UrunModel();
                                urunModel.Baslik = item.EngUrunSerisiAdi;
                                urunModel.Aciklama = item.EngAciklama;
                                //urunModel.fotograf = db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null).fotograf;
                                WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid && z.Urunler == null).FirstOrDefault();
                                urunModel.fotograf = Foti == null ? null : Foti.fotograf;
                                string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "SerialUrlIsNull" : item.EngWebUrl;
                                urunModel.URL = "en/cabinets/" + UrunGrubuAdi + "/" + ENGuzanti;
                                baseModel.urunModel.Add(urunModel);

                            }
                            #region Banner
                            Banner bannerEng = new Banner();
                            BannerModel bannerModelEng = new BannerModel();
                            try
                            {
                                bannerEng = db.Banner.Where(z => z.GCRecord == null && z.UrunGrup == urunGrubuOid).FirstOrDefault();
                                bannerModelEng.fotograf = bannerEng.fotografENG;
                                baseModel.bannerModels.Add(bannerModelEng);
                            }
                            catch (Exception) { }
                            #endregion
                            break;
                        default:
                            break;
                    }

                    return View(baseModel);

                }
                catch (Exception)
                {
                    return View("~/Views/Shared/Error.cshtml");
                }
            }
        }

        public static List<Urunler> AllProducts;
        public ActionResult ProductSeries(Guid urunGrubuOid, string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            Layout(dil);
            if (urunGrubuOid == null)
            {
                return View("~/Views/Shared/Error.cshtml");
            }
            else
            {
                try
                {
                    switch (dil)
                    {
                        case "tr":

                            List<UrunSerisi> ProductSeriesList = db.UrunSerisi.Where(x => x.UrunGrubu1.Oid == urunGrubuOid && x.GCRecord == null && x.UrunGrubu1 != null && x.UrunGrubu1.UrunGrubuAdi != null && x.Web == true).OrderBy(x => x.Index).ToList();
                            ViewData["ProductSeries"] = ProductSeriesList;
                            List<Fotograflar> IndexFoto = new List<Fotograflar>();
                            foreach (UrunSerisi item in ProductSeriesList)
                            {
                                IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.Web == true && x.urunler == null));
                            }

                            ViewData["Fotograflar"] = IndexFoto;
                            break;
                        case "en":
                            List<UrunSerisi> engProductSeriesList = db.UrunSerisi.Where(x => x.UrunGrubu1.Oid == urunGrubuOid && x.GCRecord == null && x.UrunGrubu1 != null && x.UrunGrubu1.UrunGrubuAdi != null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                            ViewData["ProductSeries"] = engProductSeriesList;
                            List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                            foreach (UrunSerisi item in engProductSeriesList)
                            {
                                engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                            }

                            ViewData["Fotograflar"] = engIndexFoto;
                            break;
                        default:
                            break;
                    }

                    return View();

                }
                catch (Exception)
                {
                    return View("~/Views/Shared/Error.cshtml");
                }
            }
        }
        public async Task<ActionResult> Products(string UrunGrubuAdi, string dil, string UrunSerisiAdi, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productGrup = new List<ProductGrup>();
            baseModel.productSeri = new List<ProductSeri>();

            if (string.IsNullOrEmpty(UrunSerisiAdi) || string.IsNullOrEmpty(UrunGrubuAdi))
            {
                return View("~/Views/Shared/Error.cshtml");
            }
            switch (dil)
            {
                case "tr":
                    string urlseri = UrunSerisiAdi;
                    UrunSerisi urunseri = db.UrunSerisi.Where(z => z.WebUrl == UrunSerisiAdi && z.UrunGrubu1.WebUrl == UrunGrubuAdi && z.Web == true).FirstOrDefault();

                    Guid urunSerisiOid = urunseri.Oid;

                    #region Grup Seri Linkleme
                    ProductGrup pg = new ProductGrup();
                    pg.grupAdi = urunseri.UrunGrubu1.UrunGrubuAdi;
                    pg.grupUrl = "tr/kabinetler/" + urunseri.UrunGrubu1.WebUrl;
                    baseModel.productGrup.Add(pg);

                    ProductSeri ps = new ProductSeri();
                    ps.seriAdi = urunseri.UrunSerisiAdi;
                    ps.seriUrl = "tr/kabinetler/" + urunseri.UrunGrubu1.WebUrl + "/" + urunseri.WebUrl;
                    baseModel.productSeri.Add(ps);
                    #endregion


                    baseModel.SayfaLinkBaslik = urunseri.UrunSerisiAdi;
                    baseModel.SayfaAciklama = urunseri.Aciklama;

                    List<Urunler> mainlist = new List<Urunler>();
                    //List<Guid> listboyut = new List<Guid>();
                    List<Urunler> ProductList = db.Urunler.Where(x => x.UrunSerisi1.Oid == urunSerisiOid && x.GCRecord == null && x.UrunSerisi1 != null && x.Web == true).OrderBy(x => x.Boyut1.Genislik.Length).ThenBy(x => x.Boyut1.Genislik).ThenBy(x => x.Boyut1.Derinlik.Length).ThenBy(x => x.Boyut1.Derinlik).ThenBy(x => x.Yukseklik1.Yuksek.Length).ThenBy(x => x.Yukseklik1.Yuksek).ToList();

                    #region BannerModel
                    baseModel.bannerModels = new List<BannerModel>();
                    Banner banner = db.Banner.FirstOrDefault(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid);

                    BannerModel urunModel = new BannerModel();
                    if (banner != null)
                    {
                        urunModel.fotograf = banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    //DropDownlar
                    List<string> result = new List<string>();
                    List<string> resultYukseklik = new List<string>();
                    List<string> resultRenk = new List<string>();


                    //List<Guid> listrenk = new List<Guid>();
                    List<SelectListItem> RenkList = new List<SelectListItem>();
                    List<SelectListItem> YukseklikList = new List<SelectListItem>();
                    List<SelectListItem> boyutlist = new List<SelectListItem>();



                    foreach (var urunler in ProductList)
                    {
                        if (urunler.Boyut1 != null)
                        {
                            String txt = urunler.Boyut1.Genislik + "*" + urunler.Boyut1.Derinlik;
                            if (urunler.Boyut1.Derinlik != "" && !result.Contains(txt))
                            {
                                result.Add(txt);
                            }
                        }

                        if (urunler.Renk1 != null)
                        {
                            String txt = urunler.Renk1.renk1;
                            if (urunler.Renk1.renk1 != "" && !resultRenk.Contains(txt))
                            {
                                resultRenk.Add(txt);
                            }
                        }

                        if (urunler.Yukseklik1 != null)
                        {
                            String txt2 = urunler.Yukseklik1.Yuksek;

                            string txt = txt2;
                            if (urunler.Yukseklik1.Yuksek != "" && !resultYukseklik.Contains(txt))
                            {
                                resultYukseklik.Add(txt);
                            }
                        }

                    }

                    boyutlist.Add(new SelectListItem() { Text = "Genişlik * Derinlik", Value = "Boyutlar" });
                    result.ForEach(x => boyutlist.Add(new SelectListItem() { Text = x, Value = x }));
                    ViewData["Boyut"] = boyutlist;

                    RenkList.Add(new SelectListItem() { Text = "Renkler", Value = "Renkler" });
                    resultRenk.ForEach(x => RenkList.Add(new SelectListItem() { Text = x, Value = x }));
                    ViewData["Renk"] = RenkList;

                    resultYukseklik.Sort();
                    resultYukseklik = resultYukseklik.OrderBy(x => x.Length).ToList();

                    YukseklikList.Add(new SelectListItem() { Text = "Yükseklik", Value = "Yukseklik" });
                    resultYukseklik.ForEach(x => YukseklikList.Add(new SelectListItem() { Text = x, Value = x }));
                    ViewData["Yukseklik"] = YukseklikList;

                    AllProducts = ProductList;

                    List<BoyutluUrunlerModel> boyutluUrunlerModels = new List<BoyutluUrunlerModel>();


                    foreach (var item in ProductList)
                    {
                        UrunModel urun = new UrunModel();
                        urun.Baslik = item.UrunSerisi1.UrunSerisiAdi + " " + item.Boyut1.Genislik + "mm * " + item.Boyut1.Derinlik + " mm" + item.Yukseklik1.Yuksek + " - " + item.Renk1.renk1;
                        urun.KatalogKodu = item.KatalogKodu;
                        //urun.URL = "/TR/Kabinetler/" + UrunGrubuAdi + "/" + urlseri + "/" + item.Boyut1.Genislik + "x" + item.Boyut1.Derinlik + "x" + item.Yukseklik1.Yuksek;
                        string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrunUrlAlaniBos" : item.WebUrl;
                        urun.URL = "tr/kabinetler/" + UrunGrubuAdi + "/" + UrunSerisiAdi + "/" + uzanti;
                        try
                        {
                            urun.fotograf = db.WebFotograf.FirstOrDefault(x => x.GCRecord == null && x.Urunler.Oid == item.Oid && x.Index == 1).fotograf;
                        }
                        catch (Exception)
                        {
                            urun.fotograf = null;
                        }
                        urun.Aciklama = item.Aciklama;
                        urun.KatalogKodu = item.KatalogKodu;
                        baseModel.urunModel.Add(urun);

                        BoyutluUrunlerModel boyutluUrunler = new BoyutluUrunlerModel();

                        boyutluUrunler.Baslik = urun.Baslik;
                        boyutluUrunler.Aciklama = urun.Aciklama;
                        boyutluUrunler.fotograf = urun.fotograf;
                        boyutluUrunler.KatalogKodu = urun.KatalogKodu;
                        boyutluUrunler.URL = urun.URL;
                        boyutluUrunler.Derinlik = item.Boyut1.Derinlik;
                        boyutluUrunler.Genislik = item.Boyut1.Genislik;
                        boyutluUrunler.Yukseklik = item.Yukseklik1.Yuksek;
                        boyutluUrunler.Renk = item.Renk1.renk1;

                        boyutluUrunlerModels.Add(boyutluUrunler);
                    }
                    BUM = boyutluUrunlerModels;
                    return View(baseModel);

                case "en":

                    string urlseri2 = UrunSerisiAdi;
                    UrunSerisi urunseriEng = db.UrunSerisi.Where(x => x.GCRecord == null && x.EngWebUrl == UrunSerisiAdi && x.UrunGrubu1.EngWebUrl == UrunGrubuAdi && x.EngWeb == true).FirstOrDefault();
                    Guid urunSerisiOid2 = urunseriEng.Oid;

                    #region Grup Seri Linkleme
                    ProductGrup pgEng = new ProductGrup();
                    pgEng.grupAdi = urunseriEng.UrunGrubu1.EngUrunGrubuAdi;
                    pgEng.grupUrl = "en/cabinets/" + urunseriEng.UrunGrubu1.EngWebUrl;
                    baseModel.productGrup.Add(pgEng);

                    ProductSeri psEng = new ProductSeri();
                    psEng.seriAdi = urunseriEng.UrunSerisiAdi;
                    psEng.seriUrl = "en/cabinets/" + urunseriEng.UrunGrubu1.EngWebUrl + "/" + urunseriEng.WebUrl;
                    baseModel.productSeri.Add(psEng);
                    #endregion

                    List<Urunler> mainlist2 = new List<Urunler>();
                    //List<Guid> listboyut = new List<Guid>();
                    List<Urunler> ProductList2 = db.Urunler.Where(x => x.UrunSerisi1.Oid == urunSerisiOid2 && x.GCRecord == null && x.UrunSerisi1 != null && x.UrunSerisi1.UrunSerisiAdi != null && x.EngWeb == true).OrderBy(x => x.Boyut1.Genislik.Length).ThenBy(x => x.Boyut1.Genislik).ThenBy(x => x.Boyut1.Derinlik.Length).ThenBy(x => x.Boyut1.Derinlik).ThenBy(x => x.Yukseklik1.Yuksek.Length).ThenBy(x => x.Yukseklik1.Yuksek).ToList();

                    #region BannerModel
                    baseModel.bannerModels = new List<BannerModel>();
                    Banner bannerEng = db.Banner.FirstOrDefault(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid2);

                    BannerModel urunModelEng = new BannerModel();
                    if (bannerEng != null)
                    {
                        urunModelEng.fotografEng = bannerEng.fotografENG != null ? bannerEng.fotografENG : bannerEng.fotograf;
                        baseModel.bannerModels.Add(urunModelEng);
                    }
                    #endregion

                    baseModel.SayfaLinkBaslik = urunseriEng.EngUrunSerisiAdi;
                    baseModel.SayfaAciklama = urunseriEng.EngAciklama;

                    //DropDownlar
                    List<string> result2 = new List<string>();
                    List<string> resultYukseklik2 = new List<string>();
                    List<string> resultRenk2 = new List<string>();

                    //List<Guid> listrenk = new List<Guid>();
                    List<SelectListItem> RenkList2 = new List<SelectListItem>();
                    List<SelectListItem> YukseklikList2 = new List<SelectListItem>();
                    List<SelectListItem> boyutlist2 = new List<SelectListItem>();

                    foreach (var urunler in ProductList2)
                    {
                        if (urunler.Boyut1 != null)
                        {
                            String txt = urunler.Boyut1.Genislik + "*" + urunler.Boyut1.Derinlik;
                            if (urunler.Boyut1.Derinlik != "" && !result2.Contains(txt))
                            {
                                result2.Add(txt);
                            }
                        }

                        if (urunler.Renk1 != null)
                        {
                            String txt = urunler.Renk1.EngRenk;
                            if (urunler.Renk1.EngRenk != "" && !resultRenk2.Contains(txt))
                            {
                                resultRenk2.Add(txt);
                            }
                        }

                        if (urunler.Yukseklik1 != null)
                        {
                            String txt2 = urunler.Yukseklik1.Yuksek;

                            string txt = txt2;
                            if (urunler.Yukseklik1.Yuksek != "" && !resultYukseklik2.Contains(txt))
                            {
                                resultYukseklik2.Add(txt);
                            }
                        }

                    }

                    boyutlist2.Add(new SelectListItem() { Text = "WIDTH * DEPTH", Value = "Boyutlar" });
                    result2.ForEach(x => boyutlist2.Add(new SelectListItem() { Text = x, Value = x }));
                    ViewData["Boyut"] = boyutlist2;

                    RenkList2.Add(new SelectListItem() { Text = "COLOR", Value = "Renkler" });
                    resultRenk2.ForEach(x => RenkList2.Add(new SelectListItem() { Text = x, Value = x }));
                    ViewData["Renk"] = RenkList2;

                    resultYukseklik2.Sort();
                    resultYukseklik = resultYukseklik2.OrderBy(x => x.Length).ToList();

                    YukseklikList2.Add(new SelectListItem() { Text = "HEIGHT", Value = "Yukseklik" });
                    resultYukseklik.ForEach(x => YukseklikList2.Add(new SelectListItem() { Text = x, Value = x }));
                    ViewData["Yukseklik"] = YukseklikList2;

                    AllProducts = ProductList2;

                    List<BoyutluUrunlerModel> boyutluUrunlerModels2 = new List<BoyutluUrunlerModel>();


                    foreach (var item in ProductList2)
                    {
                        UrunModel urun = new UrunModel();
                        urun.Baslik = item.UrunSerisi1.EngUrunSerisiAdi + " " + item.Boyut1.Genislik + "mm * " + item.Boyut1.Derinlik + " mm" + item.Yukseklik1.Yuksek + " - " + item.Renk1.EngRenk;
                        urun.KatalogKodu = item.KatalogKodu;
                        //urun.URL = "/ENG/Cabinets/" + UrunGrubuAdi + "/" + urlseri2 + "/" + item.Boyut1.Genislik + "x" + item.Boyut1.Derinlik + "x" + item.Yukseklik1.Yuksek;
                        string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "ProductUrlIsNull" : item.EngWebUrl;
                        urun.URL = "en/cabinets/" + UrunGrubuAdi + "/" + UrunSerisiAdi + "/" + ENGuzanti;
                        try
                        {
                            urun.fotograf = db.WebFotograf.FirstOrDefault(x => x.GCRecord == null && x.Urunler.Oid == item.Oid && x.Index == 1).fotograf;
                        }
                        catch (Exception)
                        {
                            urun.fotograf = null;
                        }
                        urun.Aciklama = item.EngAciklama;//Aciklama
                        baseModel.urunModel.Add(urun);

                        BoyutluUrunlerModel boyutluUrunler = new BoyutluUrunlerModel();

                        boyutluUrunler.Baslik = urun.Baslik;
                        boyutluUrunler.Aciklama = urun.Aciklama;
                        boyutluUrunler.fotograf = urun.fotograf;
                        boyutluUrunler.KatalogKodu = urun.KatalogKodu;
                        boyutluUrunler.URL = urun.URL;
                        boyutluUrunler.Derinlik = item.Boyut1.Derinlik;
                        boyutluUrunler.Genislik = item.Boyut1.Genislik;
                        boyutluUrunler.Yukseklik = item.Yukseklik1.Yuksek;
                        boyutluUrunler.Renk = item.Renk1.EngRenk;

                        boyutluUrunlerModels2.Add(boyutluUrunler);


                    }
                    BUM = boyutluUrunlerModels2;
                    return View(baseModel);

                default:
                    return View();
            }
        }
        public ActionResult ProductsWithoutSize(Guid urunserisiOid, string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            Layout(dil);
            switch (dil)
            {
                case "tr":
                    if (urunserisiOid == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {
                        List<String> urunKodu = new List<String>();
                        List<Urunler> urunList = new List<Urunler>();
                        List<Urunler> urunList2 = db.Urunler.Where(x => x.GCRecord == null && x.UrunSerisi1.Oid == urunserisiOid && x.Web == true).OrderBy(x => x.Index).ToList();
                        //foreach (Urunler x in urunList2)
                        //{
                        //    if (!urunKodu.Contains(x.))
                        //    {
                        //        seriAdi.Add(x.UrunSerisi1.UrunSerisiAdi);
                        //        urunList.Add(x);
                        //    }

                        //}
                        //List<AksesuarGrubu> aksList = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).ToList();
                        //ViewData["Aks"] = aksList;
                        List<Fotograflar> IndexFoto = new List<Fotograflar>();
                        foreach (Urunler item in urunList2)
                        {
                            IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Urunler1.Oid == item.Oid));
                        }
                        ViewData["Fotograflar"] = IndexFoto;

                        ViewData["ProductsWithoutSize"] = urunList2;

                        return View(urunList2);
                    }
                    break;
                case "en":
                    if (urunserisiOid == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {
                        List<String> urunKodu = new List<String>();
                        List<Urunler> urunList = new List<Urunler>();
                        List<Urunler> urunList2 = db.Urunler.Where(x => x.GCRecord == null && x.UrunSerisi1.Oid == urunserisiOid && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                        //foreach (Urunler x in urunList2)
                        //{
                        //    if (!urunKodu.Contains(x.))
                        //    {
                        //        seriAdi.Add(x.UrunSerisi1.UrunSerisiAdi);
                        //        urunList.Add(x);
                        //    }

                        //}
                        //List<AksesuarGrubu> aksList = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
                        //ViewData["Aks"] = aksList;
                        List<Fotograflar> IndexFoto = new List<Fotograflar>();
                        foreach (Urunler item in urunList2)
                        {
                            IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.Urunler1.Oid == item.Oid));
                        }
                        ViewData["Fotograflar"] = IndexFoto;

                        ViewData["ProductsWithoutSize"] = urunList2;

                        return View(urunList2);
                    }
                    break;
                default:
                    return View();
                    break;
            }

        }

        public async Task<ActionResult> News(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            switch (dil)
            {
                case "tr":
                    ViewData["NewsList"] = db.Haberler.Where(x => x.GCRecord == null && x.Web == 0).ToList();

                    break;
                case "en":
                    ViewData["NewsList"] = db.Haberler.Where(x => x.GCRecord == null && x.Web == 1).ToList();

                    break;
                default:
                    break;

            }

            return View(baseModel);
        }

        //public ActionResult Haberler(string dil)
        //{
        //    dil = dil.ToUpper();
        //    ViewBag.dil = dil;

        //    switch (dil)
        //    {
        //        case "TR":
        //            ViewData["HaberlerList"] = db.Haberler.Where(x => x.GCRecord == null).ToList();
        //            break;
        //        case "ENG":
        //            ViewData["LayoutList"] = db.UrunGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
        //            ViewData["HaberlerList"] = db.Haberler.Where(x => x.GCRecord == null).ToList();
        //            ViewData["LayoutTumSeri"] = db.UrunSerisi.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
        //            ViewData["AksGroup"] = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
        //            ViewData["OrtamUrunler"] = db.Urunler.Where(x => x.GCRecord == null && x.EngWeb == true && x.UrunSerisi1.UrunSerisiAdi.Equals("Ortam İzleme ve Yönetim Sistemi")).ToList();
        //            ViewData["GenelKatalog"] = db.Kataloglar.Where(x => x.GCRecord == null && x.EngLandeGenelKatalog == true).ToList();
        //            break;
        //        default:
        //            break;
        //    }


        //    return PartialView("Haberler");
        //}
        public ActionResult ProductFilter(string boyut, string yukseklik, string renk, string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            List<BoyutluUrunlerModel> ProductList = new List<BoyutluUrunlerModel>();

            //Layout(dil);
            switch (dil)
            {
                case "tr":


                    // 3ü devar
                    if (boyut != null && boyut != "Boyutlar" && yukseklik != null && yukseklik != "Yukseklik" && renk != null && renk != "Renkler")
                    {
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik && x.Yukseklik == yukseklik && x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }
                    else if ((boyut == null || boyut == "Boyutlar") && (yukseklik != null && yukseklik != "Yukseklik") && (renk != null && renk != "Renkler")) // yükseklik + renk
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);

                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Yukseklik == yukseklik && x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();


                    }
                    else if ((boyut != null && boyut != "Boyutlar") && (yukseklik == null || yukseklik == "Yukseklik") && (renk != null && renk != "Renkler"))// boyut + renk
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik && x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();

                        //ViewData["Urun"] = ProductList;

                    }
                    else if ((boyut != null && boyut != "Boyutlar") && (yukseklik != null && yukseklik != "Yukseklik") && (renk == null || renk == "Renkler"))// boyut + yükseklk
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik && x.Yukseklik == yukseklik).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();
                        //ViewData["Urun"] = ProductList;
                    }
                    else if ((boyut == null || boyut == "Boyutlar") && (yukseklik == null || yukseklik == "Yukseklik") && (renk != null && renk != "Renkler"))// renk
                    {

                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }
                    else if ((boyut == null || boyut == "Boyutlar") && (yukseklik != null && yukseklik != "Yukseklik") && (renk == null || renk == "Renkler"))//yükseklik
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);

                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Yukseklik == yukseklik).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();


                    }
                    else if ((boyut != null && boyut != "Boyutlar") && (yukseklik == null || yukseklik == "Yukseklik") && (renk == null || renk == "Renkler"))//boyut
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }
                    else // filtresiz
                    {

                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }

                    baseModel.urunModel = new List<UrunModel>();

                    foreach (var item in ProductList)
                    {
                        UrunModel urun = new UrunModel();
                        urun.Baslik = item.Baslik;
                        urun.KatalogKodu = item.KatalogKodu;
                        urun.URL = item.URL;
                        try
                        {
                            urun.fotograf = item.fotograf;
                        }
                        catch (Exception)
                        {
                            urun.fotograf = null;
                        }
                        urun.Aciklama = item.Aciklama;
                        baseModel.urunModel.Add(urun);

                    }


                    return PartialView("ProductFilter", baseModel);

                case "en":

                    if (boyut != null && boyut != "Boyutlar" && yukseklik != null && yukseklik != "Yukseklik" && renk != null && renk != "Renkler")
                    {
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik && x.Yukseklik == yukseklik && x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }
                    else if ((boyut == null || boyut == "Boyutlar") && (yukseklik != null && yukseklik != "Yukseklik") && (renk != null && renk != "Renkler")) // yükseklik + renk
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);

                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Yukseklik == yukseklik && x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();


                    }
                    else if ((boyut != null && boyut != "Boyutlar") && (yukseklik == null || yukseklik == "Yukseklik") && (renk != null && renk != "Renkler"))// boyut + renk
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik && x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();

                        //ViewData["Urun"] = ProductList;

                    }
                    else if ((boyut != null && boyut != "Boyutlar") && (yukseklik != null && yukseklik != "Yukseklik") && (renk == null || renk == "Renkler"))// boyut + yükseklk
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik && x.Yukseklik == yukseklik).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();
                        //ViewData["Urun"] = ProductList;
                    }
                    else if ((boyut == null || boyut == "Boyutlar") && (yukseklik == null || yukseklik == "Yukseklik") && (renk != null && renk != "Renkler"))// renk
                    {

                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Renk == renk).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }
                    else if ((boyut == null || boyut == "Boyutlar") && (yukseklik != null && yukseklik != "Yukseklik") && (renk == null || renk == "Renkler"))//yükseklik
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);

                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Yukseklik == yukseklik).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();


                    }
                    else if ((boyut != null && boyut != "Boyutlar") && (yukseklik == null || yukseklik == "Yukseklik") && (renk == null || renk == "Renkler"))//boyut
                    {
                        //Guid urunOid = Guid.Parse(urunSerisiOid);
                        string[] words = boyut.Split('*');
                        string derinlik = words[1];
                        string genislik = words[0];
                        //List<Urunler> mainlist = new List<Urunler>();
                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.Where(x => x.Derinlik == derinlik && x.Genislik == genislik).OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }
                    else // filtresiz
                    {

                        List<Guid> listboyut = new List<Guid>();
                        ProductList = BUM.OrderBy(x => x.Genislik.Length).ThenBy(x => x.Genislik).ThenBy(x => x.Derinlik.Length).ThenBy(x => x.Derinlik).ThenBy(x => x.Yukseklik.Length).ThenBy(x => x.Yukseklik).ToList();



                    }

                    baseModel.urunModel = new List<UrunModel>();

                    foreach (var item in ProductList)
                    {
                        UrunModel urun = new UrunModel();
                        urun.Baslik = item.Baslik;
                        urun.KatalogKodu = item.KatalogKodu;
                        urun.URL = item.URL;
                        try
                        {
                            urun.fotograf = item.fotograf;
                        }
                        catch (Exception)
                        {
                            urun.fotograf = null;
                        }
                        urun.Aciklama = item.Aciklama;
                        baseModel.urunModel.Add(urun);

                    }


                    return PartialView("ProductFilter", baseModel);


                    return PartialView("ProductFilter", baseModel);

                    break;
                default:
                    return PartialView("ProductFilter");
                    break;
            }


        }

        public async Task<ActionResult> ProductDetail(String urunOidst, string dil, string UrunGrup, string UrunSeri, string UrunUrl, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunmodelDetails = new List<UrunModelDetail>();
            baseModel.productSeri = new List<ProductSeri>();
            baseModel.productGrup = new List<ProductGrup>();

            switch (dil)
            {
                case "tr":
                    if (UrunUrl == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {
                        List<Urunler> productDetailList = db.Urunler.Where(x => x.WebUrl == UrunUrl && x.GCRecord == null && x.Web == true).ToList();
                        Urunler urun = db.Urunler.FirstOrDefault(x => x.WebUrl == UrunUrl && x.GCRecord == null && x.Web == true);

                        Guid urunOid = urun.Oid;

                        #region SeriGrup Linkleme
                        ProductGrup pg = new ProductGrup();
                        pg.grupAdi = urun.UrunGrubu1.UrunGrubuAdi;
                        pg.grupUrl = "tr/kabinetler/" + urun.UrunGrubu1.WebUrl;
                        baseModel.productGrup.Add(pg);

                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = urun.UrunSerisi1.UrunSerisiAdi;
                        ps.seriUrl = "tr/kabinetler/" + urun.UrunGrubu1.WebUrl + "/" + urun.UrunSerisi1.WebUrl;
                        baseModel.productSeri.Add(ps);

                        #endregion
                        baseModel.SayfaLinkBaslik = urun.KatalogKodu;
                        //Fotoğraf
                        UrunModelDetail urunModelDetail = new UrunModelDetail();
                        urunModelDetail.fotograf = new List<byte[]>();
                        //List<Fotograflar> foti = db.Fotograflar.Where(x => x.Web == true && x.GCRecord == null && x.urunler == urun.Oid).ToList();
                        List<WebFotograf> foti = db.WebFotograf.Where(x => x.Web == true && x.GCRecord == null && x.Urunler.Oid == urun.Oid).OrderBy(z => z.Index).ToList();
                        foreach (var item in foti)
                        {
                            urunModelDetail.fotograf.Add(item.fotograf);
                            //urunModelDetail.fotograf.Add(foti == null ? null : item.fotograf);

                        }
                        baseModel.urunmodelDetails.Add(urunModelDetail);

                        String urunSerisiAdi = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).Select(x => x.UrunSerisi1.UrunSerisiAdi).FirstOrDefault();
                        String derinlik = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).Select(x => x.Boyut1.Derinlik).FirstOrDefault();
                        String genislik = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).Select(x => x.Boyut1.Genislik).FirstOrDefault();
                        List<Urunler> productheightList = db.Urunler.Where(x => x.UrunSerisi1.UrunSerisiAdi == urunSerisiAdi && x.GCRecord == null && x.Web == true && x.Boyut1.Genislik == genislik && x.Boyut1.Derinlik == derinlik).ToList();

                        List<SelectListItem> heightslist = new List<SelectListItem>();

                        urunOidForAks = productheightList.Select(x => x.Oid).FirstOrDefault().ToString();

                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        ViewData["SpecCtrl"] = urundegerlerList;
                        ViewData["ProductDetail"] = productDetailList;
                        ViewData["Height"] = heightslist;

                        //Teknik
                        int teknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true);
                        int SeriteknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null);
                        int teknikTotal = teknikList + SeriteknikList;
                        TempData["Teknik"] = teknikTotal.ToString();

                        //
                        //Sertifika
                        List<Sertifikalar> UrunSertifikalar = db.Sertifikalar.Where(x => x.urunler == urunOid && x.GCRecord == null && x.Web == true).ToList();
                        List<Sertifikalar> SeriUrunSertifikalar = db.Sertifikalar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriUrunSertifikalar)
                        {
                            UrunSertifikalar.Add(item);
                        }

                        ViewData["UrunSertifikalar"] = UrunSertifikalar;

                        //

                        //Kapak OPs
                        List<KapakOpsiyonlari> KapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunler == urunOid && x.GCRecord == null && x.Web == true).ToList();
                        List<KapakOpsiyonDoc> kapakOpsiyonDocs = new List<KapakOpsiyonDoc>();
                        foreach (KapakOpsiyonlari item in KapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        List<KapakOpsiyonlari> SeriKapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunSerisi == urun.urunSerisi && x.GCRecord == null && x.Web == true && x.Urunler1 == null).ToList();

                        foreach (KapakOpsiyonlari item in SeriKapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        ViewData["KapakOpsiyonlari"] = kapakOpsiyonDocs;
                        //

                        // Katalaog 
                        List<Kataloglar> kataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<Kataloglar> Serikataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in Serikataloglars)
                        {
                            kataloglars.Add(item);
                        }

                        ViewData["Katalog"] = kataloglars;
                        //

                        //Montaj Klavuzlari
                        List<MontajKlavuzlari> montajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<MontajKlavuzlari> SeriMontajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriMontajKlavuzlari)
                        {
                            montajKlavuzlari.Add(item);
                        }

                        ViewData["Montaj"] = montajKlavuzlari;

                        //Kalite Dokümanları
                        List<KaliteDokumanlari> kaliteDokumanlaris = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<KaliteDokumanlari> seriKaliteDokumanlari = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in seriKaliteDokumanlari)
                        {
                            kaliteDokumanlaris.Add(item);
                        }

                        ViewData["KaliteDok"] = kaliteDokumanlaris;

                        //Aksesuarlar
                        List<Aksesuar> AksesuarListesi = db.Aksesuar.Where(z => z.GCRecord == null && z.Web == true && z.urunler == urunOid).ToList();
                        ViewData["AksesuarList"] = AksesuarListesi;


                        int degerlerCount = db.UrunDegerler.Count(x => x.GCRecord == null && x.urunler == urunOid);
                        ViewBag.degerCount = degerlerCount;


                        return View(baseModel);

                    }
                case "en":
                    if (UrunUrl == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {
                        List<Urunler> engproductDetailList = db.Urunler.Where(x => x.EngWebUrl == UrunUrl && x.GCRecord == null && x.EngWeb == true).ToList();
                        Urunler urun = db.Urunler.FirstOrDefault(x => x.EngWebUrl == UrunUrl && x.GCRecord == null && x.EngWeb == true);

                        Guid urunOid = urun.Oid;

                        #region SeriGrup Linkleme
                        ProductGrup pgEng = new ProductGrup();
                        pgEng.grupAdi = urun.UrunGrubu1.EngUrunGrubuAdi;
                        pgEng.grupUrl = "en/cabinets/" + urun.UrunGrubu1.EngWebUrl;
                        baseModel.productGrup.Add(pgEng);

                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = urun.UrunSerisi1.EngUrunSerisiAdi;
                        ps.seriUrl = "en/cabinets/" + urun.UrunGrubu1.EngWebUrl + "/" + urun.UrunSerisi1.EngWebUrl;
                        baseModel.productSeri.Add(ps);

                        #endregion
                        baseModel.SayfaLinkBaslik = urun.KatalogKodu;

                        List<Urunler> productDetailList = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.EngWeb == true).ToList();

                        String engurunSerisiAdi = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.EngWeb == true).Select(x => x.UrunSerisi1.UrunSerisiAdi).FirstOrDefault();
                        String engderinlik = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.EngWeb == true).Select(x => x.Boyut1.Derinlik).FirstOrDefault();
                        String enggenislik = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.EngWeb == true).Select(x => x.Boyut1.Genislik).FirstOrDefault();
                        List<Urunler> engproductheightList = db.Urunler.Where(x => x.UrunSerisi1.UrunSerisiAdi == engurunSerisiAdi && x.GCRecord == null && x.EngWeb == true && x.Boyut1.Genislik == enggenislik && x.Boyut1.Derinlik == engderinlik).ToList();

                        List<SelectListItem> engheightslist = new List<SelectListItem>();

                        urunOidForAks = engproductheightList.Select(x => x.Oid).FirstOrDefault().ToString();

                        List<UrunDegerler> engurundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        ViewData["SpecCtrl"] = engurundegerlerList;
                        ViewData["ProductDetail"] = engproductDetailList;
                        ViewData["Height"] = engheightslist;


                        //Teknik
                        int teknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true);
                        int SeriteknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null);
                        int teknikTotal = teknikList + SeriteknikList;
                        TempData["Teknik"] = teknikTotal.ToString();

                        //
                        //Sertifika
                        List<Sertifikalar> UrunSertifikalar = db.Sertifikalar.Where(x => x.urunler == urunOid && x.GCRecord == null && x.EngWeb == true).ToList();
                        List<Sertifikalar> SeriUrunSertifikalar = db.Sertifikalar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriUrunSertifikalar)
                        {
                            UrunSertifikalar.Add(item);
                        }

                        ViewData["UrunSertifikalar"] = UrunSertifikalar;

                        //

                        //Kapak OPs
                        List<KapakOpsiyonlari> KapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunler == urunOid && x.GCRecord == null && x.ENGWeb == true).ToList();
                        List<KapakOpsiyonDoc> kapakOpsiyonDocs = new List<KapakOpsiyonDoc>();
                        foreach (KapakOpsiyonlari item in KapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        List<KapakOpsiyonlari> SeriKapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunSerisi == urun.urunSerisi && x.GCRecord == null && x.ENGWeb == true && x.Urunler1 == null).ToList();

                        foreach (KapakOpsiyonlari item in SeriKapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        ViewData["KapakOpsiyonlari"] = kapakOpsiyonDocs;
                        //

                        // Katalaog 
                        List<Kataloglar> kataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        List<Kataloglar> Serikataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in Serikataloglars)
                        {
                            kataloglars.Add(item);
                        }

                        ViewData["Katalog"] = kataloglars;
                        //

                        //Montaj Klavuzlari
                        List<MontajKlavuzlari> montajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        List<MontajKlavuzlari> SeriMontajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriMontajKlavuzlari)
                        {
                            montajKlavuzlari.Add(item);
                        }

                        ViewData["Montaj"] = montajKlavuzlari;

                        //Kalite Dokümanları
                        List<KaliteDokumanlari> kaliteDokumanlaris = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        List<KaliteDokumanlari> seriKaliteDokumanlari = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in seriKaliteDokumanlari)
                        {
                            kaliteDokumanlaris.Add(item);
                        }

                        ViewData["KaliteDok"] = kaliteDokumanlaris;

                        //Fotoğraflar
                        UrunModelDetail urunModelDetail = new UrunModelDetail();
                        urunModelDetail.fotograf = new List<byte[]>();
                        //List<Fotograflar> foti = db.Fotograflar.Where(x => x.Web == true && x.GCRecord == null && x.urunler == urun.Oid).ToList();
                        List<WebFotograf> foti = db.WebFotograf.Where(x => x.Web == true && x.GCRecord == null && x.Urunler.Oid == urun.Oid).OrderBy(z => z.Index).ToList();
                        foreach (var item in foti)
                        {
                            urunModelDetail.fotograf.Add(item.fotograf);
                        }
                        baseModel.urunmodelDetails.Add(urunModelDetail);

                        //Aksesuarlar
                        List<Aksesuar> AksesuarListesi = db.Aksesuar.Where(z => z.GCRecord == null && z.Web == true && z.urunler == urunOid).ToList();
                        ViewData["AksesuarList"] = AksesuarListesi;

                        urunOidForAks = urun.Oid.ToString();

                        int degerlerCount = db.UrunDegerler.Count(x => x.GCRecord == null && x.urunler == urunOid);
                        ViewBag.degerCount = degerlerCount;

                        return View(baseModel);
                    }
                    break;
                default:
                    return View("~/Views/Shared/Error.cshtml");
                    break;
            }
        }
        [HttpGet]
        public async Task<ActionResult> ProductDetailsWithoutSize(string urunOidst, string dil, string UrunUrl, string UrunSeri, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productSeri = new List<ProductSeri>();
            baseModel.productGrup = new List<ProductGrup>();
            baseModel.urunmodelDetails = new List<UrunModelDetail>();

            switch (dil)
            {
                case "tr":
                    if (UrunUrl == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {

                        Urunler urun = db.Urunler.Where(x => x.WebUrl == UrunUrl && x.GCRecord == null && x.Web == true).FirstOrDefault();
                        List<Urunler> productDetailList = db.Urunler.Where(x => x.WebUrl == UrunUrl && x.GCRecord == null && x.Web == true).ToList();
                        Guid urunOid = urun.Oid;

                        #region Seri Linkleme
                        string grupUrl = "";
                        switch (urun.UrunAilesi1.Oid.ToString().ToUpper())
                        {
                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                grupUrl = "veri_merkezi_cozumleri";
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                grupUrl = "veri_merkezi_cozumleri";
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                grupUrl = "endustriyel_uygulamalar_ve_guvenlik_sistemleri";
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                grupUrl = "endustriyel_uygulamalar_ve_guvenlik_sistemleri";
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                grupUrl = "uzaktan_erisim_sistemleri";
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                grupUrl = "guc_dagitim_uniteleri";
                                break;
                        }

                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = urun.UrunSerisi1.UrunSerisiAdi;
                        ps.seriUrl = "tr/" + grupUrl + "/" + urun.UrunSerisi1.WebUrl;
                        baseModel.productSeri.Add(ps);

                        ProductGrup pg = new ProductGrup();
                        pg.grupAdi = urun.UrunGrubu1.UrunGrubuAdi;
                        pg.grupUrl = "tr/" + urun.UrunGrubu1.WebUrl;
                        baseModel.productGrup.Add(pg);

                        UrunModel um = new UrunModel();
                        um.Baslik = urun.KatalogKodu;
                        um.URL = "tr/" + grupUrl + "/" + urun.UrunSerisi1.WebUrl + "/" + urun.WebUrl;
                        baseModel.urunModel.Add(um);
                        #endregion
                        baseModel.SayfaLinkBaslik = urun.KatalogKodu;

                        String urunSerisiAdi = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).Select(x => x.UrunSerisi1.UrunSerisiAdi).FirstOrDefault();

                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        ViewData["SpecCtrl"] = urundegerlerList;
                        ViewData["ProductDetail"] = productDetailList;

                        //Teknik
                        int teknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true);
                        int SeriteknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null);
                        int teknikTotal = teknikList + SeriteknikList;
                        TempData["Teknik"] = teknikTotal.ToString();

                        //
                        //Sertifika
                        List<Sertifikalar> UrunSertifikalar = db.Sertifikalar.Where(x => x.urunler == urunOid && x.GCRecord == null && x.Web == true).ToList();
                        List<Sertifikalar> SeriUrunSertifikalar = db.Sertifikalar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriUrunSertifikalar)
                        {
                            UrunSertifikalar.Add(item);
                        }

                        ViewData["UrunSertifikalar"] = UrunSertifikalar;

                        //

                        //Kapak OPs
                        List<KapakOpsiyonlari> KapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunler == urunOid && x.GCRecord == null && x.Web == true).ToList();
                        List<KapakOpsiyonDoc> kapakOpsiyonDocs = new List<KapakOpsiyonDoc>();
                        foreach (KapakOpsiyonlari item in KapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        List<KapakOpsiyonlari> SeriKapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunSerisi == urun.urunSerisi && x.GCRecord == null && x.Web == true && x.Urunler1 == null).ToList();

                        foreach (KapakOpsiyonlari item in SeriKapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        ViewData["KapakOpsiyonlari"] = kapakOpsiyonDocs;
                        //

                        // Katalaog 
                        List<Kataloglar> kataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<Kataloglar> Serikataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in Serikataloglars)
                        {
                            kataloglars.Add(item);
                        }

                        ViewData["Katalog"] = kataloglars;
                        //

                        //Montaj Klavuzlari
                        List<MontajKlavuzlari> montajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<MontajKlavuzlari> SeriMontajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriMontajKlavuzlari)
                        {
                            montajKlavuzlari.Add(item);
                        }

                        ViewData["Montaj"] = montajKlavuzlari;

                        //Kalite Dokümanları
                        List<KaliteDokumanlari> kaliteDokumanlaris = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<KaliteDokumanlari> seriKaliteDokumanlari = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in seriKaliteDokumanlari)
                        {
                            kaliteDokumanlaris.Add(item);
                        }

                        ViewData["KaliteDok"] = kaliteDokumanlaris;

                        //Fotoğraflar
                        UrunModelDetail urunModelDetail = new UrunModelDetail();
                        urunModelDetail.fotograf = new List<byte[]>();
                        //List<Fotograflar> foti = db.Fotograflar.Where(x => x.Web == true && x.GCRecord == null && x.urunler == urun.Oid).ToList();
                        List<WebFotograf> foti = db.WebFotograf.Where(x => x.Web == true && x.GCRecord == null && x.Urunler.Oid == urun.Oid).ToList();
                        foreach (var item in foti)
                        {
                            urunModelDetail.fotograf.Add(item.fotograf);
                        }
                        baseModel.urunmodelDetails.Add(urunModelDetail);

                        int degerlerCount = db.UrunDegerler.Count(x => x.GCRecord == null && x.urunler == urunOid);
                        ViewBag.degerCount = degerlerCount;


                        urunOidForAks = urun.Oid.ToString();
                        return View(baseModel);
                    }
                    break;
                case "en":
                    if (UrunUrl == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {

                        Urunler urun = db.Urunler.Where(x => x.EngWebUrl == UrunUrl && x.GCRecord == null && x.EngWeb == true).FirstOrDefault();
                        List<Urunler> productDetailList = db.Urunler.Where(x => x.EngWebUrl == UrunUrl && x.GCRecord == null && x.EngWeb == true).ToList();

                        Guid urunOid = urun.Oid;

                        #region Seri Linkleme
                        string grupUrl = "";
                        switch (urun.UrunAilesi1.Oid.ToString().ToUpper())
                        {
                            case "513C1AE6-115B-49EE-BB09-E4209527929C":
                                grupUrl = "data_center_solutions";
                                break;
                            case "DDDF8D47-0BDB-4BBF-96AC-2ED580719543":
                                grupUrl = "data_center_solutions";
                                break;
                            case "8A1AC735-D8BD-4F28-A989-5FE3BFC6E442":
                                grupUrl = "industrial_applications_and_security_systems";
                                break;
                            case "9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90":
                                grupUrl = "industrial_applications_and_security_systems";
                                break;
                            case "4149EDE8-C9AF-48DE-A712-64F0C2F7251E":
                                grupUrl = "remote_management_systems";
                                break;
                            case "BC816DD9-BDF6-4ED1-99D7-58069FA64821":
                                grupUrl = "power_distribution_units";
                                break;
                        }



                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = urun.UrunSerisi1.EngUrunSerisiAdi;
                        ps.seriUrl = "en/" + grupUrl + "/" + urun.UrunSerisi1.EngWebUrl;
                        baseModel.productSeri.Add(ps);

                        ProductGrup pg = new ProductGrup();
                        pg.grupAdi = urun.UrunGrubu1.EngUrunGrubuAdi;
                        pg.grupUrl = "en/" + urun.UrunGrubu1.EngWebUrl;
                        baseModel.productGrup.Add(pg);

                        UrunModel um = new UrunModel();
                        um.Baslik = urun.KatalogKodu;
                        um.URL = "en/" + grupUrl + "/" + urun.UrunSerisi1.EngWebUrl + "/" + urun.EngWebUrl;
                        baseModel.urunModel.Add(um);
                        #endregion
                        baseModel.SayfaLinkBaslik = urun.KatalogKodu;
                        String urunSerisiAdi = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.EngWeb == true).Select(x => x.UrunSerisi1.UrunSerisiAdi).FirstOrDefault();

                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        ViewData["SpecCtrl"] = urundegerlerList;
                        ViewData["ProductDetail"] = productDetailList;

                        //Teknik
                        int teknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true);
                        int SeriteknikList = db.TeknikCizimler.Count(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null);
                        int teknikTotal = teknikList + SeriteknikList;
                        TempData["Teknik"] = teknikTotal.ToString();

                        //
                        //Sertifika
                        List<Sertifikalar> UrunSertifikalar = db.Sertifikalar.Where(x => x.urunler == urunOid && x.GCRecord == null && x.EngWeb == true).ToList();
                        List<Sertifikalar> SeriUrunSertifikalar = db.Sertifikalar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriUrunSertifikalar)
                        {
                            UrunSertifikalar.Add(item);
                        }

                        ViewData["UrunSertifikalar"] = UrunSertifikalar;

                        //

                        //Kapak OPs
                        List<KapakOpsiyonlari> KapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunler == urunOid && x.GCRecord == null && x.ENGWeb == true).ToList();
                        List<KapakOpsiyonDoc> kapakOpsiyonDocs = new List<KapakOpsiyonDoc>();
                        foreach (KapakOpsiyonlari item in KapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        List<KapakOpsiyonlari> SeriKapakOpsiyonlari = db.KapakOpsiyonlari.Where(x => x.urunSerisi == urun.urunSerisi && x.GCRecord == null && x.ENGWeb == true && x.Urunler1 == null).ToList();

                        foreach (KapakOpsiyonlari item in SeriKapakOpsiyonlari)
                        {
                            kapakOpsiyonDocs.Add(db.KapakOpsiyonDoc.FirstOrDefault(x => x.KapakOpsiyonlari == item.Oid));
                        }


                        ViewData["KapakOpsiyonlari"] = kapakOpsiyonDocs;
                        //

                        // Katalaog 
                        List<Kataloglar> kataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        List<Kataloglar> Serikataloglars = db.Kataloglar.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in Serikataloglars)
                        {
                            kataloglars.Add(item);
                        }

                        ViewData["Katalog"] = kataloglars;
                        //

                        //Montaj Klavuzlari
                        List<MontajKlavuzlari> montajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        List<MontajKlavuzlari> SeriMontajKlavuzlari = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriMontajKlavuzlari)
                        {
                            montajKlavuzlari.Add(item);
                        }

                        ViewData["Montaj"] = montajKlavuzlari;

                        //Kalite Dokümanları
                        List<KaliteDokumanlari> kaliteDokumanlaris = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        List<KaliteDokumanlari> seriKaliteDokumanlari = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in seriKaliteDokumanlari)
                        {
                            kaliteDokumanlaris.Add(item);
                        }

                        ViewData["KaliteDok"] = kaliteDokumanlaris;

                        //Fotoğraflar
                        UrunModelDetail urunModelDetail = new UrunModelDetail();
                        urunModelDetail.fotograf = new List<byte[]>();
                        //List<Fotograflar> foti = db.Fotograflar.Where(x => x.Web == true && x.GCRecord == null && x.urunler == urun.Oid).ToList();
                        List<WebFotograf> foti = db.WebFotograf.Where(x => x.Web == true && x.GCRecord == null && x.Urunler.Oid == urun.Oid).ToList();
                        foreach (var item in foti)
                        {
                            urunModelDetail.fotograf.Add(item.fotograf);
                        }
                        baseModel.urunmodelDetails.Add(urunModelDetail);

                        urunOidForAks = urun.Oid.ToString();

                        int degerlerCount = db.UrunDegerler.Count(x => x.GCRecord == null && x.urunler == urunOid);
                        ViewBag.degerCount = degerlerCount;

                        return View(baseModel);
                    }
                    break;
                default:
                    return View();
                    break;
            }

        }


        public static byte[] ConvertOleObjectToByteArrayXaf(byte[] content)
        {
            if (content != null)
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    return CompressionUtils.Decompress(new MemoryStream(content)).ToArray();
                }
            }
            return null;
        }

        public ActionResult DownloadFile(Guid oid, string filetype)
        {

            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            try
            {
                if (filetype == "kalite")
                {
                    List<KaliteDokumanlari> list = db.KaliteDokumanlari.Where(a => a.Oid == oid && a.GCRecord == null && a.Web == true).ToList();

                    filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

                }
                if (filetype == "teknik")
                {
                    List<TeknikCizimler> list = db.TeknikCizimler.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

                    filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearray = list.Select(y => y.FileData.Content).FirstOrDefault();
                }
                if (filetype == "katalog")
                {
                    List<Kataloglar> list = db.Kataloglar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

                    filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearray = list.Select(y => y.FileData.Content).FirstOrDefault();
                }
                if (filetype == "genelkatalog")
                {
                    List<Kataloglar> katalogList = db.Kataloglar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    string fileOid = katalogList.Select(y => y.File.ToString()).FirstOrDefault();
                    List<FileData> fileDataList = db.FileData.Where(a => a.Oid.ToString() == fileOid && a.GCRecord == null).ToList();
                    filename = fileDataList.Select(y => y.FileName.ToString()).FirstOrDefault();
                    filearray = fileDataList.Select(y => y.Content).FirstOrDefault();
                }

                if (filetype == "montaj")
                {
                    List<MontajKlavuzlari> list = db.MontajKlavuzlari.Where(a => a.Oid == oid && a.GCRecord == null && a.Web == true).ToList();

                    filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearray = list.Select(y => y.FileData.Content).FirstOrDefault();
                }

                if (filetype == "uretim")
                {
                    List<UretimDokumanlari> list = db.UretimDokumanlari.Where(a => a.Oid == oid && a.GCRecord == null && a.Web == true).ToList();

                    filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearray = list.Select(y => y.FileData.Content).FirstOrDefault();
                }
                else { }
            }
            catch (Exception)
            {
                return View("~/Views/ProductGroup/SunucuHatasi.cshtml");
            }
            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }

        public ActionResult Specification(String urunOidst, string dil, string UrunUrl)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            switch (dil)
            {
                case "tr":
                    if (UrunUrl != null)
                    {
                        Urunler urun = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.WebUrl == UrunUrl).FirstOrDefault();

                        Guid urunOid = urun.Oid;

                        List<Guid> allOidDegerler = new List<Guid>();
                        List<Guid> allOidOzellikler = new List<Guid>();
                        UrunDegerler[] myurunDegerler;
                        List<Degerler> degerlerList = db.Degerler.Where(x => x.GCRecord == null).ToList();
                        List<Ozellikler> ozellikList = db.Ozellikler.Where(x => x.GCRecord == null && x.Web == true).ToList();
                        List<Degerler> maindegerlerList = new List<Degerler>();
                        List<Ozellikler> mainozelliklerList = new List<Ozellikler>();
                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();
                        myurunDegerler = urundegerlerList.ToArray();

                        foreach (UrunDegerler urundegerler in urundegerlerList)
                        {
                            if (urundegerler.Deger != null && urundegerler.Urunler1.Oid == urunOid)
                            {
                                allOidDegerler.Add(urundegerler.Degerler1.Oid);
                                allOidOzellikler.Add(urundegerler.Degerler1.Ozellikler1.Oid);
                            }

                        }
                        foreach (Degerler degerler in degerlerList)
                        {
                            if (allOidDegerler.Contains(degerler.Oid)) { maindegerlerList.Add(degerler); }
                        }

                        foreach (Ozellikler ozellikler in ozellikList)
                        {
                            if (allOidOzellikler.Contains(ozellikler.Oid)) { mainozelliklerList.Add(ozellikler); }
                        }
                        var ozellikvar = urundegerlerList.Select(x => x.Degerler1.Ozellikler1).GroupBy(x => x.OzellikAdi);
                        ViewData["Ozellik"] = mainozelliklerList;
                        ViewData["Degerler"] = maindegerlerList;
                        ViewData["UrunDegerler"] = urundegerlerList;
                    }
                    else
                    {
                        Guid urunOid = Guid.Parse(urunOidForAks);
                        List<Guid> allOidDegerler = new List<Guid>();
                        List<Guid> allOidOzellikler = new List<Guid>();
                        UrunDegerler[] myurunDegerler;
                        List<Degerler> degerlerList = db.Degerler.Where(x => x.GCRecord == null).ToList();
                        List<Ozellikler> ozellikList = db.Ozellikler.Where(x => x.GCRecord == null && x.Web == true).ToList();
                        List<Degerler> maindegerlerList = new List<Degerler>();
                        List<Ozellikler> mainozelliklerList = new List<Ozellikler>();
                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();
                        myurunDegerler = urundegerlerList.ToArray();

                        foreach (UrunDegerler urundegerler in urundegerlerList)
                        {
                            if (urundegerler.Deger != null && urundegerler.Urunler1.Oid == urunOid)
                            {
                                allOidDegerler.Add(urundegerler.Degerler1.Oid);
                                allOidOzellikler.Add(urundegerler.Degerler1.Ozellikler1.Oid);
                            }

                        }
                        foreach (Degerler degerler in degerlerList)
                        {
                            if (allOidDegerler.Contains(degerler.Oid)) { maindegerlerList.Add(degerler); }
                        }

                        foreach (Ozellikler ozellikler in ozellikList)
                        {
                            if (allOidOzellikler.Contains(ozellikler.Oid)) { mainozelliklerList.Add(ozellikler); }
                        }

                        ViewData["Ozellik"] = mainozelliklerList;
                        ViewData["Degerler"] = maindegerlerList;
                        ViewData["UrunDegerler"] = urundegerlerList;
                    }
                    return PartialView("Specification");
                    break;
                case "en":
                    if (urunOidst != null)
                    {
                        Guid urunOid = Guid.Parse(urunOidst);

                        List<Guid> allOidDegerler = new List<Guid>();
                        List<Guid> allOidOzellikler = new List<Guid>();
                        UrunDegerler[] myurunDegerler;
                        List<Degerler> degerlerList = db.Degerler.Where(x => x.GCRecord == null).ToList();
                        List<Ozellikler> ozellikList = db.Ozellikler.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
                        List<Degerler> maindegerlerList = new List<Degerler>();
                        List<Ozellikler> mainozelliklerList = new List<Ozellikler>();
                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();
                        myurunDegerler = urundegerlerList.ToArray();

                        foreach (UrunDegerler urundegerler in urundegerlerList)
                        {
                            if (urundegerler.Deger != null && urundegerler.Urunler1.Oid == urunOid)
                            {
                                allOidDegerler.Add(urundegerler.Degerler1.Oid);
                                allOidOzellikler.Add(urundegerler.Degerler1.Ozellikler1.Oid);
                            }

                        }
                        foreach (Degerler degerler in degerlerList)
                        {
                            if (allOidDegerler.Contains(degerler.Oid)) { maindegerlerList.Add(degerler); }
                        }

                        foreach (Ozellikler ozellikler in ozellikList)
                        {
                            if (allOidOzellikler.Contains(ozellikler.Oid)) { mainozelliklerList.Add(ozellikler); }
                        }
                        var ozellikvar = urundegerlerList.Select(x => x.Degerler1.Ozellikler1).GroupBy(x => x.OzellikAdi);

                        ViewData["Ozellik"] = mainozelliklerList;
                        ViewData["Degerler"] = maindegerlerList;
                        ViewData["UrunDegerler"] = urundegerlerList;
                    }
                    else
                    {
                        Guid urunOid = Guid.Parse(urunOidForAks);
                        List<Guid> allOidDegerler = new List<Guid>();
                        List<Guid> allOidOzellikler = new List<Guid>();
                        UrunDegerler[] myurunDegerler;
                        List<Degerler> degerlerList = db.Degerler.Where(x => x.GCRecord == null).ToList();
                        List<Ozellikler> ozellikList = db.Ozellikler.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
                        List<Degerler> maindegerlerList = new List<Degerler>();
                        List<Ozellikler> mainozelliklerList = new List<Ozellikler>();
                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();

                        urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Deger != null).ToList();
                        myurunDegerler = urundegerlerList.ToArray();

                        foreach (UrunDegerler urundegerler in urundegerlerList)
                        {
                            if (urundegerler.Deger != null && urundegerler.Urunler1.Oid == urunOid)
                            {
                                allOidDegerler.Add(urundegerler.Degerler1.Oid);
                                allOidOzellikler.Add(urundegerler.Degerler1.Ozellikler1.Oid);
                            }

                        }
                        foreach (Degerler degerler in degerlerList)
                        {
                            if (allOidDegerler.Contains(degerler.Oid)) { maindegerlerList.Add(degerler); }
                        }

                        foreach (Ozellikler ozellikler in ozellikList)
                        {
                            if (allOidOzellikler.Contains(ozellikler.Oid)) { mainozelliklerList.Add(ozellikler); }
                        }

                        ViewData["Ozellik"] = mainozelliklerList;
                        ViewData["Degerler"] = maindegerlerList;
                        ViewData["UrunDegerler"] = urundegerlerList;
                    }
                    return PartialView("Specification");
                    break;
                default:
                    return PartialView();
                    break;
            }

        }
        public ActionResult kataloglar(String urunOidst)
        {
            if (urunOidst != null)
            {
                Guid urunOid = Guid.Parse(urunOidst);
                List<Kataloglar> degerlerList = db.Kataloglar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                ViewData["Kataloglar"] = degerlerList;
            }
            else
            {
                Guid urunOid = Guid.Parse(urunOidForAks);
                List<Kataloglar> degerlerList = db.Kataloglar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                ViewData["Kataloglar"] = degerlerList;
            }
            return View();
        }
        public ActionResult teknikcizimler(String urunOidst, string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            switch (dil)
            {
                case "tr":
                    if (urunOidst != null)
                    {
                        Guid urunOid = Guid.Parse(urunOidst);
                        Urunler urun = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).FirstOrDefault();

                        List<TeknikCizimler> degerlerList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();


                        List<TeknikCizimler> SeriteknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriteknikList)
                        {
                            degerlerList.Add(item);
                        }


                        ViewData["File"] = degerlerList;
                    }
                    else
                    {
                        Guid urunOid = Guid.Parse(urunOidForAks);
                        Urunler urun = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).FirstOrDefault();
                        List<TeknikCizimler> degerlerList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                        List<TeknikCizimler> SeriteknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.Web == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriteknikList)
                        {
                            degerlerList.Add(item);
                        }
                        ViewData["File"] = degerlerList;
                    }
                    return PartialView("TeknikCizimler");
                    break;
                case "en":
                    if (urunOidst != null)
                    {
                        Guid urunOid = Guid.Parse(urunOidst);
                        Urunler urun = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).FirstOrDefault();

                        List<TeknikCizimler> degerlerList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();

                        List<TeknikCizimler> SeriteknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriteknikList)
                        {
                            degerlerList.Add(item);
                        }

                        ViewData["File"] = degerlerList;
                    }
                    else
                    {
                        Guid urunOid = Guid.Parse(urunOidForAks);
                        Urunler urun = db.Urunler.Where(x => x.Oid == urunOid && x.GCRecord == null && x.Web == true).FirstOrDefault();

                        List<TeknikCizimler> degerlerList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();


                        List<TeknikCizimler> SeriteknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.urunSerisi == urun.urunSerisi && x.EngWeb == true && x.Urunler1 == null).ToList();
                        foreach (var item in SeriteknikList)
                        {
                            degerlerList.Add(item);
                        }
                        ViewData["File"] = degerlerList;
                    }
                    return PartialView("TeknikCizimler");
                    break;
                default:
                    return PartialView();
                    break;
            }

        }

        public ActionResult montajklavuzlari(String urunOidst)
        {
            if (urunOidst != null)
            {
                Guid urunOid = Guid.Parse(urunOidst);
                List<MontajKlavuzlari> degerlerList = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                ViewData["Montaj"] = degerlerList;
            }
            else
            {
                Guid urunOid = Guid.Parse(urunOidForAks);
                List<MontajKlavuzlari> degerlerList = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                ViewData["Montaj"] = degerlerList;
            }
            return View();
        }

        public ActionResult sertifikalar(String urunOidst)
        {
            if (urunOidst != null)
            {
                Guid urunOid = Guid.Parse(urunOidst);
                List<Sertifikalar> degerlerList = db.Sertifikalar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                ViewData["Sertifika"] = degerlerList;
            }
            else
            {
                Guid urunOid = Guid.Parse(urunOidForAks);
                List<Sertifikalar> degerlerList = db.Sertifikalar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).ToList();
                ViewData["Sertifika"] = degerlerList;
            }
            return View();
        }

        public ActionResult AksesuarGrubu(string UrunUrl, string urunOidst, string dil, string UrunOid)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            switch (dil)
            {
                case "tr":
                    if (UrunUrl != null)
                    {
                        Urunler urun = db.Urunler.Where(z => z.WebUrl == UrunUrl && z.GCRecord == null && z.Web == true).FirstOrDefault();

                        //urunOidForAks = urunOidst;
                        //Guid urunOid = Guid.Parse(urunOidst);
                        urunOidForAks = urun.Oid.ToString();
                        Guid urunOid = urun.Oid;

                        List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

                        List<Aksesuar> aksList = new List<Aksesuar>();

                        foreach (var item in UrunAks)
                        {
                            Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.Web == true);
                            aksList.Add(aksesuar);
                        }


                        //List<Aksesuar> aksList = db.Aksesuar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true && x.).ToList();

                        List<AksesuarGrubu> aksgroupList = new List<AksesuarGrubu>();

                        foreach (Aksesuar x in aksList)
                        {
                            if (x != null && !aksgroupList.Contains(x.AksesuarGrubu1))
                            {
                                aksgroupList.Add(x.AksesuarGrubu1);
                            }
                        }

                        List<SelectListItem> aksgroupselectlist = new List<SelectListItem>();
                        aksgroupselectlist.Add(new SelectListItem { Text = "Aksesuar Grupları", Value = "" });
                        foreach (AksesuarGrubu a in aksgroupList)
                        {
                            aksgroupselectlist.Add(new SelectListItem { Text = a.AksesuarGrupAdi, Value = a.WebUrl });
                        }
                        ViewData["AksList"] = aksList;
                        ViewData["AksGroupSelect"] = aksgroupselectlist;
                        ViewBag.urun = UrunOid;
                        return PartialView("AksesuarGrubu");
                    }
                    else
                    {
                        Guid urunOid = Guid.Parse(urunOidForAks);
                        List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

                        List<Aksesuar> aksList = new List<Aksesuar>();

                        foreach (var item in UrunAks)
                        {
                            Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.Web == true);
                            aksList.Add(aksesuar);
                        }
                        List<AksesuarGrubu> aksgroupList = new List<AksesuarGrubu>();

                        foreach (Aksesuar x in aksList)
                        {
                            if (x != null && !aksgroupList.Contains(x.AksesuarGrubu1))
                            {
                                aksgroupList.Add(x.AksesuarGrubu1);
                            }
                        }

                        List<SelectListItem> aksgroupselectlist = new List<SelectListItem>();
                        aksgroupselectlist.Add(new SelectListItem { Text = "Aksesuar Grupları", Value = "" });
                        foreach (AksesuarGrubu a in aksgroupList)
                        {
                            aksgroupselectlist.Add(new SelectListItem { Text = a.AksesuarGrupAdi, Value = a.WebUrl });
                        }
                        ViewData["AksList"] = aksList;
                        ViewData["AksGroupDefault"] = aksgroupselectlist;
                        ViewBag.urun = UrunOid;
                        return PartialView("AksesuarGrubu");

                    }
                    break;
                case "en":
                    if (urunOidst != null)
                    {
                        urunOidForAks = urunOidst;
                        Guid urunOid = Guid.Parse(urunOidst);

                        List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

                        List<Aksesuar> aksList = new List<Aksesuar>();

                        foreach (var item in UrunAks)
                        {
                            Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.EngWeb == true);
                            aksList.Add(aksesuar);
                        }

                        List<AksesuarGrubu> aksgroupList = new List<AksesuarGrubu>();

                        foreach (Aksesuar x in aksList)
                        {
                            if (x != null && !aksgroupList.Contains(x.AksesuarGrubu1))
                            {
                                aksgroupList.Add(x.AksesuarGrubu1);
                            }
                        }

                        List<SelectListItem> aksgroupselectlist = new List<SelectListItem>();
                        aksgroupselectlist.Add(new SelectListItem { Text = "Accessories Groups", Value = "" });
                        foreach (AksesuarGrubu a in aksgroupList)
                        {
                            aksgroupselectlist.Add(new SelectListItem { Text = a.EngAksesuarGrupAdi, Value = a.EngWebUrl });
                        }
                        ViewData["AksList"] = aksList;
                        ViewData["AksGroupSelect"] = aksgroupselectlist;
                        ViewBag.urun = UrunOid;
                        return PartialView("AksesuarGrubu");
                    }
                    else
                    {
                        Guid urunOid = Guid.Parse(urunOidForAks);
                        List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

                        List<Aksesuar> aksList = new List<Aksesuar>();

                        foreach (var item in UrunAks)
                        {
                            Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.EngWeb == true);
                            aksList.Add(aksesuar);
                        }
                        List<AksesuarGrubu> aksgroupList = new List<AksesuarGrubu>();

                        foreach (Aksesuar x in aksList)
                        {
                            if (x != null && !aksgroupList.Contains(x.AksesuarGrubu1))
                            {
                                aksgroupList.Add(x.AksesuarGrubu1);
                            }
                        }

                        List<SelectListItem> aksgroupselectlist = new List<SelectListItem>();
                        aksgroupselectlist.Add(new SelectListItem { Text = "Accessory Groups", Value = "" });
                        foreach (AksesuarGrubu a in aksgroupList)
                        {
                            aksgroupselectlist.Add(new SelectListItem { Text = a.EngAksesuarGrupAdi, Value = a.EngWebUrl });
                        }
                        ViewData["AksList"] = aksList;
                        ViewData["AksGroupDefault"] = aksgroupselectlist;
                        ViewBag.urun = UrunOid;
                        return PartialView("AksesuarGrubu");

                    }
                    break;
                default:
                    return PartialView("AksesuarGrubu");
                    break;
            }


        }

        public async Task<ActionResult> Kabinetler(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();

            switch (dil)
            {
                case "tr":
                    List<UrunSerisi> List = new List<UrunSerisi>();
                    List<UrunGrubu> List2 = db.UrunGrubu.Where(x => x.GCRecord == null && x.UrunAilesi1.UrunAilesiAdi.Equals("Rack Kabinetler") && x.Web == true).OrderBy(x => x.Index).ToList();

                    foreach (UrunGrubu item in List2)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.UrunGrubuAdi;
                        um.Aciklama = item.Aciklama;
                        string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "GrupUrlBos" : item.WebUrl;
                        um.URL = "tr/kabinetler/" + uzanti;
                        //um.fotograf = item.Fotograflar;
                        //um.fotograf = db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunGrubu1.Oid == item.Oid
                        // && x.Web == true && x.urunler == null && x.urunSerisi == null).fotograf;

                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunGrubu1.Oid == item.Oid && z.Urunler == null && z.UrunSerisi == null).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner banner = new Banner();
                    BannerModel bannerModel = new BannerModel();
                    try
                    {
                        banner = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi != null && z.TumSeriler == true).FirstOrDefault();
                        bannerModel.fotograf = banner.fotograf;
                        baseModel.bannerModels.Add(bannerModel);
                    }
                    catch (Exception) { }
                    #endregion

                    //ViewData["LayoutSeriList"] = List2;
                    //ViewData["KabinetGroup"] = List2;
                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (UrunGrubu item in List2)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunGrubu1.Oid == item.Oid && x.urunSerisi == null && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;
                    break;
                case "en":
                    List<UrunSerisi> engList = new List<UrunSerisi>();
                    List<UrunGrubu> engList2 = db.UrunGrubu.Where(x => x.GCRecord == null && x.UrunAilesi1.UrunAilesiAdi.Equals("Rack Kabinetler") && x.EngWeb == true).OrderBy(x => x.Index).ToList();

                    foreach (UrunGrubu item in engList2)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngUrunGrubuAdi;
                        um.Aciklama = item.EngAciklama;
                        string uzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "GroupUrlIsNull" : item.EngWebUrl;
                        um.URL = "en/cabinets/" + uzanti;
                        //um.fotograf = db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunGrubu1.Oid == item.Oid
                        // && x.Web == true && x.urunler == null && x.urunSerisi == null).fotograf;
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunGrubu1.Oid == item.Oid && z.Urunler == null && z.UrunSerisi == null).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner bannerEng = new Banner();
                    BannerModel bannerModelEng = new BannerModel();
                    try
                    {
                        bannerEng = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi != null && z.TumSeriler == true).FirstOrDefault();
                        bannerModelEng.fotograf = bannerEng.fotografENG;
                        baseModel.bannerModels.Add(bannerModelEng);
                    }
                    catch (Exception) { }
                    #endregion

                    //ViewData["LayoutSeriList"] = engList2;
                    //ViewData["KabinetGroup"] = engList2;
                    //List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                    //foreach (UrunGrubu item in engList2)
                    //{
                    //    engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.UrunGrubu1.Oid == item.Oid && x.urunSerisi == null && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = engIndexFoto;
                    break;
                default:
                    break;
            }


            return View(baseModel);
        }

        public async Task<ActionResult> GucDagitimUniteleri(string dil, BaseModel baseModel, string UrunSerisiAdi)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productSeri = new List<ProductSeri>();
            baseModel.bannerModels = new List<BannerModel>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            switch (dil)
            {
                case "tr":
                    UrunSerisi urunseri;
                    if (UrunSerisiAdi == "tum_urunler")
                    {
                        Guid grupOid = Guid.Parse("568E233E-6EAF-4DF3-AC2C-954DDF609C36");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.UrunGrubu1.Oid == grupOid).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.WebUrl == UrunSerisiAdi).ToList();
                    }

                    Guid urunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        urunSerisiOid = us.Oid;

                        #region Seri Linkleme
                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = us.UrunSerisiAdi;
                        ps.seriUrl = "tr/guc_dagitim_uniteleri/" + us.WebUrl;
                        baseModel.productSeri.Add(ps);
                        #endregion

                        List<Urunler> UrunList = new List<Urunler>();
                        UrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == urunSerisiOid).ToList();

                        foreach (var item in UrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.Aciklama;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/guc_dagitim_uniteleri/" + us.WebUrl + "/" + uzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> BannerList = new List<Banner>();
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid).ToList();

                    foreach (var item in BannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion
                    return View(baseModel);
                    #region Eski Kod
                    //List<UrunSerisi> List = new List<UrunSerisi>();
                    //List<UrunSerisi> List2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Güç Dağıtım Üniteleri") && x.Web == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = List2;
                    //ViewData["GucGroup"] = List2;
                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in List2)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;
                    #endregion
                    break;
                case "en":
                    if (UrunSerisiAdi == "all_products")
                    {
                        Guid grupOid = Guid.Parse("568E233E-6EAF-4DF3-AC2C-954DDF609C36");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.UrunGrubu1.Oid == grupOid).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.EngWebUrl == UrunSerisiAdi).ToList();
                    }
                    Guid EngurunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        EngurunSerisiOid = us.Oid;


                        #region seri Linkleme
                        ProductSeri psEng = new ProductSeri();
                        psEng.seriAdi = us.EngUrunSerisiAdi;
                        psEng.seriUrl = "en/power_distribution_units/" + us.EngWebUrl;
                        baseModel.productSeri.Add(psEng);
                        #endregion

                        List<Urunler> EngUrunList = new List<Urunler>();
                        EngUrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == EngurunSerisiOid).ToList();

                        foreach (var item in EngUrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.EngAciklama;
                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            urunModel.URL = "en/power_distribution_units/" + us.EngWebUrl + "/" + ENGuzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> EngBannerList = new List<Banner>();
                    EngBannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == EngurunSerisiOid).ToList();

                    foreach (var item in EngBannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotografENG != null ? item.fotografENG : item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    return View(baseModel);

                    #region Eski Kod
                    //List<UrunSerisi> engList = new List<UrunSerisi>();
                    //List<UrunSerisi> engList2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Güç Dağıtım Üniteleri") && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = engList2;
                    //ViewData["GucGroup"] = engList2;
                    //List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in engList2)
                    //{
                    //    engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = engIndexFoto;
                    #endregion
                    break;
                default:
                    break;
            }
            return View();
        }

        public async Task<ActionResult> GucDagitimUniteleriGruplari(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            Guid grupOid = Guid.Parse("BC816DD9-BDF6-4ED1-99D7-58069FA64821");
            urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.UrunAilesi1.Oid == grupOid).OrderBy(z => z.Index).ToList();
            switch (dil)
            {
                case "tr":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.UrunSerisiAdi;
                        um.Aciklama = item.Aciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "tr/guc_dagitim_uniteleri/" + item.WebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner Banner = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("568E233E-6EAF-4DF3-AC2C-954DDF609C36");
                        Banner = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == grupOid3).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = Banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception) { }
                    #endregion
                    break;
                case "en":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngUrunSerisiAdi;
                        um.Aciklama = item.EngAciklama;
                        Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "en/power_distribution_units/" + item.EngWebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner BannerEng = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("568E233E-6EAF-4DF3-AC2C-954DDF609C36");
                        BannerEng = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == grupOid3).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = (BannerEng.fotografENG == null) ? BannerEng.fotograf : BannerEng.fotografENG;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                default:
                    break;
            }

            return View(baseModel);
        }

        public async Task<ActionResult> EndustriyelGuvenlik(string dil, BaseModel baseModel, string UrunSerisiAdi)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productSeri = new List<ProductSeri>();
            baseModel.bannerModels = new List<BannerModel>();

            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            UrunSerisi urunseri;
            switch (dil)
            {
                case "tr":
                    if (UrunSerisiAdi == "tum_urunler")
                    {
                        Guid grupOid = Guid.Parse("1E55FF10-D60C-4AC3-89EB-427CB8D9A821");
                        Guid grupOid2 = Guid.Parse("1860F3F2-BFFA-477B-8C50-CC6E11B41187");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && (z.UrunGrubu1.Oid == grupOid || z.UrunGrubu1.Oid == grupOid2)).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.WebUrl == UrunSerisiAdi).ToList();
                    }

                    Guid urunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        urunSerisiOid = us.Oid;
                        #region Seri Linkleme
                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = us.UrunSerisiAdi;
                        ps.seriUrl = "tr/endustriyel_uygulamalar_ve_guvenlik_sistemleri/" + us.WebUrl;
                        baseModel.productSeri.Add(ps);
                        #endregion

                        List<Urunler> UrunList = new List<Urunler>();
                        UrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == urunSerisiOid).ToList();

                        foreach (var item in UrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.Aciklama;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/endustriyel_uygulamalar_ve_guvenlik_sistemleri/" + us.WebUrl + "/" + uzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> BannerList = new List<Banner>();
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid).ToList();

                    foreach (var item in BannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    return View(baseModel);
                    #region Eski Kod
                    //List<UrunSerisi> List2 = db.UrunSerisi.Where(x => x.GCRecord == null && (x.UrunGrubu1.UrunGrubuAdi.Equals("Endüstriyel Panolar ve Kabinetler") || 
                    //x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Mobese ve Saha Güvenlik Sistemleri")) && x.Web == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = List2;
                    //ViewData["EndustriyelGroup"] = List2;
                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in List2)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;

                    //return View();
                    #endregion
                    break;
                case "en":
                    if (UrunSerisiAdi == "all_products")
                    {
                        Guid grupOid = Guid.Parse("1E55FF10-D60C-4AC3-89EB-427CB8D9A821");
                        Guid grupOid2 = Guid.Parse("1860F3F2-BFFA-477B-8C50-CC6E11B41187");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && (z.UrunGrubu1.Oid == grupOid || z.UrunGrubu1.Oid == grupOid2)).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.EngWebUrl == UrunSerisiAdi).ToList();
                    }
                    Guid EngurunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        EngurunSerisiOid = us.Oid;
                        #region Seri Linkleme
                        ProductSeri psEng = new ProductSeri();
                        psEng.seriAdi = us.EngUrunSerisiAdi;
                        psEng.seriUrl = "en/industrial_applications_and_security_systems/" + us.EngWebUrl;
                        baseModel.productSeri.Add(psEng);
                        #endregion

                        List<Urunler> EngUrunList = new List<Urunler>();
                        EngUrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == EngurunSerisiOid).ToList();

                        foreach (var item in EngUrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.EngAciklama;
                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            urunModel.URL = "en/industrial_applications_and_security_systems/" + us.EngWebUrl + "/" + ENGuzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> EngBannerList = new List<Banner>();
                    EngBannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == EngurunSerisiOid).ToList();

                    foreach (var item in EngBannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotografENG != null ? item.fotografENG : item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    return View(baseModel);
                    #region Eski Kod
                    //List<UrunSerisi> engList2 = db.UrunSerisi.Where(x => x.GCRecord == null && (x.UrunGrubu1.UrunGrubuAdi.Equals("Endüstriyel Panolar ve Kabinetler") || x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Mobese ve Saha Güvenlik Sistemleri")) && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = engList2;
                    //ViewData["EndustriyelGroup"] = engList2;
                    //List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in engList2)
                    //{
                    //    engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = engIndexFoto;

                    //return View();
                    #endregion
                    break;
                default:
                    return View();
                    break;
            }

        }

        public async Task<ActionResult> EndustriyelGuvenlikGruplari(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            Guid grupOid = Guid.Parse("8A1AC735-D8BD-4F28-A989-5FE3BFC6E442");
            Guid grupOid2 = Guid.Parse("9F6B6B37-0E3E-453B-B58C-7CDA7CB40A90");
            urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && (z.UrunAilesi1.Oid == grupOid || z.UrunAilesi1.Oid == grupOid2)).OrderBy(z => z.Index).ToList();
            switch (dil)
            {
                case "tr":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.UrunSerisiAdi;
                        um.Aciklama = item.Aciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "tr/endustriyel_uygulamalar_ve_guvenlik_sistemleri/" + item.WebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner Banner = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("1E55FF10-D60C-4AC3-89EB-427CB8D9A821");
                        Guid grupOid4 = Guid.Parse("1860F3F2-BFFA-477B-8C50-CC6E11B41187");
                        Banner = db.Banner.Where(z => z.GCRecord == null && (z.UrunGrubu.Oid == grupOid3 || z.UrunGrubu.Oid == grupOid4)).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = Banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception) { }
                    #endregion
                    break;
                case "en":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngUrunSerisiAdi;
                        um.Aciklama = item.EngAciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "en/industrial_applications_and_security_systems/" + item.EngWebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner BannerEng = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("1E55FF10-D60C-4AC3-89EB-427CB8D9A821");
                        Guid grupOid4 = Guid.Parse("1860F3F2-BFFA-477B-8C50-CC6E11B41187");
                        BannerEng = db.Banner.Where(z => z.GCRecord == null && (z.UrunGrubu.Oid == grupOid3 || z.UrunGrubu.Oid == grupOid4)).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = (BannerEng.fotografENG == null) ? BannerEng.fotograf : BannerEng.fotografENG;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                default:
                    break;
            }

            return View(baseModel);
        }

        public async Task<ActionResult> Datacenter(string dil, BaseModel baseModel, string UrunSerisiAdi)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productSeri = new List<ProductSeri>();
            baseModel.bannerModels = new List<BannerModel>();

            List<UrunSerisi> urunseriList = new List<UrunSerisi>();
            UrunSerisi urunseri;
            switch (dil)
            {
                case "tr":
                    if (UrunSerisiAdi == "tum_urunler")
                    {
                        Guid grupOid = Guid.Parse("B58CFD3C-81E7-4788-B142-6A761FB10672");
                        Guid grupOid2 = Guid.Parse("EB9C9079-CB13-4DDD-9BC2-7FD004045A61");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && (z.UrunGrubu1.Oid == grupOid || z.UrunGrubu1.Oid == grupOid2)).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.WebUrl == UrunSerisiAdi).ToList();
                    }

                    Guid urunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        urunSerisiOid = us.Oid;
                        #region Seri Linkleme
                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = us.UrunSerisiAdi;
                        ps.seriUrl = "tr/veri_merkezi_cozumleri/" + us.WebUrl;
                        baseModel.productSeri.Add(ps);
                        #endregion

                        List<Urunler> UrunList = new List<Urunler>();
                        UrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == urunSerisiOid).ToList();

                        foreach (var item in UrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.Aciklama;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/veri_merkezi_cozumleri/" + us.WebUrl + "/" + uzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> BannerList = new List<Banner>();
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid).ToList();

                    foreach (var item in BannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    return View(baseModel);
                    #region EskiKod
                    //List<UrunSerisi> List = new List<UrunSerisi>();
                    //List<UrunSerisi> List2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Veri Merkezi Çözümleri") || 
                    //x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Soğutma Çözümleri") && x.Web == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = List2;
                    //ViewData["DatacenterGroup"] = List2;
                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in List2)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;
                    #endregion
                    break;
                case "en":
                    if (UrunSerisiAdi == "all_products")
                    {
                        Guid grupOid = Guid.Parse("B58CFD3C-81E7-4788-B142-6A761FB10672");
                        Guid grupOid2 = Guid.Parse("EB9C9079-CB13-4DDD-9BC2-7FD004045A61");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && (z.UrunGrubu1.Oid == grupOid || z.UrunGrubu1.Oid == grupOid2)).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.EngWebUrl == UrunSerisiAdi).ToList();
                    }
                    Guid EngurunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        EngurunSerisiOid = us.Oid;

                        #region Seri Linkleme
                        ProductSeri psEng = new ProductSeri();
                        psEng.seriAdi = us.EngUrunSerisiAdi;
                        psEng.seriUrl = "en/data_center_solutions/" + us.EngWebUrl;
                        baseModel.productSeri.Add(psEng);
                        #endregion

                        List<Urunler> EngUrunList = new List<Urunler>();
                        EngUrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == EngurunSerisiOid).ToList();

                        foreach (var item in EngUrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.EngAciklama;
                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            //urunModel.URL = "en/data_center_solutions/" + us.EngWebUrl + "/" + ENGuzanti;
                            urunModel.URL = "en/data_center_solutions/" + us.EngWebUrl + "/" + ENGuzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> EngBannerList = new List<Banner>();
                    EngBannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == EngurunSerisiOid).ToList();

                    foreach (var item in EngBannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotografENG != null ? item.fotografENG : item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    return View(baseModel);


                    //List<UrunSerisi> engList = new List<UrunSerisi>();
                    //List<UrunSerisi> engList2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Veri Merkezi Çözümleri") || x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Soğutma Çözümleri") && x.EngWeb == true).ToList();
                    //ViewData["LayoutSeriList"] = engList2;
                    //ViewData["DatacenterGroup"] = engList2;
                    //List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in engList2)
                    //{
                    //    engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = engIndexFoto;
                    break;
                default:
                    break;
            }



            return View();
        }

        public async Task<ActionResult> DataCenterGruplari(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            Guid grupOid = Guid.Parse("513C1AE6-115B-49EE-BB09-E4209527929C");
            Guid grupOid2 = Guid.Parse("DDDF8D47-0BDB-4BBF-96AC-2ED580719543");
            urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && (z.UrunAilesi1.Oid == grupOid || z.UrunAilesi1.Oid == grupOid2)).OrderBy(z => z.Index).ToList();
            switch (dil)
            {
                case "tr":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.UrunSerisiAdi;
                        um.Aciklama = item.Aciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "tr/veri_merkezi_cozumleri/" + item.WebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    List<UrunGrubu> BannerList = new List<UrunGrubu>();
                    Banner banner = new Banner();

                    //BannerList = db.UrunGrubu.Where(z => z.GCRecord == null && (z.UrunAilesi1.Oid == grupOid  || z.UrunAilesi1.Oid == grupOid2)).ToList();
                    //foreach (var item in BannerList)
                    //{
                    //    banner = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == item.Oid).FirstOrDefault();
                    //}

                    try
                    {
                        Guid grupOid3 = Guid.Parse("B58CFD3C-81E7-4788-B142-6A761FB10672");
                        Guid grupOid4 = Guid.Parse("EB9C9079-CB13-4DDD-9BC2-7FD004045A61");
                        Guid grupOid5 = Guid.Parse("11AFAF81-2566-4646-8F43-D4E6A57048A6");
                        banner = db.Banner.Where(z => z.GCRecord == null && (z.UrunGrubu.Oid == grupOid3 || z.UrunGrubu.Oid == grupOid4 || z.UrunGrubu.Oid == grupOid5)).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                        string a = "";
                    }
                    #endregion
                    break;
                case "en":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngUrunSerisiAdi;
                        um.Aciklama = item.EngAciklama;
                        //Fotograflar FotiEng = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf FotiEng = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = FotiEng == null ? null : FotiEng.fotograf;
                        um.URL = "en/data_center_solutions/" + item.EngWebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner BannerEng = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("B58CFD3C-81E7-4788-B142-6A761FB10672");
                        Guid grupOid4 = Guid.Parse("EB9C9079-CB13-4DDD-9BC2-7FD004045A61");
                        Guid grupOid5 = Guid.Parse("11AFAF81-2566-4646-8F43-D4E6A57048A6");
                        BannerEng = db.Banner.Where(z => z.GCRecord == null && (z.UrunGrubu.Oid == grupOid3 || z.UrunGrubu.Oid == grupOid4 || z.UrunGrubu.Oid == grupOid5)).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = (BannerEng.fotografENG == null) ? BannerEng.fotograf : BannerEng.fotografENG;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                default:
                    break;
            }

            return View(baseModel);
        }

        public async Task<ActionResult> OrtamIzleme(string dil, BaseModel baseModel, string UrunSerisiAdi)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            baseModel.productSeri = new List<ProductSeri>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();
            UrunSerisi urunseri;
            switch (dil)
            {
                case "tr":
                    if (UrunSerisiAdi == "tum_urunler")
                    {
                        Guid grupOid = Guid.Parse("5FE8645A-08EB-49F2-A2D7-63C9B608EAD5");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.UrunGrubu1.Oid == grupOid).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.WebUrl == UrunSerisiAdi).ToList();
                    }

                    Guid urunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        urunSerisiOid = us.Oid;

                        #region Seri Linkleme
                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = us.UrunSerisiAdi;
                        ps.seriUrl = "tr/uzaktan_erisim_sistemleri/" + us.WebUrl;
                        baseModel.productSeri.Add(ps);
                        #endregion

                        List<Urunler> UrunList = new List<Urunler>();
                        UrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == urunSerisiOid).ToList();

                        foreach (var item in UrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.Aciklama;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/uzaktan_erisim_sistemleri/" + us.WebUrl + "/" + uzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    Banner BannerList = new Banner();
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid && z.UrunGrup == null).FirstOrDefault();

                    if (BannerList != null)
                    {
                        BannerModel bannner = new BannerModel();
                        bannner.fotograf = BannerList.fotograf;
                        baseModel.bannerModels.Add(bannner);
                    }
                    #endregion


                    return View(baseModel);
                    #region EskiKod
                    //List<UrunSerisi> List2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Uzaktan Erişim Sistemleri") && x.Web == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = List2;
                    //ViewData["OrtamIzlemeUrun"] = List2;
                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in List2)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;
                    //return View();
                    #endregion
                    break;
                case "en":
                    if (UrunSerisiAdi == "all_products")
                    {
                        Guid grupOid = Guid.Parse("5FE8645A-08EB-49F2-A2D7-63C9B608EAD5");
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.UrunGrubu1.Oid == grupOid).ToList();
                    }
                    else
                    {
                        urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.EngWebUrl == UrunSerisiAdi).ToList();
                    }


                    Guid EngurunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        EngurunSerisiOid = us.Oid;

                        #region Seri Linkleme
                        ProductSeri psEng = new ProductSeri();
                        psEng.seriAdi = us.EngUrunSerisiAdi;
                        psEng.seriUrl = "en/remote_management_systems/" + us.EngWebUrl;
                        baseModel.productSeri.Add(psEng);
                        #endregion

                        List<Urunler> EngUrunList = new List<Urunler>();
                        EngUrunList = db.Urunler.Where(z => z.GCRecord == null && z.EngWeb == true && z.urunSerisi == EngurunSerisiOid).ToList();

                        foreach (var item in EngUrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.EngAciklama;
                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            urunModel.URL = "en/remote_management_systems/" + us.EngWebUrl + "/" + ENGuzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == EngurunSerisiOid).FirstOrDefault();

                    if (BannerList != null)
                    {
                        BannerModel banner = new BannerModel();
                        banner.fotograf = /*BannerList.fotografENG != null ? BannerList.fotografENG : */BannerList.fotograf;
                        baseModel.bannerModels.Add(banner);
                    }

                    #endregion

                    return View(baseModel);
                    #region EskiKod
                    //List<UrunSerisi> _List2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Uzaktan Erişim Sistemleri") && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = _List2;
                    //ViewData["OrtamIzlemeUrun"] = _List2;
                    //List<Fotograflar> _IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in _List2)
                    //{
                    //    _IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = _IndexFoto;

                    //return View();
                    #endregion
                    break;
                default:
                    return View();
                    break;
            }

        }

        public async Task<ActionResult> OrtamIzlemeGruplari(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            Guid grupOid = Guid.Parse("4149EDE8-C9AF-48DE-A712-64F0C2F7251E");
            urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.UrunAilesi1.Oid == grupOid).OrderBy(z => z.Index).ToList();
            switch (dil)
            {
                case "tr":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.UrunSerisiAdi;
                        um.Aciklama = item.Aciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "tr/uzaktan_erisim_sistemleri/" + item.WebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner Banner = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("5FE8645A-08EB-49F2-A2D7-63C9B608EAD5");
                        Banner = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == grupOid3).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = Banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                case "en":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngUrunSerisiAdi;
                        um.Aciklama = item.EngAciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "en/remote_management_systems/" + item.EngWebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner BannerEng = new Banner();
                    try
                    {
                        Guid grupOid3 = Guid.Parse("5FE8645A-08EB-49F2-A2D7-63C9B608EAD5");
                        BannerEng = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == grupOid3).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = (BannerEng.fotografENG == null) ? BannerEng.fotograf : BannerEng.fotografENG;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                default:
                    break;
            }

            return View(baseModel);
        }

        public async Task<ActionResult> HomeOffice(string dil, BaseModel baseModel, string UrunSerisiAdi)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            baseModel.productSeri = new List<ProductSeri>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();
            UrunSerisi urunseri;
            switch (dil)
            {
                case "tr":
                    urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.WebUrl == UrunSerisiAdi).ToList();

                    Guid urunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        urunSerisiOid = us.Oid;

                        #region Seri Linkleme
                        ProductSeri ps = new ProductSeri();
                        ps.seriAdi = us.UrunSerisiAdi;
                        ps.seriUrl = "tr/lande_home_office_urunleri/" + us.WebUrl;
                        baseModel.productSeri.Add(ps);
                        #endregion

                        List<Urunler> UrunList = new List<Urunler>();
                        UrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == urunSerisiOid).ToList();

                        foreach (var item in UrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.Aciklama;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/lande_home_office_urunleri/" + us.WebUrl + "/" + uzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> BannerList = new List<Banner>();
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == urunSerisiOid).ToList();

                    foreach (var item in BannerList)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion


                    return View(baseModel);
                    #region EskiKod
                    //List<UrunSerisi> List2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Uzaktan Erişim Sistemleri") && x.Web == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = List2;
                    //ViewData["OrtamIzlemeUrun"] = List2;
                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in List2)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;
                    //return View();
                    #endregion
                    break;
                case "en":
                    urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWeb == true && z.EngWebUrl == UrunSerisiAdi).ToList();


                    Guid EngurunSerisiOid = new Guid();
                    foreach (UrunSerisi us in urunseriList)
                    {
                        EngurunSerisiOid = us.Oid;

                        #region Seri Linkleme
                        ProductSeri psEng = new ProductSeri();
                        psEng.seriAdi = us.EngUrunSerisiAdi;
                        psEng.seriUrl = "en/lande_home_office_products/" + us.EngWebUrl;
                        baseModel.productSeri.Add(psEng);
                        #endregion

                        List<Urunler> EngUrunList = new List<Urunler>();
                        EngUrunList = db.Urunler.Where(z => z.GCRecord == null && z.Web == true && z.urunSerisi == EngurunSerisiOid).ToList();

                        foreach (var item in EngUrunList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.KatalogKodu;
                            urunModel.Aciklama = item.EngAciklama;
                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            urunModel.URL = "en/lande_home_office_products/" + us.EngWebUrl + "/" + ENGuzanti;
                            //Fotograflar Foti = db.Fotograflar.SingleOrDefault(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.urunler == item.Oid);
                            WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.Urunler.Oid == item.Oid && z.Web == true && z.Index == 1).FirstOrDefault();
                            urunModel.fotograf = Foti == null ? null : Foti.fotograf;

                            baseModel.urunModel.Add(urunModel);
                        }
                    }
                    #region Banner
                    List<Banner> BannerListEng = new List<Banner>();
                    BannerList = db.Banner.Where(z => z.GCRecord == null && z.UrunSerisi == EngurunSerisiOid).ToList();

                    foreach (var item in BannerListEng)
                    {
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = item.fotografENG != null ? item.fotografENG : item.fotograf;

                        baseModel.bannerModels.Add(urunModel);
                    }
                    #endregion

                    return View(baseModel);
                    #region EskiKod
                    //List<UrunSerisi> _List2 = db.UrunSerisi.Where(x => x.GCRecord == null && x.UrunGrubu1.UrunGrubuAdi.Equals("Uzaktan Erişim Sistemleri") && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    //ViewData["LayoutSeriList"] = _List2;
                    //ViewData["OrtamIzlemeUrun"] = _List2;
                    //List<Fotograflar> _IndexFoto = new List<Fotograflar>();
                    //foreach (UrunSerisi item in _List2)
                    //{
                    //    _IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.UrunSerisi1.Oid == item.Oid && x.urunler == null));
                    //}
                    //ViewData["Fotograflar"] = _IndexFoto;

                    //return View();
                    #endregion
                    break;
                default:
                    return View();
                    break;
            }

        }

        public async Task<ActionResult> HomeOfiiceGruplari(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            List<UrunSerisi> urunseriList = new List<UrunSerisi>();

            Guid grupOid = Guid.Parse("A486842E-A247-4B67-A2E4-EBD34396E393");
            urunseriList = db.UrunSerisi.Where(z => z.GCRecord == null && z.Web == true && z.UrunAilesi1.Oid == grupOid).OrderBy(z => z.Index).ToList();
            switch (dil)
            {
                case "tr":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.UrunSerisiAdi;
                        um.Aciklama = item.Aciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "tr/lande_home_office_urunleri/" + item.WebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner Banner = new Banner();
                    try
                    {
                        Guid grupOid3 = urunseriList[0].UrunGrubu1.Oid;
                        Banner = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == grupOid3).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = Banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                case "en":
                    foreach (UrunSerisi item in urunseriList)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngUrunSerisiAdi;
                        um.Aciklama = item.EngAciklama;
                        //Fotograflar Foti = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.UrunSerisi1.Oid == item.Oid).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        um.URL = "en/lande_home_office_products/" + item.EngWebUrl;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner BannerEng = new Banner();
                    try
                    {
                        Guid grupOid3 = urunseriList[0].UrunGrubu1.Oid;
                        BannerEng = db.Banner.Where(z => z.GCRecord == null && z.UrunGrubu.Oid == grupOid3).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = (BannerEng.fotografENG == null) ? BannerEng.fotograf : BannerEng.fotografENG;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    break;
                default:
                    break;
            }

            return View(baseModel);
        }

        //public ActionResult Aksesuarlar(String urunOidst, string dil)
        //{
        //    dil = dil.ToUpper();
        //    ViewBag.dil = dil;
        //    Guid urunOid = Guid.Parse(urunOidForAks);
        //    switch (dil)
        //    {
        //        case "TR":

        //            if (urunOidst != null)
        //            {
        //                Guid aksgroupname = Guid.Parse(urunOidst);

        //                List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

        //                List<Aksesuar> aksList = new List<Aksesuar>();

        //                foreach (var item in UrunAks)
        //                {
        //                    Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.Web == true && x.AksesuarGrubu == aksgroupname);
        //                    if (aksesuar != null)
        //                    {
        //                        aksList.Add(aksesuar);
        //                    }

        //                }



        //                //List<Aksesuar> aksList = db.Aksesuar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.AksesuarGrubu1.AksesuarGrupAdi == aksgroupname).ToList();
        //                ViewData["AksList"] = aksList;
        //                return PartialView("Aksesuarlar");
        //            }
        //            else
        //            {

        //                List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

        //                List<Aksesuar> aksList = new List<Aksesuar>();

        //                foreach (var item in UrunAks)
        //                {
        //                    Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.Web == true);
        //                    if (aksesuar != null)
        //                    {
        //                        aksList.Add(aksesuar);
        //                    }

        //                }

        //                //List<Aksesuar> aksList = db.Aksesuar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid).ToList();
        //                ViewData["AksList"] = aksList;
        //                return PartialView("Aksesuarlar");
        //            }
        //            break;
        //        case "ENG":

        //            if (urunOidst != null)
        //            {
        //                Guid aksgroupname = Guid.Parse(urunOidst);


        //                List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

        //                List<Aksesuar> aksList = new List<Aksesuar>();

        //                foreach (var item in UrunAks)
        //                {
        //                    Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.EngWeb == true && x.AksesuarGrubu == aksgroupname);
        //                    if (aksesuar != null)
        //                    {
        //                        aksList.Add(aksesuar);
        //                    }

        //                }

        //                ViewData["AksList"] = aksList;


        //                return PartialView("Aksesuarlar");
        //            }
        //            else
        //            {

        //                List<Urunlerurunler_Aksesuaraksesuar> UrunAks = db.Urunlerurunler_Aksesuaraksesuar.Where(x => x.urunler == urunOid).ToList();

        //                List<Aksesuar> aksList = new List<Aksesuar>();

        //                foreach (var item in UrunAks)
        //                {
        //                    Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(x => x.GCRecord == null && x.Oid == item.aksesuar && x.EngWeb == true);
        //                    if (aksesuar != null)
        //                    {
        //                        aksList.Add(aksesuar);
        //                    }

        //                }

        //                ViewData["AksList"] = aksList;


        //                return PartialView("Aksesuarlar");
        //            }
        //            break;
        //        default:
        //            return PartialView("Aksesuarlar");
        //            break;
        //    }


        //}
        public async Task<ActionResult> Aksesuarlar(string AksesuarGrubuAdi, string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.productGrup = new List<ProductGrup>();
            baseModel.bannerModels = new List<BannerModel>();
            List<AksesuarGrubu> AksGrupList = new List<AksesuarGrubu>();

            if (string.IsNullOrEmpty(AksesuarGrubuAdi))
            {
                return View("~/Views/Shared/Error.cshtml");
            }
            switch (dil)
            {
                case "tr":
                    if (!string.IsNullOrEmpty(AksesuarGrubuAdi))
                    {
                        if (AksesuarGrubuAdi == "tum_urunler")
                        {
                            AksGrupList = db.AksesuarGrubu.Where(x => x.Web == true && x.GCRecord == null).ToList();
                        }
                        else
                        {
                            AksGrupList = db.AksesuarGrubu.Where(x => x.Web == true && x.GCRecord == null && x.WebUrl == AksesuarGrubuAdi).ToList();
                        }

                        try
                        {
                            Guid AksesuarGrupOid;
                            foreach (AksesuarGrubu ag in AksGrupList)
                            {
                                AksesuarGrupOid = ag.Oid;

                                ProductGrup aksgrup = new ProductGrup();
                                aksgrup.grupAdi = ag.AksesuarGrupAdi;
                                aksgrup.grupUrl = "tr/aksesuarlar/" + ag.WebUrl;
                                baseModel.productGrup.Add(aksgrup);

                                List<Aksesuar> AksesuarList = new List<Aksesuar>();
                                AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.Web == true && x.GCRecord == null).ToList();
                                foreach (var item in AksesuarList)
                                {
                                    UrunModel urunModel = new UrunModel();
                                    urunModel.Baslik = item.AksesuarAdi;
                                    urunModel.Aciklama = item.Aciklama;
                                    //Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.aksesuar == item.Oid);
                                    WebFotograf foti = db.WebFotograf.Where(x => (x.Index == 1 || x.Index == 0) && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid).FirstOrDefault();
                                    urunModel.fotograf = foti == null ? null : foti.fotograf;
                                    urunModel.KatalogKodu = item.AksesuarKodu;
                                    string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                                    urunModel.URL = "tr/aksesuarlar/" + AksesuarGrubuAdi + "/" + uzanti;
                                    baseModel.urunModel.Add(urunModel);
                                }
                            }
                            #region Banner
                            List<Banner> BannerList = new List<Banner>();
                            BannerList = db.Banner.Where(z => z.GCRecord == null && z.AksesuarGrubu.WebUrl == AksesuarGrubuAdi).ToList();

                            foreach (var item in BannerList)
                            {
                                BannerModel urunModel = new BannerModel();
                                urunModel.fotograf = item.fotograf;

                                baseModel.bannerModels.Add(urunModel);
                            }
                            #endregion

                            return View(baseModel);
                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }
                    else
                    {
                        Guid AksesuarGrupOid = db.AksesuarGrubu.FirstOrDefault(x => x.EngWeb == false && x.GCRecord == null).Oid;

                        List<Aksesuar> AksesuarList = new List<Aksesuar>();
                        AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.Web == true && x.GCRecord == null).ToList();
                        foreach (var item in AksesuarList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.AksesuarAdi;
                            urunModel.Aciklama = item.Aciklama;
                            Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null &&
                              x.aksesuar == item.Oid);
                            urunModel.fotograf = foti == null ? null : foti.fotograf;
                            urunModel.KatalogKodu = item.AksesuarKodu;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/aksesuarlar/" + AksesuarGrubuAdi + "/" + uzanti;
                            baseModel.urunModel.Add(urunModel);
                        }

                        return View(baseModel);
                    }
                    break;
                case "en":
                    if (!string.IsNullOrEmpty(AksesuarGrubuAdi))
                    {
                        if (AksesuarGrubuAdi == "all_products")
                        {
                            AksGrupList = db.AksesuarGrubu.Where(x => x.EngWeb == true && x.GCRecord == null).ToList();
                        }
                        else
                        {
                            AksGrupList = db.AksesuarGrubu.Where(x => x.EngWeb == true && x.GCRecord == null && x.EngWebUrl == AksesuarGrubuAdi).ToList();
                        }

                        try
                        {
                            Guid AksesuarGrupOid;
                            foreach (AksesuarGrubu ag in AksGrupList)
                            {
                                AksesuarGrupOid = ag.Oid;
                                ProductGrup aksgrupEng = new ProductGrup();
                                aksgrupEng.grupAdi = ag.EngAksesuarGrupAdi;
                                aksgrupEng.grupUrl = "en/accessories/" + ag.EngWebUrl;
                                baseModel.productGrup.Add(aksgrupEng);

                                List<Aksesuar> AksesuarList = new List<Aksesuar>();
                                AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.EngWeb == true && x.GCRecord == null).ToList();
                                foreach (var item in AksesuarList)
                                {
                                    UrunModel urunModel = new UrunModel();
                                    urunModel.Baslik = item.EngAksesuarAdi;
                                    urunModel.Aciklama = item.EngAciklama;
                                    Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null &&
                                    x.aksesuar == item.Oid);
                                    urunModel.KatalogKodu = item.AksesuarKodu;
                                    urunModel.fotograf = foti == null ? null : foti.fotograf;
                                    string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) == null ? "UrlIsNull" : item.EngWebUrl;
                                    urunModel.URL = "en/accessories/" + AksesuarGrubuAdi + "/" + ENGuzanti;
                                    baseModel.urunModel.Add(urunModel);
                                }
                            }
                            #region Banner
                            List<Banner> BannerList = new List<Banner>();
                            BannerList = db.Banner.Where(z => z.GCRecord == null && z.AksesuarGrubu.EngWebUrl == AksesuarGrubuAdi).ToList();

                            foreach (var item in BannerList)
                            {
                                BannerModel urunModel = new BannerModel();
                                urunModel.fotograf = item.fotografENG;

                                baseModel.bannerModels.Add(urunModel);
                            }
                            #endregion
                        }
                        catch (Exception)
                        {

                            throw;
                        }


                        return View(baseModel);
                    }
                    else
                    {
                        Guid AksesuarGrupOid = db.AksesuarGrubu.FirstOrDefault(x => x.EngWeb == true && x.GCRecord == null).Oid;

                        List<Aksesuar> AksesuarList = new List<Aksesuar>();
                        AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.EngWeb == true && x.GCRecord == null).ToList();
                        foreach (var item in AksesuarList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.AksesuarAdi;
                            urunModel.Aciklama = item.Aciklama;
                            Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null &&
                            x.aksesuar == item.Oid);
                            urunModel.fotograf = foti == null ? null : foti.fotograf;

                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            urunModel.URL = "en/accessories/" + AksesuarGrubuAdi + "/" + ENGuzanti;
                            baseModel.urunModel.Add(urunModel);
                        }

                        return View(baseModel);
                    }
                    break;
                default:
                    return PartialView("Aksesuarlar");
                    break;
            }


        }
        public ActionResult DilDestegiYok(string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            return View();
        }
        public ActionResult AksesuarlarPartial(string urunOid, string AksesuarGrubuAdi, string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel.urunModel = new List<UrunModel>();
            baseModel.productGrup = new List<ProductGrup>();
            Guid urunguid = Guid.Parse(urunOid);

            if (string.IsNullOrEmpty(AksesuarGrubuAdi))
            {
                return View("~/Views/Shared/Error.cshtml");
            }
            switch (dil)
            {
                case "tr":
                    if (!string.IsNullOrEmpty(AksesuarGrubuAdi))
                    {
                        AksesuarGrubu AksGrup = db.AksesuarGrubu.Where(x => x.Web == true && x.GCRecord == null &&
                          x.WebUrl == AksesuarGrubuAdi).FirstOrDefault();

                        try
                        {
                            Guid AksesuarGrupOid = AksGrup.Oid;

                            ProductGrup aksgrup = new ProductGrup();
                            aksgrup.grupAdi = AksGrup.AksesuarGrupAdi;
                            aksgrup.grupUrl = "tr/aksesuarlar/" + AksGrup.WebUrl;
                            baseModel.productGrup.Add(aksgrup);

                            List<Urunlerurunler_Aksesuaraksesuar> AksesuarList = new List<Urunlerurunler_Aksesuaraksesuar>();
                            //AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.Web == true && x.GCRecord == null).ToList();
                            AksesuarList = db.Urunlerurunler_Aksesuaraksesuar.Where(z => z.Urunler1.Oid == urunguid && z.Aksesuar1.AksesuarGrubu1.WebUrl == AksesuarGrubuAdi).ToList();
                            foreach (var item in AksesuarList)
                            {
                                UrunModel urunModel = new UrunModel();
                                urunModel.Baslik = item.Aksesuar1.AksesuarAdi;
                                urunModel.Aciklama = item.Aksesuar1.Aciklama;
                                //Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.aksesuar == item.Oid);
                                WebFotograf foti = db.WebFotograf.SingleOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Aksesuar1.Oid);
                                urunModel.fotograf = foti == null ? null : foti.fotograf;

                                string uzanti = string.IsNullOrEmpty(item.Aksesuar1.WebUrl) ? "UrlAlaniBos" : item.Aksesuar1.WebUrl;
                                urunModel.URL = "tr/aksesuarlar/" + AksesuarGrubuAdi + "/" + uzanti;
                                baseModel.urunModel.Add(urunModel);
                            }

                            return View(baseModel);
                        }
                        catch (Exception)
                        {

                            throw;
                        }


                    }
                    else
                    {
                        Guid AksesuarGrupOid = db.AksesuarGrubu.FirstOrDefault(x => x.EngWeb == false && x.GCRecord == null).Oid;

                        List<Aksesuar> AksesuarList = new List<Aksesuar>();
                        AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.Web == true && x.GCRecord == null).ToList();
                        foreach (var item in AksesuarList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.AksesuarAdi;
                            urunModel.Aciklama = item.Aciklama;
                            //Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.aksesuar == item.Oid);
                            WebFotograf foti = db.WebFotograf.SingleOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid);
                            urunModel.fotograf = foti == null ? null : foti.fotograf;
                            string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "UrlAlaniBos" : item.WebUrl;
                            urunModel.URL = "tr/aksesuarlar/" + AksesuarGrubuAdi + "/" + uzanti;
                            baseModel.urunModel.Add(urunModel);
                        }

                        return View(baseModel);
                    }
                    break;
                case "en":
                    if (!string.IsNullOrEmpty(AksesuarGrubuAdi))
                    {
                        AksesuarGrubu AksGrupEng = db.AksesuarGrubu.Where(x => x.EngWeb == true && x.GCRecord == null &&
                          x.EngWebUrl == AksesuarGrubuAdi).FirstOrDefault();

                        Guid AksesuarGrupOid = AksGrupEng.Oid;

                        ProductGrup aksgrupEng = new ProductGrup();
                        aksgrupEng.grupAdi = AksGrupEng.EngAksesuarGrupAdi;
                        aksgrupEng.grupUrl = "en/accessories/" + AksGrupEng.EngWebUrl;
                        baseModel.productGrup.Add(aksgrupEng);

                        List<Urunlerurunler_Aksesuaraksesuar> AksesuarList = new List<Urunlerurunler_Aksesuaraksesuar>();
                        //AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.EngWeb == true && x.GCRecord == null).ToList();
                        AksesuarList = db.Urunlerurunler_Aksesuaraksesuar.Where(z => z.Urunler1.Oid == urunguid && z.Aksesuar1.AksesuarGrubu1.EngWebUrl == AksesuarGrubuAdi).ToList();
                        foreach (var item in AksesuarList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.Aksesuar1.EngAksesuarAdi;
                            urunModel.Aciklama = item.Aksesuar1.EngAciklama;
                            //Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.aksesuar == item.Oid);
                            WebFotograf foti = db.WebFotograf.SingleOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Aksesuar1.Oid);
                            urunModel.fotograf = foti == null ? null : foti.fotograf;

                            string ENGuzanti = string.IsNullOrEmpty(item.Aksesuar1.EngWebUrl) == null ? "UrlIsNull" : item.Aksesuar1.EngWebUrl;
                            urunModel.URL = "en/accessories/" + AksesuarGrubuAdi + "/" + ENGuzanti;
                            baseModel.urunModel.Add(urunModel);
                        }

                        return View(baseModel);
                    }
                    else
                    {
                        Guid AksesuarGrupOid = db.AksesuarGrubu.FirstOrDefault(x => x.EngWeb == true && x.GCRecord == null).Oid;

                        List<Aksesuar> AksesuarList = new List<Aksesuar>();
                        AksesuarList = db.Aksesuar.Where(x => x.AksesuarGrubu == AksesuarGrupOid && x.EngWeb == true && x.GCRecord == null).ToList();
                        foreach (var item in AksesuarList)
                        {
                            UrunModel urunModel = new UrunModel();
                            urunModel.Baslik = item.AksesuarAdi;
                            urunModel.Aciklama = item.Aciklama;
                            //Fotograflar foti = db.Fotograflar.SingleOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.aksesuar == item.Oid);
                            WebFotograf foti = db.WebFotograf.SingleOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid);
                            urunModel.fotograf = foti == null ? null : foti.fotograf;

                            string ENGuzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "UrlIsNull" : item.EngWebUrl;
                            urunModel.URL = "en/accessories/" + AksesuarGrubuAdi + "/" + ENGuzanti;
                            baseModel.urunModel.Add(urunModel);
                        }

                        return View(baseModel);
                    }
                    break;
                default:
                    return PartialView("Aksesuarlar");
                    break;
            }


        }

        public ActionResult Fotograflar(String urunOidst, string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            switch (dil)
            {
                case "tr":
                    if (urunOidst != null)
                    {

                        Guid urunOid = Guid.Parse(urunOidst);
                        List<Fotograflar> foto = db.Fotograflar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).OrderBy(x => x.Index).ToList();

                        ViewData["Foto"] = foto;
                        return PartialView("Fotograflar");
                    }
                    else
                    {

                        Guid urunOid = Guid.Parse(urunOidForAks);
                        List<Fotograflar> foto = db.Fotograflar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.Web == true).OrderBy(x => x.Index).ToList();

                        if (foto.Count < 1)
                        {
                            foto = db.Fotograflar.Where(x => x.GCRecord == null && x.Aksesuar1.Oid == urunOid && x.Web == true).OrderBy(x => x.Index).ToList();
                        }

                        ViewData["Foto"] = foto;
                        return PartialView("Fotograflar");

                    }
                    break;
                case "en":
                    if (urunOidst != null)
                    {

                        Guid urunOid = Guid.Parse(urunOidst);
                        List<Fotograflar> foto = db.Fotograflar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).OrderBy(x => x.Index).ToList();

                        ViewData["Foto"] = foto;
                        return PartialView("Fotograflar");
                    }
                    else
                    {

                        Guid urunOid = Guid.Parse(urunOidForAks);
                        List<Fotograflar> foto = db.Fotograflar.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).OrderBy(x => x.Index).ToList();

                        if (foto.Count < 1)
                        {
                            foto = db.Fotograflar.Where(x => x.GCRecord == null && x.Aksesuar1.Oid == urunOid && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                        }

                        ViewData["Foto"] = foto;
                        return PartialView("Fotograflar");

                    }
                    break;
                default:
                    return PartialView("Fotograflar");
                    break;
            }


        }

        public ActionResult Accessories(Guid AksGrubuOid, string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            Layout(dil);
            switch (dil)
            {
                case "tr":
                    List<String> aksAdi = new List<String>();
                    List<Aksesuar> aksList = new List<Aksesuar>();
                    List<Aksesuar> aksList2 = db.Aksesuar.Where(x => x.GCRecord == null && x.AksesuarGrubu1.Oid == AksGrubuOid && x.Web == true).OrderBy(x => x.Index).ToList();
                    foreach (Aksesuar x in aksList2)
                    {
                        if (!aksAdi.Contains(x.AksesuarAdi))
                        {
                            aksAdi.Add(x.AksesuarAdi);
                            aksList.Add(x);
                        }

                    }
                    ViewData["Aks"] = aksList;


                    List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    foreach (Aksesuar item in aksList)
                    {
                        IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid));
                    }
                    ViewData["Fotograflar"] = IndexFoto;

                    return View(aksList);
                    break;
                case "en":
                    List<String> engaksAdi = new List<String>();
                    List<Aksesuar> engaksList = new List<Aksesuar>();
                    List<Aksesuar> engaksList2 = db.Aksesuar.Where(x => x.GCRecord == null && x.AksesuarGrubu1.Oid == AksGrubuOid && x.Web == true).OrderBy(x => x.Index).ToList();
                    foreach (Aksesuar x in engaksList2)
                    {
                        if (!engaksAdi.Contains(x.AksesuarAdi))
                        {
                            engaksAdi.Add(x.AksesuarAdi);
                            engaksList.Add(x);
                        }

                    }
                    ViewData["Aks"] = engaksList;

                    List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                    foreach (Aksesuar item in engaksList)
                    {
                        engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == item.Oid));
                    }
                    ViewData["Fotograflar"] = engIndexFoto;

                    return View(engaksList);
                    break;
                default:
                    return View();
                    break;
            }

        }
        public async Task<ActionResult> AccessoriesGroup(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.bannerModels = new List<BannerModel>();
            switch (dil)
            {
                case "tr":
                    List<AksesuarGrubu> aksList = new List<AksesuarGrubu>();
                    List<AksesuarGrubu> aksList2 = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.AksesuarGrupAdi != null && x.Web == true).OrderBy(x => x.Index).ToList();

                    foreach (AksesuarGrubu item in aksList2)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.AksesuarGrupAdi;
                        um.Aciklama = item.Aciklama;
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.AksesuarGrubu1.Oid == item.Oid && z.Web == true).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        //um.fotograf = item.fotograf;
                        string uzanti = string.IsNullOrEmpty(item.WebUrl) ? "AksesuarGrubuUrlBos" : item.WebUrl;
                        um.URL = "tr/aksesuarlar/" + uzanti;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner Banner = new Banner();
                    try
                    {
                        Banner = db.Banner.Where(z => z.GCRecord == null && z.AksesuarGrup != null && z.TumSeriler == true).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = Banner.fotograf;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    //foreach (AksesuarGrubu x in aksList2)
                    //{
                    //    if (!aksList.Select(y => y.AksesuarGrupAdi).Equals(x.AksesuarGrupAdi))
                    //    {
                    //        aksList.Add(x);
                    //    }

                    //}


                    //List<Fotograflar> IndexFoto = new List<Fotograflar>();
                    //foreach (AksesuarGrubu item in aksList)
                    //{
                    //    IndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.Web == true && x.GCRecord == null && x.urunler == item.Oid));
                    //}
                    //ViewData["Fotograflar"] = IndexFoto;
                    //ViewData["AksList"] = aksList;



                    //return View(aksList);
                    break;
                case "en":
                    List<AksesuarGrubu> engaksList = new List<AksesuarGrubu>();
                    List<AksesuarGrubu> engaksList2 = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.AksesuarGrupAdi != null && x.EngWeb == true).OrderBy(x => x.Index).ToList();

                    foreach (AksesuarGrubu item in engaksList2)
                    {
                        UrunModel um = new UrunModel();
                        um.Baslik = item.EngAksesuarGrupAdi;
                        um.Aciklama = item.EngAciklama;
                        WebFotograf Foti = db.WebFotograf.Where(z => z.GCRecord == null && z.AksesuarGrubu1.Oid == item.Oid && z.EngWeb == true).FirstOrDefault();
                        um.fotograf = Foti == null ? null : Foti.fotograf;
                        //um.fotograf = item.fotograf;
                        string uzanti = string.IsNullOrEmpty(item.EngWebUrl) ? "AccessoriesGroupUrlIsNull" : item.EngWebUrl;
                        um.URL = "en/accessories/" + uzanti;
                        baseModel.urunModel.Add(um);
                    }
                    #region Banner
                    Banner BannerEng = new Banner();
                    try
                    {
                        BannerEng = db.Banner.Where(z => z.GCRecord == null && z.AksesuarGrup != null && z.TumSeriler == true).FirstOrDefault();
                        BannerModel urunModel = new BannerModel();
                        urunModel.fotograf = BannerEng.fotografENG;
                        baseModel.bannerModels.Add(urunModel);
                    }
                    catch (Exception)
                    {
                    }
                    #endregion
                    //foreach (AksesuarGrubu x in engaksList2)
                    //{
                    //    if (!engaksList.Select(y => y.AksesuarGrupAdi).Equals(x.AksesuarGrupAdi))
                    //    {
                    //        engaksList.Add(x);
                    //    }

                    //}


                    //List<Fotograflar> engIndexFoto = new List<Fotograflar>();
                    //foreach (AksesuarGrubu item in engaksList)
                    //{
                    //    engIndexFoto.Add(db.Fotograflar.FirstOrDefault(x => x.Index == 1 && x.EngWeb == true && x.GCRecord == null && x.urunler == item.Oid));
                    //}
                    //ViewData["Fotograflar"] = engIndexFoto;
                    //ViewData["AksList"] = engaksList;
                    //return View(engaksList);
                    break;

                default:
                    //return View();
                    break;
            }
            return View(baseModel);
        }
        public async Task<ActionResult> Catalogue(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.katalogModels = new List<KatalogModel>();
            //baseModel.urunModel = new List<KatalogModel>();
            baseModel.katalogBaslikModels = new List<KatalogBaslikModel>();
            switch (dil)
            {
                case "tr":
                    //List<Kataloglar> listkatalog = db.Kataloglar.Where(x => x.GCRecord == null && x.Web == true && x.KataloglarSayfasi == true).ToList();

                    //ViewData["KatalogList"] = listkatalog;

                    List<KataloglarSayfasi> listKatalogBasliklari = db.KataloglarSayfasi.Where(x => x.GCRecord == null && x.Web == true).OrderBy(x => x.Index).ToList();

                    List<Kataloglar> listkatalog = db.Kataloglar.Where(x => x.GCRecord == null && x.Web == true && x.kataloglarSayfa != null).OrderBy(x => x.index).ToList();

                    foreach (var item in listkatalog)
                    {
                        KatalogModel katalogModel = new KatalogModel();
                        katalogModel.katalogAdi = item.KatalogAdi;
                        katalogModel.fotograf = item.fotograf;
                        katalogModel.uRL = item.Oid.ToString();
                        katalogModel.Oid = item.kataloglarSayfa.ToString();

                        baseModel.katalogModels.Add(katalogModel);
                    }

                    foreach (var item in listKatalogBasliklari)
                    {
                        KatalogBaslikModel katalogBaslik = new KatalogBaslikModel();
                        katalogBaslik.Oid = item.Oid.ToString();
                        katalogBaslik.Baslik = item.Baslik;
                        baseModel.katalogBaslikModels.Add(katalogBaslik);
                    }


                    //ViewData["KatalogBaslik"] = listKatalogBasliklari;

                    return View(baseModel);
                //break;
                case "en":
                    //List<Kataloglar> listkatalog = db.Kataloglar.Where(x => x.GCRecord == null && x.Web == true && x.KataloglarSayfasi == true).ToList();

                    //ViewData["KatalogList"] = listkatalog;

                    List<KataloglarSayfasi> englistKatalogBasliklari = db.KataloglarSayfasi.Where(x => x.GCRecord == null && x.EngWeb == true).OrderBy(x => x.Index).ToList();
                    List<Kataloglar> englistkatalog = db.Kataloglar.Where(x => x.GCRecord == null && x.EngWeb == true && x.kataloglarSayfa != null).OrderBy(x => x.index).ToList();
                    foreach (var item in englistkatalog)
                    {
                        KatalogModel katalogModel = new KatalogModel();
                        katalogModel.EngWebDokumanAdi = item.EngWebDokumanAdi;
                        katalogModel.fotograf = item.fotograf;
                        katalogModel.uRL = item.Oid.ToString();
                        katalogModel.Oid = item.kataloglarSayfa.ToString();

                        baseModel.katalogModels.Add(katalogModel);
                    }

                    foreach (var item in englistKatalogBasliklari)
                    {
                        KatalogBaslikModel katalogBaslik = new KatalogBaslikModel();
                        katalogBaslik.Baslikeng = item.BaslikEng;
                        katalogBaslik.Oid = item.Oid.ToString();
                        baseModel.katalogBaslikModels.Add(katalogBaslik);
                    }

                    return View(baseModel);

                default:
                    break;
            }


            return View();
        }
        [HttpGet]
        public async Task<ActionResult> SertifikaRaporBelge(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.sertifikalarModels = new List<SertifikalarModel>();
            baseModel.kaliteDokumanlariModels = new List<KaliteDokumanlariModel>();
            baseModel.raporlarModels = new List<RaporlarModel>();
            switch (dil)
            {
                case "tr":
                    List<Sertifikalar> sertifikalars = db.Sertifikalar.Where(x => x.GCRecord == null && x.Web == true && x.onay == true && x.GenelSayfadaGoster == true).ToList();
                    List<KaliteDokumanlari> kaliteDokumanlaris = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.Web == true && x.onay == true && x.GenelSayfadaGoster == true).ToList();
                    List<DigerDokumanlar> Raporlar = db.DigerDokumanlar.Where(x => x.GCRecord == null && x.Web == true && x.onay == true && x.DigerDokumanlarSayfasi == true).ToList();
                    foreach (var item in sertifikalars)
                    {
                        SertifikalarModel sertifikaModels = new SertifikalarModel();
                        sertifikaModels.Oid = item.Oid.ToString();
                        sertifikaModels.fotograf = item.fotograf;
                        sertifikaModels.WebDokumanAdi = item.WebDokumanAdi;
                        baseModel.sertifikalarModels.Add(sertifikaModels);
                    }
                    foreach (var item in kaliteDokumanlaris)
                    {
                        KaliteDokumanlariModel kalitedokumanlariModels = new KaliteDokumanlariModel();
                        kalitedokumanlariModels.Oid = item.Oid.ToString();
                        kalitedokumanlariModels.fotograf = item.fotograf;
                        kalitedokumanlariModels.WebDokumanAdi = item.WebDokumanAdi;
                        baseModel.kaliteDokumanlariModels.Add(kalitedokumanlariModels);
                    }
                    foreach (var item in Raporlar)
                    {
                        RaporlarModel raporlarModels = new RaporlarModel();
                        raporlarModels.Oid = item.Oid.ToString();
                        raporlarModels.fotograf = item.fotograf;
                        raporlarModels.WebDokumanAdi = item.WebDokumanAdi;
                        baseModel.raporlarModels.Add(raporlarModels);
                    }
                    return View(baseModel);

                case "en":

                    List<Sertifikalar> engsertifikalars = db.Sertifikalar.Where(x => x.GCRecord == null && x.EngWeb == true && x.onay == true && x.GenelSayfadaGoster == true).ToList();
                    List<KaliteDokumanlari> engkaliteDokumanlaris = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.EngWeb == true && x.onay == true && x.GenelSayfadaGoster == true).ToList();
                    List<DigerDokumanlar> engRaporlar = db.DigerDokumanlar.Where(x => x.GCRecord == null && x.EngWeb == true && x.onay == true && x.DigerDokumanlarSayfasi == true).ToList();
                    foreach (var item in engsertifikalars)
                    {
                        SertifikalarModel sertifikaModels = new SertifikalarModel();
                        sertifikaModels.Oid = item.Oid.ToString();
                        sertifikaModels.fotograf = item.fotograf;
                        sertifikaModels.EngWebDokumanAdi = item.EngWebDokumanAdi;
                        baseModel.sertifikalarModels.Add(sertifikaModels);
                    }
                    foreach (var item in engkaliteDokumanlaris)
                    {
                        KaliteDokumanlariModel kalitedokumanlariModels = new KaliteDokumanlariModel();
                        kalitedokumanlariModels.Oid = item.Oid.ToString();
                        kalitedokumanlariModels.fotograf = item.fotograf;
                        kalitedokumanlariModels.EngWebDokumanAdi = item.EngWebDokumanAdi;
                        baseModel.kaliteDokumanlariModels.Add(kalitedokumanlariModels);
                    }
                    foreach (var item in engRaporlar)
                    {
                        RaporlarModel raporlarModels = new RaporlarModel();
                        raporlarModels.Oid = item.Oid.ToString();
                        raporlarModels.fotograf = item.fotograf;
                        raporlarModels.EngWebDokumanAdi = item.EngWebDokumanAdi;
                        baseModel.raporlarModels.Add(raporlarModels);
                    }
                    return View(baseModel);

                default:
                    break;
            }
            return View();


        }

        public ActionResult DownloadCatalogue(Guid oid)
        {
            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            List<Kataloglar> list = db.Kataloglar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

            filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
            filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }
        public ActionResult ProductDescription(String urunOidst, string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            //Layout(dil);
            switch (dil)
            {
                case "tr":
                    if (urunOidst == null)
                    {
                        //Guid urunOid = Guid.Parse(urunOidst);

                        //List<Guid> allOidUrunler = new List<Guid>();
                        //string urunDesc = db.Urunler.Where(x => x.GCRecord == null && x.Oid == urunOid).Select(y => y.Aciklama).FirstOrDefault();


                        //List<UrunGrubu> listlayout = db.UrunGrubu.Where(x => x.GCRecord == null).ToList();
                        //ViewData["LayoutList"] = listlayout;
                        //List<UrunSerisi> listSeri = db.UrunSerisi.Where(x => x.GCRecord == null).ToList();
                        //ViewData["LayoutTumSeri"] = listSeri;
                        //List<AksesuarGrubu> aksList = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.Web == true).ToList();
                        //ViewData["AksGroup"] = aksList;
                        //List<Urunler> ortamList = db.Urunler.Where(x => x.GCRecord == null && x.Web == true && x.UrunSerisi1.UrunSerisiAdi.Equals("Ortam İzleme ve Yönetim Sistemi")).OrderBy(x => x.Index).ToList();
                        //ViewData["OrtamUrunler"] = ortamList;
                        //List<Kataloglar> genelK = db.Kataloglar.Where(x => x.GCRecord == null && x.LandeGenelKatalog == true).ToList(); ViewData["GenelKatalog"] = genelK;


                        //ViewData["ProDesc"] = urunDesc;
                        return PartialView("ProductDescription");
                    }
                    else
                    {

                        Guid urunOid = Guid.Parse(urunOidst);

                        List<Guid> allOidUrunler = new List<Guid>();
                        List<Urunler> urunDesc = db.Urunler.Where(x => x.GCRecord == null && x.Oid == urunOid).ToList();



                        ViewData["ProDesc"] = urunDesc;
                        return PartialView("ProductDescription");
                    }
                    break;
                case "en":
                    if (urunOidst == null)
                    {
                        //Guid urunOid = Guid.Parse(urunOidst);

                        //List<Guid> allOidUrunler = new List<Guid>();
                        //string urunDesc = db.Urunler.Where(x => x.GCRecord == null && x.Oid == urunOid).Select(y => y.EngAciklama).FirstOrDefault();


                        //List<UrunGrubu> listlayout = db.UrunGrubu.Where(x => x.GCRecord == null).ToList();
                        //ViewData["LayoutList"] = listlayout;
                        //List<UrunSerisi> listSeri = db.UrunSerisi.Where(x => x.GCRecord == null).ToList();
                        //ViewData["LayoutTumSeri"] = listSeri;
                        //List<AksesuarGrubu> aksList = db.AksesuarGrubu.Where(x => x.GCRecord == null && x.EngWeb == true).ToList();
                        //ViewData["AksGroup"] = aksList;
                        //List<Urunler> ortamList = db.Urunler.Where(x => x.GCRecord == null && x.EngWeb == true && x.UrunSerisi1.UrunSerisiAdi.Equals("Ortam İzleme ve Yönetim Sistemi")).ToList();
                        //ViewData["OrtamUrunler"] = ortamList;
                        //List<Kataloglar> genelK = db.Kataloglar.Where(x => x.GCRecord == null && x.EngLandeGenelKatalog == true).ToList(); ViewData["GenelKatalog"] = genelK;


                        //ViewData["ProDesc"] = urunDesc;
                        return PartialView("ProductDescription");
                    }
                    else
                    {

                        Guid urunOid = Guid.Parse(urunOidst);

                        List<Guid> allOidUrunler = new List<Guid>();
                        List<Urunler> urunDesc = db.Urunler.Where(x => x.GCRecord == null && x.Oid == urunOid).ToList();


                        ViewData["ProDesc"] = urunDesc;
                        return PartialView("ProductDescription");
                    }
                    break;
                default:
                    return PartialView();
                    break;
            }


        }

        public string MetinCevirme(string text)
        {
            char[] oldValue = new char[] { 'ö', 'Ö', 'ü', 'Ü', 'ç', 'Ç', 'İ', 'ı', 'Ğ', 'ğ', 'Ş', 'ş' };
            char[] newValue = new char[] { 'o', 'O', 'u', 'U', 'c', 'C', 'I', 'i', 'G', 'g', 'S', 's' };
            text = text.Replace("\r\n", "\r");
            text = text.Replace("\r\r", "\r");
            for (int sayac = 0; sayac < oldValue.Length; sayac++)
            {
                text = text.Replace(oldValue[sayac], newValue[sayac]);
            }
            return text;
        }
        public ActionResult CreatePdf(Guid oid, string dil, string url)
        {

            dil = dil.ToLower();
            ViewBag.dil = dil;
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("NDM5OTgyQDMxMzgyZTMyMmUzMEZIYnFCclM4TG1SYVRhNE9KclFETnpndmlzZDNnVGRUdnlHV2FYMjBNREE9");
            switch (dil)
            {
                #region TR
                case "tr":
                    #region Get Data from Database

                    List<Guid> allOidDegerler = new List<Guid>();
                    List<Guid> allOidOzellikler = new List<Guid>();
                    List<Degerler> degerlerList = db.Degerler.Where(y => y.GCRecord == null).ToList();
                    List<Ozellikler> ozellikList = db.Ozellikler.Where(y => y.GCRecord == null && y.Web == true).ToList();
                    List<Degerler> maindegerlerList = new List<Degerler>();
                    List<Ozellikler> mainozelliklerList = new List<Ozellikler>();
                    List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(y => y.GCRecord == null && y.Urunler1.Oid == oid && y.Deger != null).ToList();

                    foreach (UrunDegerler urundegerler in urundegerlerList)
                    {
                        if (urundegerler.Deger != null && urundegerler.Urunler1.Oid == oid)
                        {
                            allOidDegerler.Add(urundegerler.Degerler1.Oid);
                            allOidOzellikler.Add(urundegerler.Degerler1.Ozellikler1.Oid);
                        }

                    }
                    foreach (Degerler degerler in degerlerList)
                    {
                        if (allOidDegerler.Contains(degerler.Oid)) { maindegerlerList.Add(degerler); }
                    }

                    foreach (Ozellikler ozellikler in ozellikList)
                    {
                        if (allOidOzellikler.Contains(ozellikler.Oid))
                        {
                            mainozelliklerList.Add(ozellikler);
                        }
                    }
                    #endregion

                    IEnumerable<Urunler> urunDesc = db.Urunler.Where(y => y.GCRecord == null && y.Oid == oid).ToList();
                    Urunler urunAciklama = db.Urunler.Where(y => y.GCRecord == null && y.Oid == oid).FirstOrDefault();
                    //IEnumerable<Fotograflar> foto = db.Fotograflar.Where(y => y.GCRecord == null && y.Urunler1.Oid == oid).ToList();
                    IEnumerable<WebFotograf> foto = db.WebFotograf.Where(y => y.GCRecord == null && y.Urunler.Oid == oid).ToList();
                    #region Create PDF and font controls

                    PdfDocument document = new PdfDocument();
                    PdfPage page = document.Pages.Add();
                    PdfGraphics graphics = page.Graphics;
                    PdfFont font = new PdfStandardFont(PdfFontFamily.TimesRoman, 13);
                    PdfFont baslik = new PdfStandardFont(PdfFontFamily.TimesRoman, 20);
                    PdfFont fontPageNumber = new PdfStandardFont(PdfFontFamily.TimesRoman, 10, PdfFontStyle.Bold);
                    PdfFont FontBaslik = new PdfStandardFont(PdfFontFamily.TimesRoman, 23, PdfFontStyle.Bold);
                    PdfFont FontBaslik2 = new PdfStandardFont(PdfFontFamily.TimesRoman, 22);
                    PdfFont FontBaslik3 = new PdfStandardFont(PdfFontFamily.TimesRoman, 18);
                    #endregion

                    float temp = 138;
                    float width = 0;
                    float height = 0;
                    float yatay = 0;
                    string olcu;
                    string brim;
                    string deger;
                    int count = 0;
                    foreach (var item in foto)
                    {
                        if (count >= 3)
                        {
                            break;
                        }
                        else
                        {
                            MemoryStream stream = new MemoryStream(item.fotograf);
                            PdfBitmap image = new PdfBitmap(stream);
                            width = image.Width;
                            height = image.Height + 10;
                            yatay = (width / 2) + 45;
                            graphics.DrawImage(image, new RectangleF(20, temp, width / 2, height / 2));
                            temp = temp + (height / 2) + 10;
                            count++;
                        }
                    }

                    #region Header, Footer and horizontal line
                    RectangleF bounds = new RectangleF(0, 0, document.Pages[0].GetClientSize().Width + 100, 12);
                    PdfPageTemplateElement header = new PdfPageTemplateElement(bounds);
                    document.Template.Top = header;

                    PdfPageTemplateElement footer = new PdfPageTemplateElement(bounds);
                    document.Template.Bottom = footer;
                    //Üst Çizgi
                    PdfPen pen = new PdfPen(Color.LightGray, 25f);
                    header.Graphics.DrawLine(pen, 0, 0, document.Pages[0].GetClientSize().Width + 1000, 0);
                    //Alt Çizgi
                    pen = new PdfPen(Color.Red, 25f);
                    footer.Graphics.DrawLine(pen, 0, 0, document.Pages[0].GetClientSize().Width + 88, 0);
                    //Page Number
                    PdfSolidBrush brush = new PdfSolidBrush(Color.Gray);
                    PdfPageNumberField pageNumber = new PdfPageNumberField(fontPageNumber, brush);
                    pageNumber.Draw(footer.Graphics, new PointF(510, 1));
                    //Dikey Çizgi
                    pen = new PdfPen(Color.Gray, 0.2f);
                    graphics.DrawLine(pen, yatay, 125, yatay, 710);
                    #endregion

                    #region Başlık oluşturma ve gösterme
                    int satir = 18;

                    string Baslik = string.IsNullOrEmpty(urunAciklama.UrunGrubu1.UrunGrubuAdi) ? "" : urunAciklama.UrunGrubu1.UrunGrubuAdi + " - ";
                    Baslik += string.IsNullOrEmpty(urunAciklama.UrunSerisi1.UrunSerisiAdi) ? "" : urunAciklama.UrunSerisi1.UrunSerisiAdi + "\n";
                    Baslik = MetinCevirme(Baslik);//Türkçe karakterleri ingilizceye çevirdik
                    RectangleF columnBaslik = new RectangleF(0, satir, page.Graphics.ClientSize.Width, page.Graphics.ClientSize.Height);
                    graphics.DrawString(Baslik, FontBaslik, PdfBrushes.Black, columnBaslik);
                    int sayi = (int)Math.Ceiling(decimal.Parse((Baslik.Length / 43).ToString()));
                    satir += sayi * 23;

                    Baslik = "";
                    Baslik += (string.IsNullOrEmpty(urunAciklama.boyut.ToString())) ? "" : urunAciklama.Boyut1.Derinlik + "x";
                    Baslik += (string.IsNullOrEmpty(urunAciklama.boyut.ToString())) ? "" : urunAciklama.Boyut1.Genislik + " - ";
                    Baslik += (string.IsNullOrEmpty(urunAciklama.renk.ToString())) ? "" : urunAciklama.Renk1.renk1 + "\n";
                    Baslik = MetinCevirme(Baslik);

                    //satir = 46;
                    if (!string.IsNullOrEmpty(Baslik))
                    {
                        satir += 28;
                        graphics.DrawString(Baslik, FontBaslik2, PdfBrushes.Black, new PointF(0, satir));
                    }

                    Baslik = "";
                    Baslik += string.IsNullOrEmpty(urunAciklama.KatalogKodu) ? "" : urunAciklama.KatalogKodu;
                    Baslik = MetinCevirme(Baslik);
                    graphics.DrawString(Baslik, FontBaslik3, PdfBrushes.Red, new PointF(0, satir + 26));
                    #endregion

                    #region Ürün İçeriği Yazdırma

                    yatay += 10;
                    satir += 56;
                    if (!string.IsNullOrEmpty(urunAciklama.UrunSerisi1.Aciklama))
                    {
                        graphics.DrawString("Urun Serisi Bilgileri", FontBaslik3, PdfBrushes.Red, new PointF(yatay, satir));
                        satir += 26;
                        string Aciklama = urunAciklama.UrunSerisi1.Aciklama;
                        Aciklama = MetinCevirme(Aciklama);
                        RectangleF column = new RectangleF(yatay, satir, page.Graphics.ClientSize.Width / 2f + 30f, page.Graphics.ClientSize.Height);

                        graphics.DrawString(Aciklama, font, PdfBrushes.Black, column);
                        if (Aciklama.Length <= 52)
                        {
                            satir += 18;
                        }
                        else
                        {
                            sayi = (int)Math.Ceiling(decimal.Parse((Aciklama.Length / 52).ToString()));
                            satir += sayi * 18;
                        }
                    }
                    if (!string.IsNullOrEmpty(urunDesc.Select(y => y.Aciklama).FirstOrDefault()))
                    {
                        graphics.DrawString("Aciklama", FontBaslik3, PdfBrushes.Red, new PointF(yatay, satir));
                        satir += 26;
                        string Aciklama = urunDesc.Select(y => y.Aciklama).FirstOrDefault();
                        Aciklama = MetinCevirme(Aciklama);
                        RectangleF column = new RectangleF(yatay, satir, page.Graphics.ClientSize.Width / 2f + 30f, page.Graphics.ClientSize.Height);

                        graphics.DrawString(Aciklama, font, PdfBrushes.Black, column);
                        if (Aciklama.Length <= 52)
                        {
                            satir += 18;
                        }
                        else
                        {
                            sayi = (int)Math.Ceiling(decimal.Parse((Aciklama.Length / 52).ToString()));
                            satir += sayi * 18;
                        }

                    }

                    foreach (Ozellikler ozellikler1 in mainozelliklerList)
                    {
                        string ozellikAdi = MetinCevirme(ozellikler1.OzellikAdi);
                        graphics.DrawString(ozellikAdi, FontBaslik3, PdfBrushes.Red, new PointF(yatay, satir));
                        satir += 11;
                        foreach (Degerler degerler in maindegerlerList)
                        {
                            if (ozellikler1.Oid == degerler.ozellikler)
                            {
                                satir += 15;
                                foreach (UrunDegerler urunDegerler in urundegerlerList)
                                {

                                    if (urunDegerler.Degerler1 == degerler)
                                    {
                                        deger = degerler.DegerAdi;
                                        olcu = urunDegerler.Deger;
                                        if (degerler.DegerTipleri != null)
                                        {
                                            brim = degerler.DegerTipleri.DegerTipi;
                                            string metin = deger + ":" + " " + olcu + " " + brim;
                                            metin = "* " + MetinCevirme(metin);
                                            graphics.DrawString(metin, font, PdfBrushes.Black, new PointF(yatay + 10, satir));
                                        }
                                    }
                                }
                            }
                        }
                        satir += 20;
                    }
                    #endregion

                    #region Sağ Alta Logo Yerleştirme

                    Guid logoOid = Guid.Parse("C191FAEC-BEFB-4E08-872E-0C6CC6F48931");
                    try
                    {
                        Fotograflar logo = db.Fotograflar.Where(y => y.Oid == logoOid).FirstOrDefault();

                        MemoryStream streamFoto = new MemoryStream(logo.fotograf);
                        PdfBitmap imageFoto = new PdfBitmap(streamFoto);
                        graphics.DrawImage(imageFoto, new RectangleF(page.Graphics.ClientSize.Width - 74, page.Graphics.ClientSize.Height - 37, imageFoto.Width / 3, imageFoto.Height / 3));

                    }
                    catch (Exception)
                    {

                    }
                    #endregion

                    MemoryStream mstream = new MemoryStream();
                    document.Save(mstream);
                    mstream.Flush();
                    mstream.Position = 0;
                    Response.Headers.Add("Content-Disposition", "inline; filename = " + urunAciklama.UrunSerisi1.UrunSerisiAdi + " " + urunAciklama.KatalogKodu + ".pdf");
                    FileStreamResult fileStreamResult = new FileStreamResult(mstream, "application/pdf");
                    return fileStreamResult;
                    //return document.ExportAsActionResult("sample.pdf", HttpContext.ApplicationInstance.Response, HttpReadType.Open);
                    break;
                #endregion

                #region eng
                case "en":
                    #region Get Data from Database

                    List<Guid> _allOidDegerler = new List<Guid>();
                    List<Guid> _allOidOzellikler = new List<Guid>();
                    List<Degerler> _degerlerList = db.Degerler.Where(y => y.GCRecord == null).ToList();
                    List<Ozellikler> _ozellikList = db.Ozellikler.Where(y => y.GCRecord == null && y.Web == true).ToList();
                    List<Degerler> _maindegerlerList = new List<Degerler>();
                    List<Ozellikler> _mainozelliklerList = new List<Ozellikler>();
                    List<UrunDegerler> _urundegerlerList = db.UrunDegerler.Where(y => y.GCRecord == null && y.Urunler1.Oid == oid && y.Deger != null).ToList();

                    foreach (UrunDegerler urundegerler in _urundegerlerList)
                    {
                        if (urundegerler.Deger != null && urundegerler.Urunler1.Oid == oid)
                        {
                            _allOidDegerler.Add(urundegerler.Degerler1.Oid);
                            _allOidOzellikler.Add(urundegerler.Degerler1.Ozellikler1.Oid);
                        }

                    }
                    foreach (Degerler degerler in _degerlerList)
                    {
                        if (_allOidDegerler.Contains(degerler.Oid)) { _maindegerlerList.Add(degerler); }
                    }

                    foreach (Ozellikler ozellikler in _ozellikList)
                    {
                        if (_allOidOzellikler.Contains(ozellikler.Oid))
                        {
                            _mainozelliklerList.Add(ozellikler);
                        }
                    }
                    #endregion

                    IEnumerable<Urunler> _urunDesc = db.Urunler.Where(y => y.GCRecord == null && y.Oid == oid).ToList();
                    Urunler _urunAciklama = db.Urunler.Where(y => y.GCRecord == null && y.Oid == oid).FirstOrDefault();
                    IEnumerable<Fotograflar> _foto = db.Fotograflar.Where(y => y.GCRecord == null && y.Urunler1.Oid == oid).ToList();
                    #region Create PDF and font controls

                    PdfDocument _document = new PdfDocument();
                    PdfPage _page = _document.Pages.Add();
                    PdfGraphics _graphics = _page.Graphics;
                    PdfFont _font = new PdfStandardFont(PdfFontFamily.TimesRoman, 13);
                    PdfFont _baslik = new PdfStandardFont(PdfFontFamily.TimesRoman, 20);
                    PdfFont _fontPageNumber = new PdfStandardFont(PdfFontFamily.TimesRoman, 10, PdfFontStyle.Bold);
                    PdfFont _FontBaslik = new PdfStandardFont(PdfFontFamily.TimesRoman, 25, PdfFontStyle.Bold);
                    PdfFont _FontBaslik2 = new PdfStandardFont(PdfFontFamily.TimesRoman, 22);
                    PdfFont _FontBaslik3 = new PdfStandardFont(PdfFontFamily.TimesRoman, 18);
                    #endregion

                    float _temp = 110;
                    float _width = 0;
                    float _height = 0;
                    float _baslangic = 0;
                    float _yatay = 0;
                    string _olcu;
                    string _brim;
                    string _deger;
                    int _count = 0;
                    foreach (var item in _foto)
                    {
                        if (_count >= 3)
                        {
                            break;
                        }
                        else
                        {
                            MemoryStream stream = new MemoryStream(item.fotograf);
                            PdfBitmap image = new PdfBitmap(stream);
                            _width = image.Width;
                            _height = image.Height + 10;
                            _yatay = (_width / 6) + 45;
                            _graphics.DrawImage(image, new RectangleF(20, _temp, _width / 6, _height / 6));
                            _temp = _temp + (_height / 6) + 10;
                            _count++;
                        }
                    }

                    #region Header, Footer and horizontal line
                    RectangleF _bounds = new RectangleF(0, 0, _document.Pages[0].GetClientSize().Width + 100, 12);
                    PdfPageTemplateElement _header = new PdfPageTemplateElement(_bounds);
                    _document.Template.Top = _header;

                    PdfPageTemplateElement _footer = new PdfPageTemplateElement(_bounds);
                    _document.Template.Bottom = _footer;
                    //Üst Çizgi
                    PdfPen _pen = new PdfPen(Color.LightGray, 25f);
                    _header.Graphics.DrawLine(_pen, 0, 0, _document.Pages[0].GetClientSize().Width + 1000, 0);
                    //Alt Çizgi
                    pen = new PdfPen(Color.Red, 25f);
                    _footer.Graphics.DrawLine(pen, 0, 0, _document.Pages[0].GetClientSize().Width + 88, 0);
                    //Page Number
                    PdfSolidBrush _brush = new PdfSolidBrush(Color.Gray);
                    PdfPageNumberField _pageNumber = new PdfPageNumberField(_fontPageNumber, _brush);
                    _pageNumber.Draw(_footer.Graphics, new PointF(510, 1));
                    //Dikey Çizgi
                    _pen = new PdfPen(Color.Gray, 0.2f);
                    _graphics.DrawLine(_pen, _yatay, 110, _yatay, 710);
                    #endregion

                    #region Başlık oluşturma ve gösterme
                    string _Baslik = string.IsNullOrEmpty(_urunAciklama.UrunSerisi1.EngUrunSerisiAdi) ? "" : _urunAciklama.UrunSerisi1.EngUrunSerisiAdi + "\n";
                    _Baslik = MetinCevirme(_Baslik);//Türkçe karakterleri ingilizceye çevirdik
                    _graphics.DrawString(_Baslik, _FontBaslik, PdfBrushes.Black, new PointF(0, 18));

                    _Baslik = "";
                    _Baslik += (string.IsNullOrEmpty(_urunAciklama.boyut.ToString())) ? "" : _urunAciklama.Boyut1.Derinlik + "x";
                    _Baslik += (string.IsNullOrEmpty(_urunAciklama.boyut.ToString())) ? "" : _urunAciklama.Boyut1.Genislik + " - ";
                    _Baslik += (string.IsNullOrEmpty(_urunAciklama.renk.ToString())) ? "" : _urunAciklama.Renk1.EngRenk + "\n";
                    _Baslik = MetinCevirme(_Baslik);

                    int _satir = 18;
                    if (!string.IsNullOrEmpty(_Baslik))
                    {
                        _satir = 46;
                        _graphics.DrawString(_Baslik, _FontBaslik2, PdfBrushes.Black, new PointF(0, _satir));
                    }

                    _Baslik = "";
                    _Baslik += string.IsNullOrEmpty(_urunAciklama.KatalogKodu) ? "" : _urunAciklama.KatalogKodu;
                    _Baslik = MetinCevirme(_Baslik);
                    _graphics.DrawString(_Baslik, _FontBaslik3, PdfBrushes.Red, new PointF(0, _satir + 26));
                    #endregion

                    #region Ürün İçeriği Yazdırma

                    _yatay += 10;
                    _baslangic += 105;
                    if (!string.IsNullOrEmpty(_urunDesc.Select(y => y.Aciklama).FirstOrDefault()))
                    {
                        _graphics.DrawString("Description", _FontBaslik3, PdfBrushes.Red, new PointF(_yatay, _baslangic));
                        _baslangic += 26;
                        string _Aciklama = _urunDesc.Select(y => y.EngAciklama).FirstOrDefault();
                        _Aciklama = MetinCevirme(_Aciklama);
                        RectangleF _column = new RectangleF(_yatay, _baslangic, _page.Graphics.ClientSize.Width / 2f + 30f, _page.Graphics.ClientSize.Height);

                        _graphics.DrawString(_Aciklama, _font, PdfBrushes.Black, _column);
                        _baslangic += (_Aciklama.Length / 40) * 17 + 13;
                    }

                    foreach (Ozellikler ozellikler1 in _mainozelliklerList)
                    {
                        string ozellikAdi = MetinCevirme(ozellikler1.EngOzellikAdi);
                        _graphics.DrawString(ozellikAdi, _FontBaslik3, PdfBrushes.Red, new PointF(_yatay, _baslangic));
                        _baslangic += 11;
                        foreach (Degerler degerler in _maindegerlerList)
                        {
                            if (ozellikler1.Oid == degerler.ozellikler)
                            {
                                _baslangic += 15;
                                foreach (UrunDegerler urunDegerler in _urundegerlerList)
                                {

                                    if (urunDegerler.Degerler1 == degerler)
                                    {
                                        _deger = degerler.EngDegerAdi;
                                        _olcu = urunDegerler.Deger;
                                        _brim = string.IsNullOrEmpty(degerler.DegerTipleri.EngDegerTipi) ? degerler.DegerTipleri.DegerTipi : degerler.DegerTipleri.EngDegerTipi;
                                        string metin = _deger + ":" + " " + _olcu + " " + _brim;
                                        metin = "* " + MetinCevirme(metin);
                                        _graphics.DrawString(metin, _font, PdfBrushes.Black, new PointF(_yatay + 10, _baslangic));
                                    }
                                }
                            }
                        }
                        _baslangic += 20;
                    }
                    #endregion

                    #region Sağ Alta Logo Yerleştirme

                    Guid _logoOid = Guid.Parse("C191FAEC-BEFB-4E08-872E-0C6CC6F48931");
                    try
                    {
                        Fotograflar _logo = db.Fotograflar.Where(y => y.Oid == _logoOid).FirstOrDefault();

                        MemoryStream _streamFoto = new MemoryStream(_logo.fotograf);
                        PdfBitmap _imageFoto = new PdfBitmap(_streamFoto);
                        _graphics.DrawImage(_imageFoto, new RectangleF(_page.Graphics.ClientSize.Width - 74, _page.Graphics.ClientSize.Height - 37, _imageFoto.Width / 3, _imageFoto.Height / 3));

                    }
                    catch (Exception)
                    {

                    }
                    #endregion

                    MemoryStream _mstream = new MemoryStream();
                    _document.Save(_mstream);
                    _mstream.Flush();
                    _mstream.Position = 0;
                    FileStreamResult _fileStreamResult = new FileStreamResult(_mstream, "application/pdf");
                    return _fileStreamResult;
                    break;
                    #endregion
            }
            return RedirectToAction("SunucuHatasi");



        }

        public ActionResult CreatePdfAksesuar(Guid oid, string dil, string url)
        {

            dil = dil.ToLower();
            ViewBag.dil = dil;
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("NDM5OTgyQDMxMzgyZTMyMmUzMEZIYnFCclM4TG1SYVRhNE9KclFETnpndmlzZDNnVGRUdnlHV2FYMjBNREE9");
            switch (dil)
            {
                #region TR
                case "tr":
                    #region Get Data from Database


                    List<Degerler> degerlerList = db.Degerler.Where(y => y.GCRecord == null).ToList();
                    List<Ozellikler> ozellikList = db.Ozellikler.Where(y => y.GCRecord == null && y.Web == true).ToList();

                    List<aksesuarDeger> aksesuarDegerList = db.aksesuarDeger.Where(y => y.GCRecord == null && y.aksesuar == oid && y.Deger != null).ToList();


                    #endregion

                    IEnumerable<Aksesuar> aksesuarDesc = db.Aksesuar.Where(y => y.GCRecord == null && y.Oid == oid).ToList();
                    Aksesuar aksesuarAciklama = db.Aksesuar.Where(y => y.GCRecord == null && y.Oid == oid).FirstOrDefault();
                    IEnumerable<WebFotograf> foto = db.WebFotograf.Where(y => y.GCRecord == null && y.Aksesuar == oid).ToList();
                    #region Create PDF and font controls

                    PdfDocument document = new PdfDocument();
                    PdfPage page = document.Pages.Add();
                    PdfGraphics graphics = page.Graphics;
                    PdfFont font = new PdfStandardFont(PdfFontFamily.TimesRoman, 13);
                    PdfFont baslik = new PdfStandardFont(PdfFontFamily.TimesRoman, 20);
                    PdfFont fontPageNumber = new PdfStandardFont(PdfFontFamily.TimesRoman, 10, PdfFontStyle.Bold);
                    PdfFont FontBaslik = new PdfStandardFont(PdfFontFamily.TimesRoman, 23, PdfFontStyle.Bold);
                    PdfFont FontBaslik2 = new PdfStandardFont(PdfFontFamily.TimesRoman, 22);
                    PdfFont FontBaslik3 = new PdfStandardFont(PdfFontFamily.TimesRoman, 18);
                    #endregion

                    float temp = 138;
                    float width = 0;
                    float height = 0;
                    float yatay = 0;
                    string olcu;
                    string brim;
                    string deger;
                    int count = 0;
                    foreach (var item in foto)
                    {
                        if (count >= 3)
                        {
                            break;
                        }
                        else
                        {
                            MemoryStream stream = new MemoryStream(item.fotograf);
                            PdfBitmap image = new PdfBitmap(stream);
                            width = image.Width;
                            height = image.Height + 10;
                            yatay = (width / 2) + 45;
                            graphics.DrawImage(image, new RectangleF(20, temp, width / 2, height / 2));
                            temp = temp + (height / 2) + 10;
                            count++;
                        }
                    }

                    #region Header, Footer and horizontal line
                    RectangleF bounds = new RectangleF(0, 0, document.Pages[0].GetClientSize().Width + 100, 12);
                    PdfPageTemplateElement header = new PdfPageTemplateElement(bounds);
                    document.Template.Top = header;

                    PdfPageTemplateElement footer = new PdfPageTemplateElement(bounds);
                    document.Template.Bottom = footer;
                    //Üst Çizgi
                    PdfPen pen = new PdfPen(Color.LightGray, 25f);
                    header.Graphics.DrawLine(pen, 0, 0, document.Pages[0].GetClientSize().Width + 1000, 0);
                    //Alt Çizgi
                    pen = new PdfPen(Color.Red, 25f);
                    footer.Graphics.DrawLine(pen, 0, 0, document.Pages[0].GetClientSize().Width + 88, 0);
                    //Page Number
                    PdfSolidBrush brush = new PdfSolidBrush(Color.Gray);
                    PdfPageNumberField pageNumber = new PdfPageNumberField(fontPageNumber, brush);
                    pageNumber.Draw(footer.Graphics, new PointF(510, 1));
                    //Dikey Çizgi
                    pen = new PdfPen(Color.Gray, 0.2f);
                    graphics.DrawLine(pen, yatay, 125, yatay, 710);
                    #endregion

                    #region Başlık oluşturma ve gösterme
                    int satir = 18;

                    string Baslik = string.IsNullOrEmpty(aksesuarAciklama.AksesuarGrubu1.AksesuarGrupAdi) ? "" : aksesuarAciklama.AksesuarGrubu1.AksesuarGrupAdi;
                    Baslik = MetinCevirme(Baslik);//Türkçe karakterleri ingilizceye çevirdik
                    RectangleF columnBaslik = new RectangleF(0, satir, page.Graphics.ClientSize.Width, page.Graphics.ClientSize.Height);
                    graphics.DrawString(Baslik, FontBaslik, PdfBrushes.Black, columnBaslik);
                    int sayi = (int)Math.Ceiling(decimal.Parse((Baslik.Length / 43).ToString()));
                    satir += sayi * 23;

                    if (!string.IsNullOrEmpty(Baslik))
                    {
                        satir += 28;
                        graphics.DrawString(Baslik, FontBaslik2, PdfBrushes.Black, new PointF(0, satir));
                    }

                    Baslik = "";
                    Baslik += string.IsNullOrEmpty(aksesuarAciklama.AksesuarKodu) ? "" : aksesuarAciklama.AksesuarKodu;
                    Baslik = MetinCevirme(Baslik);
                    graphics.DrawString(Baslik, FontBaslik3, PdfBrushes.Red, new PointF(0, satir + 26));
                    #endregion

                    #region Ürün İçeriği Yazdırma

                    yatay += 10;
                    satir += 56;
                    if (aksesuarAciklama.AksesuarGrubu1 != null)
                    {
                        if (!string.IsNullOrEmpty(aksesuarAciklama.AksesuarGrubu1.Aciklama))
                        {
                            graphics.DrawString("Aksesuar Grubu Bilgileri", FontBaslik3, PdfBrushes.Red, new PointF(yatay, satir));
                            satir += 26;
                            string Aciklama = aksesuarAciklama.AksesuarGrubu1.Aciklama;
                            Aciklama = MetinCevirme(Aciklama);
                            RectangleF column = new RectangleF(yatay, satir, page.Graphics.ClientSize.Width / 2f + 30f, page.Graphics.ClientSize.Height);

                            graphics.DrawString(Aciklama, font, PdfBrushes.Black, column);
                            if (Aciklama.Length <= 52)
                            {
                                satir += 18;
                            }
                            else
                            {
                                sayi = (int)Math.Ceiling(decimal.Parse((Aciklama.Length / 52).ToString()));
                                satir += sayi * 18;
                            }
                        }
                    }

                    if (!string.IsNullOrEmpty(aksesuarDesc.Select(y => y.Aciklama).FirstOrDefault()))
                    {
                        graphics.DrawString("Aciklama", FontBaslik3, PdfBrushes.Red, new PointF(yatay, satir));
                        satir += 26;
                        string Aciklama = aksesuarDesc.Select(y => y.Aciklama).FirstOrDefault();
                        Aciklama = MetinCevirme(Aciklama);
                        RectangleF column = new RectangleF(yatay, satir, page.Graphics.ClientSize.Width / 2f + 30f, page.Graphics.ClientSize.Height);

                        graphics.DrawString(Aciklama, font, PdfBrushes.Black, column);
                        if (Aciklama.Length <= 52)
                        {
                            satir += 18;
                        }
                        else
                        {
                            sayi = (int)Math.Ceiling(decimal.Parse((Aciklama.Length / 52).ToString()));
                            satir += sayi * 18;
                        }

                    }

                    ozellikList = ozellikList.OrderByDescending(x => x.OzellikAdi).ToList();
                    foreach (var ozellikler in ozellikList)
                    {
                        int sayac = 0;
                        if (ozellikler.OzellikAdi != null)
                        {
                            foreach (var aksesuarDeger in aksesuarDegerList)
                            {

                                if (ozellikler.Oid == aksesuarDeger.Degerler1.Ozellikler1.Oid)
                                {
                                    if (sayac == 0)
                                    {
                                        satir += 20;
                                        string ozellikAdi = MetinCevirme(ozellikler.OzellikAdi);
                                        graphics.DrawString(ozellikAdi, FontBaslik3, PdfBrushes.Red, new PointF(yatay, satir));
                                        satir += 20;
                                    }
                                    if (aksesuarDeger.Degerler1 != null)
                                    {
                                        sayac++;
                                        brim = "";
                                        deger = "";
                                        olcu = "";
                                        satir += 20;
                                        deger = aksesuarDeger.Degerler1.DegerAdi;
                                        olcu = aksesuarDeger.Deger;
                                        if (aksesuarDeger.Degerler1.DegerTipi != null)
                                        {
                                            brim = aksesuarDeger.Degerler1.DegerTipleri.DegerTipi;
                                        }
                                        string metin = deger + ":" + " " + olcu + " " + brim;
                                        metin = "* " + MetinCevirme(metin);
                                        graphics.DrawString(metin, font, PdfBrushes.Black, new PointF(yatay + 10, satir));
                                    }
                                }
                            }
                        }

                    }


                    #endregion

                    #region Sağ Alta Logo Yerleştirme

                    Guid logoOid = Guid.Parse("C191FAEC-BEFB-4E08-872E-0C6CC6F48931");
                    try
                    {
                        Fotograflar logo = db.Fotograflar.Where(y => y.Oid == logoOid).FirstOrDefault();

                        MemoryStream streamFoto = new MemoryStream(logo.fotograf);
                        PdfBitmap imageFoto = new PdfBitmap(streamFoto);
                        graphics.DrawImage(imageFoto, new RectangleF(page.Graphics.ClientSize.Width - 74, page.Graphics.ClientSize.Height - 37, imageFoto.Width / 3, imageFoto.Height / 3));

                    }
                    catch (Exception)
                    {

                    }
                    #endregion

                    MemoryStream mstream = new MemoryStream();
                    document.Save(mstream);
                    mstream.Flush();
                    mstream.Position = 0;
                    Response.Headers.Add("Content-Disposition", "inline; filename = " + aksesuarAciklama.AksesuarGrubu1.AksesuarGrupAdi + " " + aksesuarAciklama.AksesuarKodu + ".pdf");
                    FileStreamResult fileStreamResult = new FileStreamResult(mstream, "application/pdf");
                    return fileStreamResult;
                    //return document.ExportAsActionResult("sample.pdf", HttpContext.ApplicationInstance.Response, HttpReadType.Open);
                    break;
                #endregion

                #region EN
                case "en":
                    #region Get Data from Database

                    List<Degerler> degerlerListEN = db.Degerler.Where(y => y.GCRecord == null).ToList();
                    List<Ozellikler> ozellikListEN = db.Ozellikler.Where(y => y.GCRecord == null && y.Web == true).ToList();
                    List<aksesuarDeger> aksesuarDegerListEN = db.aksesuarDeger.Where(y => y.GCRecord == null && y.aksesuar == oid && y.Deger != null).ToList();

                    #endregion

                    IEnumerable<Aksesuar> aksesuarDescEN = db.Aksesuar.Where(y => y.GCRecord == null && y.Oid == oid).ToList();
                    Aksesuar aksesuarAciklamaEN = db.Aksesuar.Where(y => y.GCRecord == null && y.Oid == oid).FirstOrDefault();
                    IEnumerable<WebFotograf> fotoEN = db.WebFotograf.Where(y => y.GCRecord == null && y.Aksesuar == oid).ToList();
                    #region Create PDF and font controls

                    PdfDocument documentEN = new PdfDocument();
                    PdfPage pageEN = documentEN.Pages.Add();
                    PdfGraphics graphicsEN = pageEN.Graphics;
                    PdfFont fontEN = new PdfStandardFont(PdfFontFamily.TimesRoman, 13);
                    PdfFont baslikEN = new PdfStandardFont(PdfFontFamily.TimesRoman, 20);
                    PdfFont fontPageNumberEN = new PdfStandardFont(PdfFontFamily.TimesRoman, 10, PdfFontStyle.Bold);
                    PdfFont FontBaslikEN = new PdfStandardFont(PdfFontFamily.TimesRoman, 23, PdfFontStyle.Bold);
                    PdfFont FontBaslik2EN = new PdfStandardFont(PdfFontFamily.TimesRoman, 22);
                    PdfFont FontBaslik3EN = new PdfStandardFont(PdfFontFamily.TimesRoman, 18);
                    #endregion

                    float tempEN = 138;
                    float widthEN = 0;
                    float heightEN = 0;
                    float yatayEN = 0;
                    string olcuEN;
                    string brimEN;
                    string degerEN;
                    int countEN = 0;
                    foreach (var item in fotoEN)
                    {
                        if (countEN >= 3)
                        {
                            break;
                        }
                        else
                        {
                            MemoryStream stream = new MemoryStream(item.fotograf);
                            PdfBitmap image = new PdfBitmap(stream);
                            widthEN = image.Width;
                            heightEN = image.Height + 10;
                            yatayEN = (widthEN / 2) + 45;
                            graphicsEN.DrawImage(image, new RectangleF(20, tempEN, widthEN / 2, heightEN / 2));
                            tempEN = tempEN + (heightEN / 2) + 10;
                            countEN++;
                        }
                    }

                    #region Header, Footer and horizontal line
                    RectangleF boundsEN = new RectangleF(0, 0, documentEN.Pages[0].GetClientSize().Width + 100, 12);
                    PdfPageTemplateElement headerEN = new PdfPageTemplateElement(boundsEN);
                    documentEN.Template.Top = headerEN;

                    PdfPageTemplateElement footerEN = new PdfPageTemplateElement(boundsEN);
                    documentEN.Template.Bottom = footerEN;
                    //Üst Çizgi
                    PdfPen penEN = new PdfPen(Color.LightGray, 25f);
                    headerEN.Graphics.DrawLine(penEN, 0, 0, documentEN.Pages[0].GetClientSize().Width + 1000, 0);
                    //Alt Çizgi
                    pen = new PdfPen(Color.Red, 25f);
                    footerEN.Graphics.DrawLine(penEN, 0, 0, documentEN.Pages[0].GetClientSize().Width + 88, 0);
                    //Page Number
                    PdfSolidBrush brushEN = new PdfSolidBrush(Color.Gray);
                    PdfPageNumberField pageNumberEN = new PdfPageNumberField(fontPageNumberEN, brushEN);
                    pageNumberEN.Draw(footerEN.Graphics, new PointF(510, 1));
                    //Dikey Çizgi
                    penEN = new PdfPen(Color.Gray, 0.2f);
                    graphicsEN.DrawLine(penEN, yatayEN, 125, yatayEN, 710);
                    #endregion

                    #region Başlık oluşturma ve gösterme
                    int satirEN = 18;

                    string BaslikEN = string.IsNullOrEmpty(aksesuarAciklamaEN.AksesuarGrubu1.EngAksesuarGrupAdi) ? "" : aksesuarAciklamaEN.AksesuarGrubu1.EngAksesuarGrupAdi;
                    BaslikEN = MetinCevirme(BaslikEN);//Türkçe karakterleri ingilizceye çevirdik
                    RectangleF columnBaslikEN = new RectangleF(0, satirEN, pageEN.Graphics.ClientSize.Width, pageEN.Graphics.ClientSize.Height);
                    graphicsEN.DrawString(BaslikEN, FontBaslikEN, PdfBrushes.Black, columnBaslikEN);
                    int sayiEN = (int)Math.Ceiling(decimal.Parse((BaslikEN.Length / 43).ToString()));
                    satirEN += sayiEN * 23;

                    if (!string.IsNullOrEmpty(BaslikEN))
                    {
                        satirEN += 28;
                        graphicsEN.DrawString(BaslikEN, FontBaslik2EN, PdfBrushes.Black, new PointF(0, satirEN));
                    }

                    BaslikEN = "";
                    BaslikEN += string.IsNullOrEmpty(aksesuarAciklamaEN.AksesuarKodu) ? "" : aksesuarAciklamaEN.AksesuarKodu;
                    BaslikEN = MetinCevirme(BaslikEN);
                    graphicsEN.DrawString(BaslikEN, FontBaslik3EN, PdfBrushes.Red, new PointF(0, satirEN + 26));
                    #endregion

                    #region Ürün İçeriği Yazdırma

                    yatayEN += 10;
                    satirEN += 56;

                    if (aksesuarAciklamaEN.AksesuarGrubu1 != null)
                    {
                        if (!string.IsNullOrEmpty(aksesuarAciklamaEN.AksesuarGrubu1.EngAciklama))
                        {
                            graphicsEN.DrawString("Accessories Grup Information", FontBaslik3EN, PdfBrushes.Red, new PointF(yatayEN, satirEN));
                            satirEN += 26;
                            string Aciklama = aksesuarAciklamaEN.AksesuarGrubu1.EngAciklama;
                            Aciklama = MetinCevirme(Aciklama);
                            RectangleF column = new RectangleF(yatayEN, satirEN, pageEN.Graphics.ClientSize.Width / 2f + 30f, pageEN.Graphics.ClientSize.Height);

                            graphicsEN.DrawString(Aciklama, fontEN, PdfBrushes.Black, column);
                            if (Aciklama.Length <= 52)
                            {
                                satirEN += 18;
                            }
                            else
                            {
                                sayi = (int)Math.Ceiling(decimal.Parse((Aciklama.Length / 52).ToString()));
                                satirEN += sayi * 18;
                            }
                        }
                    }

                    if (!string.IsNullOrEmpty(aksesuarDescEN.Select(y => y.EngAciklama).FirstOrDefault()))
                    {
                        graphicsEN.DrawString("Explanation", FontBaslik3EN, PdfBrushes.Red, new PointF(yatayEN, satirEN));
                        satirEN += 26;
                        string AciklamaEN = aksesuarDescEN.Select(y => y.EngAciklama).FirstOrDefault();
                        AciklamaEN = MetinCevirme(AciklamaEN);
                        RectangleF columnEN = new RectangleF(yatayEN, satirEN, pageEN.Graphics.ClientSize.Width / 2f + 30f, pageEN.Graphics.ClientSize.Height);

                        graphicsEN.DrawString(AciklamaEN, fontEN, PdfBrushes.Black, columnEN);
                        if (AciklamaEN.Length <= 52)
                        {
                            satirEN += 18;
                        }
                        else
                        {
                            sayiEN = (int)Math.Ceiling(decimal.Parse((AciklamaEN.Length / 52).ToString()));
                            satirEN += sayiEN * 18;
                        }

                    }

                    ozellikListEN = ozellikListEN.OrderByDescending(x => x.EngOzellikAdi).ToList();
                    foreach (var ozellikler in ozellikListEN)
                    {
                        int sayacEN = 0;
                        if (ozellikler.EngOzellikAdi != null)
                        {
                            foreach (var aksesuarDeger in aksesuarDegerListEN)
                            {

                                if (ozellikler.Oid == aksesuarDeger.Degerler1.Ozellikler1.Oid)
                                {
                                    if (sayacEN == 0)
                                    {
                                        satirEN += 20;
                                        string ozellikAdi = MetinCevirme(ozellikler.EngOzellikAdi);
                                        graphicsEN.DrawString(ozellikAdi, FontBaslikEN, PdfBrushes.Red, new PointF(yatayEN, satirEN));
                                        satirEN += 20;
                                    }
                                    if (aksesuarDeger.Degerler1 != null)
                                    {
                                        sayacEN++;
                                        brimEN = "";
                                        degerEN = "";
                                        olcuEN = "";
                                        satirEN += 20;
                                        degerEN = aksesuarDeger.Degerler1.EngDegerAdi;
                                        olcuEN = aksesuarDeger.EngDeger;
                                        if (aksesuarDeger.Degerler1.DegerTipi != null)
                                        {
                                            brim = aksesuarDeger.Degerler1.DegerTipleri.DegerTipi;
                                        }
                                        string metinEN = degerEN + ":" + " " + olcuEN + " " + brimEN;
                                        metinEN = "* " + MetinCevirme(metinEN);
                                        graphicsEN.DrawString(metinEN, fontEN, PdfBrushes.Black, new PointF(yatayEN + 10, satirEN));
                                    }
                                }
                            }
                        }

                    }
                    #endregion

                    #region Sağ Alta Logo Yerleştirme

                    Guid logoOidEN = Guid.Parse("C191FAEC-BEFB-4E08-872E-0C6CC6F48931");
                    try
                    {
                        Fotograflar logoEN = db.Fotograflar.Where(y => y.Oid == logoOidEN).FirstOrDefault();

                        MemoryStream streamFotoEN = new MemoryStream(logoEN.fotograf);
                        PdfBitmap imageFotoEN = new PdfBitmap(streamFotoEN);
                        graphicsEN.DrawImage(imageFotoEN, new RectangleF(pageEN.Graphics.ClientSize.Width - 74, pageEN.Graphics.ClientSize.Height - 37, imageFotoEN.Width / 3, imageFotoEN.Height / 3));

                    }
                    catch (Exception)
                    {

                    }
                    #endregion

                    MemoryStream mstreamEN = new MemoryStream();
                    documentEN.Save(mstreamEN);
                    mstreamEN.Flush();
                    mstreamEN.Position = 0;
                    Response.Headers.Add("Content-Disposition", "inline; filename = " + aksesuarAciklamaEN.AksesuarGrubu1.EngAksesuarGrupAdi + " " + aksesuarAciklamaEN.AksesuarKodu + ".pdf");
                    FileStreamResult fileStreamResultEN = new FileStreamResult(mstreamEN, "application/pdf");
                    return fileStreamResultEN;
                    //return document.ExportAsActionResult("sample.pdf", HttpContext.ApplicationInstance.Response, HttpReadType.Open);
                    break;
                    #endregion
            }
            return RedirectToAction("SunucuHatasi");
        }

        public async Task<ActionResult> TeknikSartnameler(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            baseModel.teknikSartnameModels = new List<TeknikSartnameModel>();
            switch (dil)
            {
                case "tr":
                    List<TeknikSartname> teknikSartnames = db.TeknikSartname.Where(x => x.GCRecord == null && x.Web == true && x.onay == true).ToList();
                    foreach (var item in teknikSartnames)
                    {
                        TeknikSartnameModel teknikSartnameModel = new TeknikSartnameModel();
                        teknikSartnameModel.dokumanUzanti = item.dokumanUzanti;
                        teknikSartnameModel.Oid = item.Oid.ToString();
                        teknikSartnameModel.WebDokumanAdi = item.WebDokumanAdi;
                        teknikSartnameModel.DokumanAdi = item.DokumanAdi;
                        teknikSartnameModel.url = item.WebUrl;

                        baseModel.teknikSartnameModels.Add(teknikSartnameModel);
                    }
                    return View(baseModel);
                case "en":
                    List<TeknikSartname> engteknikSartnames = db.TeknikSartname.Where(x => x.GCRecord == null && x.EngWeb == true && x.onay == true).ToList();
                    foreach (var item in engteknikSartnames)
                    {
                        TeknikSartnameModel teknikSartnameModel = new TeknikSartnameModel();
                        teknikSartnameModel.dokumanUzanti = item.dokumanUzanti;
                        teknikSartnameModel.Oid = item.Oid.ToString();
                        teknikSartnameModel.EngWebDokumanAdi = item.EngWebDokumanAdi;
                        teknikSartnameModel.DokumanAdi = item.DokumanAdi;
                        teknikSartnameModel.url = item.EngWebUrl;

                        baseModel.teknikSartnameModels.Add(teknikSartnameModel);
                    }
                    return View(baseModel);
                default:
                    break;
            }
            return View();
        }

        public ActionResult DownloadTeknikSartname(string Url, string dil, Guid oid)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            switch (dil)
            {
                case "tr":
                    string contentType = "application/pdf";
                    string filename = null;
                    byte[] filearray = null;
                    var pdfStream = new MemoryStream();
                    object x = new object();
                    List<TeknikSartname> list = db.TeknikSartname.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

                    filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearray = list.Select(y => y.FileData.Content).FirstOrDefault();
                    return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
                    break;
                case "en":
                    string contentTypeENG = "application/pdf";
                    string filenameENG = null;
                    byte[] filearrayENG = null;
                    var pdfStreamENG = new MemoryStream();
                    object xx = new object();
                    List<TeknikSartname> listENG = db.TeknikSartname.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

                    filenameENG = listENG.Select(y => y.FileData.FileName).FirstOrDefault();
                    filearrayENG = listENG.Select(y => y.FileData.Content).FirstOrDefault();
                    return File(ConvertOleObjectToByteArrayXaf(filearrayENG), contentTypeENG, filenameENG);
                    break;
            }
            return RedirectToAction("SunucuHatasi");


        }
        public ActionResult DownloadTeknikCizimler(Guid oid)
        {
            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            List<TeknikCizimler> list = db.TeknikCizimler.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

            filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
            filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }

        public ActionResult DownloadSertifikalar(Guid oid)
        {
            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            List<Sertifikalar> list = db.Sertifikalar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

            filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
            filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }
        public ActionResult DownloadKalite(Guid oid)
        {
            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            List<KaliteDokumanlari> list = db.KaliteDokumanlari.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

            filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
            filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }
        public ActionResult DownloadMontaj(Guid oid)
        {
            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            List<MontajKlavuzlari> list = db.MontajKlavuzlari.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

            filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
            filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }
        public ActionResult DownloadKapakOps(Guid oid)
        {
            string contentType = "application/pdf";
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();
            List<KapakOpsiyonDoc> list = db.KapakOpsiyonDoc.Where(a => a.Oid == oid && a.GCRecord == null).ToList();

            filename = list.Select(y => y.FileData.FileName).FirstOrDefault();
            filearray = list.Select(y => y.FileData.Content).FirstOrDefault();

            return File(ConvertOleObjectToByteArrayXaf(filearray), contentType, filename);
        }

        public async Task<ActionResult> AksesuarDetail(string dil, string AksesuarAdi, string AksesuarGrubuAdi, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;

            baseModel = await Layout(dil);
            baseModel.urunModel = new List<UrunModel>();
            baseModel.aksesuarDetail = new List<AksesuarDetailModel>();

            switch (dil)
            {
                case "tr":
                    if (AksesuarAdi == null)
                    {
                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                    }
                    else
                    {
                        #region Model ile veri gönderimli
                        //Guid AksesuarGrupOid = db.AksesuarGrubu.FirstOrDefault(z => z.GCRecord == null && z.Web == true &&
                        //z.WebUrl == AksesuarGrubuAdi).Oid;

                        //Aksesuar aksesuar = db.Aksesuar.FirstOrDefault(z => z.GCRecord == null && z.Web == true && z.AksesuarGrubu == AksesuarGrupOid &&
                        //  z.WebUrl == AksesuarAdi);

                        //AksesuarDetailModel DetailAksesuar = new AksesuarDetailModel();
                        //DetailAksesuar.Baslik = aksesuar.AksesuarAdi;
                        //DetailAksesuar.Aciklama = aksesuar.Aciklama;
                        //DetailAksesuar.fotograf = new List<byte[]>();
                        //List<Fotograflar> Fotiler = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.aksesuar == aksesuar.Oid).ToList();
                        //foreach (var item in Fotiler)
                        //{
                        //    DetailAksesuar.fotograf.Add(item.fotograf);
                        //}

                        //baseModel.aksesuarDetail.Add(DetailAksesuar);
                        //return View(baseModel);
                        #endregion

                        #region EskiKod
                        Aksesuar urun = db.Aksesuar.Where(x => x.WebUrl == AksesuarAdi && x.GCRecord == null && x.Web == true).FirstOrDefault();
                        List<Aksesuar> productDetailList = db.Aksesuar.Where(x => x.WebUrl == AksesuarAdi && x.GCRecord == null && x.Web == true).ToList();

                        String urunSerisiAdi = db.Urunler.Where(x => x.Oid == urun.Oid && x.GCRecord == null && x.Web == true).Select(x => x.UrunSerisi1.UrunSerisiAdi).FirstOrDefault();

                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urun.Oid && x.Deger != null).ToList();


                        ViewData["SpecCtrl"] = urundegerlerList;
                        ViewData["ProductDetail"] = productDetailList;
                        baseModel.SayfaLinkBaslik = urun.AksesuarAdi;
                        urunOidForAks = urun.Oid.ToString();

                        //Teknik

                        List<TeknikCizimler> teknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.Web == true).ToList();
                        List<TeknikCizimler> aksGrupLis = db.TeknikCizimler.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.Web == true).ToList();
                        foreach (var item in aksGrupLis)
                        {
                            teknikList.Add(item);
                        }
                        ViewData["Teknik"] = teknikList;

                        //katalog

                        List<Kataloglar> KataloglarList = db.Kataloglar.Where(x => x.GCRecord == null && x.Aksesuar == urun.Oid && x.Web == true).ToList();
                        List<Kataloglar> aksGrupKataloglarList = db.Kataloglar.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.Web == true).ToList();
                        foreach (var item in aksGrupKataloglarList)
                        {
                            KataloglarList.Add(item);
                        }
                        ViewData["Katalog"] = KataloglarList;

                        //Montaj

                        List<MontajKlavuzlari> MontajKlavuzlariList = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.Web == true).ToList();
                        List<MontajKlavuzlari> aksGruoMontajKlavuzlariList = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.Web == true).ToList();
                        foreach (var item in aksGruoMontajKlavuzlariList)
                        {
                            MontajKlavuzlariList.Add(item);
                        }
                        ViewData["Montaj"] = MontajKlavuzlariList;

                        //KaliteDok

                        List<KaliteDokumanlari> KaliteDokumanlariList = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.Web == true).ToList();
                        List<KaliteDokumanlari> AksGrupKaliteDokumanlariList = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.Web == true).ToList();
                        foreach (var item in AksGrupKaliteDokumanlariList)
                        {
                            KaliteDokumanlariList.Add(item);
                        }
                        ViewData["KaliteDok"] = KaliteDokumanlariList;

                        //Sertifika 

                        List<Sertifikalar> SertifikalarList = db.Sertifikalar.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.Web == true).ToList();
                        List<Sertifikalar> AksGrupSertifikalarList = db.Sertifikalar.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.Web == true).ToList();

                        foreach (var item in AksGrupSertifikalarList)
                        {
                            SertifikalarList.Add(item);
                        }

                        ViewData["UrunSertifikalar"] = SertifikalarList;


                        ///////
                        ///Fotoğraflar
                        AksesuarDetailModel DetailAksesuar = new AksesuarDetailModel();
                        DetailAksesuar.fotograf = new List<byte[]>();
                        //List<Fotograflar> Fotiler = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.aksesuar == urun.Oid).ToList();
                        List<WebFotograf> Fotiler = db.WebFotograf.Where(x => x.Web == true && x.GCRecord == null && x.Aksesuar1.Oid == urun.Oid).OrderBy(z => z.Index).ToList();
                        foreach (var item in Fotiler)
                        {
                            DetailAksesuar.fotograf.Add(item.fotograf);
                        }
                        baseModel.aksesuarDetail.Add(DetailAksesuar);



                        //List<Degerler> maindegerlerList = new List<Degerler>();
                        //List<Ozellikler> mainOzelliklerList = new List<Ozellikler>();
                        List<aksesuarDeger> aksesuarDegerList = db.aksesuarDeger.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.Deger != null).ToList();

                        ViewData["Degerler"] = aksesuarDegerList;




                        return View(baseModel);
                        #endregion


                    }
                    break;
                case "en":
                    if (AksesuarAdi == null)
                    {
                        return View("~/Views/Shared/Error.cshtml");
                    }
                    else
                    {
                        Aksesuar urun = db.Aksesuar.Where(x => x.EngWebUrl == AksesuarAdi && x.GCRecord == null && x.Web == true).FirstOrDefault();
                        List<Aksesuar> productDetailList = db.Aksesuar.Where(x => x.EngWebUrl == AksesuarAdi && x.GCRecord == null && x.Web == true).ToList();

                        String urunSerisiAdi = db.Urunler.Where(x => x.Oid == urun.Oid && x.GCRecord == null && x.EngWeb == true).Select(x => x.UrunSerisi1.UrunSerisiAdi).FirstOrDefault();

                        List<UrunDegerler> urundegerlerList = db.UrunDegerler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urun.Oid && x.Deger != null).ToList();

                        //List<TeknikCizimler> teknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.Urunler1.Oid == urunOid && x.EngWeb == true).ToList();
                        //ViewData["Teknik"] = teknikList;
                        ViewData["SpecCtrl"] = urundegerlerList;
                        ViewData["ProductDetail"] = productDetailList;
                        baseModel.SayfaLinkBaslik = urun.EngAksesuarAdi;
                        urunOidForAks = urun.Oid.ToString();



                        //Teknik

                        List<TeknikCizimler> teknikList = db.TeknikCizimler.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.EngWeb == true).ToList();
                        List<TeknikCizimler> aksGrupLis = db.TeknikCizimler.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.EngWeb == true).ToList();
                        foreach (var item in aksGrupLis)
                        {
                            teknikList.Add(item);
                        }
                        ViewData["Teknik"] = teknikList;

                        //katalog

                        List<Kataloglar> KataloglarList = db.Kataloglar.Where(x => x.GCRecord == null && x.Aksesuar == urun.Oid && x.EngWeb == true).ToList();
                        List<Kataloglar> aksGrupKataloglarList = db.Kataloglar.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.EngWeb == true).ToList();
                        foreach (var item in aksGrupKataloglarList)
                        {
                            KataloglarList.Add(item);
                        }
                        ViewData["Katalog"] = KataloglarList;

                        //Montaj

                        List<MontajKlavuzlari> MontajKlavuzlariList = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.EngWeb == true).ToList();
                        List<MontajKlavuzlari> aksGruoMontajKlavuzlariList = db.MontajKlavuzlari.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.EngWeb == true).ToList();
                        foreach (var item in aksGruoMontajKlavuzlariList)
                        {
                            MontajKlavuzlariList.Add(item);
                        }
                        ViewData["Montaj"] = MontajKlavuzlariList;

                        //KaliteDok

                        List<KaliteDokumanlari> KaliteDokumanlariList = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.EngWeb == true).ToList();
                        List<KaliteDokumanlari> AksGrupKaliteDokumanlariList = db.KaliteDokumanlari.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.EngWeb == true).ToList();
                        foreach (var item in AksGrupKaliteDokumanlariList)
                        {
                            KaliteDokumanlariList.Add(item);
                        }
                        ViewData["KaliteDok"] = KaliteDokumanlariList;

                        //Sertifika 

                        List<Sertifikalar> SertifikalarList = db.Sertifikalar.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.EngWeb == true).ToList();
                        List<Sertifikalar> AksGrupSertifikalarList = db.Sertifikalar.Where(x => x.GCRecord == null && x.aksesuarGrubu == urun.AksesuarGrubu && x.EngWeb == true).ToList();

                        foreach (var item in AksGrupSertifikalarList)
                        {
                            SertifikalarList.Add(item);
                        }

                        ViewData["UrunSertifikalar"] = SertifikalarList;


                        //Fotoğraflar
                        AksesuarDetailModel DetailAksesuar = new AksesuarDetailModel();
                        DetailAksesuar.fotograf = new List<byte[]>();
                        //List<Fotograflar> Fotiler = db.Fotograflar.Where(z => z.GCRecord == null && z.Web == true && z.Index == 1 && z.aksesuar == urun.Oid).ToList();
                        List<WebFotograf> Fotiler = db.WebFotograf.Where(x => x.EngWeb == true && x.GCRecord == null && x.Aksesuar1.Oid == urun.Oid).OrderBy(z => z.Index).ToList();
                        foreach (var item in Fotiler)
                        {
                            DetailAksesuar.fotograf.Add(item.fotograf);
                        }
                        baseModel.aksesuarDetail.Add(DetailAksesuar);



                        List<aksesuarDeger> aksesuarDegerList = db.aksesuarDeger.Where(x => x.GCRecord == null && x.aksesuar == urun.Oid && x.Deger != null).ToList();

                        ViewData["Degerler"] = aksesuarDegerList;

                        return View(baseModel);
                    }
                    break;
                default:
                    return View();
                    break;
            }

        }

        public ActionResult ChangeLanguage(string path, string qs)
        {
            string[] newPath = path.Split('/');
            string[] NewPath2 = new string[newPath.Length];
            newPath[1].ToLower();
            try
            {
                if (newPath[1] == "tr" || newPath[1] == "")
                {
                    NewPath2[1] = "en";
                    if (3 <= newPath.Length && !string.IsNullOrEmpty(newPath[2]))
                    {
                        switch (newPath[2])
                        {
                            case "kabinetler":
                                NewPath2[2] = "cabinets";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunGrubu urunGrubu;
                                    string index3 = newPath[3];
                                    urunGrubu = db.UrunGrubu.Where(z => z.WebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (urunGrubu.EngWeb == true)
                                    {
                                        NewPath2[3] = urunGrubu.EngWebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/DilDestegiYok.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        UrunSerisi urunSerisi;
                                        string index4 = newPath[4];
                                        urunSerisi = db.UrunSerisi.Where(z => z.WebUrl == index4 && z.GCRecord == null).FirstOrDefault();
                                        if (urunSerisi.EngWeb == true)
                                        {
                                            NewPath2[4] = urunSerisi.EngWebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/DilDestegiYok.cshtml");
                                        }
                                        if (6 <= newPath.Length && !string.IsNullOrEmpty(newPath[5]))
                                        {
                                            Urunler urun;
                                            string index5 = newPath[5];
                                            urun = db.Urunler.Where(z => z.WebUrl == index5 && z.GCRecord == null).FirstOrDefault();
                                            if (urun.EngWeb == true)
                                            {
                                                NewPath2[5] = urun.EngWebUrl;
                                            }
                                            else
                                            {
                                                return View("~/Views/ProductGroup/DilDestegiYok.cshtml");
                                            }
                                            break;
                                        }
                                        break;
                                    }
                                }
                                break;
                            case "veri_merkezi_cozumleri":
                                NewPath2[2] = "data_center_solutions";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.GCRecord == null && z.WebUrl == index3).FirstOrDefault();
                                    if (urunSerisi.EngWeb == true)
                                    {
                                        NewPath2[3] = urunSerisi.EngWebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.GCRecord == null && z.WebUrl == index4).FirstOrDefault();
                                        if (urun.EngWeb == true)
                                        {
                                            NewPath2[4] = urun.EngWebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "endustriyel_uygulamalar_ve_guvenlik_sistemleri":
                                NewPath2[2] = "industrial_applications_and_security_systems";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.GCRecord == null && z.WebUrl == index3).FirstOrDefault();
                                    if (urunSerisi.EngWeb == true)
                                    {
                                        NewPath2[3] = urunSerisi.EngWebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.GCRecord == null && z.WebUrl == index4).FirstOrDefault();
                                        NewPath2[4] = urun.EngWebUrl;
                                    }
                                }
                                break;
                            case "uzaktan_erisim_sistemleri":
                                NewPath2[2] = "remote_management_systems";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.WebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (urunSerisi.EngWeb == true)
                                    {
                                        NewPath2[3] = urunSerisi.EngWebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.WebUrl == index4 && z.GCRecord == null).FirstOrDefault();
                                        if (urun.EngWeb == true)
                                        {
                                            NewPath2[4] = urun.EngWebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "guc_dagitim_uniteleri":
                                NewPath2[2] = "power_distribution_units";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.WebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (urunSerisi.EngWeb == true)
                                    {
                                        NewPath2[3] = urunSerisi.EngWebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.GCRecord == null && z.WebUrl == index4).FirstOrDefault();
                                        if (urun.EngWeb == true)
                                        {
                                            NewPath2[4] = urun.EngWebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "aksesuarlar":
                                NewPath2[2] = "accessories";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    AksesuarGrubu AksGrubu;
                                    string index3 = newPath[3];
                                    AksGrubu = db.AksesuarGrubu.Where(z => z.WebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (AksGrubu.EngWeb == true)
                                    {
                                        NewPath2[3] = AksGrubu.EngWebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Aksesuar aks;
                                        string index4 = newPath[4];
                                        aks = db.Aksesuar.Where(z => z.WebUrl == index4 && z.GCRecord == null).FirstOrDefault();
                                        if (aks.EngWeb == true)
                                        {
                                            NewPath2[4] = aks.EngWebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "aksesuar_gruplari":
                                NewPath2[2] = "accessories_group";
                                break;
                            case "kataloglar":
                                NewPath2[2] = "catalogue";
                                break;
                            case "teknik_sartnameler":
                                NewPath2[2] = "specification";
                                break;
                            case "sertifika_rapor_belge":
                                NewPath2[2] = "certificate_report_document";
                                break;
                            case "video":
                                NewPath2[2] = "videos";
                                break;
                            case "hakkimizda":
                                NewPath2[2] = "about_us";
                                break;
                            case "iletisim":
                                NewPath2[2] = "contact";
                                break;
                            case "insan_kaynaklari":
                                NewPath2[2] = "human_resources";
                                break;
                            case "haberler":
                                NewPath2[2] = "news";
                                break;
                            case "cerez_politikasi":
                                NewPath2[2] = "cookies_policy";
                                break;
                            case "gizlilik_politikasi":
                                NewPath2[2] = "privacy_notice";
                                break;
                            case "kisisel_verilerin_korunmasi":
                                NewPath2[2] = "personal_data_protection";
                                break;
                            default:
                                return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                break;
                        }
                    }
                }
                else
                {
                    NewPath2[1] = "tr";
                    if (3 <= newPath.Length && !string.IsNullOrEmpty(newPath[2]))
                    {
                        switch (newPath[2])
                        {
                            case "cabinets":
                                NewPath2[2] = "kabinetler";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunGrubu urunGrubu;
                                    string index3 = newPath[3];
                                    urunGrubu = db.UrunGrubu.Where(z => z.EngWebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (urunGrubu.Web == true)
                                    {
                                        NewPath2[3] = urunGrubu.WebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        UrunSerisi urunSerisi;
                                        string index4 = newPath[4];
                                        urunSerisi = db.UrunSerisi.Where(z => z.EngWebUrl == index4 && z.GCRecord == null).FirstOrDefault();
                                        if (urunSerisi.Web == true)
                                        {
                                            NewPath2[4] = urunSerisi.WebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                        if (6 <= newPath.Length && !string.IsNullOrEmpty(newPath[5]))
                                        {
                                            Urunler urun;
                                            string index5 = newPath[5];
                                            urun = db.Urunler.Where(z => z.EngWebUrl == index5 && z.GCRecord == null).FirstOrDefault();
                                            if (urun.Web == true)
                                            {
                                                NewPath2[5] = urun.WebUrl;
                                            }
                                            else
                                            {
                                                return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                            }
                                            break;
                                        }
                                        break;
                                    }
                                }
                                break;
                            case "data_center_solutions":
                                NewPath2[2] = "veri_merkezi_cozumleri";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWebUrl == index3).FirstOrDefault();
                                    if (urunSerisi.Web == true)
                                    {
                                        NewPath2[3] = urunSerisi.WebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.GCRecord == null && z.EngWebUrl == index4).FirstOrDefault();
                                        if (urun.Web == true)
                                        {
                                            NewPath2[4] = urun.WebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }

                                    }
                                }
                                break;
                            case "industrial_applications_and_security_systems":
                                NewPath2[2] = "endustriyel_uygulamalar_ve_guvenlik_sistemleri";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.GCRecord == null && z.EngWebUrl == index3).FirstOrDefault();
                                    if (urunSerisi.Web == true)
                                    {
                                        NewPath2[3] = urunSerisi.WebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.GCRecord == null && z.EngWebUrl == index4).FirstOrDefault();
                                        if (urun.Web == true)
                                        {
                                            NewPath2[4] = urun.WebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "remote_management_systems":
                                NewPath2[2] = "uzaktan_erisim_sistemleri";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.EngWebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (urunSerisi.Web == true)
                                    {
                                        NewPath2[3] = urunSerisi.WebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.EngWebUrl == index4 && z.GCRecord == null).FirstOrDefault();
                                        if (urun.Web == true)
                                        {
                                            NewPath2[4] = urun.WebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "power_distribution_units":
                                NewPath2[2] = "guc_dagitim_uniteleri";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    UrunSerisi urunSerisi;
                                    string index3 = newPath[3];
                                    urunSerisi = db.UrunSerisi.Where(z => z.EngWebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (urunSerisi.Web == true)
                                    {
                                        NewPath2[3] = urunSerisi.WebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Urunler urun;
                                        string index4 = newPath[4];
                                        urun = db.Urunler.Where(z => z.GCRecord == null && z.EngWebUrl == index4).FirstOrDefault();
                                        if (urun.Web == true)
                                        {
                                            NewPath2[4] = urun.WebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                        NewPath2[4] = urun.WebUrl;
                                    }
                                }
                                break;
                            case "accessories":
                                NewPath2[2] = "aksesuarlar";
                                if (4 <= newPath.Length && !string.IsNullOrEmpty(newPath[3]))
                                {
                                    AksesuarGrubu AksGrubu;
                                    string index3 = newPath[3];
                                    AksGrubu = db.AksesuarGrubu.Where(z => z.EngWebUrl == index3 && z.GCRecord == null).FirstOrDefault();
                                    if (AksGrubu.Web == true)
                                    {
                                        NewPath2[3] = AksGrubu.WebUrl;
                                    }
                                    else
                                    {
                                        return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                    }
                                    if (5 <= newPath.Length && !string.IsNullOrEmpty(newPath[4]))
                                    {
                                        Aksesuar aks;
                                        string index4 = newPath[4];
                                        aks = db.Aksesuar.Where(z => z.EngWebUrl == index4 && z.GCRecord == null).FirstOrDefault();
                                        if (aks.Web == true)
                                        {
                                            NewPath2[4] = aks.WebUrl;
                                        }
                                        else
                                        {
                                            return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                        }
                                    }
                                }
                                break;
                            case "accessories_group":
                                NewPath2[2] = "aksesuar_gruplari";
                                break;
                            case "catalogue":
                                NewPath2[2] = "kataloglar";
                                break;
                            case "specification":
                                NewPath2[2] = "teknik_sartnameler";
                                break;
                            case "certificate_report_document":
                                NewPath2[2] = "sertifika_rapor_belge";
                                break;
                            case "videos":
                                NewPath2[2] = "video";
                                break;
                            case "about_us":
                                NewPath2[2] = "hakkimizda";
                                break;
                            case "contact":
                                NewPath2[2] = "iletisim";
                                break;
                            case "human_resources":
                                NewPath2[2] = "insan_kaynaklari";
                                break;
                            case "news":
                                NewPath2[2] = "haberler";
                                break;
                            case "cookies_policy":
                                NewPath2[2] = "cerez_politikasi";
                                break;
                            case "privacy_notice":
                                NewPath2[2] = "gizlilik_politikasi";
                                break;
                            case "personal_data_protection":
                                NewPath2[2] = "kisisel_verilerin_korunmasi";
                                break;
                            default:
                                return View("~/Views/ProductGroup/SayfaBulunamadi.cshtml");
                                break;
                        }
                    }
                }

                string path2 = "";
                for (int i = 1; i < NewPath2.Count(); i++)
                {
                    path2 += "/" + NewPath2[i];
                }

                //path2 += "/" + NewPath2[1];

                return Redirect(path2 + qs);
            }
            catch (Exception)
            {
                return View("~/Views/Shared/Error.cshtml");
            }
        }

        [HttpGet]
        public ActionResult ShowPDF(string Oid, string doc, string url)
        {

            Oid = Oid.ToUpper();
            Guid oid = Guid.Parse(Oid.ToUpper());
            string contentType = "application/pdf";
            string fileOid = null;
            string filename = null;
            byte[] filearray = null;
            var pdfStream = new MemoryStream();
            object x = new object();

            FileData file = new FileData();
            switch (doc)
            {
                case "genelkatalog":
                    List<Kataloglar> genelKatalog = db.Kataloglar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    fileOid = genelKatalog.Select(y => y.File.ToString()).FirstOrDefault();
                    //file = db.FileData.FirstOrDefault(y => y.Oid == oid);
                    break;



                case "katalog":
                    List<Kataloglar> katalogList = db.Kataloglar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    fileOid = katalogList.Select(y => y.File.ToString()).FirstOrDefault();
                    file = db.Kataloglar.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;
                case "teknik":
                    //return RedirectToAction("DownloadTeknikCizimler", "ProductGroup", new { oid = Oid });
                    //file = db.TeknikCizimler.FirstOrDefault(y => y.Oid == oid).FileData;

                    List<TeknikCizimler> teknikcizimlerList = db.TeknikCizimler.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    fileOid = teknikcizimlerList.Select(y => y.File.ToString()).FirstOrDefault();
                    file = db.TeknikCizimler.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;
                case "kaliteDokumanlari":
                    //file = db.KaliteDokumanlari.FirstOrDefault(y => y.Oid == oid).FileData;
                    //return RedirectToAction("DownloadKalite", "ProductGroup", new { oid = fileOid });

                    List<KaliteDokumanlari> kaliteList = db.KaliteDokumanlari.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    fileOid = kaliteList.Select(y => y.File.ToString()).FirstOrDefault();
                    file = db.KaliteDokumanlari.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;
                case "rapor":
                    List<DigerDokumanlar> rapor = db.DigerDokumanlar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    fileOid = rapor.Select(y => y.File.ToString()).FirstOrDefault();
                    //file = db.KaliteDokumanlari.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;
                case "montaj":
                    return RedirectToAction("DownloadMontaj", "ProductGroup", new { oid = fileOid });
                    file = db.MontajKlavuzlari.FirstOrDefault(y => y.Oid == oid).FileData;

                    break;

                case "serifika":

                    List<Sertifikalar> sertifikaList = db.Sertifikalar.Where(a => a.Oid == oid && a.GCRecord == null).ToList();
                    fileOid = sertifikaList.Select(y => y.File.ToString()).FirstOrDefault();
                    file = db.Sertifikalar.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;
                case "kapakOps":
                    return RedirectToAction("DownloadKapakOps", "ProductGroup", new { oid = fileOid });
                    file = db.KapakOpsiyonDoc.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;

                default:
                    return RedirectToAction("DownloadCatalogue", "ProductGroup", new { oid = fileOid });
                    file = db.Kataloglar.FirstOrDefault(y => y.Oid == oid).FileData;
                    break;
            }
            //List<FileData> fileDataList = db.FileData.Where(a => a.Oid.ToString() == fileOid && a.GCRecord == null).ToList();

            Guid guid = Guid.Parse(fileOid);
            FileData fileData = db.FileData.FirstOrDefault(a => a.Oid == guid && a.GCRecord == null);
            filename = fileData.FileName;
            filearray = fileData.Content;

            //filename = db.FileData.FirstOrDefault(a => a.Oid == guid && a.GCRecord == null).FileName.ToString();
            //filearray = db.FileData.FirstOrDefault(a => a.Oid == guid && a.GCRecord == null).Content;

            //filename = fileDataList.Select(y => y.FileName.ToString()).FirstOrDefault();
            //filearray = fileDataList.Select(y => y.Content).FirstOrDefault();

            byte[] data = filearray;


            using (MemoryStream memoryStream = new MemoryStream(data))
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.Headers.Add("Content-Disposition", "inline; filename = " + filename);
                //Response.AddHeader("Content-Disposition", "attachment; filename=" + file.FileName); // Dosyayı indirtiyor direk
                Response.AddHeader("Content-Length", data.Length.ToString());
                Response.Charset = "";
                memoryStream.Write(data, 0, data.Length);
                memoryStream.WriteTo(Response.OutputStream);
                Response.OutputStream.Flush();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Flush();
                Response.Close();
                Response.End();
            }
            //MemoryStream mStream = new MemoryStream();
            //mStream.Write(data, 0, Convert.ToInt32(data.Length.ToString()));
            //System.Drawing.Bitmap bm = new System.Drawing.Bitmap(mStream, false);
            //mStream.Dispose();
            return View();
        }

        [HttpGet]
        public ActionResult CorporateShowPDF(string dil)
        {
            Guid fileOid;
            string filename = null;
            var pdfStream = new MemoryStream();
            object x = new object();

            FileData file = new FileData();
            if (dil == "tr")
            {
                fileOid = Guid.Parse(db.KurumsalLogoKullanimi.FirstOrDefault().Katalog.ToString());
            }
            else
            {
                fileOid = Guid.Parse(db.KurumsalLogoKullanimi.FirstOrDefault().ENKatalog.ToString());
            }
            file = db.FileData.Where(y => y.Oid == fileOid).FirstOrDefault();
            filename = file.FileName;
            byte[] data = file.Content;

            using (MemoryStream memoryStream = new MemoryStream(data))
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.Headers.Add("Content-Disposition", "inline; filename = " + filename);
                //Response.AddHeader("Content-Disposition", "attachment; filename=" + file.FileName); // Dosyayı indirtiyor direk
                Response.AddHeader("Content-Length", data.Length.ToString());
                Response.Charset = "";
                memoryStream.Write(data, 0, data.Length);
                memoryStream.WriteTo(Response.OutputStream);
                Response.OutputStream.Flush();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Flush();
                Response.Close();
                Response.End();
            }

            return View();
        }

        // 404,400
        public ActionResult SayfaBulunamadi(string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            return View();
        }
        //403
        public ActionResult ErisimIzniYok(string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            return View();
        }
        //500
        public ActionResult SunucuHatasi(string dil)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            return View();
        }
        public async Task<ActionResult> KurumsaLogoKullanimi(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            switch (dil)
            {
                case "tr":
                    return View(baseModel);
                case "en":
                    return View(baseModel);
            }
            return View();
        }

        public async Task<ActionResult> CorporateLogoUse(string dil, BaseModel baseModel)
        {
            dil = dil.ToLower();
            ViewBag.dil = dil;
            baseModel = await Layout(dil);
            return View("CorporateLogoUse", baseModel);
        }

        //public ActionResult View(string dil, Guid fileOid)
        //{
        //    List<Sertifikalar> Sfile = db.Sertifikalar.Where(x => x.Oid == fileOid).ToList();

        //    ViewData["Sertifika"] = Sfile;
        //    dil = dil.ToUpper();
        //    ViewBag.dil = dil;
        //    return View();
        //}
    }
}