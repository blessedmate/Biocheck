import 'package:biocheck_flutter/app/global_widgets/global_widgets.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomInput(
              icon: Icon(Icons.search),
              labelText: 'Search contact',
            ),
            const SizedBox(height: 20),
            SizedBox(
              // TODO: Fix height
              height: 600,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (_, index) {
                  return _ContactCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactsController controller = Get.find<ContactsController>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://res.cloudinary.com/dkwnvvjcs/image/upload/v1638826864/biocheck/face_hqh6zy.jpg')),
            ),
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Nicolas Posh',
                style: TypographyStyles.contactName,
              ),
              Text(
                'Otolaryngology',
                style: TypographyStyles.contactSpecialty,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              controller.sendMail('mate@mail.com');
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
    );
  }
}
