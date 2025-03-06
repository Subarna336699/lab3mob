import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rotating_picture_frame/main.dart'; // Correct import path
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  group('Rotating Picture Frame App', () {
    testWidgets('displays images with border', (WidgetTester tester) async {
      // Arrange: Build the widget.
      await tester.pumpWidget(RotatingPictureFrameApp());

      // Act: Allow some time for the image to load
      await tester.pumpAndSettle();

      // Assert: Check if the image is displayed with the correct border
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(Container), findsOneWidget); // Check for the border container
    });

    testWidgets('pause and resume button functionality', (WidgetTester tester) async {
      // Arrange: Build the widget.
      await tester.pumpWidget(RotatingPictureFrameApp());

      // Act: Find the pause/resume button
      final pauseResumeButton = find.text('Pause');

      // Assert: Initially, the button text should say 'Pause'
      expect(pauseResumeButton, findsOneWidget);

      // Act: Tap the pause button to pause the image rotation
      await tester.tap(pauseResumeButton);
      await tester.pump();

      // Assert: The button text should now say 'Resume'
      expect(find.text('Resume'), findsOneWidget);

      // Act: Tap the resume button to resume the image rotation
      await tester.tap(find.text('Resume'));
      await tester.pump();

      // Assert: The button text should now say 'Pause' again
      expect(find.text('Pause'), findsOneWidget);
    });

    testWidgets('image rotation happens automatically every 10 seconds', (WidgetTester tester) async {
      // Arrange: Build the widget.
      await tester.pumpWidget(RotatingPictureFrameApp());

      // Act: Allow some time for the image to rotate
      await tester.pumpAndSettle();
      final initialImage = find.byType(CachedNetworkImage);

      // Capture the initial image displayed
      final initialImageKey = (tester.firstWidget(initialImage) as CachedNetworkImage).imageUrl;

      // Simulate waiting for 10 seconds (simulate time passing)
      await tester.pump(Duration(seconds: 10));

      // Act: Get the current image after the timer
      final newImage = find.byType(CachedNetworkImage);
      final newImageKey = (tester.firstWidget(newImage) as CachedNetworkImage).imageUrl;

      // Assert: The image should have changed after 10 seconds
      expect(initialImageKey, isNot(equals(newImageKey)));
    });
  });
}
