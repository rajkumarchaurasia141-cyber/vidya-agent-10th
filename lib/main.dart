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

// ---------------- 1. संपूर्ण नोट्स ----------------
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
          'notes': '• a1/a2 ≠ b1/b2 → प्रतिच्छेदी रेखाएँ, अद्वितीय हल\n• a1/a2 = b1/b2 = c1/c2 → संपाती रेखाएँ, अनंत हल\n• a1/a2 = b1/b2 ≠ c1/c2 → समांतर रेखाएँ, कोई हल नहीं'
        },
        {
          'ch': 'अध्याय 4: द्विघात समीकरण',
          'notes': '• मानक रूप: ax² + bx + c = 0 (a ≠ 0)\n• विविक्तकर (Discriminant): D = b² - 4ac\n  - D > 0: दो भिन्न वास्तविक मूल\n  - D = 0: दो बराबर वास्तविक मूल (-b/2a)\n  - D < 0: कोई वास्तविक मूल नहीं'
        },
        {
          'ch': 'अध्याय 5: समांतर श्रेढ़ियाँ (AP)',
          'notes': '• सार्व अंतर d = a₂ - a₁\n• nवाँ पद: aₙ = a + (n - 1)d\n• प्रथम n पदों का योग: Sₙ = n/2 [2a + (n - 1)d] या Sₙ = n/2 (a + l)'
        },
        {
          'ch': 'अध्याय 8: त्रिकोणमिति का परिचय',
          'notes': '• sin θ = लम्ब/कर्ण, cos θ = आधार/कर्ण, tan θ = लम्ब/आधार\n• सर्वसमिकाएँ:\n  1. sin²θ + cos²θ = 1\n  2. 1 + tan²θ = sec²θ\n  3. 1 + cot²θ = cosec²θ'
        },
        {
          'ch': 'अध्याय 14: सांख्यिकी',
          'notes': '• माध्य (Mean) = Σfx / Σf\n• बहुलक = l + [(f₁ - f₀) / (2f₁ - f₀ - f₂)] × h\n• 3 माध्यक = बहुलक + 2 माध्य'
        },
        {
          'ch': 'अध्याय 15: प्रायिकता',
          'notes': '• P(E) = अनुकूल परिणाम / कुल परिणाम\n• 0 ≤ P(E) ≤ 1\n• P(E) + P(नहीं E) = 1'
        },
      ]
    },
    {
      'subject': 'विज्ञान (Science)',
      'icon': Icons.biotech,
      'color': Colors.green,
      'chapters': [
        {
          'ch': 'भौतिकी: प्रकाश का परावर्तन तथा अपवर्तन',
          'notes': '• परावर्तन नियम: आपतन कोण (i) = परावर्तन कोण (r)\n• दर्पण सूत्र: 1/f = 1/v + 1/u\n• लेंस सूत्र: 1/f = 1/v - 1/u, क्षमता P = 1/f (डायोप्टर)'
        },
        {
          'ch': 'भौतिकी: विद्युत (Electricity)',
          'notes': '• ओम का नियम: V = IR\n• श्रेणीक्रम: R = R₁ + R₂ + R₃\n• समांतर क्रम: 1/R = 1/R₁ + 1/R₂ + 1/R₃\n• विद्युत शक्ति: P = VI = I²R = V²/R'
        },
        {
          'ch': 'रसायन: रासायनिक अभिक्रियाएँ एवं समीकरण',
          'notes': '• संयोजन: A + B → AB\n• वियोजन: AB → A + B\n• उपचयन (ऑक्सीजन वृद्धि) एवं अपचयन (ऑक्सीजन ह्रास)'
        },
        {
          'ch': 'रसायन: अम्ल, क्षारक एवं लवण',
          'notes': '• अम्ल: नीले लिटमस को लाल (pH < 7)\n• क्षारक: लाल लिटमस को नीला (pH > 7)\n• विरंजक चूर्ण: CaOCl₂, बेकिंग सोडा: NaHCO₃, धावन सोडा: Na₂CO₃·10H₂O'
        },
        {
          'ch': 'जीव विज्ञान: जैव प्रक्रम (Life Processes)',
          'notes': '• प्रकाश संश्लेषण: 6CO₂ + 12H₂O → C₆H₁₂O₆ + 6O₂ + 6H₂O\n• धमनी: शुद्ध रक्त ले जाती है, शिरा: अशुद्ध रक्त\n• वृक्क की इकाई: नेफ्रॉन (वृक्काणु)'
        },
        {
          'ch': 'जीव विज्ञान: नियंत्रण एवं समन्वय',
          'notes': '• तंत्रिका तंत्र की इकाई: न्यूरॉन\n• पादप हार्मोन: ऑक्सिन, जिबरेलिन, साइटोकाइनिन, एब्सिसिक अम्ल\n• मास्टर ग्रंथि: पीयूष ग्रंथि'
        },
      ]
    },
    {
      'subject': 'सामाजिक विज्ञान (Social Science)',
      'icon': Icons.public,
      'color': Colors.orange,
      'chapters': [
        {
          'ch': 'इतिहास: भारत में राष्ट्रवाद',
          'notes': '• जालियानवाला बाग हत्याकांड: 13 अप्रैल 1919 (अमृतसर)\n• असहयोग आंदोलन: 1920-1922 (चौरी-चौरा कांड के बाद स्थगित)\n• सविनय अवज्ञा आंदोलन: 1930 (दांडी मार्च द्वारा नमक कानून भंग)'
        },
        {
          'ch': 'भूगोल: भारत - संसाधन एवं उपयोग',
          'notes': '• संसाधन होते नहीं, बनते हैं - जिम्परमैन\n• काली मिट्टी (रेगुर): कपास की खेती हेतु उपयुक्त\n• कोसी नदी को "बिहार का शोक" कहा जाता है'
        },
        {
          'ch': 'राजनीति विज्ञान: लोकतंत्र में सत्ता की साझेदारी',
          'notes': '• 73वाँ संविधान संशोधन: पंचायती राज व्यवस्था\n• बिहार पंचायती राज में महिलाओं को 50% आरक्षण'
        },
        {
          'ch': 'अर्थशास्त्र: अर्थव्यवस्था एवं इसका विकास',
          'notes': '• प्राथमिक क्षेत्र: कृषि, पशुपालन, मछली पालन\n• द्वितीयक क्षेत्र: उद्योग\n• तृतीयक क्षेत्र (सेवा क्षेत्र): बैंकिंग, परिवहन, संचार'
        },
      ]
    },
    {
      'subject': 'हिंदी (Hindi)',
      'icon': Icons.translate,
      'color': Colors.purple,
      'chapters': [
        {
          'ch': 'गोधूलि: श्रम विभाजन और जाति प्रथा',
          'notes': '• लेखक: डॉ. भीमराव आंबेडकर\n• मुख्य विचार: जाति प्रथा श्रम विभाजन के साथ-साथ श्रमिक विभाजन का भी रूप है।'
        },
        {
          'ch': 'वर्णिका: दही वाली मगम्मा',
          'notes': '• लेखक: श्रीनिवास (कन्नड़ कहानी)\n• पात्र: मगम्मा, उसकी बहू नजम्मा और रंगप्पा।'
        },
        {
          'ch': 'हिंदी व्याकरण: महत्वपूर्ण नियम',
          'notes': '• समास के 6 भेद: अव्ययीभाव, तत्पुरुष, कर्मधारय, द्विगु, द्वंद्व, बहुव्रीहि\n• कारक के 8 भेद'
        },
      ]
    },
    {
      'subject': 'संस्कृत (Sanskrit)',
      'icon': Icons.auto_stories,
      'color': Colors.teal,
      'chapters': [
        {
          'ch': 'पाठ 1: मङ्गलम्',
          'notes': '• "सत्यमेव जयते नानृतम्" (मुण्डकोपनिषद्) - सत्य की ही जीत होती है।'
        },
        {
          'ch': 'पाठ 2: पाटलिपुत्रवैभवम्',
          'notes': '• पटना का इतिहास 2500 वर्ष पुराना है। गुरु गोविंद सिंह जी का जन्मस्थान।'
        },
        {
          'ch': 'पाठ 3: अलसकथा',
          'notes': '• लेखक: विद्यापति। अलसशाला में आग लगाने पर केवल 4 असली आलसी ही बचे।'
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
          elevation: 2,
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
      'sol': 'चरण 1: 225 = 135 × 1 + 90\nचरण 2: 135 = 90 × 1 + 45\nचरण 3: 90 = 45 × 2 + 0\n\nअंतिम भाजक 45 है। अतः HCF(135, 225) = 45'
    },
    {
      'sub': 'गणित - प्रश्नावली 1.3',
      'q': 'सिद्ध कीजिए कि √5 एक अपरिमेय संख्या है।',
      'sol': 'माना √5 परिमेय है। √5 = a/b (सह-अभाज्य पूर्णांक, b ≠ 0)\n5 = a²/b² ⇒ a² = 5b² (a, 5 से विभाज्य है)\na = 5c मानकर: 25c² = 5b² ⇒ b² = 5c² (b भी 5 से विभाज्य है)\nयह हमारी मान्यता के विपरीत है। अतः √5 अपरिमेय है।'
    },
    {
      'sub': 'विज्ञान - रासायनिक अभिक्रियाएँ',
      'q': 'संतुलित रासायनिक समीकरण क्या है? इसे संतुलित करना क्यों आवश्यक है?',
      'sol': 'जिस समीकरण में अभिकारकों और उत्पादों के परमाणुओं की संख्या समान होती है, उसे संतुलित समीकरण कहते हैं।\nद्रव्यमान संरक्षण के नियम के अनुसार द्रव्यमान का न निर्माण होता है और न विनाश, अतः समीकरण संतुलित करना अनिवार्य है।'
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
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(p['year']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                    Text(p['sub']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(p['q']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text('उत्तर: ${p['ans']}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------- 4. ऑनलाइन टेस्ट सीरीज़ ----------------
class OnlineTestScreen extends StatefulWidget {
  const OnlineTestScreen({super.key});

  @override
  State<OnlineTestScreen> createState() => _OnlineTestScreenState();
}

class _OnlineTestScreenState extends State<OnlineTestScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'q': 'π (पाई) एक संख्या है:',
      'opts': ['परिमेय', 'अपरिमेय', 'पूर्णांक', 'प्राकृत'],
      'ans': 1
    },
    {
      'q': 'द्विघात बहुपद के शून्यकों की अधिकतम संख्या होती है:',
      'opts': ['1', '2', '3', 'अनंत'],
      'ans': 1
    },
    {
      'q': 'दाढ़ी बनाने में किस प्रकार के दर्पण का उपयोग किया जाता है?',
      'opts': ['समतल', 'उत्तल', 'अवतल', 'इनमें से कोई नहीं'],
      'ans': 2
    },
    {
      'q': 'शुद्ध जल का pH मान कितना होता है?',
      'opts': ['0', '7', '14', '1'],
      'ans': 1
    },
    {
      'q': 'भारतीय राष्ट्रीय कांग्रेस की स्थापना कब हुई थी?',
      'opts': ['1885', '1905', '1919', '1947'],
      'ans': 0
    },
  ];

  final Map<int, int> selected = {};
  int? finalScore;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.deepPurple.withAlpha(25), borderRadius: BorderRadius.circular(10)),
            child: const Row(
              children: [
                Icon(Icons.timer, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text('बिहार बोर्ड 10th - ऑल सब्जेक्ट मॉडल टेस्ट', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(questions.length, (i) {
            final q = questions[i];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('प्र. ${i + 1}: ${q['q']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ...List.generate(q['opts'].length, (oIdx) {
                      return RadioListTile<int>(
                        value: oIdx,
                        groupValue: selected[i],
                        title: Text(q['opts'][oIdx]),
                        onChanged: (val) => setState(() => selected[i] = val!),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
          ElevatedButton.icon(
            onPressed: () {
              int s = 0;
              for (int i = 0; i < questions.length; i++) {
                if (selected[i] == questions[i]['ans']) s++;
              }
              setState(() => finalScore = s);
            },
            icon: const Icon(Icons.check_circle),
            label: const Text('टेस्ट सबमिट करें'),
          ),
          if (finalScore != null) ...[
            const SizedBox(height: 14),
            Card(
              color: Colors.green.withAlpha(35),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '🎉 आपका स्कोर: $finalScore / ${questions.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

// ---------------- 5. विद्या AI एजेंट ----------------
class VidyaAiDoubtScreen extends StatefulWidget {
  const VidyaAiDoubtScreen({super.key});

  @override
  State<VidyaAiDoubtScreen> createState() => _VidyaAiDoubtScreenState();
}

class _VidyaAiDoubtScreenState extends State<VidyaAiDoubtScreen> {
  final TextEditingController _ctrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _img;
  final String _apiKey = 'AQ.Ab8RN6IA1m4s9fIKAcMVV0t3GQ6Q' + 'VtARTT-cmmZ9ti1jurd4dw';
  String _ans = '';
  bool _loading = false;

  Future<void> _pick(ImageSource s) async {
    final file = await _picker.pickImage(source: s, imageQuality: 85);
    if (file != null) setState(() => _img = File(file.path));
  }

  Future<void> _ask() async {
    final t = _ctrl.text.trim();
    if (t.isEmpty && _img == null) return;

    setState(() {
      _loading = true;
      _ans = '';
    });

    try {
      final model = GenerativeModel(model: 'gemini-3.6-flash', apiKey: _apiKey);
      final List<Part> parts = [];
      if (_img != null) {
        parts.add(DataPart('image/jpeg', await _img!.readAsBytes()));
      }
    
