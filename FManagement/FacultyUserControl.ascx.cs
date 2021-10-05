using FManagement.DAL;
using FManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FManagement
{
    public partial class FacultyUserControl : System.Web.UI.UserControl
    {
        public string opType = "EF";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                LoadddlCourse();
                LoadddlDepartment();
                LoadddlHire();
            }
            ShowImage();
        }

        private void LoadddlHire()
        {
            DataTable dt3 = UserGateWay.GetHire();
            DataRow dr = dt3.NewRow();
            dr.ItemArray = new object[] { 0, "Select" };
            dt3.Rows.InsertAt(dr, 0);


            ddlHire.DataSource = dt3;
            ddlHire.DataTextField = dt3.Columns["HireFrom"].ToString();
            ddlHire.DataValueField = dt3.Columns["HireId"].ToString();
            ddlHire.DataBind();
        }

        private void ShowImage()
        {
            if (FileUpload1.HasFile)
            {
                string imageName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                HiddenImageName.Value = imageName;
                string filePath = "~/Images/" + imageName;
                HiddenImageUrl.Value = filePath;
                FileUpload1.SaveAs(Server.MapPath(filePath));
                Image1.ImageUrl = filePath;
            }
        }

        private void LoadddlDepartment()
        {
            DataTable dt2 = UserGateWay.GetDepartment();
            DataRow dr = dt2.NewRow();
            dr.ItemArray = new object[] { 0, "Select" };
            dt2.Rows.InsertAt(dr, 0);


            ddlDepartment.DataSource = dt2;
            ddlDepartment.DataTextField = dt2.Columns["DepartmentName"].ToString();
            ddlDepartment.DataValueField = dt2.Columns["DepartmentId"].ToString();
            ddlDepartment.DataBind();
        }

        private void LoadddlCourse()
        {
            DataTable dt = UserGateWay.GetCourse();
            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "Select" };
            dt.Rows.InsertAt(dr, 0);


            ddlCourse.DataSource = dt;
            ddlCourse.DataTextField = dt.Columns["CourseName"].ToString();
            ddlCourse.DataValueField = dt.Columns["CourseId"].ToString();
            ddlCourse.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        protected void btnCourseSave_Click(object sender, EventArgs e)
        {
            Course obj = new Course();
            obj.CourseName = txtCourse.Text;
            UserGateWay.SaveCourse(obj.CourseName);
            txtCourse.Text = "";
            LoadddlCourse();
        }

        protected void btnDepartmentSave_Click(object sender, EventArgs e)
        {
            Department obj = new Department();
            obj.DepartmentName = txtDepartment.Text;
            UserGateWay.SaveDepartment(obj.DepartmentName);
            txtDepartment.Text = "";
            LoadddlDepartment();
        }

        protected void btnHireSave_Click(object sender, EventArgs e)
        {
            Hire obj = new Hire();
            obj.HireFrom = txtHire.Text;
            UserGateWay.SaveHire(obj.HireFrom);
            txtHire.Text = "";
            LoadddlHire();
        }

        protected void btnSaveFaculty_Click(object sender, EventArgs e)
        {
            Faculty1 obj = new Faculty1();
            obj.FacultyFName = txtFName.Text;
            obj.FacultyLName = txtLName.Text;
            obj.FacultyPhone = txtPhone.Text;
            obj.DateOfBirth = Convert.ToDateTime(txtDate.Text);
            obj.Salary = Convert.ToDecimal(txtSalary.Text);
            obj.ImageName = HiddenImageName.Value;
            obj.ImageUrl = HiddenImageUrl.Value;
            obj.CourseId = Convert.ToInt32(ddlCourse.SelectedValue);
            obj.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
            obj.HireId = Convert.ToInt32(ddlHire.SelectedValue);
            if (opType=="EF")
            {
                Faculty obj1 = new Faculty();
                obj1.FacultyFName = txtFName.Text;
                obj1.FacultyLName = txtLName.Text;
                obj1.FacultyPhone = txtPhone.Text;
                obj1.DateOfBirth = Convert.ToDateTime(txtDate.Text);
                obj1.Salary = Convert.ToDecimal(txtSalary.Text);
                obj1.ImageName = HiddenImageName.Value;
                obj1.ImageUrl = HiddenImageUrl.Value;
                obj1.CourseId = Convert.ToInt32(ddlCourse.SelectedValue);
                obj1.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
                obj1.HireId = Convert.ToInt32(ddlHire.SelectedValue);
                FacultyEFGateWay efObj = new FacultyEFGateWay();
                efObj.InsertFaculty(obj1);
                Response.Redirect("EntityModelCRUD");
            }
            else if (opType == "ObjDS")
            {
                UserGateWay.SaveFaculty(obj.FacultyFName, obj.FacultyLName, obj.FacultyPhone, obj.DateOfBirth, obj.Salary, obj.ImageName, obj.ImageUrl, obj.CourseId, obj.DepartmentId, obj.HireId);
                Response.Redirect("ObjCrud");
            }
            else
            {
                Session["Faculty"] = obj;
                Response.Redirect("SqlCrud");
            }
        }
    }
}