using CadParcial2Ajavp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClnParcial2Ajavp
{
    public class SerieCln
    {
        public static int insertar(Serie serie)
        {
            using (var context = new Parcial2AjavpEntities())
            {
                context.Serie.Add(serie);
                context.SaveChanges();
                return serie.id;
            }
        }

        public static int actualizar(Serie serie)
        {
            using (var context = new Parcial2AjavpEntities())
            {
                var existente = context.Serie.Find(serie.id);
                existente.titulo = serie.titulo;
                existente.sinopsis = serie.sinopsis;
                existente.director = serie.director;
                existente.episodios = serie.episodios;
                existente.fechaEstreno = serie.fechaEstreno;
                existente.categoria = serie.categoria;
                return context.SaveChanges();
            }
        }

        public static int eliminar(int id)
        {
            using (var context = new Parcial2AjavpEntities())
            {
                var serie = context.Serie.Find(id);
                serie.estado = -1;
                return context.SaveChanges();
            }
        }

        public static Serie obtenerUno(int id)
        {
            using (var context = new Parcial2AjavpEntities())
            {
                return context.Serie.Find(id);
            }
        }

        public static List<Serie> listar()
        {
            using (var context = new Parcial2AjavpEntities())
            {
                return context.Serie.Where(x => x.estado != -1).ToList();
            }
        }

        public static List<paSerieListar_Result> listarPa(string parametro)
        {
            using (var context = new Parcial2AjavpEntities())
            {
                return context.paSerieListar(parametro).ToList();
            }
        }
    }
}
