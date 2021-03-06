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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class BasePruebaEntities : DbContext
    {
        public BasePruebaEntities()
            : base("name=BasePruebaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Categorias> Categorias { get; set; }
        public virtual DbSet<Historial_P> Historial_P { get; set; }
        public virtual DbSet<Marcas> Marcas { get; set; }
        public virtual DbSet<Productos> Productos { get; set; }
        public virtual DbSet<Proveedores> Proveedores { get; set; }
    
        public virtual ObjectResult<spConsulCategories_Result> spConsulCategories()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spConsulCategories_Result>("spConsulCategories");
        }
    
        public virtual ObjectResult<spConsulMarcas_Result> spConsulMarcas()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spConsulMarcas_Result>("spConsulMarcas");
        }
    
        public virtual ObjectResult<spConsulProducts_Result> spConsulProducts()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spConsulProducts_Result>("spConsulProducts");
        }
    
        public virtual ObjectResult<spConsultaProductsById_Result> spConsultaProductsById(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spConsultaProductsById_Result>("spConsultaProductsById", idParameter);
        }
    
        public virtual ObjectResult<spConsultaProveedor_Result> spConsultaProveedor()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spConsultaProveedor_Result>("spConsultaProveedor");
        }
    }
}
