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

setInputFilter(document.getElementById('firstnameInput'), function(value){
   return /^[a-z]*(?!.*\s{2})[\s\w]*$/i.test(value); 
});

setInputFilter(document.getElementById('lastnameInput'), function(value){
   return /^[a-z]*(?!.*\s{2})[\s\w]*$/i.test(value); 
});

function validateProfileEdition(){
    let errorMessage = '';
    let result = true;
    
    let imageFileInput = document.getElementById('imgFileControl');
    let firstnameInput = document.getElementById('firstnameInput');
    let lastnameInput = document.getElementById('lastnameInput');
    let descriptionInput = document.getElementById('descriptionInput');
    let emailInput = document.getElementById('emailInput');
    
    for(let i = 0; i < imageFileInput.files.length; i++){
        let file = imageFileInput.files[i];
        if(file.size > 1024 * 1024 * 5){
            errorMessage += `The file ${file.name} is too large. Max size is 5MB\n`;
            result = false;
        }
    }
    
    if(!firstnameInput.value || firstnameInput.value.trim().length === 0){
        errorMessage += 'The first name cannot be empty\n';
        result = false;
    }
    
    if(!lastnameInput.value || lastnameInput.value.trim().length === 0){
        errorMessage += 'The last name cannot be empty\n';
        result = false;
    }
    
    if(!emailInput.value || emailInput.value.trim().length === 0){
        errorMessage += 'The email cannot be empty\n';
        result = false;
    }
    
    firstnameInput.value = firstnameInput.value.trim();
    lastnameInput.value = lastnameInput.value.trim();
    descriptionInput.value = descriptionInput.value.trim();
    emailInput.value = emailInput.value.trim();
    
    if(!result){
        alert(errorMessage);
    }
    
    return result;
}

function validatePasswordChange(){
    let errorMessage = '';
    let result = true;
    
    let oldPasswordInput = document.getElementById("oldPasswordInput");
    let newPasswordInput = document.getElementById("newPasswordInput");
    
    if(oldPasswordInput.value.length < 8){
        errorMessage += 'The old password is not valid\n';
        result = false;
    }
    
    if(newPasswordInput.value.length < 8){
        errorMessage += 'The new password should be at least 8 characters long\n';
        result = false;
    }
    
    if(!result){
        alert(errorMessage);
    }
    
    return result;
}