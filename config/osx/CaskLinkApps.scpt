FasdUAS 1.101.10   ��   ��    k             l     ����  r       	  4     �� 

�� 
psxf 
 m       �    / A p p l i c a t i o n s 	 o      ���� 0 sysappspath sysAppsPath��  ��        l     ��������  ��  ��        l    ����  r        I   �� ��
�� .sysoexecTEXT���     TEXT  m       �   � f i n d   / u s r / l o c a l / C a s k r o o m   - i n a m e   \ * . a p p   |   g r e p   - v   C o n t e n t s   |   a w k   ' {   p r i n t   s u b s t r ( $ 0 , 1 ) } '��    o      ���� 0 lsapps lsApps��  ��        l    ����  r        n        2   ��
�� 
cpar  o    ���� 0 lsapps lsApps  o      ���� 0 
lsappslist 
lsAppsList��  ��        l     ��������  ��  ��       !   l     �� " #��   " h b FileExists from http://stackoverflow.com/questions/3469389/applescript-testing-for-file-existence    # � $ $ �   F i l e E x i s t s   f r o m   h t t p : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 3 4 6 9 3 8 9 / a p p l e s c r i p t - t e s t i n g - f o r - f i l e - e x i s t e n c e !  % & % i      ' ( ' I      �� )���� 0 
fileexists 
FileExists )  *�� * o      ���� 0 thefile theFile��  ��   ( O      + , + Z     - .�� / - I   �� 0��
�� .coredoexbool       obj  0 4    �� 1
�� 
file 1 o    ���� 0 thefile theFile��   . L     2 2 m    ��
�� boovtrue��   / L     3 3 m    ��
�� boovfals , m      4 4�                                                                                  sevs  alis    v  OSX                        �|�/H+     ISystem Events.app                                               0|��        ����  	                CoreServices    �|�      ���       I   C   B  4OSX:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    O S X  -System/Library/CoreServices/System Events.app   / ��   &  5 6 5 l     ��������  ��  ��   6  7�� 7 l   � 8���� 8 X    � 9�� : 9 k   % � ; ;  < = < l  % %�� > ?��   > F @ getting filename from http://www.alecjacobson.com/weblog/?p=229    ? � @ @ �   g e t t i n g   f i l e n a m e   f r o m   h t t p : / / w w w . a l e c j a c o b s o n . c o m / w e b l o g / ? p = 2 2 9 =  A B A r   % * C D C m   % & E E � F F  / D n      G H G 1   ' )��
�� 
txdl H 1   & '��
�� 
ascr B  I J I r   + 7 K L K c   + 3 M N M l  + 1 O���� O n   + 1 P Q P 4   . 1�� R
�� 
citm R m   / 0������ Q l  + . S���� S c   + . T U T o   + ,���� 0 anapp anApp U m   , -��
�� 
TEXT��  ��  ��  ��   N m   1 2��
�� 
TEXT L o      ���� 0 	this_name   J  V W V Z   8 n X Y���� X E   8 ? Z [ Z o   8 ;���� 0 	this_name   [ m   ; > \ \ � ] ]  . Y k   B j ^ ^  _ ` _ r   B I a b a m   B E c c � d d  . b n      e f e 1   F H��
�� 
txdl f 1   E F��
�� 
ascr `  g h g r   J T i j i l  J P k���� k n   J P l m l 4  M P�� n
�� 
citm n m   N O������ m o   J M���� 0 	this_name  ��  ��   j o      ���� 0 this_extension   h  o�� o r   U j p q p c   U f r s r l  U d t���� t n   U d u v u 7 X d�� w x
�� 
citm w m   \ ^����  x m   _ c������ v o   U X���� 0 	this_name  ��  ��   s m   d e��
�� 
TEXT q o      ���� 0 	this_name  ��  ��  ��   W  y z y r   o z { | { b   o v } ~ } m   o r   � � �  / A p p l i c a t i o n s / ~ o   r u���� 0 	this_name   | o      ���� 0 	this_name   z  � � � l  { {��������  ��  ��   �  ��� � Z   { � � ����� � H   { � � � l  { � ����� � I   { ��� ����� 0 
fileexists 
FileExists �  ��� � o   | ���� 0 	this_name  ��  ��  ��  ��   � O  � � � � � I  � ��� � �
�� .corecrel****      � null � m   � ���
�� 
alia � �� � �
�� 
to   � 4   � ��� �
�� 
psxf � o   � ����� 0 anapp anApp � �� ���
�� 
insh � o   � ����� 0 sysappspath sysAppsPath��   � m   � � � ��                                                                                  MACS  alis    Z  OSX                        �|�/H+     I
Finder.app                                                      �N��        ����  	                CoreServices    �|�      �͒       I   C   B  -OSX:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    O S X  &System/Library/CoreServices/Finder.app  / ��  ��  ��  ��  �� 0 anapp anApp : o    ���� 0 
lsappslist 
lsAppsList��  ��  ��       
�� � � � � � � � �����   � ������������������ 0 
fileexists 
FileExists
�� .aevtoappnull  �   � ****�� 0 sysappspath sysAppsPath�� 0 lsapps lsApps�� 0 
lsappslist 
lsAppsList�� 0 	this_name  �� 0 this_extension  ��   � �� (���� � ����� 0 
fileexists 
FileExists�� �� ���  �  ���� 0 thefile theFile��   � ���� 0 thefile theFile �  4����
�� 
file
�� .coredoexbool       obj �� � *�/j  eY fU � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �   � �   � �   � �  7����  ��  ��   � ���� 0 anapp anApp � �� �� ������������~ E�}�|�{�z�y \ c�x�w �v ��u�t�s�r�q
�� 
psxf�� 0 sysappspath sysAppsPath
�� .sysoexecTEXT���     TEXT�� 0 lsapps lsApps
�� 
cpar�� 0 
lsappslist 
lsAppsList
�� 
kocl
� 
cobj
�~ .corecnte****       ****
�} 
ascr
�| 
txdl
�{ 
TEXT
�z 
citm�y 0 	this_name  �x 0 this_extension  �w���v 0 
fileexists 
FileExists
�u 
alia
�t 
to  
�s 
insh�r 
�q .corecrel****      � null�� �)��/E�O�j E�O��-E�O ��[��l 
kh  ���,FO��&�i/�&E` O_ a  -a ��,FO_ �i/E` O_ [�\[Zk\Za 2�&E` Y hOa _ %E` O*_ k+   a  a a *�/a �a  UY h[OY�y � !furlfile://localhost/Applications � � � �Z / u s r / l o c a l / C a s k r o o m / b a r t e n d e r / l a t e s t / B a r t e n d e r . a p p  / u s r / l o c a l / C a s k r o o m / c o c o n u t b a t t e r y / 2 . 8 / c o c o n u t B a t t e r y . a p p  / u s r / l o c a l / C a s k r o o m / c y b e r d u c k / 4 . 2 . 1 / C y b e r d u c k . a p p  / u s r / l o c a l / C a s k r o o m / d a i s y d i s k / 2 . 1 . 2 / D a i s y D i s k . a p p  / u s r / l o c a l / C a s k r o o m / d o x y g e n / 1 . 8 . 3 . 1 / D o x y g e n . a p p  / u s r / l o c a l / C a s k r o o m / d r o p b o x / 2 . 0 / D r o p b o x . a p p  / u s r / l o c a l / C a s k r o o m / e l e c t r u m / 1 . 7 . 2 / E l e c t r u m . a p p  / u s r / l o c a l / C a s k r o o m / g o o g l e - c h r o m e / s t a b l e - c h a n n e l / G o o g l e   C h r o m e . a p p  / u s r / l o c a l / C a s k r o o m / o p e n - o f f i c e / 3 . 4 . 1 / O p e n O f f i c e . o r g . a p p  / u s r / l o c a l / C a s k r o o m / p a r a v i e w / 3 . 9 8 . 0 - O S X - 1 0 . 8 - 6 4 b i t / p a r a v i e w . a p p  / u s r / l o c a l / C a s k r o o m / q t c r e a t o r / 2 . 7 . 0 / Q t   C r e a t o r . a p p  / u s r / l o c a l / C a s k r o o m / s k y p e / 6 . 1 . 0 . 2 2 9 5 / S k y p e . a p p  / u s r / l o c a l / C a s k r o o m / s o u r c e t r e e / 1 . 5 . 7 . 1 / S o u r c e T r e e . a p p  / u s r / l o c a l / C a s k r o o m / s p o t i f y / s t a b l e / S p o t i f y . a p p  / u s r / l o c a l / C a s k r o o m / t e x m a k e r / 4 . 0 . 1 / T e x m a k e r M a c o s x L i o n / t e x m a k e r . a p p  / u s r / l o c a l / C a s k r o o m / t h e - u n a r c h i v e r / 3 . 4 / T h e   U n a r c h i v e r . a p p  / u s r / l o c a l / C a s k r o o m / t r a n s m i s s i o n / 2 . 7 7 / T r a n s m i s s i o n . a p p  / u s r / l o c a l / C a s k r o o m / v l c / 2 . 0 . 5 / G o o d i e s / D e l e t e   V L C   P r e f e r e n c e s . a p p  / u s r / l o c a l / C a s k r o o m / v l c / 2 . 0 . 5 / V L C . a p p  / u s r / l o c a l / C a s k r o o m / v n c v i e w e r / 5 . 0 . 5 / V N C   V i e w e r . a p p � �p ��p  �    � � � � � � � � � � � � � � � � � � � ��o�n�m�l�k�j�i�h�g�f�e�d � � � � d / u s r / l o c a l / C a s k r o o m / b a r t e n d e r / l a t e s t / B a r t e n d e r . a p p � � � � r / u s r / l o c a l / C a s k r o o m / c o c o n u t b a t t e r y / 2 . 8 / c o c o n u t B a t t e r y . a p p � � � � b / u s r / l o c a l / C a s k r o o m / c y b e r d u c k / 4 . 2 . 1 / C y b e r d u c k . a p p � � � � b / u s r / l o c a l / C a s k r o o m / d a i s y d i s k / 2 . 1 . 2 / D a i s y D i s k . a p p � � � � ^ / u s r / l o c a l / C a s k r o o m / d o x y g e n / 1 . 8 . 3 . 1 / D o x y g e n . a p p � � � � V / u s r / l o c a l / C a s k r o o m / d r o p b o x / 2 . 0 / D r o p b o x . a p p � � � � ^ / u s r / l o c a l / C a s k r o o m / e l e c t r u m / 1 . 7 . 2 / E l e c t r u m . a p p � � � � � / u s r / l o c a l / C a s k r o o m / g o o g l e - c h r o m e / s t a b l e - c h a n n e l / G o o g l e   C h r o m e . a p p � � � � p / u s r / l o c a l / C a s k r o o m / o p e n - o f f i c e / 3 . 4 . 1 / O p e n O f f i c e . o r g . a p p � � � � ~ / u s r / l o c a l / C a s k r o o m / p a r a v i e w / 3 . 9 8 . 0 - O S X - 1 0 . 8 - 6 4 b i t / p a r a v i e w . a p p � � � � d / u s r / l o c a l / C a s k r o o m / q t c r e a t o r / 2 . 7 . 0 / Q t   C r e a t o r . a p p � � � � \ / u s r / l o c a l / C a s k r o o m / s k y p e / 6 . 1 . 0 . 2 2 9 5 / S k y p e . a p p � � � � j / u s r / l o c a l / C a s k r o o m / s o u r c e t r e e / 1 . 5 . 7 . 1 / S o u r c e T r e e . a p p � � � � \ / u s r / l o c a l / C a s k r o o m / s p o t i f y / s t a b l e / S p o t i f y . a p p � � � � � / u s r / l o c a l / C a s k r o o m / t e x m a k e r / 4 . 0 . 1 / T e x m a k e r M a c o s x L i o n / t e x m a k e r . a p p � � � � r / u s r / l o c a l / C a s k r o o m / t h e - u n a r c h i v e r / 3 . 4 / T h e   U n a r c h i v e r . a p p � � � � l / u s r / l o c a l / C a s k r o o m / t r a n s m i s s i o n / 2 . 7 7 / T r a n s m i s s i o n . a p p � � � � � / u s r / l o c a l / C a s k r o o m / v l c / 2 . 0 . 5 / G o o d i e s / D e l e t e   V L C   P r e f e r e n c e s . a p p � � � � J / u s r / l o c a l / C a s k r o o m / v l c / 2 . 0 . 5 / V L C . a p p � � � � d / u s r / l o c a l / C a s k r o o m / v n c v i e w e r / 5 . 0 . 5 / V N C   V i e w e r . a p p�o  �n  �m  �l  �k  �j  �i  �h  �g  �f  �e  �d   � � � � 0 / A p p l i c a t i o n s / V N C   V i e w e r � � � �  a p p��  ascr  ��ޭ