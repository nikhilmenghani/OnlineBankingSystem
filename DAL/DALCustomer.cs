using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Helper;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DALCustomer
    {
        public int insert(Customer c)
        {
            SqlConnection con = new SqlConnection("server=SREERAJ-PC;integrated security=true;database=MyDb");
            SqlCommand cmd = new SqlCommand("insertCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.Add("@cid", SqlDbType.Int);
            p1.Value = c.id;
            SqlParameter p2 = cmd.Parameters.Add("@cname", SqlDbType.NVarChar);
            p2.Value = c.name;
            SqlParameter p3 = cmd.Parameters.Add("@cage", SqlDbType.NVarChar);
            p3.Value = c.age;
            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            con.Open();
            cmd.ExecuteNonQuery();
            return Convert.ToInt32(returnParam.Value);
        }
    }
}
