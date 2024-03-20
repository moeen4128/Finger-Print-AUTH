import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class FingerAuth extends StatefulWidget {
  const FingerAuth({Key? key}) : super(key: key);

  @override
  State<FingerAuth> createState() => _FingerAuthState();
}

class _FingerAuthState extends State<FingerAuth> {
  final LocalAuthentication auth = LocalAuthentication();

  checkAuth() async {
    print("fun...");
    bool isAvailable;
    isAvailable = await auth.canCheckBiometrics;
    print(isAvailable);
    if (isAvailable) {
      bool result = await auth.authenticate(
          localizedReason: "Scan your fingerprint to proceed",
      // options: AuthenticationOptions(biometricOnly: true)
      );
      if (result) {
        Get.to(const FingerHome());
      } else {
        Get.snackbar("error", "Permission Denied");
      }
    } else {
      Get.snackbar("error", "No Biometric sensor detected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Lottie.asset('assets/Animation - 1710860165874.json',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "FingerPrint Auth",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding:
                   EdgeInsets.only(left: 50, top: 8, right: 0, bottom: 0),
              child: Center(
                  child: Text(
                "Authentication using fingerprint to proceed in application",
                style: TextStyle(fontSize: 20),
              )),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () => checkAuth(),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(9, 201, 253, 1)),
                // style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue[300]),),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Authenticate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
