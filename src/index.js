const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello from Dockerized App v2! Test - Added New Stuff version 35. ");
});

const port = process.env.PORT || 3000;7
app.listen(port, () => {
  console.log(`App running on port ${port}`);
});

