import 'package:intl/intl.dart';

/// Currency formatter to be used in the app.
final kCurrencyFormatter =
    NumberFormat.simpleCurrency(locale: Intl.defaultLocale ?? 'fr_FR');