<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="img/orco.ico">
<meta charset="UTF-8">
<title>Custom Card - Yamuza Game</title>
<script src="script/modificadores.js"></script>
<link rel="stylesheet" href="Estilos/estilosAddCard.css">
<link rel="stylesheet" href="Estilos/estilosCartaRandom.css">
</head>


<%!public class Personatge {
		//atributs
		protected String nom;
		protected String imatge;
		protected String classe;

		protected String color1;
		protected String color2;
		protected String color3;

		protected int[] punts;

		protected int VIDA;
		protected int MANA;

		protected int finalFUE;
		protected int finalDES;
		protected int finalCON;
		protected int finalINT;
		protected int finalSAB;
		protected int finalCAR;

		//constructor
		public Personatge() {
			this.punts = new int[6];
			int tria = (int) Math.floor(Math.random() * (6 - 1 + 1)) + 1;
			if (tria == 1) {
				this.crearElf();
			} else if (tria == 2) {
				this.crearNan();
			} else if (tria == 3) {
				this.crearGnom();
			} else if (tria == 4) {
				this.crearMitja();
			} else if (tria == 5) {
				this.crearSemiOrc();
			} else if (tria == 6) {
				this.crearHuma();
			}
		}
		public Personatge(int tria) {
			this.punts = new int[7];
			if (tria == 1) {
				this.crearElf();
			} else if (tria == 2) {
				this.crearNan();
			} else if (tria == 3) {
				this.crearGnom();
			} else if (tria == 4) {
				this.crearMitja();
			} else if (tria == 5) {
				this.crearSemiOrc();
			} else if (tria == 6) {
				this.crearHuma();
			}
		}
		//mètodes
		private int tirarDaus(int daus) {
			int mesPetit = 0;
			int cares = 6;
			int suma = 0;
			for (int i = 0; i < daus; i++) {
				int actual = (int) Math.floor(Math.random() * (cares - 1 + 1)) + 1;
				if (mesPetit == 0 || mesPetit > actual)
					mesPetit = actual;
				suma += actual;
			}
			suma -= mesPetit;
			return suma;
		}
		private int tirarDaus(int daus, int cares) {
			int suma = 0;
			for (int i = 0; i < daus; i++) {
				int actual = (int) Math.floor(Math.random() * (cares - 1 + 1)) + 1;
				suma += actual;
			}
			return suma;
		}
		public void crearElf() {
			this.imatge = "0.png";
			this.classe = "Elf";

			this.color1 = "#99bfcd";
			this.color2 = "#fcf3b0";
			this.color3 = "#d3ecec";

		}
		public void crearNan() {
			this.imatge = "1.png";
			this.classe = "Nan";

			this.color1 = "#a67b4f";
			this.color2 = "#f9b78f";
			this.color3 = "#62412e";
		}
		public void crearGnom() {
			this.imatge = "2.png";
			this.classe = "Gnom";

			this.color1 = "#4a8da8";
			this.color2 = "#FFBBF0";
			this.color3 = "#b8ae95";
		}
		public void crearMitja() {
			this.imatge = "3.png";
			this.classe = "Mitjà";

			this.color1 = "#c2724c";
			this.color2 = "#d45a76";
			this.color3 = "#f0d4ba";
		}
		public void crearSemiOrc() {
			this.imatge = "4.png";
			this.classe = "SemiOrc";

			this.color1 = "#66747b";
			this.color2 = "#a4a095";
			this.color3 = "#bda67c";
		}
		public void crearHuma() {
			this.imatge = "5.png";
			this.classe = "Humà";

			this.color1 = "#cab69a";
			this.color2 = "#a9a6ad";
			this.color3 = "#7D8093";
		}

		public void setNom(String nom) {
			this.nom = nom;
		}

		public void setVida() {
			this.VIDA = tirarDaus(1, 8) * this.finalCON;
		}

		public void setMana() {
			int mana = (this.finalINT + this.finalSAB) / 2;
			mana = (int) Math.floor(mana);
			this.MANA = tirarDaus(1, 4) * mana;
		}

		public void setArray() {
			for (int i = 0; i < 6; i++) {
				this.punts[i] = this.tirarDaus(4);
			}
		}

		//Aquest mètode fa l'insert a la base de dades
		public boolean guardar() {
			return true;
		}

	}%>
