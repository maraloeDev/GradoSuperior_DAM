   M S B A M L   `   `   `  ����K  GWpfApprepasoLINQ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:WpfApprepasoLINQWpfApprepasoLINQ  5   	   !    WpfApprepasoLINQ.MainWindow   5   	   W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:WpfApprepasoLINQ     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)   .��5	      �  � RowDefinitions 5
   
   �� 5      $��7* �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $
��1.5* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ lbResultados��5      
�������$��Courier new)�6?   �� 5   
   $��0��6   $��2��6'   
���  ��61   �� 5   
   -   5         ��Name$ tbResultado��5      
���P��
�������$��1��6O   �� 5   
   -   5        $��lvResultados��5      $y�Visible=�6'   
������$��2��6T   $��Lucida Console)�6d    �� View 5      �� 5      .P�5      �� $��Fecha��6%    �� Width$	 120��64    �� DisplayMemberBinding 5   %   �� *Fecha+ �� StringFormat$ {0:d}���� 5      $��Importe��6%   $	 100��66    5   %   �� *	Importe+$ {0,10:C}��	 �� ConverterCulture$	 es-ES��5      
 �� 
GroupStyle
 5      (  "System.Windows.Controls.GroupStyle  5          HeaderTemplate 5!      �� 5"      .R�5#      �� $
��Bold"�6(   $��16(�6:   
��� d ���5$   (   �� *Name+5%      5'      5)      �� 5+   
    �� Orientation$ Vertical=�6   $��10q�6,   $��1��68   .+�5,      �� -   5        $/��)Mejores puntuaciones (where >80, OrderBy)��5,      6I   �� 5-      -   5        $$��Mejores puntuaciones (método)��5-      6=   �� 5.      -   5        $��lista de Clientes��5.      61   �� 5/      -   5        $:��4Nombre y TotalCompras (proyección en tipo anónimo)��5/      6R   �� 50      -   5        $3��-Nombre y TotalCompras (obteniendo una cadena)��50      6M   �� 51      -	   5        $/��)suma de TotalCompras (consulta = método)��51      6H   �� 52      -
   5        $$��Agrupar clientes por localidad��52      6>   �� 53      -   5        $'��!Ordenar clientes por totalCompras��53      6A   �� 54      -   5        $1��+Totalizar compras por localidad (ordenadas)��54      6K   �� 55      -   5        $��detalle de pedidos��55      62   �� 56      -   5        $/��)totalizar importes de pedidos por cliente��56      6I   57      58      59      