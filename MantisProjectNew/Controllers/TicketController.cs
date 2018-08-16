using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayerProject;

namespace MantisProjectNew.Controllers
{
    public class TicketController : Controller
    {
        public ActionResult Index()
        {

            BusinessLayerObjects obj = new BusinessLayerObjects();
            return View(obj.GetMasterIssueDetails());
        }

        public ActionResult Details(long MantisId)
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            return View(obj.GetIssueDetails(MantisId));
        }

        public ActionResult ViewStep(long MantisId, byte SLNO)
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            return View(obj.GetOneStep(MantisId, SLNO));
        }

        public ActionResult Create(long MantisID)
        {
            if (Session["EmailId"] == null)
            {
                return RedirectToAction("Index", "User");
            }

            IssueDetail id = new IssueDetail();

            //instantiate View model class
            BusinessLayerObjects obj = new BusinessLayerObjects();
            id = obj.CreateNewStep(MantisID);

            //Get list of users except current user
            var Users = obj.GetUserList().Where(m => m.EmailId != Session["EmailId"].ToString()).ToList();
            ViewBag.Users = Users;
            
            IEnumerable<ConfigSetting> objConfigList = obj.GetConfigList("Status");
            var typeOfWork = objConfigList.Where(m => m.SettingName == "TypeOfWork").ToList();
            ViewBag.typeOfWork = typeOfWork;

            var priority = objConfigList.Where(m => m.SettingName == "Priority").ToList();
            ViewBag.priority = priority;

            var taskStatus = objConfigList.Where(m => m.SettingName == "TaskStatus").ToList();
            ViewBag.taskStatus = taskStatus;

            var taskSubStatus = objConfigList.Where(m => m.SettingName == "TaskSubStatus").ToList();
            ViewBag.taskSubStatus = taskSubStatus;

            var taskComplexity = objConfigList.Where(m => m.SettingName == "TaskComplexity").ToList();
            ViewBag.taskComplexity = taskComplexity;

            return View(id);
        }

        [HttpPost]
        public ActionResult Create(IssueDetail id)
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            id.AssingedBy = Session["EmailId"].ToString();
            
            Debug.Print(id.AssingedToList);

            Int64 MantisId2 = obj.SaveIssueDetail(id);


            /*var Users = obj.GetUserList();
            ViewBag.Users = Users;*/

            return RedirectToAction("Details", new { MantisId = MantisId2 });
        }

        
    }
}
