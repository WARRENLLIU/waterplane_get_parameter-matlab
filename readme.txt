 #every data that in .txt files must be in the following form
 #data in .txt file is in form of "matrix",which means only include numbers
---------------------------------------------------------------------------------------------------------
data in yi.txt: 
     row            1                   2               3                4                     5                          
             yi(half width)      Rect_multiplier  Spon1_multiplier   moment arm(xi)      spon2_multiplier
           6
     spon1_multiplier

 data in area.txt:
     row            1              2               3              4              5        
            waterplane area  Rect_multiplier      zi             Xf        spon2_multiplier
        6
 spon1_multiplier
---------------------------------------------------------------------------------------------------------
 #all Rectangular multiplier should be: 1 2 2 ... 2 2 1  form
 #all Simpson 1 multiplier should be:1 4 2 4 2..... 2 4 1  form
 #all Simpson 2 multiplier should be:1 3 3 2 3..... 3 3 1  form
 #所有等分类的数据均去单位化, 即涉及yi第四行，area第三行的数据均取1为间距
 #All data of equal classification are de unitized, that is, 
     the data in the fourth row from yi and data in the third row from area take 1 as the spacing