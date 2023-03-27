class DownNewsModel
{
  String? name,author,title,description,image,content;
  int? id;

  DownNewsModel(
      {this.name,
      this.author,
      this.title,
      this.description,
      this.image,
      this.content,
      this.id,
      });

  DownNewsModel fromJson(Map map)
  {
    return DownNewsModel(
      name: map['name'],
      author: map['author'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      content: map['content'],
      id: map['id'],
    );
  }



}