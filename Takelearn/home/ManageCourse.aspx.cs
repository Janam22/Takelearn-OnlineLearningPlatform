using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takelearn.home
{
    public partial class ManageCourse : System.Web.UI.Page
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
                    CourseMaterials();
                    LoadTutorCourse();
                    CourseDetails();

                }

                
            }

        }


        private void LoadTutorCourse()
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            string com = "Select * from courses where created_by='" + UserID + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            cou.DataSource = dt;
            cou.DataBind();
            cou.DataTextField = "course_name";
            cou.DataValueField = "id";
            cou.DataBind();
        }

            private void CourseMaterials()
        {
            string ID = (string)Session["UserID"];
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                int UserID = Int32.Parse(ID);
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT a.id, a.file_name, a.created_date, a.course, b.course_name FROM course_material a, courses b where a.course=b.id and a.created_by='" + UserID + "'";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
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


        protected void Delete(object sender, EventArgs e)
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            int coursematerialid = int.Parse((sender as LinkButton).CommandArgument);
            string query = "DELETE FROM course_material WHERE id=@coursematerialId and created_by='" + UserID + "'";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@coursematerialId", coursematerialid);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.CourseMaterials();
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


        protected void Add_Course(object sender, EventArgs e)
        {
            try
               {
               //create instane of middle layer business object
               Users user = new Users();

                string ID = (string)Session["UserID"];
                user.CourseName = CourseName.Text;
                user.CourseDescription = CourseDetail.Text;
                user.CourseDuration = CourseDuration.Text;
                user.CourseCategory = CourseCategory.SelectedValue;
                user.UserId = Int32.Parse(ID);

                if (user.AddCourse())
                    {
                    //this.BindGrid();

                    CourseName.Text = "";
                    CourseCategory.Text = "";
                    CourseDetail.Text = "";
                    CourseDuration.Text = "";
                    CourseCategory.SelectedValue = "";
                }
                this.CourseDetails();
                this.LoadTutorCourse();
            }
                catch
                {
                        //exception thrown so display error
                    Response.Write("<script>alert('Database connection error - failed to add course.')</script>");
                }

        }

        protected void AddCourseMaterial(object sender, EventArgs e)
        {

            string ID = (string)Session["UserID"];
            string filename = Path.GetFileName(CourseFile.PostedFile.FileName);
            //Int32 UserID = Int32.Parse(ID);
            int UserID = Int32.Parse(ID);
            string Course = cou.SelectedValue;

            string contentType = CourseFile.PostedFile.ContentType;
            using (Stream fs = CourseFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into course_material values (@file_name, @file_content_type, @file_data, @course, @userid, @material_created_date)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@file_name", filename);
                            cmd.Parameters.AddWithValue("@file_content_type", contentType);
                            cmd.Parameters.AddWithValue("@file_data", bytes);
                            cmd.Parameters.AddWithValue("@course", Course);
                            cmd.Parameters.AddWithValue("@userid", UserID);
                            cmd.Parameters.AddWithValue("@material_created_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }



        private void CourseDetails()
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "SELECT * FROM courses where created_by='" + UserID + "' and course_name like'" + txtsearch.Text + "%'";
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


        protected void Button1_Click(object sender, EventArgs e)
        {
            this.CourseDetails();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            this.CourseDetails();
        }


        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            GridViewRow row = GridView2.Rows[e.RowIndex];
            int courseId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
            string coursename = (row.FindControl("txtcoursename") as TextBox).Text;
            string coursedescription = (row.FindControl("txtcoursedescription") as TextBox).Text;
            string coursecategory = (row.FindControl("txtcoursecategory") as DropDownList).SelectedValue;
            string courseduration = (row.FindControl("txtcourseduration") as TextBox).Text;
            string query = "UPDATE courses SET course_name=@course_name, course_description=@course_description, course_category=@course_category, course_duration=@course_duration WHERE id=@courseId and created_by='" + UserID + "'";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    cmd.Parameters.AddWithValue("@course_name", coursename);
                    cmd.Parameters.AddWithValue("@course_description", coursedescription);
                    cmd.Parameters.AddWithValue("@course_category", coursecategory);
                    cmd.Parameters.AddWithValue("@course_duration", courseduration);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView2.EditIndex = -1;
            this.CourseDetails();
        }


        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView2.EditIndex = -1;
            this.CourseDetails();
        }


        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = (string)Session["UserID"];
            int UserID = Int32.Parse(ID);
            int courseId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM courses WHERE id=@courseId and created_by='" + UserID + "'";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.CourseDetails();
        }



        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView2.EditIndex)
            {
                (e.Row.Cells[6].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this course?');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            this.CourseDetails();
        }



    }
}