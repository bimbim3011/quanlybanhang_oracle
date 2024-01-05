CREATE TABLE KhachHang (
  MaKH CHAR(10) PRIMARY KEY,
  TenKH NVARCHAR2(50) NOT NULL,
  NgaySinh DATE,
  SDT CHAR(10),
  Email VARCHAR2(255)
);
select * from KhachHang

CREATE TABLE CuaHang (
  MaCH CHAR(5) PRIMARY KEY,
  TenCH NVARCHAR2(100) NOT NULL,
  SDT CHAR(10) NOT NULL,
  DiaChi NVARCHAR2(100) NOT NULL,
  Email VARCHAR2(255) NOT NULL
);
select * from CuaHang

CREATE TABLE NhanVien (
  MaNV CHAR(5) PRIMARY KEY,
  TenNV NVARCHAR2(50) NOT NULL,
  NgaySinh DATE,
  GioiTinh NUMBER(1),
  DiaChi NVARCHAR2(100),
  SDT CHAR(10),
  Email VARCHAR2(255),
  Luong NUMBER CHECK (Luong > 0),
  MaCH CHAR(5) REFERENCES CuaHang(MaCH)
);
select * from NhanVien

CREATE TABLE QuanLy (
  MaNV CHAR(5) REFERENCES NhanVien(MaNV),
  MaCH CHAR(5) REFERENCES CuaHang(MaCH),
  NgayBoNhiem DATE NOT NULL,
  NgayKetThuc DATE,
  CONSTRAINT Chk_NgayKetThuc CHECK (NgayKetThuc IS NULL OR NgayKetThuc > NgayBoNhiem)
);
select * from QuanLy

CREATE TABLE HoadonBH (
  MaHD CHAR(10) PRIMARY KEY,
  NgayBan DATE NOT NULL,
  HinhThucTT NVARCHAR2(50) NOT NULL,
  TongTien NUMBER NOT NULL,
  MaKH CHAR(10) REFERENCES KhachHang(MaKH),
  MaNV CHAR(5) REFERENCES NhanVien(MaNV)
);
select * from HoadonBH

CREATE TABLE KhuyenMai (
  MaKM CHAR(7) PRIMARY KEY,
  TenKM NVARCHAR2(100) NOT NULL,
  MaCH CHAR(5) REFERENCES CuaHang(MaCH)
);
select * from KhuyenMai

CREATE TABLE NhaCungCap (
  MaNCC CHAR(5) PRIMARY KEY,
  TenNCC NVARCHAR2(100) NOT NULL,
  SDT CHAR(10) NOT NULL,
  DiaChi NVARCHAR2(100),
  Email VARCHAR2(255) NOT NULL
);
select * from NhaCungCap

CREATE TABLE HoaDonNhap (
  MaHoaDonNhap CHAR(10) PRIMARY KEY,
  NgayNhap DATE NOT NULL,
  NguoiNhap NVARCHAR2(50) NOT NULL,
  TongTien FLOAT NOT NULL CHECK (TongTien > 0),
  MaNCC CHAR(5) REFERENCES NhaCungCap(MaNCC),
  MaCH CHAR(5) REFERENCES CuaHang(MaCH)
);
select * from HoaDonNhap

CREATE TABLE ChatLieu (
  MaChatLieu CHAR(4) PRIMARY KEY,
  TenCL NVARCHAR2(50) NOT NULL,
  DacDiem NVARCHAR2(200)
);
select * from ChatLieu

CREATE TABLE SanPham (
  MaSP CHAR(7) PRIMARY KEY,
  TenSP NVARCHAR2(50) NOT NULL,
  DonViTinh NVARCHAR2(20) NOT NULL,
  GiaBan FLOAT NOT NULL CHECK (GiaBan > 0),
  HangTonKho INT NOT NULL,
  MaChatLieu CHAR(4) REFERENCES ChatLieu(MaChatLieu)
);
select * from SanPham

CREATE TABLE Sizes (
  MaSize CHAR(3) PRIMARY KEY,
  TenSize CHAR(5),
  ChieuCao CHAR(10),
  CanNang CHAR(10)
);
select * from Sizes

CREATE TABLE CTSize (
  MaSize CHAR(3) REFERENCES Sizes(MaSize),
  MaSP CHAR(7) REFERENCES SanPham(MaSP),
  SoLuong INT NOT NULL
);
select * from CTSize

CREATE TABLE MauSac (
  MaMau CHAR(4) PRIMARY KEY,
  TenMau NVARCHAR2(20)
);
select * from MauSac

CREATE TABLE CTmau (
  MaMau CHAR(4) REFERENCES MauSac(MaMau),
  MaSP CHAR(7) REFERENCES SanPham(MaSP),
  SoLuong INT NOT NULL
);
select * from CTmau

CREATE TABLE CTHoaDonNhap (
  MaHoaDonNhap CHAR(10) REFERENCES HoaDonNhap(MaHoaDonNhap),
  MaSP CHAR(7) REFERENCES SanPham(MaSP),
  DonViTinh NVARCHAR2(20) NOT NULL,
  SoLuong INT NOT NULL,
  GiaNhap FLOAT NOT NULL CHECK (GiaNhap > 0)
);
select * from CTHoaDonNhap

CREATE TABLE CTKM (
  MaKM CHAR(7) REFERENCES KhuyenMai(MaKM),
  MaSP CHAR(7 ) REFERENCES SanPham(MaSP),
  MucKM DECIMAL(3,2) NOT NULL CHECK (MucKM BETWEEN 0 AND 1),
  ThoiGianBatDau DATE NOT NULL,
  ThoiGianKetThuc DATE NOT NULL,
  CONSTRAINT Chk_ThoiGian CHECK (ThoiGianKetThuc > ThoiGianBatDau)
);
select * from CTKM

CREATE TABLE CTHDBanHang (
  MaCTHDBH CHAR(10) PRIMARY KEY,
  SoLuong INT CHECK (SoLuong > 0),
  DonGia FLOAT CHECK (DonGia > 0),
  ChietKhau DECIMAL(3,2) CHECK (ChietKhau >= 0 AND ChietKhau <= 1),
  MaHD CHAR(10) REFERENCES HoadonBH(MaHD),
  MaSP CHAR(7 ) REFERENCES SanPham(MaSP)
);
select * from CTHDBanHang


INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH01', 'Tr?n Th? Kim', TO_DATE('2003/06/23', 'YYYY/MM/DD'), '0986738572', 'kimanh23062003@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH02', 'Phan Th? Ph??ng', TO_DATE('2003/02/20', 'YYYY/MM/DD'), '0817862215', 'phanphuonganh03yn@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH03', 'Tr?n Mai', TO_DATE('2003/07/17', 'YYYY/MM/DD'), '0917888210', 'tranmaianh1707@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH04', 'V? Vân', TO_DATE('2003/09/12', 'YYYY/MM/DD'), '0858120903', 'vananhvu129@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH05', 'Ph?m Th? Thu', TO_DATE('2003/03/09', 'YYYY/MM/DD'), '0832445021', 'phamjthuchanthij@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH06', 'Nguy?n Minh', TO_DATE('2002/02/02', 'YYYY/MM/DD'), '0567019912', 'ducsauhp02@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH07', 'Phùng Ng?c ??c', TO_DATE('2003/01/31', 'YYYY/MM/DD'), '0828681170', 'ngocducp2003@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH08', 'Nguy?n Ti?n', TO_DATE('2003/05/25', 'YYYY/MM/DD'), '0814965868', 'dungxleo@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH09', 'Nguy?n Thùy', TO_DATE('2003/11/17', 'YYYY/MM/DD'), '0929553093', 'ntduong171@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH10', 'Ph?m Th? H?ng', TO_DATE('2003/01/01', 'YYYY/MM/DD'), '0357194887', 'phamthihongduyen0101@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH11', 'Nguy?n Th? Thùy', TO_DATE('2003/01/02', 'YYYY/MM/DD'), '0966322170', 'nttghhbg@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH12', 'Tr?n Th? H??ng', TO_DATE('2003/11/16', 'YYYY/MM/DD'), '0927814187', 'tthg0203@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH13', '?? Th? H?ng', TO_DATE('2003/03/14', 'YYYY/MM/DD'), '0352427523', 'dohong123abcxyz@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH14', '?? Th? Kim', TO_DATE('2003/12/20', 'YYYY/MM/DD'), '0984930223', 'kimhuee2012@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH15', 'Nguy?n Phi', TO_DATE('2003/08/05', 'YYYY/MM/DD'), '0943017998', 'hungmanhphucht@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH16', 'Tr??ng Thu', TO_DATE('2003/07/07', 'YYYY/MM/DD'), '0823327556', 'trgthuhg@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH17', '?oàn ??c', TO_DATE('2003/04/05', 'YYYY/MM/DD'), '0393189119', 'doanhuy1103@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH18', 'Nguy?n Thu', TO_DATE('2003/02/06', 'YYYY/MM/DD'), '0946806203', 'huyennguyen9468@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH19', 'V? Khánh', TO_DATE('2003/10/25', 'YYYY/MM/DD'), '0333946427', 'huyenkhanh986@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH20', '??ng Xuân', TO_DATE('2003/05/25', 'YYYY/MM/DD'), '0584294009', 'dangxuankhang2003@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH21', 'Lê Phú An', TO_DATE('2003/10/17', 'YYYY/MM/DD'), '0367352003', 'phuleankhang@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH22', '?? Ng?c', TO_DATE('2003/10/18', 'YYYY/MM/DD'), '0985916834', 'dongockhanh2k3@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH23', 'Ph?m Hoàng', TO_DATE('2003/05/04', 'YYYY/MM/DD'), '0844898012', 'nothingpb123@gmail.com');

INSERT INTO KhachHang (MaKH, TenKH, NgaySinh, SDT, Email) VALUES
('KH24', 'Hà Th? Th?o', TO_DATE('2003/04/25', 'YYYY/MM/DD'), '0966544458', 'htthaolinh@gmail.com');

INSERT INTO CuaHang (MaCH, TenCH, SDT, DiaChi, Email) VALUES
('CH01', 'C?a hàng qu?n áo Emas ??ng V?n Ng?', '0399998121', 'S? 12 ??ng V?n Ng?, ??ng ?a, Hà N?i', 'emasclothes@gmail.com');

INSERT INTO CuaHang (MaCH, TenCH, SDT, DiaChi, Email) VALUES
('CH02', 'C?a hàng qu?n áo Emas C?u Gi?y', '0362396869', '241 Xuân Th?y, C?u Gi?y, Hà N?i', 'emasclothes@gmail.com');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV01', 'Di?u Anh', TO_DATE('2002/10/09', 'YYYY/MM/DD'), 1, 'Thái Hà, ??ng ?a', '0965812429', 'dieuanh02@gmail.com', 6000000, 'CH01');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV02', 'Gia B?o', TO_DATE('2003/06/03', 'YYYY/MM/DD'), 0, 'Xuân Th?y, C?u Gi?y', '0374040404', 'giabao03@gmail.com', 4500000, 'CH02');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV03', 'Trung D?ng', TO_DATE('2005/10/14', 'YYYY/MM/DD'), 0, 'Quan Hoa, C?u Gi?y', '0386532466', 'trungdunkk05@gmail.com', 4000000, 'CH02');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV04', 'H?i ??ng', TO_DATE('2004/09/09', 'YYYY/MM/DD'), 0, 'Chùa B?c, ??ng ?a', '0348256543', 'haidangcute@gmail.com', 3500000, 'CH01');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV05', 'Anh Th?', TO_DATE('2005/01/26', 'YYYY/MM/DD'),1, 'Xã ?àn, ??ng ?a', '0946643757', 'anhthu67@gmail.com', 4000000, 'CH01');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV06', 'B?o Vy', TO_DATE('2001/12/31', 'YYYY/MM/DD'),1, 'Yên Hòa, C?u Gi?y', '0352726502', 'baovyvy@gmail.com', 6000000, 'CH02');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV07', 'Ki?u Trang', TO_DATE('2004/12/04', 'YYYY/MM/DD'),1, 'Ng?c Khánh, Ba ?ình', '0344638858', 'kieutranggtr@gmail.com', 4000000, 'CH01');

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT, Email, Luong, MaCH)
VALUES ('NV08', 'Minh V?', TO_DATE('2003/10/12', 'YYYY/MM/DD'), 0, 'Yên Hòa, C?u Gi?y', '0336782666', 'mingvuzu@gmail.com', 5300000, 'CH02');

INSERT INTO QuanLy (MaNV, MaCH, NgayBoNhiem, NgayKetThuc) VALUES
('NV01', 'CH01', TO_DATE('2022/01/03', 'YYYY/MM/DD'), NULL);

INSERT INTO QuanLy (MaNV, MaCH, NgayBoNhiem, NgayKetThuc) VALUES
('NV06', 'CH02', TO_DATE('2023/01/05', 'YYYY/MM/DD'), NULL);

