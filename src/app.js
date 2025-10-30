const express = require('express');
const cookieParser = require("cookie-parser");
const app = express();
const helmet = require('helmet');
const cors = require('cors');
const {
    authRoutes,
} = require('./routes');
const logger = require('./config/winstonLoggerConfig');
const errorHandler = require('./utils/errorHandler');
const { NODE_ENV, REACT_APP_URL } = require('./config');
const swaggerUI = require('swagger-ui-express');
const swaggerJsDoc = require('swagger-jsdoc');
const swaggerOptions = require('./config/swaggerUi');
const swaggerDocs = swaggerJsDoc(swaggerOptions);

const corsOptions = {
    origin: REACT_APP_URL,
    credentials: true,
};

app.use('*', cors(corsOptions));
app.use(helmet());
app.use(cookieParser());
app.use(express.json());

require('./config/database'); //database configuration

//swaggerUI documentation route
NODE_ENV == 'development' && app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));

//routes here
app.use('/api/auth', authRoutes);


app.use(errorHandler);

app.use((req, res, next) => {
    logger.info(req.url);
    res.status(404).json({ "message": "Page not found !!!" });
});

module.exports = app;