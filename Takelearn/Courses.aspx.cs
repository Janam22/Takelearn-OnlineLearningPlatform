using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takelearn
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ProgrammingCourseDetails();
                NetworkingCourseDetails();
                BusinessCourseDetails();

            }
        }


        private void ProgrammingCourseDetails()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT a.course_name, a.course_description, a.course_duration, a.created_by, b.fullname from courses a, registration b where a.created_by=b.id and a.course_category='Programming'";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }


        private void NetworkingCourseDetails()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT a.course_name, a.course_description, a.course_duration, a.created_by, b.fullname from courses a, registration b where a.created_by=b.id and a.course_category='Networking'";
                    cmd.Connection = con;
                    con.Open();
                    GridView2.DataSource = cmd.ExecuteReader();
                    GridView2.DataBind();
                    con.Close();
                }
            }
        }


        private void BusinessCourseDetails()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT a.course_name, a.course_description, a.course_duration, a.created_by, b.fullname from courses a, registration b where a.created_by=b.id and a.course_category='Business Administration'";
                    cmd.Connection = con;
                    con.Open();
                    GridView3.DataSource = cmd.ExecuteReader();
                    GridView3.DataBind();
                    con.Close();
                }
            }
        }


        protected void EnrollProgramming(object sender, EventArgs e)
        {
            Response.Write("<script>alert('You must login first to enroll in programming course.')</script>");
        }


        protected void EnrollNetworking(object sender, EventArgs e)
        {
            Response.Write("<script>alert('You must login first to enroll in networking course.')</script>");
        }

        protected void EnrollBusiness(object sender, EventArgs e)
        {
            Response.Write("<script>alert('You must login first to enroll in business administration course.')</script>");
        }

    }
}