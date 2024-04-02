import 'package:chat_app/View/Settings/profile_page.dart';
import 'package:chat_app/View/Settings/qr_code_page.dart';
import 'package:chat_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:iconsax/iconsax.dart';

class SettingsHomePage extends StatefulWidget 
{
  const SettingsHomePage({super.key});

  @override
  State<SettingsHomePage> createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Settings'),),
      body: SingleChildScrollView
      (
        child: Padding
        (
          padding: const EdgeInsets.all(20),
          child: Column
          (
            children: 
            [
              ListTile
              (
                leading: const CircleAvatar(radius: 30,),
                trailing: IconButton(icon: const Icon(Iconsax.scan_barcode), 
                onPressed: ()
                {navigateTo(context, const QrCodePage());},),
                title: const Text('Name'),
                minVerticalPadding: 40,
              ),
              Card
              (
                child: ListTile
                (
                  onTap: ()
                  {
                    navigateTo(context, const ProfilePage());
                  },
                  leading: const Icon(Iconsax.user),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  title: const Text('Profile'),
                ),
              ),
              Card
              (
                child: ListTile
                (
                  onTap: ()
                  {showDialog(context: context, builder: (context)
                    {return AlertDialog
                      (
                        content: SingleChildScrollView
                        (
                          child: BlockPicker
                          (
                            pickerColor: Colors.indigo,
                            onColorChanged: (value){},
                          ),
                        ),
                        actions: 
                        [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Done'))],
                      );
                    });},
                  leading: const Icon(Iconsax.color_swatch),
                  title: const Text('Theme'),
                ),
              ),
              Card
              (
                child: ListTile
                (
                  leading:const Icon(Iconsax.user),
                  trailing: Switch(value: true, onChanged: (value){}),
                  title: const Text('Dark Mode'),
                ),
              ),
              const Card
              (
                child: ListTile
                (
                  trailing: Icon(Iconsax.logout_1),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}