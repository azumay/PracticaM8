<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Estilos/estilosCartaRandom.css">
<link rel="icon" type="image/x-icon" href="img/orco.ico">
<meta charset="UTF-8">

<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<%
/*
  CREATE TABLE Cartas (
  NOM_carta varchar(150) NOT NULL,
  PIC_carta varchar(40) NOT NULL,
  RACE_carta varchar(60) NOT NULL,
  FUE_carta INT  NOT NULL,
  DES_carta INT  NOT NULL,
  CON_carta INT  NOT NULL,
  INT_carta INT  NOT NULL,
  SAB_carta INT  NOT NULL,
  CAR_carta INT  NOT NULL,
  PV_carta  INT  NOT NULL,
  PM_carta  INT  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

*/

// variables per fer la connexio:
	String user="m8";
	String password="yamuza";
	String host="localhost";
	String db = "cartas_m8";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	
	// recollim valors formulari:
	String nom=request.getParameter("nom");
	
	String race=request.getParameter("race");
	String picture=request.getParameter("picture");
	String fue=request.getParameter("fue");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("des");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("con");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("int");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("sab");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("car");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("pv");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("pm");
	int npm=Integer.parseInt(pm);

try{

	Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into Cartas(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+")");
out.println("Data is successfully inserted!");

out.println("<a href='index.jsp'> <button class='button-29' role='button'>Volver</button> </a>");


}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} %>

