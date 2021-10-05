using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace FManagement
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("default", "default", "~/default.aspx");
            routes.MapPageRoute("ObjCRUD", "ObjCrud", "~/ObjectDSCRUD.aspx");
            routes.MapPageRoute("SQLCRUD", "SqlCrud", "~/SQLDSCRUD.aspx");
            routes.MapPageRoute("EntityCRUD", "EntityModelCRUD", "~/EntityModelCRUD.aspx");
            routes.MapPageRoute("ReportView", "report", "~/report.aspx");
        }
    }
}
