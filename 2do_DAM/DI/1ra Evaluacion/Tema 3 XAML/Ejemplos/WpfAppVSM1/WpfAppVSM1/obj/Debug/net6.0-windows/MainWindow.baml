   M S B A M L   `   `   `  ����E  AWpfAppVSM1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:WpfAppVSM1
WpfAppVSM1  5   	       WpfAppVSM1.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:WpfAppVSM1     5   	     � Title$  
WpfAppVSM1��5   	   $	��450��6   $	��800��6)    � 	Resources 5	       �� 
TargetType �� Property �� Value �� 
TargetType �Name J� RenderTransformOrigin'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup	   States   System.Windows.VisualState
   
Storyboard �� TargetProperty �� 
TargetName8  2System.Windows.Media.Animation.EasingColorKeyFrame �� KeyTime �� Value9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value   EasingFunction-  'System.Windows.Media.Animation.BackEase7  1System.Windows.Media.Animation.EasingFunctionBase   
EasingMode �� RadiusY �� RadiusX ��Name��%�  '��       �� 5
   
   " ��6   .�5      ��  � ��$ 20q�6'   �� 5       � ��
 �����6+   �� 5       � ��$ 64(�6)   �� 5       � �� 5      �� 5      " ��6&   .R�5      � $
 grid��6   $ 0.5,0.5&�6-   z�5      V� 5   "   .~�5   &   �� �� 5   &   �� 5   &   T� 5   &   5   #    5        5   "   CommonStates��.	 5   &     
Normal��62     5   &   	MouseOver��.
 5   *   �� .��5    .   �� $* $(Shape.Fill).(SolidColorBrush.Color)�5!   1   $ 	rectangle��5"   1   .g�5#   2     $ 0:0:0.5��6F   $ 	#FFE0E02A��6X   5$   /   5%   +   5&   '     5'   &   Pressed��.
 5(   *   �� .��5)   .   U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)�6L   $
 grid��6�   .\�5*   2     $ 0:0:0.5��6G   $	 1.3Q�6Y    5+   6     5,   :   $ EaseOut=�6C   5.   3   5/   /   U� 50   .   $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleY)�6L   $
 grid��6�   .\�51   2     $ 0:0:0.5��6G   $	 1.3Q�6Y    52   6     53   :   $ EaseOut=�6C   55   3   56   /   �� 57   .   $* $(Shape.Fill).(SolidColorBrush.Color)�6K   $ 	rectangle��6�   .g�58   2     $ 0��6F   $ 	#FFC6CF18��6R   59   /   5:   +   5;   '     5<   &   Disabled��62   5=   #   .+�5?      �� 
�������$ 20��65   $ 20��6B   $	��130��6P   $	��130��6\   
���   �$��7��6x   �� 5@      $ 	rectangle��6(   $	��100��6;   $	��100��6G   $ 20��6T   $ 20��6a   
���   �6n   �� 5A      $��Center=�6/   $��Center=�6J   5B      5C      5E      5F      5G      .��5H      �� $��Center=�6   $��Center=�6,    �� Orientation$ 
Horizontal=�6I   .+�5I   
   �� $��1��6   �� 5J   
   $��2��6   �� 5K   
   $��3��6   5L      5M      