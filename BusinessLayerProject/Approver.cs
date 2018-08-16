using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using  System.ComponentModel.DataAnnotations;

namespace BusinessLayerProject
{
   public class Approver
    {
       [Display(Name = "User Id")]
        public string UserId { get; set; }
       [Display(Name = "User Name")]
        public string UserName { get; set; }
       [Display(Name = "User Email")]
        public string UserEmail { get; set; }
       [Display(Name = "User Phone")]
        public string UserPhone { get; set; }
        public byte PriorityOrder { get; set; }
        public string ApproverId { get; set; }
       [Display(Name = "Approver Name")]
        public string ApproverName { get; set; }
       [Display(Name = "Approver Email")]
        public string ApproverEmail { get; set; }
       [Display(Name = "Approver Phone")]
        public string ApproverPhone { get; set; }
       [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }
}
