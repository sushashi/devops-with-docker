const express = require('express')
const app = express()

app.get('/', (req, res) => {
  res.send('<h1>Hello Exercise 3.2 ! Another Test </h1>')
})

const PORT = 8080

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})