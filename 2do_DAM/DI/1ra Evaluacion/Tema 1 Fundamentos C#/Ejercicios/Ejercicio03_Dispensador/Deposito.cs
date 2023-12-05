using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejemplo03_Dispensador
{
    internal class Deposito
    {
        public event EventHandler Cantidad_Changed;
        public event EventHandler DepositoVacio;

        public Deposito() //constructor
        {
            Cantidad = 10;
        }

        private int cantidad; 


        public int Cantidad 
        {
            get
            {
                return cantidad;
            }
            set 
            {
                cantidad = value;
                Cantidad_Changed?.Invoke(this, new EventArgs());
                if (cantidad == 0)
                    DepositoVacio?.Invoke(this, new EventArgs());
            }
        }

        public void Llenar(int valor)
        {
            Cantidad = valor;
        }
    }
}
