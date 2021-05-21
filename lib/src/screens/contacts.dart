import 'package:flutter/material.dart';
import 'package:trko/src/models/contacts.dart';
import 'package:trko/src/utils/closeNode.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: ContactList()
            .contactList
            .map((e) => ContactTile(
                  contact: e,
                ))
            .toList(),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final Contact contact;
  const ContactTile({this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: Utils().screenWidth(context: context),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: ListTile(
          title: Text(
            contact.contactMedium,
            style: TextStyle(
              fontSize: 19.0,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              contact.contactPoint,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
