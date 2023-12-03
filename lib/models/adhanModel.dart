import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class AdhanModel {
  final Coordinates myCoordinates;
  final PrayerTimes prayerTimes;

  AdhanModel()
      : myCoordinates = Coordinates(32.8700885, 13.2762591),
        prayerTimes = _calculatePrayerTimes();

  static PrayerTimes _calculatePrayerTimes() {
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    return PrayerTimes.today(Coordinates(32.8700885, 13.2762591), params);
  }

  Map<String, String> getPrayerTimes() {
    final f = DateFormat('HH:mm');
    return {
      'Fajr': f.format(prayerTimes.fajr),
      'Sunrise': f.format(prayerTimes.sunrise),
      'Dhuhr': f.format(prayerTimes.dhuhr),
      'Asr': f.format(prayerTimes.asr),
      'Maghrib': f.format(prayerTimes.maghrib),
      'Isha': f.format(prayerTimes.isha),
    };
  }
}