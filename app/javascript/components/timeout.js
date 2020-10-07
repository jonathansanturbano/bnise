const timeOut = () => {
    console.log(window.location);
    window.setTimeout(`location="${document.referrer}";`,300000);
};

export { timeOut };
