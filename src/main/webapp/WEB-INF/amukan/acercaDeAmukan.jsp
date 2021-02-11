<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2? family = Pacifico & display = swap" rel="hoja de estilo ">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto+Mono&display=swap" rel="stylesheet">

    <title>AMUKAN</title>
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


     <div class="row-acerca align-items-center acerca-de">
        <div class="col-acerca col-6 align-self-center">
            <br><br><br><br><br>
            <h1>ACERCA DE AMUKAN</h1>
            <br>
            <p>Recorriendo Chile al detalle. <br>
                Amukan ofrece tanto a viajeros
                como a emprendedores y empresas que puedan ser parte de un viaje mucho más accesible 
                y sencillo. 
                
                La falta de información y la distribución desordenada de los lugares es algo real, 
                y ahora con amukan les entregamos este ambiente seguro y óptimo para que 
                La búsqueda de datos turísticos de comunas de Chile está completa aquí.
                
                Amukan nace de un proyecto impulsado por jóvenes fanaticos de la belleza de chile 
                y de la intriga de esos lugares escondidos por ahí.Y juntos deciden darle 
                vida a este proyecto que será clave para el turismo chileno.
                
                Nuestra página cuenta actualmente con dos tipos de perfiles: "empresa" y "turista".
                donde ambos perfiles son una herramienta clave para poder llegar a muchos
                lugares dentro de este largo país.
                El Turista podrá calificar y evaluar los lugares donde decide viajar;
                Y la empresa podrá mejorar y difundir su negocio para crecer 
                en el mercado del turismo.
                
                Al ser parte de nuestra página nos importa lo que te preocupa es por eso que contamos 
                con un sistema de contacto para cualquier infracción 
                duda o problema que exista al usar esta página.
                
                Amukan queremos que puedas viajar y que la falta de información no sea un problema.
                Que el descubrir nuevos lugares y arriesgarse a dejar los lugares conocidos atrás
                sea solo un paso de este nuevo camino que todos recorremos.
                Amukan será esa herramienta que tanto necesitas para organizar tu viaje.
                
                
                </p>
            
        </div>
        <div class="col-acerca col-6 align-self-center">
            <img src="/img/fondo-2.png" alt="#">
        </div>
    </div>
    <!--FIN CONTAINER FLUID-->


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