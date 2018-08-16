using System;
using  System.ComponentModel.DataAnnotations;
using System.IO;


namespace BusinessLayerProject
{
    public class User
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "User#")]
        public string UserId { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required(ErrorMessage = "*Required")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "*Required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Active { get; set; }
        [Required(ErrorMessage = "*Required")]
        [Display(Name = "User Type(Abv)")]
        public string UserType { get; set; }
        public string Phone { get; set; }
        public Stream Photo { get; set; }
        [Display(Name = "User Type")]
        public string UserTypeDesc { get; set; }
        [Display(Name = "Address")]
        public string Address { get; set; }
        [Display(Name = "User Photo")]
        public string ImageName { get; set; }

        public byte Age { get; set; }
        public string Ethnic { get; set; }
    }
}
