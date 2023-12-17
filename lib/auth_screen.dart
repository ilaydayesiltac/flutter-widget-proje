// auth_screen.dart
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const AuthScreen({
    Key? key,
    required this.usernameController,
    required this.passwordController,
  }) : super(key: key);

  bool checkCredentials(String username, String password) {
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/background_image.jpg'),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;

                      if (checkCredentials(username, password)) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Giriş Bilgileri'),
                              content: Column(
                                children: [
                                  Text('Kullanıcı Adı: $username'),
                                  Text('Şifre: $password'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Tamam'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Giriş başarısız. Kullanıcı adı ve şifre boş olamaz.'),
                        ));
                      }
                    },
                    child: Text('Giriş Yap'),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;

                      // Yeni kullanıcıyı kaydet veya işlemleri gerçekleştir
                    },
                    child: Text('Kayıt Ol'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
