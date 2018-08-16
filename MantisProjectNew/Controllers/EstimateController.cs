using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.Helpers;
using System.Web.Mvc;
using BusinessLayerProject;

namespace MantisProjectNew.Controllers
{
    public class EstimateController : Controller
    {
        // Attribute rout example
        [Route("estimate/send/{mantisid:regex(\\d{4}):range(1,20180730999)}")]
        public ActionResult Send(long mantisId)
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            //IEnumerable<EstimateForRequest> objEstReq = obj.GetEstimateForRequest(mantisId);
            List<EstimateForRequest> objEstReq = obj.GetEstimateForRequest(mantisId);
            return View(objEstReq);

        }

        public ActionResult ListofOpenRfc()
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            IEnumerable<ListofOpenRfc> objRfcs = obj.GetListofOpenRfc();
            return View(objRfcs);
        }
        public ActionResult Index(long MantisId)
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            IEnumerable<Estimate> objEstimates = obj.GetEstimate(MantisId);
            IssueDetailMaster objIssueDetailMaster = obj.GetRequestTitle(MantisId);

            ViewBag.MantisId = MantisId;
            ViewBag.IssueDetailMaster = objIssueDetailMaster;

            string chartImage = Server.MapPath("/Content/images/" + MantisId+".jpeg");
            ViewBag.chartImage = "/Content/images/" + MantisId + ".jpeg";
            
            /*
            ArrayList xValue = new ArrayList();
            ArrayList yValue = new ArrayList();

            //var result = from c in objEstimates select c;
            objEstimates.ToList().ForEach(rs => xValue.Add(rs.EstimateDesc));
            objEstimates.ToList().ForEach(rs => yValue.Add(rs.Hours));

            new Chart(width: 600, height: 400, theme: ChartTheme.Blue)
                .AddTitle("Estimate to complete").AddSeries("Default", chartType: "Bar", xValue: xValue,
                    yValues: yValue)
                .SetYAxis("Hours").Save(chartImage, "jpeg");
               */ 
            
            //.Write("bmp");

            return View(objEstimates);
        }

        public ActionResult Status()
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            IEnumerable<TaskStatus> objTaskStatus = obj.GetTaskStatus();

            string chartImage = Server.MapPath("/Content/images/TaskStatus.bmp");
            ViewBag.chartImage = "/Content/images/TaskStatus.bmp";
           
            
            ArrayList xValue = new ArrayList();
            ArrayList yValue = new ArrayList();

            //var result = from c in objEstimates select c;
            objTaskStatus.ToList().ForEach(rs => xValue.Add(rs.Status));
            objTaskStatus.ToList().ForEach(rs => yValue.Add(rs.NoOfRequest));

            var chr = new Chart(width: 1100, height: 500, theme: ChartTheme.Green)
                .AddTitle("Request Status chart").AddSeries("Default", chartType: "column", xValue: xValue,
                    yValues: yValue)
                .SetYAxis("No of Requests").Save(chartImage, "bmp");
            
            
            //.Write("bmp");

            return View();
        }

        public ActionResult TaskComplexityAndPriority()
        {
            BusinessLayerObjects obj = new BusinessLayerObjects();
            IEnumerable<TaskStatus> objTaskStatus = obj.GetTaskStatus("TaskComplexityAndPriority");

            string chartImage = Server.MapPath("/Content/images/TaskComplexityAndPriority.jpeg");
            ViewBag.chartImage = "/Content/images/TaskComplexityAndPriority.jpeg";


            ArrayList xValue = new ArrayList();
            ArrayList yValue = new ArrayList();

            //var result = from c in objEstimates select c;
            objTaskStatus.ToList().ForEach(rs => xValue.Add(rs.Status));
            objTaskStatus.ToList().ForEach(rs => yValue.Add(rs.NoOfRequest));

            new Chart(width: 1100, height: 500, theme: ChartTheme.Yellow)
                .AddTitle("Type of Request chart").AddSeries("Default", chartType: "column", xValue: xValue,
                    yValues: yValue)
                .SetYAxis("No of Requests").Save(chartImage, "jpeg");


            //.Write("bmp");

            return View();
        }
    }
}