import 'package:examen_final_fernandez/controllers/login_controller.dart';
import 'package:examen_final_fernandez/utils/custom_colors.dart';
import 'package:examen_final_fernandez/utils/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    // Verifica si ya existen credenciales válidas guardadas
    // Esto se hará cada vez que se construya el widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.tempUser.value.username.isNotEmpty &&
          controller.tempUser.value.password.isNotEmpty) {
        Get.offNamed(
            '/home'); // Redirige al HomeScreen si las credenciales no están vacías
      }
    });
    //el gesturedetector nos va a permitir que si el usuario toca en cualquier parte de la pantalla que no sean los campos de texto el teclado se escondera
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login Screen'),
        ),
        //SafeArea nos permite que el contenido de la pantalla no se superponga con el notch de las diferentes pantallas, los diferentes bordes que puedan tener, etc
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                key: controller.formLoginKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 35),
                      child: Text('Benvingut',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    Obx(
                      () => TextFormField(
                        onChanged: (value) {
                          controller.tempUser.value.username = value;
                        },
                        initialValue: controller.tempUser.value.username,
                        style: const TextStyle(color: MyColors.greenVogue),
                        cursorColor: MyColors.greenVogue,
                        decoration: CustomInputDecorations.buildInputDecoration(
                            labelText: 'Username'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => TextFormField(
                        onChanged: (value) {
                          controller.tempUser.value.password = value;
                        },
                        initialValue: controller.tempUser.value.password,
                        style: const TextStyle(color: MyColors.greenVogue),
                        cursorColor: MyColors.greenVogue,
                        obscureText: !controller.isPasswordVisible.value,
                        decoration: CustomInputDecorations.buildInputDecoration(
                          labelText: 'Contrasenya',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                              color: MyColors.greenVogue,
                            ),
                            onPressed: () =>
                                controller.togglePasswordVisibility(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        controller.saveCredencials(
                            controller.tempUser.value.username,
                            controller.tempUser.value.password);
                        Get.offNamed('/home');
                      },
                      child: const Text('Iniciar Sessió'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
