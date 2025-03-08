<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Home</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-image: url("https://wallpapers.com/images/hd/black-space-ucu76jjrkyuwr7f2.jpg");
        }
        .carousel-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        #carouselExample {
            max-height: 350px;
            max-width: 600px;
            width: 80%;
        }
        #textoCarusel {
            font-size: 20px;
            width: 350px;
            max-height: 350px;
            padding-left: 25px;
            color: white;
            text-overflow: ellipsis;
            padding-top: 20px;
        }
        .toast-container {
            position: fixed;
            bottom: 62px;
            right: 20px;
            z-index: 1050;
        }

        @import url('https://fonts.cdnfonts.com/css/star-jedi');

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: black;
            text-align: center;
            padding: 15px 0;
            border-top: 3px solid #ffe81f;
            box-shadow: 0 0 10px #ffe81f, 0 0 20px #ffcc00;
            font-family: 'Star Jedi', sans-serif;
            color: #ffe81f;
            font-size: 14px;
        }
        footer a {
            color: whitesmoke;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        footer a:hover {
            text-shadow: 1px 1px yellow;
        }
    </style>
</head>
<body>
<jsp:include page="/pages/navBar.html"/>

<div class="carousel-container">
    <div id="carouselExample" class="carousel slide pointer-event">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="https://wallpapers.com/images/hd/star-wars-background-vdgqv4b95q9ur6ak.jpg">
            </div>
            <div class="carousel-item">
                <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="https://t3.ftcdn.net/jpg/02/98/94/38/360_F_298943877_A4W7tVyZPCu6gNGuGXJUerZbXsWmblLb.jpg">
            </div>
            <div class="carousel-item">
                <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="https://media.timeout.com/images/102998758/750/562/image.jpg">
            </div>
            <div class="carousel-item">
                <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="https://burgosmoderno.com/wp-content/uploads/2025/01/Orden-cronologico-para-ver-las-peliculas-y-series-de-Star-Wars.jpg"/>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div id="textoCarusel">
        <h3 style="color: red">Sumérgete en el Universo Star Wars</h3>
        <p>
            Explora el legado de la saga a través de sus icónicas películas, y descubre más sobre los planetas,
            las naves espaciales, los personajes y las aventuras que han marcado la historia del cine
        </p>
    </div>
</div>

<%
    String mensaje = null;
    if (request.getParameter("newInformes") != null) {
        boolean nuevosInformes = request.getParameter("newInformes").equalsIgnoreCase("true");
        mensaje = nuevosInformes ? "¡Se han agregado nuevos informes!" : "No se ha agregado ningún informe.";
    }
%>

<% if (mensaje != null) {

%>
<div class="toast-container">
    <div class="toast show align-items-center text-bg-warning border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <%= mensaje %>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
<% }%>

    <footer>
        <div class="text-center p-3">
            © 2024 Star Wars Fan Page <br> <br>
            Desarrollado por <a class="text-body">Manuel José Liébana</a>
        </div>
    </footer>
</div>
</body>
</html>
