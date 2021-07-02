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

namespace PruebaLeonelTrivino.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class MarcasController : ApiController
    {
        private BasePruebaEntities db = new BasePruebaEntities();

        // GET: api/Marcas
        public List<ConsultaMarcas> GetMarcas()
        {
            List<ConsultaMarcas> List;
            using (var context = new BasePruebaEntities())
            {
                List = context.Database.SqlQuery<ConsultaMarcas>("spConsulMarcas").ToList();
                return List;
            }
        }

        // GET: api/Marcas/5
        [ResponseType(typeof(Marcas))]
        public async Task<IHttpActionResult> GetMarcas(int id)
        {
            Marcas marcas = await db.Marcas.FindAsync(id);
            if (marcas == null)
            {
                return NotFound();
            }

            return Ok(marcas);
        }

        // PUT: api/Marcas/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutMarcas(int id, Marcas marcas)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != marcas.Id)
            {
                return BadRequest();
            }

            db.Entry(marcas).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MarcasExists(id))
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

        // POST: api/Marcas
        [ResponseType(typeof(Marcas))]
        public async Task<IHttpActionResult> PostMarcas(Marcas marcas)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Marcas.Add(marcas);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = marcas.Id }, marcas);
        }

        // DELETE: api/Marcas/5
        [ResponseType(typeof(Marcas))]
        public async Task<IHttpActionResult> DeleteMarcas(int id)
        {
            Marcas marcas = await db.Marcas.FindAsync(id);
            if (marcas == null)
            {
                return NotFound();
            }

            db.Marcas.Remove(marcas);
            await db.SaveChangesAsync();

            return Ok(marcas);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MarcasExists(int id)
        {
            return db.Marcas.Count(e => e.Id == id) > 0;
        }
    }
}