import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mio_1/secrets.dart';

class OpenaiService {
  final List<Map<String, String>>messages = [];
  Future<String> isArtPromptAPI(String prompt) async{
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey'
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [{"role": "user", "content": "Say yes!"}],
        })
      );
      print(res.body);
      if(res.statusCode == 200){
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        switch(content){
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
            final res = await chatGPTAPI(prompt);
        }

      }
      return 'internal error';
    } catch(e){
      return e.toString();
    }
  }
  Future<String> chatGPTAPI(String prompt) async{
    messages.add({
      'role':'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey'
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": messages,
        })
      );
      if(res.statusCode == 200){
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role':'assistant',
          'content':content,
        });
        return content;
      }
      return 'internal error';
    } catch(e){
      return e.toString();
    }
  }

}