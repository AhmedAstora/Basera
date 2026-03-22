
import 'package:get/get.dart';

class Messages extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'sat': 'SAT',
          'sun': 'SUN',
          'mon': 'MON',
          'tue': 'TUE',
          'wed': 'WED',
          'thu': 'THU',
          'fri': 'FRI',
        },
        'ar': {
          'sat': 'السبت',
          'sun': 'الأحد',
          'mon': 'الاثنين',
          'tue': 'الثلاثاء',
          'wed': 'الأربعاء',
          'thu': 'الخميس',
          'fri': 'الجمعة',
        }
      };
}