INSERT INTO QuanLy (MaNV, MaCH, NgayBoNhiem, NgayKetThuc) VALUES
('NV08', 'CH02', TO_DATE('2022/01/03', 'YYYY/MM/DD'), TO_DATE('2023/01/05', 'YYYY/MM/DD'));

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD01', TO_DATE('2023/06/18', 'YYYY/MM/DD'), 'Ti?n m?t', 400000, 'KH01', 'NV01');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD02', TO_DATE('2023/06/19', 'YYYY/MM/DD'), 'Ti?n m?t', 800000, 'KH02', 'NV02');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD03', TO_DATE('2023/06/19', 'YYYY/MM/DD'), 'Ti?n m?t', 600000, 'KH03', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD04', TO_DATE('2023/06/21', 'YYYY/MM/DD'), 'Chuy?n kho?n', 200000, 'KH04', 'NV04');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD05', TO_DATE('2023/06/22', 'YYYY/MM/DD'), 'Ti?n m?t', 370000, 'KH05', 'NV05');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD06', TO_DATE('2023/06/25', 'YYYY/MM/DD'), 'Chuy?n kho?n', 370000, 'KH06', 'NV06');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD07', TO_DATE('2023/07/01', 'YYYY/MM/DD'), 'Chuy?n kho?n', 450000, 'KH07', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD08', TO_DATE('2023/07/03', 'YYYY/MM/DD'), 'Ti?n m?t', 370000, 'KH08', 'NV04');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD09', TO_DATE('2023/07/06', 'YYYY/MM/DD'), 'Chuy?n kho?n', 600000, 'KH09', 'NV05');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD10', TO_DATE('2023/07/09', 'YYYY/MM/DD'), 'Chuy?n kho?n', 400000, 'KH10', 'NV06');
  
  INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD11', TO_DATE('2023/07/14', 'YYYY/MM/DD'), 'Ti?n m?t', 800000, 'KH11', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD12', TO_DATE('2023/07/19', 'YYYY/MM/DD'), 'Chuy?n kho?n', 650000, 'KH12', 'NV04');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD13', TO_DATE('2023/07/22', 'YYYY/MM/DD'), 'Chuy?n kho?n', 450000, 'KH13', 'NV01');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD14', TO_DATE('2023/07/26', 'YYYY/MM/DD'), 'Ti?n m?t', 740000, 'KH14', 'NV02');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD15', TO_DATE('2023/08/02', 'YYYY/MM/DD'), 'Chuy?n kho?n', 200000, 'KH15', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD16', TO_DATE('2023/08/06', 'YYYY/MM/DD'), 'Chuy?n kho?n', 400000, 'KH16', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD17', TO_DATE('2023/08/08', 'YYYY/MM/DD'), 'Ti?n m?t', 450000, 'KH17', 'NV08');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD18', TO_DATE('2023/08/13', 'YYYY/MM/DD'), 'Chuy?n kho?n', 1300000, 'KH18', 'NV05');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD19', TO_DATE('2023/08/16', 'YYYY/MM/DD'), 'Chuy?n kho?n', 600000, 'KH19', 'NV06');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD20', TO_DATE('2023/08/19', 'YYYY/MM/DD'), 'Ti?n m?t', 370000, 'KH20', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD21', TO_DATE('2023/08/25', 'YYYY/MM/DD'), 'Chuy?n kho?n', 400000, 'KH21', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD22', TO_DATE('2023/09/06', 'YYYY/MM/DD'), 'Chuy?n kho?n', 900000, 'KH22', 'NV08');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD23', TO_DATE('2023/09/13', 'YYYY/MM/DD'), 'Ti?n m?t', 800000, 'KH23', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD24', TO_DATE('2023/09/17', 'YYYY/MM/DD'), 'Chuy?n kho?n', 800000, 'KH24', 'NV08');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD25', TO_DATE('2023/09/23', 'YYYY/MM/DD'), 'Chuy?n kho?n', 900000, 'KH14', 'NV05');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD26', TO_DATE('2023/09/28', 'YYYY/MM/DD'), 'Ti?n m?t', 650000, 'KH15', 'NV06');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD27', TO_DATE('2023/09/22', 'YYYY/MM/DD'), 'Chuy?n kho?n', 600000, 'KH16', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD28', TO_DATE('2023/10/03', 'YYYY/MM/DD'), 'Chuy?n kho?n', 740000, 'KH17', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD29', TO_DATE('2023/10/07', 'YYYY/MM/DD'), 'Chuy?n kho?n', 600000, 'KH18', 'NV08');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD30', TO_DATE('2023/10/12', 'YYYY/MM/DD'), 'Ti?n m?t', 450000, 'KH19', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD31', TO_DATE('2023/10/18', 'YYYY/MM/DD'), 'Chuy?n kho?n', 5560000, 'KH20', 'NV08');
  
  INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD32', TO_DATE('2023/10/24', 'YYYY/MM/DD'), 'Chuy?n kho?n', 370000, 'KH21', 'NV01');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD33', TO_DATE('2023/10/30', 'YYYY/MM/DD'), 'Ti?n m?t', 1350000, 'KH01', 'NV02');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD34', TO_DATE('2023/11/04', 'YYYY/MM/DD'), 'Chuy?n kho?n', 900000, 'KH02', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD35', TO_DATE('2023/11/09', 'YYYY/MM/DD'), 'Chuy?n kho?n', 1200000, 'KH03', 'NV08');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD36', TO_DATE('2023/11/14', 'YYYY/MM/DD'), 'Chuy?n kho?n', 300000, 'KH04', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD37', TO_DATE('2023/11/23', 'YYYY/MM/DD'), 'Chuy?n kho?n', 560000, 'KH05', 'NV08');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD38', TO_DATE('2023/11/27', 'YYYY/MM/DD'), 'Ti?n m?t', 592000, 'KH06', 'NV01');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD39', TO_DATE('2023/11/27', 'YYYY/MM/DD'), 'Chuy?n kho?n', 1360000, 'KH07', 'NV02');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD40', TO_DATE('2023/11/28', 'YYYY/MM/DD'), 'Chuy?n kho?n', 476000, 'KH24', 'NV03');
  
INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD41', TO_DATE('2023/11/29', 'YYYY/MM/DD'), 'Ti?n m?t', 405000, 'KH14', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD42', TO_DATE('2023/11/29', 'YYYY/MM/DD'), 'Chuy?n kho?n', 560000, 'KH15', 'NV04');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD43', TO_DATE('2023/11/30', 'YYYY/MM/DD'), 'Chuy?n kho?n', 540000, 'KH16', 'NV05');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD44', TO_DATE('2023/11/30', 'YYYY/MM/DD'), 'Chuy?n kho?n', 1620000, 'KH17', 'NV06');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD45', TO_DATE('2023/12/01', 'YYYY/MM/DD'), 'Chuy?n kho?n', 900000, 'KH18', 'NV03');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD46', TO_DATE('2023/12/02', 'YYYY/MM/DD'), 'Ti?n m?t', 585000, 'KH19', 'NV04');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD47', TO_DATE('2023/12/03', 'YYYY/MM/DD'), 'Chuy?n kho?n', 540000, 'KH20', 'NV01');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD48', TO_DATE('2023/12/06', 'YYYY/MM/DD'), 'Chuy?n kho?n', 448000, 'KH21', 'NV02');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD49', TO_DATE('2023/12/08', 'YYYY/MM/DD'), 'Ti?n m?t', 896000, 'KH01', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD50', TO_DATE('2023/12/08', 'YYYY/MM/DD'), 'Chuy?n kho?n', 740000, 'KH02', 'NV07');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD51', TO_DATE('2023/12/09', 'YYYY/MM/DD'), 'Chuy?n kho?n', 1600000, 'KH19', 'NV01');

INSERT INTO HoadonBH (MaHD, NgayBan, HinhThucTT, TongTien, MaKH, MaNV)
VALUES
  ('HD52', TO_DATE('2023/12/09', 'YYYY/MM/DD'), 'Chuy?n kho?n', 504000, 'KH20', 'NV01');

