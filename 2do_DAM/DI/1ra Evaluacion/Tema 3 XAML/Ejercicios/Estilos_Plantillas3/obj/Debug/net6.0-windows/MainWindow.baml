   M S B A M L   `   `   `  ����N  JEstilos_Plantillas3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:Estilos_Plantillas3Estilos_Plantillas3  5   	   $    Estilos_Plantillas3.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:Estilos_Plantillas3     5   	     � Title$  
MainWindow��5   	   $	��600��6   $	��900��6)    � 	Resources 5
         botonesMolones2 �� 
TargetType �� Property �� Value �� Triggers P� Property P� Value  etiquetaMolona3  -System.Windows.Media.Effects.DropShadowEffect   
BlurRadius	   ShadowDepth
   Color   Opacity  tbMolon  btnMolon��%�  &	        &	 C    &	 �    &	 �    �� 5   
   " ��6(   .�5      ��  � ��$	 100��6&   64   �� 5       � ��$ 30��6'   64    5      P� 5       �@J�IsMouseOver$
 True��61   . �5      ��  � ��$
 Bold"�63   6B   �� 5       � ��$ 20(�61   6>   �� 5       � ��$ Italic$�62   6C   5      5      �� 5   
   " ��6'   .�5      ��  � ��$ Italic$�6*   6;   �� 5       � ��$ 50��6&   63   �� 5       � ��$	 100��6'   65   �� 5       �@J�Effect 5        5      $ 22Q�6'   $	 2Q�67   $
 Black��6G   $ 2Q�6U   6c   5        5!      P� 5"       �@J�IsMouseOver$
 True��61   . �5#      ��  � ��
 ��  �6B   5$      5'      �� 5(   
   " ��6    .�5)      ��  � ��$	 300��6&   64   �� 5*       � ��$ 50��6'   64    5+      P� 5,       �@J�IsMouseOver$
 True��61   . �5-      ��  � �� �#FAFAD26E   5.      50      �� 52   
   " ��6!   .�54      ��  � ��$	 300��6&   64   �� 55       � ��$ 20��6'   64   �� 56       � ��
 �����6;    58      P� 59       � ��
 �  ��6>   5<      5>      .��5@      � .+�5B   
   �� #��[  6   $��botón 1��6:   $��350,74,350,330q�6M   $
��Bold"�6e   6y   �� 5C   
   #��[  6   $��botón 2��6:   $��350,104,350,300q�6M   $
��Bold"�6f   6z   �� 5D   
   #��[  6   $��botón 3��6:   $��350,134,350,270q�6M   6h   �� 5F   
   #��[ 6   $	��Top=�6<   $��Center=�6T   $��etiqueta��6q   $��25��6�   $��	0,242,0,0q�6�   6�   �� 5G   
   #��[ 6   $	��Top=�6<   $��Center=�6T   $��otra etiqueta��6q   $��25��6�   $��	0,272,0,0q�6�   $��71��6�   6�   �� 5I   
   #��[  6   $��botón 4��6:   $��400,302,400,202q�6M   $
��Bold"�6f   6z   �� 5K   
   #��[ 6   $��Esto es un TextBlock��65   $��20,357,759,150q�6Q   6k   �� 5M   
   #��[ 6   $��otro botón��63   $��Center=�6H   $	��Top=�6e   $��	0,426,0,0q�6}   6�   5O      5P      