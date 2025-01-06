	
    function validationAcademic(){
	  var branch = document.getElementById("branch").value;
	  var year = document.getElementById("year").value;
	  var sgpa1 = document.getElementById("sgpa1").value;
	  var sgpa2 = document.getElementById("sgpa2").value;
		  
		if(branch=="--Select Branch--"){
			alert("Select Branch");
			return false;
		}
		else if(year=="--Select Year--"){
			alert("Select Year");
			return false;
		}
		else if(sgpa1==""){
			alert("Enter sgpa of Semister 1");
			return false;
		}
		else if(sgpa2==""){
			alert("Enter sgpa of Semister 2");
			return false;
		}
		else{
			return true;
		}
			
}
  
  function validationDocuments(){
	  var documentName = document.getElementById("documentName").value;
	  var documentFile = document.getElementById("documentFile").value;
	  if(documentName==""){
			alert("Enter Document Name");
			return false;
	  }
	  else if(documentFile==""){
			alert("Upload Document File");
			return false;
	  }
	  else{
		  return true;
	  }
  }
  
  function queryValidation(){
	  var subject = document.getElementById("subject").value;
	  var description = document.getElementById("description").value;
	  if(subject==""){
			alert("Enter Subject / Title");
			return false;
	  }
	  else if(description==""){
			alert("Type Query details..");
			return false;
	  }
	  else{
		  return true;
	  }
	  
  }