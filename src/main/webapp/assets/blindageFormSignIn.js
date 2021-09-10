var modal2 = document.getElementById("modal2");
let users = [];
const addUser = () => {
  //ev.preventDefault();
  let user = {
    firstname: document.getElementById("firstname").value,
    lastname: document.getElementById("lastname").value,
    email: document.getElementById("email").value,
    mobile: document.getElementById("date").value,
    password: document.getElementById("password").value,
    verifpassword: document.getElementById("confirmPass").value,
  };
  users.push(user);
  document.forms[0].reset(); // to clear the form for the next entries

  //for display purposes only
  console.warn("added", { users });

  //saving to localStorage
  localStorage.setItem("MyUserList", JSON.stringify(users));
};
//document.addEventListener("DOMContentLoaded", () => {
  //document.getElementById("btn").addEventListener("click", addUser);
//});

function showProfiles() {
  var table =
    "<tr><th>firstname</th><th>lastname</th><th>email</th><th>bdate</th><th>password</th><th>verifpassword</th></tr>";
  for (let i = 0; i < users.length; i++) {
    table +=
      "<tr><td>" +
      users[i].firstname +
      "</td><td>" +
      users[i].lastname +
      "</td><td>" +
      users[i].email +
      "</td><td>" +
      users[i].mobile +
      "</td><td>" +
      users[i].password +
      "</td><td>" +
      users[i].verifpassword +
      "</td></tr>";
  }
  document.getElementById("datas").innerHTML = table;
  modal2.style.display = "block";
}
