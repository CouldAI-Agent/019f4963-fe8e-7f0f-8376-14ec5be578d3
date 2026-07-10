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
          seedColor: const Color(0xFF8C715A), // Soft warm taupe/brown
          primary: const Color(0xFF8C715A),
          secondary: const Color(0xFF6B7A65), // Soft muted green
          surface: const Color(0xFFFAFAFA),
          background: const Color(0xFFFAFAFA),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Or a serif font if available, but Roboto with light weights is clean
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF8C715A)),
          titleTextStyle: TextStyle(
            color: Color(0xFF8C715A),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.2,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          color: Colors.white,
        ),
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.spa_outlined),
            selectedIcon: Icon(Icons.spa),
            label: 'Leistungen',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline),
            selectedIcon: Icon(Icons.star),
            label: 'Bewertungen',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            selectedIcon: Icon(Icons.location_on),
            label: 'Kontakt',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'Brenda Nuad',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Willkommen',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1.5,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Entspannung & Wohlbefinden',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Gönnen Sie sich eine Auszeit vom Alltag. In unserem familiären Salon in Aspach bieten wir Ihnen traditionelle und entspannende Massagen an. Erleben Sie authentische Thai-Massage für Körper und Geist in einer Atmosphäre der absoluten Ruhe.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.8,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 48),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.star, color: Colors.amber[600], size: 32),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5.0 Sterne',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[900],
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Basierend auf 17 Google Rezensionen',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
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
        ),
      ],
    );
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {'title': 'Traditionelle Thaimassage', 'duration': '60 / 90 Min'},
    {'title': 'Thaimassage mit Öl', 'duration': '60 / 90 Min'},
    {'title': 'Aromaöl-Massage', 'duration': '60 / 90 Min'},
    {'title': 'Hot Stone Massage', 'duration': '60 / 90 Min'},
    {'title': 'Anti-Stress-Massage', 'duration': '30 / 60 Min'},
    {'title': 'Fuß- & Bein-Massage', 'duration': '45 / 60 Min'},
    {'title': 'Thaimassage kombi Fußreflexzonen', 'duration': '90 Min'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leistungen'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.spa_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            service['duration'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bewertungen'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          foregroundColor: Theme.of(context).colorScheme.primary,
                          radius: 24,
                          child: Text(
                            review['name']![0],
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review['name']!,
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                review['time']!,
                                style: TextStyle(color: Colors.grey[500], fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: Icon(Icons.star, color: Colors.amber[400], size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      review['text']!,
                      style: TextStyle(
                        height: 1.6,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.unsplash.com/photo-1600334129128-68505bce6a4f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Besuchen Sie uns',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 1.0,
                  ),
            ),
            const SizedBox(height: 32),
            _buildInfoRow(
              context,
              Icons.location_on_outlined,
              'Adresse',
              'Oberstenfelder Str. 24\n71546 Aspach',
            ),
            const SizedBox(height: 24),
            _buildInfoRow(
              context,
              Icons.phone_outlined,
              'Telefon',
              '0160 92195270',
            ),
            const SizedBox(height: 24),
            _buildInfoRow(
              context,
              Icons.access_time_outlined,
              'Öffnungszeiten',
              'Täglich ab 10:00 Uhr geöffnet\nBitte vereinbaren Sie einen Termin.',
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone),
                label: const Text(
                  'Jetzt anrufen',
                  style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey[500],
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
