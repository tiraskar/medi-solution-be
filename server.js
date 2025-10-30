const app = require('./src/app')
const { PORT } = require('./src/config')
const logger=require('./src/config/winstonLoggerConfig')

app.listen(PORT, () => {
    logger.info(`Server is listening at ${PORT}`);
})