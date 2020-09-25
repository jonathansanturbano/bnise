const initModalOnClick = () => {
  const modal = document.querySelector('.bmodal');
  const dropdown = document.getElementById('dropdown')
  const close = document.querySelector('.close')
  const links = document.querySelectorAll('.links > a');
  dropdown.addEventListener('click', (event) => {
    modal.style.display = 'flex'
  });
  close.addEventListener('click', (event) => {
    modal.style.display = 'none'
  });
  links.forEach((link) => {
    link.addEventListener('click', () => {
      modal.style.display = 'none';
    });
  });
}

export { initModalOnClick };
