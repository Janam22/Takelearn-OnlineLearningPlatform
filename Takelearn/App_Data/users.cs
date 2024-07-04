using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


public class Users
{

    public int UserId { get; set; }
    public string Fullname { get; set; }
    public string Password { get; set; }
    public string Number { get; set; }
    public string Email { get; set; }
    public string SessionEmail { get; set; }
    public string Gender { get; set; }
    public string Designation { get; set; }
    public string CourseName { get; set; }
    public string CourseDescription { get; set; }
    public string CourseDuration { get; set; }
    public string CourseCategory { get; set; }
    public string Feedback { get; set; }

    private DatabaseConnection dataConnection;

    //private DatabaseConnection dataConn;

    public Users()
    {
        dataConnection = new DatabaseConnection();
    }

    public bool emailaddressExists()
    {
        dataConnection.addParameter("@email_address", Email);

        string command = "Select COUNT(email) FROM registration WHERE email=@email_address";

        int result = dataConnection.executeScalar(command); //result of count

        return result > 0 || result == -1; //if record found or exception caught
    }

    public bool SessionemailaddressExists()
    {
        dataConnection.addParameter("@email_address", Email);
        dataConnection.addParameter("@session_email", SessionEmail);

        string command = "Select COUNT(email) FROM registration WHERE email=@email_address and email!=@session_email";

        int result = dataConnection.executeScalar(command); //result of count

        return result > 0 || result == -1; //if record found or exception caught
    }

    public bool courseExists()
    {
        dataConnection.addParameter("@course", CourseName);
        dataConnection.addParameter("@studentid", UserId);

        string command = "Select COUNT(course) FROM enrollment WHERE course=@course and student_code=@studentid";

        int result = dataConnection.executeScalar(command); //result of count

        return result > 0 || result == -1; //if record found or exception caught
    }

    public bool Adduser()
    {
        dataConnection.addParameter("@fullname", Fullname);
        dataConnection.addParameter("@password", Password);
        dataConnection.addParameter("@number", Number);
        dataConnection.addParameter("@email", Email);
        dataConnection.addParameter("@gender", Gender);
        dataConnection.addParameter("@designation", Designation);
        dataConnection.addParameter("@registration_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

        string command = "INSERT INTO registration (fullname, password, number, email, gender, designation, created_date) " +
                        "VALUES (@fullname, @password, @number, @email, @gender, @designation, @registration_date)";
    
        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }

    public bool AddFeedback()
    {
        dataConnection.addParameter("@fullname", Fullname);
        dataConnection.addParameter("@feedback", Feedback);
        dataConnection.addParameter("@email", Email);
        dataConnection.addParameter("@feedback_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

        string command = "INSERT INTO feedback (fullname, email, feedback, usertype, created_date) " +
                        "VALUES (@fullname, @email, @feedback, 'Guest', @feedback_date)";

        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }


    public bool AddFeedbackRegistered()
    {

        dataConnection.addParameter("@email", Email);
        dataConnection.addParameter("@fullname", Fullname);
        dataConnection.addParameter("@feedback", Feedback);
        dataConnection.addParameter("feedback_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

        string command = "INSERT INTO feedback (fullname, email, feedback, usertype, created_date) " +
                        "VALUES (@fullname, @email, @feedback, 'Registered', @feedback_date)";

        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }



    public bool AddCourse()
    {
        dataConnection.addParameter("@course_name", CourseName);
        dataConnection.addParameter("@course_description", CourseDescription);
        dataConnection.addParameter("@course_duration", CourseDuration);
        dataConnection.addParameter("@course_category", CourseCategory);
        dataConnection.addParameter("@created_by", UserId);
        dataConnection.addParameter("@course_created_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

        string command = "INSERT INTO courses (course_name, course_description, course_duration, course_category, created_by, created_date) " +
                        "VALUES (@course_name, @course_description, @course_duration, @course_category, @created_by, @course_created_date)";
        
        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }


    public bool Enrollment()
    {
        dataConnection.addParameter("@course_name", CourseName);
        dataConnection.addParameter("@course_category", CourseCategory);
        dataConnection.addParameter("@studentcode", UserId);
        dataConnection.addParameter("@enrollment_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

        string command = "INSERT INTO enrollment (course_catagory, course, student_code, created_date) " +
                        "VALUES (@course_category, @course_name, @studentcode, @enrollment_date)";

        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }

    public string getPasswordUsingID()
    {
        dataConnection.addParameter("@UserID", UserId);

        string command = "Select password FROM registration WHERE id=@userID";

        DataTable table = dataConnection.executeReader(command);

        if (table.Rows.Count > 0)
        {
            return table.Rows[0]["password"].ToString();
        }
        else
        {
            return "";
        }
    }

    public bool authenticateUser()
    {
        dataConnection.addParameter("@email", Email);
        dataConnection.addParameter("@password", Password);

        string command = "Select id, email, fullname, designation FROM registration " +
                        "WHERE email=@email AND password=@password";

        DataTable table = dataConnection.executeReader(command);

        if (table.Rows.Count > 0)
        {
            HttpContext.Current.Session["UserID"] = table.Rows[0]["id"].ToString();
            HttpContext.Current.Session["Fullname"] = table.Rows[0]["fullname"].ToString();
            HttpContext.Current.Session["Email"] = table.Rows[0]["email"].ToString();
            HttpContext.Current.Session["Designation"] = table.Rows[0]["designation"].ToString();

            return true;
        }
        else
        {
            return false;
        }
    }




    public bool updatePasswordByUserId()
    {
        dataConnection.addParameter("@password", Password);
        dataConnection.addParameter("@UserID", UserId);

        string command = "Update registration Set password=@password WHERE id=@UserID";

        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }

    public bool UpdateUserDetails()
    {
        dataConnection.addParameter("@fullname", Fullname);
        dataConnection.addParameter("@number", Number);
        dataConnection.addParameter("@email", Email);
        dataConnection.addParameter("@gender", Gender);
        dataConnection.addParameter("@UserID", UserId);

        string command = "Update registration Set fullname=@fullname, number=@number, email=@email, gender=@gender WHERE id=@UserID";
        
        return dataConnection.executeNonQuery(command) > 0; //i.e. 1 or more rows affected
    }


}