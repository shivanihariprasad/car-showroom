using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class DeleteEmployee : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
       WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((Session["AdEmailID"] == null))
            { Response.Redirect("Default.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                login.Text = "Modify Cars";
                login.Visible = false;
                // login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "AdminHome.aspx";
                BindGrid();

            }



        }
    }
    private void BindGrid()
    {
        con.Open();
        //string email = Session["AEmailID"].ToString();
        //SqlCommand cmd4 = new SqlCommand("Select * from Employee  + "'", con);
        //int aid = Convert.ToInt32(cmd4.ExecuteScalar());
        using (SqlCommand cmd = new SqlCommand("Select * from Employee"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    deleteEmployee.DataSource = dt;
                    deleteEmployee.DataBind();
                    con.Close();
                }
            }
        }
    }
    protected void deleteEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(deleteEmployee.DataKeys[e.RowIndex].Value);
        //// find updated values for update
        TextBox bs = (TextBox)deleteEmployee.Rows[e.RowIndex].FindControl("textBS");
        TextBox i = (TextBox)deleteEmployee.Rows[e.RowIndex].FindControl("textI");

        //DropDownList ft = (DropDownList)deleteEmployee.Rows[e.RowIndex].FindControl("DropDownList2");
        ////DropDownList vt = (DropDownList)deleteEmployee.Rows[e.RowIndex].FindControl("DropDownList1");
        //DropDownList tr = (DropDownList)deleteEmployee.Rows[e.RowIndex].FindControl("DropDownList3");
        ////TextBox city = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_City");
        float gross = (float)(float.Parse(bs.Text) + float.Parse(i.Text));
        SqlCommand cmd = new SqlCommand("Update  Employee Set BasicSalary='" + float.Parse(bs.Text) + "', Incentive='" + float.Parse(i.Text) + "' , GrossSalary='" + gross + "' Where EmployeeID='" + id + "'", con);
        ////cmd.Parameters.AddWithValue("@color",clr.Text);
        ////cmd.Parameters.AddWithValue("@price",float.Parse(prc.Text));
        ////cmd.Parameters.AddWithValue("@fuel", ft.SelectedValue.ToString());
        ////cmd.Parameters.AddWithValue("@trans", tr.SelectedValue.ToString());
        //// cmd.Parameters.AddWithValue("@vid", id);
        con.Open();
        int status = cmd.ExecuteNonQuery();
        con.Close();

        deleteEmployee.EditIndex = -1;
        BindGrid();
    }

    
    protected void btnstatus_Click(object sender, EventArgs e)
    {
        Button clickedbutton = (Button)sender; //get clicked button
        GridViewRow row = (GridViewRow)clickedbutton.NamingContainer; //get the row where the button clicked
        int ind = row.RowIndex;
        string id = deleteEmployee.DataKeys[ind].Value.ToString();
        Button btstatus = row.FindControl("btnstatus") as Button;
        string status = btstatus.Text;
        int newstat = 0;
        if (status == "Activate")
        {
            status = "Deactivate";
            newstat = 1;
        }
        else if (status == "Deactivate")
        {
            status = "Activate";
            newstat = 0;
        }
        // update record
        SqlCommand cmd = new SqlCommand("update Employee set Status='" + newstat + "'where EmployeeID=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        BindGrid();
    }
    protected void deleteEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        deleteEmployee.PageIndex = e.NewPageIndex;
        //Bind data to the GridView control.
        BindGrid();
    }

    protected void deleteEmployee_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Set the edit index.
        deleteEmployee.EditIndex = e.NewEditIndex;
        //Bind data to the GridView control.
        BindGrid();
    }


    protected void deleteEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        deleteEmployee.EditIndex = -1;
        BindGrid();
    }

    
}