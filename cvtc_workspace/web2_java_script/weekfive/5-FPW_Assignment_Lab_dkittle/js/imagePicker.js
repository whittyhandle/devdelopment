var ImagePicker = {

    init: function() {


        imagePic = document.getElementById("pic");
        // Notes: alert(imagePic.nodeName);

        var imageTabsDiv = document.getElementById('imageTabs');
        // Notes: alert(imageTabsDiv.nodeName);

        var imageTabsList = imageTabsDiv.getElementsByTagName('img');
        // Notes: alert(imageTabsList.length)

        for (i = 0 ; i < imageTabsList.length ; i++){
            // Notes: alert(imageTabsList[i])
            imageTabsList[i].onclick = ImagePicker.imageTabClick;
        };
        var randomIndex = Math.floor(Math.random() * imageTabsList.length);
        // Notes: alert(randomIndex);
        imagePic.src = imageTabsList[randomIndex].getAttribute("longdesc");


    },


    imageTabClick: function(e){

            var imagePath = this.getAttribute('longdesc');

            imagePic.setAttribute("src", imagePath);
            //this.src = imagePath;


        }




}

Core.start(ImagePicker);
