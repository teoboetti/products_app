import 'package:api/src/models/catalog/document.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Document:',
    () {
      test(
        'fromJson',
        () {
          final json = {
            'affiliate_url': 'https://example.com',
            'brand': 'Brand',
            'category': 'Category',
            'category_1': 'Category 1',
            'category_2': 'Category 2',
            'description': 'Description',
            'discount_percentage': 10,
            'has_image': 1,
            'id': '123',
            'image': 'image.jpg',
            'image_merchant': 'merchant.jpg',
            'list_price': 100.0,
            'merchant': 'Merchant',
            'merchantId': '456',
            'new_offer': true,
            'selling_price': 90.0,
            'tags': ['tag1', 'tag2'],
            'title': 'Title',
            'url': 'https://example.com/document',
          };

          final document = Document.fromJson(json);

          expect(document.affiliateUrl, equals('https://example.com'));
          expect(document.brand, equals('Brand'));
          expect(document.category, equals('Category'));
          expect(document.category1, equals('Category 1'));
          expect(document.category2, equals('Category 2'));
          expect(document.description, equals('Description'));
          expect(document.discountPercentage, equals(10));
          expect(document.hasImage, equals(1));
          expect(document.id, equals('123'));
          expect(document.image, equals('image.jpg'));
          expect(document.imageMerchant, equals('merchant.jpg'));
          expect(document.listPrice, equals(100.0));
          expect(document.merchant, equals('Merchant'));
          expect(document.merchantID, equals('456'));
          expect(document.newOffer, equals(true));
          expect(document.sellingPrice, equals(90.0));
          expect(document.tags, equals(['tag1', 'tag2']));
          expect(document.title, equals('Title'));
          expect(document.url, equals('https://example.com/document'));
        },
      );

      test(
        'toJson',
        () {
          const affiliateUrl = 'https://example.com';
          const brand = 'Brand';
          const category = 'Category';
          const category1 = 'Category1';
          const category2 = 'Category2';
          const description = 'Description';
          const discountPercentage = 10;
          const hasImage = 1;
          const id = '123';
          const image = 'image.jpg';
          const imageMerchant = 'image_merchant.jpg';
          const listPrice = 100.0;
          const merchant = 'Merchant';
          const merchantID = '456';
          const newOffer = true;
          const sellingPrice = 90.0;
          final tags = ['tag1', 'tag2'];
          const title = 'Title';
          const url = 'https://example.com/document';

          final document = Document(
            affiliateUrl: affiliateUrl,
            brand: brand,
            category: category,
            category1: category1,
            category2: category2,
            description: description,
            discountPercentage: discountPercentage,
            hasImage: hasImage,
            id: id,
            image: image,
            imageMerchant: imageMerchant,
            listPrice: listPrice,
            merchant: merchant,
            merchantID: merchantID,
            newOffer: newOffer,
            sellingPrice: sellingPrice,
            tags: tags,
            title: title,
            url: url,
          );

          final json = document.toJson();
          expect(json['affiliate_url'], affiliateUrl);
          expect(json['brand'], brand);
          expect(json['category'], category);
          expect(json['category_1'], category1);
          expect(json['category_2'], category2);
          expect(json['description'], description);
          expect(json['discount_percentage'], discountPercentage);
          expect(json['has_image'], hasImage);
          expect(json['id'], id);
          expect(json['image'], image);
          expect(json['image_merchant'], imageMerchant);
          expect(json['list_price'], listPrice);
          expect(json['merchant'], merchant);
          expect(json['merchantId'], merchantID);
          expect(json['new_offer'], newOffer);
          expect(json['selling_price'], sellingPrice);
          expect(json['tags'], tags);
          expect(json['title'], title);
          expect(json['url'], url);
        },
      );
    },
  );
}
