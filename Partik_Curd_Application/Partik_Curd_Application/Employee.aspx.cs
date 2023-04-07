using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Partik_Curd_Application
{
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetEmployee();
               
            }
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
          if(btninsert.Text=="Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("AddUpdateEmp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Emp_id", -1);
                cmd.Parameters.AddWithValue("Emp_Name", txtEmp_Name.Text);
                cmd.Parameters.AddWithValue("Email_Address", txtEmail_Address.Text);
                cmd.Parameters.AddWithValue("Emp_Gender", Convert.ToInt32(rblEmp_Gender.SelectedValue));
                cmd.Parameters.AddWithValue("Contact_Number", Convert.ToInt32(txtContact_Number.Text));
                cmd.Parameters.AddWithValue("Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("Experience", txtExperience.Text);
                cmd.Parameters.AddWithValue("Department", txtDepartment.Text);
                cmd.Parameters.AddWithValue("Education", txtEducation.Text);
                cmd.Parameters.AddWithValue("Hobby", txtHobby.Text);
                cmd.ExecuteNonQuery();
                con.Close();
              
            }
          else if (btninsert.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("AddUpdateEmp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Emp_id", Convert.ToInt32(ViewState["id"]));
                cmd.Parameters.AddWithValue("Emp_Name", txtEmp_Name.Text);
                cmd.Parameters.AddWithValue("Email_Address", txtEmail_Address.Text);
                cmd.Parameters.AddWithValue("Emp_Gender", rblEmp_Gender.SelectedValue);
                cmd.Parameters.AddWithValue("Contact_Number", txtContact_Number.Text);
                cmd.Parameters.AddWithValue("Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("Experience", txtExperience.Text);
                cmd.Parameters.AddWithValue("Department", txtDepartment.Text);
                cmd.Parameters.AddWithValue("Education", txtEducation.Text);
                cmd.Parameters.AddWithValue("Hobby", txtHobby.Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            GetEmployee();
            Clear();
        }

        public void GetEmployee()
       {
            con.Open();
            SqlCommand cmd = new SqlCommand("GetEmp_Record", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cmd.ExecuteReader();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                grdEmployee.DataSource = dt;
                grdEmployee.DataBind();
            }
            else
            {
               grdEmployee.DataSource = dt;
               grdEmployee.DataBind();

            }
        }

        public void Clear()
        {
            txtEmp_Name.Text = "";
            txtEmail_Address.Text = "";
            txtContact_Number.Text = "";
            rblEmp_Gender.ClearSelection();
            txtDepartment.Text = "";
            txtEducation.Text = "";
            txtExperience.Text = "";
            txtHobby.Text = "";
            txtAddress.Text = "";
            btninsert.Text = "Submit";
        }

        protected void grdEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetEmpEditRecord", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("Emp_id", e.CommandArgument);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteReader();
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    ViewState["id"] = e.CommandArgument;
                    txtEmp_Name.Text = dt.Rows[0]["Emp_Name"].ToString();
                    txtEmail_Address.Text = dt.Rows[0]["Email_Address"].ToString();
                    rblEmp_Gender.Text = dt.Rows[0]["Emp_Gender"].ToString();
                    txtAddress.Text = dt.Rows[0]["Address"].ToString();
                    txtContact_Number.Text = dt.Rows[0]["Contact_Number"].ToString();
                    txtDepartment.Text = dt.Rows[0]["Department"].ToString();
                    txtEducation.Text = dt.Rows[0]["Education"].ToString();
                    txtExperience.Text = dt.Rows[0]["Experience"].ToString();
                    txtHobby.Text = dt.Rows[0]["Hobby"].ToString();
                    btninsert.Text = "Update";

                }
            }
            else if (e.CommandName == "DeleteData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteEmp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeleteEmp", e.CommandArgument);
                cmd.ExecuteReader();
                con.Close();
                GetEmployee();
            }
        }
    }
}