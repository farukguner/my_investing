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

#### Teknolojiler;
- Flutter
- Dark

#### To-Do Tasks
- Class'ların oluşturulması
- Kütüphanelerin eklenmesi
- Sağ üst köşede debug yazısının kaldırılması


#### Gerceklestirilenler
- Proje Oluşturulması(C'in-1)
- Readme.md dosyasının güncellenmesi(C'in-1)


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
