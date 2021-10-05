using FManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FManagement.DAL
{
    public class UserGateWay
    {
        public int SaveUser(string userName, string PassWord)
        {
            int returnCode = 0;
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = new SqlCommand("spRegisterUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter username = new SqlParameter("@UserName", userName);
                SqlParameter password = new SqlParameter("@Password", PassWord);
                cmd.Parameters.Add(username);
                cmd.Parameters.Add(password);
                con.Open();
                returnCode=(int)cmd.ExecuteScalar();
            }
            return returnCode;
        }
        public int AuthenticateUser(string userName, string PassWord)
        {
            int authenticated = 0;
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter username = new SqlParameter("@UserName", userName);
                SqlParameter password = new SqlParameter("@Password", PassWord);
                cmd.Parameters.Add(username);
                cmd.Parameters.Add(password);
                con.Open();
                authenticated = (int)cmd.ExecuteScalar();
            }
            return authenticated;
        }
        public static List<Faculty1> GetFacultyList()
        {
            List<Faculty1> list = new List<Faculty1>();
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT FacultyId, FacultyFName, FacultyLName, FacultyPhone, DateOfBirth, Salary, ImageName, ImageUrl, F.CourseId, C.CourseName, F.DepartmentId, D.DepartmentName, F.HireId, H.HireFrom FROM Faculty F JOIN Course C ON F.CourseId=C.CourseId JOIN Department D ON F.DepartmentId = D.DepartmentId JOIN Hire H ON F.HireId = H.HireId";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Faculty1 obj = new Faculty1();
                    obj.FacultyId = Convert.ToInt32(rdr["FacultyId"]);
                    obj.FacultyFName = rdr["FacultyFName"].ToString();
                    obj.FacultyLName = rdr["FacultyLName"].ToString();
                    obj.FacultyPhone = rdr["FacultyPhone"].ToString();
                    obj.DateOfBirth = Convert.ToDateTime(rdr["DateOfBirth"].ToString());
                    obj.Salary = Convert.ToDecimal(rdr["Salary"].ToString());
                    obj.ImageName = rdr["ImageName"].ToString();
                    obj.ImageUrl = rdr["ImageUrl"].ToString();
                    obj.CourseId = Convert.ToInt32(rdr["CourseId"].ToString());
                    obj.CourseName = rdr["CourseName"].ToString();
                    obj.DepartmentId = Convert.ToInt32(rdr["DepartmentId"].ToString());
                    obj.DepartmentName = rdr["DepartmentName"].ToString();
                    obj.HireId = Convert.ToInt32(rdr["HireId"].ToString());
                    obj.HireFrom = rdr["HireFrom"].ToString();
                    list.Add(obj);
                }
                return list;
            }
        }
        public static void SaveFaculty(string FacultyFName, string FacultyLName, string FacultyPhone, DateTime DateOfBirth, decimal Salary, string ImageName, string ImageUrl, int CourseId, int DepartmentId, int HireId)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Faculty (FacultyFName, FacultyLName, FacultyPhone, DateOfBirth, Salary, ImageName, ImageUrl, CourseId, DepartmentId, HireId) VALUES(@FacultyFName, @FacultyLName, @FacultyPhone, @DateOfBirth, @Salary, @ImageName, @ImageUrl, @CourseId, @DepartmentId, @HireId)";
                cmd.Parameters.AddWithValue("@FacultyFName", FacultyFName);
                cmd.Parameters.AddWithValue("@FacultyLName", FacultyLName);
                cmd.Parameters.AddWithValue("@FacultyPhone", FacultyPhone);
                cmd.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
                cmd.Parameters.AddWithValue("@Salary", Salary);
                cmd.Parameters.AddWithValue("@ImageName", ImageName);
                cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                cmd.Parameters.AddWithValue("@CourseId", CourseId);
                cmd.Parameters.AddWithValue("@DepartmentId", DepartmentId);
                cmd.Parameters.AddWithValue("@HireId", HireId);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
        public static void UpdateFaculty(string FacultyFName, string FacultyLName, string FacultyPhone, DateTime DateOfBirth, decimal Salary, string ImageName, string ImageUrl, int CourseId, string CourseName, int DepartmentId, string DepartmentName, int HireId, string HireFrom, int FacultyId)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Faculty SET FacultyFName=@FacultyFName, FacultyLName=@FacultyLName, FacultyPhone=@FacultyPhone, DateOfBirth=@DateOfBirth, Salary=@Salary WHERE FacultyId=@FacultyId";
                cmd.Parameters.AddWithValue("@FacultyFName", FacultyFName);
                cmd.Parameters.AddWithValue("@FacultyLName", FacultyLName);
                cmd.Parameters.AddWithValue("@FacultyPhone", FacultyPhone);
                cmd.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
                cmd.Parameters.AddWithValue("@Salary", Salary);
                //cmd.Parameters.AddWithValue("@ImageName", ImageName);
                //cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                //cmd.Parameters.AddWithValue("@CourseId", CourseId);
                //cmd.Parameters.AddWithValue("@DepartmentId", DepartmentId);
                //cmd.Parameters.AddWithValue("@HireId", HireId);
                cmd.Parameters.AddWithValue("@FacultyId", FacultyId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void DeleteFaculty(int FacultyId)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "DELETE FROM Faculty WHERE FacultyId=@FacultyId";
                cmd.Parameters.AddWithValue("@FacultyId", FacultyId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static string ImageName(int FacultyId)
        {
            string imageName = "";
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT ImageName FROM Faculty WHERE FacultyId=@FacultyId";
                cmd.Parameters.AddWithValue("@FacultyId", FacultyId);
                con.Open();
                imageName = cmd.ExecuteScalar().ToString();
            }
            return imageName;
        }
        public static void UpdateIamgeById(string ImageName, string ImageUrl, int FacultyId)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Faculty SET ImageName=@ImageName, ImageUrl=@ImageUrl WHERE FacultyId=@FacultyId";
                cmd.Parameters.AddWithValue("@ImageName", ImageName);
                cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                cmd.Parameters.AddWithValue("@FacultyId", FacultyId);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
        public static DataTable GetHire()
        {
            DataTable dt3 = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Hire";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt3.Load(rdr, LoadOption.Upsert);
            }
            return dt3;
        }
        public static DataTable GetCourse()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Course";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }
        public static DataTable GetDepartment()
        {
            DataTable dt2 = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Department";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt2.Load(rdr, LoadOption.Upsert);
            }
            return dt2;
        }
        public static void SaveCourse(string CourseName)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Course (CourseName) VALUES (@CourseName)";
                cmd.Parameters.AddWithValue("@CourseName", CourseName);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
        public static void SaveDepartment(string DepartmentName)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Department (DepartmentName) VALUES (@DepartmentName)";
                cmd.Parameters.AddWithValue("@DepartmentName", DepartmentName);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
        public static void SaveHire(string HireFrom)
        {
            using (SqlConnection con = new SqlConnection(Connection.getConncetionSrings()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Hire (HireFrom) VALUES (@HireFrom)";
                cmd.Parameters.AddWithValue("@HireFrom", HireFrom);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
    }
}