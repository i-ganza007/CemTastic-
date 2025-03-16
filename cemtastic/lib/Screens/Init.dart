import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 40.0,right: 40.0), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/city.png',
                    width: 350.0, 
                    height: 350.0,
                  ),
                  const SizedBox(width: 16), 
                  const Expanded(
                    child: Text(
                      'Sure you can trust your cement? Ask us!',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), 
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // ✅ Black button background
                foregroundColor: const Color.fromARGB(255, 242, 240, 240), // ✅ Grey text color
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
