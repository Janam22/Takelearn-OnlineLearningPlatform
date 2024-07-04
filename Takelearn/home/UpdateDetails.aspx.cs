using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Takelearn.home
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if Session has expired or user has not logged in
            if (Session.Count == 0)
            {
                Response.Redirect("~/./home.aspx");
            }
            else
            {
                Users user = new Users();
                string Fullname = Session["Fullname"].ToString();
                welcome.Text = Fullname;

                //string ID = (string)Session["UserID"];
                string Designation = (string)Session["Designation"];
                if (Designation == "Student") //i.e. Student
                {
                    btnEnroll.Visible = true;
                    btnCourse.Visible = false;
                    btnStudent.Visible = false;
                    btnTutor.Visible = false;
                    btnstudentonmycourse.Visible = false;
                    btnLogout.Visible = true;
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
                    btnLogout.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = false;
                }

                if (Designation == "Admin") //i.e. Tutor
                {
                    btnEnroll.Visible = false;
                    btnCourse.Visible = false;
                    btnStudent.Visible = true;
                    btnTutor.Visible = true;
                    btnstudentonmycourse.Visible = false;
                    btnLogout.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = true;
                }

                if (!Page.IsPostBack)
                {
                    string ID = (string)Session["UserID"];
                    string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    string str;
                    SqlCommand com;

                    SqlConnection con = new SqlConnection(strConnString);
                    con.Open();
                    str = "select * from registration where id='" + ID + "'";
                    com = new SqlCommand(str, con);
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //txtid = ds.Tables[0].Rows[0]["id"].ToString();
                    txtid.Text = ds.Tables[0].Rows[0]["id"].ToString();
                    txtfullname.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
                    txtnumber.Text = ds.Tables[0].Rows[0]["number"].ToString();
                    txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    DropDownList1.SelectedValue = ds.Tables[0].Rows[0]["gender"].ToString();
                    //SelectedValue
                    con.Close();

                }

            }

        }

        protected void Update_Click(object sender, EventArgs e)
        {

            
            try
            {
                Users user = new Users();
                user.UserId = Int32.Parse(Session["UserID"].ToString());
                user.SessionEmail = Session["Email"].ToString();

                user.Fullname = txtfullname.Text;
                user.Email = txtemail.Text;
                user.Number = txtnumber.Text;
                user.Gender = DropDownList1.SelectedValue;

                //check if the email exists
                if (user.SessionemailaddressExists())
                {
                    //already exists so output error
                    Response.Write("<script>alert('EmailAddress already exists, please enter another one')</script>");
                }
                else
                {
                    if (user.UpdateUserDetails())
                    {
                        Response.Write("<script>alert('Data Changed Successfully!')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Database connection error - could not update details')</script>");
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Update error.')</script>");
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