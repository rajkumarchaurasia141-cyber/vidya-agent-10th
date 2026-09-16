import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const VidyaAgentApp());
}

class VidyaAgentApp extends StatelessWidget {
  const VidyaAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'विद्या एजेंट: बिहार बोर्ड 10th',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    AllSubjectsNotesScreen(),
    NcertSolutionsScreen(),
    PyqBankScreen(),
    OnlineTestScreen(),
    VidyaAiDoubtScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.school, color: Colors.amber),
            SizedBox(width: 8),
            Text(
              'विद्या एजेंट: बिहार बोर्ड 10th',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        elevation: 2,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'संपूर्ण नोट्स'),
          NavigationDestination(icon: Icon(Icons.assignment), label: 'NCERT हल'),
          NavigationDestination(icon: Icon(Icons.history_edu), label: '10 Yr PYQ'),
          NavigationDestination(icon: Icon(Icons.quiz), label: 'टेस्ट सीरीज़'),
          NavigationDestination(icon: Icon(Icons.camera_enhance), label: 'AI डाउट हल'),
        ],
      ),
    );
  }
}

// ---------------- 1. संपूर्ण नोट्स (सभी 5 विषय और सभी अध्याय) ----------------
class AllSubjectsNotesScreen extends StatelessWidget {
  const AllSubjectsNotesScreen({super.key});

