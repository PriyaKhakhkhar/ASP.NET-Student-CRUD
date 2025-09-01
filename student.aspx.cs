using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LAB9
{
    public partial class student : System.Web.UI.Page
    {
        public string strconstr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        public SqlCommand cmd;
        public SqlDataAdapter sda;
        public DataSet ds;

        public void CreateConnection()
        {
            SqlConnection con = new SqlConnection(strconstr);
            cmd = new SqlCommand();
            cmd.Connection = con;
        }

        public void OpenConnection()
        {
            if (cmd.Connection.State == ConnectionState.Closed)
                cmd.Connection.Open();
        }

        public void CloseConnection()
        {
            if (cmd.Connection.State == ConnectionState.Open)
                cmd.Connection.Close();
        }

        public void DisposeConnection()
        {
            cmd.Connection.Dispose();
        }

        public void ClearControls()
        {
            txtenroll.Text = "";
            txtname.Text = "";
            txtsem.Text = "";
            txtspi.Text = "";
            txtcpi.Text = "";
        }

        // ✅ Bind using Stored Procedure
        public void BindStudentData()
        {
            try
            {
                CreateConnection();
                OpenConnection();
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Student_Crud";
                cmd.Parameters.AddWithValue("@Event", "SELECT");

                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                grdData.DataSource = ds;
                grdData.DataBind();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error in BindStudentData');</script>");
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudentData();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();
                cmd.Parameters.Clear();
                cmd.CommandText = "Student_Crud";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Event", "INSERT");
                cmd.Parameters.AddWithValue("@EnrollmentNo", Convert.ToInt32(txtenroll.Text.Trim()));
                cmd.Parameters.AddWithValue("@StudentName", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@StudentSemester", Convert.ToInt32(txtsem.Text.Trim()));
                cmd.Parameters.AddWithValue("@StudentSPI", Convert.ToDecimal(txtspi.Text.Trim()));
                cmd.Parameters.AddWithValue("@StudentCPI", Convert.ToDecimal(txtcpi.Text.Trim()));

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Record INSERTED Successfully');</script>");
                    grdData.EditIndex = -1;
                    BindStudentData();
                    ClearControls();
                }
                else
                {
                    Response.Write("<script>alert('Insert Failed');</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error in Insert');</script>");
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void grdData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdData.EditIndex = e.NewEditIndex;
            BindStudentData();
        }

        protected void grdData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdData.EditIndex = -1;
            BindStudentData();
        }

        protected void grdData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int s_id = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);

                CreateConnection();
                OpenConnection();
                cmd.Parameters.Clear();
                cmd.CommandText = "Student_Crud";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Event", "DELETE");
                cmd.Parameters.AddWithValue("@EnrollmentNo", s_id);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Record Deleted Successfully');</script>");
                    grdData.EditIndex = -1;
                    BindStudentData();
                    ClearControls();
                }
                else
                {
                    Response.Write("<script>alert('Delete Failed');</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error in Delete');</script>");
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void grdData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = grdData.Rows[e.RowIndex];
                int s_id = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
                string s_name = (row.FindControl("t_txtname") as TextBox).Text;
                string s_sem = (row.FindControl("t_txtsem") as TextBox).Text;
                string s_spi = (row.FindControl("t_txtspi") as TextBox).Text;
                string s_cpi = (row.FindControl("t_txtcpi") as TextBox).Text;

                CreateConnection();
                OpenConnection();
                cmd.Parameters.Clear();
                cmd.CommandText = "Student_Crud";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Event", "UPDATE");
                cmd.Parameters.AddWithValue("@EnrollmentNo", s_id);
                cmd.Parameters.AddWithValue("@StudentName", s_name.Trim());
                cmd.Parameters.AddWithValue("@StudentSemester", Convert.ToInt32(s_sem.Trim()));
                cmd.Parameters.AddWithValue("@StudentSPI", Convert.ToDecimal(s_spi.Trim()));
                cmd.Parameters.AddWithValue("@StudentCPI", Convert.ToDecimal(s_cpi.Trim()));

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Record UPDATED Successfully');</script>");
                    grdData.EditIndex = -1;
                    BindStudentData();
                    ClearControls();
                }
                else
                {
                    Response.Write("<script>alert('Update Failed');</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error in Update');</script>");
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdData.PageIndex = e.NewPageIndex;
            BindStudentData();
        }
    }
}
