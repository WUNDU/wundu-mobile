import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 53.93,
                  height: 53.93,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 15),
                child: Stack(
                  children: [
                    Text(
                      'Acompanhe seus gastos sem esforço',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0F2045),
                          height: 1.2),
                    ),
                    Positioned(
                      right: 35,
                      bottom: 12,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(color: Color(0xFFFFD400)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Text(
                  'Gerencie suas finanças facilmente usando nossa interface intuitiva e amigável, defina metas financeiras e monitore seu progresso',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0F2045),
                      height: 1.56,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(
                flex: 3,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 68.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 172,
                      height: 49,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1E1E1E),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.zero),
                          child: Text(
                            'Cadastra-se',
                            style: TextStyle(
                                color: Color(0xFFEBEBEB),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.71),
                          )),
                    ),
                    SizedBox(
                      width: 172,
                      height: 49,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Color(0xFF1E1E1E),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.zero),
                          child: Text(
                            'Faça Login',
                            style: TextStyle(
                                color: Color(0XFF1E1E1E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.71),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
