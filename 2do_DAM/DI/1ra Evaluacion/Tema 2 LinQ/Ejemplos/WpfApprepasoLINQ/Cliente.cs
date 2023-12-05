﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApprepasoLINQ
{
    public class Cliente
    {
        public int IdCliente { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Localidad { get; set; }
        public double TotalCompras { get; set; }
        public override string ToString()
        {
            return $"{this.Nombre}, ({this.Localidad}) = {this.TotalCompras:C2}";
        }
    }
}
