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
            Expanded(
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
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FadeInImage(
              fit: BoxFit.cover,
              height: 70,
              width: 70,
              placeholder: const AssetImage('assets/images/no-image.png'),
              image: const NetworkImage(
                  'https://res.cloudinary.com/dkwnvvjcs/image/upload/v1638826864/biocheck/face_hqh6zy.jpg'),
              imageErrorBuilder: (context, error, stackTrace) {
                return const Image(
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/no-image.png'));
              },
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
