using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayerProject
{
 public   class EstimateForRequest
    {
        public long MantisId { get; set; }
        public short SLno { get; set; }
        public string EstimateType { get; set; }
        public short Hours { get; set; }
        public DateTime LastUpdateDate { get; set; }
        public string LastUpdatedBy { get; set; }
    }
}