INSERT INTO KhuyenMai (MaKM, TenKM, MaCH) VALUES ('KM01', 'Black Friday', 'CH01');
INSERT INTO KhuyenMai (MaKM, TenKM, MaCH) VALUES ('KM02', 'Khuy?n mãi nhân d?p Giáng Sinh', 'CH01');
INSERT INTO KhuyenMai (MaKM, TenKM, MaCH) VALUES ('KM03', 'Black Friday', 'CH02');
INSERT INTO KhuyenMai (MaKM, TenKM, MaCH) VALUES ('KM04', 'Khuy?n mãi nhân d?p Giáng Sinh', 'CH02');

INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, DiaChi, Email)
VALUES ('CC01', 'T?ng Kho Hoàng Ng?c', '0986738572', 'B?c Ninh', 'ctymayhngngoc@gmail.com');

INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, DiaChi, Email)
VALUES ('CC02', 'Công Ty May Phú Th?nh', '0817862215', 'Phú Th?', 'ctymayphu@gmail.com');

INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, DiaChi, Email)
VALUES ('CC03', 'X??ng May Anan', '0917888210', 'H?i Phòng', 'xuongmayanan7@gmail.com');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN01', TO_DATE('2023/05/02', 'YYYY/MM/DD'), 'Minh V?', 90000000, 'CC01', 'CH02');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN02', TO_DATE('2023/04/21', 'YYYY/MM/DD'), 'Minh V?', 135000000, 'CC02', 'CH02');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN03', TO_DATE('2023/06/01', 'YYYY/MM/DD'), 'B?o Vy', 60000000, 'CC03', 'CH01');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN04', TO_DATE('2023/08/02', 'YYYY/MM/DD'), 'Di?u Anh', 80000000, 'CC01', 'CH01');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN05', TO_DATE('2023/09/13', 'YYYY/MM/DD'), 'B?o Vy', 90000000, 'CC02', 'CH02');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN06', TO_DATE('2023/10/20', 'YYYY/MM/DD'), 'Di?u Anh', 56000000, 'CC03', 'CH01');

INSERT INTO HoaDonNhap (MaHoaDonNhap, NgayNhap, NguoiNhap, TongTien, MaNCC, MaCH)
VALUES ('HDN07', TO_DATE('2023/11/15', 'YYYY/MM/DD'), 'Di?u Anh', 78000000, 'CC03', 'CH01');

INSERT INTO ChatLieu (MaChatLieu, TenCL, DacDiem) VALUES
('CL01', 'Cotton', 'M?m m?n, co giãn t?t, d? th?m hút m? hôi, d? khô, có th? làm gi?m nhi?t và làm mát c? th?, mang l?i c?m giác d? ch?u cho ng??i m?c.');

INSERT INTO ChatLieu (MaChatLieu, TenCL, DacDiem) VALUES
('CL02', 'Kaki', 'Có ?? b?n màu cao, không nh?n, d? làm s?ch.');

INSERT INTO ChatLieu (MaChatLieu, TenCL, DacDiem) VALUES
('CL03', 'N?', 'M?m m?i, gi? nhi?t t?t, nh? và nhanh khô.');

INSERT INTO ChatLieu (MaChatLieu, TenCL, DacDiem) VALUES
('CL04', 'Denim', '?? b?n cao, ch?t li?u v?i c?ng cáp, co dãn t?t, h?n ch? n?p nh?n, không b? bai nhão sau khi gi?t.');

INSERT INTO ChatLieu (MaChatLieu, TenCL, DacDiem) VALUES
('CL05', 'Nylon', '?? b?n cao, ?? co giãn t?t. Tính ch?ng n??c cao, kháng ?m hi?u qu?. B? m?t v?i sáng bóng, m?m m?n.');

INSERT INTO ChatLieu (MaChatLieu, TenCL, DacDiem) VALUES
('CL06', 'Len', '?? b?n cao, co dãn, ?àn h?i ?em l?i s? d? ch?u cho ng??i m?c.');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP01', 'Áo Thun C? Tròn Ng?n Tay', 'Chi?c', 200000, 50, 'CL01');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP02', 'Áo Thun Tay L?', 'Chi?c', 200000, 60, 'CL01');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP03', 'Áo Thun K? S?c Dài Tay', 'Chi?c', 280000, 67, 'CL01');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP04', 'Qu?n Jean Siêu Co Giãn', 'Chi?c', 370000, 54, 'CL04');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP05', 'Qu?n Jean Dáng Slim Fit', 'Chi?c', 400000, 15, 'CL04');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP06', 'Qu?n N?', 'Chi?c', 280000, 6, 'CL03');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP07', 'Áo Hoodie n?', 'Chi?c', 450000, 13, 'CL03');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP08', 'Áo Khoác Cardigan Len', 'Chi?c', 400000, 45, 'CL06');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP09', 'Áo len c? tròn', 'Chi?c', 300000, 7, 'CL06');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP10', 'Qu?n Cargo', 'Chi?c', 450000, 37, 'CL02');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP11', 'Qu?n Jogger KaKi', 'Chi?c', 450000, 46, 'CL02');

INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, HangTonKho, MaChatLieu) VALUES
('SP12', 'Áo khoác gió', 'Chi?c', 650000, 5, 'CL05');

INSERT INTO Sizes (MaSize, TenSize, ChieuCao, CanNang) VALUES
('S01', 'XS', '<1,55m', '<49kg');

INSERT INTO Sizes (MaSize, TenSize, ChieuCao, CanNang) VALUES
('S02', 'S', '1,55-1,68m', '49-55kg');

INSERT INTO Sizes (MaSize, TenSize, ChieuCao, CanNang) VALUES
('S03', 'M', '1,69-1,74m', '56-62kg');

INSERT INTO Sizes (MaSize, TenSize, ChieuCao, CanNang) VALUES
('S04', 'L', '1,75-1,8m', '62-67kg');

INSERT INTO Sizes (MaSize, TenSize, ChieuCao, CanNang) VALUES
('S05', 'XL', '>1,8m', '67-75kg');

INSERT INTO Sizes (MaSize, TenSize, ChieuCao, CanNang) VALUES
('S06', '2XL', '>1,8m', '>75kg');

INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP01', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP01', 6);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP01', 13);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP01', 11);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP01', 10);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP01', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP02', 6);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP02', 10);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP02', 12);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP02', 16);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP02', 8);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP02', 8);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP03', 8);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP03', 18);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP03', 10);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP03', 15);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP03', 7);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP03', 9);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP04', 15);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP04', 10);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP04', 13);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP04', 11);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP04', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP05', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP05', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP05', 7);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP05', 6);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP05', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP06', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP06', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP06', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP06', 1);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP06', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP06', 1);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP07', 3);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP07', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP07', 4);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP07', 4);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP07', 1);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP07', 1);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP08', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP08', 9);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP08', 13);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP08', 7);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP08', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP08', 6);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP09', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP09', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP09', 3);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP09', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP09', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP09', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP10', 7);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP10', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP10', 10);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP10', 9);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP10', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP10', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP11', 13);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP11', 7);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP11', 7);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP11', 8);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP11', 5);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP11', 6);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S01', 'SP12', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S02', 'SP12', 1);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S03', 'SP12', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S04', 'SP12', 2);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S05', 'SP12', 0);
INSERT INTO CTsize (MaSize, MaSP, SoLuong) VALUES
('S06', 'SP12', 0);

