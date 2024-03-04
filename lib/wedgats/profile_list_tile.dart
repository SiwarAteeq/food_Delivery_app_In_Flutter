
import 'package:flutter/material.dart';
class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileListTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return   ListTile(
            
              leading: Icon (icon,size: 30,),
              title:  Text(title,style: 
              const TextStyle(color: Colors.black54,
              fontWeight: FontWeight.w600,
              
              ),),
              trailing: const Icon(Icons.arrow_forward_ios,size: 19,),
    );
  }
}