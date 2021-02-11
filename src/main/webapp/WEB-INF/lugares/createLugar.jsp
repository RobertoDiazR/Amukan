<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="/css/bootstrap.css">
        <link rel="stylesheet" href="/css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2? family = Pacifico & display = swap" rel="hoja de estilo ">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto+Mono&display=swap" rel="stylesheet">
        <title>AMUKAN/registro-turista</title>
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
                        <c:choose>
                            <c:when test="${sessionON == false}">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="/login">INICIAR SESIÓN</a>
                                </li>
        
                                <!--REGISTRARSE-->
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="/registration">REGISTRARSE</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                            	<c:choose>
                            		<c:when test="${user.userType.id == 3}">
                            		    <!--BOTON CONFIGURACIÓN-->
	                                	<li class="nav-item dropdown">
	                                    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
	                                        	data-bs-toggle="dropdown" aria-expanded="false"><img src="/img/icons/configuracion.png"
	                                           	 alt="configuración"></a>
	        
		                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
		        
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="#">Eliminar cuenta</a></li>
		        		                                   		                                
		                                            
		                                        <!--OPCIONAL-->
		                                     
		   
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="#">Pasar a perfil de turista</a></li>
		                                        <!--OPCIONAL-->
		        
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="/logout">Cerrar sesión <img class="exit"
		                                                    src="/img/icons/exit-black.png" alt="favoritos"></a></li>
		                                    </ul>
		                                    
	                                	</li>
	                                	<!--BOTÓN FAVORITOS-->
				                        <li class="nav-item"><a class="nav-link" href="#"><img class="navbar-favorites-img"
				                                    src="/img/icons/favoritos.png" alt="Favoritos"></a> </li>
				
				                        <!--BOTÓN CREAR-->
				                        <li class="nav-item"><a class="nav-link" href="/lugar/create">CREAR</a></li>
				
				                        <!--BOTÓN SOLICITUDES-->
				                        <li class="nav-item"><a class="nav-link" href="/lugar/solicitudes">VER SOLICITUDES</a></li>
				
				                        <!--BOTÓN AÑADIDOS X MI-->
				                        <li class="nav-item"><a class="nav-link" href="/lugar/agregados-por-mi">AÑADIDOS POR MI</a></li>
	                            	</c:when>
	                            	<c:when test="${user.userType.id == 2}">
	                            		<li class="nav-item dropdown">
	                                    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
	                                        	data-bs-toggle="dropdown" aria-expanded="false"><img src="/img/icons/configuracion.png"
	                                           	 alt="configuración"></a>
	        
		                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
		        
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="#">Eliminar cuenta</a></li>
		        		                              
		                                           
		                                        <!--OPCIONAL-->
		                                     
		   
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="#">Pasar a perfil de Empresa</a></li>
		                                        <!--OPCIONAL-->
		        
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="/logout">Cerrar sesión <img class="exit"
		                                                    src="/img/icons/exit-black.png" alt="favoritos"></a></li>
		                                    </ul>
		                                    
	                                	</li>
	                                	<!--BOTÓN FAVORITOS-->
				                        <li class="nav-item"><a class="nav-link" href="#"><img class="navbar-favorites-img"
				                                    src="/img/icons/favoritos.png" alt="Favoritos"></a> </li>      	
	                            	</c:when>
	                            	
	                            	<c:when test="${user.userType.id == 1}">
	                            		<li class="nav-item dropdown">
	                                    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
	                                        	data-bs-toggle="dropdown" aria-expanded="false"><img src="/img/icons/configuracion.png"
	                                           	 alt="configuración"></a>
	        
		                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
		        
		                                        <li>
		                                            <hr class="dropdown-divider">
		                                        </li>
		        
		                                        <li><a class="dropdown-item" href="#">Eliminar cuenta</a></li>
		        		                                            
		                                        <!--OPCIONAL-->                                    
		   		                                      	        
		                                        <li><a class="dropdown-item" href="/logout">Cerrar sesión <img class="exit"
		                                                    src="/img/icons/exit-black.png" alt="favoritos"></a></li>
		                                    </ul>
		                                    <!--BOTÓN CREAR-->
				                        <li class="nav-item"><a class="nav-link" href="/lugar/create">CREAR</a></li>
				
				                        <!--BOTÓN SOLICITUDES-->
				                        <li class="nav-item"><a class="nav-link" href="/lugar/solicitudes">VER SOLICITUDES</a></li>
				
				                        
	                                	    	
	                            	</c:when>
                            	
                            	
                            	</c:choose>
                            	
                            </c:otherwise>
                        </c:choose>

                       
                        

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
                <form:form method="POST" action="/lugar/create" modelAttribute="lugar">
                    <img class="mb-4" src="../img/logo2.png" alt="" width="100" height="auto">
                    <h1 class="h3 mb-3 fw-normal">Registro Lugar</h1>

                    <form:label path="nombre" for="inputName" class="visually-hidden">Nombre</form:label>
                    <form:input path="nombre" type="text" id="inputName" class="form-control" placeholder="Nombre" required="" autofocus=""/>
                    <!--NOMBRE-->
					<p></p>
                    <form:label path="direccion" for="inputEmail" class="visually-hidden">Direccion</form:label>
                    <form:input path="direccion" type="text" id="inputEmail" class="form-control" placeholder="Direccion" required="" autofocus=""/>
                    <!--DIRECCION-->
                    <p></p>
                     <form:label path="correo" for="inputEmail" class="visually-hidden">Correo</form:label>
                    <form:input path="correo" type="email" id="inputEmail" class="form-control" placeholder="Correo" required="" autofocus=""/>
                    <!--EMAIL-->
                	<p></p>
                     <form:label path="telefono" for="inputEmail" class="visually-hidden">Telefono</form:label>
                    <form:input path="telefono" type="text" id="inputEmail" class="form-control" placeholder="Telefono" required="" autofocus=""/>
                    <!--TELEFONO-->
                    <p></p>
                    <form:label path="valor" for="inputEmail" class="visually-hidden">Valor</form:label>
                    <form:input path="valor" type="text" id="inputEmail" class="form-control" placeholder="Valor" required="" autofocus=""/>
                    <!--VALOR-->
                    <p></p>
                    <form:label path="descripcion" for="inputEmail" class="visually-hidden">Descripcion</form:label>
                    <form:input path="descripcion" type="text" id="inputEmail" class="form-control" placeholder="Descripcion" required="" autofocus=""/>
                    <!--VALOR-->
                    <p></p>
                    <form:label path="pagina" for="inputEmail" class="visually-hidden">Pagina</form:label>
                    <form:input path="pagina" type="text" id="inputEmail" class="form-control" placeholder="Pagina" required="" autofocus=""/>
                    <!--VALOR-->
                    <p></p>
                    <div class="col-md-4">
                    	<label for="sub-category" class="form-label">Sub-categorias</label>
                    	 <form:select name="subCategoria" path="subCategoria">
		        		<c:forEach items="${subCategorias}" var="subCategoria">
		        			<form:option value="${subCategoria.getId()}" class="form-control"><c:out value="${subCategoria.getNombre()}"/></form:option>
		        		</c:forEach>
		       		</form:select>
                    </div>
                 	<p></p>
                 	<div class="col-md-4">
                 		<label for="comuna" class="form-label">Comuna</label>
                 		<form:select name="comuna" path="comuna">
		        		<c:forEach items="${comunas}" var="comuna">
		        			<form:option value="${comuna.getId()}" class="form-control"><c:out value="${comuna.getNombre()}"/></form:option>
		        		</c:forEach>
		       		</form:select>
                 	</div>
         			<p></p>
                    <input class="w-100 btn btn-lg btn-dark" role="button" type="submit" id="submit"  value="Enviar Solicitud!"/>
                </form:form>
                
                
            </main>

        </div>

        <STYLE>
        A {
            text-decoration: none;
        }
    </STYLE>
    <footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h5>AMUKAN</h5>
                    <p class="text-justify">Amukan es un proyecto que nace con el propósito de impulsar a las personas a
                        viajar a esos lugares no tan conocidos/recónditos dentro de lo largo del país.
                        Esta página facilita la mayor información posible para el turista.
                        Amukan se ha convertido en una opción para viajeros nacionales y extranjeros
                        quienes atraídos por la naturaleza, paisajes alucinantes, actividades
                        al aire libre que ofrece Chile, buscan encontrar las mayor información al alcance
                        de sus manos.
                    </p>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6>Categorias</h6>
                    <ul class="footer-links">
                    	<c:if test="${sessionON == false}">
                    		<li><a href="/login">Iniciar sesión</a></li>
	                        <li><a href="/registration">Registrarse como turista</a></li>
                    	</c:if>
                        <li><a href="/contacto">Formulario de contacto</a></li>
                        <li><a href="/acerca-de">Acerca de Amukan</a></li>
                        <li><a href="http://localhost:8080/">Página principal</a></li>
                    </ul>
                </div>


            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by
                        <a href="http://localhost:8080/">Amukan</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <!--QUEDARA SIMULADO SIN LINK-->
                        <li><a class="facebook" href="#"><img class="icons-rrss" src="/img/icons/twitter.png"></a></li>
                        <li><a class="twitter" href="#"><img class="icons-rrss" src="/img/icons/instagram.png"></a></li>
                        <li><a class="dribbble" href="#"><img class="icons-rrss" src="/img/icons/facebook.png"></a></li>

                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!--ENLACES BOOTSTRAP Y JQUERY-->
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/popup.js"></script>
    <script src="/js/filtros.js"></script>
    </body>
</html>