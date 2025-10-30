const { CAPTCHA, JWT_EXPIRY, JWT_SECRET, REFRESH_EXPIRY, REFRESH_SECRET, CAPTCHA_SECRET_KEY, COOKIE_EXPIRY } = require('../../config')
const logger = require('../../config/winstonLoggerConfig')
const { LOGOUT } = require('../../helpers/response')
const { authServices, jwtServices } = require('../../services')
const CustomErrorHandler = require('../../utils/CustomErrorHandler')
const bcrypt = require('bcryptjs')
const axios=require('axios')

const login = async (req, res, next) => {
    try {
        let { username, password, captchaResponse } = req.body

        //verify captchaResponse
        if (CAPTCHA == "true") {
            const response = await axios.post(
                `https://www.google.com/recaptcha/api/siteverify?secret=${CAPTCHA_SECRET_KEY}&response=${captchaResponse}`
            );
            if (!response.data.success) {
                return next(CustomErrorHandler.inValidCaptchaResponse())
            }
        }

        //verify username and password credentials
        const user = await authServices.findUser(username)
        if (user.length == 0 || !(await bcrypt.compare(password, user[0].password))) {
            logger.warn(`Either username(${username}) does not exists or password is invalid`)
            return next(CustomErrorHandler.wrongCredentials())
        }

        const payload = {
            user_id: user[0].user_id,
            username: user[0].username,
            name: user[0].name,
            user_type: user[0].user_type
        }

        const access_token = jwtServices.sign(payload, JWT_SECRET, JWT_EXPIRY)
        const refresh_token = jwtServices.sign(payload, REFRESH_SECRET, REFRESH_EXPIRY)

        await authServices.saveRefreshToken(user[0].user_id, refresh_token)

        logger.info(`Username: ${username} logged in successfully`)

        res.cookie('refresh_token', refresh_token, {
            httpOnly: true,
            secure: false,
            maxAge: COOKIE_EXPIRY,
        })

        res.cookie('access_token', access_token, {
            httpOnly: false,
            secure: false,
            maxAge: COOKIE_EXPIRY,
        })

        res.status(200).json({
            username,
            status: true,
            message: 'Logged in successfully!!!'
        })

    } catch (error) {
        logger.error(`{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`)
        return next(error)
    }
}

const getNewToken = async (req, res, next) => {
    let refresh_token
    try {
        //find the refresh token in the database
        refresh_token = await authServices.findRefreshToken(req.body.refresh_token)
        if (refresh_token.length == 0) {
            return next(CustomErrorHandler.unAthorized())
        }

        //verify the refresh token and extract the userid and username
        const { user_id, username, name, user_type } = jwtServices.verify(req.body.refresh_token, REFRESH_SECRET)

        //check if the user with the extracted userid exists or not
        const user = await authServices.findUser(username)
        if (user.length == 0) {
            return next(CustomErrorHandler.unAthorized('No user found'))
        }

        //generate new tokens
        let new_access_token = jwtServices.sign({ user_id, username, name, user_type }, JWT_SECRET, JWT_EXPIRY)
        let new_refresh_token = jwtServices.sign({ user_id, username, name, user_type }, REFRESH_SECRET, REFRESH_EXPIRY)
        await authServices.updateRefreshToken(user_id, refresh_token[0].refresh_token, new_refresh_token)

        return res.status(200).json({
            access_token: new_access_token,
            refresh_token: new_refresh_token
        })
    } catch (error) {
        logger.error(`{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`)
        return next(error)
    }
}

const logout = async (req, res, next) => {

    const refreshToken = req.cookies.refresh_token

    try {
        let refresh_token = await authServices.findRefreshToken(refreshToken)
        if (refresh_token.length == 0) {
            //clear cookies from browser
            res.cookie('refresh_token', '', {
                httpOnly: true,
                secure: false,
                expires: new Date(0),
            });

            res.cookie('access_token', '', {
                httpOnly: false,
                secure: false,
                expires: new Date(0),
            });
            return next(CustomErrorHandler.unAthorized())
        }

        await authServices.logout(refresh_token[0].refresh_token)

        //clear cookies from browser
        res.cookie('refresh_token', '', {
            httpOnly: true,
            secure: false,
            expires: new Date(0),
        });

        res.cookie('access_token', '', {
            httpOnly: false,
            secure: false,
            expires: new Date(0),
        });

        logger.info(`Username: ${req.user.username} logged out successfully`)
        return res.status(200).json(LOGOUT())

    } catch (error) {
        logger.error(`{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`)
        return next(error)
    }
}

module.exports = {
    login,
    getNewToken,
    logout
}