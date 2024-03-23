window.addEventListener('scroll', function(){
  const header = document.querySelector('header');
  header.classList.toggle("sticky", window.scrollY > 0);
});

function toggleMenu(){
  const menuToggle = document.querySelector('.menuToggle')
  const navigation = document.querySelector('.navigation')
  menuToggle.classList.toggle('active');
  navigation.classList.toggle('active');
};

// todos os elementos com a clas 'carousel'
const carousels = document.querySelectorAll('.carousel');

// elemento de carrossel
carousels.forEach(carousel => {
  const imgBox = carousel.querySelector('.imgBx');
  const images = imgBox.querySelectorAll('img');

  let counter = 0;

  // proxima imagem
  const nextImage = () => {
    counter++;
    imgBox.style.transform = `translateX(${-counter * 100}%)`;
    
    // renicia contador
    if (counter >= images.length - 1) {
      counter = -1;
    }
  };

  
  setInterval(nextImage, 3000); //altera para 3segundos
});
const handlePhone = (event) => {
let input = event.target
input.value = phoneMask(input.value)
}

const phoneMask = (value) => {
    if (!value) return ""
    value = value.replace(/\D/g,'')
    value = value.replace(/(\d{2})(\d)/,"($1) $2")
    value = value.replace(/(\d)(\d{4})$/,"$1-$2")
    return value
}



/*document.querySelector('.contact').addEventListener('submit', function(event) {
  var alertToast = document.getElementById('alert-toast');
  alertToast.innerText = 'Orcamento salvo e enviado com sucesso';
  alertToast.classList.add('show');
  event.target.reset();
  setTimeout(function() {
    alertToast.classList.remove('show');
  }, 3000);
});*/

