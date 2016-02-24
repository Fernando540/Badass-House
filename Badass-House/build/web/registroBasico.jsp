<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro Básico</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <script src="BS/js/bootstrap.js"/></script>
    <script src="js/scripts.js"/></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body
    {
        background: url(Imagenes/fondoIndex.jpg) no-repeat fixed center;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
</style>
<script>
<!--
    function noNumeros(e) {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
        especiales = "8-37-39-46";

        tecla_especial = false;
        for (var i in especiales) {
            if (key === especiales[i]) {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) === -1 && !tecla_especial)
            return false;
    }

    function validarCorreo() {
        correo1 = document.getElementById("correo1").value;
        correo2 = document.getElementById("correo2").value;

        if (correo2 === correo1) {
            alert("Los correos coinciden, ingresa tu contraseña");
        } else {
            alert("Los correos deben coincidir");
        }
    }

    function validarPassword() {
        password1 = document.getElementById("password1").value;
        password2 = document.getElementById("password2").value;
        correo1 = document.getElementById("correo1").value;
        correo2 = document.getElementById("correo2").value;

        if (password2 === password1) {
            if (correo2 === correo1) {
                document.getElementById("Aceptar").disabled = false;
            } else {
                alert("Las contraseñas y correos deben coincidir");
            }
        } else {
            alert("Las contraseñas no coinciden");
        }
    }

--></script>
</head>    
<body>
    <div class="col-md-6 col-md-offset-3 noTePeguesArriba">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="page-header veteArriba text-center">
                    <h3>Registro</h3>
                </div>
                <form id="Register" name="RegistroU" method="post" action="JSPAltaUsuario.jsp">
                    <div class="form-group">
                        <label>Numero de Serie</label>
                        <input type="text" class="form-control" name="numSerie" maxlength="6" required >
                    </div>
                    <div class="form-group">
                        <label>¿Protección para niños?&nbsp; SI<input type="radio" name="nka" value="SI">&nbsp; NO<input type="radio" name="nka" value="NO" checked></label>
                    </div>
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" maxlength="35" onkeypress="return noNumeros(event)" required >
                    </div>
                    <div class="form-group">
                        <label>Apellido Paterno</label>
                        <input type="text" class="form-control" name="aPaterno" maxlength="35" onkeypress="return noNumeros(event)" required >
                    </div>
                    <div class="form-group">
                        <label>Apellido Materno</label>
                        <input type="text" class="form-control" name="aMaterno" maxlength="35" onkeypress="return noNumeros(event)" required >
                    </div>
                    <div class="form-group">
                        <label>Tipo Usuario</label>
                        <select class="form-control" name="tipoUsr" required>
                            <option>Premium</option>
                            <option>Junior</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Direccion</label>
                        <input type="text" class="form-control" name="direccion" maxlength="35" placeholder="Col: Calle: No.:" required>
                    </div>
                    <div class="form-group">
                        <label>Correo electrónico</label>
                        <input type="email" class="form-control" name="correo1" id="correo1" placeholder="nombre@dominio.com" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" >
                    </div>
                    <div class="form-group">
                        <label>Introduce tu correo de nuevo</label>
                        <input type="email" class="form-control" name="correo2" id="correo2" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" onfocusout="validarCorreo()">                        
                    </div>
                    <div class="form-group">
                        <label>Contraseña</label>
                        <input type="password" class="form-control" name="password1" id="password1" maxlength="15" placeholder="15 caract&eacute;res max" required>
                    </div>
                    <div class="form-group">
                        <label>Ingresa tu contraseña de nuevo</label>
                        <input type="password" class="form-control" name="password2" id="password2" maxlength="15" required onfocusout="validarPassword()">
                    </div>
                    <button type="submit" name="Aceptar" id="Aceptar" class ="btn btn-success" disabled>Confirmar</button>
                    <button type="reset" name="Cancelar" class ="btn btn-danger">Cancelar</button>
                    <a href="index.html"><input type="button" name="Regresar" value="Regresar" class ="btn btn-warning"></a>

                    <br><br>
                    Ya Tienes Cuenta? <a href="login.html" target="_top">Iniciar Sesi&oacute;n</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
