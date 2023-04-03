const form = document.getElementById("signin-form");
const error = document.getElementById("error-msg");

form.addEventListener("submit", (event) => {
	event.preventDefault();
	const username = form.username.value;
	const password = form.password.value;

	if (username === "" || password === "") {
		error.innerHTML = "Please enter both username and password.";
	} else if (username !== "admin" || password !== "admin") {
		error.innerHTML = "Invalid username or password.";
	} else {
		window.location.href = "stat.html";
	}
});

