USE AnitSayacDB;

CREATE TABLE Kadinlar (
    KadinID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad NVARCHAR(100) NOT NULL,
    Yas INT,
    CocukMu BIT,
    KorumaTalebiVarMi BIT
);


CREATE TABLE Failler (
    FailID INT PRIMARY KEY IDENTITY(1,1),
    Iliski NVARCHAR(100),
    HukukiDurum NVARCHAR(100)
);


CREATE TABLE Kaynaklar (
    KaynakID INT PRIMARY KEY IDENTITY(1,1),
    MedyaLinki NVARCHAR(255),
    MedyaAdi NVARCHAR(100)
);


CREATE TABLE Olaylar (
    OlayID INT PRIMARY KEY IDENTITY(1,1),
    KadinID INT FOREIGN KEY REFERENCES Kadinlar(KadinID),
    OlumTarihi DATE,
    Sehir NVARCHAR(100),
    Yontem NVARCHAR(100),
    FailID INT FOREIGN KEY REFERENCES Failler(FailID),
    KaynakID INT FOREIGN KEY REFERENCES Kaynaklar(KaynakID)
);





SELECT YEAR(OlumTarihi) AS Yil, COUNT(*) AS OlaySayisi
FROM Olaylar
GROUP BY YEAR(OlumTarihi);

SELECT Sehir, COUNT(*) AS OlaySayisi
FROM Olaylar
GROUP BY Sehir;

SELECT COUNT(*) AS KorumaTalebiOlanKadinSayisi
FROM Kadinlar
WHERE KorumaTalebiVarMi = 1;




DELETE FROM Olaylar;
DELETE FROM Kaynaklar;
DELETE FROM Failler;
DELETE FROM Kadinlar;



DBCC CHECKIDENT ('Kadinlar', RESEED, 0);
DBCC CHECKIDENT ('Failler', RESEED, 0);
DBCC CHECKIDENT ('Kaynaklar', RESEED, 0);
DBCC CHECKIDENT ('Olaylar', RESEED, 0);








INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('E�i', 'Tutukland�');


INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.ornekhaber.com/haber1', '�rnek Haber');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi)
VALUES ('Ay�e Y�lmaz', 35, 0, 1);

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (1, '2025-05-15', '�stanbul', 'B��aklanarak', 1, 1);







INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Eski kocas�', '�ntihar');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.hurriyet.com.tr/gundem/hayir-dedigi-icin-oldurulmus-42817848', 'H�rriyet');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi)
VALUES ('Eseng�l Kaya', 48, 1, 1);

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (2, '2025-05-28', 'Adana', 'Ate�li silah', 2, 2);



SELECT * FROM Kadinlar;



INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Kocas�', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://gazetepatika23.com/konyada-bir-kadin-evli-oldugu-erkek-tarafindan-katledildi-166876.html', 'gazete patika');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Nuran �zer', 35, 1, 0, 'Kad�n', 'Konya');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-26',
    'Konya',
    'Kesici Alet',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);




INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Ev sahibi Tan�d��� Birisi', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.milliyet.com.tr/gundem/balikesirde-korkunc-olay-kiracisini-baltayla-oldurup-cesedi-esiyle-komurluge-saklamis-7378763', 'milliyet');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('G�lseren Kurtman', 59, 0, 0, 'Kad�n', 'Bal�kesir');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-26',
    'Bal�kesir',
    'Darp',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Sevgilisi', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.ntv.com.tr/amp/turkiye/balikesirde-kadin-cinayeti-genc-kadini-olduruldu-balkondan-atlayip-kacti,stZcoQImSkCNtzvfzsKwsg', 'ntv');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Dilruba Elif �etin', 23, 0, 0, 'Kad�n', 'Bal�kesir');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-23',
    'Bal�kesir',
    'Kesici Alet',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);






INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Eski Kocas�', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.ntv.com.tr/amp/turkiye/hastanede-kadin-cinayeti-eski-esinekursun-yagdirdi,DuuApHZ56Eugb-N-BpEjcA', 'ntv');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Eser Karaca', 42, 0, 1, 'Kad�n', 'Kahramanmara�');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-21',
    'Kahramanmara�',
    'Ate�li Silah',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tespit Edilemeyen', 'Soru�turma S�r�yor');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.haberturk.com/19-yasindaki-genc-kizin-supheli-olumu-erkek-arkadasinin-evinde-olu-bulundu-guncel-haberler-3792934', 'habert�rk');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Deniz Karakaya', 19, 0, 0, 'Kad�n', '�stanbul');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-21',
    '�stanbul',
    'Tespit Edilemeyen',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Sevgilisi', '�ntihar');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.hurriyet.com.tr/gundem/sevgilisi-sevvali-katletti-42807774', 'h�rriyet');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('�evval �ift�i', NULL, 0, 0, 'Kad�n', 'Adana');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-20',
    'Adana',
    'Kesici Alet',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Kay�nbiraderi', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.milliyet.com.tr/gundem/kardesine-ve-yengesine-kursun-yagdirmisti-o-agabey-tutuklandi-7374254', 'milliyet');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Safiye Demir', 34, 1, 0, 'Kad�n', 'Tokat');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-19',
    'Tokat',
    'Ate�li Silah',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Kocas�', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.sozcu.com.tr/esinin-vurdugu-zeynep-in-tabutunu-kadinlar-tasidi-p174899', 's�zc�');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Zeynep Zan', 25, 1, 0, 'Kad�n', '�anakkale');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-17',
    '�anakkale',
    'Ate�li Silah',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tespit Edilemeyen', 'Tespit Edilemeyen');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.haberturk.com/nevsehir-de-balkondan-dusen-kadin-hayatini-kaybetti-guncel-haberler-3791076-amp', 'habert�rk');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('�pek �nc�l', 35, 0, 0, 'Kad�n', 'Nev�ehir');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-14',
    'Nev�ehir',
    'Y�ksekten D��me',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);



INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tespit Edilemeyen', 'Tespit Edilemeyen');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.evrensel.net/haber/553659/vanda-supheli-kadin-olumu-evinde-olu-bulundu', 'evrensel');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Dilber Artu�', 50, 0, 0, 'Kad�n', 'Van');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-14',
    'Van',
    'Tespit Edilemeyen',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);










INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tan�d��� Birisi', '�ntihar');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.hurriyet.com.tr/gundem/kirklarelinde-dehset-evini-ve-aracini-yakti-bir-kadini-oldurup-intihar-etti-42799780', 'h�rriyet');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Aysel S.', 53, 1, 0, 'Kad�n', 'K�rklareli');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-13',
    'K�rklareli',
    'Ate�li Silah',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);






INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('O�lu', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.evrensel.net/haber/553550/osmaniyede-nura-zemzem-adli-kadin-oglu-tarafindan-olduruldu', 'evrensel');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Nura Zemzem', 40, 1, 0, 'Kad�n', 'Osmaniye');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-13',
    'Osmaniye',
    'Bo�ularak',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tespit Edilemeyen', 'Soru�turma S�r�yor');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.iha.com.tr/ordu-haberleri/orduda-1-cocuk-annesi-genc-kadin-olu-bulundu-236157376', 'iha');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Arzu A.', 20, 1, 0, 'Kad�n', 'Ordu');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-11',
    'Ordu',
    'As�larak',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tespit Edilemeyen', 'Soru�turma S�r�yor');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.haberler.com/3-sayfa/zonguldak-ta-genc-kadin-evinde-olu-bulundu-18608842-haberi/?ref=amp_more#news', 'haberler');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('M�nire K.', 27, 0, 0, 'Kad�n', 'Zonguldak');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-09',
    'Zonguldak',
    'As�larak',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);










INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tan�d��� Birisi', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.evrensel.net/haber/553096/giresunda-lisede-kadin-cinayeti-temizlik-gorevlisi-kadin-ve-kardesi-olduruldu', 'evrensel');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Rana �avu�', 20, 0, 0, 'Kad�n', 'Giresun');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-09',
    'Giresun',
    'Ate�li Silah',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);





INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Tan�d��� Birisi', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.evrensel.net/haber/553096/giresunda-lisede-kadin-cinayeti-temizlik-gorevlisi-kadin-ve-kardesi-olduruldu', 'evrensel');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Gonca �avu�', 20, 0, 0, 'Kad�n', 'Giresun');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-09',
    'Giresun',
    'Ate�li Silah',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);







INSERT INTO Failler (Iliski, HukukiDurum)
VALUES ('Kocas�', 'Tutuklu');

INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi)
VALUES ('https://www.medyagazete.com/haber/osmaniyede-kadin-cinayeti-genc-anne-esi-tarafindan-katledildi-1160587', 'medyagazete');

INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Cinsiyet, Sehir)
VALUES ('Fatma Y�lmaz', 20, 1, 0, 'Kad�n', 'Osmaniye');

INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID)
VALUES (
    (SELECT MAX(KadinID) FROM Kadinlar),
    '2025-05-09',
    'Osmaniye',
    'Kesici Alet',
    (SELECT MAX(FailID) FROM Failler),
    (SELECT MAX(KaynakID) FROM Kaynaklar)
);
