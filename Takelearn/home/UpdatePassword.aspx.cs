using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takelearn.home
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("~/./home.aspx");
            } else
            {

                Users user = new Users();
                string Fullname = Session["Fullname"].ToString();
                welcome.Text = Fullname;

                string ID = (string)Session["UserID"];
                string Designation = (string)Session["Designation"];
                if (Designation == "Student") //i.e. Student
                {
                    btnEnroll.Visible = true;
                    btnCourse.Visible = false;
                    btnStudent.Visible = false;
                    btnTutor.Visible = false;
                    btnstudentonmycourse.Visible = false;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = false;
                }

                if (Designation == "Staff") //i.e. Tutor
                {
                    btnEnroll.Visible = false;
                    btnCourse.Visible = true;
                    btnStudent.Visible = false;
                    btnstudentonmycourse.Visible = true;
                    btnTutor.Visible = false;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = false;
                }

                if (Designation == "Admin") //i.e. Tutor
                {
                    btnEnroll.Visible = false;
                    btnCourse.Visible = false;
                    btnStudent.Visible = true;
                    btnstudentonmycourse.Visible = false;
                    btnTutor.Visible = true;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = true;
                }

            }
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {

            try
            {
                    Users user = new Users();
                    user.UserId = Int32.Parse(Session["UserID"].ToString());

                    string password = user.getPasswordUsingID();

                    if (password.Equals(txtCurrentPassword.Text))
                    {
                        user.Password = txtNewPassword.Text; //UserId already set

                        if (user.updatePasswordByUserId())
                        {
                            //System.Threading.Thread.Sleep(4000);
                            Response.Write("<script>alert('Password Changed Successfully!')</script>");
                            //Response.Redirect("~/Dashboard.aspx?change=success");
                        }
                        else
                        {
                            Response.Write("<script>alert('Database connection error - could not update password')</script>");
                        }
                    } else
                    {
                    message.Text = "Incorrect Password.";
                    message.ForeColor = System.Drawing.Color.Red;
                    }
                
            }
            catch
            {
                Response.Write("<script>alert('Current password is incorrect')</script>");
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();

            string strScript = "<script>";
            strScript += "window.alert('Are you sure you want to logout?');";
            strScript += "window.location='../home.aspx';";
            strScript += "</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "strScript", strScript);

        }
    }
}