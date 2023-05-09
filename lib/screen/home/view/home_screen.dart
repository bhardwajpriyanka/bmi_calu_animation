import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/home_provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen>
    with SingleTickerProviderStateMixin {
  home_controler h1 = Get.put(home_controler());

  AnimationController? animationController;
  Animation? left;
  Animation? right;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    left = Tween<Offset>(begin: Offset(-200, 0), end: Offset(0, 0))
        .animate(animationController!);
    right = Tween<Offset>(begin: Offset(200, 0), end: Offset(0, 0))
        .animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:Colors.purple,
          title: Text("Body Mass Index",
              style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      h1.maletofemale();
                    },
                    child: mbox()),
                InkWell(
                    onTap: () {
                      h1.maletofemale();
                    },
                    child: fbox()),
              ],
            ),
            hbox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                wbox(),
                abox(),
              ],
            ),
            InkWell(
                onTap: () {
                  h1.getresult();
                  showModalBottomSheet( backgroundColor: Colors.black12,context: context, builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Result Weight',style:TextStyle(color: Colors.purple,fontSize: 30,),),
                        Obx(() =>  Text('${h1.result.value.toInt()}',style:TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w500))),
                      ],
                    );
                  },);
                },
                child: cbutoon()),
          ],
        ),
      ),
    );
  }

  Obx mbox() {
    return Obx(
          () => Transform.translate(
        offset: left!.value,
        child: Container(
          margin: EdgeInsets.all(10),
          height: 160,
          width: 150,
          decoration: BoxDecoration(
            color: h1.isMale.isTrue ? Colors.purple.shade200 : Colors.white12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.male,
                color: Colors.white,
                size: 80,
              ),
              Text(
                "Male",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx fbox() {
    return Obx(
          () => Transform.translate(
        offset: right!.value,
        child: Container(
          margin: EdgeInsets.all(10),
          height: 160,
          width: 150,
          decoration: BoxDecoration(
            color: h1.isMale.isTrue ? Colors.white12 : Colors.purple.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.female,
                color: Colors.white,
                size: 80,
              ),
              Text("Female",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Transform hbox() {
    return Transform.translate(
      offset: left!.value,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Height',
              style: TextStyle(
                fontSize: 12, color: Colors.white,  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                      () => Text(
                    "${h1.s.toInt()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                Text(
                  ' cm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Obx(
                  () => Slider(
                max: 200,
                min: 0,
                activeColor: Colors.purple,
                inactiveColor: Colors.white,
                value: h1.s.value,
                onChanged: (value) {
                  h1.onChanged(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Transform abox() {
    return Transform.translate(
      offset: right!.value,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Age",
                style: TextStyle(color: Color(0xffC9D6DF), fontSize: 15)),
            Obx(() => Text("${h1.a}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    h1.ageinc();
                  },
                  backgroundColor: Colors.purple.shade100,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text("+",
                      style: TextStyle(fontSize: 20, color: Color(0xffF0F5F9))),
                ),
                FloatingActionButton(
                  onPressed: () {
                    h1.agedec();
                  },
                  backgroundColor: Colors.purple.shade100,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text("-",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Transform wbox() {
    return Transform.translate(
      offset: left!.value,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Weight",
                style: TextStyle(color: Colors.white, fontSize: 15)),
            Obx(() => Text('${h1.w.value}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    h1.winc();
                  },
                  backgroundColor: Colors.purple.shade100,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text("+",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    h1.wdic();
                  },
                  backgroundColor: Colors.purple.shade100,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text("-",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Container cbutoon() {
    return Container(
      margin: EdgeInsets.all(15),
      height: 30,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple
      ),
    );
  }
}