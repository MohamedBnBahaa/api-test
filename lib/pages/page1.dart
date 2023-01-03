import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Map time = {"country": "EGYPT", "currentTime": "10:30 am"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 58, 100),
        title: const Text(
          "page1",
          style: TextStyle(fontSize: 33),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic receivedDateFromPage2 =
                await Navigator.pushNamed(context, '/second');

                setState(() {
                  if (receivedDateFromPage2 == null) {
                    time = {
                      "country": "or Try again later...",
                      "currentTime": "Select one of the options"};
                  } else {
                    time = {
                      "country": receivedDateFromPage2["country"],
                      "currentTime": receivedDateFromPage2["currentTime"]
                    };
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 20, 58, 100)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(19)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11))),
              ),
              child: const Text(
                "Go  to page2",
                style: TextStyle(fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 99,
            ),
            Text(
              time["currentTime"],
              style: const TextStyle(fontSize: 44),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              time["country"],
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}