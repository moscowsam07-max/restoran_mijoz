import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['uz', 'ru', 'en', 'kk', 'ky', 'tr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? uzText = '',
    String? ruText = '',
    String? enText = '',
    String? kkText = '',
    String? kyText = '',
    String? trText = '',
    String? arText = '',
  }) =>
      [uzText, ruText, enText, kkText, kyText, trText, arText][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ClientLoginPage
  {
    '6luephry': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ywvn67sq': {
      'uz': 'Search...',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'b9t70f36': {
      'uz': '🇺🇿 O\'zbekcha',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'mnkwja6n': {
      'uz': '🇷🇺 Русский',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'b7dgyvf5': {
      'uz': '🇬🇧 English',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'x3nx8uop': {
      'uz': '🇰🇿 Қазақша',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ub406tpw': {
      'uz': '🇰🇬 Кыргызча',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '2ua6wpex': {
      'uz': '🇹🇷 Türkçe',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'rm61jnbg': {
      'uz': '🇦🇪 العربية',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'gvorpyhm': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '1yg1nabp': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '60wti6ig': {
      'uz': 'Search...',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '2e18x064': {
      'uz': '🇺🇿 +998',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'pja594es': {
      'uz': '🇷🇺 +7',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'olv4lgwd': {
      'uz': '🇺🇸 +1',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'l4dt5msd': {
      'uz': '🇰🇿 +7',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'dst6vzhy': {
      'uz': '🇰🇬 +996',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'qhu5ixoh': {
      'uz': '🇹🇷 +90',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '3yr8j10k': {
      'uz': '🇦🇪 +971',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'u3bek7wa': {
      'uz': 'Telefon raqamingiz',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'npnmlaxg': {
      'uz': 'SMS-kod yuborish',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ciz7mc1s': {
      'uz': 'Home',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
  // ClientVerifyCodePage
  {
    'ckp4dbwn': {
      'uz': 'Tasdiqlash kodini kiriting',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '39kxcfnp': {
      'uz': 'Home',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
  // ClientProfilePage
  {
    'fz62d7ib': {
      'uz': 'PREMIUM STATUS',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'o70xj425': {
      'uz': 'VIP MIJOZ',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ozihx839': {
      'uz': 'BANKETLAR ZALI 🍽️',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '4jwi5ob2': {
      'uz': 'Stol band qilish',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'dzs3pb94': {
      'uz': 'Aksiya 🎁',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'twzibm2h': {
      'uz': 'Buyurtmalar tarixi 🕒',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'bkoyk48b': {
      'uz': 'Mening manzilim 📍',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'hg1l4r7w': {
      'uz': 'To\'lov usullari 💳',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'cqt1x8is': {
      'uz': 'Mening fikrlarim 💬',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '6agodxbd': {
      'uz': 'Yetkazib berish shartlari 📦',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'on5d5ed3': {
      'uz': '📞 Telefon raqamlarimiz',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'la91s17j': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'j40yuhoa': {
      'uz': 'Ismingizni kiriting',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '3vzt3r61': {
      'uz': 'Telefon raqamingiz',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '0l8zhjio': {
      'uz': 'Push xabarnomalar',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'comu6god': {
      'uz': 'Ilova tili 🌐',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'cmffgf3m': {
      'uz': 'Select...',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'sikr5ozw': {
      'uz': 'Search...',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '250b1dd0': {
      'uz': '🇺🇿 O\'zbekcha',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ndlnjwqp': {
      'uz': '🇷🇺 Русский',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'vsi8r8pn': {
      'uz': '🇬🇧 English',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'nuowlko3': {
      'uz': '🇰🇿 Қазақша',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'xha4h70o': {
      'uz': '🇰🇬 Кыргызча',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    's8s2ncl8': {
      'uz': '🇹🇷 Türkçe',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '5txxltxm': {
      'uz': '🇦🇪 العربية',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'mx524ur0': {
      'uz': 'Saqlash',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'xj92ev42': {
      'uz': 'Tizimdan chiqish',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'u6b6ciou': {
      'uz': 'Akkauntni oʻchirish',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '8uhntsje': {
      'uz': 'Home',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
  // AiSiriBottomSheet
  {
    '0ga0jiyf': {
      'uz': 'Sizni eshityapman...',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'g7e81nb5': {
      'uz': '✍️ Taom nomini bu yerga yozing...',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '1o2v83pd': {
      'uz': 'Home',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
  // ClientMenuPage
  {
    'ry08iwq9': {
      'uz': 'Palov',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '15xlrsl5': {
      'uz': 'Toʻy Palovi',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'sx8twx3t': {
      'uz': '1',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '1k22bkd5': {
      'uz': 'Home',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
  // ClientCartPage
  {
    'ugb7jak8': {
      'uz': 'Zalda o\'tirish 🍽️',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '7y1a0t6j': {
      'uz': 'Dostavka 🚗',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'bgr4aynw': {
      'uz': 'Sizning Buyurtmalaringiz 🛍️',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    't0eegjuo': {
      'uz': 'To\'y Palovi',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'q8jy6ymi': {
      'uz': '1',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'bwy03ucq': {
      'uz': 'Taomlar summasi:',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ffxytyis': {
      'uz': '45 000 so\'m',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'r5h1si0k': {
      'uz': 'Xizmat haqi (10%):',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'aydo3qnz': {
      'uz': '4 500 so\'m',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ahnpuy9g': {
      'uz': 'Jami to\'lov:',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '8vcz0jwc': {
      'uz': 'SBP orqali to\'lash',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'st8zbqkd': {
      'uz': 'Bank kartasi orqali 💳',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '7tkz3otp': {
      'uz': 'Home',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
  // Miscellaneous
  {
    'u1zzlfh8': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'b9tgvuxv': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'gzpip9af': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'spgfrg5u': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'k2k12u8o': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'vfanq3fs': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'b80evset': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'e3sixbsf': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'b65euyym': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'z4xub53y': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '0dl03equ': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'qt89y9w8': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'jkpur9wg': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'xgxwjadp': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'wh1ve57y': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'gmxfv1lw': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'a9uorwj4': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '8fyhxm8g': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '1301bd0t': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'q9cir59z': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'g3fqpwv1': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '1s5h0jrj': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'zsrmqgue': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'ec0n86bv': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    'qlfjnd7z': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
    '7b7jvjyo': {
      'uz': '',
      'ar': '',
      'en': '',
      'kk': '',
      'ky': '',
      'ru': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
