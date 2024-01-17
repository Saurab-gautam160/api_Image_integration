import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //var url = 'http://dog.ceo/api/breeds/image/random';

  Future<dynamic> getRequest() async {
    try {
      final response =
          await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
      final res = jsonDecode(response.body);
      return (res['message']);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JustLooking',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder(
        future: getRequest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Use the snapshot data to build your UI
            final data = snapshot.data;
            return Center(
              child: Column(
                children: [
                  Card(
                    elevation: 8.0,
                    child: Image.network('$data'),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          final data = snapshot.data;
                        });
                      },
                      icon: const Icon(Icons.refresh_sharp),
                      label: const Text('Refresh'))
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
