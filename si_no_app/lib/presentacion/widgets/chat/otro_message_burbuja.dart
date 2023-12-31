import 'package:flutter/material.dart';
import 'package:si_no_app/domain/entities/message.dart';
class OtroMessage extends StatelessWidget {
  
  final Message message;
  
  const OtroMessage({
    super.key,
    required this.message
    });

  

  @override
  Widget build(BuildContext context) {

    final colorsitos = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:BoxDecoration(
            color: colorsitos.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
            child: Text(message.text),
          )
        ),
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10),
      ],);
  }
}

class _ImageBubble extends StatelessWidget {
  
  final String imageUrl;

  const _ImageBubble (this.imageUrl);

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      //dependiendo del si o el no, el if funcionara.
      child: Image.network('https://yesno.wtf/assets/no/21-05540164de4e3229609f106e468fa8e7.gif',
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: ((context, child, loadingProgress) {
        if(loadingProgress == null) return child;
        return Container(
          width: size.width*0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: const Text('estoy enviando una imagen'),
        );
      })
      
      
      ),
    );
  }
}