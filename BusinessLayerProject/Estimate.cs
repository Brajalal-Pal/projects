using System.ComponentModel.DataAnnotations;

namespace BusinessLayerProject
{
    public class Estimate
    {
        [Display(Name = "Request#")]
        public long MantisId { get; set; }
        public byte SLNO { get; set; }
        [Display(Name = "Estimate")]
        public string EstimateDesc { get; set; }
        public double Hours { get; set; }
    }
}
