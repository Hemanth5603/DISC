//
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

final userName = TextEditingController();
dynamic dateOfBirth = TextEditingController();

final _formKey = GlobalKey<FormState>();
String gender = "Gender";
bool isDj = false;
File? profileImage;
@override
var val = 0;

class ProfilePg extends StatefulWidget {
  const ProfilePg({Key? key}) : super(key: key);
  @override
  _ProfilePgState createState() => _ProfilePgState();
}

class _ProfilePgState extends State<ProfilePg> {
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.sizeOf(context).height;
    dynamic width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor:
          isDj ? Colors.black : const Color.fromARGB(255, 29, 29, 29),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 25, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: InkWell(
                            onTap: () {},
                            child:
                                const Icon(Icons.arrow_back_ios_new_rounded))),
                    Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 197, 195, 195),
                            fontFamily: 'sen',
                            fontSize: height * 0.029),
                      ),
                    ),
                    const Center(child: Icon(Icons.emoji_emotions)),
                  ],
                ),
              ),
              if (profileImage != null)
                SizedBox(
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(Container(
                        height: height * 0.11,
                        width: width * 0.99,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 29, 29, 29),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      profileImage = null;
                                    });
                                    Get.back();
                                  },
                                  child: const Text(
                                    "Delete Image",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 197, 195, 195),
                                        fontFamily: 'sen',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      getImage(source: ImageSource.gallery);
                                    });
                                    Get.back();
                                  },
                                  child: const Text(
                                    "Update Image",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 197, 195, 195),
                                        fontFamily: 'sen',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ]),
                        ),
                      ));
                    },
                    child: Container(
                      height: height * 0.14,
                      width: width * 0.40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 197, 195, 195),
                          image: DecorationImage(
                            image: FileImage(profileImage!),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )),
                )
              else
                SizedBox(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        getImage(source: ImageSource.gallery);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(profileImage.toString()),
                        radius: height * 0.08,
                        child: const Icon(Icons.add_a_photo_rounded),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "S.Hemanth",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 197, 195, 195),
                        fontFamily: 'sen',
                        fontSize: height * 0.03,
                      ),
                    ),
                    Text(
                      "+91 6309742060",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 197, 195, 195),
                        fontFamily: 'sen',
                        fontSize: height * 0.017,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 24,
                            right: 24,
                          ),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: userName,
                              cursorColor: Colors.grey,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.name,
                              cursorRadius: const Radius.circular(20),
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 197, 195, 195),
                                    fontFamily: 'sen'),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 197, 195, 195),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 24, right: 24),
                            child: SizedBox(
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                hint: const Text(
                                  "Select Gender",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 197, 195, 195),
                                    fontFamily: 'sen',
                                  ),
                                ),
                                dropdownColor:
                                    const Color.fromARGB(255, 39, 39, 39),
                                borderRadius: BorderRadius.circular(10),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195),
                                  fontFamily: 'sen',
                                ),
                                icon: const Icon(Icons.arrow_drop_down_rounded),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 197, 195, 195)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: "Male",
                                    child: Text("Male"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Female",
                                    child: Text("Female"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Transgender",
                                    child: Text("Transgender"),
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 24, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 220,
                                child: TextFormField(
                                  controller: dateOfBirth,
                                  cursorColor: Colors.grey,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  cursorRadius: const Radius.circular(20),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: "Enter date of birth",
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 197, 195, 195),
                                        fontFamily: 'sen'),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 197, 195, 195),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 13, bottom: 13),
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  datepicking();
                                },
                                child: const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Color.fromARGB(255, 197, 195, 195),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 24, right: 24),
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "    I'm DJ",
                                  style: TextStyle(
                                    color: isDj
                                        ? const Color.fromARGB(
                                            255, 231, 231, 231)
                                        : const Color.fromARGB(
                                            255, 197, 195, 195),
                                  ),
                                ),
                                CupertinoSwitch(
                                  activeColor: Colors.blue,
                                  value: isDj,
                                  onChanged: (value) {
                                    setState(() {
                                      isDj = value;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 54, 54, 54)),
                              onPressed: () {},
                              child: Text(
                                "Update Profile",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195),
                                  fontFamily: 'sen',
                                  fontSize: 18,
                                ),
                              )),
                        ),
                      ]),
                ),
              )
            ],
          ))),
    );
  }

  Future<void> datepicking() async {
    final dateofbirth = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    if (dateofbirth != null) {
      dateOfBirth.text = dateofbirth.toString().split(" ")[0];
    }
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        profileImage = File(file!.path);
      });
    }
  }
}
