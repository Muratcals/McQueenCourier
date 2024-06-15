import 'package:flutter/material.dart';
import 'package:mc_queen_courier/Model/address_model.dart';
import 'package:url_launcher/url_launcher.dart';

class StartNavigation extends StatelessWidget {
  const StartNavigation({super.key, required this.address});

  final AddressModel address;

  Future<void> onPressed() async {
    String query =
        '${address.neighbourhoodName},${address.street}, No:${address.buildingNo} ${address.districtName}/${address.provinceName}';

    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}';
    final String appleMapsUrl =
        'https://maps.apple.com/?q=${Uri.encodeComponent(query)}';
    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
      await launchUrl(Uri.parse(appleMapsUrl));
    } else {
      throw 'Harita uygulaması açılamadı.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async => onPressed(),
      child: const Text(
        'Navigasyonu Başlat',
        style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue, // Alt çizginin rengini ayarlamak için
          decorationStyle:
              TextDecorationStyle.solid, // Alt çizginin stilini ayarlamak için
        ),
      ),
    );
  }
}
