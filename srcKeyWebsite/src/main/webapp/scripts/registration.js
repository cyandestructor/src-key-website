/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Restricts input for the given textbox to the given inputFilter function.
function setInputFilter(textbox, inputFilter) {
    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
        textbox.addEventListener(event, function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            } else {
                this.value = "";
            }
        });
    });
}

function validateRegister(){
    let errorMessage = '';
    let result = true;
    
    let usernameInput = document.getElementById('userNameInput');
    let firstnameInput = document.getElementById('nameInput');
    let lastnameInput = document.getElementById('lastnameInput');
    let emailInput = document.getElementById('emailInput');
    let passwordInput = document.getElementById('passwordInput');
    
    if(!usernameInput.value || usernameInput.value.trim().length === 0 ){
        errorMessage += 'Username cannot be empty\n';
        result = false;
    }
    
    if(!firstnameInput.value || firstnameInput.value.trim().length === 0 ){
        errorMessage += 'First name cannot be empty\n';
        result = false;
    }
    
    if(!lastnameInput.value || firstnameInput.value.trim().length === 0 ){
        errorMessage += 'Last name cannot be empty\n';
        result = false;
    }
    
    if(!emailInput.value || emailInput.value.trim().length === 0 ){
        errorMessage += 'Email cannot be empty\n';
        result = false;
    }
    
    if(!passwordInput.value || passwordInput.value.length < 8){
        errorMessage += 'The password should be at least 8 characters long\n';
        result = false;
    }
    
    firstnameInput.value = firstnameInput.value.trim();
    lastnameInput.value = firstnameInput.value.trim();
    emailInput.value = firstnameInput.value.trim();
    
    if(!result)
        alert(errorMessage);
    
    return result;
}

setInputFilter(document.getElementById('userNameInput'), function (value) {
    return /^\w*$/g.test(value);
});

setInputFilter(document.getElementById('nameInput'), function (value) {
    return /^[a-z]*(?!.*\s{2})[\s\w]*$/i.test(value);
});

setInputFilter(document.getElementById('lastnameInput'), function (value) {
    return /^[a-z]*(?!.*\s{2})[\s\w]*$/i.test(value);
});