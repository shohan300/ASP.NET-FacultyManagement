using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace FManagement.DAL
{
    public static class Connection
    {
        public static string getConncetionSrings()
        {
            string conStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            return conStr;
        }
    }
}