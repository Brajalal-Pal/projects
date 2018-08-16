using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using  System.ComponentModel.DataAnnotations;

namespace BusinessLayerProject
{
    public class IssueDetail
    {
        [Display(Name = "Ticket #")]
        public long MantisID { get; set; }
        public byte SLNO { get; set; }        
        public string Summary { get; set; }
        public string AssingedBy { get; set; }
        [Display(Name = "Request Date")]
        public DateTime ReportDate { get; set; }
        public string Description { get; set; }
        [Display(Name = "Assigned to")]
        public string AssingedToList { get; set; }
        public string Priority { get; set; }
        [Display(Name = "Type")]
        public string TypeOfWork { get; set; }
        [Display(Name = "Status")]
        public string TaskStatus { get; set; }
        [Display(Name = "Sub-Status")]
        public string TaskSubStatus { get; set; }
        [Display(Name = "Complexity")]
        public string TaskComplexity { get; set; }
        [Display(Name = "Start Date")]
        public DateTime StartDate { get; set; }
        [Display(Name = "Current Status")]
        public string CurrentStatus { get; set; }
        [Display(Name = "Date")]
        public DateTime StatusDate { get; set; }
        public string Estimated { get; set; }
        //public List<AssingedToList> AssingedToLists { get; set; }

    }
}
