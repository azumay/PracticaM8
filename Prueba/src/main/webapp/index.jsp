<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="img/orco.ico">
<meta charset="UTF-8">
<title>Juego de cartas - Yamuza Game</title>
<link rel="stylesheet" href="Estilos/estilos.css">
</head>
<body>

	<div class="titulo-inicio">
		<h1>Bienvenido</h1>
		<h3>¿Que quieres hacer?</h3>
	</div>
	<div class="contenedor">
		<div class="capa1" id="opcion1">
			<div id="texto" class="capa2">
				<p>
					<a href="RandomCard.jsp">Carta Random
				</p>
				</a>
			</div>
		</div>
		<div class="capa1" id="opcion2">
			<div id="texto" class="capa2">
				<p>
					<a href="AddCard.jsp">Carta Custom
				</p>
				</a>
			</div>
		</div>
		<div class="capa1" id="opcion3">
			<div id="texto" class="capa2">
				<p>
					<a href="verCartas.jsp?pagina=1">Ver Cartas
				</p>
				</a>
			</div>
		</div>
	</div>
		
	

</body>
</html>