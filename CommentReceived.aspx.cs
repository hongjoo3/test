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

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {

                Uri orgUri = new Uri(ConfigurationManager.AppSettings["crmURL"]);
                ClientCredentials credentials = new ClientCredentials();
                credentials.UserName.UserName = ConfigurationManager.AppSettings["crmID"];
                credentials.UserName.Password = ConfigurationManager.AppSettings["crmPassword"];

                //생성
                using (OrganizationServiceProxy proxy = new OrganizationServiceProxy(orgUri, null, credentials, null))
                {
                    using (OrganizationServiceContext context = new OrganizationServiceContext(proxy))
                    {
                        Entity lead = new Entity("lead"); //테이블지정

                        lead.Attributes["subject"] = txt_subject.Text; //항목

                        lead.Attributes["companyname"] = txt_company.Text; //회사

                        lead.Attributes["lastname"] = txt_name.Text; //이름

                        lead.Attributes["jobtitle"] = txt_rank.Text; //직함

                        lead.Attributes["new_txt_department"] = txt_department.Text; //부서

                        lead.Attributes["emailaddress1"] = txt_emali.Text; //전자메일

                        lead.Attributes["mobilephone"] = txt_moblie.Text; //핸드폰

                        //lead.Attributes["new_txt_leadqna"] = txt_leadqna.Text; //잠재고객Q&A

                        //lead.Attributes["new_txt_opptyqna"] = txt_opptyqny.Text; //영업기회Q&A

                        lead.Attributes["description"] = txt_desc.Text; //설명

                        lead.Attributes["new_chk_preanswer"] = Convert.ToBoolean(1);

                        proxy.Create(lead);

                    }
                }

            }
            catch (Exception)
            {
                
            }
            finally
            {
                Response.Write("<script>alert('성공적으로 생성 되었습니다.');location.href='./CommentReceived.aspx';</script>");
            }

        }

        protected void SubjectLoad(object sender, EventArgs e)
        {
            var company = txt_company.Text;
            var name = txt_name.Text;
            var title = " [ " + company + " ] " + name + " - " + "데모 접수";

            txt_subject.Text = title;
            txt_rank.Focus();
        }
    }
}