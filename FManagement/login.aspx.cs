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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            int authenticated = 0;
            AppUser obj = new AppUser();
            obj.UserName = txtUserName.Text;
            obj.Password = txtPassword.Text;
            string encryptePass = FormsAuthentication.HashPasswordForStoringInConfigFile(obj.Password, "SHA1");
            UserGateWay gateObj = new UserGateWay();
            authenticated=gateObj.AuthenticateUser(obj.UserName, encryptePass);
            if (authenticated==1)
            {
                FormsAuthentication.RedirectFromLoginPage(obj.UserName, chkBoxRememberMe.Checked);
                Session["User"] = obj.UserName;
            }
            else
            {
                lblMessage.Text = "Invalid User Name or Password";
            }
        }
    }
}