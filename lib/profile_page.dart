import 'package:flutter/material.dart';
import 'user_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _yearController;
  late TextEditingController _sectionController;
  late TextEditingController _groupController;
  late TextEditingController _rollNumberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: UserData.name ?? '');
    _yearController = TextEditingController(text: UserData.year ?? '');
    _sectionController = TextEditingController(text: UserData.section ?? '');
    _groupController = TextEditingController(text: UserData.group ?? '');
    _rollNumberController = TextEditingController(
      text: UserData.rollNumber ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yearController.dispose();
    _sectionController.dispose();
    _groupController.dispose();
    _rollNumberController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    await UserData.saveUserData(
      name: _nameController.text,
      year: _yearController.text,
      section: _sectionController.text,
      group: _groupController.text,
      rollNumber: _rollNumberController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          isEditing
              ? IconButton(icon: const Icon(Icons.save), onPressed: _saveData)
              : IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    isEditing = true;
                  });
                },
              ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            isEditing
                ? TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                )
                : Text(
                  'Name: ${UserData.name ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
            const SizedBox(height: 10),
            isEditing
                ? TextField(
                  controller: _yearController,
                  decoration: const InputDecoration(labelText: 'B.Tech Year'),
                )
                : Text(
                  'B.Tech Year: ${UserData.year ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
            const SizedBox(height: 10),
            isEditing
                ? TextField(
                  controller: _sectionController,
                  decoration: const InputDecoration(labelText: 'Section'),
                )
                : Text(
                  'Section: ${UserData.section ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
            const SizedBox(height: 10),
            isEditing
                ? TextField(
                  controller: _groupController,
                  decoration: const InputDecoration(labelText: 'Group'),
                )
                : Text(
                  'Group: ${UserData.group ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
            const SizedBox(height: 10),
            isEditing
                ? TextField(
                  controller: _rollNumberController,
                  decoration: const InputDecoration(labelText: 'Roll Number'),
                )
                : Text(
                  'Roll Number: ${UserData.rollNumber ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
          ],
        ),
      ),
    );
  }
}
