import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    AboutScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    EducationScreen(),
    InterestsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.interests),
            label: 'Interests',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  Widget _buildSkillBar(String skill, double percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: percentage,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text('${(percentage * 100).toInt()}%'),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Skills:',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            _buildSkillBar('Flutter', 0.90),
            _buildSkillBar('Dart', 0.85),
            _buildSkillBar('UI/UX Design', 0.80),
          ],
        ),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  Widget _buildProjectCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Projects and Experience',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildProjectCard(
              'Todo App',
              'A simple todo list app built with Flutter and Firebase.',
            ),
            _buildProjectCard(
              'Weather App',
              'A weather app built with Flutter that fetches data from a REST API.',
            ),
            _buildProjectCard(
              'Expense Tracker App',
              'The app enables users to efficiently manage their expenses on-the-go by providing a user-friendly interface to track their spending habits.',
            ),
            SizedBox(height: 20),
            Text(
              'Experience',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildProjectCard(
              'Front-End Web Developer',
              'Code Alpha\nRemote Intern\n\nSuccessfully completed internship at Code Alpha Software House, gaining valuable hands-on experience in software development and contributing to real-world projects. Engaged in collaborative teamwork, honed technical skills, and gained insights into the professional software development environment.',
            ),
          ],
        ),
      ),
    );
  }
}

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  Widget _buildEducationCard(String title, String institution, String details) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(institution, style: TextStyle(fontSize: 18)),
            SizedBox(height: 4),
            Text(details),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Education',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildEducationCard(
              'Graduation',
              'The University Of Lahore',
              'Bachelor of Science in Information Engineering Technology, BSIET (Continue).',
            ),
            _buildEducationCard(
              'Intermediate',
              'pgc College',
              'Fsc. Pre-engineering. (2019-2021)',
            ),
            SizedBox(height: 30),
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Profession: Application Developer',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date Of Birth: 22-06-2003', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Education: Higher Education', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  Widget _buildInterestItem(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(description),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Portfolio Interest Section',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'My Interests:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildInterestItem(
              'Mobile App Development',
              'Creating innovative and user-friendly mobile applications.',
            ),
            _buildInterestItem(
              'Web Development',
              'Building responsive and scalable web applications.',
            ),
            _buildInterestItem(
              'Machine Learning',
              'Exploring algorithms and models to extract insights from data.',
            ),
            _buildInterestItem(
              'UI/UX Design',
              'Designing intuitive and visually appealing user interfaces.',
            ),
            _buildInterestItem(
              'Cloud Computing',
              'Leveraging cloud platforms for efficient and scalable solutions.',
            ),
            _buildInterestItem(
              'Open Source Contribution',
              'Contributing to open source projects and communities.',
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Add padding at top for status bar
            Text(
              'My PortFolio',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Usman Ijaz',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'I AM MOBILE APPLICATION(android,ios,web)\nDEVELOPER AND DESIGNER',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialIcon(Icons.facebook, 'Facebook'),
                _buildSocialIcon(Icons.camera_alt, 'Instagram'),
                _buildSocialIcon(Icons.facebook, 'LinkedIn'),
                _buildSocialIcon(Icons.telegram, 'Telegram'),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Passionate developer adept at crafting elegant and efficient solutions to complex problems. Dedicated to continuous learning and staying abreast of emerging technologies.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // This button's functionality is now handled by the bottom navigation
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('CHECK RESUME'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}