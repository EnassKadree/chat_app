import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ProfilePage extends StatefulWidget 
{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  void initState() {
    nameController.text = 'My name';
    aboutController.text = 'My about';
    super.initState();
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Profile'),),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Center
        (
          child: Column
          (
            children: 
            [
              Stack
              (
                clipBehavior: Clip.none,
                children: 
                [
                  const CircleAvatar(radius: 60,),
                  Positioned
                  (
                    bottom: -10, right: -10,
                    child: IconButton.filled
                    (
                      onPressed: (){}, 
                      icon: const Icon(Iconsax.edit)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Card
              (
                child: ListTile(
                  leading: const Icon(Iconsax.user_octagon),
                  trailing: IconButton(
                    icon: const Icon(Iconsax.edit),
                    onPressed: (){},
                    ),
                  title: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabled: false,
                      labelText: 'Name'
                    ),
                  ),
                ),
              ),
              Card
              (
                child: ListTile(
                  leading: const Icon(Iconsax.information),
                  trailing: IconButton(
                    icon: const Icon(Iconsax.edit),
                    onPressed: (){},
                    ),
                  title: TextField(
                    controller: aboutController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabled: false,
                      labelText: 'about'
                    ),
                  ),
                ),
              ),
              const Card
              (
                child: ListTile(
                  leading: Icon(Iconsax.direct),
                  title: Text('Email'),
                  subtitle: Text('enasskadree2003@gmail.com'),
                ),
              ),
              const Card
              (
                child: ListTile(
                  leading: Icon(Iconsax.direct),
                  title: Text('Joined at'),
                  subtitle: Text('31/3/2024'),
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                style: ElevatedButton.styleFrom
                (
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer
                ),
                onPressed: (){}, 
                child: Center(child: Text('save'.toUpperCase()),)
              )
            ],
          ),
        ),
      ),
    );
  }
}