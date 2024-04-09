import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/app/app.dart';
import 'package:products_app/core/di/injector.dart';

void main() {
  setUpAll(() {
    configureDependencies();
  });

  group('App', () {
    testWidgets('renders App', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      expect(find.byType(App), findsOneWidget);
    });
  });
}
