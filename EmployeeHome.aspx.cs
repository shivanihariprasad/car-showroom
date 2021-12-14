using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;



public partial class EmployeeHome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
       WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["EEmailID"] == null)
            { Response.Redirect("Default.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                login.Text = "My Accounts";
                login.NavigateUrl = "EmployeeAccount.aspx";
                //login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "EmployeeHome.aspx";

                BindGrid();
            }
        }
    }
    private void BindGrid()
    {
        if (con.State == ConnectionState.Closed)
            con.Open();
      
        
            //string email = Session["AEmailID"].ToString();
            //SqlCommand cmd4 = new SqlCommand("Select AgencyID from Agency where AEmailID='" + email + "'", con);
            //int aid = Convert.ToInt32(cmd4.ExecuteScalar());
            using (SqlCommand cmd = new SqlCommand("SELECT Orders.VehicleID,OrderID,Price, Model,Image,OrderStatus FROM Vehicle Inner Join Orders on Orders.VehicleID=Vehicle.VehicleID Where OrderStatus=0"))


            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ordercars.DataSource = dt;
                        ordercars.DataBind();
                        con.Close();
                    }
                }
            }
        }
    

    protected void ordercars_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ordercars.EditIndex = e.NewEditIndex;
        //Bind data to the GridView control.
        BindGrid();
    }

    //protected void ordercars_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    Button acc = (Button)sender;
    //    GridViewRow row = (GridViewRow)acc.NamingContainer;
    //    int index = Convert.ToInt32(e.CommandArgument);
       
    //    int oid = Convert.ToInt32(row.FindControl("OrderID"));
    //    Label prc = row.FindControl("Price") as Label;
    //    double incentive = 0.0005*(double.Parse(prc.Text));
    //    con.Open();
    //    string email = Session["EEmailID"].ToString();
    //    SqlCommand cmd4 = new SqlCommand("Select EmployeeID from Employee where EEmailID='" + email + "'", con);
    //    int eid = Convert.ToInt32(cmd4.ExecuteScalar());
    //    if (e.CommandName == "Accept")
    //    {
    //        SqlCommand cmd1 = new SqlCommand("Select Count(*) from Orders Where EmployeeID='" + eid + "' ", con);
    //        int count = Convert.ToInt32(cmd1.ExecuteScalar());
    //        if (count >= 5)
    //        {

    //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You Have exceeded your limit')", true);
    //        }
    //        else
    //        {
    //            SqlCommand cmd2 = new SqlCommand("Update Orders Set OrderStatus=1 , EmployeeID='" + eid + "' where OrderID='" + oid + "' ", con);
    //            int status2 = cmd2.ExecuteNonQuery();

    //            if (status2 == 1)
    //            {
    //                SqlCommand cmd3 = new SqlCommand("Update Set Incentive='"+incentive+"' where EmployeeID='" + eid + "' ", con);
    //                int status3 = cmd2.ExecuteNonQuery();
    //                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Accepted Successfully')", true);
    //                //Response.Redirect("Login.aspx");

    //            }
    //            else
    //            {

    //                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Couldnt Accept Orders')", true);
    //            }

    //        }
    //    }
    //}

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        Button acc = (Button)sender;
        GridViewRow row = (GridViewRow)acc.NamingContainer;
       

        Label id = (Label)(row.FindControl("OrderID"));
        int oid = int.Parse(id.Text);
        Label prc = row.FindControl("Price") as Label;
        float incentive =  (float)(0.0005 * (float.Parse(prc.Text)));
        con.Open();
        string email = Session["EEmailID"].ToString();
        SqlCommand cmd4 = new SqlCommand("Select EmployeeID from Employee where EEmailID='" + email + "'", con);
        int eid = Convert.ToInt32(cmd4.ExecuteScalar());
       
            SqlCommand cmd1 = new SqlCommand("Select Count(*) from Orders Where EmployeeID='" + eid + "' ", con);
            int count = Convert.ToInt32(cmd1.ExecuteScalar());
            if (count >= 5)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You Have exceeded your limit')", true);
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("Update Orders Set OrderStatus=1 , EmployeeID='" + eid + "' where OrderID='" + oid + "' ", con);
                int status2 = cmd2.ExecuteNonQuery();

                if (status2 == 1)
                {
                    SqlCommand cmd3 = new SqlCommand("Update Employee Set Incentive= Incentive +'" + incentive + "' , GrossSalary=GrossSalary+ '" + incentive + "' where EmployeeID='" + eid + "'", con);
                    int status3 = cmd3.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Accepted Successfully')", true);
                    //Response.Redirect("Login.aspx");

                }
                else
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Couldnt Accept Orders')", true);
                }

            }
        BindGrid();
        con.Close();
    }
    }
