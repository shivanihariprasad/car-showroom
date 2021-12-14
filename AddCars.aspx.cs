using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.IO;

public partial class AddCars : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
         WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["AEmailID"] == null)
            { Response.Redirect("Default.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                login.Text = "Modify Cars";
                login.NavigateUrl = "ModifyCars.aspx";
                // login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "AddCars.aspx";
                //BindGrid();

            }
        }

    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ModifyCars.aspx");
    }

    protected void Save_Click1(object sender, EventArgs e)
    {
        con.Open();
        string email = Session["AEmailID"].ToString();
        SqlCommand cmd4 = new SqlCommand("Select AgencyID from Agency where AEmailID='"+email+"'", con);
        int aid = Convert.ToInt32(cmd4.ExecuteScalar());
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        //string contenttype = "image/jpg/png";
        Stream fs = FileUpload1.PostedFile.InputStream;
        BinaryReader br = new BinaryReader(fs);
        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
        string modl = Model.Text.ToString();
        string desc = Description.Text.ToString();
        float prce = float.Parse(Price.Text);
        string clr = Color.Text.ToString();
        int quan = int.Parse(Quantity.Text);
        string vehtype = DropDownList1.SelectedValue.ToString();
        string fueltype = DropDownList2.SelectedValue.ToString();
        string transmission = DropDownList3.SelectedValue.ToString();


        SqlCommand cmd = new SqlCommand("insert into Vehicle values(@model,@color,@desc,@price,@quantity,@image,@fuel,@vehiclety,@trans,@status)", con);
        cmd.Parameters.AddWithValue("@model", modl);
        cmd.Parameters.AddWithValue("@color", clr);
        cmd.Parameters.AddWithValue("@desc", desc);
        cmd.Parameters.AddWithValue("@price", prce);
        cmd.Parameters.AddWithValue("@quantity", quan);
        cmd.Parameters.AddWithValue("Image", bytes);
        cmd.Parameters.AddWithValue("fuel", fueltype);
        cmd.Parameters.AddWithValue("vehiclety", vehtype);
        cmd.Parameters.AddWithValue("trans", transmission);
        cmd.Parameters.AddWithValue("@status", 1);
       
        int status1=cmd.ExecuteNonQuery();
        if(status1==1)
        { 
            SqlCommand cmd2 = new SqlCommand("Select VehicleID from Vehicle Where Model='"+modl+"' and Quantity='"+quan+"' and Color='"+clr+"'",con);
            int vid = Convert.ToInt32(cmd2.ExecuteScalar());
            SqlCommand cmd3 = new SqlCommand("Insert Into AddCars Values('" + aid + "','" + vid + "','" + quan + "')", con);
            int status2 = cmd3.ExecuteNonQuery();
            if (status2 == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Car added successfully. You will redirected to Cars page');window.location='ModifyCars.aspx'", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Couldnot insert. Try again later');", true);
            }

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Couldnot insert. Try again later');", true);
        }
        con.Close();
    }
}