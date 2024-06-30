import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hxlfjusb': {
      'en': 'Smart Irrigation System ',
      'ar': 'نظام الري الذكي',
    },
    'red20v28': {
      'en': 'Light Mode',
      'ar': 'فاتح',
    },
    'igdljdio': {
      'en': 'Dark Mode',
      'ar': 'داكن',
    },
    'pqtqt00g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Listofvegetables
  {
    '8muyz6ko': {
      'en': 'Search',
      'ar': 'ابحث',
    },
    'b5k2j7lo': {
      'en': 'All',
      'ar': 'الكل',
    },
    '2v1kxbds': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    'fuz4wqaq': {
      'en': 'Rice',
      'ar': 'ارز',
    },
    'gyh50bep': {
      'en': 'Tomatos',
      'ar': 'طماطم',
    },
    '546kjirn': {
      'en': 'Bananas',
      'ar': 'موز',
    },
    '3b7h8w5x': {
      'en': 'Mangoes',
      'ar': 'مانجا',
    },
    'z8mmkd7j': {
      'en': 'Potatoes',
      'ar': 'بطاطس',
    },
    'g4uz8azp': {
      'en': 'Cabbages',
      'ar': 'ملفوف',
    },
    '0zf1r128': {
      'en': 'Sugar Cane',
      'ar': 'قصب السكر',
    },
    'qx0yzrg3': {
      'en': 'Vegetables',
      'ar': 'خضروات',
    },
    'tkr75emp': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    'vlk65rc6': {
      'en': 'Tomatos',
      'ar': 'طماطم',
    },
    'jjynqna2': {
      'en': 'Potatoes',
      'ar': 'بطاطس',
    },
    'exr7wyn8': {
      'en': 'Cabbages',
      'ar': 'ملفوف',
    },
    'susjqcd8': {
      'en': 'Fruits',
      'ar': 'فواكة',
    },
    'ift4z24h': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    '1mkehvlo': {
      'en': 'Tomatos',
      'ar': 'طماطم',
    },
    '3vtfd6bs': {
      'en': 'Bananas',
      'ar': 'موز',
    },
    'wjkkxevh': {
      'en': 'Mangoes',
      'ar': 'مانجا',
    },
    '6mt1fwlc': {
      'en': 'Grain/Seed',
      'ar': 'الحبوب / البذور',
    },
    'wy1aiwr2': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    'cwqt2y8b': {
      'en': 'Rice',
      'ar': 'ارز',
    },
    'owmg422a': {
      'en': 'Tall Grass',
      'ar': 'العشب الطويل',
    },
    '7jzxjo62': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    '6abop6ie': {
      'en': 'Sugar Cane',
      'ar': 'قصب السكر',
    },
    'cjx5pdvx': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    'i62iz0c2': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
    'el98nrc0': {
      'en': 'Lists',
      'ar': 'القوائم',
    },
    'odboayce': {
      'en': 'Sensors',
      'ar': 'الحساسات',
    },
    'idr7tz7y': {
      'en': 'Website',
      'ar': 'موقع الويب',
    },
    'bcagpclk': {
      'en': 'Informations',
      'ar': 'معلومات',
    },
    'rvzzpva0': {
      'en': 'AI Chat',
      'ar': 'دردشة الذكاء الاصطناعي',
    },
    'pkhsfvmt': {
      'en': 'AI Disease Detection',
      'ar': 'الكشف عن الأمراض بالذكاء الاصطناعي',
    },
    'i61nigl2': {
      'en': 'Settings',
      'ar': 'الاعدادات',
    },
    'f86ninod': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
    },
    'by5kfa8j': {
      'en': 'Shop',
      'ar': '',
    },
  },
  // Tomato
  {
    'bbxkjm1j': {
      'en': 'Tomatoes',
      'ar': 'طماطم',
    },
    '31w3flo6': {
      'en': 'Vegetables/Fruits',
      'ar': 'خضروات\\فواكة',
    },
    'r29fg8fh': {
      'en':
          'Tomatoes: The Versatile Crop - Cultivation Challenges and Culinary Controversy',
      'ar': 'الطماطم: المحصول متعدد الاستخدامات – تحديات الزراعة وجدل الطهي',
    },
    'w4nf1bmj': {
      'en':
          'Introduction\n\nTomatoes (Solanum lycopersicum) stand as one of the most widely cultivated and consumed crops globally. Renowned for their vibrant colors, rich flavors, and nutritional value, tomatoes have become a staple in cuisines around the world. Despite their culinary popularity, tomatoes have sparked a botanical debate - are they fruits or vegetables? In this article, we delve into the intricacies of tomato cultivation, exploring the challenges faced by farmers and shedding light on the age-old question of whether tomatoes should be classified as fruits or vegetables.\n\nCultivation Practices\n\nTomatoes are warm-season crops that thrive in well-drained, fertile soils with ample sunlight. Cultivated across diverse climates, from backyard gardens to vast commercial fields, tomatoes require careful attention to ensure a successful harvest. The cultivation process involves several key stages:\n\nSeed Germination and Transplanting:\nTomato cultivation typically begins with the germination of seeds in controlled environments. Once seedlings reach an optimal size, they are transplanted to open fields or greenhouse settings.\n\nSoil Preparation and Planting:\nWell-prepared soil is crucial for healthy tomato plants. Farmers often employ techniques such as mulching to retain moisture and control weeds. Tomatoes can be planted directly into the soil or grown in containers, depending on the scale and method of cultivation.\n\nWatering and Fertilization:\nTomatoes have a high water requirement, especially during fruit development. Adequate irrigation and fertilization are essential for robust plant growth and the production of quality fruits.\n\nDisease and Pest Management:\nTomatoes are susceptible to various diseases and pests. Farmers implement integrated pest management strategies and may use fungicides or pesticides as needed to protect the crops.\n\nPruning and Support:\nTo encourage airflow and sunlight penetration, farmers often prune tomato plants. Additionally, providing support structures such as stakes or cages helps prevent sprawling and facilitates easier harvesting.\n\nChallenges in Tomato Cultivation\n\nWhile tomatoes are a resilient crop, they face several challenges that can impact yield and quality. Some of the primary challenges include:\n\nDiseases:\nTomatoes are vulnerable to diseases like blight, wilt, and viruses. Crop rotation, disease-resistant varieties, and proper sanitation practices are essential to mitigate these risks.\n\nPests:\nCommon pests such as aphids, whiteflies, and hornworms can harm tomato plants. Farmers employ biological controls, insecticides, or companion planting to manage pest populations.\n\nEnvironmental Factors:\nExtreme weather conditions, including excessive heat, cold, or sudden temperature fluctuations, can affect tomato plants. Protective measures such as row covers and selecting appropriate varieties help address these challenges.\n\nSoil Health:\nMaintaining soil fertility is crucial for sustained tomato production. Crop rotation, cover cropping, and organic matter incorporation contribute to soil health.\n\nThe Fruit or Vegetable Controversy\n\nThe question of whether tomatoes are fruits or vegetables has sparked debates in botanical and culinary circles. Botanically speaking, tomatoes are fruits. They develop from the ovary of a flower and contain seeds, meeting the botanical criteria for fruits. However, in culinary terms, tomatoes are often treated as vegetables due to their savory flavor profile and common use in salads, sauces, and savory dishes.\n\nThe Culinary Versatility of Tomatoes\n\nRegardless of their botanical classification, tomatoes are celebrated for their culinary versatility. They come in various shapes, sizes, and colors, with flavors ranging from sweet to tangy. Tomatoes are employed in an array of dishes, including salads, soups, sauces, and sandwiches. The rich umami taste they contribute enhances the depth of flavor in countless recipes.\n\nConclusion\n\nTomatoes, as a global culinary favorite, continue to captivate taste buds and nourish bodies. Their cultivation involves navigating challenges, from pests and diseases to environmental factors. While the fruit or vegetable debate adds a touch of intrigue, what remains indisputable is the indispensable role tomatoes play in kitchens worldwide. As farmers persist in perfecting cultivation techniques, and chefs experiment with innovative recipes, tomatoes remain a symbol of agricultural resilience and culinary creativity.',
      'ar':
          'مقدمة\n\nتعتبر الطماطم (Solanum lycopersicum) واحدة من أكثر المحاصيل المزروعة والمستهلكة على نطاق واسع على مستوى العالم. تشتهر الطماطم بألوانها النابضة بالحياة ونكهاتها الغنية وقيمتها الغذائية، وقد أصبحت عنصرًا أساسيًا في المأكولات حول العالم. على الرغم من شعبيتها في الطهي، أثارت الطماطم جدلاً نباتيًا - هل هي فواكه أم خضروات؟ في هذه المقالة، نتعمق في تعقيدات زراعة الطماطم، ونستكشف التحديات التي يواجهها المزارعون ونسلط الضوء على السؤال القديم حول ما إذا كان ينبغي تصنيف الطماطم على أنها فواكه أم خضروات.\n\nممارسات الزراعة\n\nالطماطم هي محاصيل موسمية دافئة تزدهر في تربة خصبة جيدة التصريف مع ضوء الشمس الكافي. تُزرع الطماطم في مناخات متنوعة، بدءًا من حدائق الفناء الخلفي وحتى الحقول التجارية الشاسعة، وتتطلب اهتمامًا دقيقًا لضمان حصاد ناجح. تتضمن عملية الزراعة عدة مراحل رئيسية:\n\nإنبات البذور وزراعتها:\nتبدأ زراعة الطماطم عادة بإنبات البذور في بيئات خاضعة للرقابة. بمجرد وصول الشتلات إلى الحجم الأمثل، يتم زرعها في الحقول المفتوحة أو في الدفيئات الزراعية.\n\nتحضير التربة وزراعتها:\nتعد التربة المجهزة جيدًا أمرًا بالغ الأهمية لنباتات الطماطم الصحية. غالبًا ما يستخدم المزارعون تقنيات مثل التغطية للحفاظ على الرطوبة والسيطرة على الأعشاب الضارة. يمكن زراعة الطماطم مباشرة في التربة أو زراعتها في أوعية، حسب حجم وطريقة الزراعة.\n\nالري والتسميد:\nتحتاج الطماطم إلى كمية كبيرة من الماء، خاصة أثناء نمو الفاكهة. يعد الري والتسميد المناسبان ضروريين لنمو النبات القوي وإنتاج ثمار عالية الجودة.\n\nإدارة الأمراض والآفات:\nالطماطم عرضة لمختلف الأمراض والآفات. ينفذ المزارعون استراتيجيات متكاملة لإدارة الآفات ويمكنهم استخدام مبيدات الفطريات أو المبيدات الحشرية حسب الحاجة لحماية المحاصيل.\n\nالتقليم والدعم:\nلتشجيع تدفق الهواء واختراق ضوء الشمس، يقوم المزارعون في كثير من الأحيان بتقليم نباتات الطماطم. بالإضافة إلى ذلك، فإن توفير هياكل الدعم مثل الأوتاد أو الأقفاص يساعد على منع الانتشار ويسهل الحصاد.\n\nالتحديات في زراعة الطماطم\n\nعلى الرغم من أن الطماطم محصول مرن، إلا أنها تواجه العديد من التحديات التي يمكن أن تؤثر على المحصول والجودة. وتشمل بعض التحديات الأساسية ما يلي:\n\nالأمراض:\nالطماطم عرضة للأمراض مثل اللفحة والذبول والفيروسات. إن تناوب المحاصيل، والأصناف المقاومة للأمراض، وممارسات الصرف الصحي المناسبة ضرورية للتخفيف من هذه المخاطر.\n\nالآفات:\nيمكن للآفات الشائعة مثل المن والذباب الأبيض والديدان القرنية أن تلحق الضرر بنباتات الطماطم. يستخدم المزارعون الضوابط البيولوجية أو المبيدات الحشرية أو الزراعة المصاحبة لإدارة مجموعات الآفات.\n\nالعوامل البيئية:\nيمكن أن تؤثر الظروف الجوية القاسية، بما في ذلك الحرارة الزائدة أو البرودة أو التقلبات المفاجئة في درجات الحرارة، على نباتات الطماطم. تساعد الإجراءات الوقائية مثل أغطية الصفوف واختيار الأصناف المناسبة في مواجهة هذه التحديات.\n\nصحة التربة:\nيعد الحفاظ على خصوبة التربة أمرًا بالغ الأهمية لإنتاج الطماطم المستدام. يساهم تناوب المحاصيل وتغطية المحاصيل ودمج المواد العضوية في صحة التربة.\n\nجدل الفاكهة أو الخضار\n\nأثارت مسألة ما إذا كانت الطماطم فاكهة أم خضروات نقاشات في دوائر النبات والطهي. من الناحية النباتية، الطماطم هي الفواكه. أنها تتطور من مبيض الزهرة وتحتوي على بذور تلبي المعايير النباتية للفواكه. ومع ذلك، من حيث الطهي، غالبًا ما يتم التعامل مع الطماطم كخضروات نظرًا لنكهتها اللذيذة واستخدامها الشائع في السلطات والصلصات والأطباق المالحة.\n\nتنوع الطهي في الطماطم\n\nبغض النظر عن تصنيفها النباتي، يتم الاحتفال بالطماطم لتنوعها في الطهي. أنها تأتي في مختلف الأشكال والأحجام والألوان، مع نكهات تتراوح من الحلو إلى المنعش. تستخدم الطماطم في مجموعة من الأطباق، بما في ذلك السلطات والحساء والصلصات والسندويشات. يعزز طعم أومامي الغني الذي يساهمون به من عمق النكهة في عدد لا يحصى من الوصفات.\n\nخاتمة\n\nالطماطم، باعتبارها من الأطباق العالمية المفضلة، لا تزال تأسر براعم التذوق وتغذي الأجسام. تنطوي زراعتها على التغلب على التحديات، بدءًا من الآفات والأمراض وحتى العوامل البيئية. في حين أن الجدل الدائر حول الفاكهة أو الخضار يضيف لمسة من الغموض، فإن ما يظل غير قابل للجدل هو الدور الذي لا غنى عنه الذي تلعبه الطماطم في المطابخ في جميع أنحاء العالم. ومع استمرار المزارعين في إتقان تقنيات الزراعة، واختبار الطهاة لوصفات مبتكرة، تظل الطماطم رمزًا للمرونة الزراعية والإبداع في الطهي.',
    },
    'btswmchj': {
      'en': 'Tomatoes',
      'ar': 'طما',
    },
    'zeoerje2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Bananas
  {
    '740d81gn': {
      'en': 'Bananas',
      'ar': 'موز',
    },
    'ylkmpsks': {
      'en': 'Fruits',
      'ar': 'فواكة',
    },
    'h8xfrlel': {
      'en':
          'Bananas: A Global Crop - Cultivation Challenges and the Botanical Dilemma',
      'ar': 'الموز: محصول عالمي – تحديات الزراعة والمعضلة النباتية',
    },
    'm2qak4ds': {
      'en':
          'Introduction\n\nBananas (Musa spp.) are one of the world\'s most popular and widely consumed fruits, renowned for their sweetness, portability, and nutritional value. These elongated, curved fruits have a fascinating history, and their cultivation spans diverse climates and regions. In this article, we explore the intricacies of banana cultivation, shedding light on the challenges faced by farmers and addressing the persistent question of whether bananas should be classified as fruits or vegetables.\n\nCultivation Practices\n\nBanana cultivation is a complex process that involves specific practices to ensure a successful harvest. Key stages in banana cultivation include:\n\n1. **Selection of Varieties:**\n   There are various banana varieties, each suited to different growing conditions and purposes. Common varieties include dessert bananas (such as the Cavendish), cooking bananas (like plantains), and specialized varieties for industrial use.\n\n2. **Soil and Climate Requirements:**\n   Bananas thrive in tropical and subtropical climates with well-drained, fertile soils. They require consistent warmth, adequate sunlight, and protection from strong winds. Bananas are often grown at varying elevations, contributing to the diversity of cultivation regions.\n\n3. **Planting and Propagation:**\n   Banana plants are typically propagated through suckers, which are young shoots that emerge from the base of the parent plant. These suckers are carefully selected and replanted to establish new banana crops.\n\n4. **Fertilization and Irrigation:**\n   Bananas are heavy feeders and require regular fertilization to support their rapid growth. Adequate irrigation is crucial, especially during dry periods, to ensure optimal fruit development.\n\n5. **Disease and Pest Management:**\n   Bananas are susceptible to diseases such as Panama disease and pests like nematodes and weevils. Farmers employ strategies such as crop rotation, pest-resistant varieties, and chemical treatments to protect banana crops.\n\nChallenges in Banana Cultivation\n\nBanana cultivation faces several challenges that can significantly impact yield and the sustainability of this important crop:\n\n1. **Panama Disease:**\n   The spread of Panama disease, caused by the Fusarium wilt fungus, poses a severe threat to banana plantations. Resistant banana varieties and strict quarantine measures are essential to combat this devastating disease.\n\n2. **Biotic and Abiotic Stresses:**\n   Bananas are sensitive to environmental stresses, including drought, flooding, and high winds. Climate change exacerbates these challenges, necessitating adaptation strategies to ensure resilient banana farming.\n\n3. **Market Volatility:**\n   The global banana industry is marked by market volatility, with factors such as trade policies, economic conditions, and transportation costs influencing prices. This can impact the livelihoods of banana farmers, particularly those in developing countries.\n\nThe Fruit or Vegetable Dilemma\n\nBananas, like tomatoes, fall into the botanical category of fruits. They develop from the ovaries of flowers and contain seeds, meeting the botanical definition of fruits. However, in culinary terms, bananas are often regarded as fruits due to their sweet flavor and common consumption as a snack or dessert.\n\nConclusion\n\nBananas hold a unique position in global agriculture, combining economic importance with nutritional value. Their cultivation, while facing challenges like disease and market fluctuations, remains vital for the livelihoods of millions of farmers worldwide. Whether categorized as fruits or vegetables, bananas continue to be a staple in diets across the globe, showcasing their adaptability and significance in the diverse tapestry of agriculture and culinary traditions. As researchers and farmers collaborate to address cultivation challenges, bananas are likely to maintain their status as a beloved and essential crop for years to come.',
      'ar':
          'مقدمة\n\nيعد الموز (Musa spp.) واحدًا من أكثر الفواكه شعبيةً واستهلاكًا على نطاق واسع في العالم، ويشتهر بحلاوته وسهولة حمله وقيمته الغذائية. تتمتع هذه الثمار الطويلة والمنحنية بتاريخ رائع، وتمتد زراعتها إلى مناخات ومناطق متنوعة. في هذه المقالة، نستكشف تعقيدات زراعة الموز، ونسلط الضوء على التحديات التي يواجهها المزارعون ونعالج السؤال المستمر حول ما إذا كان ينبغي تصنيف الموز على أنه فواكه أم خضروات.\n\nممارسات الزراعة\n\nزراعة الموز هي عملية معقدة تنطوي على ممارسات محددة لضمان حصاد ناجح. تشمل المراحل الرئيسية في زراعة الموز ما يلي:\n\n1. **اختيار الأصناف:**\n    هناك العديد من أصناف الموز، كل منها يناسب ظروف وأغراض النمو المختلفة. تشمل الأصناف الشائعة موز الحلوى (مثل كافنديش)، وموز الطبخ (مثل الموز)، والأصناف المتخصصة للاستخدام الصناعي.\n\n2. **متطلبات التربة والمناخ:**\n    يزدهر الموز في المناخات الاستوائية وشبه الاستوائية ذات التربة الخصبة جيدة التصريف. إنها تتطلب دفءًا ثابتًا وضوء الشمس الكافي والحماية من الرياح القوية. غالبًا ما يُزرع الموز على ارتفاعات مختلفة، مما يساهم في تنوع مناطق الزراعة.\n\n3. **الزراعة والإكثار:**\n    عادة ما يتم نشر نباتات الموز من خلال المصاصات، وهي براعم صغيرة تخرج من قاعدة النبات الأم. يتم اختيار هؤلاء المصاصون بعناية وإعادة زراعتهم لإنشاء محاصيل موز جديدة.\n\n4. **التسميد والري:**\n    الموز عبارة عن مغذيات ثقيلة ويتطلب تسميدًا منتظمًا لدعم نموه السريع. يعد الري المناسب أمرًا بالغ الأهمية، خاصة خلال فترات الجفاف، لضمان النمو الأمثل للفاكهة.\n\n5. **إدارة الأمراض والآفات:**\n    الموز عرضة لأمراض مثل مرض بنما والآفات مثل الديدان الخيطية والسوس. يستخدم المزارعون استراتيجيات مثل تناوب المحاصيل، والأصناف المقاومة للآفات، والعلاجات الكيميائية لحماية محاصيل الموز.\n\nالتحديات في زراعة الموز\n\nتواجه زراعة الموز العديد من التحديات التي يمكن أن تؤثر بشكل كبير على إنتاجية واستدامة هذا المحصول المهم:\n\n1. **مرض بنما:**\n    يشكل انتشار مرض بنما، الناجم عن فطر ذبول الفيوزاريوم، تهديدًا خطيرًا لمزارع الموز. وتعد أصناف الموز المقاومة وتدابير الحجر الصحي الصارمة ضرورية لمكافحة هذا المرض المدمر.\n\n2. **الضغوط الحيوية واللاأحيائية:**\n    الموز حساس للضغوط البيئية، بما في ذلك الجفاف والفيضانات والرياح العاتية. ويؤدي تغير المناخ إلى تفاقم هذه التحديات، مما يستلزم استراتيجيات التكيف لضمان مرونة زراعة الموز.\n\n3. **تقلبات السوق:**\n    تتميز صناعة الموز العالمية بتقلبات السوق، حيث تؤثر عوامل مثل السياسات التجارية والظروف الاقتصادية وتكاليف النقل على الأسعار. ويمكن أن يؤثر ذلك على سبل عيش مزارعي الموز، وخاصة في البلدان النامية.\n\nمعضلة الفاكهة أو الخضار\n\nالموز، مثل الطماطم، يقع ضمن فئة الفواكه النباتية. أنها تتطور من المبايض من الزهور وتحتوي على بذور، تلبية التعريف النباتي للفواكه. ومع ذلك، من حيث الطهي، غالبًا ما يُنظر إلى الموز على أنه فاكهة بسبب نكهته الحلوة واستهلاكه الشائع كوجبة خفيفة أو حلوى.\n\nخاتمة\n\nويحتل الموز مكانة فريدة في الزراعة العالمية، حيث يجمع بين الأهمية الاقتصادية والقيمة الغذائية. ورغم أن زراعتها تواجه تحديات مثل الأمراض وتقلبات السوق، إلا أنها تظل حيوية بالنسبة لسبل عيش الملايين من المزارعين في جميع أنحاء العالم. سواء تم تصنيف الموز على أنه فواكه أو خضراوات، لا يزال الموز عنصرًا أساسيًا في الأنظمة الغذائية في جميع أنحاء العالم، مما يُظهر قدرته على التكيف وأهميته في النسيج المتنوع للزراعة وتقاليد الطهي. ومع تعاون الباحثين والمزارعين لمواجهة تحديات الزراعة، من المرجح أن يحافظ الموز على مكانته كمحصول محبوب وأساسي لسنوات قادمة.',
    },
    'dk2m8y17': {
      'en': 'Bananas',
      'ar': 'موز',
    },
    'kxf6ry1l': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Rice
  {
    'e70m6hr3': {
      'en': 'Rice',
      'ar': 'ارز',
    },
    'a98t4rab': {
      'en': 'Grain/Seed',
      'ar': 'الحبوب / البذور',
    },
    '8ry164ex': {
      'en': 'Rice Cultivation: Nourishing the World, Overcoming Challenges',
      'ar': 'زراعة الأرز: تغذية العالم، تجاوز التحديات',
    },
    'yycfvdba': {
      'en':
          'Introduction\n\nRice (Oryza sativa) stands as a paramount staple food for a significant portion of the world\'s population. As a versatile and nutrient-rich crop, rice plays a crucial role in global food security. This article explores the intricate world of rice cultivation, highlighting the challenges faced by farmers and examining the botanical classification of rice in the context of whether it is a fruit or a vegetable.\n\nCultivation Practices\n\nRice cultivation is a labor-intensive process that varies across different regions and climates. The cultivation practices for rice can be broadly divided into several key stages:\n\nLand Preparation:\nRice fields, often referred to as paddies, require meticulous preparation. Fields are leveled to ensure uniform water distribution, and bunds or dikes are constructed to control water levels during cultivation.\n\nSeed Selection and Germination:\nFarmers select high-quality seeds based on factors such as variety, disease resistance, and yield potential. Seeds are germinated in nurseries before being transplanted to the main fields.\n\nTransplanting or Direct Seeding:\nDepending on the method used, rice can be transplanted or directly seeded. Transplanting involves moving young seedlings from nurseries to the main fields, while direct seeding involves sowing seeds directly into the soil.\n\nWater Management:\nRice is unique among crops in its cultivation under flooded conditions. Water management is critical to rice cultivation, with controlled flooding providing ideal conditions for growth and discouraging weed competition.\n\nFertilization and Pest Control:\nRice plants require adequate nutrients for optimal growth. Fertilizers are applied as needed, and pest control measures are implemented to protect the crop from insects and diseases.\n\nChallenges in Rice Cultivation\n\nRice cultivation faces several challenges that impact yield, sustainability, and the livelihoods of farmers:\n\nWater Scarcity:\nWhile rice traditionally thrives in flooded conditions, water scarcity poses a significant challenge. Water-efficient cultivation practices, such as the System of Rice Intensification (SRI), aim to address this issue.\n\nPest and Disease Management:\nRice is susceptible to pests like the brown planthopper and diseases such as blast and bacterial blight. Integrated pest management strategies and the development of disease-resistant varieties are crucial for sustainable cultivation.\n\nClimate Change:\nChanging weather patterns, including altered precipitation and temperature extremes, affect rice cultivation. Developing climate-resilient varieties and sustainable water management practices are essential adaptations.\n\nLand Degradation:\nIntensive rice cultivation practices can lead to soil degradation, affecting long-term productivity. Crop rotation, agroforestry, and organic farming methods are employed to mitigate soil degradation.\n\nFruit or Vegetable?\n\nBotanically speaking, rice is classified as a cereal grain and, more specifically, as a grass. In botanical terms, rice grains are considered seeds, not fruits or vegetables. However, in culinary and dietary contexts, rice is often categorized as a grain rather than a fruit or vegetable.\n\nConclusion\n\nRice cultivation\'s global significance cannot be overstated, as it serves as a fundamental food source for billions of people. Overcoming challenges in rice cultivation requires a multidimensional approach, combining technological innovation, sustainable practices, and international collaboration. While debates over botanical classification persist, the practical importance of rice in global diets and agricultural economies underscores its position as a vital crop. As we navigate the complexities of rice cultivation, the quest for sustainable practices and resilient varieties remains imperative to ensure a future where rice continues to nourish communities worldwide.\n\n',
      'ar':
          'مقدمة\n\nيمثل الأرز (Oryza sativa) غذاءً أساسيًا أساسيًا لجزء كبير من سكان العالم. باعتباره محصولًا متعدد الاستخدامات وغنيًا بالمغذيات، يلعب الأرز دورًا حاسمًا في الأمن الغذائي العالمي. يستكشف هذا المقال العالم المعقد لزراعة الأرز، ويسلط الضوء على التحديات التي يواجهها المزارعون ويفحص التصنيف النباتي للأرز في سياق ما إذا كان فاكهة أم خضروات.\n\nممارسات الزراعة\n\nزراعة الأرز هي عملية كثيفة العمالة وتختلف باختلاف المناطق والمناخات. يمكن تقسيم ممارسات زراعة الأرز بشكل عام إلى عدة مراحل رئيسية:\n\nإعداد الأرض:\nتتطلب حقول الأرز، التي يشار إليها غالبًا باسم حقول الأرز، تحضيرًا دقيقًا. ويتم تسوية الحقول لضمان التوزيع الموحد للمياه، ويتم إنشاء السدود أو السدود للتحكم في مستويات المياه أثناء الزراعة.\n\nاختيار البذور وإنباتها:\nويختار المزارعون بذورًا عالية الجودة بناءً على عوامل مثل التنوع ومقاومة الأمراض وإمكانات الإنتاج. تنبت البذور في المشاتل قبل زراعتها في الحقول الرئيسية.\n\nالزرع أو البذر المباشر:\nاعتمادًا على الطريقة المستخدمة، يمكن زرع الأرز أو بذره مباشرة. تتضمن عملية الزرع نقل الشتلات الصغيرة من المشاتل إلى الحقول الرئيسية، في حين أن البذر المباشر ينطوي على زرع البذور مباشرة في التربة.\n\nادارة المياه:\nيعتبر الأرز فريدًا بين المحاصيل في زراعته تحت ظروف الفيضانات. تعد إدارة المياه أمرًا بالغ الأهمية لزراعة الأرز، حيث توفر الفيضانات الخاضعة للرقابة ظروفًا مثالية للنمو وتثبيط منافسة الأعشاب الضارة.\n\nالتسميد ومكافحة الآفات:\nتتطلب نباتات الأرز العناصر الغذائية الكافية لتحقيق النمو الأمثل. ويتم استخدام الأسمدة حسب الحاجة، ويتم تنفيذ تدابير مكافحة الآفات لحماية المحصول من الحشرات والأمراض.\n\nالتحديات في زراعة الأرز\n\nتواجه زراعة الأرز العديد من التحديات التي تؤثر على إنتاجية المزارعين واستدامتهم وسبل عيشهم:\n\nندرة المياه:\nوبينما يزدهر الأرز عادة في ظروف الفيضانات، فإن ندرة المياه تشكل تحدياً كبيراً. وتهدف ممارسات الزراعة الموفرة للمياه، مثل نظام تكثيف الأرز، إلى معالجة هذه المشكلة.\n\nإدارة الآفات والأمراض:\nالأرز عرضة للآفات مثل نطاط النبات البني وأمراض مثل الانفجار واللفحة البكتيرية. تعد استراتيجيات الإدارة المتكاملة للآفات وتطوير أصناف مقاومة للأمراض أمرًا بالغ الأهمية للزراعة المستدامة.\n\nتغير المناخ:\nتؤثر أنماط الطقس المتغيرة، بما في ذلك تغير هطول الأمطار ودرجات الحرارة القصوى، على زراعة الأرز. يعد تطوير أصناف قادرة على التكيف مع المناخ وممارسات الإدارة المستدامة للمياه من التكيفات الأساسية.\n\nتدهور الأراضي:\nيمكن أن تؤدي ممارسات زراعة الأرز المكثفة إلى تدهور التربة، مما يؤثر على الإنتاجية على المدى الطويل. يتم استخدام أساليب تناوب المحاصيل والحراجة الزراعية والزراعة العضوية للتخفيف من تدهور التربة.\n\nالفاكهة أو الخضار؟\n\nمن الناحية النباتية، يُصنف الأرز على أنه من الحبوب، وبشكل أكثر تحديدًا، على أنه عشب. من الناحية النباتية، تعتبر حبوب الأرز بذورا، وليست فواكه أو خضروات. ومع ذلك، في سياقات الطهي والتغذية، غالبًا ما يتم تصنيف الأرز على أنه حبة وليس فاكهة أو خضروات.\n\nخاتمة\n\nلا يمكن المبالغة في تقدير الأهمية العالمية لزراعة الأرز، فهي بمثابة مصدر غذائي أساسي لمليارات البشر. ويتطلب التغلب على التحديات في زراعة الأرز اتباع نهج متعدد الأبعاد، يجمع بين الابتكار التكنولوجي، والممارسات المستدامة، والتعاون الدولي. وبينما تستمر المناقشات حول التصنيف النباتي، فإن الأهمية العملية للأرز في النظم الغذائية العالمية والاقتصادات الزراعية تؤكد مكانته كمحصول حيوي. وبينما نتعامل مع تعقيدات زراعة الأرز، يظل البحث عن ممارسات مستدامة وأصناف مرنة أمرًا ضروريًا لضمان مستقبل يستمر فيه الأرز في تغذية المجتمعات في جميع أنحاء العالم.',
    },
    'shrvdd2d': {
      'en': 'Rice',
      'ar': 'ارز',
    },
    'nfif46qr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Mangoes
  {
    '31pxfr6u': {
      'en': 'Mangoes',
      'ar': 'مانجا',
    },
    'a0x6ag5f': {
      'en': 'Fruits',
      'ar': 'فواكة',
    },
    'tktjwcua': {
      'en':
          'Mangoes: A Tropical Delight - Cultivation Challenges and the Fruit or Vegetable Conundrum',
      'ar': 'المانجو: لذة استوائية - تحديات الزراعة ولغز الفاكهة أو الخضار',
    },
    'beslhucf': {
      'en':
          'Introduction\n\nMangoes (Mangifera indica) stand as a luscious testament to the abundance of tropical regions, delighting palates with their sweet, juicy flesh. As one of the most widely consumed fruits globally, mangoes have a rich cultural and culinary significance. This article delves into the intricate world of mango cultivation, exploring the challenges faced by farmers and addressing the age-old question of whether mangoes should be classified as fruits or vegetables.\n\nCultivation Practices\n\nMango cultivation is an art that demands careful attention to the specific needs of these tropical trees. Key stages in the cultivation of mangoes include:\n\nVarietal Selection:\nThere are numerous mango varieties, each with its unique flavor, size, and color. Farmers select varieties based on climate suitability, market demand, and intended use, whether for fresh consumption, processing, or export.\n\nClimate and Soil Requirements:\nMangoes thrive in tropical and subtropical climates with well-drained, sandy loam soils. They are sensitive to frost, making them predominantly cultivated in regions where temperatures do not drop below freezing.\n\nPropagation:\nMango trees are propagated through seeds, grafting, or budding. Grafted trees often yield fruits more quickly than those grown from seeds, providing economic advantages for commercial cultivation.\n\nPruning and Training:\nProper pruning and training of mango trees are essential for maintaining an open canopy, allowing sunlight to penetrate and air circulation to reduce disease incidence. Pruning also helps shape the trees for easier harvesting.\n\nIrrigation and Fertilization:\nMango trees require regular watering, especially during flowering and fruit development. Fertilization practices aim to provide essential nutrients, enhancing the tree\'s growth and fruiting capabilities.\n\nChallenges in Mango Cultivation\n\nDespite the popularity of mangoes, cultivation comes with its set of challenges that can impact both quantity and quality of the harvest:\n\nDisease and Pests:\nMango trees are susceptible to diseases like anthracnose and powdery mildew, as well as pests such as mango fruit fly and scales. Integrated pest management strategies and timely application of fungicides are crucial for disease control.\n\nClimate Variability:\nMango flowering and fruiting are highly sensitive to climatic conditions. Unpredictable weather patterns, including untimely rains or heatwaves, can affect flowering, leading to irregular fruiting patterns and affecting yield.\n\nPost-Harvest Handling:\nProper post-harvest practices are essential to maintain the quality of mangoes. Rapid cooling, controlled atmosphere storage, and careful handling during transportation are vital to prevent spoilage and extend shelf life.\n\nFruit or Vegetable?\n\nBotanically speaking, mangoes are classified as fruits. They develop from the ovary of a flower, contain seeds, and meet the botanical criteria for fruits. However, in culinary terms, mangoes are often treated as fruits due to their sweet and tropical flavor profile. The distinction between fruits and vegetables is particularly relevant when considering their culinary uses, with mangoes finding a place in both sweet and savory dishes.\n\nConclusion\n\nMango cultivation represents a harmonious interplay of climate, soil, and agricultural practices, producing a fruit that has become synonymous with tropical indulgence. While challenges persist in the cultivation process, the global demand for mangoes continues to drive innovation and sustainability in farming practices. Whether enjoyed fresh, in smoothies, or as part of exotic recipes, mangoes have secured their place as a beloved fruit worldwide. As agriculture evolves to meet the demands of a growing population, the cultivation of mangoes remains a testament to the resilience and adaptability of farmers in the face of challenges.',
      'ar':
          'مقدمة\n\nتعتبر المانجو (Mangifera indica) بمثابة شهادة فاتنة على وفرة المناطق الاستوائية، حيث تُبهج الأذواق بلحمها الحلو والعصير. باعتبارها واحدة من أكثر الفواكه استهلاكًا على نطاق واسع على مستوى العالم، تتمتع المانجو بأهمية ثقافية وطهوية غنية. تتعمق هذه المقالة في عالم زراعة المانجو المعقد، وتستكشف التحديات التي يواجهها المزارعون وتتناول السؤال القديم حول ما إذا كان ينبغي تصنيف المانجو على أنها فواكه أم خضروات.\n\nممارسات الزراعة\n\nزراعة المانجو هي فن يتطلب اهتمامًا دقيقًا بالاحتياجات المحددة لهذه الأشجار الاستوائية. المراحل الرئيسية في زراعة المانجو تشمل:\n\nاختيار الصنف:\nهناك العديد من أصناف المانجو، ولكل منها نكهته وحجمه ولونه الفريد. ويختار المزارعون الأصناف بناءً على ملاءمة المناخ وطلب السوق والاستخدام المقصود، سواء للاستهلاك الطازج أو المعالجة أو التصدير.\n\nمتطلبات المناخ والتربة:\nتزدهر المانجو في المناخات الاستوائية وشبه الاستوائية مع تربة طينية رملية جيدة التصريف. وهي حساسة للصقيع، مما يجعلها تزرع في الغالب في المناطق التي لا تنخفض فيها درجات الحرارة إلى ما دون درجة التجمد.\n\nالانتشار:\nيتم نشر أشجار المانجو عن طريق البذور، أو التطعيم، أو البراعم. غالبًا ما تنتج الأشجار المطعمة ثمارًا بسرعة أكبر من تلك المزروعة من البذور، مما يوفر مزايا اقتصادية للزراعة التجارية.\n\nالتقليم والتدريب:\nيعد التقليم المناسب وتدريب أشجار المانجو أمرًا ضروريًا للحفاظ على مظلة مفتوحة، مما يسمح لأشعة الشمس بالاختراق وتدوير الهواء لتقليل الإصابة بالأمراض. يساعد التقليم أيضًا في تشكيل الأشجار لتسهيل الحصاد.\n\nالري والتسميد:\nتتطلب أشجار المانجو سقاية منتظمة، خاصة أثناء الإزهار ونمو الفاكهة. تهدف ممارسات التسميد إلى توفير العناصر الغذائية الأساسية، وتعزيز نمو الشجرة وقدراتها على الإثمار.\n\nالتحديات في زراعة المانجو\n\nعلى الرغم من شعبية المانجو، إلا أن زراعتها تأتي مع مجموعة من التحديات التي يمكن أن تؤثر على كمية ونوعية المحصول:\n\nالأمراض والآفات:\nأشجار المانجو عرضة لأمراض مثل الأنثراكنوز والبياض الدقيقي، وكذلك الآفات مثل ذبابة فاكهة المانجو والقشور. تعتبر الاستراتيجيات المتكاملة لإدارة الآفات وتطبيق مبيدات الفطريات في الوقت المناسب أمرًا بالغ الأهمية لمكافحة الأمراض.\n\nتقلب المناخ:\nتتميز أزهار المانجو وإثمارها بحساسية عالية للظروف المناخية. يمكن أن تؤثر أنماط الطقس غير المتوقعة، بما في ذلك هطول الأمطار في غير وقتها أو موجات الحر، على الإزهار، مما يؤدي إلى أنماط إثمار غير منتظمة ويؤثر على المحصول.\n\nالتعامل مع ما بعد الحصاد:\nتعتبر ممارسات ما بعد الحصاد المناسبة ضرورية للحفاظ على جودة المانجو. يعد التبريد السريع والتخزين المتحكم فيه في الجو والتعامل الدقيق أثناء النقل أمرًا حيويًا لمنع التلف وإطالة العمر الافتراضي.\n\nالفاكهة أو الخضار؟\n\nمن الناحية النباتية، تصنف المانجو ضمن الفواكه. أنها تتطور من مبيض الزهرة، وتحتوي على بذور، وتفي بالمعايير النباتية للفواكه. ومع ذلك، من حيث الطهي، غالبًا ما يتم التعامل مع المانجو على أنها فواكه نظرًا لنكهتها الحلوة والاستوائية. يعتبر التمييز بين الفواكه والخضروات ذا أهمية خاصة عند النظر في استخداماتها في الطهي، حيث تجد المانجو مكانًا في الأطباق الحلوة والمالحة.\n\nخاتمة\n\nتمثل زراعة المانجو تفاعلًا متناغمًا بين المناخ والتربة والممارسات الزراعية، مما يؤدي إلى إنتاج فاكهة أصبحت مرادفة للمتعة الاستوائية. في حين أن التحديات لا تزال قائمة في عملية الزراعة، فإن الطلب العالمي على المانجو لا يزال يدفع الابتكار والاستدامة في الممارسات الزراعية. سواء كنت تستمتع بها طازجة أو في العصائر أو كجزء من الوصفات الغريبة، فقد ضمنت المانجو مكانتها كفاكهة محببة في جميع أنحاء العالم. ومع تطور الزراعة لتلبية متطلبات العدد المتزايد من السكان، تظل زراعة المانجو شهادة على مرونة المزارعين وقدرتهم على التكيف في مواجهة التحديات.',
    },
    't77jd088': {
      'en': 'Mangoes',
      'ar': 'مانجا',
    },
    '2fcj4xm1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Potatoes
  {
    'raqin2k4': {
      'en': 'Potatoes ',
      'ar': 'بطاطس',
    },
    'cujddppg': {
      'en': 'Vegetables',
      'ar': 'خضروات',
    },
    'awy821ak': {
      'en':
          'Potatoes: A Global Staple - Cultivation Challenges and the Fruit or Vegetable Conundrum',
      'ar': 'البطاطس: عنصر أساسي عالمي - تحديات الزراعة ولغز الفاكهة أو الخضار',
    },
    'v909g59k': {
      'en':
          'Introduction\n\nPotatoes (Solanum tuberosum) have earned their place as a dietary staple around the world, providing a versatile and nutritious source of carbohydrates. From mashed potatoes to fries and beyond, this humble tuber has become a fundamental ingredient in countless cuisines. In this article, we delve into the intricate world of potato cultivation, exploring the challenges faced by farmers and addressing the question of whether potatoes should be classified as fruits or vegetables.\n\nCultivation Practices\n\nPotato cultivation involves a series of precise steps to ensure a successful harvest. Key stages in the cultivation of potatoes include:\n\nSeed Potato Selection:\nPotatoes are typically grown from seed potatoes, which are tubers saved from the previous season\'s crop. Farmers carefully select disease-free and high-quality seed potatoes to ensure healthy plant development.\n\nPlanting:\nPotatoes are planted in well-drained soil, usually in the spring. The planting process involves placing seed potatoes in trenches or holes and covering them with soil. Adequate spacing allows the plants to develop without crowding.\n\nHilling:\nAs potato plants grow, farmers \"hill\" or mound soil around the base of the plants. This practice helps protect developing tubers from exposure to sunlight, which can cause them to turn green and produce solanine, a toxic compound.\n\nWatering and Fertilization:\nPotatoes require consistent moisture, and irrigation is crucial, especially during dry periods. Fertilizers are applied to provide essential nutrients, with careful monitoring to avoid over-fertilization, which can lead to quality issues.\n\nDisease and Pest Management:\nPotatoes are susceptible to diseases like late blight and pests such as Colorado potato beetles. Farmers implement integrated pest management strategies, including the use of resistant varieties and timely application of fungicides.\n\nChallenges in Potato Cultivation\n\nPotato cultivation faces several challenges that can impact yield and the overall success of the crop:\n\nDisease Pressure:\nPotatoes are susceptible to various diseases, including late blight, early blight, and bacterial wilt. Managing these diseases requires vigilant monitoring, crop rotation, and the use of disease-resistant varieties.\n\nPest Infestations:\nInsects such as Colorado potato beetles, aphids, and wireworms pose a threat to potato crops. Farmers employ cultural practices, biological controls, and, if necessary, insecticides to manage pest populations.\n\nEnvironmental Factors:\nWeather conditions, including unseasonal frosts and excessive rainfall, can impact potato cultivation. Adequate drainage and appropriate planting times help mitigate risks associated with adverse weather events.\n\nStorage Challenges:\nPost-harvest storage is critical for potatoes, as they are susceptible to bruising, sprouting, and diseases during storage. Proper storage facilities and conditions, including temperature and humidity control, are essential to preserve potato quality.\n\nFruit or Vegetable?\n\nBotanically speaking, potatoes are classified as tubers, which are modified underground stems. However, in culinary terms, potatoes are commonly referred to as vegetables. The confusion arises because they are starchy and savory, similar to many vegetables, yet they are botanically distinct from vegetables like leafy greens or roots.\n\nConclusion\n\nPotatoes, with their rich history and widespread cultivation, play a pivotal role in global agriculture and diets. The challenges faced by potato farmers underscore the importance of sustainable and resilient cultivation practices. Whether classified as fruits, vegetables, or tubers, potatoes continue to be a versatile and essential component of diverse cuisines worldwide. As agriculture advances to meet the demands of a growing population and changing climate, the cultivation of potatoes remains a testament to the adaptability and ingenuity of farmers committed to sustaining this vital crop.',
      'ar':
          'مقدمة\n\nاكتسبت البطاطس (Solanum tuberosum) مكانتها كعنصر غذائي أساسي في جميع أنحاء العالم، حيث توفر مصدرًا متنوعًا ومغذيًا للكربوهيدرات. من البطاطس المهروسة إلى البطاطس المقلية وغيرها، أصبحت هذه الدرنة المتواضعة عنصرًا أساسيًا في عدد لا يحصى من المأكولات. في هذه المقالة، نتعمق في عالم زراعة البطاطس المعقد، ونستكشف التحديات التي يواجهها المزارعون ونتناول مسألة ما إذا كان ينبغي تصنيف البطاطس على أنها فواكه أم خضروات.\n\nممارسات الزراعة\n\nتتضمن زراعة البطاطس سلسلة من الخطوات الدقيقة لضمان حصاد ناجح. تشمل المراحل الرئيسية في زراعة البطاطس ما يلي:\n\nاختيار بذور البطاطس:\nتُزرع البطاطس عادةً من بذور البطاطس، وهي عبارة عن درنات محفوظة من محصول الموسم السابق. يقوم المزارعون باختيار بذور بطاطس خالية من الأمراض وعالية الجودة بعناية لضمان نمو صحي للنبات.\n\nيزرع:\nتزرع البطاطس في تربة جيدة التصريف، عادة في فصل الربيع. تتضمن عملية الزراعة وضع بذور البطاطس في خنادق أو حفر وتغطيتها بالتربة. تسمح المسافات الكافية للنباتات بالتطور دون ازدحام.\n\nهيلينج:\nمع نمو نباتات البطاطس، يقوم المزارعون بتكوين تلال أو أكوام من التربة حول قاعدة النباتات. تساعد هذه الممارسة على حماية الدرنات النامية من التعرض لأشعة الشمس، مما قد يتسبب في تحولها إلى اللون الأخضر وإنتاج السولانين، وهو مركب سام.\n\nالري والتسميد:\nتتطلب البطاطس رطوبة ثابتة، والري أمر بالغ الأهمية، خاصة خلال فترات الجفاف. يتم استخدام الأسمدة لتوفير العناصر الغذائية الأساسية، مع مراقبة دقيقة لتجنب الإفراط في التسميد، مما قد يؤدي إلى مشاكل في الجودة.\n\nإدارة الأمراض والآفات:\nالبطاطس عرضة لأمراض مثل اللفحة المتأخرة والآفات مثل خنافس البطاطس في كولورادو. وينفذ المزارعون استراتيجيات متكاملة لإدارة الآفات، بما في ذلك استخدام أصناف مقاومة واستخدام مبيدات الفطريات في الوقت المناسب.\n\nالتحديات في زراعة البطاطس\n\nتواجه زراعة البطاطس العديد من التحديات التي يمكن أن تؤثر على المحصول والنجاح العام للمحصول:\n\nضغط المرض:\nالبطاطس عرضة للأمراض المختلفة، بما في ذلك اللفحة المتأخرة واللفحة المبكرة والذبول البكتيري. وتتطلب إدارة هذه الأمراض مراقبة يقظة وتناوب المحاصيل واستخدام أصناف مقاومة للأمراض.\n\nالإصابة بالآفات:\nتشكل الحشرات مثل خنافس البطاطس في كولورادو، والمن، والديدان السلكية تهديدًا لمحاصيل البطاطس. يستخدم المزارعون الممارسات الثقافية، والضوابط البيولوجية، وإذا لزم الأمر، المبيدات الحشرية لإدارة أعداد الآفات.\n\nالعوامل البيئية:\nيمكن أن تؤثر الظروف الجوية، بما في ذلك الصقيع غير الموسمي والأمطار الغزيرة، على زراعة البطاطس. يساعد الصرف الكافي وأوقات الزراعة المناسبة في تخفيف المخاطر المرتبطة بالأحداث الجوية السيئة.\n\nتحديات التخزين:\nيعد التخزين بعد الحصاد أمرًا بالغ الأهمية بالنسبة للبطاطس، لأنها عرضة للكدمات والتبرعم والأمراض أثناء التخزين. تعتبر مرافق وظروف التخزين المناسبة، بما في ذلك التحكم في درجة الحرارة والرطوبة، ضرورية للحفاظ على جودة البطاطس.\n\nالفاكهة أو الخضار؟\n\nمن الناحية النباتية، تُصنف البطاطس على أنها درنات، وهي عبارة عن سيقان معدلة تحت الأرض. ومع ذلك، في مصطلحات الطهي، يشار إلى البطاطس عادة باسم الخضروات. ينشأ الالتباس لأنها نشوية ولذيذة، تشبه العديد من الخضروات، ولكنها تختلف نباتيًا عن الخضروات مثل الخضروات الورقية أو الجذور.\n\nخاتمة\n\nتلعب البطاطس، بتاريخها الغني وزراعتها واسعة النطاق، دورًا محوريًا في الزراعة والنظم الغذائية العالمية. تؤكد التحديات التي يواجهها مزارعو البطاطس على أهمية ممارسات الزراعة المستدامة والقادرة على الصمود. سواء تم تصنيفها على أنها فواكه أو خضروات أو درنات، تظل البطاطس مكونًا متعدد الاستخدامات وأساسيًا في المأكولات المتنوعة في جميع أنحاء العالم. ومع تقدم الزراعة لتلبية متطلبات العدد المتزايد من السكان وتغير المناخ، تظل زراعة البطاطس شهادة على قدرة المزارعين على التكيف وإبداعهم الملتزمين بالحفاظ على هذا المحصول الحيوي.',
    },
    'p6tch23a': {
      'en': 'Potatoes ',
      'ar': 'بطاطس',
    },
    'j3lxr3z1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Cabbage
  {
    'ucw1n2qz': {
      'en': 'Cabbage',
      'ar': 'ملفوف',
    },
    '3gj009lb': {
      'en': 'Vegetables',
      'ar': 'خضروات',
    },
    'fy3c52ue': {
      'en':
          'Cabbages: Nurturing Nutrition and Tradition - Cultivation Challenges and the Fruit or Vegetable Debate',
      'ar':
          'الملفوف: تغذية التغذية والتقاليد - تحديات الزراعة ومناقشة الفاكهة أو الخضار',
    },
    'gvx8jusj': {
      'en':
          'Introduction\n\nCabbages (Brassica oleracea var. capitata) stand as cruciferous champions in the world of vegetables, renowned for their versatility, nutritional value, and cultural significance. Whether enjoyed raw in salads, cooked in stir-fries, or fermented into sauerkraut, cabbages are a dietary staple that has been cultivated for centuries. In this article, we delve into the intricacies of cabbage cultivation, exploring the challenges faced by farmers and addressing the botanical debate surrounding whether cabbages are fruits or vegetables.\n\nCultivation Practices\n\nCabbage cultivation involves a series of meticulous steps, with considerations ranging from soil preparation to pest management. Key stages in the cultivation of cabbages include:\n\nSite Selection and Soil Preparation:\nCabbages thrive in well-drained, fertile soils with a slightly acidic to neutral pH. Farmers carefully select sites with adequate sunlight and nutrient-rich soil. Soil preparation involves loosening the soil, incorporating organic matter, and ensuring proper drainage.\n\nSeed Germination and Transplanting:\nCabbages are typically grown from seeds in controlled environments before being transplanted to the main field. Seedlings are nurtured until they reach a suitable size for transplanting, ensuring a strong start for the cabbage plants.\n\nPlanting and Spacing:\nCabbage plants are spaced according to their specific variety, allowing for proper air circulation and reducing the risk of diseases. Proper spacing also facilitates efficient harvesting and overall plant health.\n\nWatering and Fertilization:\nCabbages require consistent moisture throughout their growth cycle. Adequate irrigation, coupled with balanced fertilization, ensures optimal plant development and the production of firm, compact heads.\n\nPest and Disease Management:\nCabbage crops are susceptible to pests such as cabbage worms, aphids, and diseases like black rot. Integrated pest management (IPM) practices, including the use of beneficial insects and organic pesticides, help control pests while minimizing environmental impact.\n\nChallenges in Cabbage Cultivation\n\nCabbage cultivation faces several challenges that can affect yield and quality:\n\nPest Infestations:\nCabbage crops are particularly vulnerable to pests like cabbage loopers and aphids. Farmers must monitor their fields regularly and deploy preventive measures such as row covers and companion planting to deter pests.\n\nDiseases:\nCabbages are susceptible to diseases such as black rot, clubroot, and downy mildew. Crop rotation, sanitation practices, and disease-resistant varieties are crucial components of disease management strategies.\n\nWeather Conditions:\nExtreme weather events, including frost and heatwaves, can impact cabbage crops. Farmers often use protective measures like row covers to shield young plants from adverse weather conditions.\n\nWeed Competition:\nWeeds can compete with cabbage plants for nutrients and water. Effective weed management, including cultivation and mulching, is essential to ensure the optimal growth of cabbage crops.\n\nFruit or Vegetable?\n\nBotanically speaking, cabbages are classified as vegetables. They belong to the Brassicaceae family, which includes other vegetables like broccoli, cauliflower, and Brussels sprouts. Cabbages are characterized by their leafy structure and are classified as vegetables based on culinary and botanical definitions.\n\nConclusion\n\nCabbages, with their rich history and global culinary presence, continue to be a vital component of diets worldwide. The challenges faced by cabbage farmers highlight the importance of sustainable and integrated approaches to cultivation. Whether enjoyed in traditional recipes or as part of contemporary culinary creations, cabbages remain a testament to the resilience of agriculture and the enduring significance of this versatile and nutritious vegetable. As agriculture evolves to meet the demands of changing climates and growing populations, the cultivation of cabbages remains rooted in tradition and innovation, contributing to the vibrant tapestry of global food production.\n\n\n\n\n\n',
      'ar':
          'مقدمة\n\nيعتبر الكرنب (Brassica oleracea var. capitata) من الأبطال الصليبيين في عالم الخضروات، حيث يشتهر بتنوعه وقيمته الغذائية وأهميته الثقافية. سواء تم الاستمتاع به نيئًا في السلطات، أو مطبوخًا في البطاطس المقلية، أو مخمرًا في ملفوف مخلل، فإن الملفوف يعد عنصرًا غذائيًا أساسيًا تمت زراعته منذ قرون. في هذه المقالة، نتعمق في تعقيدات زراعة الكرنب، ونستكشف التحديات التي يواجهها المزارعون ونتناول الجدل النباتي الدائر حول ما إذا كان الكرنب فاكهة أم خضروات.\n\nممارسات الزراعة\n\nتتضمن زراعة الكرنب سلسلة من الخطوات الدقيقة، مع اعتبارات تتراوح من إعداد التربة إلى مكافحة الآفات. المراحل الرئيسية في زراعة الكرنب تشمل:\n\nاختيار الموقع وإعداد التربة:\nيزدهر الكرنب في التربة الخصبة جيدة التصريف ذات درجة الحموضة الحمضية قليلاً إلى المحايدة. ويختار المزارعون بعناية المواقع التي تتمتع بأشعة الشمس الكافية والتربة الغنية بالمغذيات. يتضمن إعداد التربة تخفيف التربة ودمج المواد العضوية وضمان الصرف المناسب.\n\nإنبات البذور وزراعتها:\nيُزرع الكرنب عادةً من البذور في بيئات خاضعة للرقابة قبل زرعها في الحقل الرئيسي. تتم رعاية الشتلات حتى تصل إلى حجم مناسب للزراعة، مما يضمن بداية قوية لنباتات الكرنب.\n\nالزراعة والتباعد:\nيتم توزيع نباتات الكرنب على مسافات متباعدة وفقًا لتنوعها المحدد، مما يسمح بتدوير الهواء بشكل مناسب ويقلل من خطر الإصابة بالأمراض. كما أن التباعد المناسب يسهل الحصاد الفعال وصحة النبات بشكل عام.\n\nالري والتسميد:\nيتطلب الكرنب رطوبة ثابتة طوال دورة نموه. يضمن الري الكافي، إلى جانب التسميد المتوازن، التطوير الأمثل للنبات وإنتاج رؤوس ثابتة ومتماسكة.\n\nإدارة الآفات والأمراض:\nمحاصيل الكرنب عرضة للآفات مثل ديدان الكرنب والمن وأمراض مثل العفن الأسود. تساعد ممارسات الإدارة المتكاملة للآفات (IPM)، بما في ذلك استخدام الحشرات المفيدة والمبيدات العضوية، في السيطرة على الآفات مع تقليل التأثير البيئي.\n\nالتحديات في زراعة الكرنب\n\nتواجه زراعة الكرنب العديد من التحديات التي يمكن أن تؤثر على المحصول والجودة:\n\nالإصابة بالآفات:\nمحاصيل الكرنب معرضة بشكل خاص للآفات مثل حشرات الكرنب والمن. يجب على المزارعين مراقبة حقولهم بانتظام ونشر تدابير وقائية مثل أغطية الصفوف والزراعة المصاحبة لردع الآفات.\n\nالأمراض:\nالملفوف عرضة لأمراض مثل العفن الأسود، والجذور، والعفن الناعم. تعد تناوب المحاصيل وممارسات الصرف الصحي والأصناف المقاومة للأمراض مكونات حاسمة في استراتيجيات إدارة الأمراض.\n\nاحوال الطقس:\nيمكن أن تؤثر الأحداث المناخية القاسية، بما في ذلك الصقيع وموجات الحر، على محاصيل الكرنب. غالبًا ما يستخدم المزارعون إجراءات وقائية مثل أغطية الصفوف لحماية النباتات الصغيرة من الظروف الجوية السيئة.\n\nمسابقة الاعشاب:\nيمكن أن تتنافس الأعشاب الضارة مع نباتات الكرنب على العناصر الغذائية والمياه. تعد الإدارة الفعالة للأعشاب الضارة، بما في ذلك الزراعة والتغطية، ضرورية لضمان النمو الأمثل لمحاصيل الكرنب.\n\nالفاكهة أو الخضار؟\n\nمن الناحية النباتية، يتم تصنيف الملفوف على أنه خضروات. إنهم ينتمون إلى عائلة Brassicaceae، والتي تشمل الخضروات الأخرى مثل البروكلي والقرنبيط وكرنب بروكسل. يتميز الكرنب ببنيته الورقية ويتم تصنيفه ضمن الخضروات بناءً على تعريفات الطهي والنباتات.\n\nخاتمة\n\nلا يزال الملفوف، بتاريخه الغني وحضوره الطهوي العالمي، عنصرًا حيويًا في الأنظمة الغذائية في جميع أنحاء العالم. تسلط التحديات التي يواجهها مزارعو الكرنب الضوء على أهمية اتباع أساليب مستدامة ومتكاملة للزراعة. سواء تم الاستمتاع بالملفوف في الوصفات التقليدية أو كجزء من إبداعات الطهي المعاصرة، يظل الملفوف بمثابة شهادة على مرونة الزراعة والأهمية الدائمة لهذه الخضار المتنوعة والمغذية. مع تطور الزراعة لتلبية متطلبات تغير المناخ وتزايد عدد السكان، تظل زراعة الكرنب متجذرة في التقاليد والابتكار، مما يساهم في النسيج النابض بالحياة لإنتاج الغذاء العالمي.',
    },
    'a9fi2j4i': {
      'en': 'Cabbage',
      'ar': 'ملفوف',
    },
    '1bv8f5ml': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Createacc
  {
    '0ivuij60': {
      'en': 'Smart Irrigation System ',
      'ar': 'نظام الري الذكي',
    },
    'hjqv8d4k': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
    },
    '3pb3yw3x': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    '6fw3m9wy': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'ay8s07s5': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'i89jpfl9': {
      'en': '',
      'ar': '',
    },
    '5j5a5pqu': {
      'en': 'Password',
      'ar': 'كلمة المررو ',
    },
    'susz1nlm': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'g7xfrvbu': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'ef7fm8sb': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب؟',
    },
    '189heytp': {
      'en': 'Sign In here',
      'ar': 'لتسجيل الدخول هنا',
    },
    'lrkr9awz': {
      'en': 'Continue with Google',
      'ar': 'من خلال جوجل',
    },
    'pcq63k6j': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Login
  {
    'gpwaugvg': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'kj48qb1q': {
      'en': 'Use the account below to sign in.',
      'ar': 'استخدم الحساب أدناه لتسجيل الدخول.',
    },
    'lnn36ya3': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'ywos2zsi': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '4l7x33d3': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'a8oyhhic': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'sd0t8vqm': {
      'en': 'I don\'t have an account',
      'ar': 'انا لا املك حساب ',
    },
    'fg27714j': {
      'en': 'Continue with Google',
      'ar': 'سجل بواسطة جوجل',
    },
    'yhil89jy': {
      'en': 'Continue with Apple',
      'ar': 'سجل بواسطة ابل',
    },
    'k9aq6iie': {
      'en': 'Guest account',
      'ar': 'حساب الضيف',
    },
    'yrzxsi3i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ResetPassword
  {
    'edz4vjo3': {
      'en': 'Back',
      'ar': '',
    },
    'h5p0iezl': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'uckemd53': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar':
          'سنرسل إليك بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
    },
    '56viwcq6': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
    },
    '2ce6q8g4': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'qbbibc1a': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
    },
    '87ytgi8c': {
      'en': 'Back',
      'ar': 'العودة',
    },
    'h4t8azbv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // sugarCane
  {
    'ehfc2luq': {
      'en': 'Sugar Cane',
      'ar': 'قصب السكر ',
    },
    '74q6fas5': {
      'en': 'Tall Grass',
      'ar': 'العشب الطويل',
    },
    'sp16i042': {
      'en':
          'Sugar Cane: Sweet Nectar of Agriculture - Cultivation Challenges and the Botanical Classification Debate',
      'ar':
          'قصب السكر: الرحيق الحلو للزراعة - تحديات الزراعة ومناقشة التصنيف النباتي',
    },
    'o5a5wg7n': {
      'en':
          'Introduction\n\nSugar cane (Saccharum officinarum) stands as a tall, fibrous grass that has played a pivotal role in human history, serving as the primary source of sugar for centuries. As a key component in the global production of sugar and bioenergy, sugar cane cultivation is an intricate process with unique challenges. In this article, we delve into the complexities of sugar cane cultivation, exploring the challenges faced by farmers and addressing the botanical debate surrounding whether sugar cane is classified as a fruit, vegetable, or neither.\n\nCultivation Practices\n\nSugar cane cultivation involves a series of carefully orchestrated steps, from planting to harvest, to maximize sugar yield. Key stages in the cultivation of sugar cane include:\n\nLand Preparation:\nSugar cane thrives in tropical and subtropical climates, requiring well-drained, fertile soils. Farmers prepare the land by plowing and leveling to ensure optimal growing conditions for the cane.\n\nPlanting and Propagation:\nSugar cane is propagated through cuttings or \"setts\" from mature cane stalks. These setts are planted in furrows or trenches, allowing the cane to develop a robust root system and shoot.\n\nGrowth and Maturation:\nSugar cane undergoes a vegetative growth phase, during which the plant develops an extensive root system and tall stalks. The maturation process, marked by the accumulation of sucrose in the stalks, typically takes 10 to 24 months depending on the variety.\n\nHarvesting:\nHarvesting involves cutting the mature sugar cane stalks close to the ground. Mechanized harvesters or manual labor may be employed, depending on the scale of cultivation and available technology.\n\nProcessing:\nAfter harvesting, sugar cane undergoes milling and extraction processes to obtain sugar juice. The juice is then subjected to refining processes to produce crystalline sugar, molasses, and other by-products.\n\nChallenges in Sugar Cane Cultivation\n\nSugar cane cultivation faces specific challenges that can impact productivity and sustainability:\n\nDisease and Pest Management:\nSugar cane is susceptible to diseases such as smut and pests like borers and aphids. Farmers employ integrated pest management strategies, including disease-resistant varieties and biological controls, to mitigate these challenges.\n\nWater Management:\nSugar cane requires ample water for optimal growth, and efficient irrigation systems are essential in regions with irregular rainfall patterns.\n\nSoil Health:\nContinuous sugar cane cultivation can deplete soil nutrients and lead to soil degradation. Farmers implement crop rotation and cover cropping to maintain soil fertility and structure.\n\nLabor Intensity:\nHarvesting sugar cane is a labor-intensive process, especially in regions where manual harvesting methods are predominant. Mechanization efforts seek to address labor challenges and improve efficiency.\n\nBotanical Classification Debate\n\nBotanically, sugar cane is classified as a member of the grass family (Poaceae). It is a type of tall perennial grass with a jointed stem that stores sucrose. While sugar cane is not classified as a fruit or vegetable, it holds unique botanical characteristics that distinguish it from traditional fruits and vegetables.\n\nConclusion\n\nSugar cane cultivation represents a vital component of global agriculture, providing not only a sweetener for countless culinary delights but also serving as a renewable source for bioenergy production. The challenges faced by sugar cane farmers underscore the need for sustainable and innovative practices to ensure the resilience of this crucial crop. As the debate over botanical classifications continues, the practical importance of sugar cane in agriculture, industry, and global economies remains undisputed. From ancient sugarcane cultivation to modern agro-industrial processes, the journey of sugar cane continues to weave its sweet influence through the rich tapestry of human history and agriculture.\n\n\n\n\n\n',
      'ar':
          'مقدمة\n\nيقف قصب السكر (Saccharum officinarum) كعشب ليفي طويل القامة لعب دورًا محوريًا في تاريخ البشرية، حيث كان بمثابة المصدر الرئيسي للسكر لعدة قرون. باعتبارها عنصرا رئيسيا في الإنتاج العالمي للسكر والطاقة الحيوية، تعد زراعة قصب السكر عملية معقدة ذات تحديات فريدة من نوعها. في هذه المقالة، نتعمق في تعقيدات زراعة قصب السكر، ونستكشف التحديات التي يواجهها المزارعون ونتناول الجدل النباتي الدائر حول ما إذا كان قصب السكر مصنفًا على أنه فاكهة أم خضروات أم لا.\n\nممارسات الزراعة\n\nتنطوي زراعة قصب السكر على سلسلة من الخطوات المنسقة بعناية، من الزراعة إلى الحصاد، لتحقيق أقصى قدر من إنتاج السكر. تشمل المراحل الرئيسية في زراعة قصب السكر ما يلي:\n\nإعداد الأرض:\nيزدهر قصب السكر في المناخات الاستوائية وشبه الاستوائية، ويتطلب تربة خصبة جيدة التصريف. يقوم المزارعون بإعداد الأرض بالحراثة والتسوية لضمان ظروف نمو مثالية لقصب السكر.\n\nالزراعة والإكثار:\nيتم نشر قصب السكر من خلال العقل أو \"الغرسات\" من سيقان القصب الناضجة. تُزرع هذه المجموعات في الأخاديد أو الخنادق، مما يسمح للقصب بتطوير نظام جذر قوي وإطلاق النار.\n\nالنمو والنضج:\nيمر قصب السكر بمرحلة نمو نباتي، يقوم خلالها النبات بتطوير نظام جذر واسع النطاق وسيقان طويلة. تستغرق عملية النضج، التي تتميز بتراكم السكروز في السيقان، من 10 إلى 24 شهرًا اعتمادًا على الصنف.\n\nحصاد:\nيتضمن الحصاد قطع سيقان قصب السكر الناضجة بالقرب من الأرض. ويمكن استخدام الحصادات الآلية أو العمل اليدوي، اعتمادًا على حجم الزراعة والتكنولوجيا المتاحة.\n\nيعالج:\nبعد الحصاد، يخضع قصب السكر لعمليات الطحن والاستخلاص للحصول على عصير السكر. يتم بعد ذلك إخضاع العصير لعمليات التكرير لإنتاج السكر البلوري ودبس السكر والمنتجات الثانوية الأخرى.\n\nالتحديات في زراعة قصب السكر\n\nتواجه زراعة قصب السكر تحديات محددة يمكن أن تؤثر على الإنتاجية والاستدامة:\n\nإدارة الأمراض والآفات:\nقصب السكر عرضة لأمراض مثل التفحم والآفات مثل الحفارين والمن. ويستخدم المزارعون استراتيجيات متكاملة لإدارة الآفات، بما في ذلك الأصناف المقاومة للأمراض والضوابط البيولوجية، للتخفيف من هذه التحديات.\n\nادارة المياه:\nويتطلب قصب السكر كمية وافرة من المياه لتحقيق النمو الأمثل، وتعد أنظمة الري الفعالة ضرورية في المناطق التي تعاني من أنماط هطول الأمطار غير المنتظمة.\n\nصحة التربة:\nيمكن أن تؤدي زراعة قصب السكر المستمرة إلى استنفاد مغذيات التربة وتؤدي إلى تدهور التربة. يقوم المزارعون بتنفيذ تناوب المحاصيل وتغطية المحاصيل للحفاظ على خصوبة التربة وبنيتها.\n\nكثافة اليد العاملة:\nيعد حصاد قصب السكر عملية كثيفة العمالة، خاصة في المناطق التي تسود فيها طرق الحصاد اليدوية. تسعى جهود الميكنة إلى مواجهة تحديات العمل وتحسين الكفاءة.\n\nمناقشة التصنيف النباتي\n\nمن الناحية النباتية، يصنف قصب السكر كعضو في عائلة العشب (Poaceae). وهو نوع من العشب طويل القامة مع ساق مفصلي يخزن السكروز. في حين أن قصب السكر لا يصنف على أنه فاكهة أو خضار، إلا أنه يحمل خصائص نباتية فريدة تميزه عن الفواكه والخضروات التقليدية.\n\nخاتمة\n\nتمثل زراعة قصب السكر عنصرا حيويا في الزراعة العالمية، فهي لا توفر مادة تحلية لعدد لا يحصى من المأكولات الشهية فحسب، بل تعمل أيضا كمصدر متجدد لإنتاج الطاقة الحيوية. تؤكد التحديات التي يواجهها مزارعو قصب السكر على الحاجة إلى ممارسات مستدامة ومبتكرة لضمان مرونة هذا المحصول الحيوي. مع استمرار الجدل حول التصنيفات النباتية، تظل الأهمية العملية لقصب السكر في الزراعة والصناعة والاقتصادات العالمية بلا منازع. من زراعة قصب السكر القديمة إلى العمليات الصناعية الزراعية الحديثة، تستمر رحلة قصب السكر في نسج تأثيرها الحلو من خلال النسيج الغني للتاريخ البشري والزراعة.',
    },
    'h0gpgkuk': {
      'en': 'Sugar Cane',
      'ar': 'قصب السكر ',
    },
    'vi3fav27': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Sensors
  {
    'dn2ethry': {
      'en': 'Temperature',
      'ar': 'درجة الحرارة',
    },
    '76is3u2p': {
      'en': 'Soil moisture',
      'ar': 'رطوبة التربة',
    },
    '8n1rgfug': {
      'en': 'Humidity',
      'ar': 'الرطوبة',
    },
    'v9sxqaz1': {
      'en': 'Water Level',
      'ar': 'مستوي الماء',
    },
    '6ur606ef': {
      'en': 'LED',
      'ar': 'LED',
    },
    's4nqfbcj': {
      'en': 'LED Strip',
      'ar': 'شريط إضاءة LED',
    },
    'p0ulqlbz': {
      'en': 'Water pump',
      'ar': 'مضخة ماء',
    },
    'r5bsyeoz': {
      'en': 'Sensors',
      'ar': 'حساسات',
    },
    'comxc1nj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // webv
  {
    'b8ecvvph': {
      'en': 'Web',
      'ar': 'موقع الويب ',
    },
    '1zq43kct': {
      'en': 'Home',
      'ar': '',
    },
  },
  // information
  {
    '07mdrh92': {
      'en':
          'About the institute\n\n\nIt is an (educational) institution that moves through a strategy capable of contributing effectively and seriously to the development of the human element to prepare a generation of cadres supported by the weapon of science in light of the challenges of the times.\n‏',
      'ar':
          'عن المعهد\n\n\nهي مؤسسة (تعليمية) تتحرك من خلال اِستراتيجيه قادرة على أن تساهم بشكل فعال وجاد فى تنمية العنصر البشرى لإعداد جيل من الكوادر مدعومة بسلاح العلم فى ظل تحديات العصر\n‏',
    },
    '119smu05': {
      'en':
          '\nthe address\n\nObour City - Orabi Association District - North 8 Road (Gate 7) Cairo, Cairo Governorate, Egypt\n\nhttps://maps.app.goo.gl/cECchXSEDcusNQHu7',
      'ar':
          '\nالعنوان\n\nمدينة العبور - حي جمعية عرابى - طريق 8 الشمالي (بوابة 7) ‏القاهرة‏، ‏محافظة القاهرة‏، ‏مصر\n\nhttps://maps.app.goo.gl/cECchXSEDcusNQHu7',
    },
    '2tseikdo': {
      'en':
          'عن المعهد\n\n\nهي مؤسسة (تعليمية) تتحرك من خلال اِستراتيجيه قادرة على أن تساهم بشكل فعال وجاد فى تنمية العنصر البشرى لإعداد جيل من الكوادر مدعومة بسلاح العلم فى ظل تحديات العصر\n\nالعنوان\n\nمدينة العبور - حي جمعية عرابى - طريق 8 الشمالي (بوابة 7) ‏القاهرة‏، ‏محافظة القاهرة‏، ‏مصر\n\nhttps://maps.app.goo.gl/cECchXSEDcusNQHu7‏',
      'ar': '',
    },
    'wwkftmyl': {
      'en':
          'Under supervision of:\n\nAssoc. Prof.  Ashraf Mohamed Ali\n\nDr. Ibrahim Abdel-Dayem\n',
      'ar': 'تحت إشراف:\n\nمساعد. أ.د أشرف محمد علي\n\nد.ابراهيم عبد الدايم',
    },
    'kgviksu2': {
      'en': 'Names of those who implemented this project',
      'ar': 'أسماء القائمين على تنفيذ هذا المشروع',
    },
    'irz9kyhe': {
      'en': 'Mostafa Khalid Sallam',
      'ar': 'مصطفى خالد سلام',
    },
    'n2bvjk6f': {
      'en': '20190821',
      'ar': '20190821',
    },
    'r6i14lve': {
      'en': 'Ahmed Mohamed Anwar',
      'ar': 'أحمد محمد أنور',
    },
    'e99oyu6p': {
      'en': '20190841',
      'ar': '20190841',
    },
    '5gwxmg89': {
      'en': 'Ayman Shaban\n',
      'ar': 'أيمن شعبان',
    },
    'g19xfs4b': {
      'en': '20190839',
      'ar': '20190839',
    },
    'rvtmwicl': {
      'en': 'Bahaa El-Din Mustafa Rashad',
      'ar': 'بهاء الدين مصطفى رشاد',
    },
    's2rardcl': {
      'en': '20180871',
      'ar': '20180871',
    },
    '6wjyrl8d': {
      'en': 'Shehab El-din Mohamed',
      'ar': 'شهاب الدين محمد',
    },
    '47mpb2m0': {
      'en': '20190855',
      'ar': '20190855',
    },
    '6dthjdwp': {
      'en': 'Informations',
      'ar': 'معلومات',
    },
    'pwq0yxyk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AI_Chat
  {
    'i25jze24': {
      'en': 'Ask me any question',
      'ar': 'اسألني أي سؤال',
    },
    'll10ticm': {
      'en': '',
      'ar': '',
    },
    'uvs8kzka': {
      'en': 'Send',
      'ar': 'ارسال',
    },
    'j88eayic': {
      'en': 'AI Chat',
      'ar': 'دردشة الذكاء الاصطناعي',
    },
    'agh0m9y3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AI_Chat_Image
  {
    'zo8mwzzr': {
      'en': 'Write your question',
      'ar': 'أكتب سؤالك',
    },
    'pmqybh08': {
      'en': 'Upload Image',
      'ar': 'ارفع صورة',
    },
    'jmmivw4g': {
      'en': 'Send',
      'ar': 'ارسال',
    },
    't9ioq7ns': {
      'en': 'AI Disease detection',
      'ar': 'الكشف عن المرض_ الذكاء الاصطناعي',
    },
    'yw9a5sk1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Settings
  {
    '48vx12rg': {
      'en': 'Light Mode',
      'ar': 'فاتح',
    },
    'hp0ydzas': {
      'en': 'Dark Mode',
      'ar': 'داكن',
    },
    'piura0fa': {
      'en': 'Informations',
      'ar': 'معلومات',
    },
    'fpkwpil4': {
      'en': 'Profile',
      'ar': 'الصفحة الشخصية ',
    },
    '7mjbpeja': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
    },
    'm8vq2ff6': {
      'en': 'Settings',
      'ar': 'الاعدادات',
    },
    '5d9xxksl': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Profile15
  {
    'hy1l3l53': {
      'en': 'My Informations',
      'ar': 'معلوماتي',
    },
    'er44c2h5': {
      'en': 'My Age : ',
      'ar': 'عمري : ',
    },
    '0wpzsaa4': {
      'en': 'My Bio : ',
      'ar': 'سيرتي الشخصية  : ',
    },
    '1emp1jun': {
      'en': 'My Phone : ',
      'ar': 'رقم هاتفي  : ',
    },
    'i2jnt45b': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
    '2diytj3j': {
      'en': 'Settings',
      'ar': 'الاعدادات',
    },
    'tq6yeue4': {
      'en': 'Complete your profile',
      'ar': 'اكمل ملفك الشخصي',
    },
    'ggseiqqj': {
      'en': 'Change Password',
      'ar': 'تعديل كلمة السر',
    },
    'gmoelo4i': {
      'en': 'Delete Account',
      'ar': 'حذف الحساب نهائيا ',
    },
    'ep3hjnh7': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
    },
  },
  // editProfile
  {
    'mm9svg5i': {
      'en': 'Save Photo',
      'ar': 'حفظ الصورة',
    },
    's4ncsuzz': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'tl30tu4o': {
      'en': 'Save Name',
      'ar': 'حفظ الاسم ',
    },
    'enzt26jn': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
    },
    'si9vd3lo': {
      'en': 'Save Phone',
      'ar': 'حفظ الهاتف',
    },
    'mql4r2hv': {
      'en': 'Your Age',
      'ar': 'عمرك',
    },
    '94fy5i1z': {
      'en': 'Save Age',
      'ar': 'حفظ العمر',
    },
    'mp8yxrmc': {
      'en': 'Your Bio',
      'ar': 'سيرتك الذاتية',
    },
    'fj2oxq1v': {
      'en': 'Save Bio',
      'ar': 'حفظ السيرة الذاتية ',
    },
    'ulgppzqu': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'a1gc61x7': {
      'en': 'Complete your profile',
      'ar': 'اكمل ملفك الشخصي',
    },
  },
  // editPassword
  {
    'y2wq9vqm': {
      'en': 'New Password',
      'ar': 'كلمة السر الجديدة',
    },
    'kqig4xey': {
      'en': 'Confirm New Password',
      'ar': 'اكد كلمة السر الجديدة ',
    },
    'hcvkstnn': {
      'en': 'Save Change',
      'ar': 'حفظ التغير',
    },
    'yb0nijqh': {
      'en': 'Change Password',
      'ar': 'تغير كلمة السر ',
    },
  },
  // Miscellaneous
  {
    '9155avch': {
      'en': '',
      'ar': '',
    },
    'm53b2lsb': {
      'en': '',
      'ar': '',
    },
    '719v6u7f': {
      'en': '',
      'ar': '',
    },
    '1qsrejfp': {
      'en': '',
      'ar': '',
    },
    'x8p02wmy': {
      'en': '',
      'ar': '',
    },
    'ltmose9e': {
      'en': '',
      'ar': '',
    },
    'mnbvj3lo': {
      'en': '',
      'ar': '',
    },
    'ithxaj0q': {
      'en': '',
      'ar': '',
    },
    '0x4m13yf': {
      'en': '',
      'ar': '',
    },
    'twl0mx28': {
      'en': '',
      'ar': '',
    },
    'zpktkl3w': {
      'en': '',
      'ar': '',
    },
    's28et2vt': {
      'en': '',
      'ar': '',
    },
    's4lip157': {
      'en': '',
      'ar': '',
    },
    'ylh5klbh': {
      'en': '',
      'ar': '',
    },
    '0gkbro75': {
      'en': '',
      'ar': '',
    },
    's4o83u1j': {
      'en': '',
      'ar': '',
    },
    'dcecrdr3': {
      'en': '',
      'ar': '',
    },
    'pvktyh8s': {
      'en': '',
      'ar': '',
    },
    'kr5v0ug0': {
      'en': '',
      'ar': '',
    },
    'wprpy8fx': {
      'en': '',
      'ar': '',
    },
    '5avjzyyd': {
      'en': '',
      'ar': '',
    },
    'doj42yzf': {
      'en': '',
      'ar': '',
    },
    'rg78vg3u': {
      'en': '',
      'ar': '',
    },
    '9qqpel1s': {
      'en': '',
      'ar': '',
    },
    'ngule95a': {
      'en': '',
      'ar': '',
    },
    'ifkd7svc': {
      'en': '',
      'ar': '',
    },
    'tsmhr8k9': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
