using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class ConsultaProductos
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public string Categoria { get; set; }
        public string Proveedor { get; set; }
        public string Marca { get; set; }
        public decimal Medidas { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Precio { get; set; }
    }
}