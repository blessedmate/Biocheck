import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/global_widgets/global_widgets.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller;
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
            controller.obx(
              (state) => Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.contacts.length,
                  itemBuilder: (_, index) {
                    return _ContactCard(contact: controller.contacts[index]);
                  },
                ),
              ),
              onEmpty: const Center(
                child: Text('No contacts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final User contact;

  const _ContactCard({
    Key? key,
    required this.contact,
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
              image: CachedNetworkImageProvider(contact.imageUrl!),
              imageErrorBuilder: (context, error, stackTrace) {
                return const Image(
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/no-image.png'),
                );
              },
            ),
          ),
          const SizedBox(width: 25),
          SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TypographyStyles.contactName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  contact.specialty,
                  style: TypographyStyles.contactSpecialty,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              controller.sendMail(contact.email);
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
    );
  }
}
