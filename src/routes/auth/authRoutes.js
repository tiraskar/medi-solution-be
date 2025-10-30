const express = require('express');
const router = express.Router();
const { authControllers } = require('../../controllers');
const { loginValidation, refreshTokenValidation } = require('../../middlewares/auth/authValidation');
const auth = require('../../middlewares/auth/auth');

router.post('/login', loginValidation, authControllers.login);

router.post('/getnewtoken', refreshTokenValidation, authControllers.getNewToken);

router.post('/logout', auth,
  // refreshTokenValidation,
  authControllers.logout);

module.exports = router;