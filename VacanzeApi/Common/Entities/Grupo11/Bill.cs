﻿
using System.ComponentModel.DataAnnotations;
using vacanze_back.VacanzeApi.Common.Entities;

namespace vacanze_back.Entities.Grupo11
{

    /// <summary>
    /// clase de factura
    /// </summary>
    public class Bill : Entity
    {
        [Required]
        public string paymentMethod { get; set; }
        [Required]
        public string reference { get;  set; }
        [Required]
        public double total{get; set;}


        public Bill(int _id, string _paymentMethod, string _reference, double _total) : base(_id)
        {
            paymentMethod = _paymentMethod;
            reference = _reference;
            total = _total;
        }
        
        public long getId()
        {
            return Id;
        }

        public void setId(int _id)
        {
            Id = _id;
        }

        public string getPaymentMethod()
        {
            return paymentMethod;
        }

        public void setPaymentMethod(string _paymentMethod)
        {
            paymentMethod = _paymentMethod;
        }


        public string getReference()
        {
            return reference;
        }

        public void setReference(string _reference)
        {
            reference = _reference;
        }

        public double getTotal()
        {
            return total;
        }

        public void setTotal(double _total)
        {
            total = _total;
        }

    }
}
