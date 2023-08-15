import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          unselectedLabelColor: Colors.green,
          tabs: [
            Tab(
              child: Text('Contacts'),
            ),
            Tab(
              child: Text('Extensions'),
            )
          ],
        ),
        body: TabBarView(children: [
          Container(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text('Person ${index + 1}'),
                        tileColor: Colors.blue.shade700,
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade300,
                          radius: 20,
                          child: const Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          Container(color: Colors.white),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
