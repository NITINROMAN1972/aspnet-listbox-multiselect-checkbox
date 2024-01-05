using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Multi_Check_DropDown.Startup))]
namespace Multi_Check_DropDown
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
