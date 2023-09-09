const express = require('express');
const app = express();

app.get('/', (req,res)=>{
     res.send("Hello World and Welcome to web-app!"); 
 });

app.listen(3007, function () {
    console.log("The web-app listening on port 3007 !");
});