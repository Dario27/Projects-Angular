//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace API
{
    using System;
    using System.Collections.Generic;
    
    public partial class Productos
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public int Categoria { get; set; }
        public int Proveedor { get; set; }
        public int Marca { get; set; }
        public decimal Medidas { get; set; }
        public decimal Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
    
        public virtual Categorias Categorias { get; set; }
        public virtual Marcas Marcas { get; set; }
        public virtual Proveedores Proveedores { get; set; }
    }
}