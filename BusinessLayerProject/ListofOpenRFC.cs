using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using  System.ComponentModel.DataAnnotations;

namespace BusinessLayerProject
{
    public class ListofOpenRfc
    {
        [Display(Name = "Request#")]
        public long MantisId { get; set; }
        [Display(Name = "Request Title")]
        public string IssueTitle { get; set; }
        [Display(Name = "Current Status")]
        public string CurrentStatus { get; set; }
        [Display(Name = "Requested on")]
        public DateTime ReportDate { get; set; }
        [Display(Name = "Requested by")]
        public string AssingedBy { get; set; }
        public string Priority { get; set; }
        [Display(Name = "Complexity")]
        public string TaskComplexity { get; set; }
        [Display(Name = "Request Details")]
        public string Description { get; set; }
    }
}
