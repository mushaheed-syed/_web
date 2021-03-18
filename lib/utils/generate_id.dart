import 'dart:math' show Random;

String generateRandomId(String email) {
  Random _random;

  try {
    _random = Random.secure();
  } catch (e) {
    final _dateTime = DateTime.now();

    final _seed = _dateTime.millisecondsSinceEpoch + email.hashCode;
    _random = Random(_seed);
  }

  final _len = 8; 

  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(_len, (index) => _chars[_random.nextInt(_chars.length)])
      .join();
}
