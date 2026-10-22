import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aplikasi_kuliahku/main.dart';

void main() {
  testWidgets('Login page shows education branding and validates fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('RuangBelajar'), findsOneWidget);
    expect(find.text('Selamat Datang!'), findsOneWidget);
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);

    await tester.ensureVisible(find.text('Masuk').first);
    await tester.tap(find.text('Masuk').first);
    await tester.pumpAndSettle();

    expect(find.text('Email wajib diisi'), findsOneWidget);
    expect(find.text('Kata sandi wajib diisi'), findsOneWidget);

    await tester.ensureVisible(find.byTooltip('Tampilkan kata sandi'));
    await tester.tap(find.byTooltip('Tampilkan kata sandi'));
    await tester.pump();
    expect(find.byTooltip('Sembunyikan kata sandi'), findsOneWidget);
  });
}
