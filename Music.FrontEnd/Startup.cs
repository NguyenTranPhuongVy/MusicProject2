using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Music.FrontEnd.Startup))]
namespace Music.FrontEnd
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
