import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

void main() {
  final myCoordinates =
  Coordinates(32.8700885, 13.2762591);
  final params = CalculationMethod.karachi.getParameters();
  params.madhab = Madhab.hanafi;
  final prayerTimes = PrayerTimes.today(myCoordinates, params);

  final f = DateFormat('HH:mm');
  print('Fajr: ${f.format(prayerTimes.fajr)}');
  print('Sunrise: ${f.format(prayerTimes.sunrise)}');
  print('Dhuhr: ${f.format(prayerTimes.dhuhr)}');
  print('Asr: ${f.format(prayerTimes.asr)}');
  print('Maghrib: ${f.format(prayerTimes.maghrib)}');
  print('Isha: ${f.format(prayerTimes.isha)}');
  print('---');
}