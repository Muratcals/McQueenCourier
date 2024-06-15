import 'dart:io';
import 'package:mc_queen_courier/Model/response_error_model.dart';

class ResponseErrorConverter {
  static ResponseErrorModel convertStatusCode(int statusCode) {
    if (statusCode == HttpStatus.badRequest) {
      return ResponseErrorModel(
          statusMessage:
              "Sunucu isteğinizi anlayamadı. Lütfen verileri düzgün doldurunuz",
          statusTitle: "Geçersiz istek",
          statusCode: HttpStatus.badRequest);
    } else if (statusCode == HttpStatus.unauthorized) {
      return ResponseErrorModel(
          statusMessage: "Kullanıcı adı veya şifre yanlış",
          statusTitle: "Hatalı Giriş",
          statusCode: HttpStatus.unauthorized);
    } else if (statusCode == HttpStatus.forbidden) {
      return ResponseErrorModel(
          statusMessage:
              "Bu sayfaya erişim izniniz yok. Lütfen yöneticiye başvurun",
          statusTitle: "Erişim engellendi",
          statusCode: HttpStatus.forbidden);
    } else if (statusCode == HttpStatus.notFound) {
     return ResponseErrorModel(
            statusMessage: "Sayfa bulunamadı",
            statusTitle: "Bir hata oluştu",
            statusCode: HttpStatus.notFound);
    } else if (statusCode == HttpStatus.requestTimeout) {
      return ResponseErrorModel(
          statusMessage:
              "Sunucu isteği beklerken bir sorun oluştu. Lütfen tekrar deneyin",
          statusTitle: "İstek zaman aşımına uğradı",
          statusCode: HttpStatus.internalServerError);
    } else if (statusCode == HttpStatus.conflict) {
      return ResponseErrorModel(
          statusMessage: "Girilen bilgiler daha önce kullanılmış.",
          statusTitle: "Bir hata oluştu",
          statusCode: HttpStatus.conflict);
    } else if (statusCode == HttpStatus.internalServerError) {
      return ResponseErrorModel(
          statusMessage:
              "Bir şeyler ters gitti. Lütfen daha sonra tekrar deneyin. Sorun devam ederse sistem yöneticinize başvurun",
          statusTitle: "Sunucu hatası",
          statusCode: HttpStatus.internalServerError);
    } else if (statusCode == HttpStatus.badGateway) {
      return ResponseErrorModel(
          statusMessage:
              "Sunucu bir hata ile karşılaştı. Lütfen bir süre sonra tekrar deneyin.",
          statusTitle: "Kötü ağ gecidi",
          statusCode: HttpStatus.badGateway);
    } else if (statusCode == HttpStatus.serviceUnavailable) {
      return ResponseErrorModel(
          statusMessage:
              "Sunucu şu anda talebinizi işleyemiyor. Lütfen daha sonra tekrar deneyin.",
          statusTitle: "Hizmet şuanda kullanılamıyor",
          statusCode: HttpStatus.internalServerError);
    } else if (statusCode == HttpStatus.gatewayTimeout) {
      return ResponseErrorModel(
          statusMessage:
              "Sunucu, başka bir sunucudan zamanında yanıt alamadı. Lütfen tekrar deneyin",
          statusTitle: "Zaman aşımı",
          statusCode: HttpStatus.internalServerError);
    } else {
      return ResponseErrorModel(
          statusMessage: "Birşeyler ters gitti.",
          statusTitle: "Bir sorun oluştu");
    }
  }
}
