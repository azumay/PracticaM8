<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="img/orco.ico">
<meta charset="US-ASCII">
<link rel="stylesheet" href="Estilos/estilosCartaRandom.css">
<title>Rpg Card Generator</title>

</head>
<h1 class="titol">Visualitzar cartes</h1>
<ul class="breadcrumb">
	<a href='index.jsp'>
		<button class="button-29" role="button">Volver</button>
	</a>

</ul>
<br>
<br>
<%
//  variables per fer la connexio:
String user = "m8";
String password = "yamuza";
String host = "localhost";
String db = "cartas_m8";
String url = "jdbc:mysql://" + host + "/" + db;
Connection conn = null;
Statement statement = null;
Statement num_registres = null;
ResultSet rs = null;
ResultSet num_reg = null;
int inicio;

//Limito la busqueda
int TAMANO_PAGINA = 2;

//examino la página a mostrar y el inicio del registro a mostrar
String pag = request.getParameter("pagina");
	int pagina=Integer.parseInt(pag);
	if (pagina==0) {
	   	inicio = 0;
	    pagina=1;
	}
	else {
	    inicio = (pagina - 1) * TAMANO_PAGINA;
	}
/**
//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres.executeQuery("SELECT * FROM Cartas;");
int num_total_registros = 0;
while (num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int) Math.ceil(((double) num_total_registros / TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("<p class='resultado'>Nombre de registres trobats: " + num_total_registros + "</p><br>");
out.print("<p class='resultado'>Es mostren pàgines de " + TAMANO_PAGINA + " registres cadascuna</p><br>");
out.print("<p class='resultado'>Mostrant la pàgina " + pagina + " de " + total_paginas + "</p>");
out.print("<div id='paginacion'>");
//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1) {
	for (int i = 1; i <= total_paginas; i++) {
		if (pagina == i)
	//si muestro el índice de la página actual, no coloco enlace
	out.print(pagina);
		else
	//si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
	out.print(" <span><a href=verCartas.jsp?pagina=" + i + ">" + i + "</a> </span>");
	}
}
out.print("</div>");
out.print("<div id='container'>");

out.print("<div id='container-box'>");
try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence = "SELECT * from Cartas limit " + inicio + "," + TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos la consulta
	while (rs.next()) {
		//mostramos los resultados obtenidos
		//out.println(rs.getString("ID_carta"));
		//String nom=request.getParameter("nom");
		
%>
<div class="contenedor-cartas">
<article>
<h1><%out.print(rs.getString("NOM_carta"));%></h1>
	<h2>
		Raza: <%
	out.print(rs.getString("RACE_carta"));
	%><br>
	</h2>
	<div class="img-article">
		<img src="<%out.print(rs.getString("PIC_carta"));%>" height="100"
			width="80">
	</div>
	<ul>
		<li>FUE:<%
		out.print(rs.getString("FUE_carta"));
		%>
		</li>
		<li>DES:<%
		out.print(rs.getString("DES_carta"));
		%>
		</li>
		<li>CON:<%
		out.print(rs.getString("CON_carta"));
		%>
	</ul>
	<ul>
		</li>
		<li>INT:<%
		out.print(rs.getString("INT_carta"));
		%>
		</li>
		<li>SAB:<%
		out.print(rs.getString("SAB_carta"));
		%>
		</li>
		<li>CAR:<%
		out.print(rs.getString("CAR_carta"));
		%>
		</li>
	</ul>
	<div class="putos-vida">
	
PV:<%
out.print(rs.getString("PV_carta"));
%><br>
<table width="<%out.print(rs.getString("PV_carta"));%>" bgcolor="red">
	<tr>
		<td></td>
	</tr>
</table>
PM:<%
out.print(rs.getString("PM_carta"));
%><br>
<table width="<%out.print(rs.getString("PM_carta"));%>" bgcolor="blue">
	<tr>
		<td></td>
	</tr>
</table>
	</div>
</article>
</div>








<%
}
//cerramos la conexión
rs.close();
} catch (SQLException error) {
out.print("Error de Conexión : " + error.toString());
}
%>