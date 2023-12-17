//gerekli kütüphaneleri aktarmak için 
import 'package:flutter/material.dart';

//uygulamayı başlatırken kullanacağım main fonksiyonu
void main() {
  runApp(MyApp());
}
// Uygulamanın ana bileşeni olan MyApp sınıfı, StatelessWidget sınıfından türetilmiştir
class MyApp extends StatelessWidget {
  // Kullanıcı adı ve şifre için TextEditingController nesneleri oluşturulur
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
//widget oluşturmak 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Ana ekranda gösterilecek bileşen AuthScreen'dir
      home: AuthScreen(
        usernameController: usernameController,
        passwordController: passwordController,
      ),
    );
  }
}
// Kullanıcı kimlik doğrulama ekranını oluşturan AuthScreen sınıfı
class AuthScreen extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
// AuthScreen sınıfının yapıcı metodu
  const AuthScreen({
    Key? key,
    required this.usernameController,
    required this.passwordController,
  }) : super(key: key);
  // Kullanıcı adı ve şifrenin boş olup olmadığını kontrol eden fonksiyon
  bool checkCredentials(String username, String password) {
    return username.isNotEmpty && password.isNotEmpty;
  }
// Widget'ın oluşturulması
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ekran yapısı oluşturuluyor
      body: Stack(
        children: [
          // Arka plan resmi
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Ekranın ortasında bulunan bileşenler
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Kullanıcı resmi
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/background_image.jpg'),
                  ),
                  SizedBox(height: 16.0),
                  // Kullanıcı adı giriş alanı
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
                  // Şifre giriş alanı
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
                  // Giriş Yap butonu
                  ElevatedButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
// Kullanıcı adı ve şifrenin boş olup olmadığını kontrol et
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
