
namespace dotnet_webapi.Models
{
    public class User
    {
        public long UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public UserRole Role { get; set; }

        public virtual Player Player { get; set; }
    }
}