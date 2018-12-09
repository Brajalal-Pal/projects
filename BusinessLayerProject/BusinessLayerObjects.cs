using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BusinessLayerProject
{
    public class BusinessLayerObjects
    {
        string dbcs = "";

        public List<EstimateForRequest> GetEstimateForRequest(long mantisid)
        {
            string _dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(_dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "GetEstimateForRequest";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MantisId", mantisid));
            cmd.Connection = con;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<EstimateForRequest> list = new List<EstimateForRequest>();
            while (dr.Read())
            {
                EstimateForRequest obj = new EstimateForRequest();
                obj.MantisId = (long)dr["MantisId"];
                obj.SLno = (short) dr["Slno"];
                obj.EstimateType = dr["EstimateType"].ToString();                
                obj.Hours = (short)dr["Hours"];
                obj.LastUpdateDate = (DateTime)dr["LastUpdatedDate"];
                obj.LastUpdatedBy = dr["LastUpdatedBy"].ToString();
                
                list.Add(obj);
            }
            dr.Close();
            con.Close();

            return list;
        }

        public List<ListofOpenRfc> GetListofOpenRfc()
        {
            string _dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(_dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "GetListofOpenRFC";
            cmd.CommandType = CommandType.StoredProcedure;           
            cmd.Connection = con;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<ListofOpenRfc> list = new List<ListofOpenRfc>();
            while (dr.Read())
            {
                ListofOpenRfc obj = new ListofOpenRfc();
                obj.MantisId =(long)dr["MantisId"];
                obj.IssueTitle = dr["IssueTitle"].ToString();
                obj.CurrentStatus = dr["CurrentStatus"].ToString();
                obj.ReportDate =(DateTime)dr["ReportDate"];
                obj.AssingedBy = dr["AssingedBy"].ToString();
                obj.Priority = dr["Priority"].ToString();
                obj.TaskComplexity = dr["TaskComplexity"].ToString();
                obj.Description = dr["Description"].ToString();                

                list.Add(obj);
            }
            dr.Close();
            con.Close();

            return list;
        }

        public List<Approver> GetApproverList(string searchBy = "", string id ="")
        {
            string _dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(_dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "GetUserAndApproverList";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SearchBy", searchBy);
            cmd.Parameters.AddWithValue("@ID", id);
            cmd.Connection = con;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<Approver> list = new List<Approver>();
            while (dr.Read())
            {
                Approver obj = new Approver();
                obj.UserId = dr["UserId"].ToString();
                obj.UserName = dr["UserName"].ToString();
                obj.UserEmail = dr["UserEmail"].ToString();
                obj.UserPhone = dr["UserPhone"].ToString();
                obj.PriorityOrder = (byte)dr["Priority"];
                obj.ApproverId = dr["Approver"].ToString();
                obj.ApproverName = dr["ApproverName"].ToString();
                obj.ApproverEmail = dr["ApproverEmail"].ToString();
                obj.ApproverPhone = dr["ApproverPhone"].ToString();
                obj.IsActive = (bool)dr["IsActive"];
                
                list.Add(obj);
            }
            dr.Close();
            con.Close();

            return list;
        }

        public List<TaskStatus> GetTaskStatus(string statusType = "TaskStatus")
        {
            string _dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(_dbcs);
            SqlCommand cmd = new SqlCommand();
            if (statusType == "TaskStatus")
            {
                cmd.CommandText = "GetTaskStatus";    
            }
            else if (statusType == "TaskComplexityAndPriority")
            {
                cmd.CommandText = "GetTaskComplexityAndPriority";  
            }
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Connection = con;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<TaskStatus> list = new List<TaskStatus>();
            while (dr.Read())
            {
                TaskStatus obj = new TaskStatus();
                obj.Status = dr["Status"].ToString();
                obj.NoOfRequest = (int)dr["No"];                
                list.Add(obj);
            }

            dr.Close();
            con.Close();

            return list;
        }

        public List<Estimate> GetEstimate(long mantisId)
        {
            string _dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(_dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM [MantisDB].[dbo].[Estimate] where mantisid = @MantisId order by slno";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@MantisId", mantisId));
            cmd.Connection = con;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<Estimate> list = new List<Estimate>();
            while (dr.Read())
            {
                Estimate obj = new Estimate();
                obj.MantisId = (long)dr["MantisId"];
                obj.SLNO =(byte)dr["Slno"];
                obj.EstimateDesc = dr["Estimate"].ToString();
                obj.Hours =(double) dr["Hours"];               
                list.Add(obj);
            }

            dr.Close();
            con.Close();

            return list;
        }
        public List<ConfigSetting> GetConfigList(string settingType = "Status")
        {
            string _dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(_dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from ConfigSettings where SettingType=@SettingType order by SettingName, SettingValue";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@SettingType", settingType));            
            cmd.Connection = con;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<ConfigSetting> list = new List<ConfigSetting>();
            while (dr.Read())
            {
                ConfigSetting obj = new ConfigSetting();
                obj.SettingId = (short)dr["SettingID"];
                obj.SettingType = dr["SettingType"].ToString();
                obj.SettingName = dr["SettingName"].ToString();
                obj.SettingValue = dr["SettingValue"].ToString();
                obj.DateAdded = (DateTime) dr["DateAdded"];
                obj.AddedBy = dr["AddedBy"].ToString();
                obj.LastUpdatedBy = dr["LastUpdatedBy"].ToString();
                obj.LastUpdatedDate = (DateTime) dr["LastUpdatedDate"];
                obj.IsActive = (bool) dr["IsActive"];
                list.Add(obj);
            }

            dr.Close();
            con.Close();

            return list;
        }

        public void InitializeConnectionString()
        {
            dbcs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        }

        public List<AssingedToList> GetAssingedToList(long MantisID, byte SLNO)
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from AssingedToList where MantisId = "+ MantisID + "and Slno = " +SLNO;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            List<AssingedToList> AssingedToLists = new List<AssingedToList>();
            while (dr.Read())
            {
                AssingedToList obj = new AssingedToList();
                obj.MantisId = MantisID;
                obj.Slno = SLNO;
                obj.AssingedTo = dr["AssingedTo"].ToString();
                obj.Note = dr["note"].ToString();
                AssingedToLists.Add(obj);
            }

            dr.Close();
            con.Close();

            return AssingedToLists;

        }

        public string GetAssingedToListById(long MantisID, byte SLNO)
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from AssingedToList where MantisId = " + MantisID + "and Slno = " + SLNO;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            string str ="";
            while (dr.Read())
            {
                str = str + dr["AssingedTo"].ToString() + ", ";
            }

            dr.Close();
            con.Close();

            return str;

        }
        public IEnumerable<IssueDetail> GetMasterIssueDetails()
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "select * from IssueDetail where SLNo = 1 order by MantisId desc";
            //cmd.CommandText = "select a.*, m.StartDate, m.CurrentStatus, StatusDate from IssueDetail a, IssueDetailMaster m where a.MantisId = m.MantisId  and a.SLNo = 1 order by a.MantisId desc";
            cmd.CommandText =
                "select a.MantisId, a.SLNo, m.IssueTitle Summary, a.AssingedBy, a.ReportDate,a.Description ,"
                + " m.Priority,m.TypeOfWork, m.TaskComplexity, m.StartDate, m.CurrentStatus, StatusDate , Isnull(e.Estimate,'-1') Estimated "
                + " from IssueDetail a inner join IssueDetailMaster m on a.MantisId = m.MantisId "
                + " left join (select * from Estimate where slno=1) e on m.MantisId = e.MantisId"
                + " where  a.SLNo = 1 order by a.MantisId desc";

            
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<IssueDetail> issueDetails = new List<IssueDetail>();
            while (dr.Read())
            {
                IssueDetail obj = new IssueDetail();
                obj.MantisID =(long)dr["MantisId"];
                obj.SLNO = Convert.ToByte(dr["Slno"]);
                obj.Summary = dr["Summary"].ToString();
                obj.AssingedBy = dr["AssingedBy"].ToString();
                obj.ReportDate = Convert.ToDateTime(dr["ReportDate"]);
                obj.Description = dr["Description"].ToString();
                obj.Priority = dr["Priority"].ToString();
                obj.TypeOfWork = dr["TypeOfWork"].ToString();
                //obj.TaskStatus = dr["TaskStatus"].ToString();
                //obj.TaskSubStatus = dr["TaskSubStatus"].ToString();
                obj.TaskComplexity = dr["TaskComplexity"].ToString();
                obj.StartDate = (DateTime)dr["StartDate"];
                obj.CurrentStatus = dr["CurrentStatus"].ToString();
                obj.StatusDate = (DateTime)dr["StatusDate"];
                obj.Estimated = dr["Estimated"].ToString();
                obj.AssingedToList = GetAssingedToListById(obj.MantisID, obj.SLNO);
                //obj.AssingedToLists = GetAssingedToList(obj.MantisId, obj.Slno); //Get the list of AssingedToList
                issueDetails.Add(obj);
            }

            dr.Close();
            con.Close();

            return issueDetails;
            
        }

        public IssueDetailMaster GetRequestTitle(long MantisId)
        {
            InitializeConnectionString();
            IssueDetailMaster obj = new IssueDetailMaster();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT [MantisId],[StartDate],[CurrentStatus],[StatusDate],[IssueTitle],[TypeOfWork],[Priority],[TaskComplexity] FROM IssueDetailMaster where MantisId = @MantisId";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@MantisId", MantisId));
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                obj.MantisID = (long) dr["MantisId"];
                obj.StartDate = (DateTime)dr["StartDate"];
                obj.CurrentStatus = dr["CurrentStatus"].ToString();
                obj.StatusDate = (DateTime)dr["StatusDate"];
                obj.IssueTitle = dr["IssueTitle"].ToString();
                obj.TypeOfWork = dr["TypeOfWork"].ToString();
                obj.Priority = dr["Priority"].ToString();
                obj.TaskComplexity = dr["TaskComplexity"].ToString();
            }

            dr.Close();
            con.Close();

            return obj;
        }
        public IEnumerable<IssueDetail> GetIssueDetails(long MantisId)
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from IssueDetail where MantisId = "+ MantisId + " order by SLNo";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<IssueDetail> issueDetails = new List<IssueDetail>();
            while (dr.Read())
            {
                IssueDetail obj = new IssueDetail();
                obj.MantisID = (long)dr["MantisId"];
                obj.SLNO = Convert.ToByte(dr["Slno"]);
                obj.Summary = dr["Summary"].ToString();
                obj.AssingedBy = dr["AssingedBy"].ToString();
                obj.ReportDate = Convert.ToDateTime(dr["ReportDate"]);
                obj.Description = dr["Description"].ToString();
                obj.Priority = dr["Priority"].ToString();
                obj.AssingedToList = GetAssingedToListById(obj.MantisID, obj.SLNO);
                //obj.AssingedToLists = GetAssingedToList(obj.MantisId, obj.Slno); //Get the list of AssingedToList
                issueDetails.Add(obj);
            }

            dr.Close();
            con.Close();

            return issueDetails;

        }

        public IssueDetail GetOneStep(long MantisId, byte SLNO)
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from IssueDetail where MantisId = " + MantisId + " and Slno = " + SLNO +" order by SLNo";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            IssueDetail obj = new IssueDetail();
            while (dr.Read())
            {                
                obj.MantisID = (long)dr["MantisId"];
                obj.SLNO = Convert.ToByte(dr["Slno"]);
                obj.Summary = dr["Summary"].ToString();
                obj.AssingedBy = dr["AssingedBy"].ToString();
                obj.ReportDate = Convert.ToDateTime(dr["ReportDate"]);
                obj.Description = dr["Description"].ToString();
                obj.Priority = dr["Priority"].ToString();
                obj.AssingedToList = GetAssingedToListById(obj.MantisID, obj.SLNO);             
            }

            dr.Close();
            con.Close();

            return obj;

        }

        public IssueDetail CreateNewStep(long? MantisId)
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from IssueDetail where MantisId = " + MantisId + " and Slno = (select max(slno) from IssueDetail where mantisid = " + MantisId + " )";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            IssueDetail obj = new IssueDetail();
            while (dr.Read())
            {
                obj.MantisID = (long)dr["MantisId"];
                obj.SLNO = Convert.ToByte(dr["Slno"]);
                obj.Summary = dr["Summary"].ToString();
                obj.AssingedBy = dr["AssingedBy"].ToString();
                obj.ReportDate = Convert.ToDateTime(dr["ReportDate"]);
                obj.Description = dr["Description"].ToString();
                obj.Priority = dr["Priority"].ToString();
                obj.AssingedToList = GetAssingedToListById(obj.MantisID, obj.SLNO);
            }

            dr.Close();
            con.Close();

            return obj;

        }

        public User GetUserDetail(string userId)
        {
            User obj = new User();

            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand("Select a.*, b.SettingValue from users a inner join (select * from ConfigSettings where SettingType='UserType') b on a.UserType=b.SettingName where userid=@UserId", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@UserId", userId));            
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                obj.UserId = dr["UserId"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.FirstName = dr["FirstName"].ToString();
                obj.LastName = dr["LastName"].ToString();
                obj.EmailId = dr["EmailId"].ToString();
                obj.CreatedBy = dr["CreatedBy"].ToString();
                obj.CreatedDate = (DateTime)dr["CreatedDate"];
                obj.UserType = dr["UserType"].ToString();
                obj.Active = dr["Active"].ToString();
                obj.UserTypeDesc = dr["SettingValue"].ToString();
                obj.ImageName = dr["Photo"].ToString();
                obj.Address = dr["Address1"].ToString();
                obj.Phone = dr["Phone"].ToString();
                obj.Age = (byte) dr["Age"];
                obj.Ethnic = dr["Ethnic"].ToString();
            }
            else
            {
                obj = null;
            }

            dr.Close();
            con.Close();
            return obj;

        }

        public User GetUserDetail (User user)
        {
            User obj = new User();

            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand("Select a.*, b.SettingValue from users a inner join (select * from ConfigSettings where SettingType='UserType') b on a.UserType=b.SettingName where userid=@UserId and password=@Password", con);
            cmd.CommandType= CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("@UserId", user.UserId));
            cmd.Parameters.Add(new SqlParameter("@Password", user.Password));
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();     

            if (dr.Read())
            {
                obj.UserId = dr["UserId"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.FirstName = dr["FirstName"].ToString();
                obj.LastName = dr["LastName"].ToString();
                obj.EmailId = dr["EmailId"].ToString();
                obj.CreatedBy = dr["CreatedBy"].ToString();
                obj.CreatedDate = (DateTime)dr["CreatedDate"];
                obj.UserType = dr["UserType"].ToString();
                obj.Active = dr["Active"].ToString();
                obj.UserTypeDesc = dr["SettingValue"].ToString();
                obj.ImageName = dr["Photo"].ToString();
                obj.Address = dr["Address1"].ToString();
                obj.Phone = dr["Phone"].ToString();
                obj.Age = (byte)dr["Age"];
                obj.Ethnic = dr["Ethnic"].ToString();
            }
            else
            {
                obj = null;
            }

            dr.Close();
            con.Close();
            return obj;

        }
        public IEnumerable<User> GetUserList()
        {
            
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select a.*,b.SettingValue UserTypeDesc from MantisDB.dbo.Users a left join MantisDB.dbo.ConfigSettings b on a.UserType = b.SettingName and SettingType='UserType' order by b.SettingValue desc, a.FirstName";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<User> users = new List<User>();
            while (dr.Read())
            {
                User obj = new User();
                obj.UserId = dr["UserId"].ToString();
                obj.Password = dr["Password"].ToString();
                obj.FirstName = dr["FirstName"].ToString();
                obj.LastName = dr["LastName"].ToString();                    
                obj.EmailId = dr["EmailId"].ToString();
                obj.CreatedBy = dr["CreatedBy"].ToString();
                obj.CreatedDate =(DateTime)dr["CreatedDate"];
                obj.UserType = dr["UserType"].ToString();
                obj.Active = dr["Active"].ToString();
                obj.Phone = dr["Phone"].ToString();
                obj.UserTypeDesc = dr["UserTypeDesc"].ToString();
                obj.Address = dr["Address1"].ToString();
                //obj.Photo = GetImage(dr["Photo"]);
                users.Add(obj);
            }

            dr.Close();
            con.Close();

            return users;
            
        }

        public Int64 SaveIssueDetail(IssueDetail id)
        {
            //string dbcs = "Data source=.;database=MantisDB;Integrated Security = SSPI";
            InitializeConnectionString();
            SqlConnection con = new SqlConnection(dbcs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SaveIssueDetail";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;

            cmd.Parameters.Add(new SqlParameter("@MantisId", id.MantisID));
            cmd.Parameters.Add(new SqlParameter("@Slno", id.SLNO));
            cmd.Parameters.Add(new SqlParameter("@Summary", id.Summary));
            cmd.Parameters.Add(new SqlParameter("@AssingedBy", id.AssingedBy));
            //cmd.Parameters.Add(new SqlParameter("@ReportDate", null));
            
            cmd.Parameters.Add(new SqlParameter("@Description", id.Description));

            SqlParameter parId = new SqlParameter();
            parId.Direction = ParameterDirection.Output;
            parId.ParameterName = "@Id";
            parId.DbType = DbType.Int64;
            cmd.Parameters.Add(parId);

            con.Open();
            cmd.ExecuteNonQuery();
            
            con.Close();
            
            return Convert.ToInt64(parId.Value) > 0 ? Convert.ToInt64(parId.Value) : -1;
            

        }
    }
}
             