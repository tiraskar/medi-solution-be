const Joi = require("joi");

const doctorValidationSchema = Joi.object({
  name: Joi.string().min(3).max(50).required().messages({
    "string.empty": "Doctor name is required",
    "string.min": "Doctor name must be at least 3 characters long",
    "string.max": "Doctor name must be less than 50 characters",
  }),

  gender: Joi.string().valid("Male", "Female", "Other").required().messages({
    "any.only": "Gender must be one of: Male, Female, or Other",
    "string.empty": "Gender is required",
  }),
}).unknown(true);

const doctorValidation = (req, res, next) => {
  const { error } = doctorValidationSchema.validate(req.body);
  if (error) {
    return next(error);
  }
  return next();
};

module.exports = { doctorValidation };