INSERT INTO MauSac (MaMau, TenMau) VALUES ('M01', '?en');
INSERT INTO MauSac (MaMau, TenMau) VALUES ('M02', 'Tr?ng');
INSERT INTO MauSac (MaMau, TenMau) VALUES ('M03', 'Be');
INSERT INTO MauSac (MaMau, TenMau) VALUES ('M04', 'Xanh Than');
INSERT INTO MauSac (MaMau, TenMau) VALUES ('M05', 'Nâu');
INSERT INTO MauSac (MaMau, TenMau) VALUES ('M06', 'H?ng');

INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP01', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP01', 6);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP01', 13);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP01', 11);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP01', 10);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP01', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP02', 6);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP02', 10);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP02', 12);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP02', 16);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP02', 8);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP02', 8);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP03', 8);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP03', 18);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP03', 10);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP03', 15);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP03', 7);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP03', 9);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP04', 15);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP04', 10);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP04', 13);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP04', 11);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP04', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP05', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP05', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP05', 7);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP05', 6);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP05', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP06', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP06', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP06', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP06', 1);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP06', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP06', 1);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP07', 3);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP07', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP07', 4);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP07', 4);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP07', 1);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP07', 1);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP08', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP08', 9);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP08', 13);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP08', 7);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP08', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP08', 6);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP09', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP09', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP09', 3);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP09', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP09', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP09', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP10', 7);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP10', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP10', 10);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP10', 9);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP10', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP10', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP11', 13);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP11', 7);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP11', 7);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP11', 8);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP11', 5);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP11', 6);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M01', 'SP12', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M02', 'SP12', 1);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M03', 'SP12', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M04', 'SP12', 2);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M05', 'SP12', 0);
INSERT INTO CTmau (MaMau, MaSP, SoLuong) VALUES ('M06', 'SP12', 0);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES ('HDN01', 'SP01', 'Chi?c', 150, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES ('HDN01', 'SP02', 'Chi?c', 150, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN01', 'SP05', 'Chi?c', 150, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN01', 'SP04', 'Chi?c', 150, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN02', 'SP10', 'Chi?c', 150, 250000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN02', 'SP11', 'Chi?c', 150, 250000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN02', 'SP12', 'Chi?c', 150, 300000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN02', 'SP01', 'Chi?c', 150, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN03', 'SP01', 'Chi?c', 100, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN03', 'SP02', 'Chi?c', 100, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN03', 'SP05', 'Chi?c', 100, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN03', 'SP04', 'Chi?c', 100, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN04', 'SP10', 'Chi?c', 100, 250000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN04', 'SP11', 'Chi?c', 100, 250000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN04', 'SP12', 'Chi?c', 100, 300000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN05', 'SP01', 'Chi?c', 150, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN05', 'SP02', 'Chi?c', 150, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN05', 'SP05', 'Chi?c', 150, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN05', 'SP04', 'Chi?c', 150, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN06', 'SP06', 'Chi?c', 80, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN06', 'SP07', 'Chi?c', 80, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN06', 'SP08', 'Chi?c', 80, 180000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN06', 'SP09', 'Chi?c', 80, 120000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN06', 'SP03', 'Chi?c', 80, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN07', 'SP06', 'Chi?c', 80, 100000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN07', 'SP07', 'Chi?c', 80, 200000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN07', 'SP08', 'Chi?c', 80, 180000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN07', 'SP09', 'Chi?c', 80, 120000);

INSERT INTO CTHoaDonNhap (MaHoaDonNhap, MaSP, DonViTinh, SoLuong, GiaNhap)
VALUES   ('HDN07', 'SP12', 'Chi?c', 100, 300000);

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

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB01', 1, 200000, 0, 'HD01', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB01', 1, 200000, 0, 'HD01', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB02', 2, 200000, 0, 'HD02', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB02', 1, 400000, 0, 'HD02', 'SP05');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB03', 3, 200000, 0, 'HD03', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB04', 1, 200000, 0, 'HD04', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB05', 1, 200000, 0, 'HD05', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB05', 1, 370000, 0, 'HD05', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB06', 1, 370000, 0, 'HD06', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB07', 1, 450000, 0, 'HD07', 'SP10');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB08', 1, 370000, 0, 'HD08', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB09', 3, 200000, 0, 'HD09', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB10', 2, 200000, 0, 'HD10', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB11', 2, 400000, 0, 'HD11', 'SP05');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB12', 1, 650000, 0, 'HD12', 'SP12');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB13', 1, 450000, 0, 'HD13', 'SP10');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB14', 2, 370000, 0, 'HD14', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB15', 1, 200000, 0, 'HD15', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB16', 2, 200000, 0, 'HD16', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB17', 1, 450000, 0, 'HD17', 'SP11');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB18', 2, 650000, 0, 'HD18', 'SP12');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB19', 3, 200000, 0, 'HD19', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB20', 1, 370000, 0, 'HD20', 'SP04');


INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB21', 2, 200000, 0, 'HD21', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB22', 2, 450000, 0, 'HD22', 'SP11');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB23', 2, 400000, 0, 'HD23', 'SP05');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB24', 4, 200000, 0, 'HD24', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB25', 2, 450000, 0, 'HD25', 'SP11');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB26', 1, 650000, 0, 'HD26', 'SP12');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB27', 3, 200000, 0, 'HD27', 'SP02');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB28', 2, 370000, 0, 'HD28', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB29', 3, 200000, 0, 'HD29', 'SP01');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB30', 1, 450000, 0, 'HD30', 'SP11');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB31', 2, 280000, 0, 'HD31', 'SP03');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB32', 1, 370000, 0, 'HD32', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB33', 3, 450000, 0, 'HD33', 'SP10');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB34', 2, 450000, 0, 'HD34', 'SP11');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB35', 3, 400000, 0, 'HD35', 'SP08');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB36', 1, 300000, 0, 'HD36', 'SP09');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB37', 2, 280000, 0, 'HD37', 'SP03');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB38', 2, 370000, 0.2, 'HD38', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB39', 4, 400000, 0.15, 'HD39', 'SP05');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB40', 2, 280000, 0.15, 'HD40', 'SP06');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB41', 1, 450000, 0.1, 'HD41', 'SP07');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB42', 2, 280000, 0, 'HD42', 'SP03');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB43', 2, 300000, 0.1, 'HD43', 'SP09');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB44', 4, 450000, 0.1, 'HD44', 'SP10');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB45', 2, 450000, 0, 'HD45', 'SP11');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB46', 1, 650000, 0.1, 'HD46', 'SP12');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB47', 2, 300000, 0.1, 'HD47', 'SP09');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB48', 2, 280000, 0.2, 'HD48', 'SP03');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB49', 4, 280000, 0.2, 'HD49', 'SP03');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB50', 2, 370000, 0, 'HD50', 'SP04');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB51', 4, 400000, 0, 'HD51', 'SP05');

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB52', 2, 280000, 0.1, 'HD52', 'SP06');

