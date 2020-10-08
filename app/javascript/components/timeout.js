const timeOut = () => {
  window.setTimeout(`location="${document.referrer}";`,300000);
};

export { timeOut };
