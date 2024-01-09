// Puse esto para ver si servie en el back
document.getElementById('min').addEventListener('change', validateTime);
document.getElementById('seconds').addEventListener('change', validateTime);

function validateTime(e) {
    if (e.target.value < 0) e.target.value = 0;
    if (e.target.id === 'duration-seconds' && e.target.value > 59) e.target.value = 59;
    if (e.target.id === 'duration-minutes' && e.target.value > 59) e.target.value = 59;
    
    let minutes = document.getElementById('duration-minutes').value || 0;
    let seconds = document.getElementById('duration-seconds').value || 0;
    console.log(`Duration: ${minutes} minutes and ${seconds} seconds.`);
}


