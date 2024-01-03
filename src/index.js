const express = require('express')
const path = require('path')
const app = express()
const port = 8090

app.get('/', (req, res) => res.sendFile(path.normalize(__dirname+'/../index.html')))
app.listen(port, () => console.log(`Example app listening on port ${port}!`))
