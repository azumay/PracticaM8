<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="img/orco.ico">
<title>Random Card - Yamuza Game</title>
<link rel="stylesheet" href="Estilos/estilosCartaRandom.css">
<link rel="stylesheet" href="Estilos/estilosAddCard.css">
</head>
<body>
	<%!public class personajes {

		int caracFue;
		int caracDes;
		int caracCon;
		int caracInt;
		int caracSab;
		int caracCAR;

		int caracFueMod;
		int caracDesMod;
		int caracConMod;
		int caracIntMod;
		int caracSabMod;
		int caracCARMod;

		int pVida;
		int pMana;
		int modPositivo;
		int modNegativo;
		String img;
		int modificador;
		String nombre;

		// Personajes: Elfs", "Nans", "Gnom", "Mitjans", "Semi-Orc", "humans
		String charElfs;
		String charNans;
		String charGnom;
		String charMitjans;
		String charSemiOrc;
		String charHumans;

		public personajes(int num) {

			this.caracCAR = this.tirarDados6();
			this.caracCon = this.tirarDados6();
			this.caracDes = this.tirarDados6();
			this.caracFue = this.tirarDados6();
			this.caracInt = this.tirarDados6();
			this.caracSab = this.tirarDados6();

			switch (num) {
			case 1:
				this.setCharElf();
				break;
			case 2:
				this.setCharNans();
				break;
			case 3:
				this.setCharGnom();
				break;
			case 4:
				this.setCharMitjans();
				break;
			case 5:
				this.setCharSemiOrc();
				break;
			case 6:
				this.setCharHumans();
				break;
			}
		}

		public int tirarDados6() {
			int mesPetit = 0;
			int cares = 6;
			int suma = 0;
			for (int i = 0; i < 4; i++) {
				int actual = (int) Math.floor(Math.random() * (cares - 1 + 1)) + 1;
				if (mesPetit == 0 || mesPetit > actual)
					mesPetit = actual;
				suma += actual;
			}
			suma -= mesPetit;
			return suma;
		}

		public String getElf() {
			return charElfs;
		}

		public String getCharNans() {
			return charNans;
		}

		public String getCharGnom() {
			return charGnom;
		}

		public String getCharMitjans() {
			return charMitjans;
		}

		public String getCharSemiOrc() {
			return charSemiOrc;
		}

		public String getCharHumans() {
			return charHumans;
		}

		public void setCharElf() {

			this.caracCARMod = this.caracCAR;
			this.caracConMod = this.caracCon - 2;
			this.caracDesMod = this.caracDes + 2;
			this.caracFueMod = this.caracFue;
			this.caracIntMod = this.caracInt + 2;
			this.caracSabMod = this.caracSab;

			this.pVida = this.caracCon * (int) (Math.random() * 8 + 1);
			this.pMana = (this.caracInt + this.caracSab) / 2 * (int) (Math.random() * 4 + 1);
			this.img = "img/0.png";
			this.modPositivo = +2;
			this.modNegativo = -2;
			this.modificador = 0;
			this.nombre = "Elf";

		}

		public void setCharNans() {

			this.caracFueMod = this.caracFue - 2;
			this.caracDesMod = this.caracDes + 2;
			this.caracConMod = this.caracCon;
			this.caracIntMod = this.caracInt;
			this.caracSabMod = this.caracSab;
			this.caracCARMod = this.caracCARMod + 2;

			this.pVida = this.caracCon * (int) (Math.random() * 8 + 1);
			this.pMana = (this.caracInt + this.caracSab) / 2 * (int) (Math.random() * 4 + 1);
			this.img = "img/1.png";
			this.nombre = "Nans";
		}

		public void setCharGnom() {

			this.caracCARMod = this.caracCAR + 2;
			this.caracConMod = this.caracCon + 2;
			this.caracDesMod = this.caracDes;
			this.caracFueMod = this.caracFue - 2;
			this.caracIntMod = this.caracInt;
			this.caracSabMod = this.caracSab;
			this.pVida = this.caracCon * (int) (Math.random() * 8 + 1);
			this.pMana = (this.caracInt + this.caracSab) / 2 * (int) (Math.random() * 4 + 1);
			this.img = "img/2.png";
			this.nombre = "Gnom";
		}

		public void setCharMitjans() {
			this.caracCARMod = this.caracCAR;
			this.caracConMod = this.caracCon;
			this.caracDesMod = this.caracDes + 2;
			this.caracFueMod = this.caracFue - 2;
			this.caracIntMod = this.caracInt;
			this.caracSabMod = this.caracSab;
			this.pVida = this.caracCon * (int) (Math.random() * 8 + 1);
			this.pMana = (this.caracInt + this.caracSab) / 2 * (int) (Math.random() * 4 + 1);
			this.img = "img/3.png";
			this.nombre = "Mitjan";
		}

		public void setCharSemiOrc() {
			this.caracCARMod = this.caracCAR - 2;
			this.caracConMod = this.caracCon;
			this.caracDesMod = this.caracDes;
			this.caracFueMod = this.caracFue + 2;
			this.caracIntMod = this.caracInt - 2;
			this.caracSabMod = this.caracSab;
			this.pVida = this.caracCon * (int) (Math.random() * 8 + 1);
			this.pMana = (this.caracInt + this.caracSab) / 2 * (int) (Math.random() * 4 + 1);
			this.img = "img/4.png";
			this.nombre = "Orc";
		}

		public void setCharHumans() {
			this.caracCARMod = this.caracCAR;
			this.caracConMod = this.tirarDados6();
			this.caracDesMod = this.tirarDados6();
			this.caracFueMod = this.tirarDados6();
			this.caracIntMod = this.tirarDados6();
			this.caracSabMod = this.tirarDados6();
			this.pVida = this.caracCon * (int) (Math.random() * 8 + 1);
			this.pMana = (this.caracInt + this.caracSab) / 2 * (int) (Math.random() * 4 + 1);
			this.img = "img/5.png";
			this.nombre = "Huma";

		}

	}

	public int getDice6() {
		return (int) (Math.random() * 6 + 1);
	}%>



	<%
	personajes playerOne = new personajes(getDice6());
	%>
	<div class="titulo-cabecera">
		<h2>Generar carta Random</h2>
		<img src="img/titulo-img.png">

	</div>

	<div class="botones-control">
		<a href='RandomCard.jsp'>
			<button class="button-29" role="button">Generar otra carta</button>
		</a> <a href='index.jsp'>
			<button class="button-29" role="button">Volver</button>
		</a>
	</div>

	<form action="insert_bd.jsp" method="post">
		<div class="fondo-form">
			<h1><%=playerOne.nombre%></h1>
			<input type="hidden" name="race" value=<%=playerOne.nombre%>>
			<table class="tg" style="width: 100%; height: 10%; opacity: 1;">




				<tbody>
					<tr>
						<td rowspan="8" style="width: 40%;"><img
							src="<%=playerOne.img%>" style="width: 80%; height: 390px;">
					<input type="hidden" name="picture" value="<%=playerOne.img%>">		
						</td>
						<th>Carac.</th>
						<th>Valor Base</th>
						<th>Mod.</th>
						<th>Valor Final</th>

					</tr>

					<tr>

						<td>FUE:</td>
						<td><%=playerOne.caracFue%></td>
						<td><%=playerOne.caracFueMod - playerOne.caracFue%></td>
						<td><%=playerOne.caracFueMod%></td>
						<input type="hidden" name="fue" value="<%=playerOne.caracFueMod%>">
					</tr>
					<tr>
						<td>DES:</td>
						<td><%=playerOne.caracDes%></td>
						<td><%=playerOne.caracDesMod - playerOne.caracDes%></td>
						<td><%=playerOne.caracDesMod%></td>
						<input type="hidden" name="des" value="<%=playerOne.caracDes%>">
					</tr>
					<tr>
						<td>CON:</td>
						<td><%=playerOne.caracCon%></td>
						<td><%=playerOne.caracConMod - playerOne.caracCon%></td>
						<td><%=playerOne.caracConMod%></td>
						<input type="hidden" name="con" value="<%=playerOne.caracConMod%>">
					</tr>
					<tr>
						<td>INT:</td>
						<td><%=playerOne.caracInt%></td>
						<td><%=playerOne.caracIntMod - playerOne.caracInt%></td>
						<td><%=playerOne.caracIntMod%></td>
						<input type="hidden" name="int" value="<%=playerOne.caracConMod%>">
					</tr>
					<tr>
						<td>SAB:</td>
						<td><%=playerOne.caracSab%></td>
						<td><%=playerOne.caracSabMod - playerOne.caracSab%></td>
						<td><%=playerOne.caracSabMod%></td>
						<input type="hidden" name="sab" value="<%=playerOne.caracSabMod%>">
					</tr>
					<tr>
						<td>CAR:</td>
						<td><%=playerOne.caracCAR%></td>
						<td><%=playerOne.caracCARMod - playerOne.caracCAR%></td>
						<td><%=playerOne.caracCAR%></td>
						<input type="hidden" name="car" value="<%=playerOne.caracCAR%>">
					</tr>
					<tr>
						<td>P.V (<%=playerOne.pVida%>)
						</td>
						<td colspan="3"><progress id="file" max="100"
								value="<%=playerOne.pVida%>"></td>
					<input type="hidden" name="pv" value="<%=playerOne.pVida%>">

					</tr>
					<tr>
						<td>Nom: <input type="text" id="nom" name="nom"></td>
						<td>P.M (<%=playerOne.pMana%>)
						</td>
						<td colspan="3"><progress id="file" max="100"
								value="<%=playerOne.pMana%>"></td>
					<input type="hidden" name="pm" value="<%=playerOne.pMana%>">
					</tr>

					<td><input type="submit" name="submitRegistro"
						value="Crear Carta ✅" class="button-29"></td>
			</table>
		</div>
	</form>




	<footer>
		<div class="contenedor">
			<p class="copy">Xavi Yamuza &copy; 2022</p>
		</div>
	</footer>



</body>
</html>