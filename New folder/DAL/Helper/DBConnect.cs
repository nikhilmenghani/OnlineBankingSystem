using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Helper
{
    public class DBConnect
    {
        string conn = ConfigurationManager.ConnectionStrings["connection_string"].ConnectionString;
        public SqlConnection con;
        SqlCommand cmd;
        public DBConnect()
        {
            con = new SqlConnection(conn);
        }

        public SqlCommand getSqlCommand(string procName)
        {
            cmd = new SqlCommand(procName, this.con);
            cmd.CommandType = CommandType.StoredProcedure;
            return cmd;
        }
    }
}
