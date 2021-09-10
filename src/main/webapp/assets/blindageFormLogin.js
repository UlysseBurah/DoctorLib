var modal = document.getElementById("myModal");
var modal2 = document.getElementById("modal2");
var btn = document.getElementById("sub");
var span = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("close")[1];
var signup = document.querySelector("#signup");
var logo = document.querySelector("#logo");

const tl = new TimelineMax();

tl.fromTo(
    signup,
    1,
    { opacity: "0", x: "100" },
    { opacity: "1", x: "0" },
    "-=1.2"
  ).fromTo(
    logo,
    1,
    { opacity: "0", x: "-100" },
    { opacity: "1", x: "0" },
    "-=1.2"
  );

function insert() {
  let canCreate = false;
  if (document.getElementById("firstname").value.length == 0) {
    canCreate = false;
    document.getElementById("warning").innerText =
      "Please register your firstname.";
    modal.style.display = "block";
  } else if (document.getElementById("lastname").value.length == 0) {
    canCreate = false;
    document.getElementById("warning").innerText =
      "Please register your lastname.";
    modal.style.display = "block";
  } else if (document.getElementById("email").value.length == 0) {
    canCreate = false;
    document.getElementById("warning").innerText =
      "Please register your email.";
    modal.style.display = "block";
  } else if (document.getElementById("password").value.length == 0) {
    canCreate = false;
    document.getElementById("warning").innerText =
      "Please register your password.";
    modal.style.display = "block";
  } else if (document.getElementById("confirmPass").value.length == 0) {
    canCreate = false;
    document.getElementById("warning").innerText =
      "Please confirm your password.";
    modal.style.display = "block";
  } else if (
    document.getElementById("password").value !=
    document.getElementById("confirmPass").value
  ) {
    canCreate = false;
    document.getElementById("warning").innerText =
    "Your passwords do not match.";
    modal.style.display = "block";
  } else {
    canCreate = "true";
   
  }
  if (canCreate) {
    addUser();
  }
}
// btn.onclick = function () {
// //   modal.style.display = "block";
// };
span.onclick = function () {
  modal.style.display = "none";
};
span2.onclick = function () {
  modal2.style.display = "none";
};
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
    modal2.style.display = "none";
  }
};








