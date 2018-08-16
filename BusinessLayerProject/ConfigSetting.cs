using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLayerProject
{
    public class ConfigSetting
    {
        public short SettingId { get; set; }
        public string SettingType { get; set; }
        public string SettingName { get; set; }
        public string SettingValue { get; set; }
        public DateTime DateAdded { get; set; }
        public string AddedBy { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedDate { get; set; }
        public bool IsActive { get; set; }
        
    }
}
