import 'package:flutter/material.dart';

final navigatorkey = GlobalKey<NavigatorState>();
void customSnackBar(data) =>
    ScaffoldMessenger.of(navigatorkey.currentContext!).showSnackBar(SnackBar(
        duration: const Duration(minutes: 1),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () =>
                          ScaffoldMessenger.of(navigatorkey.currentContext!)
                              .removeCurrentSnackBar(),
                      child: const Text(
                        'DISMISS',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ))),
            )
          ],
        )));

void pop() => Navigator.of(navigatorkey.currentContext!).pop();

void loadingDialog() => showDialog(
    context: navigatorkey.currentContext!,
    builder: (ctx) => const Dialog(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
