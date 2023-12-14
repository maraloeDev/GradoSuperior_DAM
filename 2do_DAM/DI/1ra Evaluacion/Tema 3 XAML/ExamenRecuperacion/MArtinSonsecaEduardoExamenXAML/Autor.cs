using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MArtinSonsecaEduardoExamenXAML
{
    public class Autor
    {
        public string Nombre { get; set; }
        public string ISBN { get; set; }
        public string Titulo { get; set; }

        public override string ToString()
        {
            return Nombre;
        }
    }

}