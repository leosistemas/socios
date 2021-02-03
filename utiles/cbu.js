function validarLargoCBU(cbu) {
  if (cbu.length != 22) { return false }
	return true
}

function validarCodigoBanco(codigo) {
 if (codigo.length != 8) { return false }
 var banco = codigo.substr(0,3)
 var digitoVerificador1 = codigo[3]
 var sucursal = codigo.substr(4,3)
 var digitoVerificador2 = codigo[7]

 var suma = banco[0] * 7 + banco[1] * 1 + banco[2] * 3 + digitoVerificador1 * 9 + sucursal[0] * 7 + sucursal[1] * 1 + sucursal[2] * 3

 var diferencia = 10 - (suma % 10)

 return diferencia == digitoVerificador2
}

function validarCuenta(cuenta) {
 if (cuenta.length != 14) { return false }
 var digitoVerificador = cuenta[13]
 var suma = cuenta[0] * 3 + cuenta[1] * 9 + cuenta[2] * 7 + cuenta[3] * 1 + cuenta[4] * 3 + cuenta[5] * 9 + cuenta[6] * 7 + cuenta[7] * 1 + cuenta[8] * 3 + cuenta[9] * 9 + cuenta[10] * 7 + cuenta[11] * 1 + cuenta[12] * 3
 var diferencia = 10 - (suma % 10)
 return diferencia == digitoVerificador
}

function validarCBU(cbu) {
 return validarLargoCBU(cbu) && validarCodigoBanco(cbu.substr(0,8)) && validarCuenta(cbu.substr(8,14))
}

test("CBU largo valido tiene 22 caracteres", function() {
  ok(validarLargoCBU('1234567890123456789012'), "22 pasan" );
  ok(!validarLargoCBU('12345678901234567890'), "20 no pasan" );
});

test("Código de banco valido", function() {
  ok(!validarCodigoBanco('2850590'), "8 caracteres");
  ok(!validarCodigoBanco('28505907'), "digito verificador no es correcto");
  ok(validarCodigoBanco('28505909'), "digito verificador correcto");
});

test("Número de cuenta válido", function() {
  ok(!validarCuenta('400904181352019'), "14 caracteres");
  ok(!validarCuenta('40090418135202'), "digito verificador no es correcto");
  ok(validarCuenta('40090418135201'), "digito verificador correcto");
});

test("CBU valido", function() {
  ok(!validarCBU("2810590940090418135201"), "no valido x banco");
  ok(!validarCBU("2850590940090418135211"), "no valido x cuenta");
  ok(!validarCBU("28505909400904181352012"), "no valido x largo");
  ok(validarCBU("2850590940090418135201"), "valido");
});