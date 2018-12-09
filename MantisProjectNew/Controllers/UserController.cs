using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayerProject;

namespace MantisProjectNew.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        public ActionResult UserProfile(string userId)
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            User objUser = obj.GetUserDetail(userId);
            return View(objUser);
        }
        public ActionResult Index()
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            var users = obj.GetUserList();
            return View(users);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            /*if (!ModelState.IsValid)
            {
                return View(user);
            }*/

            BusinessLayerObjects obj = new BusinessLayerObjects();
            User objReturnedUser = obj.GetUserDetail(user);
            if (objReturnedUser != null)
            {
                Session["UserId"] = objReturnedUser.UserId;
                Session["FirstName"] = objReturnedUser.FirstName;
                Session["LastName"] = objReturnedUser.LastName;
                Session["EmailId"] = objReturnedUser.EmailId;
                Session["UserType"] = objReturnedUser.UserType;
                Session["Active"] = objReturnedUser.Active;
                Session["ValidUser"] = true;
                Session["UserTypeDesc"] = objReturnedUser.UserTypeDesc;

                return RedirectToAction("Index", "Ticket");
            }
            else
            {
                ModelState.AddModelError("", "Invalid login attempt.");
                return View(user);    
            }
            
        }

        public ActionResult Logout()
        {
            return RedirectToAction("Login", "User");
        }

    }
}
