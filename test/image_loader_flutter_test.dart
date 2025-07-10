import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_loader_flutter/src/image_loader_widget.dart';

void main() {
  testWidgets('ImageLoaderFlutterWidgets renders without error',
      (WidgetTester tester) async {
    // Arrange: Build the widget inside a MaterialApp scaffold
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ImageLoaderFlutterWidgets(
            image: '', // Pass an empty string or a mock asset path
            radius: 10,
            circle: false,
          ),
        ),
      ),
    );

    // Act: Let the widget build
    await tester.pumpAndSettle();

    // Assert: Check if placeholder widget (Icon by default) is found
    expect(find.byIcon(Icons.photo), findsOneWidget);
  });
}
