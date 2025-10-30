const Joi = require('joi')
const { CAPTCHA } = require('../../config')

const loginValidationSchema = Joi.object({
    username: Joi.string().required(),
    password: Joi.string()
        .min(8)
        .regex(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/)
        .required()
        .messages({
            "string.pattern.base": "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character",
            "string.min": "Password must be at least 8 characters long",
            "any.required": "Password is required"
        }),
    ...(CAPTCHA == "true" && { captchaResponse: Joi.string().required() })

})

const refreshTokenValidationSchema = Joi.object({
    refresh_token: Joi.string().required()
})

const refreshTokenValidation = (req, res, next) => {
    const { error } = refreshTokenValidationSchema.validate(req.body)
    if (error) {
        return next(error)
    }
    next()
}

const loginValidation = (req, res, next) => {
    const { error } = loginValidationSchema.validate(req.body)
    if (error) {
        return next(error)
    }
    next()
}

module.exports = {
    loginValidation,
    refreshTokenValidation
}