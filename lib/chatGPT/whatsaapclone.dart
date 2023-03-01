// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.fnbo8-1.fna.fbcdn.net/v/t39.30808-6/277744901_974262500143642_7463298529429713930_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeH-Wd1dpo6Sad300asZgSEMToIW2vCNCBNOghba8I0IEw-IjqTw12rZOVW4oiNmeOGlT3ZLJKj8YQvvPb7EY7YQ&_nc_ohc=PA5_Bl7TfnMAX99UTao&_nc_ht=scontent.fnbo8-1.fna&oh=00_AfC75chxG_eaOXT9SQCX7w_LjU1J0KmePeSoUi81SUD2RA&oe=63D9EFB3'),
              ),
              title: const Text('Name'),
              subtitle: const Text('Last message'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WhatsAppClonePage(),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}

class WhatsAppClonePage extends StatefulWidget {
  const WhatsAppClonePage({super.key});

  @override
  _WhatsAppClonePageState createState() => _WhatsAppClonePageState();
}

class _WhatsAppClonePageState extends State<WhatsAppClonePage> {
  final _textController = TextEditingController();
  final _messages = <String>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 65, 40),
      appBar: AppBar(
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.fnbo8-1.fna.fbcdn.net/v/t1.6435-9/120771324_630801051156457_119350310652770418_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=174925&_nc_eui2=AeFfgQIbrave8DU19AAb6ZkNqvXVm6-tsL-q9dWbr62wvy0eszWfe-sR07qvVr4PdqeHCCEAKXjz3i-nspkmUoQe&_nc_ohc=6rAzeN-IoGoAX_Ha9qs&_nc_oc=AQnBcZ_cEMngWk5JKj1Nxf7uelyUW-_G3ItqAPDvalKUe8e_-pds1O_GZLKaLXOl9Oo&tn=ER6BUzjcXeZEHUyK&_nc_ht=scontent.fnbo8-1.fna&oh=00_AfDXRx55hneiaS3Rwb6AJoDCV9WX0x_Izy769dBp3VaAvw&oe=63FC8DD8'),
              ),
            ),
            Text('Name'),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 70,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(
                    top: 12,
                    left: 18,
                    right: 18,
                    bottom: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.elliptical(12, 15),
                    ),
                  ),
                  child: Text(_messages[index]),
                );
              },
            ),
          ),
          const Divider(
            height: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
