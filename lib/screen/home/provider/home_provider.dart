import 'package:get/get.dart';

class home_controler extends GetxController
{
  RxDouble s = 0.0.obs;
  RxInt w = 0.obs;
  RxInt a = 0.obs;
  RxBool isMale = true.obs;
  RxDouble result = 0.0.obs;

  void maletofemale()
  {
    isMale.value = !isMale.value;
  }

  void onChanged(double val)
  {
    s.value = val;
  }


  void winc()
  {
    w.value++;
  }
  void wdic()
  {
    if(w.value>1)
    {
      w.value--;
    }
  }


  void ageinc()
  {
    if(a.value<100)
    {
      a.value++;
    }

  }
  void agedec()
  {
    if(a.value>1)
    {
      a.value--;
    }

  }




  void getresult()
  {
    result.value = (w.value/s.value/s.value)*10000;
  }

}