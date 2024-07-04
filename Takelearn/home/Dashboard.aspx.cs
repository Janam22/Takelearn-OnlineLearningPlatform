using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Takelearn
{
    public partial class Dashboard : System.Web.UI.Page
    {

        public DatabaseConnection dataConnection;
        protected void Page_Load(object sender, EventArgs e)
        {


            //check if Session has expired or user has not logged in
            if (Session.Count == 0)
            {
                Response.Redirect("~/./home.aspx");
            }
            else
            {

                //retrieve nesseccary session data, casting into variables
                string ID = (string)Session["UserID"];
                string Fullname = (string)Session["Fullname"];
                string Designation = (string)Session["Designation"];

                int UserId = Convert.ToInt32(ID);

                Users user = new Users();
                welcome.Text = Fullname;


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
                    lbl_fullname.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
                    lbl_number.Text = ds.Tables[0].Rows[0]["number"].ToString();
                    lbl_email.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    lbl_gender.Text = ds.Tables[0].Rows[0]["gender"].ToString();
                    lbl_designation.Text = ds.Tables[0].Rows[0]["designation"].ToString();

                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    //Total Courses
                    using (SqlCommand totalcourses = new SqlCommand("SELECT COUNT(*) As Count FROM courses", conn))
                    {
                        totalcourses.CommandType = CommandType.Text;
                        conn.Open();
                        object o = totalcourses.ExecuteScalar();
                        if (o != null)
                        {
                            courses.Text = o.ToString() + "" + " Courses";
                        }
                        conn.Close();
                    }

                    //Total Enrolled Courses
                    using (SqlCommand totalenrolledcourses = new SqlCommand("SELECT COUNT(*) As Count FROM enrollment where student_code='" + UserId + "'", conn))
                    {
                        totalenrolledcourses.CommandType = CommandType.Text;
                        conn.Open();
                        object o = totalenrolledcourses.ExecuteScalar();
                        if (o != null)
                        {
                            enrolledcourses.Text = o.ToString() + "" + " Courses";
                        }
                        conn.Close();
                    }

                    //Total Tutors
                    using (SqlCommand totaltutors = new SqlCommand("SELECT COUNT(*) As Count FROM registration where designation='Staff'", conn))
                    {
                        totaltutors.CommandType = CommandType.Text;
                        conn.Open();
                        object o = totaltutors.ExecuteScalar();
                        if (o != null)
                        {
                            tutors.Text = o.ToString() + "" + " Tutors";
                        }
                        conn.Close();
                    }

                    //Total Students
                    using (SqlCommand ttotalstudents = new SqlCommand("SELECT COUNT(*) As Count FROM registration where designation='Student'", conn))
                    {
                        ttotalstudents.CommandType = CommandType.Text;
                        conn.Open();
                        object o = ttotalstudents.ExecuteScalar();
                        if (o != null)
                        {
                            totalstudents.Text = o.ToString() + "" + " Students";
                        }
                        conn.Close();
                    }

                    //Total Enrolled Students
                    using (SqlCommand ttotalenrolledstudents = new SqlCommand("SELECT COUNT(*) As Count FROM enrollment", conn))
                    {
                        ttotalenrolledstudents.CommandType = CommandType.Text;
                        conn.Open();
                        object o = ttotalenrolledstudents.ExecuteScalar();
                        if (o != null)
                        {
                            totalenrolledstudents.Text = o.ToString() + "" + " Students";
                        }
                        conn.Close();
                    }

                    //Total Enrolled Students on my course
                    using (SqlCommand ttotalenrolledstudentsonmycourse = new SqlCommand("SELECT COUNT(*) As Count FROM enrollment where course in (select id from courses where created_by='" + UserId + "')", conn))
                    {
                        ttotalenrolledstudentsonmycourse.CommandType = CommandType.Text;
                        conn.Open();
                        object o = ttotalenrolledstudentsonmycourse.ExecuteScalar();
                        if (o != null)
                        {
                            studentsonmycourse.Text = o.ToString() + "" + " Students";
                        }
                        conn.Close();
                    }

                    //My Total Courses
                    using (SqlCommand tmytotalcourses = new SqlCommand("SELECT COUNT(*) As Count FROM courses where created_by='" + UserId + "'", conn))
                    {
                        tmytotalcourses.CommandType = CommandType.Text;
                        conn.Open();
                        object o = tmytotalcourses.ExecuteScalar();
                        if (o != null)
                        {
                            mytotalcourses.Text = o.ToString() + "" + " Courses";
                        }
                        conn.Close();
                    }
                }

                if (Designation == "Student") //i.e. Student
                {
                    lblUserAccount.Text = "Student Account";
                    btnEnroll.Visible = true;
                    btnCourse.Visible = false;
                    btnStudent.Visible = false;
                    btnTutor.Visible = false;
                    btnstudentonmycourse.Visible = false;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = false;
                    personalinfo.Visible = false;
                    studentfeedback.Visible = true;

                    sttotalenrolledcourses.Visible = true;
                    stcoursescatagory.Visible = true;
                    sttotalcourses.Visible = true;
                    sttotaltutors.Visible = true;
                    tutotalstudents.Visible = false;
                    tutotalenrolledonmycourse.Visible = false;
                    tumytotalcourses.Visible = false;

                }

                if (Designation == "Staff") //i.e. Tutor
                {

                    //change Text and PostBack Url properties for tutor
                    lblUserAccount.Text = "Tutor Account";
                    btnEnroll.Visible = false;
                    btnCourse.Visible = true;
                    btnstudentonmycourse.Visible = true;
                    btnStudent.Visible = false;
                    btnTutor.Visible = false;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = false;
                    personalinfo.Visible = true;
                    studentfeedback.Visible = false;

                    sttotalenrolledcourses.Visible = false;
                    stcoursescatagory.Visible = false;
                    sttotalcourses.Visible = true;
                    sttotaltutors.Visible = false;
                    tutotalstudents.Visible = true;
                    tutotalenrolledstudents.Visible = true;
                    tutotalenrolledonmycourse.Visible = true;
                    tumytotalcourses.Visible = true;
                }

                if (Designation == "Admin") //i.e. Tutor
                {

                    //change Text and PostBack Url properties for Admin
                    //btnupdateUserDetails.Text = "Update Details";
                    lblUserAccount.Text = "Admin Account";
                    btnEnroll.Visible = false;
                    btnCourse.Visible = false;
                    btnStudent.Visible = true;
                    btnstudentonmycourse.Visible = false;
                    btnTutor.Visible = true;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = true;
                    personalinfo.Visible = true;
                    studentfeedback.Visible = false;

                    sttotalenrolledcourses.Visible = false;
                    stcoursescatagory.Visible = true;
                    sttotalcourses.Visible = true;
                    sttotaltutors.Visible = true;
                    tutotalstudents.Visible = true;
                    tutotalenrolledstudents.Visible = true;
                    tutotalenrolledonmycourse.Visible = false;
                    tumytotalcourses.Visible = false;
                }
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

        protected void Btn_Feedback(object sender, EventArgs e)
        {

            try
            {
                Users user = new Users();

                user.Feedback = Feedback.Text;
                user.Email = (string)Session["Email"];
                user.Fullname = (string)Session["Fullname"];

                if (user.AddFeedbackRegistered())
                {
                    Response.Write("<script>alert('Feedback/Grievance submitted successfully.')</script>");
                    Feedback.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('Can't submit feedback now.')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Database error: can't submit feedback now.')</script>");
            }
        }

    }

}