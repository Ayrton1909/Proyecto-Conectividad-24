const body = document.querySelector('body'),
      sidebar = body.querySelector('nav'),
      toggle = body.querySelector('.toggle'),
      searchBtn = body.querySelector('.search-box'),
      modeSwitch = body.querySelector('.toggle-switch'),
      modeText = body.querySelector('.mode-text'),
      puntos = body.querySelector('.puntos'),
      derecha = body.querySelector('.der'),
      izquierda = body.querySelector('.izq'),
      img1 = body.querySelector('.img1'),
      img2 = body.querySelector('.img2'),
      img3 = body.querySelector('.img3');

let actual = 0;
let nroImg = 3;

toggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
})

searchBtn.addEventListener("click", () => {
    sidebar.classList.remove("close");
})

modeSwitch.addEventListener("click", () => {
    body.classList.toggle("dark");
    if(body.classList.contains("dark")){
        modeText.innerText = "Ligth mode"
    }else{
        modeText.innerText = "Dark mode"
    }
})

izquierda.addEventListener('click', function(){
    actual -=1

    if (actual == -1){
        actual = nroImg-1
    }
    cambiarimagen(actual)
    posicionCarrusel()
})  

derecha.addEventListener('click', function(){
    actual +=1

    if (actual == nroImg){
        actual = 0
    }
    cambiarimagen(actual)
    posicionCarrusel()
})  

function cambiarimagen(actual){
    switch(actual){
        case 0:
            img1.style.opacity = 1
            img2.style.opacity = 0
            img3.style.opacity = 0
            break
        case 1:
            img2.style.opacity = 1
            img1.style.opacity = 0
            img3.style.opacity = 0
            break;
        case 2:
            img3.style.opacity = 1
            img2.style.opacity = 0
            img1.style.opacity = 0
            break;
    }
}

function posicionCarrusel() {
    puntos.innerHTML = ""
    for (var i = 0; i <nroImg; i++){
        if(i == actual){
            puntos.innerHTML += "<i class='bx bx-radio-circle-marked' ></i>"
        }
        else{
            puntos.innerHTML += "<i class='bx bx-radio-circle'></i>"
        }
    } 
}