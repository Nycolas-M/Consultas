function login(event) {
  event.preventDefault();
  const email = document.getElementById("email").value;
  const senha = document.getElementById("senha").value;
  if (email === "admin@clinica.com" && senha === "12345") {
    localStorage.setItem("usuario", email);
    window.location.href = "consultas.html";
  } else {
    alert("Usuário ou senha incorretos!");
  }
}

function logout() {
  localStorage.removeItem("usuario");
  window.location.href = "index.html";
}

function navegar(pagina) {
  if (!localStorage.getItem("usuario")) {
    alert("Faça login primeiro!");
    window.location.href = "index.html";
    return;
  }
  window.location.href = pagina;
}
