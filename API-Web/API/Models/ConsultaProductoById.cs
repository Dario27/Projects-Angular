using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class ConsultaProductosById
    {
        public int Id { get; set; }
        public string descripcion { get; set; }
        public int categoria { get; set; }
        public int proveedor { get; set; }
        public int marca { get; set; }
        public decimal medidas { get; set; }
        public decimal cantidad { get; set; }
        public decimal precio { get; set; }
    }
}