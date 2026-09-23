INSERT INTO tur (ad) VALUES ('Biyografi');

INSERT INTO yazar (ad, soyad) VALUES ('Nurettin', 'Belek');

UPDATE ogrenci SET sinif = '10C' WHERE sinif = '10B';

UPDATE kitap SET puan = puan + 5;

DELETE FROM yazar WHERE ad = 'Mehmet';

INSERT INTO tur (ad) VALUES ('Kişisel Gelişim');

UPDATE kitap SET turno = (SELECT turno FROM tur WHERE ad = 'Kişisel Gelişim') WHERE ad = 'Benim Üniversitelerim';

CREATE OR REPLACE FUNCTION ogrencilistesi()
RETURNS SETOF ogrenci
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM ogrenci;
END;
$$;

CREATE OR REPLACE PROCEDURE ekle(ad character varying, puan integer, yazarno bigint, turno bigint)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO kitap (ad, puan, yazarno, turno) VALUES (ad, puan, yazarno, turno);
END;
$$;

CREATE OR REPLACE PROCEDURE sil(p_ogrno bigint)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM ogrenci WHERE ogrno = p_ogrno;
END;
$$;
