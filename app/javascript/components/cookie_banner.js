const cookieInfo = () => {
  const cookieContainer = document.querySelector(".cookie-container");
  const cookieButton = document.querySelector(".cookie-btn");

  cookieButton.addEventListener("click", () => {
    cookieContainer.classList.remove("active");
    var now = new Date();
    now.setMonth(now.getMonth() + 1);
    console.log(now);
    document.cookie = `cookieBannerDisplayed=okay; expires="${now.toUTCString()}"`;
  });

  setTimeout(() => {
    if (!document.cookie.split(';').some((item) => item.trim().startsWith('cookieBannerDisplayed'))) {
      cookieContainer.classList.add("active");
    };
  }, 2000);
}

export { cookieInfo };