<%
Personatge pers;
if (request.getParameter("clase") == null) {
	pers = new Personatge();
	pers.setArray();
} else {
	int clase = Integer.parseInt(request.getParameter("clase"));
	if (clase > 0 && clase <= 6) {
		pers = new Personatge(clase);
		pers.setArray();
	} else {
		pers = new Personatge();
		pers.setArray();
	}
}
pers.setArray();
%>
<body>

	<div class="titulo-cabecera">
		<h2>Carta Custom</h2>
		<img src="img/titulo-img.png">
	</div>

	<div class="botones-control">
		<a href='AddCard.jsp'>
			<button class="button-29" role="button">Cambiar personaje</button>
		</a> <a href='index.jsp'>
			<button class="button-29" role="button">Volver</button>
		</a>
	</div>

	<form action="insert_bd.jsp" method="post">
		<div class="fondo-form">
			<h1 style="text-align: center;">
				<%
				out.println(pers.classe);
				%>
			</h1>
			<input type="hidden" name="race" value=<%=pers.classe%>>
			<input type="hidden" name="picture" value=<%=pers.imatge%>>

			<table style="width: 100%; height: 10%; opacity: 1; %&gt;" class="tg">
				</tbody>
				<tr>
					<td id="imatge" style="width: 40%;" class="tg-0lax" rowspan="8">
						<img style="width: 100%; height: 390px;"
						src="img/<%out.println(pers.imatge);%>" alt="Caràcter">
					</td>
					<td class="tg-ucee">Característiques</td>
					<td class="tg-ucee">Valor Base</td>
					<td class="tg-ucee">Modificadors</td>
					<td class="tg-ucee">Valor final</td>
				</tr>

				<tr>
					<td class="tg-fgy3">FUE:</td>
					<td class="tg-fgy3"><select name="fue" id="select1">

					</select></td>
					<td class="tg-fgy3" id="f">
						<%
						if (pers.classe == "SemiOrc")
							out.print("+2");
						else if (pers.classe == "Gnom" || pers.classe == "Mitjà")
							out.print("-2");
						else
							out.print("+0");
						%>
					</td>
					<td class="tg-fgy3" id="fFinal"></td>
				</tr>
				<tr>
					<td class="tg-fgy3">DES:</td>
					<td class="tg-fgy3"><select name="des" id="select2">

					</select></td>
					<td class="tg-fgy3" id="h">
						<%
						if (pers.classe == "Elf" || pers.classe == "Mitjà")
							out.print("+2");
						else
							out.print("+0");
						%>
					</td>
					<td class="tg-fgy3" id="hFinal"></td>
				</tr>
				<tr>
					<td class="tg-fgy3">CON:</td>
					<td class="tg-fgy3">
					<select name="con" id="select3">
					</select>
					
					</td>
					<td class="tg-fgy3" id="c">
						<%
						if (pers.classe == "Nan" || pers.classe == "Gnom")
							out.print("+2");
						else if (pers.classe == "Elf")
							out.print("-2");
						else
							out.print("+0");
						%>
					</td>
					<td class="tg-fgy3" id="cFinal"></td>
				</tr>
				<tr>
					<td class="tg-fgy3">INT:</td>
					<td class="tg-fgy3"><select name="int" id="select4">

					</select></td>
					<td class="tg-fgy3" id="i">
						<%
						if (pers.classe == "Elf")
							out.print("+2");
						else if (pers.classe == "SemiOrc")
							out.print("-2");
						else
							out.print("+0");
						%>
					</td>
					<td class="tg-fgy3" id="iFinal"></td>
				</tr>
				<tr>
					<td class="tg-fgy3">SAB:</td>
					<td class="tg-fgy3"><select name="sab" id="select5">

					</select></td>
					<td class="tg-fgy3" id="s">
						<%
						if (pers.classe == "Nan")
							out.print("+2");
						else
							out.print("+0");
						%>
					</td>
					<td class="tg-fgy3" id="sFinal"></td>
				</tr>
				<tr>
					<td class="tg-fgy3">CAR:</td>
					<td class="tg-fgy3"><select name="car" id="select6">

					</select></td>
					<td class="tg-fgy3" id="ca">
						<%
						if (pers.classe == "Gnom")
							out.print("+2");
						else if (pers.classe == "SemiOrc" || pers.classe == "Nan")
							out.print("-2");
						else
							out.print("+0");
						%>
					</td>
					<td class="tg-fgy3" id="caFinal"></td>
				</tr>
				<tr>
					<td class="tg-fgy3">Vida:</td>
					<td class="tg-0lax" colspan="3">
						<div syle="width:100%;" class="progress">
							<progress class="vida" id="vida" max="100" value="1" name="pv"></progress>
							<input type="hidden" name="pv" value="" id="vidaInsert">
						</div>
					</td>
				</tr>
				<tr>
					<td>Nom: <input type="text" id="nom" name="nom"></td>
					<td class="tg-fgy3">Maná:</td>
					<td class="tg-0lax" colspan="3">
						<div syle="width:100%;" class="progress">
							<progress class="mana" id="mana" max="80" value="1" name="pm"></progress>
							<input type="hidden" name="pm" value="" id="manaInsert">
						</div>
					</td>
				</tr>
				<td><input type="submit" name="submitRegistro"
					value="Crear Carta ✅" class="button-29"></td>
				</tbody>
			</table>

		</div>
	</form>
	<script>
		var punts = [
	<%out.print(pers.punts[0]);%>
		,
	<%out.print(pers.punts[1]);%>
		,
	<%out.print(pers.punts[2]);%>
		,
	<%out.print(pers.punts[3]);%>
		,
	<%out.print(pers.punts[4]);%>
		,
	<%out.print(pers.punts[5]);%>
		];

		function cambiaValores() {
			var inputNombre = document.getElementById("fuerzaPost");
			inputNombre.value = finals.s1;
		}

		var finals = {
			"s1" : null,
			"s2" : null,
			"s3" : null,
			"s4" : null,
			"s5" : null,
			"s6" : null
		};

		//elements
		var select1 = document.getElementById("select1");
		var select2 = document.getElementById("select2");
		var select3 = document.getElementById("select3");
		var select4 = document.getElementById("select4");
		var select5 = document.getElementById("select5");
		var select6 = document.getElementById("select6");

		//Elemento 1
		for (let i = 0, n = punts.length; i < n; i++) {
			var option = new Option(punts[i], punts[i]);
			select1.appendChild(option);
		}
		//Elemento 2
		for (let i = 0, n = punts.length; i < n; i++) {
			var option = new Option(punts[i], punts[i]);
			select2.appendChild(option);
		}
		//Elemento 3
		for (let i = 0, n = punts.length; i < n; i++) {
			var option = new Option(punts[i], punts[i]);
			select3.appendChild(option);
		}

		//Elemento 4
		for (let i = 0, n = punts.length; i < n; i++) {
			var option = new Option(punts[i], punts[i]);
			select4.appendChild(option);
		}
		//Elemento 5
		for (let i = 0, n = punts.length; i < n; i++) {
			var option = new Option(punts[i], punts[i]);
			select5.appendChild(option);
		}
		//Elemento 6
		for (let i = 0, n = punts.length; i < n; i++) {
			var option = new Option(punts[i], punts[i]);
			select6.appendChild(option);
		}

		//ONCHANGE
		//1
		select1.onchange = function() {
			var aux = punts[select1.selectedIndex];
			var index = punts.indexOf(aux);

			if (finals["s1"] != null) {
				console.log(finals["s1"]);
				var auxo = punts.indexOf(finals["s1"]);

				select2.options[auxo].disabled = false;
				select3.options[auxo].disabled = false;
				select4.options[auxo].disabled = false;
				select5.options[auxo].disabled = false;
				select6.options[auxo].disabled = false;
			}

			finals["s1"] = aux;
			console.log(finals);

			select2.options[index].disabled = true;
			select3.options[index].disabled = true;
			select4.options[index].disabled = true;
			select5.options[index].disabled = true;
			select6.options[index].disabled = true;

			//valor final Update
			let mod = document.getElementById("f").innerHTML;
			console.log(mod);

			let result = eval(aux + mod);

			let finalFuer = document.getElementById('fFinal').innerHTML = result;
		}
		//2
		select2.onchange = function() {
			var aux = punts[select2.selectedIndex];
			var index = punts.indexOf(aux);

			if (finals["s2"] != null) {
				console.log(finals["s2"]);
				var auxo = punts.indexOf(finals["s2"]);

				select1.options[auxo].disabled = false;
				select3.options[auxo].disabled = false;
				select4.options[auxo].disabled = false;
				select5.options[auxo].disabled = false;
				select6.options[auxo].disabled = false;
			}

			finals["s2"] = aux;
			console.log(finals);

			select1.options[index].disabled = true;
			select3.options[index].disabled = true;
			select4.options[index].disabled = true;
			select5.options[index].disabled = true;
			select6.options[index].disabled = true;

			//valor final Update
			let mod = document.getElementById("h").innerHTML;
			console.log(mod);

			let result = eval(aux + mod);

			let finalFuer = document.getElementById('hFinal').innerHTML = result;
		}

		//3
		select3.onchange = function() {
			var aux = punts[select3.selectedIndex];
			var index = punts.indexOf(aux);

			if (finals["s3"] != null) {
				console.log(finals["s3"]);
				var auxo = punts.indexOf(finals["s3"]);

				select1.options[auxo].disabled = false;
				select2.options[auxo].disabled = false;
				select4.options[auxo].disabled = false;
				select5.options[auxo].disabled = false;
				select6.options[auxo].disabled = false;
			}

			finals["s3"] = aux;
			console.log(finals);

			select1.options[index].disabled = true;
			select2.options[index].disabled = true;
			select4.options[index].disabled = true;
			select5.options[index].disabled = true;
			select6.options[index].disabled = true;

			//valor final Update
			let mod = document.getElementById("c").innerHTML;
			console.log(mod);

			let result = eval(aux + mod);

			let finalFuer = document.getElementById('cFinal').innerHTML = result;
			
			//vida
			var vida =
	<%out.print(pers.tirarDaus(1, 8));%>
		* finals["s3"];
			let vidafinal = document.getElementById('vida').value = vida;
			let vidaPer = document.getElementById('vidaInsert').value = vida;
		}

		//4
		select4.onchange = function() {
			var aux = punts[select4.selectedIndex];
			var index = punts.indexOf(aux);

			if (finals["s4"] != null) {
				console.log(finals["s4"]);
				var auxo = punts.indexOf(finals["s4"]);

				select1.options[auxo].disabled = false;
				select2.options[auxo].disabled = false;
				select3.options[auxo].disabled = false;
				select5.options[auxo].disabled = false;
				select6.options[auxo].disabled = false;
			}

			finals["s4"] = aux;
			console.log(finals);

			select1.options[index].disabled = true;
			select2.options[index].disabled = true;
			select3.options[index].disabled = true;
			select5.options[index].disabled = true;
			select6.options[index].disabled = true;

			//valor final Update
			let mod = document.getElementById("i").innerHTML;
			console.log(mod);

			let result = eval(aux + mod);

			let finalFuer = document.getElementById('iFinal').innerHTML = result;

			//mana
			if (finals["s5"] != null) {
				var mana = Math.floor((finals["s4"] + finals["s5"]) / 2)
						*
	<%out.print(pers.tirarDaus(1, 4));%>
		;
				console.log(mana);
				let manafinal = document.getElementById('mana').value = mana;
				let manadb = document.getElementById('manaInsert').value = mana;
			}
		}

		//5
		select5.onchange = function() {
			var aux = punts[select5.selectedIndex];
			var index = punts.indexOf(aux);

			if (finals["s5"] != null) {
				console.log(finals["s5"]);
				var auxo = punts.indexOf(finals["s5"]);

				select1.options[auxo].disabled = false;
				select2.options[auxo].disabled = false;
				select3.options[auxo].disabled = false;
				select4.options[auxo].disabled = false;
				select6.options[auxo].disabled = false;
			}

			finals["s5"] = aux;
			console.log(finals);

			select1.options[index].disabled = true;
			select2.options[index].disabled = true;
			select3.options[index].disabled = true;
			select4.options[index].disabled = true;
			select6.options[index].disabled = true;

			//valor final Update
			let mod = document.getElementById("s").innerHTML;
			console.log(mod);

			let result = eval(aux + mod);

			let finalFuer = document.getElementById('sFinal').innerHTML = result;

			//mana
			if (finals["s4"] != null) {
				var mana = Math.floor((finals["s4"] + finals["s5"]) / 2)
						*
	<%out.print(pers.tirarDaus(1, 4));%>
		;
				console.log(mana);
				let manafinal = document.getElementById('mana').value = mana;
			}

		}

		//6
		select6.onchange = function() {
			var aux = punts[select6.selectedIndex];
			var index = punts.indexOf(aux);

			if (finals["s6"] != null) {
				console.log(finals["s6"]);
				var auxo = punts.indexOf(finals["s6"]);

				select1.options[auxo].disabled = false;
				select2.options[auxo].disabled = false;
				select3.options[auxo].disabled = false;
				select5.options[auxo].disabled = false;
				select4.options[auxo].disabled = false;
			}

			finals["s6"] = aux;
			console.log(finals);

			select1.options[index].disabled = true;
			select2.options[index].disabled = true;
			select3.options[index].disabled = true;
			select4.options[index].disabled = true;
			select5.options[index].disabled = true;

			//valor final Update
			let mod = document.getElementById("ca").innerHTML;
			console.log(mod);

			let result = eval(aux + mod);

			let finalFuer = document.getElementById('caFinal').innerHTML = result;

		}
	</script>

</body>