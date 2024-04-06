// ignore_for_file: require_trailing_commas

import 'package:api/src/models/catalog/document.dart';
import 'package:api/src/models/catalog/hit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Hit',
    () {
      test(
        'fromJson',
        () {
          final json = {
            'document': {
              'affiliate_url':
                  'https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxZmM2am03c0hoaXdrSWRsdVhlMXpCODROT256VFlXZ3d3PT01&offer=Y0dDVGd4TS9reUQrT2lIOTN4cUVIdFo2eHB4WHczVy85Y1lSUEY0UjZZeCswRDJPV3F4cUxGZVFJZFc5SmVXU1dpN1Y5cTVVcEpqQkZLeU54eEtvSWl2OUM0WjZLdFJMQWlQQno4c3c5bU1iMXpvTlE4SUNoTTlhYXVpMkFUMzNOazBXaGJnYnZqT3JGdVdwN2txbEozUmorTDczYk1PV3ltY0ZhQTBibFhoT0RTS1JwblM1YWdUeC9hSTNtMWo5VmxObVd0Rmlud2x5b2RnL1EyWHdldnd5bjdXL1Q0TFdkb25CUitxTmhoaS95djM0a1I0Uys5YWluSC9xdW5oMVhRNjNucFd6VlJIVTdjM2N0dTNLbEhwaVR4dU9lQ3hmUnFBYmJXRmNKTDNWUUVQQzdGcHNJUnpxd3FBMmc4dGVNaVJ6Y05ET0o2a0ljSGJoa25hTys4T0dCWTNhdFR3Z3dBT0lKd0x2UExjL2NIMy9lNDd2R1dWUm1icE8wc2Z2Zk1KNUorVlJSUHNITlp4WlUvakVUZXRjWXJqbHp3MDFGdXF0RkVFTHkyeHBraHZmKzgrRDFBK1pOYi9WSVdMbw2&sid=&utm_medium=referral&utm_source=scalapayappit',
              'brand': '',
              'category': 'Moda > Abbigliamento > Abbigliamento Sportivo',
              'category_1': 'Moda',
              'category_2': 'Abbigliamento > Abbigliamento Sportivo',
              'description':
                  "Nike FB8002-473 Tech Fleece Pantaloni Sportivi Uomo OBSIDIANHEATHER/Black Taglia 3XL Morbido elastico in vita con cordoncino esterno per una vestibilità aderente e costante. La tasca incollata con divisorio interno è l'ideale per tenere le proprie cose al",
              'discount_percentage': 0,
              'has_image': 1,
              'id': '624149113',
              'image': 'https://pics.trovaprezzi.it/it-300x300/624149113.jpg',
              'image_merchant':
                  'https://immagini.trovaprezzi.it/negozi/amazonitsport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF',
              'list_price': 50,
              'merchant': 'Amazon',
              'merchantId': 'amazonitsport',
              'new_offer': false,
              'selling_price': 50,
              'tags': <String>[],
              'title':
                  'Nike FB8002-473 Tech Fleece Pantaloni Sportivi Uomo OBSIDIANHEATHER/Black Taglia 3XL',
              'url':
                  'https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxZmM2am03c0hoaXdrSWRsdVhlMXpCODROT256VFlXZ3d3PT01&offer=Y0dDVGd4TS9reUQrT2lIOTN4cUVIdFo2eHB4WHczVy85Y1lSUEY0UjZZeCswRDJPV3F4cUxGZVFJZFc5SmVXU1dpN1Y5cTVVcEpqQkZLeU54eEtvSWl2OUM0WjZLdFJMQWlQQno4c3c5bU1iMXpvTlE4SUNoTTlhYXVpMkFUMzNOazBXaGJnYnZqT3JGdVdwN2txbEozUmorTDczYk1PV3ltY0ZhQTBibFhoT0RTS1JwblM1YWdUeC9hSTNtMWo5VmxObVd0Rmlud2x5b2RnL1EyWHdldnd5bjdXL1Q0TFdkb25CUitxTmhoaS95djM0a1I0Uys5YWluSC9xdW5oMVhRNjNucFd6VlJIVTdjM2N0dTNLbEhwaVR4dU9lQ3hmUnFBYmJXRmNKTDNWUUVQQzdGcHNJUnpxd3FBMmc4dGVNaVJ6Y05ET0o2a0ljSGJoa25hTys4T0dCWTNhdFR3Z3dBT0lKd0x2UExjL2NIMy9lNDd2R1dWUm1icE8wc2Z2Zk1KNUorVlJSUHNITlp4WlUvakVUZXRjWXJqbHp3MDFGdXF0RkVFTHkyeHBraHZmKzgrRDFBK1pOYi9WSVdMbw2&sid=&utm_medium=referral&utm_source=scalapayappit',
              'isMerchantCard': true,
              'merchantToken': '6LKTPJ9RN'
            },
          };

          final hit = Hit.fromJson(json);

          expect(hit.document, isNotNull);
        },
      );

      test(
        'toJson',
        () {
          const document = Document(
            affiliateUrl: 'https://example.com',
            brand: 'Brand',
            category: 'Category',
            category1: 'Category1',
            category2: 'Category2',
            description: 'Description',
            discountPercentage: 10,
            hasImage: 1,
            id: '123',
            image: 'image.jpg',
            imageMerchant: 'image_merchant.jpg',
            listPrice: 100,
            merchant: 'Merchant',
            merchantID: '456',
            newOffer: true,
            sellingPrice: 90,
            tags: ['tag1', 'tag2'],
            title: 'Title',
            url: 'https://example.com/document',
          );

          const hit = Hit(
            document: document,
          );

          final json = hit.toJson();

          expect(
            json['document'],
            equals(document),
          );
        },
      );
    },
  );
}
