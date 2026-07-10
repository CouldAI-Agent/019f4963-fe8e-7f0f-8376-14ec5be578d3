import 'package:flutter/material.dart';

void main() {
  runApp(const BrendaThaiMassageApp());
}

class BrendaThaiMassageApp extends StatelessWidget {
  const BrendaThaiMassageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brenda Nuad Thai Massage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4226), // Earthy brown/gold
          primary: const Color(0xFF8B5A2B),
          secondary: const Color(0xFF556B2F), // Olive green
          surface: const Color(0xFFFFF8DC), // Cornsilk
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ServicesScreen(),
    const ReviewsScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brenda Nuad Thai Massage', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.spa), label: 'Services'),
          NavigationDestination(icon: Icon(Icons.star), label: 'Reviews'),
          NavigationDestination(icon: Icon(Icons.location_on), label: 'Contact'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.spa, size: 80, color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    'Entspannung & Wohlbefinden',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Willkommen bei Brenda Nuad Thai Massage',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Gönnen Sie sich eine Auszeit vom Alltag. In unserem familiären Salon in Aspach bieten wir Ihnen traditionelle und entspannende Massagen an. Erleben Sie authentische Thai-Massage für Körper und Geist.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[600], size: 40),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5.0 Sterne',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Text('Basierend auf 17 Google Rezensionen'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<String> services = const [
    'Traditionelle Thaimassage',
    'Thaimassage mit Öl',
    'Aromaöl-Massage',
    'Hot Stone Massage',
    'Anti-Stress-Massage',
    'Fuß- & Bein-Massage',
    'Thaimassage kombi Fußreflexzonen',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(Icons.spa, color: Theme.of(context).colorScheme.secondary),
            title: Text(services[index], style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  final List<Map<String, String>> reviews = const [
    {
      'name': 'Toni Geppert',
      'time': 'vor 6 Monaten',
      'text': 'Vom ersten Moment an fühlt man sich hier wirklich wohl. Die Massage ist individuell auf einen abgestimmt, und sie nimmt sich wirklich Zeit! Die ruhige Atmosphäre ist perfekt zum Abschalten.',
    },
    {
      'name': 'Zeynep Özkan',
      'time': 'vor 9 Monaten',
      'text': '⭐️⭐️⭐️⭐️⭐️\nBrendas Thai Massage Salon ist einfach wundervoll! Sehr empfehlenswert.',
    },
    {
      'name': 'Philipp (Lip24)',
      'time': 'vor 10 Monaten',
      'text': 'Beste Massage im Umkreis. Hier wird man sehr gut beraten und auf die Problem-Zonen (bei meinen Fall den Rücken) eingegangen. Sehr gute traditionelle Massage.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        review['name']![0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(review['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(review['time']!, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber[600], size: 16)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(review['text']!, style: const TextStyle(height: 1.4)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kontakt & Anfahrt', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),
          _buildInfoRow(context, Icons.location_on, 'Adresse', 'Oberstenfelder Str. 24\n71546 Aspach'),
          const SizedBox(height: 16),
          _buildInfoRow(context, Icons.phone, 'Telefon', '0160 92195270'),
          const SizedBox(height: 16),
          _buildInfoRow(context, Icons.access_time, 'Öffnungszeiten', 'Öffnet um 10:00 Uhr'),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: const Text('Jetzt anrufen'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 4),
              Text(content, style: const TextStyle(fontSize: 16, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
