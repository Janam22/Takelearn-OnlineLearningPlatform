using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace Takelearn
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void Btn_signup(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {


            try
            {
                Users user = new Users();

                user.Email = txtEmail.Text;
                user.Password = txtpassword.Text;

                if (user.authenticateUser())
                {
                    Response.Redirect("~/home/Dashboard.aspx");
                } else
                {
                    Response.Write("<script>alert('Please enter valid Username and Password')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Database error: can't login now.')</script>");
            }
        }

        protected void Btn_Feedback(object sender, EventArgs e)
        {


            try
            {
                Users user = new Users();

                user.Email = Email.Text;
                user.Fullname = FullName.Text;
                user.Feedback = Feedback.Text;

                if (user.AddFeedback())
                {
                    Response.Write("<script>alert('Feedback/Grievance submitted successfully.')</script>");
                    Email.Text = "";
                    FullName.Text = "";
                    Feedback.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('Please enter valid Name and Email.')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Database error: can't login now.')</script>");
            }
        }


    }
}