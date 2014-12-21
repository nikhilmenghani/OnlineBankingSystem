using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Helper;
using DAL;

namespace BAL
{
    public class BALCustomer
    {
        public int insertCustomer(Customer c)
        {
            DALCustomer customer = new DALCustomer();
            return customer.insert(c);
        }
    }
}
