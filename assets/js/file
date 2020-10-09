var fileContents = document.getElementById('file-contents');
var fileInput = document.getElementById('file-input');
var reader = new FileReader();

reader.addEventListener('load', (ev)=>{
  fileContents.value = ev.target.result;
});

fileInput.addEventListener('change', (ev)=>{
  reader.readAsText(ev.target.files[0])
});
