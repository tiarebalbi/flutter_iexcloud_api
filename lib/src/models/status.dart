class Status {
  final String status;
  final String version;
  final num time;
  final num currentMonthAPICalls;

  Status(this.status, this.version, this.time, this.currentMonthAPICalls);

  static Status? parse(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    }

    return Status(
      data['status'],
      data['version'],
      data['time'],
      data['currentMonthAPICalls'],
    );
  }
}
