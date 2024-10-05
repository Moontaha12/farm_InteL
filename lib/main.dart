import 'package:flutter/material.dart';
void main() {
  runApp(FarmIntelApp());
}

class FarmIntelApp extends StatelessWidget {
  const FarmIntelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmIntel App',
      home: Screen1(),
    );
  }
}

// Screen 1: Enter Name, Choose Gender, or Sign in with Google
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController nameController = TextEditingController();
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to FarmIntel")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Enter Your Name"),
            ),
            DropdownButton<String>(
              value: selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen 2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Google Sign-In functionality
                // You would integrate Google Sign-In here.
              },
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2: Select Country, Language, and Specific Location
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String selectedCountry = 'USA';
  String selectedLanguage = 'English';
  String selectedLocation = 'New York';

  // Location options based on country selection
  Map<String, List<String>> countryLocations = {
    'USA': ['New York', 'California', 'Texas', 'Florida', 'Illinois'],
    'India': ['Mumbai', 'Delhi', 'Bangalore', 'Kolkata', 'Chennai'],
    'Bangladesh': ['Dhaka', 'Chittagong', 'Sylhet', 'Khulna'],
    'Brazil': ['São Paulo', 'Rio de Janeiro', 'Brasilia', 'Salvador'],
    'Germany': ['Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'Cologne'],
    'China': ['Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen'],
  };

  List<String> languages = [
    'English',
    'Bengali',
    'Hindi',
    'Portuguese',
    'German',
    'Chinese'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Country and Language")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCountry,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                  selectedLocation = countryLocations[selectedCountry]![0];
                });
              },
              items: countryLocations.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedLocation,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue!;
                });
              },
              items: countryLocations[selectedCountry]!
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen 3
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3()),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 3: Dive Into Services
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dive Into Services")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Dive into our services",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ServiceBox("Soil Moisture And Mineral", Screen4()),
                  ServiceBox("Weather and Disaster Map", Screen5()),
                  ServiceBox("Harvest Time", Screen6()),
                  ServiceBox("AI Chat Support", Screen7()),
                  ServiceBox("Community", Screen8()),
                  ServiceBox("Q/A", Screen9()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for the Service Box
class ServiceBox extends StatelessWidget {
  final String title;
  final Widget destination;

  const ServiceBox(this.title, this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// Screen 4: Soil Moisture
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soil Moisture")),
      body: const Center(
        child: Text("Real-time Soil Moisture Data Here"),
      ),
    );
  }
}

// Screen 5: Weather and Disaster Map
class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather and Disaster Map")),
      body: const Center(
        child: Text("Weather and Disaster Map Here"),
      ),
    );
  }
}

// Screen 6: Harvest Time
class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Harvest Time")),
      body: const Center(
        child: Text("Real-time Harvest Recommendations Here"),
      ),
    );
  }
}

// Screen 7: AI Chat Support
class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat Support")),
      body: const Center(
        child: Text("AI Chat Support Here"),
      ),
    );
  }
}

// Screen 8: Community
class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Community")),
      body: const Center(
        child: Text("Community Programs Here"),
      ),
    );
  }
}

// Screen 9: Q/A Section
class Screen9 extends StatelessWidget {
  const Screen9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Q/A Section")),
      body: const Center(
        child: Text("Q/A Section with Featured Topics and Experts Here"),
      ),
    );
  }
}
