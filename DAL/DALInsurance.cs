using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Helper;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DALInsurance
    {
        public int Insert(Quotation q)
        {
            SqlConnection con = new SqlConnection("server=SREERAJ-PC;integrated security=true;database=obs");
            SqlCommand cmd = new SqlCommand("Add_Quotation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@CRN", q.Crn);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@v_type", q.VehicleType);
            SqlParameter p3 = cmd.Parameters.AddWithValue("@brand", q.Brand);
            SqlParameter p4 = cmd.Parameters.AddWithValue("@model", q.Model);
            SqlParameter p5 = cmd.Parameters.AddWithValue("@chassiss_no", q.ChassissNo);
            SqlParameter p6 = cmd.Parameters.AddWithValue("@engine_no", q.EngineNo);
            SqlParameter p7 = cmd.Parameters.AddWithValue("@exshowroom_price", q.Price);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            con.Open();
            cmd.ExecuteNonQuery();
            return Convert.ToInt32(returnParam.Value);
        }

        public int Approve(InsuranceApplication ia)
        {
            SqlConnection con = new SqlConnection("server=SREERAJ-PC;integrated security=true;database=obs");
            SqlCommand cmd = new SqlCommand("ApproveInsuranceApplication", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@CRN", ia.Crn);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@QID", ia.Qid);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            con.Open();
            cmd.ExecuteNonQuery();
            return Convert.ToInt32(returnParam.Value);
        }

        public int Renew(InsuranceApplication ia)
        {
            SqlConnection con = new SqlConnection("server=SREERAJ-PC;integrated security=true;database=obs");
            SqlCommand cmd = new SqlCommand("RenewInsuranceApplication", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@CRN", ia.Crn);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@QID", ia.Qid);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            con.Open();
            cmd.ExecuteNonQuery();
            return Convert.ToInt32(returnParam.Value);
        }


    }
}
