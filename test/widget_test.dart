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

  testWidgets('Register form validates and opens the dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Daftar').first);
    await tester.tap(find.text('Daftar').first);
    await tester.pumpAndSettle();

    expect(find.text('Buat Akun Baru'), findsOneWidget);
    await tester.ensureVisible(find.text('Daftar Sekarang'));
    await tester.tap(find.text('Daftar Sekarang'));
    await tester.pumpAndSettle();
    expect(find.text('Nama lengkap wajib diisi'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('registerNameField')));
    await tester.enterText(
      find.byKey(const Key('registerNameField')),
      'Alya Putri',
    );
    await tester.enterText(
      find.byKey(const Key('registerEmailField')),
      'alya@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('registerPasswordField')),
      'belajar123',
    );
    await tester.enterText(
      find.byKey(const Key('confirmPasswordField')),
      'belajar123',
    );
    await tester.ensureVisible(find.text('Daftar Sekarang'));
    await tester.tap(find.text('Daftar Sekarang'));
    await tester.pumpAndSettle();

    expect(find.text('Alya Putri'), findsOneWidget);
    expect(find.text('Ringkasan Belajarmu'), findsOneWidget);
    expect(find.text('Matematika Dasar'), findsOneWidget);
  });
}
