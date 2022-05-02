





		  let puntosHabilidad = tirarDados6();

		  function AddHabilidades() {
		    var theOptions = "<select class='setHabilidades'>  <option value='' disabled selected>Elije</option>";

		    puntosHabilidad.forEach((valor) => {
		       theOptions += "<option>" + valor + "</option>";
		    });

		    theOptions += "</select>";
		    
		    return theOptions;
		  }
		  
		  function BaseFuerza() {
			    var theOptions = "<select id='baseFuerza' onChange='imprimirValor()''>  ";

			    puntosHabilidad.forEach((valor, i) => {
			       theOptions += "<option value="+(i+1)+">" + valor + "</option>";
			    });

			    theOptions += "</select>";
			    
			    return theOptions;
			  }
		  
		  function valorModFuerza(){
			  let mod = document.getElementById("modFuerza").innerHTML;
				 return mod;
		  }
		 
		  /*
		let x = "10";
		let y = "-15";

		let result = eval(x + y);

		  
		  */

		 // console.log(AddHabilidades());
 
	window.onload = function() {

//Select 1
  let a1=  imprimirValor();
  let b1= valorModFuerza();
  let result0 = eval(a1 + b1);
 
//Select 2
  let a2=  imprimirValor();
  let b2= valorModFuerza();
  let result1 = eval(a2 + b2);
  	
  
  let final0= document.getElementsByClassName('total')[0].innerHTML =result0;
  let final1= document.getElementsByClassName('total')[1].innerHTML =result1;
  
  
  
  
}	  
		 function imprimirValor(){
			
			  let select = document.getElementById("baseFuerza");
			  let options=document.getElementsByTagName("option");
			 
			//  console.log(select);
			 return options[select.value-1].innerHTML;
			 
			}
			
		 // let modFue = document.getElementById("modFuerza");	 
		 // console.log(modFue);
