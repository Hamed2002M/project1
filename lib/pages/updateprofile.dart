import 'package:flutter/material.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/service/updateprofileservice.dart';
import '../Widgets/buttonWidget.dart';
import '../Widgets/textFormFieldWidget.dart';

class UpdateProfile extends StatefulWidget {
  static String id = "UpdateProfile";
  @override
  State<UpdateProfile> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<UpdateProfile> {
  // File? imageVisa;
  // getImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) {
  //     return;
  //   }
  //   final imageTemporary = File(image.path);
  //   setState(() {
  //     imageVisa = imageTemporary;
  //   });
  // }

  // getImageCamera() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image == null) {
  //     return;
  //   }

  //   final imageTemporary = File(image.path);
  //   setState(() {
  //     imageVisa = imageTemporary;
  //   });
  // }

  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  bool passToggle = true;
  bool passToggle1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formField,
        child: ListView(
          children: [
            Stack(
              children: [
                //this for image
                Container(
                  // width: double.maxFinite,
                  height: 1200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/ExpertsImage.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 30,
                  child: Text(
                    " Updete Your Profile ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //this for first name
                Positioned(
                  top: 100,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _firstNameController,
                    hintText: "Enter First Name",
                    icon: const Icon(Icons.person),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _lastNameController,
                    hintText: "Enter Last Name",
                    icon: const Icon(Icons.person),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _nationalityController,
                    hintText: "Enter Nationality",
                    icon: const Icon(Icons.location_history),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    type: TextInputType.number,
                    controller: _phoneNumberController,
                    hintText: "Enter Phone Number",
                    icon: const Icon(Icons.phone),
                  ),
                ),
                const Positioned(
                  top: 450,
                  left: 30,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Add Your Visa Image",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 480,
                //   left: 30,
                //   right: 30,
                //   child: Stack(
                //     children: [
                      //  imageVisa != null ?
                      //      Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 16),
                      //         child: Container(
                      //           margin:
                      //               const EdgeInsets.only(right: 15, top: 10),
                      //           width: 400,
                      //           height: 150,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20),
                      //             color: Colors.black12,
                      //             image: DecorationImage(
                      //               image: FileImage(imageVisa!),
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                //           : Padding(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 20, vertical: 16),
                //               child: Container(
                //                 margin:
                //                     const EdgeInsets.only(right: 15, top: 10),
                //                 width: 400,
                //                 height: 150,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.white,
                //                   image: const DecorationImage(
                //                     image: AssetImage(
                //                       "",
                //                     ),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               )),
                //     ],
                //   ),
                // ),
                // Positioned(
                //   top: 680,
                //   left: 30,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       ButtonWidget(
                //         onTap: getImage,
                //         height: 50,
                //         width: 150,
                //         color: Colors.black,
                //         text: "Use Gallery",
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: ButtonWidget(
                //           onTap: getImageCamera,
                //           height: 50,
                //           width: 150,
                //           color: Colors.black,
                //           text: "UseCamera",
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Positioned(
                  top: 750,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _emailController,
                    hintText: "Enter Email",
                    icon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Positioned(
                  top: 850,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: passToggle,
                    controller: _passWordController,
                    hintText: "Enter Password",
                    icon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),

                Positioned(
                  top: 940,
                  left: 150,
                  child: ButtonWidget(
                    onTap: () async {
                      if (_formField.currentState!.validate()) {
                        try {
                          UpdateProfileService().updatprofileservice(
                              _firstNameController.text,
                              _lastNameController.text,
                            //  imageVisa,
                              _nationalityController.text,
                              _emailController.text,
                              _phoneNumberController.text,
                              _passWordController.text,
                              context  
                              );

                          Navigator.pushNamed(context, HomePage.id);
                        } catch (ex) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('There Is Error'),
                            ),
                          );
                        }
                      }
                    },
                    height: 50,
                    width: 100,
                    color: Colors.black,
                    text: "Update",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
