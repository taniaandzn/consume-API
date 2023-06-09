import 'package:costume_api/controller/user_controller.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: UserController().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              separatorBuilder: (_, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (_, index) {
                User user = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(user.name!),
                    subtitle: Text(user.email!),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }),
    );
  }
}
