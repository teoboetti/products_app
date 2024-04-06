// ignore_for_file: require_trailing_commas

import 'package:api/src/models/catalog/document.dart';
import 'package:api/src/models/catalog/grouped_hit.dart';
import 'package:api/src/models/catalog/hit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Grouped Hit',
    () {
      test(
        'fromJson',
        () {
          final json = {
            'hits': [
              {
                'document': {
                  'affiliate_url':
                      'https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxZmM2am03c0hoaXdrSWRsdVhlMXpCODROT256VFlXZ3d3PT01&offer=WkxFdm93d3Y2VVpzOTd5NzYvaVNXL1dHSnNhNEFZYlN2Y2VtaVFSSXdQcXYzZGloVnpIR2RCNFUwYnJQTWlXNWFDSUJ6bVZSakRiTlZUWWxSWjRURjROakg3ZWVIVHVxbzhKVWNvWE5ZNXEwcDlzUlN2akh1RU4yUGRYQ3NXQU9QVDVpeDd3NDhGWmQ5NU9BQ09BZllJa2s3NWZyeXhGcHpvOWNkY3d5eE40ZFdVRVU0eFR3MDQyS1JQQ2tMS2RyMXhaaXRoTmJFMmUrUFFQM0pUalVDYUtuSXNjeitHR2Y2TjhQMWxZeVRLS0U2ODJDalJQQURjU2hwSk9heGI1RDd2VFAwcHNkQmRQSmNJV1V1Zk02MldNekFDUVZTaU10ekplWGFycUZUZWlibXJHcm5FYU14K2F3U1FPSDcxekdqZTdOYmhRMlhRTnF0c0dONVY2cmozWThqVTRUWm51VWpuakNjRWlIK1VBPQ2&sid=&utm_medium=referral&utm_source=scalapayappit',
                  'brand': '',
                  'category':
                      'Sport e Tempo libero > Scarpe da Calcio, Calcetto e Rugby',
                  'category_1': 'Sport e Tempo libero',
                  'category_2': 'Scarpe da Calcio, Calcetto e Rugby',
                  'description':
                      'Taglie disponibili: 44 44_1_2 39 40 42 42_1_2 43 - Scarpa da Calcetto Uomo Nike Legend 9 Club White',
                  'discount_percentage': 30,
                  'has_image': 1,
                  'id': '632180924',
                  'image':
                      'https://pics.trovaprezzi.it/it-300x300/632180924.jpg',
                  'image_merchant':
                      'https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF',
                  'list_price': 55,
                  'merchant': 'NonSoloSport',
                  'merchantId': 'nonsolosport',
                  'new_offer': false,
                  'selling_price': 38.5,
                  'tags': <String>[],
                  'title': 'Nike Legend 9 Club Uomo Bianco',
                  'url':
                      'https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxZmM2am03c0hoaXdrSWRsdVhlMXpCODROT256VFlXZ3d3PT01&offer=WkxFdm93d3Y2VVpzOTd5NzYvaVNXL1dHSnNhNEFZYlN2Y2VtaVFSSXdQcXYzZGloVnpIR2RCNFUwYnJQTWlXNWFDSUJ6bVZSakRiTlZUWWxSWjRURjROakg3ZWVIVHVxbzhKVWNvWE5ZNXEwcDlzUlN2akh1RU4yUGRYQ3NXQU9QVDVpeDd3NDhGWmQ5NU9BQ09BZllJa2s3NWZyeXhGcHpvOWNkY3d5eE40ZFdVRVU0eFR3MDQyS1JQQ2tMS2RyMXhaaXRoTmJFMmUrUFFQM0pUalVDYUtuSXNjeitHR2Y2TjhQMWxZeVRLS0U2ODJDalJQQURjU2hwSk9heGI1RDd2VFAwcHNkQmRQSmNJV1V1Zk02MldNekFDUVZTaU10ekplWGFycUZUZWlibXJHcm5FYU14K2F3U1FPSDcxekdqZTdOYmhRMlhRTnF0c0dONVY2cmozWThqVTRUWm51VWpuakNjRWlIK1VBPQ2&sid=&utm_medium=referral&utm_source=scalapayappit'
                }
              }
            ]
          };

          final groupedHit = GroupedHit.fromJson(json);

          expect(groupedHit.hits.length, equals(1));
        },
      );

      test(
        'toJson',
        () {
          final hits = [
            const Hit(
              document: Document(
                affiliateUrl: '',
                brand: '',
                category1: '',
                category2: '',
                category: '',
                description: '',
                discountPercentage: 12,
                hasImage: 0,
                id: '',
                image: '',
                imageMerchant: '',
                listPrice: 12.2,
                sellingPrice: 11.2,
                merchant: '',
                merchantID: '',
                newOffer: false,
                tags: [],
                title: '',
                url: '',
              ),
            ),
          ];
          final groupedHit = GroupedHit(hits: hits);

          final json = groupedHit.toJson();

          expect(json['hits'], equals(hits));
        },
      );
    },
  );
}
