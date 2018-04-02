using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//proxy using 추가
using System.ServiceModel.Description;
using Microsoft.Xrm.Sdk.Client;
using System.Configuration;
using Microsoft.Xrm.Sdk;


namespace QualiDemo.Report
{
    public partial class CommentReceived : System.Web.UI.Page
    {
        private Uri orgUri;
        private ClientCredentials credentials;
        private OrganizationServiceProxy proxy;
        private OrganizationServiceContext context;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}
