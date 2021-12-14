using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;


public partial class CarDetails : System.Web.UI.Page
{
    float prce;
    SqlConnection con = new SqlConnection(
          WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["EmailID"] == null)
            { Response.Redirect("Default.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                login.Text = "My Accounts";
                login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "CHome.aspx";

                BindGrid();

            }
        }
    }

    protected void BindGrid()
    {
        int vid = int.Parse(Session["Vid"].ToString());
        string email = Session["EmailID"].ToString().Trim();
        con.Open();
        SqlCommand cmd = new SqlCommand("Select *from Vehicle where VehicleID='" + vid + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Name.Text = dr["Model"].ToString();
                Price.Text = dr["Price"].ToString();
                Color.Text = dr["Color"].ToString();
                Fuel.Text = dr["FuelType"].ToString();
                Transmission.Text = dr["Transmission"].ToString();
                Category.Text = dr["VehicleType"].ToString();
                byte[] bytes = (byte[])dr["Image"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image.ImageUrl = "data:image/png;base64," + base64String;
                //Image.ImageUrl= "data:image / png; base64,"+Convert.ToBase64String((byte[])dr["Image"]);
                Description.Text = dr["Description"].ToString();

            }
            con.Close();
        }
    }
    protected void Book_Click(object sender, EventArgs e)
    {
        int vid = int.Parse(Session["Vid"].ToString());
        string email = Session["EmailID"].ToString().Trim();
        con.Open();
        SqlCommand cmd = new SqlCommand("Select CustomerID from Customer where EmailID='" + email + "'", con);
        int cid = Convert.ToInt32(cmd.ExecuteScalar());

        SqlCommand cmd3 = new SqlCommand("Select Quantity from Vehicle where VehicleID='" + vid + "'", con);
        int quantity = Convert.ToInt32(cmd3.ExecuteScalar());
        if (quantity > 0)
        {
            Button clickedbutton = (Button)sender; //get clicked button
                                                   //GridViewRow row = (GridViewRow)clickedbutton.NamingContainer; //get the row where the button clicked
                                                   //int ind = row.RowIndex;

            var date = DateTime.Now.ToString("yyyy-MM-dd");
            //Label prc = (Label)vehicle.Rows[ind].FindControl("vcPrice");
            SqlCommand cmd2 = new SqlCommand("Insert into Orders(Date, Amount , OrderStatus, CustomerID,VehicleID ) Values(@date,@amount,@status,@cid,@vid)", con);
            cmd2.Parameters.AddWithValue("@date", date);
            cmd2.Parameters.AddWithValue("@amount", float.Parse(Price.Text));
            cmd2.Parameters.AddWithValue("@status", 0);
            //cmd2.Parameters.AddWithValue("@eid", null);
            cmd2.Parameters.AddWithValue("@cid", cid);
            cmd2.Parameters.AddWithValue("@vid", vid);
            int status = cmd2.ExecuteNonQuery();
            if (status == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Car booked successfully. You will redirected to your Account page ');window.location='Account.aspx'", true);
                quantity -= 1;
                SqlCommand cmd4 = new SqlCommand("Update Vehicle set Quantity='" + quantity + "' where VehicleID='" + vid + "'", con);
                cmd4.ExecuteNonQuery();

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Couldnot book. Try again later');", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Car not in stock');", true);
        }
        con.Close();

    }

}