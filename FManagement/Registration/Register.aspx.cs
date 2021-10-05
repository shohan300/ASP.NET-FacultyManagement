using FManagement.DAL;
using FManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FManagement.Registration
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                AppUser obj = new AppUser();
                obj.UserName = txtUserName.Text;
                obj.Password = txtPassword.Text;
                string encryptePass = FormsAuthentication.HashPasswordForStoringInConfigFile(obj.Password, "SHA1");
                UserGateWay gateobj = new UserGateWay();
                int returnCode = gateobj.SaveUser(obj.UserName, encryptePass);
                if (returnCode==-1)
                {
                    lblMessage.Text = "User Already Exists";
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
        }
    }
}