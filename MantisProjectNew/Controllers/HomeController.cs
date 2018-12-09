using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MantisProjectNew.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Default()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AjaxData(string candidates)
        {/*
            ModelClass obj = new ModelClass()
            {
                ColumnName = options[0].ColumnName, ColumnType = options[0].ColumnType, ColumnValue = options[0].ColumnValue
            };
            */
            return Json(candidates);
        }
    }

    public class ModelClass
    {
        public string ColumnName { get; set; }
        public string ColumnType { get; set; }
        public string ColumnValue { get; set; }
    }
}