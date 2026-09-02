class AccessControl {
  String _readOnlyVal = 'ReadOnly';
  String _writeOnlyVal = '';

  String get readOnlyVal => _readOnlyVal;

  set writeOnlyVal(String val) {
    _writeOnlyVal = val;
    print('Write-only value set');
  }
}

void main() {
  AccessControl obj = AccessControl();
  print(obj.readOnlyVal);
  obj.writeOnlyVal = 'New Value';
}
