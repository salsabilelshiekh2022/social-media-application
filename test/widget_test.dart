import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/core/routing/app_router.dart';

import 'package:social_media_app/social_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SocialApp(
      appRouter: AppRouter(),
    ));
  });
}
