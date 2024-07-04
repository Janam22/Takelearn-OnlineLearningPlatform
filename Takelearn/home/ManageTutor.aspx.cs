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
    public partial class ManageTutor : System.Web.UI.Page
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
                    btnstudentonmycourse.Visible = false;
                    btnTutor.Visible = false;
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
                    btnstudentonmycourse.Visible = false;
                    btnStudent.Visible = true;
                    btnTutor.Visible = true;
                    btnlog.Visible = true;
                    btnChangePassword.Visible = true;
                    btnFeedback.Visible = true;
                }

                if (!IsPostBack)
                {
                    this.BindGrid();
                }

            }

        }


        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "SELECT * FROM registration where designation='Staff' and fullname like'" + txtsearch.Text + "%'";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (!object.Equals(dt, null))
                        {
                            GridView.DataSource = dt;
                            GridView.DataBind();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)

        {

            this.BindGrid();

        }


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }


        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView.Rows[e.RowIndex];
            int userId = Convert.ToInt32(GridView.DataKeys[e.RowIndex].Values[0]);
            string fullname = (row.FindControl("txtfullname") as TextBox).Text;
            string number = (row.FindControl("txtnumber") as TextBox).Text;
            string gender = (row.FindControl("txtgender") as DropDownList).SelectedValue;
            string email = (row.FindControl("txtemail") as TextBox).Text;
            string query = "UPDATE registration SET fullname=@fullname, number=@number, gender=@gender, email=@email WHERE id=@userId";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@fullname", fullname);
                    cmd.Parameters.AddWithValue("@number", number);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView.EditIndex = -1;
            this.BindGrid();
        }


        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView.EditIndex = -1;
            this.BindGrid();
        }


        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(GridView.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM registration WHERE id=@userId";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView.EditIndex)
            {
                (e.Row.Cells[7].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this student?');";
            }
            lblTotal.Text = "Total Tutors: " + (GridView.DataSource as DataTable).Rows.Count;
        }



        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }


        protected void Registration_Click(object sender, EventArgs e)
        {
            try
            {
                //validate input
                if (TextBox2.Text.Length < 6)
                {
                    Response.Write("<script>alert('Password must be at least 6 characters long.')</script>");
                }
                else
                {
                    try
                    {
                        //create instane of middle layer business object
                        Users user = new Users();

                        //set email property, so it  can be used as a parameter for the query
                        user.Email = TextBox4.Text;

                        //check if the email exists
                        if (user.emailaddressExists())
                        {
                            //already exists so output error
                            Response.Write("<script>alert('EmailAddress already exists, please enter another one')</script>");
                        }
                        else
                        {
                            user.Fullname = TextBox1.Text;
                            user.Password = TextBox2.Text;
                            user.Number = Number.Text;
                            user.Email = TextBox4.Text;
                            user.Gender = DropDownList3.SelectedValue;
                            user.Designation = "Staff";

                            if (user.Adduser())
                            {
                                this.BindGrid();
                                TextBox1.Text = "";
                                TextBox2.Text = "";
                                TextBox4.Text = "";
                                Number.Text = "";
                                DropDownList3.SelectedValue = "";
                            }
                        }
                    }
                    catch
                    {
                        //exception thrown so display error
                        Response.Write("<script>alert('Database connection error - failed to add student.')</script>");
                    }

                }
            }
            catch
            {
                //exception thrown so display error
                Response.Write("<script>alert('Database connection error - failed to add student.')</script>");
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