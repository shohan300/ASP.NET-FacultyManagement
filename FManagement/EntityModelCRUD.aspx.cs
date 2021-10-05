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
    public partial class EntityModelCRUD : System.Web.UI.Page
    {
        FacultyEFGateWay dbobj = new FacultyEFGateWay();
        protected void Page_Load(object sender, EventArgs e)
        {
            FacultyUserControl.opType = "EF";
            if(!IsPostBack)
            {
                LoadEFGridView();
            }    
        }

        private void LoadEFGridView()
        {
            List<Faculty> data = dbobj.GetFacultyList().ToList();
            if (data.Count>0)
            {
                GridViewEF.DataSource = data;
            }
            else
            {
                GridViewEF.DataSource = null;
            }
            GridViewEF.DataBind();
        }

        protected void GridViewEF_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewEF.EditIndex = e.NewEditIndex;
            LoadEFGridView();
        }

        protected void GridViewEF_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewEF.EditIndex = -1;
            LoadEFGridView();
        }

        protected void GridViewEF_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridViewEF.DataKeys[e.RowIndex].Value);
            FileUpload up = (FileUpload)GridViewEF.Rows[e.RowIndex].FindControl("FileUpload1");
            string imageName = UserGateWay.ImageName(id);
            DeleteExistingImage(imageName);
            string fileUrl = "~/Images/";
            string newImageName = "";
            if (up.HasFile)
            {
                newImageName = up.FileName;
                fileUrl += newImageName;
                up.SaveAs(Server.MapPath(fileUrl));
            }
            Faculty obj = new Faculty();
            obj.FacultyFName = e.NewValues["FacultyFName"].ToString();
            obj.FacultyLName = e.NewValues["FacultyLName"].ToString();
            obj.FacultyPhone = e.NewValues["FacultyPhone"].ToString();
            obj.DateOfBirth = Convert.ToDateTime(e.NewValues["DateOfBirth"].ToString());
            obj.Salary = Convert.ToDecimal(e.NewValues["Salary"].ToString());
            obj.ImageName = newImageName;
            obj.ImageUrl = fileUrl;
            obj.FacultyId = id;
            dbobj.UpdateFaculty(obj);
            GridViewEF.EditIndex = -1;
            LoadEFGridView();
        }

        protected void GridViewEF_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewEF.DataKeys[e.RowIndex].Value);
            string ImageName = UserGateWay.ImageName(id);
            DeleteExistingImage(ImageName);
            dbobj.DeleteFaculty(id);
            LoadEFGridView();
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


        protected void GridViewEF_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewEF.PageIndex = e.NewPageIndex;
            LoadEFGridView();
        }
    }
}