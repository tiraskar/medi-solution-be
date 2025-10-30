const { PORT } = require('./index')

const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Streamline Medi ERP',
            version: '1.0.0',
            description: 'API documentation for Streamline Medi ERP',
            contact: {
                name: 'InfoxIT Pvt. Ltd.',
                email: 'contact.infoxit@gmail.com',
            },
        },
        servers: [
            {
                url: `http://localhost:${PORT}`,
                description: 'Local development server',
            },
            {
                url: `https://dev.api.butwallotus.com.np`,
                description: 'production development server',
            }
        ]
    },
    tags: [
        {
            name: 'Authentication'
        },
    ],
    docExpansion: 'none',
    apis: ['./docs/*.yaml',]
}

module.exports = swaggerOptions