  final List<Map<String, dynamic>> subjectData = const [
    {
      'subject': 'गणित (Mathematics)',
      'icon': Icons.calculate,
      'color': Colors.indigo,
      'chapters': [
        {
          'ch': 'अध्याय 1: वास्तविक संख्याएँ',
          'notes': '• यूक्लिड विभाजन प्रमेयिका: a = bq + r (0 ≤ r < b)\n• अंकगणित की आधारभूत प्रमेय: प्रत्येक भाज्य संख्या अद्वितीय रूप से अभाज्य गुणनफल होती है।\n• HCF(a, b) × LCM(a, b) = a × b\n• √2, √3, √5 अपरिमेय संख्याएँ हैं।'
        },
        {
          'ch': 'अध्याय 2: बहुपद',
          'notes': '• रैखिक बहुपद: ax + b (शून्यक = 1)\n• द्विघात बहुपद: ax² + bx + c (शून्यक α, β)\n  - योग: α + β = -b/a\n  - गुणनफल: αβ = c/a\n• त्रिघात बहुपद: ax³ + bx² + cx + d'
        },
        {
          'ch': 'अध्याय 3: दो चर वाले रैखिक समीकरण युग्म',
          'notes': '• a1/a2 ≠ b1/b2 → प्रतिच्छेदी रेखाएँ, केवल एक हल (अद्वितीय)\n• a1/a2 = b1/b2 = c1/c2 → संपाती रेखाएँ, अनंत हल\n• a1/a2 = b1/b2 ≠ c1/c2 → समांतर रेखाएँ, कोई हल नहीं'
        },
        {
          'ch': 'अध्याय 4: द्विघात समीकरण',
          'notes': '• मानक रूप: ax² + bx + c = 0 (a ≠ 0)\n• विविक्तकर (Discriminant): D = b² - 4ac\n  - D > 0: दो वास्तविक एवं भिन्न मूल\n  - D = 0: दो बराबर वास्तविक मूल (-b/2a)\n  - D < 0: कोई वास्तविक मूल नहीं'
        },
        {
          'ch': 'अध्याय 5: समांतर श्रेढ़ियाँ (AP)',
          'notes': '• सार्व अंतर d = a₂ - a₁\n• nवाँ पद: aₙ = a + (n - 1)d\n• प्रथम n पदों का योग: Sₙ = n/2 [2a + (n - 1)d] या Sₙ = n/2 (a + l)'
        },
        {
          'ch': 'अध्याय 6: त्रिभुज',
          'notes': '• थेल्स प्रमेय (BPT): यदि किसी त्रिभुज की एक भुजा के समांतर रेखा खींची जाए, तो वह अन्य दो भुजाओं को समान अनुपात में विभाजित करती है।\n• समरूपता की कसौटियाँ: AAA, SSS, SAS.'
        },
        {
          'ch': 'अध्याय 7: निर्देशांक ज्यामिति',
          'notes': '• दूरी सूत्र: d = √[(x₂ - x₁)² + (y₂ - y₁)²]\n• विभाजन सूत्र: [(m₁x₂ + m₂x₁)/(m₁+m₂), (m₁y₂ + m₂y₁)/(m₁+m₂)]\n• मध्य-बिंदु सूत्र: [(x₁ + x₂)/2, (y₁ + y₂)/2]'
        },
        {
          'ch': 'अध्याय 8: त्रिकोणमिति का परिचय',
          'notes': '• sin θ = लम्ब/कर्ण, cos θ = आधार/कर्ण, tan θ = लम्ब/आधार\n• सर्वसमिकाएँ:\n  1. sin²θ + cos²θ = 1\n  2. 1 + tan²θ = sec²θ\n  3. 1 + cot²θ = cosec²θ'
        },
        {
          'ch': 'अध्याय 9: त्रिकोणमिति के अनुप्रयोग (ऊंचाई और दूरी)',
          'notes': '• उन्नयन कोण (Angle of Elevation): आँख से ऊपर की वस्तु को देखने पर क्षैतिज रेखा के साथ बना कोण।\n• अवनमन कोण (Angle of Depression): नीचे देखने पर बना कोण।'
        },
        {
          'ch': 'अध्याय 10: वृत्त',
          'notes': '• वृत्त के किसी बिंदु पर स्पर्श रेखा स्पर्श बिंदु से जाने वाली त्रिज्या पर लंब होती है।\n• बाह्य बिंदु से वृत्त पर खींची गई स्पर्श रेखाओं की लंबाइयाँ बराबर होती हैं।'
        },
        {
          'ch': 'अध्याय 12: वृत्तों से संबंधित क्षेत्रफल',
          'notes': '• वृत्त का क्षेत्रफल = πr², परिधि = 2πr\n• त्रिज्यखंड का क्षेत्रफल = (θ/360°) × πr²\n• चाप की लंबाई = (θ/360°) × 2πr'
        },
        {
          'ch': 'अध्याय 13: पृष्ठीय क्षेत्रफल और आयतन',
          'notes': '• बेलन: वक्र पृष्ठ = 2πrh, आयतन = πr²h\n• शंकु: तिर्यक ऊंचाई l = √(r² + h²), आयतन = 1/3 πr²h\n• गोला: आयतन = 4/3 πr³, पृष्ठ = 4πr²'
        },
        {
          'ch': 'अध्याय 14: सांख्यिकी',
          'notes': '• माध्य (Mean) = Σfx / Σf\n• बहुलक = l + [(f₁ - f₀) / (2f₁ - f₀ - f₂)] × h\n• 3 माध्यक = बहुलक + 2 माध्य'
        },
        {
          'ch': 'अध्याय 15: प्रायिकता',
          'notes': '• P(E) = अनुकूल परिणामों की संख्या / कुल परिणामों की संख्या\n• 0 ≤ P(E) ≤ 1\n• P(E) + P(नहीं E) = 1'
        },
      ]
    },
    {
      'subject': 'विज्ञान (Science: भौतिकी + रसायन + जीव)',
      'icon': Icons.biotech,
      'color': Colors.green,
      'chapters': [
        {
          'ch': 'भौतिकी: प्रकाश का परावर्तन तथा अपवर्तन',
          'notes': '• परावर्तन नियम: आपतन कोण (i) = परावर्तन कोण (r)\n• दर्पण सूत्र: 1/f = 1/v + 1/u, आवर्धन m = -v/u\n• लेंस सूत्र: 1/f = 1/v - 1/u, लेंस की क्षमता P = 1/f (मीटर में), मात्रक: डायोप्टर (D)'
        },
        {
          'ch': 'भौतिकी: मानव नेत्र एवं रंगबिरंगा संसार',
          'notes': '• निकट दृष्टि दोष (Myopia): दूर की वस्तु न दिखना → अवतल लेंस द्वारा उपचार।\n• दूर दृष्टि दोष (Hypermetropia): पास की वस्तु न दिखना → उत्तल लेंस द्वारा उपचार।\n• तारे का टिमटिमाना: वायुमंडलीय अपवर्तन का कारण।'
        },
        {
          'ch': 'भौतिकी: विद्युत (Electricity)',
          'notes': '• ओम का नियम: V = IR\n• श्रेणीक्रम संयोजन: R = R₁ + R₂ + R₃\n• समांतर क्रम संयोजन: 1/R = 1/R₁ + 1/R₂ + 1/R₃\n• विद्युत शक्ति: P = VI = I²R = V²/R'
        },
        {
          'ch': 'भौतिकी: विद्युत धारा का चुंबकीय प्रभाव',
          'notes': '• फ्लेमिंग का वामहस्त नियम: अंगूठा (बल), तर्जनी (चुंबकीय क्षेत्र), मध्यमा (विद्युत धारा)।\n• घरेलू परिपथ में प्रत्यावर्ती धारा (AC) की आवृत्ति 50 Hz तथा विभव 220 V होता है।'
        },
        {
          'ch': 'रसायन: रासायनिक अभिक्रियाएँ एवं समीकरण',
          'notes': '• संयोजन अभिक्रिया: A + B → AB\n• वियोजन अभिक्रिया: AB → A + B\n• उपचयन (ऑक्सीकरण): ऑक्सीजन का जुड़ना या हाइड्रोजन का हटना।\n• अपचयन: ऑक्सीजन का हटना या हाइड्रोजन का जुड़ना।'
        },
        {
          'ch': 'रसायन: अम्ल, क्षारक एवं लवण',
          'notes': '• अम्ल: नीले लिटमस को लाल करता है (pH < 7)।\n• क्षारक: लाल लिटमस को नीला करता है (pH > 7)।\n• उदासीन विलयन: pH = 7\n• विरंजक चूर्ण: CaOCl₂, बेकिंग सोडा: NaHCO₃, धावन सोडा: Na₂CO₃·10H₂O'
        },
        {
          'ch': 'रसायन: धातु एवं अधातु',
          'notes': '• आघातवर्ध्यता एवं तन्यता: धातुओं का प्रमुख गुण। सोना सबसे अधिक तन्य है।\n• कमरे के ताप पर द्रव धातु: पारा (Hg), द्रव अधातु: ब्रोमीन (Br)।\n• उभयधर्मी ऑक्साइड: Al₂O₃, ZnO'
        },
        {
          'ch': 'रसायन: कार्बन एवं उसके यौगिक',
          'notes': '• सहसंयोजी आबंध: इलेक्ट्रॉनों के साझा से बने आबंध।\n• एल्केन (CₙH₂ₙ₊₂), एल्कीन (CₙH₂ₙ), एल्काइन (CₙH₂ₙ₋₂)\n• सिरका: 5-8% एसिटिक अम्ल का जलीय विलयन।'
        },
        {
          'ch': 'जीव विज्ञान: जैव प्रक्रम (Life Processes)',
          'notes': '• स्वपोषी पोषण: प्रकाश संश्लेषण (सूर्य प्रकाश, क्लोरोफिल, CO₂, जल)\n• धमनी: शुद्ध रक्त हृदय से शरीर के अंगों में ले जाती है।\n• शिरा: अशुद्ध रक्त हृदय में लाती है।\n• वृक्क (Kidney) की कार्यात्मक इकाई: नेफ्रॉन (वृक्काणु)।'
        },
        {
          'ch': 'जीव विज्ञान: नियंत्रण एवं समन्वय',
          'notes': '• तंत्रिका तंत्र की कार्यात्मक इकाई: न्यूरॉन।\n• पादप हार्मोन: ऑक्सिन (वृद्धि), जिबरेलिन, साइटोकाइनिन, एब्सिसिक अम्ल (वृद्धि रोधक)।\n• मास्टर ग्रंथि: पीयूष ग्रंथि (Pituitary Gland)।'
        },
        {
          'ch': 'जीव विज्ञान: जीव जनन कैसे करते हैं',
          'notes': '• अलैंगिक जनन: द्विखंडन (अमीबा), मुकुलन (यीस्ट, हाइड्रा), पुनर्जनन (प्लेनेरिया)।\n• पुष्प के जनन अंग: पुंकेसर (नर), स्त्रीकेसर (मादा)।'
        },
        {
          'ch': 'जीव विज्ञान: आनुवंशिकता एवं जैव विकास',
          'notes': '• आनुवंशिकी के जनक: ग्रेगर जॉन मेंडल (मटर के पौधे पर प्रयोग)।\n• मानव में 23 जोड़े (46) गुणसूत्र होते हैं। लिंग निर्धारण 23वें जोड़े (XY - पुरुष, XX - स्त्री) से होता है।'
        },
      ]
    },
    {
      'subject': 'सामाजिक विज्ञान (इतिहास + भूगोल + राजनीति + अर्थशास्त्र)',
      'icon': Icons.public,
      'color': Colors.orange,
      'chapters': [
        {
          'ch': 'इतिहास: यूरोप में राष्ट्रवाद',
          'notes': '• मेजिनी, काबूर और गैरीबाल्डी: इटली के एकीकरण के प्रमुख नेता।\n• बिस्मार्क: जर्मनी के एकीकरण का सूत्रधार (रक्त और लौह की नीति)।\n• 1871 में फ्रैंकफर्ट की संधि के तहत जर्मनी का एकीकरण पूरा हुआ।'
        },
        {
          'ch': 'इतिहास: भारत में राष्ट्रवाद',
          'notes': '• जालियानवाला बाग हत्याकांड: 13 अप्रैल 1919 (अमृतसर, जनरल डायर)।\n• असहयोग आंदोलन (1920-1922): चौरी-चौरा कांड के बाद स्थगित।\n• सविनय अवज्ञा आंदोलन (1930): दांडी मार्च द्वारा नमक कानून तोड़कर शुरुआत।'
        },
        {
          'ch': 'भूगोल: भारत - संसाधन एवं उपयोग',
          'notes': '• संसाधन होते नहीं, बनते हैं - जिम्परमैन।\n• नवीकरणीय: सौर ऊर्जा, पवन ऊर्जा। अनवीकरणीय: कोयला, पेट्रोलियम।\n• काली मिट्टी (रेगुर मिट्टी): कपास की खेती के लिए सर्वोत्तम।'
        },
        {
          'ch': 'भूगोल: खनिज एवं ऊर्जा संसाधन',
          'notes': '• लौह अयस्क: हेमेटाइट, मैग्नेटाइट।\n• भारत का पहला परमाणु ऊर्जा केंद्र: तारापुर (महाराष्ट्र)।\n• बिहार में कोसी नदी को "बिहार का शोक" कहा जाता है।'
        },
        {
          'ch': 'राजनीति विज्ञान: लोकतंत्र में सत्ता की साझेदारी',
          'notes': '• संघ सूची, राज्य सूची एवं समवर्ती सूची।\n• 73वाँ संविधान संशोधन: पंचायती राज व्यवस्था (त्रिस्तरीय ढांचा)।\n• बिहार पंचायती राज में महिलाओं को 50% आरक्षण दिया गया है।'
        },
        {
          'ch': 'अर्थशास्त्र: अर्थव्यवस्था एवं इसका इतिहास',
          'notes': '• प्राथमिक क्षेत्र: कृषि, पशुपालन, मछली पालन।\n• द्वितीयक क्षेत्र: उद्योग एवं विनिर्माण।\n• तृतीयक क्षेत्र (सेवा क्षेत्र): बैंकिंग, परिवहन, संचार।'
        },
        {
          'ch': 'आपदा प्रबंधन',
          'notes': '• प्राकृतिक आपदा: बाढ़, सुखाड़, भूकंप, सुनामी।\n• मानवजनित आपदा: सांप्रदायिक दंगे, आतंकवाद, महामारी।\n• सुनामी का प्रमुख कारण समुद्र की तली में भूकंप आना है।'
        },
      ]
    },
    {
      'subject': 'हिंदी (गोधूलि + वर्णिका + व्याकरण)',
      'icon': Icons.translate,
      'color': Colors.purple,
      'chapters': [
        {
          'ch': 'गोधूलि: श्रम विभाजन और जाति प्रथा',
          'notes': '• लेखक: डॉ. भीमराव आंबेडकर।\n• मुख्य विचार: जाति प्रथा श्रम विभाजन के साथ-साथ श्रमिक विभाजन का भी रूप ले चुकी है, जो अस्वाभाविक है।'
        },
        {
          'ch': 'गोधूलि: विष के दांत',
          'notes': '• लेखक: नलीन विलोचन शर्मा।\n• पात्र: सेन साहब, खोखा (कासू), मदन और गिरधरलाल।\n• विषय: मध्यम वर्ग की अंतर्विरोध और सामाजिक भेदभाव।'
        },
        {
          'ch': 'गोधूलि: भारत से हम क्या सीखें',
          'notes': '• लेखक: मैक्समूलर।\n• विधा: भाषण।\n• मुख्य बिंदु: भारत की प्राचीन संस्कृति, वेद और संस्कृत भाषा का विश्व साहित्य में महत्व।'
        },
        {
          'ch': 'वर्णिका: दही वाली मगम्मा',
          'notes': '• लेखक: श्रीनिवास (कन्नड़ कहानी)।\n• प्रमुख पात्र: मगम्मा, उसकी बहू नजम्मा और रंगप्पा (जुआरी)।'
        },
        {
          'ch': 'वर्णिका: ढाते विश्वास',
          'notes': '• लेखक: सातकौड़ी होता (उड़िया कहानी)।\n• पात्र: लक्ष्मी। पृष्ठभूमि: ओडिशा में महानदी की विनाशकारी बाढ़।'
        },
        {
          'ch': 'हिंदी व्याकरण: महत्वपूर्ण नियम',
          'notes': '• संधि: स्वर, व्यंजन और विसर्ग संधि।\n• समास के 6 भेद: अव्ययीभाव, तत्पुरुष, कर्मधारय, द्विगु, द्वंद्व, बहुव्रीहि।\n• कारक: 8 भेद (कर्ता ने, कर्म को, करण से...)।'
        },
      ]
    },
    {
      'subject': 'संस्कृत (पीयूषम + व्याकरण)',
      'icon': Icons.auto_stories,
      'color': Colors.teal,
      'chapters': [
        {
          'ch': 'पाठ 1: मङ्गलम्',
          'notes': '• उपनिषद से संकलित 5 मन्त्र।\n• "सत्यमेव जयते नानृतम्" (मुण्डकोपनिषद्) - सत्य की ही जीत होती है, असत्य की नहीं।'
        },
        {
          'ch': 'पाठ 2: पाटलिपुत्रवैभवम्',
          'notes': '• पटना का इतिहास 2500 वर्ष पुराना है।\n• मेगस्थनीज, फाह्यान, ह्वेनसांग ने यात्रा की।\n• सिख धर्म के 10वें गुरु गोविंद सिंह का जन्मस्थान (तख्त श्री हरिमंदिर जी)।'
        },
        {
          'ch': 'पाठ 3: अलसकथा',
          'notes': '• लेखक: विद्यापति (पुरुषपरीक्षा ग्रंथ से)।\n• मंत्री वीरेश्वर दयालु और दानशील थे। अलसशाला में आग लगाने पर केवल 4 असली आलसी ही बच पाए।'
        },
        {
          'ch': 'संस्कृत व्याकरण',
          'notes': '• लकार: लट् (वर्तमान), लृट् (भविष्यत्), लङ् (भूतकाल), लोट् (आज्ञार्थक), विधिलिङ् (चाहिए)।\n• बालक, लता, फल के शब्द रूप महत्वपूर्ण हैं।'
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: subjectData.length,
      itemBuilder: (context, sIdx) {
        final sub = subjectData[sIdx];
        final chapters = sub['chapters'] as List;

        return Card(
          margin: const EdgeInsets.only(bottom: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 3,
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: (sub['color'] as Color).withAlpha(40),
              child: Icon(sub['icon'], color: sub['color']),
            ),
            title: Text(
              sub['subject'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('${chapters.length} महत्वपूर्ण अध्याय शामिल'),
            children: chapters.map<Widget>((ch) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(120),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.menu_book, color: Colors.deepPurple, size: 20),
                  title: Text(ch['ch'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SelectableText(
                        ch['notes'],
                        style: const TextStyle(fontSize: 14.5, height: 1.5),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

// ---------------- 2. NCERT संपूर्ण हल ----------------
class NcertSolutionsScreen extends StatelessWidget {
  const NcertSolutionsScreen({super.key});

  final List<Map<String, String>> solutions = const [
    {
      'sub': 'गणित - प्रश्नावली 1.1',
      'q': 'यूक्लिड विभाजन एल्गोरिथ्म से 135 और 225 का HCF ज्ञात कीजिए।',
      'sol': 'चरण 1: 225 = 135 × 1 + 90\nचरण 2: 135 = 90 × 1 + 45\nचरण 3: 90 = 45 × 2 + 0\n\nशेषफल 0 प्राप्त हुआ, अंतिम भाजक 45 है।\nअतः HCF(135, 225) = 45'
    },
    {
      'sub': 'गणित - प्रश्नावली 1.3',
      'q': 'सिद्ध कीजिए कि √5 एक अपरिमेय संख्या है।',
      'sol': 'माना √5 एक परिमेय संख्या है। √5 = a/b (सह-अभाज्य पूर्णांक, b ≠ 0)\nदोनों ओर वर्ग करने पर: 5 = a²/b² ⇒ a² = 5b²\nअतः a², 5 से विभाज्य है, इसलिए a भी 5 से विभाज्य होगा।\nमान लेते हैं a = 5c ⇒ (5c)² = 5b² ⇒ b² = 5c²\nअतः b भी 5 से विभाज्य होगा।\nयह हमारी इस मान्यता का विरोध करता है कि a और b सह-अभाज्य हैं।\nअतः सिद्ध हुआ कि √5 एक अपरिमेय संख्या है।'
    },
    {
      'sub': 'विज्ञान - रासायनिक अभिक्रियाएँ',
      'q': 'संतुलित रासायनिक समीकरण क्या है? इसे संतुलित करना क्यों आवश्यक है?',
      'sol': 'उत्तर: जिस समीकरण में अभिकारकों और उत्पादों के प्रत्येक तत्व के परमाणुओं की संख्या समान होती है, उसे संतुलित समीकरण कहते हैं।\n\nआवश्यकता: द्रव्यमान संरक्षण के नियम के अनुसार, किसी रासायनिक अभिक्रिया में द्रव्यमान का न तो निर्माण होता है और न ही विनाश। अतः दोनों पक्षों का द्रव्यमान समान रखने के लिए समीकरण संतुलित करना अनिवार्य है।'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: solutions.length,
      itemBuilder: (context, i) {
        final s = solutions[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(label: Text(s['sub']!, style: const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Text('प्रश्न: ${s['q']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const Divider(height: 20),
                const Text('चरण-दर-चरण हल:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                const SizedBox(height: 6),
                SelectableText(s['sol']!, style: const TextStyle(fontSize: 14.5, height: 1.45)),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------- 3. 10 वर्ष PYQ बैंक ----------------
class PyqBankScreen extends StatelessWidget {
  const PyqBankScreen({super.key});

  final List<Map<String, String>> pyqList = const [
    {
      'year': 'BSEB 2024',
      'sub': 'गणित',
      'q': 'द्विघात समीकरण 2x² - 4x + 3 = 0 का विविक्तकर (D) क्या होगा?',
      'ans': 'D = b² - 4ac = (-4)² - 4(2)(3) = 16 - 24 = -8 (कोई वास्तविक मूल नहीं)'
    },
    {
      'year': 'BSEB 2024',
      'sub': 'विज्ञान',
      'q': 'विद्युत आवेश का SI मात्रक क्या होता है?',
      'ans': 'कूलॉम (Coulomb - C)'
    },
    {
      'year': 'BSEB 2023',
      'sub': 'सामाजिक विज्ञान',
      'q': 'जालियानवाला बाग हत्याकांड कब हुआ था?',
      'ans': '13 अप्रैल 1919 (अमृतसर में)'
    },
    {
      'year': 'BSEB 2023',
      'sub': 'हिंदी',
      'q': 'श्रम विभाजन और जाति प्रथा के लेखक कौन हैं?',
      'ans': 'डॉ. भीमराव आंबेडकर'
    },
    {
      'year': 'BSEB 2022',
      'sub': 'संस्कृत',
      'q': 'सत्यमेव जयते किस उपनिषद से लिया गया है?',
      'ans': 'मुण्डकोपनिषद्'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: pyqList.length,
      itemBuilder: (context, i) {
        final p = pyqList[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.al
