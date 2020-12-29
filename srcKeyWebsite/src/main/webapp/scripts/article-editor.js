/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateArticleSubmit() {
    let errorMessage = '';
    let result = true;

    let imageInput = document.getElementById('imgFileControl');
    let titleInput = document.getElementById('articleTitle');
    let descriptionInput = document.getElementById('articleDescription');
    let bodyInput = document.getElementById('articleBodyText');
    let videoInput = document.getElementById('videoFileControl');
    let categoriesInput = document.getElementById('articleCategories');

    if (imageInput.files.length < 3) {
        errorMessage += 'Upload at least 3 images\n';
        result = false;
    } else {
        for (let i = 0; i < imageInput.files.length; i++) {
            if (imageInput.files[i].size > 1024 * 1024 * 5) {
                errorMessage += `The file ${imageInput.files[i].name} is too large. Max size is 5MB\n`;
                result = false;
            }
        }
    }

    if (!titleInput.value || titleInput.value.trim().length === 0) {
        errorMessage += 'Title cannot be empty\n';
        result = false;
    }

    if (!descriptionInput.value || descriptionInput.value.trim().length === 0) {
        errorMessage += 'Description cannot be empty\n';
        result = false;
    }

    if (!bodyInput.value || bodyInput.value.trim().length === 0) {
        errorMessage += 'Article body cannot be empty\n';
        result = false;
    }

    if (!categoriesInput.value || categoriesInput.value.trim().length === 0) {
        errorMessage += 'Use at least one category\n';
        result = false;
    }

    titleInput.value = titleInput.value.trim();
    descriptionInput.value = descriptionInput.value.trim();
    bodyInput.value = bodyInput.value.trim();
    categoriesInput.value = categoriesInput.value.trim();

    for (let i = 0; i < videoInput.files.length; i++) {
        if (videoInput.files[i].size > 1024 * 1024 * 10) {
            errorMessage += `The file ${videoInput.files[i].name} is too large. Max size is 10MB\n`;
            result = false;
        }
    }
    
    if(!result){
        alert(errorMessage);
    }

    return result;
}
