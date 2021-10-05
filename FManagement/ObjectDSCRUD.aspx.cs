using FManagement.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FManagement
{
    public partial class ObjectDSCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FacultyUserControl.opType = "ObjDS";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int FacultyId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            FileUpload up = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string imageName = UserGateWay.ImageName(FacultyId);
           
            string fileUrl = "~/Images/";
            string newImageName = "";
            if (up.HasFile)
            {
                DeleteExistingImage(imageName);
                newImageName = up.FileName;
                fileUrl += newImageName;
                up.SaveAs(Server.MapPath(fileUrl));
            }
            else
            {
                newImageName = imageName;
                fileUrl += newImageName;
            }
            UserGateWay.UpdateIamgeById(newImageName, fileUrl, FacultyId);
        }

        private void DeleteExistingImage(string imageName)
        {
            string path = Server.MapPath("~/Images/" + imageName);
            FileInfo fileObj = new FileInfo(path);
            if (fileObj.Exists)
            {
                fileObj.Delete();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Facultyid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string imageName = UserGateWay.ImageName(Facultyid);
            DeleteExistingImage(imageName);
        }
    }
}