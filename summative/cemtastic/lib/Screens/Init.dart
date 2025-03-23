import 'package:flutter/material.dart';
import 'Welcome.dart';

class Init extends StatelessWidget {
  const Init({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/cemento.jpg',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      // Large screen: Use Row layout
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2, // Adjust space usage
                            child: Image.asset(
                              'assets/images/city.png',
                              width: 350.0,
                              height: 350.0,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            flex: 3, // Adjust text size on large screens
                            child: Text(
                              'Sure you can trust your cement? Ask us!',
                              style: TextStyle(fontSize: 48),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    } else {
                      // Small screen: Use Column layout
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/city.png',
                            width: 250.0,
                            height: 250.0,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Sure you can trust your cement? Ask us!',
                            style: TextStyle(fontSize: 32),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _navigateToNextScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // ✅ Black button background
                  foregroundColor: const Color.fromARGB(
                      255, 242, 240, 240), // ✅ Grey text color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Predict()));
}
