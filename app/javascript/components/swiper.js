// import Swiper JS
import Swiper from 'swiper';
// import Swiper styles
import 'swiper/swiper-bundle.css';


const initSwiper = () => {

  var mySwiper = new Swiper ('.swiper-container', {
    speed: 500,
    loop: true,
    roundLengths: true,
  });

  const intervalID = window.setInterval(nextSlide, 3000);

  function nextSlide() {
    mySwiper.slideNext(3000);
  };
}

export { initSwiper };
