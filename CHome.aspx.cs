using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class CHome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
       WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["EmailID"] == null)
            { Response.Redirect("DEfault.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                login.Text = "My Accounts";
                login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "CHome.aspx";

                //BindGrid();
                RepeaterCar();
                BindRepeater1();
                BindRepeater2();
                BindRepeater3();
            }
        }

    }
    private void BindRepeater1()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select Distinct (VehicleType) from Vehicle where Status=1", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        outerRep.DataSource = ds;
        outerRep.DataBind();
        con.Close();
    }
    private void BindRepeater2()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select Distinct (FuelType) from Vehicle where Status=1", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        Repeater2.DataSource = ds;
        Repeater2.DataBind();
        con.Close();
    }
    private void BindRepeater3()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select Distinct (Transmission) from Vehicle where Status=1", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        Repeater3.DataSource = ds;
       Repeater3.DataBind();
        con.Close();
    }
    private void RepeaterCar()
    {
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model,Price,Image,FuelType,Transmission,VehicleType FROM Vehicle where Status=1"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                    con.Close();
                }
            }
        }
    }
    //    private void BindGrid()
    //    {

    //        using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model, Color,Price,Image, FuelType,Transmission , VehicleType FROM Vehicle where Status=1"))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.Connection = con;
    //                sda.SelectCommand = cmd;
    //                using (DataTable dt = new DataTable())
    //                {
    //                    sda.Fill(dt);
    //                    vehicle.DataSource = dt;
    //                    vehicle.DataBind();
    //                }
    //            }
    //        }
    //    }

    //    //protected void Unnamed_Click(object sender, EventArgs e)
    //    //{
    //    //    string text = Find.Text.ToString().Trim();
    //    //    con.Open();
    //    //    using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model, Color,Price, Image, FuelType, Transmission , VehicleType FROM Vehicle where Status=1 and Model like '%" + text + "%'", con))
    //    //    {
    //    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //    //        {
    //    //            cmd.Connection = con;
    //    //            sda.SelectCommand = cmd;
    //    //            using (DataTable dt = new DataTable())
    //    //            {
    //    //                sda.Fill(dt);
    //    //                vehicle.DataSource = dt;
    //    //                vehicle.DataBind();
    //    //            }
    //    //        }
    //    //    }
    //    //}

    protected void vehicletype(object sender, EventArgs e)
    {
        LinkButton link = (LinkButton)sender;
        string text = link.Text.Trim();
        con.Open();
        using (SqlCommand cmd = new SqlCommand("select vehicleid, model, color,price,image, fueltype,transmission , vehicletype from vehicle where status=1 and vehicletype='" + text + "'"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                    con.Close();
                }
            }
        }
    }
        //    }

        //    protected void BOOK_Click(object sender, EventArgs e)
        //    {
        //        string email = Session["EmailID"].ToString().Trim();
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("Select CustomerID from Customer where EmailID='"+email+"'", con);
        //        int eid = Convert.ToInt32(cmd.ExecuteScalar());

        //        Button clickedbutton = (Button)sender; //get clicked button
        //        GridViewRow row = (GridViewRow)clickedbutton.NamingContainer; //get the row where the button clicked
        //        int ind = row.RowIndex;
        //        int vid = Convert.ToInt32(vehicle.DataKeys[ind].Values[0]);
        //        var date= DateTime.Now.ToString("yyyy-MM-dd");
        //        Label prc = (Label)vehicle.Rows[ind].FindControl("vcPrice");
        //        SqlCommand cmd2 = new SqlCommand("Insert into Orders(Date, Amount , OrderStatus, CustomerID,VehicleID ) Values(@date,@amount,@status,@cid,@vid)", con);
        //        cmd2.Parameters.AddWithValue("@date", date);
        //        cmd2.Parameters.AddWithValue("@amount", prc.Text);
        //        cmd2.Parameters.AddWithValue("@status", 0);
        //        //cmd2.Parameters.AddWithValue("@eid", null);
        //        cmd2.Parameters.AddWithValue("@cid", eid);
        //        cmd2.Parameters.AddWithValue("@vid", vid);
        //        int status = cmd2.ExecuteNonQuery();
        //        if (status == 1)
        //        {
        //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Car booked successfully. You will redirected to my accounts ');window.location='Account.aspx'", true);

        //        }
        //        else
        //        {
        //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Couldnot book. Try again later');", true);
        //        }
        //        con.Close();

        //    }

        protected void sortby_Click(object sender, ImageClickEventArgs e)
        {   
            string text = null ;
        string text1 = Find.Text.ToString().Trim();
        con.Open();
            text = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like  '%" + text1 + "%'";
            int s = int.Parse(dropdownlist1.SelectedValue);
            
            if (s == 0)
            {
          
            text = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like '%" + text1 + "%' ";
            }
            if (s == 1)
            {
                text = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1  and Model like '%" + text1 + "%' Order by Price desc";
            }
            if (s == 2)
            {
                text = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1  and Model like '%" + text1 + "%' Order by Price asc";

            }
            if (s == 3)
            {
                text = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like '%" + text1 + "%' Order by VehicleID desc";
            }
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                SqlCommand cmd = new SqlCommand(text);
                cmd.Connection = con;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                con.Close();
            }
            }
        }

    protected void find_Click(object sender, ImageClickEventArgs e)
    {
        string trans = null;
        string fuel = null;
        string type = null;
        string text = Find.Text.ToString().Trim();
        con.Open();
        string text2 = "";
        int s = int.Parse(dropdownlist1.SelectedValue);

        int t = int.Parse(dropdownlist2.SelectedValue);
        if (t == 0)
        { trans = "%"; }
        else if (t == 1)
        { trans = "Manual"; }
        else if (t == 2) { trans = "Automatic"; }
        int f = int.Parse(dropdownlist3.SelectedValue);
        int tp = int.Parse(dropdownlist4.SelectedValue);
        if (f == 0)
        { fuel = "%"; }
        else if (f == 1)
        { fuel = "Petrol"; }
        else if (f == 2) { fuel = "Diesel"; }
        else if (f == 3) { fuel = "Gas"; }

        if (tp == 0)
        { type = "%"; }
        else if (tp == 1)
        { type = "Sedan"; }
        else if (tp == 2)
        { type = "Hatchback"; }
        else if (tp == 3)
        { type = "SUV"; }
        else if (tp == 4)
        { type = "Wagon"; }
        else if (tp == 5)
        { type = "MiniVan"; }
        else if (tp == 6)
        { type = "CrossOver"; }
        else if (tp == 7)
        { type = "Convertible"; }
        else if (tp == 8)
        { type = "Sports"; }

        if (s == 0)
        {
            text2 = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like '%" + text + "%' and Transmission like '%" + trans + "%' and FuelType like '%" + fuel + "%' and VehicleType like '%" + type + "%'";
        }
        if (s == 1)
        {
            text2 = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like '%" + text + "%' and Transmission like '%" + trans + "%' and FuelType like '%" + fuel + "%' and VehicleType like '%" + type + "%' Order by Price desc";
        }
        if (s == 2)
        {
            text2 = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like '%" + text + "%' and Transmission like '%" + trans + "%' and FuelType like '%" + fuel + "%' and VehicleType like '%" + type + "%' Order by Price asc";

        }
        if (s == 3)
        {
            text2 = "SELECT VehicleID, Model, Color, Price, Image, FuelType, Transmission, VehicleType FROM Vehicle where Status = 1 and Model like '%" + text + "%' and Transmission like '%" + trans + "%' and FuelType like '%" + fuel + "%' and VehicleType like '%" + type + "%' Order by VehicleID desc";
        }
        using (SqlCommand cmd = new SqlCommand(text2, con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                    con.Close();
                }
            }
        }
    }

    protected void VehicleType_Click(object sender, EventArgs e)
    {
        Find.Text = null;
        dropdownlist1.SelectedIndex = 0;
        dropdownlist2.SelectedIndex = 0;
        dropdownlist3.SelectedIndex = 0;
        dropdownlist4.SelectedIndex = 0;
        LinkButton link = (LinkButton)sender;
        string text = link.Text;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model,Price,Image,FuelType,Transmission,VehicleType FROM Vehicle where Status=1 and VehicleType='" + text + "'"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                    con.Close();
                }
            }
        }
    }
 
    protected void FuelType_Click(object sender, EventArgs e)
    {
        Find.Text = null;
        dropdownlist1.SelectedIndex = 0;
        dropdownlist2.SelectedIndex = 0;
        dropdownlist3.SelectedIndex = 0;
        dropdownlist4.SelectedIndex = 0;
        LinkButton link = (LinkButton)sender;
        string text = link.Text;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model,Price,Image,FuelType,Transmission,VehicleType FROM Vehicle where Status=1 and FuelType='" + text + "'"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                    con.Close();
                }
            }
        }
    }

    protected void TransmissionType_Click(object sender, EventArgs e)
    {
        Find.Text = null;
        dropdownlist1.SelectedIndex = 0;
        dropdownlist2.SelectedIndex = 0;
        dropdownlist3.SelectedIndex = 0;
        dropdownlist4.SelectedIndex = 0;
        LinkButton link = (LinkButton)sender;
        string text = link.Text;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model,Price,Image,FuelType,Transmission,VehicleType FROM Vehicle where Status=1 and Transmission='" + text + "'"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ViewCars.DataSource = dt;
                    ViewCars.DataBind();
                    con.Close();
                }
            }
        }
    }

    protected void details_Click(object sender, EventArgs e)
    {
        LinkButton link = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)link.NamingContainer;
        
        int index = item.ItemIndex;
        Label vid = (Label)item.FindControl("vcID");
         Session["Vid"] = Convert.ToInt32(vid.Text);
        Response.Redirect("CarDetails.aspx");
    }
}
