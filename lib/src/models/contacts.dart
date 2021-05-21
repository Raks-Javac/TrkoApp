class Contact {
  final String contactMedium;
  final String contactPoint;
  Contact({this.contactMedium, this.contactPoint});
}

class ContactList {
  final List<Contact> contactList = [
    Contact(contactMedium: "WhatsApp", contactPoint: "+2347015152515"),
    Contact(
        contactMedium: "Email", contactPoint: "support@specialmansolution.com"),
  ];
}
