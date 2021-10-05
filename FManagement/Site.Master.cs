using FManagement.DAL;
using FManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FManagement
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("/login.aspx", true);
        }


        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            List<Faculty1> faculty = UserGateWay.GetFacultyList();
            Session["Data"] = faculty;
            Response.Redirect("report");
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}