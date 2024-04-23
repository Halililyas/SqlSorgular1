
/*

SELECT => Bu komutla veri tabanýndaki istenilen tablo ekrana getirilir.

Insert into => Veri tabanýnda tablolara veri eklemek için kullanýlýr.

Delete => Veri silmek için kullanýlýr

Update => Veri Güncelleme Ýþlemi için kullanýlýr.

*/
use SinifDB --- Burada yukarýda Master yazan yerde hangi tablo da çalýþacýðýmýzý belirtmek için kullanýlýr USE Ýfadesi için 
 

select * from Bolumler where BolumAdi='yazýlým' --- selecet * from diyerek belirticiðemiz tablolarýn hepsini getir demiþ olduk ilk önce sonradan tablo 
-- ismini vererek bir koþul kullanýyoruz koþulumuzun ismi WHERE = koþul verdik ten sonra Tek týrnak kullanarak Bolum adýna eþit olan yazýlýmlarý getir deömiþ olduk 



--Sanal isimlendirme As burda takma ad takýcaðýmýzý gösterir

select PersonelAdi as 'Personel Ýsmi'  from Personeller -- Burda as takýsýný kullanarak yazýlmýþ hali 

select PersonelAdi 'Personel Ýsmi'  from Personeller --- AS Takýsý kullanýlmadan yazýlmýþ hali var 

select PersonelAdi PersonelÝsmi from Personeller --- Burda hem AS takýsý hemde   '' týrnak kullanýlmadan takma isim koymasýdýr ama birliþik
-- yazýlmasý zorunludur eger yazýlmazssa hata alýrýz

select PersonelAdi [Personel Ýsmi] from Personeller --- Yukarýdaki örnek te gördüðünüz gibi bitiþik yazýlmýþtý burda [] köþeli parantezleri 
-- kullanarak ayrý bir þekilde yazabiliriz böylece hata da almayýz 


/*
karþýlaþtýrma operatörleri 

> => büyüktür.

< => küçüktür 

>= -> büyük veya eþittir.

<= -> küçük veya eþittir

<> -> eþit deðildir

!= -> eþit deðildir.

= -> eþittir.

between -> arasýnda


is null -> null olanlar

is not null -> null olmayanlar

in -> içinde varsa getir

or -> veya

and -> ve

burda gödüðünüz koþullar genellikle karþýlaþtýrma veya arama için kullanýlýr mantýk C# veya PHP yada Pythonda ki yazýlým kurallarýyla aynýdýr 



*/

--   WHERE --


--Soru 1:Personel adi Ahmet olan kiþiyi getirin
Select * from Personeller where PersonelAdi='Ahmet' 
select * from Personeller where PersonelAdi = 'Fahri'
-- Çözüm burda Select * from diyerek Personeller tablosundaki bütün sütünlarý getir demiþ olduk 
-- where koþul ifade eder koþulumuz personeladý sütünundaki ahmeti sadece getir demiþ olduk 

--Soru 2:Personel Maaþý 1000 tl  olan kiþiyi getirin
select * from Personeller where Maas='1000'
select *from Personeller where Maas ='2000'

--Soru 3:Personel adresi Ýstanbul olan kiþiyi getirin
select * from Personeller where Adres='Ýstanbul'


--Soru 4:Personel Maaþý 4000 ve üzerinde olanlarý  getirin
select * from Personeller where Maas>='4000'

--Soru 5:Personel Maaþý 1000 lira olmayanlarý  getirin

select * from Personeller where Maas !='1000' 
-- Burda Maaþý 1000 olmayanlarý Getir Demiþ olduk Ünlem Dikkat!!!!


--Soru 6:Personel Maaþý 2000 den fazla 3000 den az olanlar

Select * from Personeller where Maas>2000 and Maas<3000
select * from Personeller where Maas>200 and Maas<3000
select * from Personeller where Maas   between 2000 and 3000  -- Where dedikten sonra eþittir ifadesi yok 
-- Burda maas 2000 den az olanlarý ve maasýý 3000 den küçükleri getir demiþ olduk yaný maaþý 2000 den büyük 3000 kücük olanlar getirilsin
Select * from Personeller where Maas between 2001 and 2999
-- burda maas dedikten sonra between arasýnda demek yani 2001 ve 2999 arasýnda olan sayýlarý yani maaslarý getir demiþ olduk 

--Soru 7:Personel Maaþý 2000 ve 2000 den fazla 3000 ve 3000 az olanlar

Select * from Personeller where Maas>=2000 and Maas<=3000

--Soru 8:Personl adresi istanbul veya þiþli olanlar 
select * from Personeller Where Adres='Ýstanbul' or Adres='Þiþli'
-- burda Personeller tablosundan adrresi istanbul yada þiþli olaný getir demiþ olduk burda iki koþulldan bir tanesi true ise tablo getrilir
-- bunu saðlayan or baðlacýdýr or demek veya yada anlamýna gelir 

--Soru 9:Personel adres kaydý olmayanlar 

select * from Personeller Where Adres is null

select * from Personeller Where Adres is null
-- Burda Personeler Tablosunda adres sütünu boþ olanlarý getir demiþ olduk is null bu iþe yarar içi boþ yani null olanlarý getirir

--Soru 10:Personel adres kaydý olanlar

select * from Personeller Where Adres is not null
--- Burda ise Personeller tablosunda adress sütünun içi dolu olaný getir demiþ olduk burda dikkat edilecek konu is not null yani içi boþ olmayan 
-- sütünlarý getir demiþ olduk 

--Soru 11:1990 ile 2000 arasýnda doðan personeller

select * from Personeller where  year(DogumTarihi) between 1990 and 2000





select * from Personeller Where YEAR(DogumTarihi) between 1990 and 2000
--- Burda Personeller toblosunda where koþul belirticeðimiz belli ediyoruz 
-- burda YEAR dememizin amacý Doðum Tarihi sütünu date veri Tipine sahip olduðundan dolayý yazýlmýþtýr Eksik bilgi 
-- Burda YEAR Dememizin amacý Doðum tarihi Sütünunki Bilginin date veri Tipinde olup Sadece Yýlý almasý Ýçin dir 
-- between diyerek 1990 ve 2000 arasýnda olanlarý getir demiþ olduk 

