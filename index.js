// load libraries

const express = require('express')
const handlebars = require('express-handlebars')

const fortunecookies = require('./fortune-cookie')

// Create an instance of express
const app = express()

const PORT = 3000

// configure the application
app.get('/',
    (req, resp) => {
        resp.status(200)
        resp.format(
            {
                'text/html': () => {
                    resp.send(`<h3>${fortunecookies()}</h3>`)
                },
                'text/plain': () => {
                    resp.send(fortunecookies())
                },
                'application/json' : () => {
                    const text = fortunecookies()
                    resp.json(
                        {
                            cookieText: text,
                            generatedOn: (new Date()).toDateString()
                        }
                    )
                },

                // req.get("Accept") references from the HTTP request header to get the requested content type
                'default' : () => {
                    resp.status(406)
                    resp.type('text/plain')
                    resp.send(`Not Accept: ${req.get("Accept")}`)
                }
            }
        )
    }
)

// Start server
app.listen(PORT, () => {
    console.info(`Application is listening PORT ${PORT} at ${new Date()}.`)
})

