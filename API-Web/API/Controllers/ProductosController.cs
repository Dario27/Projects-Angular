using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using API;
using API.Models;
namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ProductosController : ApiController
    {
        private BasePruebaEntities db = new BasePruebaEntities();

        // GET: api/Productos
        public List<ConsultaProductos> GetProductos()
        {
            List<ConsultaProductos> List;
            using (var context = new BasePruebaEntities())
            {
                List = context.Database.SqlQuery<ConsultaProductos>("spConsulProducts").ToList();
                return List;
            }
        }

        // GET: api/Productos/5
        [ResponseType(typeof(Productos))]
        public List<ConsultaProductosById> GetProductos(int id)
        {
            List<ConsultaProductosById> List;
            using (var context = new BasePruebaEntities())
            {
                List = context.Database.SqlQuery<ConsultaProductosById>("spConsultaProductsById @Id", new SqlParameter("Id", id)).ToList();
                return List;
            }
        }

        // PUT: api/Productos/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutProductos(Productos productos)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (productos.Id == 0)
            {
                return BadRequest();
            }

            db.Entry(productos).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
               
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Productos
        [ResponseType(typeof(Productos))]
        public async Task<IHttpActionResult> PostProductos(Productos productos)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Productos.Add(productos);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = productos.Id }, productos);
        }

        // DELETE: api/Productos/5
        [ResponseType(typeof(Productos))]
        public async Task<IHttpActionResult> DeleteProductos(int id)
        {
            Productos productos = await db.Productos.FindAsync(id);
            if (productos == null)
            {
                return NotFound();
            }

            db.Productos.Remove(productos);
            await db.SaveChangesAsync();

            return Ok(productos);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductosExists(int id)
        {
            return db.Productos.Count(e => e.Id == id) > 0;
        }
    }
}