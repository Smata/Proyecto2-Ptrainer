using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WSPtrainer.Startup))]
namespace WSPtrainer
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
