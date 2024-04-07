import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/app/app.dart';
import 'package:products_app/core/di/injector.dart';

void main() {
  setUpAll(() {
    configureDependencies();
  });

  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(App), findsOneWidget);
    });
  });
}
