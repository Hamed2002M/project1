import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1univ/service/registerAnAccountServices.dart';
import '../Widgets/buttonWidget.dart';
import '../Widgets/textFormFieldWidget.dart';


class SignUpPage extends StatefulWidget{
static String id = "Signup";
  @override
  State<SignUpPage>createState()=>_SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{

  File? imageVisa;
  getImage() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary=File(image.path);
    setState(() {
      imageVisa=imageTemporary;
    });
  }
  getImageCamera() async{
    final image=await ImagePicker().pickImage(source: ImageSource.camera);
    if(image==null){
      return;
    }

    final imageTemporary=File(image.path);
    setState(() {
      imageVisa=imageTemporary;
    });
  }

  final _formField=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passWordController=TextEditingController();
  final confirmPassWordController=TextEditingController();
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final nationalityController=TextEditingController();
  final phoneNumberController=TextEditingController();

  bool passToggle=true;
  bool passToggle1=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formField,
        child: ListView(
          children: [
            Stack(
              children:  [
                //this for image
                Container(
                  // width: double.maxFinite,
                  height: 1200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/LoginImage.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 30,
                  child: Text(
                    " Welcome Sign Up Now ",
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
                    controller: firstNameController,
                    hintText: "Enter First Name",
                    icon: const Icon(Icons.person),
                    validator: (value){
                      if(value!.isEmpty){
                        return("Enter Your First Name");
                      }},
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 30,
                  child:  TextFormFieldWidget(
                    obscureText: false,
                    controller: lastNameController,
                    hintText: "Enter Last Name",
                    icon: const Icon(Icons.person),
                    validator: (value){
                      if(value!.isEmpty){
                        return("Enter Your Last Name");
                      }},
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 30,
                  child:  TextFormFieldWidget(
                    obscureText: false,
                    controller: nationalityController,
                    hintText: "Enter Nationality",
                    icon: const Icon(Icons.location_history),
                    validator: (value){
                      if(value!.isEmpty){
                        return("Enter Your Nationality");
                      }},
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 30,
                  child:  TextFormFieldWidget(
                    obscureText: false,
                    type: TextInputType.number,
                    controller: phoneNumberController,
                    hintText: "Enter Phone Number",
                    icon: const Icon(Icons.phone),
                    validator: (value){
                      if(value!.isEmpty){
                        return("Enter Your Phone Number");
                      }},
                  ),
                ),
                const Positioned(
                  top: 450,
                  left: 30,
                  child:Padding(
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
                Positioned(
                  top: 480,
                  left: 30,
                  right: 30,
                  child:Stack(
                    children: [
                      imageVisa!= null ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 400,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                            image: DecorationImage(
                              image: FileImage(imageVisa!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                          : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 400,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: const DecorationImage(
                                image: AssetImage(
                                  "",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 680,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        onTap: getImage,
                        height: 50,
                        width: 150,
                        color: Colors.black,
                        text: "Use Gallery",
                      ),
                      Padding(
                        padding:const EdgeInsets.only(left: 10),
                        child:  ButtonWidget(
                          onTap: getImageCamera,
                          height: 50,
                          width: 150,
                          color: Colors.black,
                          text: "UseCamera",
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 750,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: emailController,
                    hintText: "Enter Email",
                    icon: const Icon(Icons.email),
                    validator: (value){
                      bool emailValid=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&' *+ - /=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                      if(value.isEmpty){
                        return "Enter Email";
                      } else if(!emailValid){
                        return "Enter Valid Email";
                      }},
                  ),
                ),
                const SizedBox(
                  height:20,
                ),
                Positioned(
                  top: 850,
                  left: 30,
                  child:  TextFormFieldWidget(
                    obscureText: passToggle,
                    controller: passWordController,
                    hintText: "Enter Password",
                    icon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          passToggle=!passToggle;
                        });},
                      child: Icon(passToggle? Icons.visibility: Icons.visibility_off),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter PassWord";
                      }
                      else if(passWordController.text.length<6){
                        return "PassWord Length Should not be less than 6 characters";
                      }},
                  ),
                ),
                Positioned(
                  top: 950,
                  left: 30,
                  child:  TextFormFieldWidget(
                    obscureText: passToggle1,
                    controller: confirmPassWordController,
                    hintText: " Confirm Password",
                    icon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          passToggle1=!passToggle1;
                        });},
                      child: Icon(passToggle1? Icons.visibility: Icons.visibility_off),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Confirm PassWord";
                      }
                      else if(passWordController.text.length<6){
                        return "PassWord Length Should not be less than 6 characters";
                      }},
                  ),
                ),
                Positioned(
                  top: 1020,
                  left: 150,
                  child:ButtonWidget(
                    onTap: ()async{
                      if(_formField.currentState!.validate()){
                        try {
                           RegisterAnAccountServices().
                          registerAnAccountServices(
                            context: context,
                            firstName:firstNameController.text ,
                            lastName: lastNameController.text,
                            visaPhoto: imageVisa,
                            nationalty: nationalityController.text,
                            email: emailController.text,
                            phone: phoneNumberController.text,
                            password: passWordController.text,
                            passwordConfirmation: confirmPassWordController.text,
                          );
                          
                        }
                        catch (ex) {
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
                    text: "Sign Up",
                  ),
                ),
                Positioned(
            right: 100,
            top:1100,
            child: Text(
              "You already have account ",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              right: 200,
              top: 1140,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}