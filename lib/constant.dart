import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

final myCoordinates = Coordinates(30.033333, 31.233334);
final params = CalculationMethod.egyptian.getParameters();

final prayer = PrayerTimes.today(myCoordinates, params);
final fajr1 = DateFormat.jm().format(prayer.fajr);
  final asr = DateFormat.jm().format(prayer.asr);
  final dhuhr = DateFormat.jm().format(prayer.dhuhr);
  final maghrib = DateFormat.jm().format(prayer.maghrib);
  final isha = DateFormat.jm().format(prayer.isha);
  final currentprayer = prayer.currentPrayer();
  final nextPrayer = prayer.nextPrayerByDateTime(DateTime.now());