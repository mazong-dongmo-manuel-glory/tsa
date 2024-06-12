import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsa/widgets/search_zone.dart';
class Replay extends StatefulWidget {
  const Replay({super.key});

  @override
  State<Replay> createState() => _ReplayState();
}

class _ReplayState extends State<Replay> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          // Action for back button
                        },
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const  Expanded(child:Center(child:Text(
                        "Replay et rapports",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      ),),
                    ],
                  ),
                  SearchZone(
                    hintText: "Rechercher",
                    controller: searchController,
                    onTap: () {
                      // Action for search tap
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
