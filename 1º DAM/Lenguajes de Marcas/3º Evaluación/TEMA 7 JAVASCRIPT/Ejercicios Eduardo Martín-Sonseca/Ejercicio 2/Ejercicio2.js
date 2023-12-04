window.onload = function () {
 
}

parrafos = document.getElementsByTagName("p");

function par() {
    
  for (let i = 0; i < parrafos.length; i++) {
    if (i % 2 == 0) {
      parrafos[i].style.backgroundColor = "grey";
    } else {
      parrafos[i].style.backgroundColor = "white";
    }
  }
}

function impar() {
    
  for (let i = 0; i < parrafos.length; i++) {
    if (i % 2 == 0) {
      parrafos[i].style.backgroundColor = "white";
    } else {
      parrafos[i].style.backgroundColor = "grey";
    }
  }
}