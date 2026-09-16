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
      title: 'Vidya Agent: Bihar Board 10th',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  final List<Widget> _screens = [
    const SubjectsListScreen(),
    const FullPyqScreen(),
    const VidyaAgentDoubtScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.school, color: Colors.amber),
            SizedBox(width: 8),
            Text('विद्या एजेंट: BSEB 10th', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: _screens[_tabIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'सभी विषय व नोट्स'),
          NavigationDestination(icon: Icon(Icons.history_edu), label: '10 वर्ष PYQ'),
          NavigationDestination(icon: Icon(Icons.camera_enhance), label: 'AI डाउट सॉल्वर'),
        ],
      ),
    );
  }
}

// ---------------- 1. सभी विषयों की सूची स्क्रीन ----------------
class SubjectsListScreen extends StatelessWidget {
  const SubjectsListScreen({super.key});

  final List<Map<String, dynamic>> subjects = const [
    {
      'name': 'गणित (Mathematics)',
      'icon': Icons.calculate,
      'color': Colors.blue,
      'chapters': [
        'अध्याय 1: वास्तविक संख्याएँ',
        'अध्याय 2: बहुपद',
        'अध्याय 3: दो चर वाले रैखिक समीकरण युग्म',
        'अध्याय 4: द्विघात समीकरण',
        'अध्याय 5: समांतर श्रेढ़ियाँ (AP)',
        'अध्याय 6: त्रिभुज',
        'अध्याय 7: निर्देशांक ज्यामिति',
        'अध्याय 8: त्रिकोणमिति का परिचय',
        'अध्याय 9: त्रिकोणमिति के अनुप्रयोग',
        'अध्याय 10: वृत्त',
        'अध्याय 11: रचनाएँ',
        'अध्याय 12: वृत्तों से संबंधित क्षेत्रफल',
        'अध्याय 13: पृष्ठीय क्षेत्रफल और आयतन',
        'अध्याय 14: सांख्यिकी',
        'अध्याय 15: प्रायिकता'
      ]
    },
    {
      'name': 'विज्ञान (Science)',
      'icon': Icons.biotech,
      'color': Colors.green,
      'chapters': [
        'भौतिकी - प्रकाश परावर्तन तथा अपवर्तन',
        'भौतिकी - मानव नेत्र तथा रंगबिरंगा संसार',
        'भौतिकी - विद्युत और इसके प्रभाव',
        'भौतिकी - विद्युत धारा के चुंबकीय प्रभाव',
        'रसायन - रासायनिक अभिक्रियाएँ एवं समीकरण',
        'रसायन - अम्ल, क्षारक एवं लवण',
        'रसायन - धातु एवं अधातु',
        'रसायन - कार्बन एवं उसके यौगिक',
        'जीव विज्ञान - जैव प्रक्रम (Life Processes)',
        'जीव विज्ञान - नियंत्रण एवं समन्वय',
        'जीव विज्ञान - जीव जनन कैसे करते हैं',
        'जीव विज्ञान - आनुवंशिकता एवं जैव विकास',
        'हमारा पर्यावरण'
      ]
    },
    {
      'name': 'सामाजिक विज्ञान (Social Science)',
      'icon': Icons.public,
      'color': Colors.orange,
      'chapters': [
        'इतिहास - यूरोप में राष्ट्रवाद',
        'इतिहास - समाजवाद एवं साम्यवाद',
        'इतिहास - भारत में राष्ट्रवाद',
        'भूगोल - भारत: संसाधन एवं उपयोग',
        'भूगोल - कृषि, खनिज एवं ऊर्जा संसाधन',
        'राजनीति विज्ञान - लोकतंत्र में सत्ता की साझेदारी',
        'अर्थशास्त्र - अर्थव्यवस्था एवं इसके विकास का इतिहास',
        'आपदा प्रबंधन - प्राकृतिक आपदा एवं प्रबंधन'
      ]
    },
    {
      'name': 'हिंदी (Hindi - गोधूलि & वर्णिका)',
      'icon': Icons.translate,
      'color': Colors.purple,
      'chapters': [
        'गद्य खंड - श्रम विभाजन और जाति प्रथा',
        'गद्य खंड - विष के दांत',
        'गद्य खंड - भारत से हम क्या सीखें',
        'गद्य खंड - नाखून क्यों बढ़ते हैं',
        'पद्य खंड - राम नाम बिनु बिरथे जगि जनमा',
        'वर्णिका - मगम्मा (दही वाली मगम्मा)',
        'वर्णिका - ढाते विश्वास',
        'हिंदी व्याकरण - संधि, समास, कारक, पर्यायवाची'
      ]
    },
    {
      'name': 'संस्कृत (Sanskrit - पीयूषम)',
      'icon': Icons.auto_stories,
      'color': Colors.teal,
      'chapters': [
        'पाठ 1: मङ्गलम्',
        'पाठ 2: पाटलिपुत्रवैभवम्',
        'पाठ 3: अलसकथा',
        'पाठ 4: संस्कृतसाहित्ये लेखिकाः',
        'पाठ 5: भारतमहिमा',
        'संस्कृत व्याकरण - शब्द रूप, धातु रूप एवं अनुवाद'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: subjects.length,
      itemBuilder: (context, i) {
        final sub = subjects[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: (sub['color'] as Color).withAlpha(40),
              radius: 24,
              child: Icon(sub['icon'], color: sub['color']),
            ),
            title: Text(
              sub['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('${(sub['chapters'] as List).length} अध्याय शामिल'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterListScreen(
                    subjectName: sub['name'],
                    chapters: List<String>.from(sub['chapters']),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ---------------- 2. अध्याय सूची स्क्रीन ----------------
class ChapterListScreen extends StatelessWidget {
  final String subjectName;
  final List<String> chapters;

  const ChapterListScreen({super.key, required this.subjectName, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subjectName)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: chapters.length,
        itemBuilder: (context, i) {
          final ch = chapters[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${i + 1}'),
              ),
              title: Text(ch, style: const TextStyle(fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.menu_book),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChapterDetailScreen(subject: subjectName, chapter: ch),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------------- 3. अध्यायवार नोट्स, अभ्यास प्रश्न और क्विज़ स्क्रीन ----------------
class ChapterDetailScreen extends StatefulWidget {
  final String subject;
  final String chapter;

  const ChapterDetailScreen({super.key, required this.subject, required this.chapter});

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  final String _apiKey = 'AQ.Ab8RN6IA1m4s9fIKAcMVV0t3GQ6Q' + 'VtARTT-cmmZ9ti1jurd4dw';
  String _generatedContent = '';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  Future<void> _fetchSmartStudy(String type) async {
    setState(() {
      _loading = true;
      _generatedContent = '';
    });

    try {
      final model = GenerativeModel(model: 'gemini-3.6-flash', apiKey: _apiKey);
      final prompt = 'आप "विद्या एजेंट" हैं - बिहार बोर्ड कक्षा 10वीं हिंदी माध्यम के सबसे अनुभवी शिक्षक। '
          'विषय: "${widget.subject}", अध्याय: "${widget.chapter}". '
          'कृपया इस अध्याय के लिए $type तैयार करें। इसे बिल्कुल साफ़, हिंदी में, स्टेप-बाय-स्टेप और बिहार बोर्ड परीक्षा के दृष्टिकोण से दें।';

      final res = await model.generateContent([Content.text(prompt)]);
      setState(() {
        _generatedContent = res.text ?? 'कोई डेटा प्राप्त नहीं हुआ।';
      });
    } catch (e) {
      setState(() {
        _generatedContent = 'त्रुटि: $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapter, style: const TextStyle(fontSize: 16)),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(text: 'स्मार्ट नोट्स'),
            Tab(text: 'अभ्यास प्रश्न हल'),
            Tab(text: 'वस्तुनिष्ठ क्विज़'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          _buildTabContent('विस्तृत परीक्षा नोट्स (मुख्य बिंदु और परिभाषाएँ)'),
          _buildTabContent('एनसीईआरटी (NCERT) के सभी मुख्य अभ्यास प्रश्नों का चरण-दर-चरण हल'),
          _buildTabContent('10 महत्वपूर्ण वस्तुनिष्ठ प्रश्न (MCQs) 4 विकल्पों और सही उत्तर सहित'),
        ],
      ),
    );
  }

  Widget _buildTabContent(String type) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            onPressed: _loading ? null : () => _fetchSmartStudy(type),
            icon: const Icon(Icons.auto_awesome),
            label: Text('$type लोड करें / रिफ्रेश करें'),
          ),
          const SizedBox(height: 16),
          if (_loading)
            const Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator()))
          else if (_generatedContent.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SelectableText(
                _generatedContent,
                style: const TextStyle(fontSize: 15, height: 1.5),
              ),
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'ऊपर बटन दबाकर ${widget.chapter} का संपूर्ण $type तुरंत लोड करें।',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------- 4. 10 वर्ष PYQ स्क्रीन ----------------
class FullPyqScreen extends StatelessWidget {
  const FullPyqScreen({super.key});

  final List<Map<String, String>> pyqs = const [
    {
      'year': 'BSEB 2024 (वार्षिक)',
      'sub': 'गणित',
      'q': 'द्विघात समीकरण 2x² - 4x + 3 = 0 का विविक्तकर (D) क्या होगा?',
      'ans': 'D = b² - 4ac = (-4)² - 4(2)(3) = 16 - 24 = -8 (काल्पनिक मूल)'
    },
    {
      'year': 'BSEB 2024 (वार्षिक)',
      'sub': 'विज्ञान',
      'q': 'विद्युत आवेश का SI मात्रक क्या होता है?',
      'ans': 'विद्युत आवेश का SI मात्रक कूलॉम (Coulomb - C) होता है।'
    },
    {
      'year': 'BSEB 2023 (वार्षिक)',
      'sub': 'सामाजिक विज्ञान',
      'q': 'जालियानवाला बाग हत्याकांड कब और कहाँ हुआ था?',
      'ans': '13 अप्रैल 1919 को पंजाब के अमृतसर में हुआ था।'
    },
    {
      'year': 'BSEB 2023 (वार्षिक)',
      'sub': 'हिंदी',
      'q': 'श्रम विभाजन और जाति प्रथा के लेखक कौन हैं?',
      'ans': 'डॉ. भीमराव आंबेडकर।'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: pyqs.length,
      itemBuilder: (context, i) {
        final p = pyqs[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(label: Text(p['year']!)),
                    Text(p['sub']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(p['q']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text('उत्तर: ${p['ans']}', style: const TextStyle(color: Colors.green, fontSize: 15)),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------- 5. विद्या AI एजेंट (कैमरा डाउट सॉल्वर) ----------------
class VidyaAgentDoubtScreen extends StatefulWidget {
  const VidyaAgentDoubtScreen({super.key});

  @override
  State<VidyaAgentDoubtScreen> createState() => _VidyaAgentDoubtScreenState();
}

class _VidyaAgentDoubtScreenState extends State<VidyaAgentDoubtScreen> {
  final TextEditingController _doubtCtrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _img;
  final String _apiKey = 'AQ.Ab8RN6IA1m4s9fIKAcMVV0t3GQ6Q' + 'VtARTT-cmmZ9ti1jurd4dw';
  String _answer = '';
  bool _busy = false;

  Future<void> _pick(ImageSource s) async {
    final f = await _picker.pickImage(source: s, imageQuality: 85);
    if (f != null) setState(() => _img = File(f.path));
  }

  Future<void> _solve() async {
    final t = _doubtCtrl.text.trim();
    if (t.isEmpty && _img == null) return;

    setState(() {
      _busy = true;
      _answer = '';
    });

    try {
      final model = GenerativeModel(model: 'gemini-3.6-flash', apiKey: _apiKey);
      final List<Part> parts = [];
      if (_img != null) {
        parts.add(DataPart('image/jpeg', await _img!.readAsBytes()));
      }
      parts.add(TextPart(
          'आप "विद्या एजेंट" हैं - बिहार बोर्ड 10वीं के सर्वोत्तम शिक्षक। छात्र के इस सवाल का चरण-दर-चरण आसान हिंदी में समाधान समझाइए:\n$t'));

      final res = await model.generateContent([Content.multi(parts)]);
      setState(() => _answer = res.text ?? 'उत्तर प्राप्त नहीं हुआ।');
    } catch (e) {
      setState(() => _answer = 'Error: $e');
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _doubtCtrl,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'किसी भी विषय का कोई भी सवाल यहाँ लिखें...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _busy ? null : () => _pick(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('फ़ोटो खींचें'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _busy ? null : () => _pick(ImageSource.gallery),
                  icon: const Icon(Icons.photo),
                  label: const Text('गैलरी से लें'),
                ),
              ),
            ],
          ),
          if (_img != null) ...[
            const SizedBox(height: 10),
            Image.file(_img!, height: 160, fit: BoxFit.cover),
          ],
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _busy ? null : _solve,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('विद्या एजेंट से हल पाएँ'),
          ),
          const SizedBox(height: 16),
          if (_busy)
            const Center(child: CircularProgressIndicator())
          else if (_answer.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SelectableText(_answer, style: const TextStyle(fontSize: 15, height: 1.5)),
            ),
        ],
      ),
    );
  }
}
