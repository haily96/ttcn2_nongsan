import 'package:banhangrausach/config/share_config.dart';
import 'package:banhangrausach/databases/DBManager.dart';
import 'package:banhangrausach/model/sanpham_model.dart';
import 'package:banhangrausach/view/giohang_screen.dart';
import 'package:banhangrausach/view/sanpham_chitiet_screen.dart';
import 'package:banhangrausach/view/sign_in_screen.dart';
import 'package:banhangrausach/view/view_all_screen.dart';
import 'package:banhangrausach/view/view_all_type_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lichsu_hoadon_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<SanPhamModel> listSanPham = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    FirebaseFirestore.instance.collection("SanPham")
        .get().then((value) {
      if(value.docs.isNotEmpty){
        for(final data in value.docs){
          SanPhamModel sanPhamModel = SanPhamModel();
          sanPhamModel.id = data.id.toString();
          sanPhamModel.name = data.get("tensp");
          sanPhamModel.price = data.get("giatien");
          sanPhamModel.description = data.get("mota");
          sanPhamModel.imgPath = data.get("hinhanh");
          sanPhamModel.type = data.get("type");
          listSanPham.add(sanPhamModel);
        }
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "FARMER",
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            elevation: 0,
             actions: [IconButton(onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllScreen()));
             }, icon: Icon(Icons.search))],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                itemsDrawer("Trang Ch???", () {
                  Navigator.pop(context);
                }, Icons.home_outlined),
                itemsDrawer("Gi??? h??ng", () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GioHangScreen()));
                }, Icons.shopping_cart_outlined),
                itemsDrawer("L???ch s??? mua h??ng", () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LichSuHoaDonScreen()));
                }, Icons.history_outlined),
                itemsDrawer("????ng xu???t", () {
                  SharedConfig.setSDT("");
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));

                }, Icons.exit_to_app),
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Danh M???c",
                        style: GoogleFonts.oswald(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Column(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              margin: const EdgeInsets.only(top: 10),
                              child: Image.asset("icon/rice.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "G???o",
                                style: GoogleFonts.oswald(
                                    fontSize: 18, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllTypeScreen("G???o")));
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Column(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              margin: const EdgeInsets.only(top: 10),
                              child: Image.asset("icon/rau.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Rau",
                                style: GoogleFonts.oswald(
                                    fontSize: 18, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllTypeScreen("Rau")));
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Column(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              margin: const EdgeInsets.only(top: 10),
                              child: Image.asset("icon/cu.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "C???",
                                style: GoogleFonts.oswald(
                                    fontSize: 18, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllTypeScreen("C???")));
                      },
                    ),

                    // DANH M???C C??C S???N PH???M KH??C
                    InkWell(
                      child: Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Column(
                          children: [
                            Container(
                              width: 52,
                              height: 42,
                              margin: const EdgeInsets.only(top: 15),
                              child: Image.asset("icon/khac.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Tr???ng - th???t",
                                style: GoogleFonts.oswald(
                                    fontSize: 18, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllTypeScreen("Tr???ng - Th???t")));
                      },
                    ),
                  ],
                ),

              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "S???n ph???m",
                        style: GoogleFonts.oswald(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    InkWell(

                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllScreen()));
                       },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10, top: 10),
                        child: Text(
                          "Xem th??m",
                          style: GoogleFonts.oswald(
                              fontSize: 15, color: Colors.green),
                        ),
                      ),


                    )
                  ],
                ),
              ),
             Expanded(child:  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 1.5,
               crossAxisSpacing: 15,mainAxisSpacing: 25
             ),
                 shrinkWrap: true,
                 itemCount: listSanPham.length,
                 itemBuilder: (context,index) => itemSanPham(listSanPham[index])))

            ],
          ),
        ),
        onWillPop: () async => false);
  }

  itemsDrawer(String title, VoidCallback press, IconData iconData) {
    return ListTile(
      onTap: press,
      title: Text(
        title,
        style: GoogleFonts.oswald(fontSize: 16, color: Colors.black),
      ),
      leading: Icon(iconData),
    );
  }

  itemSanPham(SanPhamModel listSanPham) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SanPhamChiTietScreen(listSanPham)));

      },
      child: Container(
        margin: const EdgeInsets.only(left: 15,right: 15),
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)
        ),
        child: Column(
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: Image.network(listSanPham.imgPath.toString(),fit: BoxFit.fill,),
            ),
            Padding(padding: const EdgeInsets.only(top: 5),child: Text(listSanPham.name.toString()),),
            Padding(padding: const EdgeInsets.only(top: 5),child: Text(listSanPham.price.toString()+" V.N.D",style: GoogleFonts.oswald(
              fontSize: 17,
              color: Colors.red
            ),),),
          ],
        )
      ),
    );
  }
}
