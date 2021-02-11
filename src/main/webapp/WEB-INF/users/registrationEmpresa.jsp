<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2? family = Pacifico & display = swap" rel="hoja de estilo ">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto+Mono&display=swap" rel="stylesheet">
        <title>AMUKAN/registro-empresa</title>
	</head>
	<body>
         <header>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="http://localhost:8080/"><img class="navbar-brand-img" src="/img/logo.png"
                        alt="logo"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">

                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="/login">INICIAR SESIÓN</a>
                                </li>
        
                                <!--REGISTRARSE-->
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="/registration">REGISTRARSE</a>
                                </li>
       
                        <!--ACERCA DE-->
                        <li class="nav-item">
                            <a class="nav-link" href="/acerca-de">ACERCA DE</a>
                        </li>

                        <!--CONTACTO-->
                        <li class="nav-item">
                            <a class="nav-link" href="/contacto">CONTACTO</a>

                        </li>

                        
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-outline-info" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>
    </header>
        <!--FIN HEADER-->

        <div class="container-fluid">
            <main class="form-checkin">
                <form:form method="POST" action="/registration/empresa" modelAttribute="user">
                    <img class="mb-4" src="../img/logo2.png" alt width="100" height="auto">
                    <h1 class="h3 mb-3 fw-normal">Registro Empresa</h1>

                    <form:label path="name" for="inputName" class="visually-hidden">Nombre</form:label>
                    <form:input path="name" type="text" id="inputName" class="form-control" placeholder="Nombre" required="" autofocus=""/>
                    <!--NOMBRE-->


                    <form:label path="email" for="inputEmail" class="visually-hidden">Email</form:label>
                    <form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="Email" required="" autofocus=""/>
                    <!--EMAIL-->

                    <!--<form class="form-floating">
                        <input type="email" class="form-control is-invalid" id="floatingInputInvalid" placeholder="name@example.com" value="test@example.com">
                        <label for="floatingInputInvalid">Invalid input</label>
                    </form>-->

                    <form:label path="password" for="inputPassword" class="visually-hidden">Contraseña</form:label>
                    <form:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required=""/>
                    <!--CONTRASEÑA-->

                    <form:label path="passwordConfirmation" for="inputPassword" class="visually-hidden">Contraseña</form:label>
                    <form:input path="passwordConfirmation" type="confirm-password" id="inputPassword" class="form-control"
                        placeholder="Confirmar contraseña" required=""/>
                    <!--CONTRASEÑA-->

                    <!--<label for="start">Fecha de nacimiento</label>

                    <input type="date" id="start" name="trip-start" value="2021-01-01" min="1950-01-01" max="2021-01-01">-->

                    <input class="w-100 btn btn-lg btn-dark" role="button" type="submit" id="submit"  value="Registrarse!"/>
                </form:form>
            </main>

        </div>

       

    <!--ENLACES BOOTSTRAP Y JQUERY-->
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/popup.js"></script>
    <script src="/js/filtros.js"></script>
    </body>
</html>