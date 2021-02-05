/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateArticleEdition() {
    let errorMessage = '';
    let result = true;

    let imageInput = document.getElementById('imgFileControl');
    let titleInput = document.getElementById('articleTitle');
    let descriptionInput = document.getElementById('articleDescription');
    let bodyInput = document.getElementById('articleBodyText');

    let originalMultimedia = document.getElementsByClassName('article-multimedia').length;
    let deletedMultimedia = document.getElementById('multimediaToDelete').value.split(',').filter(function (el) {
        return el.length !== 0;
    }).length;
    let totalOriginalMultimedia = originalMultimedia - deletedMultimedia;
    let totalMultimedia = totalOriginalMultimedia + Array.from(imageInput.files).filter(function (file) {
        let dotIndex = file.name.lastIndexOf('.') + 1;
        let fileExt = file.name.substring(dotIndex);
        return fileExt !== 'mp4';
    }).length;

    if (totalMultimedia < 3) {
        errorMessage += 'Article should have at least 3 images total\n';
        result = false;
    } else {
        for (let i = 0; i < imageInput.files.length; i++) {
            let file = imageInput.files[i];
            let dotIndex = file.name.lastIndexOf('.') + 1;
            let fileExt = file.name.substring(dotIndex);

            if (fileExt === 'mp4') {
                if (file.size > 1024 * 1024 * 10) {
                    errorMessage += `The file ${file.name} is too large. Max size is 5MB\n`;
                    result = false;
                }
            } else {
                if (file.size > 1024 * 1024 * 5) {
                    errorMessage += `The file ${file.name} is too large. Max size is 5MB\n`;
                    result = false;
                }
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
    
    titleInput.value = titleInput.value.trim();
    descriptionInput.value = descriptionInput.value.trim();
    bodyInput.value = bodyInput.value.trim();

    if (!result) {
        alert(errorMessage);
    }

    return result;
}
