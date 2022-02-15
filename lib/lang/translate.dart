import 'package:get/get_navigation/src/root/internacionalization.dart';
import './i18n/en.dart' as TranslateEnString;

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      /** ENGLISH */
      'en_US': TranslateEnString.trans,
    };
  }
}
