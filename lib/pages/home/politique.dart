import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Politique de Confidentialité',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Introduction',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bienvenue sur la plateforme TSA. Nous nous engageons à protéger votre vie privée. Cette politique de confidentialité décrit les informations que nous collectons, comment nous les utilisons et les options qui s’offrent à vous en matière de gestion de vos informations personnelles.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Informations Collectées',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nous collectons différentes informations pour améliorer nos services. Les types d’informations que nous collectons incluent :',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                '- Informations de contact (nom, adresse e-mail, numéro de téléphone)',
                textAlign: TextAlign.justify,
              ),
              const Text(
                '- Informations de connexion (adresse IP, type de navigateur, etc.)',
                textAlign: TextAlign.justify,
              ),
              const Text(
                '- Données d’utilisation (pages visitées, temps passé sur le site, etc.)',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Utilisation des Informations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Les informations collectées sont utilisées pour :',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                '- Améliorer notre plateforme et nos services',
                textAlign: TextAlign.justify,
              ),
              const Text(
                '- Personnaliser votre expérience utilisateur',
                textAlign: TextAlign.justify,
              ),
              const Text(
                '- Communiquer avec vous concernant des mises à jour ou des offres spéciales',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Partage des Informations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nous ne partageons pas vos informations personnelles avec des tiers, sauf dans les cas suivants :',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                '- Avec votre consentement',
                textAlign: TextAlign.justify,
              ),
              const Text(
                '- Pour se conformer à une obligation légale',
                textAlign: TextAlign.justify,
              ),
              const Text(
                '- Pour protéger nos droits et notre propriété',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sécurité des Informations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nous mettons en œuvre des mesures de sécurité pour protéger vos informations personnelles contre tout accès non autorisé, altération, divulgation ou destruction.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Vos Droits',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vous avez le droit d’accéder à vos informations personnelles, de les corriger, de les supprimer ou de limiter leur traitement. Pour exercer ces droits, veuillez nous contacter.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Si vous avez des questions ou des préoccupations concernant notre politique de confidentialité, veuillez nous contacter à : contact@tsa.com',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
