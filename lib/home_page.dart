import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  HomePage({super.key});

  void createUser(String name) => users.add({'name': name});
  void updateUser(String id, String newName) => users.doc(id).update({'name': newName});
  void deleteUser(String id) => users.doc(id).delete();

  void showEditDialog(BuildContext context, String id, String currentName) {
    nameController.text = currentName;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'New name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              updateUser(id, nameController.text.trim());
              nameController.clear();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Users')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Input Field + Add Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  onPressed: () {
                    if (nameController.text.trim().isNotEmpty) {
                      createUser(nameController.text.trim());
                      nameController.clear();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // List of users
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: users.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                  final data = snapshot.data!.docs;

                  if (data.isEmpty) {
                    return const Center(child: Text('No users found.'));
                  }

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final doc = data[index];
                      final id = doc.id;
                      final name = doc['name'];

                      return Card(
                        color: Colors.grey[900],
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(name, style: const TextStyle(fontSize: 18)),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.amber),
                                onPressed: () => showEditDialog(context, id, name),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.redAccent),
                                onPressed: () => deleteUser(id),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
