class datos {
  int? id;
  String? asignatura;
  String? docente;
  int? duracion;
  String? horario;
  String? fecha;

  datos(
      {this.id,
      this.asignatura,
      this.docente,
      this.duracion,
      this.horario,
      this.fecha});

  datos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    asignatura = json['asignatura'];
    docente = json['docente'];
    duracion = json['duracion'];
    horario = json['horario'];
    fecha = json['fecha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['asignatura'] = this.asignatura;
    data['docente'] = this.docente;
    data['duracion'] = this.duracion;
    data['horario'] = this.horario;
    data['fecha'] = this.fecha;
    return data;
  }
}
