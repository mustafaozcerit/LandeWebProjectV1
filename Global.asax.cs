using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace LandeWebProjectV1
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exception = Server.GetLastError();
            string path = Request.Path;
            Response.Clear();
            HttpException httpException = exception as HttpException;
            if (httpException != null)
            {
                switch (httpException.GetHttpCode())
                {
                    case 403:
                        Response.Redirect("/tr/ProductGroup/ErisimIzniYok");
                        break;
                    case 404:
                        Response.Redirect("/tr/ProductGroup/SayfaBulunamadi");
                        break;
                    case 500:
                        Response.Redirect("/tr/ProductGroup/SunucuHatasi");
                        break;
                    default:
                        Response.Redirect("/tr/ProductGroup/SayfaBulunamadi");
                        break;
                }
            }
        }
    }
}
