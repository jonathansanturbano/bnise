const initCheckout = () => {
  const input = document.querySelector('#address-input');
  const checkoutButton = document.querySelector(".mybutton");

  input.addEventListener('beforeinput', () => {
    checkoutButton.disabled = false;
  });
}

export { initCheckout };
