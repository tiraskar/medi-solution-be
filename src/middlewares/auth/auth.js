const CustomErrorHandler = require('../../utils/CustomErrorHandler')
const { jwtServices } = require('../../services')
const { JWT_SECRET, REFRESH_SECRET, JWT_EXPIRY, REFRESH_EXPIRY, COOKIE_EXPIRY } = require('../../config')

const { authServices } = require('../../services')

const auth = async (req, res, next) => {

    const accessToken = req.cookies.access_token
    const refreshToken = req.cookies.refresh_token

    //check access token exists or not
    if (!accessToken) {

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

    try {

        const { user_id, username, name, user_type } = jwtServices.verify(accessToken, JWT_SECRET)
        req.user = { user_id, username, name, user_type }
        next()

    } catch (error) {
        try {

            const { user_id, username, name, user_type } = jwtServices.verify(refreshToken, REFRESH_SECRET)

            //generate new access token and refresh token and update old refresh token with new one 
            if (user_id) {

                const payload = {
                    user_id,
                    username,
                    name,
                    user_type
                }

                //generate new tokens
                let new_access_token = jwtServices.sign(payload, JWT_SECRET, JWT_EXPIRY)
                let new_refresh_token = jwtServices.sign(payload, REFRESH_SECRET, REFRESH_EXPIRY)

                await authServices.updateRefreshToken(user_id, refreshToken, new_refresh_token)

                res.cookie('refresh_token', new_refresh_token, {
                    httpOnly: true,
                    secure: false,
                    maxAge: COOKIE_EXPIRY,
                })

                res.cookie('access_token', new_access_token, {
                    httpOnly: false,
                    secure: false,
                    maxAge: COOKIE_EXPIRY,
                })

                req.user = { user_id, username, name, user_type }
                next()
            }

        } catch (error) {

            return next(CustomErrorHandler.unAthorized())
        }

    }
}

module.exports = auth