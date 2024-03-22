const imageUpload = document.getElementById('image-upload');
const imagePreview = document.getElementById('image-preview');

document.addEventListener('DOMContentLoaded', () => {
  imageUpload.addEventListener('change', (event) => { // Added missing event listener
    const file = event.target.files[0];

    if (file) {
      const reader = new FileReader();

      reader.onload = (event) => {
        imagePreview.src = event.target.result;
      };

      reader.readAsDataURL(file);
    }
  });
});