import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<Map<String, dynamic>> data = [
    {
      "image": "assets/images/ssa.png",
      "text":
      "Productivity app for Muslims that combines prayer times, task management, and note-taking to enhance daily life with faith."
    },
    {
      "image": "assets/images/quran.png",
      "text":
      "Productivity app for Muslims that combines prayer times, task management, and note-taking to enhance daily life with faith."
    },
    {
      "image": "assets/images/daynight.png",
      "text":
      "Productivity app for Muslims that combines prayer times, task management, and note-taking to enhance daily life with faith."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // ---- Skip Button ----
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "skip",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // ---- PageView ----
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: data.length,
                onPageChanged: (i) {
                  setState(() {
                    _index = i;
                  });
                },
                itemBuilder: (context, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // ---- Icon ----
                      CircleAvatar(
                        radius: 110,
                        backgroundColor: const Color(0xffdbe7dc),
                        child: Image.asset(
                          height: 20,
                          data[i]["image"],
                          color: const Color(0xff556c55),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // ---- Text ----
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          data[i]["text"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff1c2b3a),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),
                    ],
                  );
                },
              ),
            ),

            // ---- Page Indicator ----
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                data.length,
                    (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _index == i ? Colors.black87 : Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---- Next Button ----
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: GestureDetector(
                onTap: () {
                  if (_index < data.length - 1) {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbe7dc),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "التالي",
                    style: TextStyle(
                      color: Color(0xff556c55),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
