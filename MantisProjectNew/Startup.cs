using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MantisProjectNew.Startup))]
namespace MantisProjectNew
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
