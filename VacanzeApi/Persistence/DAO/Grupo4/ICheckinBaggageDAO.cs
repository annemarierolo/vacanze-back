﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using vacanze_back.VacanzeApi.Common.Entities.Grupo4;

namespace vacanze_back.VacanzeApi.Persistence.DAO.Grupo4
{
    public interface ICheckinBaggageDAO
    {
        int PostCheckBaggage(List<CheckinBaggage> checkBag);
    }
}
