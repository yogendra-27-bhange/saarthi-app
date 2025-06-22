import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _loading = false;
  String? _error;

  void _login() async {
    setState(() { _loading = true; _error = null; });
    final user = await _authService.signInWithEmail(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    setState(() { _loading = false; });
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      setState(() { _error = 'Login failed. Please check your credentials.'; });
    }
  }

  void _loginWithGoogle() async {
    setState(() { _loading = true; _error = null; });
    final user = await _authService.signInWithGoogle();
    setState(() { _loading = false; });
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      setState(() { _error = 'Google login failed.'; });
    }
  }

  void _loginAsGuest() async {
    setState(() { _loading = true; _error = null; });
    final user = await _authService.signInAnonymously();
    setState(() { _loading = false; });
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      setState(() { _error = 'Guest login failed.'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/saarthi_logo.png', height: 80),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to Saarthi',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email, color: AppColors.secondary),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock, color: AppColors.secondary),
                  ),
                ),
                const SizedBox(height: 24),
                if (_error != null) ...[
                  Text(_error!, style: const TextStyle(color: AppColors.error)),
                  const SizedBox(height: 12),
                ],
                if (_loading)
                  const CircularProgressIndicator()
                else ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('Don\'t have an account? Sign Up'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.g_mobiledata, color: AppColors.secondary),
                    label: const Text('Continue with Google'),
                    onPressed: _loginWithGoogle,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _loginAsGuest,
                    child: const Text('Continue as Guest'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
} 