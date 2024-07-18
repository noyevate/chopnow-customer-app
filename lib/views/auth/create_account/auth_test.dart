// import 'package:chopnow_new_customer_app/views/common/auth_textfield.dart';
// import 'package:chopnow_new_customer_app/views/common/create_account_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CreateAccountPage extends StatelessWidget {
//   final CreateAccountController controller = Get.put(CreateAccountController());

//   CreateAccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Account'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Obx(
//                     () => CustomTextField(
//                       controller: controller.firstNameController,
//                       label: 'First Name',
//                       errorMessage: controller.firstNameError.value,
//                       isValid: controller.isFirstNameValid.value,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Obx(
//                     () => CustomTextField(
//                       controller: controller.lastNameController,
//                       label: 'Last Name',
//                       errorMessage: controller.lastNameError.value,
//                       isValid: controller.isLastNameValid.value,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: CustomTextField(
//                     controller: TextEditingController(text: '+234'),
//                     label: 'Code',
//                     isValid: true,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   flex: 3,
//                   child: Obx(
//                     () => CustomTextField(
//                       controller: controller.phoneController,
//                       label: 'Phone Number',
//                       errorMessage: controller.phoneError.value,
//                       isValid: controller.isPhoneValid.value,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Obx(
//               () => CustomTextField(
//                 controller: controller.emailController,
//                 label: 'Email',
//                 errorMessage: controller.emailError.value,
//                 isValid: controller.isEmailValid.value,
//               ),
//             ),
//             SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {
//                 controller.validatePhone(controller.phoneController.text);
//                 controller.createAccount();
//               },
//               child: Text('Submit'),
//             ),

//             SizedBox(height: 30.h,)
//           ],
//         ),
//       ),
//     );
//   }
// }
