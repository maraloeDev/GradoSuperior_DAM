using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MArtinSonsecaEduardoExamenXAML
{
    public class Autores : ObservableCollection<Autor>
    {
        public Autores() : base()
        {
            this.Items.Add(new Autor { Nombre = "Gabriel García Márquez", ISBN = "1324", Titulo = "Cien años de soledad" });
            this.Items.Add(new Autor { Nombre = "Douglas Adams", ISBN = "1235", Titulo = "Life, the Universe and Everything" });
            this.Items.Add(new Autor { Nombre = "Miguel Delibes Setién", ISBN = "1263", Titulo = "La hoja roja" });
            this.Items.Add(new Autor { Nombre = "José Luis Sampedro", ISBN = "1237", Titulo = "La sonrisa etrusca" });
        }

    }
}
