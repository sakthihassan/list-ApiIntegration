import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'listModel.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dio = Dio();
  List<ListModel> users = [];

  Future<void> fetchList() async {
    try {
      final response = await dio.get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        setState(() {
          users = (response.data as List)
              .map((userJson) => ListModel.fromJson(userJson))
              .toList();
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Details"),
        ),
        body: users.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                users[index].name![0].toString(),
                                style: TextStyle(fontSize: 40, color: Colors.white),
                              ),
                              maxRadius: 40,
                            ),
                            SizedBox(height: 16),
                            Text(
                              users[index].name.toString(),
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Contact Information",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Divider(color: Colors.blue),
                      RichText(
                        text: TextSpan(
                          text: 'Username: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].username,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Email: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].email,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Phone: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].phone,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Website: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].website,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Address",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Divider(color: Colors.blue),
                      RichText(
                        text: TextSpan(
                          text: 'Street: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].address!.street,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'City: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].address!.city,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'ZipCode: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].address!.zipcode,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Company",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Divider(color: Colors.blue),
                      RichText(
                        text: TextSpan(
                          text: 'Name: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: users[index].company!.name,
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
