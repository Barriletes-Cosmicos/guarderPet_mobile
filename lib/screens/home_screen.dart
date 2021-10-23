import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guarderpet_mobile/models/token.dart';
import 'package:guarderpet_mobile/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final Token token;

  HomeScreen({required this.token});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color(0xFFBD1616),
      ),
      body: _getBody(),
      drawer: widget.token.user.userType == 1
          ? _getCarerMenu()
          : _getCustomerMenu(),
    );
  }

  Widget _getBody() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          const Image(image: AssetImage('assets/titledLogo.png')),
          Text(
            'Bienvenidos y bienvenidas, somos GuarderPet, la mejor compañia en la que nos puedes confiar a tu querido y peludito compañero o integrante de la famlia',
            style: GoogleFonts.acme(fontSize: 30),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _getCarerMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              child: Image(image: AssetImage('assets/titledLogo.png'))),
          ListTile(
            title: Text('Rol: Cuidador', style: GoogleFonts.acme(fontSize: 18)),
          ),
          const Divider(
            color: Color(0xFFFF2626),
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.cleaning_services),
            title: Text('Servicios de Mascotas',
                style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.badge),
            title: Text('Tipos de Documentos',
                style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: Text('Razas', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text('Usuarios', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFFFF2626),
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.face),
            title: Text('Editar Perfil', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Cerrar Sesion', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _getCustomerMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              child: Image(image: AssetImage('assets/titledLogo.png'))),
          ListTile(
            title: Text('Rol: Usuario', style: GoogleFonts.acme(fontSize: 18)),
          ),
          const Divider(
            color: Color(0xFFFF2626),
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: Text('Mis Mascotas', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFFFF2626),
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.face),
            title: Text('Editar Perfil', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Cerrar Sesion', style: GoogleFonts.acme(fontSize: 18)),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
