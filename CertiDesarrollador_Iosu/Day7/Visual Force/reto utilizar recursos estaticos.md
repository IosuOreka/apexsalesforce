
Use a static resource to display an image on a Visualforce Page
Upload the specified zip file as a static resource and display an image from the file on a Visualforce page.

Challenge Requirements
Create a new Visualforce page:
Label: ShowImage
Name: ShowImage
Upload this file as a static resource with the name vfimagetest
The page must have a Visualforce apex:image tag that displays the kitten1.jpg image from the cats directory of the static resource
Lo que no pasó el test y se veía la imagen.

<apex:page >
    <apex:image id="theImage" value="{!$Resource.vfimagetest}" width="200" height="200"/>
</apex:page>


Lo que pasó el test. NO SE VE LA IMAGEN

<apex:page>
    <h1>Kitten Image</h1>
    <apex:image url="{!URLFOR($Resource.vfimagetest, 'cats/kitten1.jpg')}" />
</apex:page>
