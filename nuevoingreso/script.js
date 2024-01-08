const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');
const change1=document.getElementById('changeup');
const change2=document.getElementById('changein');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

change1.addEventListener('click', () => {
    container.classList.add("active");
});

change2.addEventListener('click', () => {
    container.classList.remove("active");
});
