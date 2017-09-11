function personMoveto(){
    var person = document.getElementById('person');
    person.style.display='block';
}
function personMoveOff(){
    var person = document.getElementById('person');
    person.style.display='none';
}

function msgMoveto(){
    personMoveOff();
    var person = document.getElementById('msg');
    person.style.display='block';
}
function msgMoveOff() {
    var person = document.getElementById('msg');
    person.style.display='none';
}