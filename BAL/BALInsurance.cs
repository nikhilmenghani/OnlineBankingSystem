using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Helper;
using DAL;

namespace BAL
{
    public class BALInsurance
    {
        public int Insert(Quotation q)
        {
            DALInsurance insurance = new DALInsurance();
            return insurance.Insert(q);
        }

        public int Approve(InsuranceApplication ia)
        {
            DALInsurance di = new DALInsurance();
            return di.Approve(ia);
        }

        public int Renew(InsuranceApplication ia)
        {
            DALInsurance di = new DALInsurance();
            return di.Renew(ia);
        }
    }
}
