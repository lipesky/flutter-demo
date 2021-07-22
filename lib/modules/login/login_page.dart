import 'package:ferp/modules/shared/animations/animated_gradient_background.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  final inputStyle = InputDecoration();

  @override
  void initState(){
    
    super.initState();
  }

  void togglePasswordVisible(){
    this.setState(() {
      this.passwordVisible = !this.passwordVisible;
    });
  }

  Widget build(BuildContext context){
    final bool ssoOptions = false;

    return SafeArea(
      child:Scaffold(
        body: AnimatedGradientBackground(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset('assets/images/app-logo.png'),
                  // Data Input Fields
                  Form(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 400,
                        ),
                        child: Column(
                          children: [
                            // Username
                            TextFormField(
                              controller: this.usernameController,
                              decoration: this.inputStyle.copyWith(
                                contentPadding: EdgeInsets.only(right: 50), 
                                hintText: 'Username',
                              ),
                            ),
                            // Password
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                TextFormField(
                                  obscureText: !this.passwordVisible,
                                  controller: this.passwordController,
                                  decoration: this.inputStyle.copyWith(
                                    contentPadding: EdgeInsets.only(right: 50), 
                                    hintText: 'Password',
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  child: TextButton(
                                    onPressed: this.togglePasswordVisible,
                                    child: Icon(
                                      this.passwordVisible ? Icons.visibility : Icons.visibility_off,
                                      size: 22,
                                      color: Colors.grey,
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(CircleBorder()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Options
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Forgot password'),
                                    ),
                                    
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Register'),
                                    ),
                                  ],
                                ),
                              
                                const SizedBox(width: 10),
                                //Enviar
                                ElevatedButton(
                                  onPressed: (){}, 
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 42, vertical: 16))
                                  ),
                                  child: Text(
                                    'Login',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //SSO                          
                            if(ssoOptions)
                              Text('ou'),
            
                          ],
                        ),
                      ),
                    ),
                  ),                
                  // SSO
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}