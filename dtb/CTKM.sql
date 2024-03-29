CREATE TABLE CTKM (
  MaKM CHAR(7) REFERENCES KhuyenMai(MaKM),
  MaSP CHAR(7 ) REFERENCES SanPham(MaSP),
  MucKM DECIMAL(3,2) NOT NULL CHECK (MucKM BETWEEN 0 AND 1),
  ThoiGianBatDau DATE NOT NULL,
  ThoiGianKetThuc DATE NOT NULL,
  CONSTRAINT Chk_ThoiGian CHECK (ThoiGianKetThuc > ThoiGianBatDau)
);
select * from CTKM

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP01', 0.2, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP02', 0.2, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP04', 0.2, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP05', 0.15, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP06', 0.15, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP07', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP08', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP09', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP10', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM01', 'SP11', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));


INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP01', 0.2,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP02', 0.2,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP03', 0.2,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP12', 0.1,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP06', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP07', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP08', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP09', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM02', 'SP10', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));


INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP01', 0.2, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP02', 0.2, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP04', 0.2, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP05', 0.15, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP06', 0.15, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP07', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP08', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP09', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP10', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM03', 'SP11', 0.1, TO_DATE('2023/11/27', 'YYYY/MM/DD'), TO_DATE('2023/11/30', 'YYYY/MM/DD'));


INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP01', 0.2,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP02', 0.2,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP03', 0.2,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP12', 0.1,  TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP06', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP07', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP08', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP09', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));

INSERT INTO CTKM (MaKM, MaSP, MucKM, ThoiGianBatDau, ThoiGianKetThuc)
VALUES ('KM04', 'SP10', 0.1, TO_DATE('2023/12/01', 'YYYY/MM/DD'), TO_DATE('2023/12/27', 'YYYY/MM/DD'));