1.
SELECT 
  SUM(HD.TongTien) AS DoanhThuQuy3
FROM 
  HoadonBH HD
WHERE 
  EXTRACT(MONTH FROM HD.NgayBan) IN (7, 8, 9)
  AND EXTRACT(YEAR FROM HD.NgayBan) = 2023;
2.
SELECT * FROM HoadonBH WHERE Ngayban = TO_DATE('2023-12-08', 'YYYY-MM-DD');
3.
SELECT CuaHang.MaCH, CuaHang.TenCH, SUM(HoadonBH.TongTien) AS DoanhThuThang11
FROM HoadonBH
JOIN NhanVien ON HoadonBH.MaNV = NhanVien.MaNV
JOIN CuaHang ON NhanVien.MaCH = CuaHang.MaCH
WHERE CuaHang.MaCH = 'CH01' AND EXTRACT(MONTH FROM HoadonBH.NgayBan) = 11
GROUP BY CuaHang.MaCH, CuaHang.TenCH;
4.
SELECT
    TongChiPhi,
    TongDoanhThu,
    TongDoanhThu - TongChiPhi AS LoiNhuanThang9
FROM (
    SELECT
        SUM(CTHDBH.SoLuong * CTHN.GiaNhap) AS TongChiPhi,
        SUM(HBH.TongTien) AS TongDoanhThu
    FROM
        CTHDBanHang CTHDBH
    JOIN
        HoadonBH HBH ON CTHDBH.MaHD = HBH.MaHD
    JOIN
        SanPham SP ON CTHDBH.MaSP = SP.MaSP
    JOIN
        CTHoaDonNhap CTHN ON SP.MaSP = CTHN.MaSP
    WHERE
        EXTRACT(MONTH FROM HBH.NgayBan) = 9
) ThongTinThang9;
5.
SELECT *
FROM HoadonBH
WHERE HinhThucTT = 'Chuy?n kho?n' AND EXTRACT(MONTH FROM NgayBan) = 11;
6.
SELECT KhachHang.MaKH, TenKH, COUNT(MaHD) AS SoLanMuaHang
FROM KhachHang
LEFT JOIN HoadonBH ON KhachHang.MaKH = HoadonBH.MaKH
GROUP BY KhachHang.MaKH, TenKH;
7.
SELECT SanPham.MaSP, TenSP, SUM(CTHDBanHang.SoLuong) AS TongSoLuongBan
FROM SanPham
JOIN CTHDBanHang ON SanPham.MaSP = CTHDBanHang.MaSP
JOIN HoadonBH ON CTHDBanHang.MaHD = HoadonBH.MaHD
WHERE EXTRACT(MONTH FROM HoadonBH.Ngayban) = 9
GROUP BY SanPham.MaSP, TenSP
ORDER BY TongSoLuongBan DESC
FETCH FIRST 3 ROWS ONLY;
8.
SELECT * FROM SanPham WHERE hangtonkho < 10;
9.
SELECT *
FROM KhachHang
WHERE EXTRACT(MONTH FROM NgaySinh) = 1;
10.
SELECT KhachHang.MaKH, TenKH
FROM KhachHang
WHERE KhachHang.MaKH NOT IN (SELECT DISTINCT MAKH FROM HoadonBH 
                                WHERE EXTRACT(MONTH FROM Ngayban)= 11);
                                
11.
SELECT 
  NV.TenNV AS NhanVien,
  COUNT(HD.MaHD) AS SoHoaDonBan
FROM 
  NhanVien NV
JOIN 
  HoadonBH HD ON NV.MaNV = HD.MaNV
WHERE 
  EXTRACT(MONTH FROM HD.NgayBan) = 11
  AND EXTRACT(YEAR FROM HD.NgayBan) = 2023
GROUP BY 
  NV.TenNV
ORDER BY 
  SoHoaDonBan DESC
FETCH FIRST 2 ROW ONLY;
12.
SELECT 
  SanPham.MaSP,
  TenSP,
  Sizes.MaSize,
  SUM(CTSize.SoLuong) AS SoLuongTonKho
FROM SanPham
JOIN CTSize ON SanPham.MaSP = CTSize.MaSP
JOIN Sizes ON CTSize.MaSize = Sizes.MaSize
WHERE Sizes.MaSize = 'S03'
GROUP BY SanPham.MaSP, TenSP, Sizes.MaSize13.
13.
SELECT 
  Sizes.MaSize,
  Sizes.TenSize,
  SUM(CTSize.SoLuong) AS SoLuongTonKho
FROM Sizes
LEFT JOIN CTSize ON Sizes.MaSize = CTSize.MaSize
               AND CTSize.MaSP = 'SP01'
GROUP BY Sizes.MaSize, Sizes.TenSize;
14.
SELECT KhachHang.MaKH, TenKH, SUM(Tongtien) AS TongChiTieu
FROM KhachHang
JOIN HoadonBH ON KhachHang.MaKH = HoadonBH.MAKH
WHERE EXTRACT(MONTH FROM Ngayban) = 12
GROUP BY KhachHang.MaKH, TenKH
ORDER BY TongChiTieu DESC
FETCH FIRST 10 ROWS ONLY;
15.
SELECT 
  EXTRACT(MONTH FROM NgayBan) AS Thang,
  SanPham.MaSP,
  TenSP,
  SUM(TongTien) AS DoanhThu
FROM HoadonBH
JOIN CTHDBanHang ON HoadonBH.MaHD = CTHDBanHang.MaHD
JOIN SanPham ON CTHDBanHang.MaSP = SanPham.MaSP
WHERE EXTRACT(YEAR FROM NgayBan) = EXTRACT(YEAR FROM SYSDATE)
  AND SanPham.MaSP = 'SP04'
GROUP BY EXTRACT(MONTH FROM NgayBan), SanPham.MaSP, TenSP
ORDER BY Thang ASC ;
16.
SELECT 
  S.MaSP,
  S.TenSP,
  KM.TenKM AS KhuyenMai,
  CTKM.MucKM AS ChietKhau
FROM 
  SanPham S
JOIN 
  CTKM ON S.MaSP = CTKM.MaSP
JOIN 
  KhuyenMai KM ON CTKM.MaKM = KM.MaKM
WHERE 
  SYSDATE BETWEEN CTKM.ThoiGianBatDau AND CTKM.ThoiGianKetThuc;
17.
SELECT 
  MS.TenMau AS MauBanChayNhat,
  COUNT(HD.MaHD) AS SoHoaDonBan
FROM 
  MauSac MS JOIN CTmau CTM ON MS.MaMau = CTM.MaMau
