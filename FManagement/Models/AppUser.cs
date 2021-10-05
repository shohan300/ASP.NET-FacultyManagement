using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FManagement.Models
{
    public class AppUser
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}