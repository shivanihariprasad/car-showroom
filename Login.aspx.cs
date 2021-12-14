using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink log = (HyperLink)Master.FindControl("logout");
        log.Visible = false;
     
    }


    protected void Login_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            
            int value = int.Parse(DropDownList1.SelectedValue.ToString());
            if (value == 1)
            {
                Session["EmailID"] = UserName.Text.ToString().Trim();
                SqlCommand cmd = new SqlCommand("CustomerLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", UserName.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@Password", Password.Text.ToString().Trim());

                int status = Convert.ToInt32(cmd.ExecuteScalar());
                if (status == 1)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successful , You will be redirected to home page');window.location='CHome.aspx'", true);
                    //Response.Redirect("Login.aspx");
                }

                else
                {
                    con.Close();
                    message.Text = "Invalid User Name or Password";  //for invalid login
                }
            }
            if (value == 2)
            {
                Session["EEmailID"] = UserName.Text.ToString().Trim();
                SqlCommand cmd5 = new SqlCommand("EmployeeLogin", con);
                cmd5.CommandType = CommandType.StoredProcedure;
                cmd5.Parameters.AddWithValue("@email", UserName.Text.ToString().Trim());
                cmd5.Parameters.AddWithValue("@Password", Password.Text.ToString().Trim());

                int status5 = Convert.ToInt32(cmd5.ExecuteScalar());
                if (status5 == 1)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successful , You will be redirected to home page');window.location='EmployeeHome.aspx'", true);
                    //Response.Redirect("Login.aspx");
                }

                else
                {
                    con.Close();
                    message.Text = "Invalid User Name or Password";  //for invalid login
                }
            }
            if (value == 3)
                {
                Session["AdEmailID"] = UserName.Text.ToString().Trim();
                SqlCommand cmd3 = new SqlCommand("AdminLogin", con);
                    cmd3.CommandType = CommandType.StoredProcedure;
                    cmd3.Parameters.AddWithValue("@email", UserName.Text.ToString().Trim());
                    cmd3.Parameters.AddWithValue("@Password", Password.Text.ToString().Trim());

                    int status3 = Convert.ToInt32(cmd3.ExecuteScalar());
                    if (status3 == 1)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successful , You will be redirected to home page');window.location='AdminHome.aspx'", true);
                        //Response.Redirect("Login.aspx");
                    }

                    else
                    {
                        con.Close();
                        message.Text = "Invalid User Name or Password";  //for invalid login
                    }

                }
                if (value == 4)
                {
                Session["AEmailID"] = UserName.Text.ToString().Trim();
                SqlCommand cmd4 = new SqlCommand("AgentLogin", con);
                    cmd4.CommandType = CommandType.StoredProcedure;
                    cmd4.Parameters.AddWithValue("@email", UserName.Text.ToString().Trim());
                    cmd4.Parameters.AddWithValue("@Password", Password.Text.ToString().Trim());

                    int status4 = Convert.ToInt32(cmd4.ExecuteScalar());
                    if (status4 == 1)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successful , You will be redirected to home page');window.location='AddCars.aspx'", true);
                        //Response.Redirect("Login.aspx");
                    }

                    else
                    {
                        con.Close();
                        message.Text = "Invalid User Name or Password";  //for invalid login
                    }

                }
            
        }
        catch (SqlException exe)
        {

        }
        finally
        {
            con.Close();
        }
    }
}
