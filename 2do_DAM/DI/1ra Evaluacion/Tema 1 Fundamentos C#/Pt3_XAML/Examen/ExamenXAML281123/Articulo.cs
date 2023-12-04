using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamenXAML281123
{
    public class Articulo
    {
        public string Referencia { get; set; }
        public string Descripcion { get; set; }
        public double Precio { get; set; }
        public string Imagen { get; set; }
    }

    public class Articulos : ObservableCollection<Articulo>
    {
        public Articulos() : base()
        {
            this.Add(new Articulo { Referencia = "1234563654", Descripcion = "SSD Hyperx Kingston", Precio = 82, Imagen = "Imagenes/ssd.jpg" });
            this.Add(new Articulo { Referencia = "4569874454", Descripcion = "intel i7", Precio = 260, Imagen = "Imagenes/intel i7.png" });
            this.Add(new Articulo { Referencia = "2654292988", Descripcion = "SDRAM DDR4 Corsair", Precio = 150, Imagen = "Imagenes/sdram ddr4.jpg" });
            this.Add(new Articulo { Referencia = "9587878578", Descripcion = "Samsumg 970 EVO", Precio = 270, Imagen = "Imagenes/Samsung-970-EVO.jpg" });
        }
    }
}
