using FManagement.DAL;
using FManagement.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FManagement
{
    public partial class SQLDSCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FacultyUserControl.opType = "SQLDS";
            if (Session["Faculty"] != null)
            {
                Faculty1 obj = (Faculty1)Session["Faculty"];
                InsertUsingSQLSource(obj);
                Session["Faculty"] = null;
            }
        }

        private void InsertUsingSQLSource(Faculty1 obj)
        {
            SqlDataSource1.InsertParameters["FacultyFName"].DefaultValue = obj.FacultyFName;
            SqlDataSource1.InsertParameters["FacultyLName"].DefaultValue = obj.FacultyLName;
            SqlDataSource1.InsertParameters["FacultyPhone"].DefaultValue = obj.FacultyPhone;
            SqlDataSource1.InsertParameters["DateOfBirth"].DefaultValue = obj.DateOfBirth.ToShortDateString();
            SqlDataSource1.InsertParameters["Salary"].DefaultValue = obj.Salary.ToString();
            SqlDataSource1.InsertParameters["ImageName"].DefaultValue = obj.ImageName;
            SqlDataSource1.InsertParameters["ImageUrl"].DefaultValue = obj.ImageUrl;
            SqlDataSource1.InsertParameters["DepartmentId"].DefaultValue = obj.DepartmentId.ToString();
            SqlDataSource1.InsertParameters["CourseId"].DefaultValue = obj.CourseId.ToString();
            SqlDataSource1.InsertParameters["HireId"].DefaultValue = obj.HireId.ToString();
            SqlDataSource1.Insert();
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