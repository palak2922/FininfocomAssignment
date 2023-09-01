import 'package:fininfocom/Model/UserModel.dart';
import 'package:fininfocom/Service/DetailService.dart';
import 'package:flutter/material.dart';


class UserTest extends StatefulWidget {
  const UserTest({Key? key}) : super(key: key);

  @override
  State<UserTest> createState() => _UserTestState();
}

class _UserTestState extends State<UserTest> {

  Future<User> getUser = Detailservice().GetUserDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black,)
        ),
        centerTitle: true,
        title: Text(
          'User Detail',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: FutureBuilder(
        future: getUser,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 5,
                ),
              ),
            );
          }

          return Center(
            child: Text(
              "${snapshot.data?.results[0].toJson()}",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w300
              ),
            ),
          );
        },
      ),
    );
  }
}



