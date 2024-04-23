
/*

SELECT => Bu komutla veri taban�ndaki istenilen tablo ekrana getirilir.

Insert into => Veri taban�nda tablolara veri eklemek i�in kullan�l�r.

Delete => Veri silmek i�in kullan�l�r

Update => Veri G�ncelleme ��lemi i�in kullan�l�r.

*/
use SinifDB --- Burada yukar�da Master yazan yerde hangi tablo da �al��ac���m�z� belirtmek i�in kullan�l�r USE �fadesi i�in 
 

select * from Bolumler where BolumAdi='yaz�l�m' --- selecet * from diyerek belirtici�emiz tablolar�n hepsini getir demi� olduk ilk �nce sonradan tablo 
-- ismini vererek bir ko�ul kullan�yoruz ko�ulumuzun ismi WHERE = ko�ul verdik ten sonra Tek t�rnak kullanarak Bolum ad�na e�it olan yaz�l�mlar� getir de�mi� olduk 



--Sanal isimlendirme As burda takma ad tak�ca��m�z� g�sterir

select PersonelAdi as 'Personel �smi'  from Personeller -- Burda as tak�s�n� kullanarak yaz�lm�� hali 

select PersonelAdi 'Personel �smi'  from Personeller --- AS Tak�s� kullan�lmadan yaz�lm�� hali var 

select PersonelAdi Personel�smi from Personeller --- Burda hem AS tak�s� hemde   '' t�rnak kullan�lmadan takma isim koymas�d�r ama birli�ik
-- yaz�lmas� zorunludur eger yaz�lmazssa hata al�r�z

select PersonelAdi [Personel �smi] from Personeller --- Yukar�daki �rnek te g�rd���n�z gibi biti�ik yaz�lm��t� burda [] k��eli parantezleri 
-- kullanarak ayr� bir �ekilde yazabiliriz b�ylece hata da almay�z 


/*
kar��la�t�rma operat�rleri 

> => b�y�kt�r.

< => k���kt�r 

>= -> b�y�k veya e�ittir.

<= -> k���k veya e�ittir

<> -> e�it de�ildir

!= -> e�it de�ildir.

= -> e�ittir.

between -> aras�nda


is null -> null olanlar

is not null -> null olmayanlar

in -> i�inde varsa getir

or -> veya

and -> ve

burda g�d���n�z ko�ullar genellikle kar��la�t�rma veya arama i�in kullan�l�r mant�k C# veya PHP yada Pythonda ki yaz�l�m kurallar�yla ayn�d�r 



*/

--   WHERE --


--Soru 1:Personel adi Ahmet olan ki�iyi getirin
Select * from Personeller where PersonelAdi='Ahmet' 
select * from Personeller where PersonelAdi = 'Fahri'
-- ��z�m burda Select * from diyerek Personeller tablosundaki b�t�n s�t�nlar� getir demi� olduk 
-- where ko�ul ifade eder ko�ulumuz personelad� s�t�nundaki ahmeti sadece getir demi� olduk 

--Soru 2:Personel Maa�� 1000 tl  olan ki�iyi getirin
select * from Personeller where Maas='1000'
select *from Personeller where Maas ='2000'

--Soru 3:Personel adresi �stanbul olan ki�iyi getirin
select * from Personeller where Adres='�stanbul'


--Soru 4:Personel Maa�� 4000 ve �zerinde olanlar�  getirin
select * from Personeller where Maas>='4000'

--Soru 5:Personel Maa�� 1000 lira olmayanlar�  getirin

select * from Personeller where Maas !='1000' 
-- Burda Maa�� 1000 olmayanlar� Getir Demi� olduk �nlem Dikkat!!!!


--Soru 6:Personel Maa�� 2000 den fazla 3000 den az olanlar

Select * from Personeller where Maas>2000 and Maas<3000
select * from Personeller where Maas>200 and Maas<3000
select * from Personeller where Maas   between 2000 and 3000  -- Where dedikten sonra e�ittir ifadesi yok 
-- Burda maas 2000 den az olanlar� ve maas�� 3000 den k���kleri getir demi� olduk yan� maa�� 2000 den b�y�k 3000 k�c�k olanlar getirilsin
Select * from Personeller where Maas between 2001 and 2999
-- burda maas dedikten sonra between aras�nda demek yani 2001 ve 2999 aras�nda olan say�lar� yani maaslar� getir demi� olduk 

--Soru 7:Personel Maa�� 2000 ve 2000 den fazla 3000 ve 3000 az olanlar

Select * from Personeller where Maas>=2000 and Maas<=3000

--Soru 8:Personl adresi istanbul veya �i�li olanlar 
select * from Personeller Where Adres='�stanbul' or Adres='�i�li'
-- burda Personeller tablosundan adrresi istanbul yada �i�li olan� getir demi� olduk burda iki ko�ulldan bir tanesi true ise tablo getrilir
-- bunu sa�layan or ba�lac�d�r or demek veya yada anlam�na gelir 

--Soru 9:Personel adres kayd� olmayanlar 

select * from Personeller Where Adres is null

select * from Personeller Where Adres is null
-- Burda Personeler Tablosunda adres s�t�nu bo� olanlar� getir demi� olduk is null bu i�e yarar i�i bo� yani null olanlar� getirir

--Soru 10:Personel adres kayd� olanlar

select * from Personeller Where Adres is not null
--- Burda ise Personeller tablosunda adress s�t�nun i�i dolu olan� getir demi� olduk burda dikkat edilecek konu is not null yani i�i bo� olmayan 
-- s�t�nlar� getir demi� olduk 

--Soru 11:1990 ile 2000 aras�nda do�an personeller

select * from Personeller where  year(DogumTarihi) between 1990 and 2000





select * from Personeller Where YEAR(DogumTarihi) between 1990 and 2000
--- Burda Personeller toblosunda where ko�ul belirtice�imiz belli ediyoruz 
-- burda YEAR dememizin amac� Do�um Tarihi s�t�nu date veri Tipine sahip oldu�undan dolay� yaz�lm��t�r Eksik bilgi 
-- Burda YEAR Dememizin amac� Do�um tarihi S�t�nunki Bilginin date veri Tipinde olup Sadece Y�l� almas� ��in dir 
-- between diyerek 1990 ve 2000 aras�nda olanlar� getir demi� olduk 

