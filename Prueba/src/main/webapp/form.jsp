<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
	

		  
	
		  function tirarDados6() {
		    let valor = [0, 0, 0, 0, 0, 0];

		    for (let i = 0; i < valor.length; i++) {
		      valor[i] = parseInt(Math.random() * 15 + 3);
		    }
		    return valor;
		  }

		  let puntosHabilidad = tirarDados6();

		  function AddHabilidades() {
		    var theOptions = "<select class='setHabilidades'>";

		    puntosHabilidad.forEach((valor) => {
		       theOptions += "<option>" + valor + "</option>";
		    });

		    theOptions += "</select>";
		    
		    return theOptions;
		  }

		  console.log(AddHabilidades());
		
</script>

	<form class="AsignarPuntos">

		<label>FUER</label>
			<script>document.write(AddHabilidades());</script> 
			<br>
		<label>DES</label>
			<script>document.write(AddHabilidades());</script>
			<br>
		<label>CON</label>
			<script>document.write(AddHabilidades());</script>
			<br>
		<label>INT</label>
			<script>document.write(AddHabilidades());</script>
			<br>
		<label>SAB</label>
			<script>document.write(AddHabilidades());</script>
			<br>
		<label>CAR</label>
			<script>document.write(AddHabilidades());</script>

		
	</form>

</body>
</html>