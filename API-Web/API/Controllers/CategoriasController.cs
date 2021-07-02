using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
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
    public class CategoriasController : ApiController
    {
        private BasePruebaEntities db = new BasePruebaEntities();

        // GET: api/Categorias
        public List<ConsultaCategorias> GetCategorias()
        {
            List<ConsultaCategorias> List;
            using (var context = new BasePruebaEntities())
            {
                List = context.Database.SqlQuery<ConsultaCategorias>("spConsulCategories").ToList();
                return List;
            }
        }

        // GET: api/Categorias/5
        [ResponseType(typeof(Categorias))]
        public async Task<IHttpActionResult> GetCategorias(int id)
        {
            Categorias categorias = await db.Categorias.FindAsync(id);
            if (categorias == null)
            {
                return NotFound();
            }

            return Ok(categorias);
        }

        // PUT: api/Categorias/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutCategorias(int id, Categorias categorias)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != categorias.Id)
            {
                return BadRequest();
            }

            db.Entry(categorias).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CategoriasExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Categorias
        [ResponseType(typeof(Categorias))]
        public async Task<IHttpActionResult> PostCategorias(Categorias categorias)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Categorias.Add(categorias);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = categorias.Id }, categorias);
        }

        // DELETE: api/Categorias/5
        [ResponseType(typeof(Categorias))]
        public async Task<IHttpActionResult> DeleteCategorias(int id)
        {
            Categorias categorias = await db.Categorias.FindAsync(id);
            if (categorias == null)
            {
                return NotFound();
            }

            db.Categorias.Remove(categorias);
            await db.SaveChangesAsync();

            return Ok(categorias);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CategoriasExists(int id)
        {
            return db.Categorias.Count(e => e.Id == id) > 0;
        }
    }
}