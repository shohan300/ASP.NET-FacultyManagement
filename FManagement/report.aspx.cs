using FManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FManagement
{
    public partial class report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Data"]!=null)
            {
                var list = Session["Data"] as List<Faculty>;
                CrystalReport reportobj = new CrystalReport();
                reportobj.SetDataSource(list);
                crystalreportviewer1.ReportSource = reportobj;
            }
        }
    }
}