using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LandeWebProjectV1
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{dil}/",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Index", id = UrlParameter.Optional }
            );
            #region Search
            routes.MapRoute(
                name: "SearchTR",
                url: "{dil}/search",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Search", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "SearchENG",
                url: "{dil}/search",
                defaults: new { dil = "en", controller = "ProductGroup", action = "Search", id = UrlParameter.Optional }
            );
            #endregion


            #region Ürün Grupları
            routes.MapRoute(
               name: "KabinetGrupları",
               url: "{dil}/kabinetler",
               defaults: new { dil = "tr", controller = "ProductGroup", action = "Kabinetler", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "CabinetGroups",
                url: "{dil}/cabinets",
                defaults: new { dil = "en", controller = "ProductGroup", action = "Kabinetler", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "AksesuarGruplari",
               url: "{dil}/aksesuar_gruplari",
               defaults: new { dil = "tr", controller = "ProductGroup", action = "AccessoriesGroup", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "AccessoriesGroup",
                url: "{dil}/accessories_group",
                defaults: new { dil = "en", controller = "ProductGroup", action = "AccessoriesGroup", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "GucDagitimUniteleri",
                url: "{dil}/guc_dagitim_uniteleri",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "GucDagitimUniteleriGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "PowerDistributionUnits",
                url: "{dil}/power_distribution_units",
                defaults: new { dil = "en", controller = "ProductGroup", action = "GucDagitimUniteleriGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "EndustriyelUygulamalarVeGuvenlikSistemleri",
                url: "{dil}/endustriyel_uygulamalar_ve_guvenlik_sistemleri",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "EndustriyelGuvenlikGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "IndustrialApplicationsAndSecuritySystems",
                url: "{dil}/industrial_applications_and_security_systems",
                defaults: new { dil = "en", controller = "ProductGroup", action = "EndustriyelGuvenlikGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "VeriMerkeziCozumleriGruplari",
                url: "{dil}/veri_merkezi_cozumleri",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "DataCenterGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "DataCenterSolutionsGroups",
                url: "{dil}/data_center_solutions",
                defaults: new { dil = "en", controller = "ProductGroup", action = "DataCenterGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "UzaktanErişimSistemleriGruplari",
                url: "{dil}/uzaktan_erisim_sistemleri",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "OrtamIzlemeGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "RemoteManagementSystemsGroups",
                url: "{dil}/remote_management_systems",
                defaults: new { dil = "en", controller = "ProductGroup", action = "OrtamIzlemeGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HomeOfficeTRGruplari",
                url: "{dil}/lande_home_office_urunleri",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "HomeOfiiceGruplari", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HomeOfficeENGroups",
                url: "{dil}/lande_home_office_products",
                defaults: new { dil = "en", controller = "ProductGroup", action = "HomeOfiiceGruplari", id = UrlParameter.Optional }
            );
            #endregion

            #region Ürün Listeleri
            routes.MapRoute(
               name: "Kabinetler",
               url: "{dil}/kabinetler/{UrunGrubuAdi}",
               defaults: new { dil = "tr", controller = "ProductGroup", action = "KabinetlerUrunGrubu", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "Cabinets",
                url: "{dil}/cabinets/{UrunGrubuAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "KabinetlerUrunGrubu", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "CabinetsWithSize",
                 url: "{dil}/cabinets/{UrunGrubuAdi}/{UrunSerisiAdi}",
                 defaults: new { dil = "en", controller = "ProductGroup", action = "Products", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "BoyutlarıOlanKabinetler",
                url: "{dil}/kabinetler/{UrunGrubuAdi}/{UrunSerisiAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Products", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Aksesuarlar",
                url: "{dil}/aksesuarlar/{AksesuarGrubuAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Aksesuarlar", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Accessories",
                url: "{dil}/accessories/{AksesuarGrubuAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "Aksesuarlar", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "GucDagitimUniteleriGruplari",
                url: "{dil}/guc_dagitim_uniteleri/{UrunSerisiAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "GucDagitimUniteleri", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "PowerDistributionUnitsGroups",
                url: "{dil}/power_distribution_units/{UrunSerisiAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "GucDagitimUniteleri", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "VeriMerkeziCozumleri",
                url: "{dil}/veri_merkezi_cozumleri/{UrunSerisiAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Datacenter", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "DataCenterSolutions",
                url: "{dil}/data_center_solutions/{UrunSerisiAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "Datacenter", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "UzaktanErişimSistemleri",
                url: "{dil}/uzaktan_erisim_sistemleri/{UrunSerisiAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "OrtamIzleme", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "RemoteManagementSystems",
                url: "{dil}/remote_management_systems/{UrunSerisiAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "OrtamIzleme", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "EndustriyelUygulamalarVeGuvenlikSistemleriGruplari",
                url: "{dil}/endustriyel_uygulamalar_ve_guvenlik_sistemleri/{UrunSerisiAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "EndustriyelGuvenlik", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "IndustrialApplicationsAndSecuritySystemsGroups",
                url: "{dil}/industrial_applications_and_security_systems/{UrunSerisiAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "EndustriyelGuvenlik", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HomeOfficeTR",
                url: "{dil}/lande_home_office_urunleri/{UrunSerisiAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "HomeOffice", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HomeOfficeEN",
                url: "{dil}/lande_home_office_products/{UrunSerisiAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "HomeOffice", id = UrlParameter.Optional }
            );
            #endregion

            #region Dokumanlar
            routes.MapRoute(
                 name: "Kataloglar",
                 url: "{dil}/kataloglar",
                 defaults: new { dil = "tr", controller = "ProductGroup", action = "Catalogue", id = UrlParameter.Optional }
             );
            routes.MapRoute(
               name: "Catalogue",
               url: "{dil}/catalogue",
               defaults: new { dil = "en", controller = "ProductGroup", action = "Catalogue", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "TeknikSartnameler",
               url: "{dil}/teknik_sartnameler",
               defaults: new { dil = "tr", controller = "ProductGroup", action = "TeknikSartnameler", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Specification",
                url: "{dil}/specification",
                defaults: new { dil = "en", controller = "ProductGroup", action = "TeknikSartnameler", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "SertifikaRaporBelge",
                url: "{dil}/sertifika_rapor_belge",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "SertifikaRaporBelge", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "CertificateReportDocument",
               url: "{dil}/certificate_report_document",
               defaults: new { dil = "en", controller = "ProductGroup", action = "SertifikaRaporBelge", id = UrlParameter.Optional }
            );
            #endregion

            #region Videolar
            routes.MapRoute(
              name: "Videos",
              url: "{dil}/videos",
              defaults: new { dil = "en", controller = "ProductGroup", action = "Video", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Video",
                url: "{dil}/video",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Video", id = UrlParameter.Optional }
            );
            #endregion

            #region Hakkımızda/AboutUs
            routes.MapRoute(
                name: "Hakkimizda",
                url: "{dil}/hakkimizda",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "AboutUs", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "AboutUs",
                url: "{dil}/about_us",
                defaults: new { dil = "en", controller = "ProductGroup", action = "AboutUs", id = UrlParameter.Optional }
            );
            #endregion

            #region Iletisim
            routes.MapRoute(
            name: "iletisim",
            url: "{dil}/iletisim",
            defaults: new { dil = "tr", controller = "ProductGroup", action = "Contact", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Contact",
               url: "{dil}/contact",
               defaults: new { dil = "en", controller = "ProductGroup", action = "Contact", id = UrlParameter.Optional }
               );
            #endregion

            #region İnsan Kaynakları
            routes.MapRoute(
                name: "InsanKaynaklari",
                url: "{dil}/insan_kaynaklari",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "HR", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HumanResources",
                url: "{dil}/human_resources",
                defaults: new { dil = "en", controller = "ProductGroup", action = "HR", id = UrlParameter.Optional }
            );
            #endregion

            #region Haberler
            routes.MapRoute(
                name: "Haberler",
                url: "{dil}/haberler",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "News", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "News",
                url: "{dil}/news",
                defaults: new { dil = "en", controller = "ProductGroup", action = "News", id = UrlParameter.Optional }
            );
            #endregion

            #region Çerez Politikası
            routes.MapRoute(
                name: "CerezPolitikasi",
                url: "{dil}/cerez_politikasi",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "Cookies", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "CookiesPolicy",
                url: "{dil}/cookies_policy",
                defaults: new { dil = "en", controller = "ProductGroup", action = "Cookies", id = UrlParameter.Optional }
            );
            #endregion

            #region Gizlilik Bildirimi
            routes.MapRoute(
                name: "GizlilikPolitikasi",
                url: "{dil}/gizlilik_politikasi",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "PrivacyNotice", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "PrivacyNotice",
                url: "{dil}/privacy_notice",
                defaults: new { dil = "en", controller = "ProductGroup", action = "PrivacyNotice", id = UrlParameter.Optional }
            );
            #endregion

            #region AydınlatmaMetni
            routes.MapRoute(
                name: "KisiselVerilerinKorunmasi",
                url: "{dil}/kisisel_verilerin_korunmasi",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "PersonalDataProtection", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "PersonalDataProtection",
                url: "{dil}/personal_data_protection",
                defaults: new { dil = "en", controller = "ProductGroup", action = "PersonalDataProtection", id = UrlParameter.Optional }
            );
            #endregion

            #region Urunler Details
            routes.MapRoute(
                name: "ProductDetailsWithoutSize",
                url: "{dil}/veri_merkezi_cozumleri/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "ProductDetailsWithoutSizeENG",
                url: "{dil}/data_center_solutions/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "DataCenterSolutionsDetail",
                url: "{dil}/data_center_solutions/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "EndustriyelGuvenlikDetail",
                url: "{dil}/endustriyel_uygulamalar_ve_guvenlik_sistemleri/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "IndustrialApplicationsAndSecuritySystemsDetail",
                url: "{dil}/industrial_applications_and_security_systems/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "UzaktanErişimSistemleriDetail",
                url: "{dil}/uzaktan_erisim_sistemleri/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "RemoteManagementSystemsDetail",
                url: "{dil}/remote_management_systems/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "GucDagitimUniteleriDetail",
                url: "{dil}/guc_dagitim_uniteleri/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "PowerDistributionUnitsDetail",
                url: "{dil}/power_distribution_units/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HomeOfficeTRDetail",
                url: "{dil}/lande_home_office_urunleri/{UrunSerisiAdi}/{UrunUrl}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "HomeOfficeENDetail",
                url: "{dil}/lande_home_office_products/{UrunSerisiAdi}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetailsWithoutSize", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "KabinetlerDetail",
                url: "{dil}/kabinetler/{UrunGrup}/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "ProductDetail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "CabinetsDetail",
                url: "{dil}/cabinets/{UrunGrup}/{UrunSeri}/{UrunUrl}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "ProductDetail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "AksesuarlarDetail",
                url: "{dil}/aksesuarlar/{AksesuarGrubuAdi}/{AksesuarAdi}",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "AksesuarDetail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "AccessoriesDetail",
                url: "{dil}/accessories/{AksesuarGrubuAdi}/{AksesuarAdi}",
                defaults: new { dil = "en", controller = "ProductGroup", action = "AksesuarDetail", id = UrlParameter.Optional }
            );
            #endregion

            #region LanguageControl
            routes.MapRoute(
                 name: "Filter",
                 url: "{dil}/{controller}/{action}/{id}",
                 defaults: new { dil = "tr", controller = "ProductGroup", action = "Index", id = UrlParameter.Optional }
             );
            #endregion

            #region KurumsalLogoKullanimi
            routes.MapRoute(
                name: "KurumsalLogoKullanimi",
                url: "{dil}/kurumsal_logo_kullanimi",
                defaults: new { dil = "tr", controller = "ProductGroup", action = "CorporateLogoUse", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "CorporateLogoUse",
                url: "{dil}/corporate_logo_usage",
                defaults: new { dil = "en", controller = "ProductGroup", action = "CorporateLogoUse", id = UrlParameter.Optional }
            );
            #endregion
        }
    }
}
