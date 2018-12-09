using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayerProject;

namespace MantisProjectNew.Controllers
{
    [Authorize]
    public class SystemController : Controller
    {
        // GET: System
        public ActionResult Index()
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            var approverList = obj.GetApproverList();

            return View(approverList);
        }
    }
}