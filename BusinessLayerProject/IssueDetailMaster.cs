using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayerProject
{
    public class IssueDetailMaster
    {
        public long MantisID { get; set; }
        public string IssueTitle { get; set; }
        public string TypeOfWork { get; set; }
        public string Priority { get; set; }
        public string TaskComplexity { get; set; }
        public DateTime StartDate { get; set; }
        public string CurrentStatus { get; set; }
        public DateTime StatusDate { get; set; }
        public List<IssueDetail> IssueDetails { get; set; }

    }
}
