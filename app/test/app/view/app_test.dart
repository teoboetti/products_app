import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/app/app.dart';
import 'package:products_app/core/di/injector.dart';
import 'package:products_app/counter/counter.dart';

void main() {
  setUpAll(() {
    configureDependencies();
  });

  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
