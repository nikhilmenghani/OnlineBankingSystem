using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Helper;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace DAL
{
    public class DALInsurance
    {
        DBConnect dbc = new DBConnect();
        public Quotation Insert(Quotation q)
        {
            SqlCommand cmd = dbc.getSqlCommand("AddQuotation");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@v_type", q.VehicleType);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@brand", q.Brand);
            SqlParameter p3 = cmd.Parameters.AddWithValue("@model", q.Model);
            SqlParameter p4 = cmd.Parameters.AddWithValue("@price", q.Price);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            dbc.con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                q.Qid = Convert.ToInt32(reader.GetValue(0));
                q.Premium = Convert.ToDouble(reader.GetValue(1));
                q.Cover = Convert.ToDouble(reader.GetValue(2));
            }
            return q;
        }

        public int Apply(InsuranceApplication ia)
        {
            SqlCommand cmd = dbc.getSqlCommand("ApplyQuotation");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@qid", ia.Qid);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@chassiss_no", ia.ChassissNo);
            SqlParameter p3 = cmd.Parameters.AddWithValue("@engine_no", ia.EngineNo);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            dbc.con.Close();
            return Convert.ToInt32(returnParam.Value);
        }

        public int Approve(InsuranceApplication InsuranceApplicationobj)
        {
            SqlCommand cmd = dbc.getSqlCommand("ApproveInsuranceApplication");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@CRN", InsuranceApplicationobj.Crn);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@QID", InsuranceApplicationobj.Qid);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            return Convert.ToInt32(returnParam.Value);
        }

        public int Renew(InsuranceApplication InsuranceApplicationobj)
        {
            SqlCommand cmd = dbc.getSqlCommand("RenewInsuranceApplication");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = cmd.Parameters.AddWithValue("@CRN", InsuranceApplicationobj.Crn);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@QID", InsuranceApplicationobj.Qid);

            SqlParameter returnParam = new SqlParameter();
            returnParam.Value = ParameterDirection.ReturnValue;
            dbc.con.Open();
            cmd.ExecuteNonQuery();
            return Convert.ToInt32(returnParam.Value);
        }

        public List<QuotationData> getBrandNames(QuotationData qd)
        {
            SqlCommand cmd = dbc.getSqlCommand("GetBrands");
            SqlParameter p1 = cmd.Parameters.AddWithValue("@v_type", qd.VehicleType);
            dbc.con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            List<QuotationData> list = new List<QuotationData>();
            
            while (reader.Read())
            {
                QuotationData QDobj = new QuotationData();
                QDobj.QDid = Convert.ToInt32(reader.GetValue(0));
                QDobj.Brand = reader.GetValue(1).ToString();
                list.Add(QDobj);
            }
            reader.Close();
            dbc.con.Close();
            return list;
        }

        public List<QuotationData> getModelNames(QuotationData qd)
        {
            SqlCommand cmd = dbc.getSqlCommand("GetModels");
            SqlParameter p1 = cmd.Parameters.AddWithValue("@brand", qd.Brand);
            dbc.con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            List<QuotationData> list = new List<QuotationData>();
            while (reader.Read())
            {
                QuotationData QDobj = new QuotationData();
                QDobj.QDid = Convert.ToInt32(reader.GetValue(0));
                QDobj.Model = reader.GetValue(1).ToString();
                list.Add(QDobj);
            }
            reader.Close();
            dbc.con.Close();
            return list;
        }

        public double getPrice(QuotationData qd)
        {
            SqlCommand cmd = dbc.getSqlCommand("GetPrice");
            SqlParameter p1 = cmd.Parameters.AddWithValue("@v_type",qd.VehicleType);
            SqlParameter p2 = cmd.Parameters.AddWithValue("@brand", qd.Brand);
            SqlParameter p3 = cmd.Parameters.AddWithValue("@model", qd.Model);
            dbc.con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                QuotationData QDobj = new QuotationData();
                qd.ExShowroomPrice = Convert.ToDouble(reader.GetValue(0));
            }
            reader.Close();
            dbc.con.Close();
            return qd.ExShowroomPrice;
        }
    }
}