JOIN  SanPham SP ON CTM.MaSP = SP.MaSP
JOIN CTHDBanHang CTHD ON SP.MaSP = CTHD.MaSP
JOIN  HoadonBH HD ON CTHD.MaHD = HD.MaHD
WHERE 
  EXTRACT(MONTH FROM HD.NgayBan) = 11
  AND EXTRACT(YEAR FROM HD.NgayBan) = 2023 
GROUP BY 
  MS.TenMau
ORDER BY 
  SoHoaDonBan DESC
FETCH FIRST 1 ROW ONLY;
18.
SELECT 
  SP.MaSP,
  SP.TenSP AS SanPhamBanChayNhat,
  COUNT(HD.MaHD) AS SoHoaDonBan
FROM 
  SanPham SP
JOIN 
  CTHDBanHang CTHD ON SP.MaSP = CTHD.MaSP
JOIN 
  HoadonBH HD ON CTHD.MaHD = HD.MaHD
JOIN 
  CTKM ON SP.MaSP = CTKM.MaSP
JOIN 
  KhuyenMai KM ON CTKM.MaKM = KM.MaKM
WHERE 
  KM.MaKM = 'KM01'
GROUP BY 
  SP.MaSP, SP.TenSP
ORDER BY 
  SoHoaDonBan DESC
FETCH FIRST 1 ROW ONLY;


PL/SQL
set serveroutput on;
1.
DECLARE
  DoanhThuQuy4 NUMBER;
BEGIN
  SELECT SUM(HD.TongTien)
    INTO DoanhThuQuy4
  FROM HoadonBH HD
  WHERE EXTRACT(MONTH FROM HD.NgayBan) IN (10, 11, 12)
    AND EXTRACT(YEAR FROM HD.NgayBan) = 2023;

   DBMS_OUTPUT.PUT_LINE('Doanh thu quý 4 n?m 2023: ' || DoanhThuQuy4);
END;

2.
CREATE OR REPLACE PROCEDURE TongHopSinhNhatTrongThang AS
BEGIN
  DECLARE
    NgaySinh DATE;
    MaKH CHAR(10);
    ThangSinh NUMBER;
    TenKH NVARCHAR2(50);
  BEGIN
    FOR khachhang IN (SELECT * FROM KhachHang) LOOP
      NgaySinh := khachhang.NgaySinh;
      MaKH := khachhang.MaKH;
      TenKH := khachhang.TenKH;
      ThangSinh := EXTRACT(MONTH FROM NgaySinh);
      -- Hi?n th? thông tin n?u có sinh nh?t trong tháng
      IF ThangSinh = EXTRACT(MONTH FROM SYSDATE) THEN
        DBMS_OUTPUT.PUT_LINE('Khách hàng ' || MaKH||'Tên: ' ||TenKH || ' có sinh nh?t trong tháng này.');
      END IF;
    END LOOP;
  END;
END;
/
BEGIN
  TongHopSinhNhatTrongThang;
END;

3.
DECLARE
  MaSP_MM CHAR(7) := 'SP01';
BEGIN
  FOR MauRec IN (SELECT MauSac.TenMau, CTmau.SoLuong
                 FROM MauSac
                 JOIN CTmau ON MauSac.MaMau = CTmau.MaMau
                 WHERE CTmau.MaSP = MaSP_MM) 
  LOOP
    DBMS_OUTPUT.PUT_LINE('Màu: ' || MauRec.TenMau || ', S? l??ng: ' || MauRec.SoLuong);
  END LOOP;
END;
4.
DECLARE
  CURSOR crSoLuongSize (p_MaSP CHAR) IS
    SELECT SZ.MaSize, NVL(CT.SoLuong, 0) AS SoLuong
    FROM Sizes SZ
    LEFT JOIN CTSize CT ON SZ.MaSize = CT.MaSize
    WHERE CT.MaSP = p_MaSP;
BEGIN
  FOR soluongRec IN crSoLuongSize('SP01') LOOP
    DBMS_OUTPUT.PUT_LINE('Size ' || soluongRec.MaSize || ': ' || soluongRec.SoLuong || ' cái');
  END LOOP;
END;

5.
DECLARE
  p_MaKM KhuyenMai.MaKM%TYPE;
  p_TenKM KhuyenMai.TenKM%TYPE;
BEGIN
  FOR khuyenmaiRec IN (SELECT MaKM, TenKM FROM KhuyenMai WHERE MaCH = 'CH01') LOOP
    p_MaKM := khuyenmaiRec.MaKM;
    p_TenKM := khuyenmaiRec.TenKM;
    DBMS_OUTPUT.PUT_LINE('Mã Khuy?n Mãi: ' || p_MaKM || ', Tên Khuy?n Mãi: ' || p_TenKM);
  END LOOP;
END;
6.
CREATE OR REPLACE TRIGGER Trg_CapNhatSoLuongHang
AFTER INSERT OR UPDATE ON CTHDBanHang
FOR EACH ROW
DECLARE
    SoLuongCapNhat INT;
BEGIN
    IF INSERTING THEN
        -- Giao d?ch bán hàng
        SoLuongCapNhat := :NEW.SoLuong;
        UPDATE SanPham
        SET HangTonKho = HangTonKho - SoLuongCapNhat
        WHERE MaSP = :NEW.MaSP;

        DBMS_OUTPUT.PUT_LINE('?ã c?p nh?t s? l??ng hàng sau khi bán: -' || SoLuongCapNhat);
    ELSIF UPDATING THEN
        -- Giao d?ch c?p nh?t s? l??ng bán hàng
        SoLuongCapNhat := :NEW.SoLuong - :OLD.SoLuong;
        UPDATE SanPham
        SET HangTonKho = HangTonKho - SoLuongCapNhat
        WHERE MaSP = :NEW.MaSP;

        DBMS_OUTPUT.PUT_LINE('?ã c?p nh?t s? l??ng hàng sau khi ch?nh s?a hóa ??n bán hàng: -' || SoLuongCapNhat);
    END IF;
END;

INSERT INTO CTHDBanHang (MaCTHDBH, SoLuong, DonGia, ChietKhau, MaHD, MaSP)
VALUES
  ('CTHDB100', 2, 280000, 0, 'HD52', 'SP06');

UPDATE CTHDBanHang
SET SoLuong = 8
WHERE MaCTHDBH = 'CTHDB53';

SELECT * FROM sanpham

7.
CREATE OR REPLACE PROCEDURE KiemTraSanPhamThieu
IS
  CURSOR SanPhamThieuCursor IS
    SELECT DISTINCT SP.MaSP, SP.TenSP
    FROM SanPham SP
    WHERE SP.HangTonKho <= 0;

    p_DemSoLuong NUMBER := 0;
BEGIN
  FOR SanPhamThieuRec IN SanPhamThieuCursor LOOP
    DBMS_OUTPUT.PUT_LINE('S?n ph?m ' || SanPhamThieuRec.MaSP || ' - ' || SanPhamThieuRec.TenSP || ' b? thi?u ho?c có s? l??ng không ??.');
    p_DemSoLuong := p_DemSoLuong + 1;
  END LOOP;
  IF p_DemSoLuong = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không có s?n ph?m nào thi?u.');
  END IF;

