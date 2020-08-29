# My Invensting Project Task

Para için çalışmayıp, parayı kendimiz için çalıştırmanın vakti geldi. 
Artık başkası için çalışmak yerine kendimiz için çalışıp finansal özgürlük yolunda bu projenin başlangıcını yapıyoruz.
Temettü, bedelsiz ve satışta azalan maliyetleri de hesaplayarak, piyasadaki uygulama eksikliğini gidermeyi hedefliyoruz.

# İçindekiler
- [Commit Standartı](#commit)
- [API Reference](#api-reference)
- [Teknolojiler](#Teknolojiler)
- [To-Do Task](#To-Do-Tasks)
- [Done Task](#Gerceklestirilenler)
- [Kütüphaneler](#Kutuphaneler)


#### Ekip Üyeleri
- Orhan TÜZAN
- Yunus Emre KURT
- Faruk GÜNER

#### Commit
`[Commit Id][commit message]` şeklindedir. 
Geliştirmeler `dev` branch'inde yapılır. Prod `master` branch'idir.

### API Reference
Kullanılacak apiler için kullanım tipleri ver parametreler yazılmalıdır. Örnek şablon aşağıdaki gibidir.
- Endpoint: https://finfree.app/demo
- Headers: Authorization -> R29vZCBMdWNr
- Type: GET
-------- Hisseler -----------
- Endpoint: https://api.collectapi.com/economy/hisseSenedi
- Headers: Authorization -> apikey 03AnOc18IENnWBUzGpI0vW:6jKBmQ4fx72e1FuYU0XFeZ
- Type: GET

#### Teknolojiler;
- Flutter
- Dark

#### To-Do Tasks
- API Request ile hisseleri getir.
- SQLLite eklentisini tanımla
- Verilerin kayıtlarını SQL üzerinden tut.


#### Gerceklestirilenler
- Proje Oluşturulması(C'in-1)
- Readme.md dosyasının güncellenmesi(C'in-1)
- NavigationBar eklendi. (C'in-2)
- NavigationBar'a menüler eklendi. (C'in-2)
- Renklendirme düzenlemeleri yapıldı. (C'in-2)
- Sağ üst köşede debug yazısının kaldırıldı. (C'in-2)
- Toast Kütüphanesi eklendi. (C'in-3)
- İşlem tipi için class oluşturuldu. (C'in-3)
- Ortak metotlar için helper sınıfı oluşturuldu. (C'in-3)
- Artı butonuna basıldığında pop-up ekranı açılıyor. (C'in-3)
- Hisse işlemi eklemek için Pop-up ekran oluşturuldu. (C'in-3)


#### Kutuphaneler
- http: ^0.12.2 -> API servis kullanımı için [Kutuphane](https://pub.dev/packages/http/install)
- fl_chart: ^0.11.0 -> Grafik oluşturmak için [Kutuphane](https://pub.dev/packages/fl_chart/install)
- intl: ^0.16.1 -> Epoch Time için DateFormat [Kutuphane](https://pub.dev/packages/intl/install)
- 'dart:convert' -> JSON Parse işlemleri için; Kendi içinde var sadece import edilmesi gerekiyor.
- fluttertoast: ^7.0.2 -> Toast messajlar için [Kutuphane](https://pub.dev/packages/fluttertoast/install)
- 'package:intl/date_symbol_data_local.dart' -> Türkçe Tarih formatı için gerekli.; Widget Build edilirken en başa initializeDateFormatting('tr'); eklenmeli

#### Hata yorumlamaları
Api çağırımlarında gelen cevaplar aşağıdaki gibidir bu kontroller eklenmelidir.
- Success (Status Code 200)
- Unauthorized (Status Code 401)
- Internal Server Error (Status Code 500)
