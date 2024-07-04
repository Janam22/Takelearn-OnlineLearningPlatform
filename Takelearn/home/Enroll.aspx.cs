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
    public partial class Enroll : System.Web.UI.Page
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
                //if (!IsPostBack)
                //{
                    this.Enrollment();
                    this.EnrolledCourseDetails();
                //}
            }
        }


        protected void EnrolledCourseDetails()
        {
            string ID = (string)Session["UserID"];
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                int UserID = Int32.Parse(ID);
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT a.id, a.file_name, a.course, a.created_date, c.course_catagory, b.course_name, b.course_description, b.course_duration, b.created_by, d.fullname, d.email, d.number, c.course FROM course_material a, courses b, enrollment c, registration d where b.created_by=d.id and a.course=b.id and a.course=c.course and b.id=c.course and c.student_code='" + UserID + "'";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }

        private void Enrollment()
        {
            string ID = (string)Session["UserID"];
            int StudentID = Int32.Parse(ID);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "SELECT a.id, a.course_catagory, a.course, a.created_date, b.course_name from enrollment a, courses b where a.course=b.id and a.student_code='" + StudentID + "'";
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


        protected void coursecategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string coursetype = coursecategory.SelectedValue;
            FillCourse(coursetype);
        }


    private void FillCourse(string coursetype)
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            string strConn = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT id, course_name FROM courses WHERE course_category =@coursetype and id not in (select course from enrollment where student_code='" + UserID + "')";
        cmd.Parameters.AddWithValue("@coursetype", coursetype);
        DataSet objDs = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        dAdapter.SelectCommand = cmd;
        con.Open();
        dAdapter.Fill(objDs);
        con.Close();
        if (objDs.Tables[0].Rows.Count > 0)
        {
            course.DataSource = objDs.Tables[0];
            course.DataTextField = "course_name";
            course.DataValueField = "id";
            course.DataBind();
        }
        else
        {
        }
    }


        protected void Enroll_Now(object sender, EventArgs e)
        {

            try
            {
                //create instane of middle layer business object
                Users user = new Users();

                string ID = (string)Session["UserID"];
                user.CourseCategory = coursecategory.SelectedValue;
                user.CourseName = course.SelectedValue;
                user.UserId = Int32.Parse(ID);

                //check if the email exists
                if (user.courseExists())
                {
                    Response.Write("<script>alert('You are already enrolled in this course, please select another course.')</script>");
                }
                else
                {
                    if (user.Enrollment())
                    {
                        this.Enrollment();
                        this.EnrolledCourseDetails();
                        coursecategory.SelectedValue = "";
                        course.SelectedValue = "";
                    }
                }
            }
            catch
            {
                //exception thrown so display error
                //Response.Write("<script>alert('Database connection error - failed to enroll.')</script>");
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

            this.Enrollment();
            this.EnrolledCourseDetails();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView2.EditIndex)
            {
                (e.Row.Cells[4].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('If you unenroll, you cannot access course material of related course. Are you sure you want to unenroll?');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            this.Enrollment();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            this.Enrollment();
        }


        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView2.Rows[e.RowIndex];
            int EnrollmentId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
            string coursecategory = (row.FindControl("txtcoursecategory") as DropDownList).SelectedValue;
            string coursename = (row.FindControl("txtcoursename") as DropDownList).SelectedValue;
            string query = "UPDATE enrollment SET course_catagory=@coursecatagory, course=@course WHERE id=@EnrollmentId";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@EnrollmentId", EnrollmentId);
                    cmd.Parameters.AddWithValue("@coursecatagory", coursecategory);
                    cmd.Parameters.AddWithValue("@course", coursename);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView2.EditIndex = -1;
            this.Enrollment();
        }


        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView2.EditIndex = -1;
            this.Enrollment();
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




        protected void DownloadFile(object sender, EventArgs e)
        {
            int coursematerialid = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select file_name, file_data, file_content_type, course from course_material where id=@coursematerialId";
                    cmd.Parameters.AddWithValue("@coursematerialId", coursematerialid);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["file_data"];
                        contentType = sdr["file_content_type"].ToString();
                        fileName = sdr["file_name"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
    }
}