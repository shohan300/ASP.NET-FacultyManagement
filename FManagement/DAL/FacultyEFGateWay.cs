using FManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FManagement.DAL
{
    public class FacultyEFGateWay
    {
        FManagementEntities db = new FManagementEntities();
        public IQueryable<Faculty>GetFacultyList()
        {
            return from cus in db.Faculties select cus;
        }
        public Faculty GetFaculty(int id)
        {
            Faculty cus = db.Faculties.FirstOrDefault(c => c.FacultyId == id);
            return cus;
        }
        public void InsertFaculty(Faculty obj)
        {
            db.Faculties.Add(obj);
            db.SaveChanges();
        }
        public int UpdateFaculty(Faculty upOpj)
        {
            int count = 0;
            Faculty obj = GetFaculty(upOpj.FacultyId);
            obj.FacultyFName = upOpj.FacultyFName;
            obj.FacultyLName = upOpj.FacultyLName;
            obj.FacultyPhone = upOpj.FacultyPhone;
            obj.DateOfBirth = Convert.ToDateTime(upOpj.DateOfBirth);
            obj.Salary = upOpj.Salary;
            obj.ImageName = upOpj.ImageName;
            obj.ImageUrl = upOpj.ImageUrl;
            count = db.SaveChanges();
            return count;
        }
        public int DeleteFaculty(int id)
        {
            int count = 0;
            Faculty deleteFaculty = GetFaculty(id);
            db.Faculties.Remove(deleteFaculty);
            count = db.SaveChanges();
            return count;
        }
    }
}