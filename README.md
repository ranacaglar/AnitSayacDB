# AnitSayacDB
Bu proje, Anıt Sayaç uygulamasına ait verilerin yönetimi için geliştirilmiş bir SQL Server veritabanı ve C# (Windows Forms) tabanlı masaüstü uygulamadır.

Veritabanı; öldürülen kadınlara ait bilgiler, failler, olay detayları ve kaynaklar gibi kritik verileri içermekte olup, `.bak` formatında yedeklenmiştir. Ayrıca uygulamada kullanılan SQL sorguları da proje ile birlikte sunulmaktadır.

# Kullanılan Teknolojiler
- C# (Windows Forms App) – Masaüstü arayüz uygulaması

- SQL Server – Veritabanı yönetimi

- Nesneye Yönelik Programlama (OOP) – Kod yapısı ve organizasyonu

- ADO.NET – Veritabanı işlemleri için bağlantı yönetimi

- .bak – SQL Server veritabanı yedeği

# Proje İçeriği
- Form1.cs ve diğer .cs dosyaları (Kullanıcı arayüzü, buton işlemleri vb.)

- AnitSayac.sln ve .csproj (Visual Studio proje dosyaları)

- ANITSAYACDB.bak (SQL Server veritabanı yedeği)

- SQL sorgu dosyaları (.sql) – Elle veri ekleme veya test amaçlı sorgular 

# Veritabanı Yükleme (Restore)
- SQL Server Management Studio (SSMS) uygulamasını açın.

- Sol menüde "Databases" üzerine sağ tıklayın → "Restore Database..." seçin.

- Açılan pencerede "Device" seçeneğini işaretleyin ve .bak dosyasını gösterin.

- Gerekli ayarları kontrol ettikten sonra "OK" butonuna tıklayarak yükleme işlemini tamamlayın.

# Notlar
- Bu veritabanı, ANITSAYAC uygulamasının veri yönetimi için kullanılmaktadır ve arayüzü C# ile geliştirilmiştir.

- Bu veritabanı, Kadınlar, Failler, Kaynaklar ve Olaylar tablolarını içermektedir.

- Her tabloya yönelik ekle, sil, düzenle işlemleri Windows Forms üzerinden gerçekleştirilmiştir.

- Uygulama, gerçek verilerle test edilmiş ve kapsamlı veri yönetimi sağlamak üzere tasarlanmıştır.