END KiemTraSanPhamThieu;
/
EXECUTE KiemTraSanPhamThieu;

8.
CREATE OR REPLACE PROCEDURE TinhLuongNhanVien_CH01(MaCuaHang IN CHAR) AS
  TongLuong NUMBER := 0;
BEGIN

  FOR NV IN (SELECT * FROM NhanVien WHERE MaCH = MaCuaHang) LOOP
    -- H? s? l??ng c? b?n là 1.5
    TongLuong := TongLuong + NV.Luong * 1.5;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('T?ng l??ng c?a nhân viên c?a c?a hàng ' || MaCuaHang || ': ' || TongLuong);
END;

BEGIN
  TinhLuongNhanVien_CH01('CH01');
END;

9.
DECLARE
  p_MaCH CHAR(5) := 'CH01';
BEGIN
  FOR nv IN (SELECT * FROM NhanVien WHERE MaCH = p_MaCH) LOOP
    DBMS_OUTPUT.PUT_LINE('Mã nhân viên: ' || nv.MaNV);
    DBMS_OUTPUT.PUT_LINE('Tên nhân viên: ' || nv.TenNV);
    DBMS_OUTPUT.PUT_LINE('Ngày sinh: ' || TO_CHAR(nv.NgaySinh, 'DD-MON-YYYY'));
    -- Thêm các thông tin khác n?u c?n
  END LOOP;
END;
10.
DECLARE
    p_MaKH CHAR(10);
    p_TenKH NVARCHAR2(50);
    p_SoLuongMua NUMBER;
BEGIN
    SELECT
        KhachHang.MaKH,
        TenKH,
        COUNT(*) AS SoLuongMua
    INTO
        p_MaKH,
        p_TenKH,
        p_SoLuongMua
    FROM
        KhachHang
    JOIN
        HoadonBH ON KhachHang.MaKH = HoadonBH.MaKH
    GROUP BY
        KhachHang.MaKH, TenKH
    ORDER BY
        SoLuongMua DESC
    FETCH FIRST 1 ROW ONLY;

    DBMS_OUTPUT.PUT_LINE('Khach hang mua nhieu nhat: ' || p_TenKH || ' (MaKH: ' || p_MaKH || ')');
    DBMS_OUTPUT.PUT_LINE('So luong mua: ' || p_SoLuongMua);
END;

11.
DECLARE
  TienMat NUMBER := 0;
  ChuyenKhoan NUMBER := 0;
  TongThuNhap NUMBER := 0;
BEGIN
  SELECT SUM(TongTien) INTO TienMat
  FROM HoadonBH
  WHERE HinhThucTT = 'Ti?n m?t' AND EXTRACT(YEAR FROM NgayBan) = 2023;

  SELECT SUM(TongTien) INTO ChuyenKhoan
  FROM HoadonBH
  WHERE HinhThucTT = 'Chuy?n kho?n' AND EXTRACT(YEAR FROM NgayBan) = 2023;

  TongThuNhap := TienMat + ChuyenKhoan;

  DBMS_OUTPUT.PUT_LINE('T?ng thu nh?p t? ti?n m?t (n?m 2023): ' || TienMat);
  DBMS_OUTPUT.PUT_LINE('T?ng thu nh?p t? chuy?n kho?n (n?m 2023): ' || ChuyenKhoan);
  DBMS_OUTPUT.PUT_LINE('T?ng thu nh?p (n?m 2023): ' || TongThuNhap);
END;

12.
CREATE OR REPLACE PROCEDURE BaoHanhSanPham (
    p_MaHD IN HoadonBH.MaHD%TYPE,
    p_NgayMua IN HoadonBH.NgayBan%TYPE
) IS
    p_NgayHetHan DATE;
BEGIN
    -- Tính ngày h?t h?n b?o hành (3 ngày sau ngày mua)
    p_NgayHetHan := p_NgayMua + 3;

    -- Ki?m tra xem ngày h?t h?n có l?n h?n ngày hi?n t?i không
    IF SYSDATE <= p_NgayHetHan THEN
        -- Th?c hi?n các b??c x? lý b?o hành ? ?ây
        DBMS_OUTPUT.PUT_LINE('San pham duoc bao hanh trong vong 3 ngay!');
        -- C?p nh?t tr?ng thái b?o hành trong b?ng HoadonBH ho?c CTHDBanHang (tùy thu?c vào cách b?n thi?t k?)
    ELSE
        DBMS_OUTPUT.PUT_LINE('Het han bao hanh!');
    END IF;
END BaoHanhSanPham;
/
EXECUTE BaoHanhSanPham('HD01', TO_DATE('2023-12-22', 'YYYY-MM-DD'));

13.

CREATE OR REPLACE PROCEDURE TimSanPhamTheoChatLieu(p_MaChatLieu CHAR) IS
BEGIN
  FOR sp IN (SELECT * FROM SanPham WHERE MaChatLieu = p_MaChatLieu) LOOP
    DBMS_OUTPUT.PUT_LINE('Mã S?n Ph?m: ' || sp.MaSP || ', Tên S?n Ph?m: ' || sp.TenSP);
  END LOOP;
END TimSanPhamTheoChatLieu;
/
BEGIN
  TimSanPhamTheoChatLieu('CL01');
END;

14.
CREATE OR REPLACE PROCEDURE TongTienNhapHang AS
  p_TongTien FLOAT := 0;

  CURSOR crHoadon IS
    SELECT TongTien
    FROM HoaDonNhap
    WHERE EXTRACT(MONTH FROM NgayNhap) = 11;

BEGIN
  FOR hd IN crHoadon LOOP
    p_TongTien := p_TongTien + hd.TongTien;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('T?ng s? ti?n hàng nh?p tháng 11: ' || p_TongTien);
END TongTienNhapHang;
/
BEGIN
  TongTienNhapHang;
END;

15.
DECLARE
  p_MaKH KhachHang.MaKH%TYPE := 'KH01';
  p_TenKH KhachHang.TenKH%TYPE;
  p_NgaySinh KhachHang.NgaySinh%TYPE;
  p_SDT KhachHang.SDT%TYPE;
  p_Email KhachHang.Email%TYPE;
BEGIN

  SELECT TenKH, NgaySinh, SDT, Email
  INTO p_TenKH, p_NgaySinh, p_SDT, p_Email
  FROM KhachHang
  WHERE MaKH = p_MaKH;

  DBMS_OUTPUT.PUT_LINE('Mã KH: ' || p_MaKH);
  DBMS_OUTPUT.PUT_LINE('Tên KH: ' || p_TenKH);
  DBMS_OUTPUT.PUT_LINE('Ngày Sinh: ' || TO_CHAR(p_NgaySinh, 'DD/MM/YYYY'));
  DBMS_OUTPUT.PUT_LINE('S? ?i?n Tho?i: ' || p_SDT);
  DBMS_OUTPUT.PUT_LINE('Email: ' || p_Email);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Không tìm th?y thông tin cho mã khách hàng ' || p_MaKH);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END;



