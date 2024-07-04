using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takelearn.home
{
    public partial class StudentsOnMyCourse : System.Web.UI.Page
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
                //retrieve nesseccary session data, casting into variables
                string ID = (string)Session["UserID"];
                string Fullname = (string)Session["Fullname"];
                string Designation = (string)Session["Designation"];

                Users user = new Users();
                welcome.Text = Fullname;

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
                if (!IsPostBack)
                {
                    this.EnrolledStudentsOnMyCourse();
                }
            }
        }


        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int EnrollmentId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM enrollment WHERE id=@EnrollmentId";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@EnrollmentId", EnrollmentId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.EnrolledStudentsOnMyCourse();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView2.EditIndex)
            {
                (e.Row.Cells[8].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Are you sure you want to remove student from your course?');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            this.EnrolledStudentsOnMyCourse();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            this.EnrolledStudentsOnMyCourse();
        }


        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView2.EditIndex = -1;
            this.EnrolledStudentsOnMyCourse();
            
        }


        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView2.EditIndex = -1;
            this.EnrolledStudentsOnMyCourse();
        }


        protected void EnrolledStudentsOnMyCourse()
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "SELECT c.id, a.fullname, a.number, a.gender, a.email, b.course_category, b.course_name, c.student_code, c.created_date FROM registration a, courses b, enrollment c where a.id=c.student_code and c.course=b.id and b.created_by='" + UserID + "'";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (!object.Equals(dt, null))
                        {
                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
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
    }
}