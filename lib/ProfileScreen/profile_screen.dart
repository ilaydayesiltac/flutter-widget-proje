import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Ekranı'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // Burada kullanıcının profil resmini veya varsayılan resmi gösterebilirsiniz
              backgroundImage: AssetImage('assets/default_profile_image.png'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(labelText: 'Hakkında'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Profil bilgilerini güncelleme işlemleri
                String newUsername = usernameController.text;
                String newBio = bioController.text;
                // Güncelleme işlemlerini gerçekleştir
              },
              child: Text('Profili Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}
