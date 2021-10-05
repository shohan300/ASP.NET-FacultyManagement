using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FManagement.Models
{
    public class viewobject
    {
        public int FacultyId { get; set; }
        public string FacultyFName { get; set; }
        public string FacultyLName { get; set; }
        public string FacultyPhone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public decimal Salary { get; set; }
        public string ImageName { get; set; }
        public string ImageUrl { get; set; }
        public int DepartmentId { get; set; }
        public int CourseId { get; set; }
        public int HireId { get; set; }
        public string DepartmentName { get; set; }
        public string CourseName { get; set; }
        public string HireFrom { get; set; }
    }
}