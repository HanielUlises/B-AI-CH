

document.getElementById('confirm-delete').addEventListener('click', function () {
    if (confirm('Are you sure you want to delete your account?')) {
        alert('Good bye');
    }
});




var modalpass = document.getElementById("passModal");
var pass = document.getElementById("reset-password");
pass.onclick = function () {
    modalpass.style.display = "flex";
    setTimeout(function () {
        modalpass.classList.add("active");
        modalpass.querySelector('.pass-content').classList.add("active");
    }, 10);
}


var modaldelete = document.getElementById("deleteModal");
var dele = document.getElementById("delete-account");
dele.onclick = function () {
    modaldelete.style.display = "flex";
    setTimeout(function () {
        modaldelete.classList.add("active");
        modaldelete.querySelector('.delete-content').classList.add("active");
    }, 10);
}

var closeButtons = document.getElementsByClassName('close');
for (var i = 0; i < closeButtons.length; i++) {
    closeButtons[i].onclick = function () {
        var modalclose = this.closest('.modal');
        modalclose.style.display = 'none';
    }
}

window.onclick = function (event) {
    if (event.target == modal) {
        modal.classList.remove("active");
        modal.querySelector('.modal-content').classList.remove("active");
        setTimeout(function () {
            modal.style.display = "none";
        }, 300);
    }
}




