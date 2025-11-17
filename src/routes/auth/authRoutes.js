const express = require("express");
const router = express.Router();
const { authControllers } = require("../../controllers");
const {
  loginValidation,
  refreshTokenValidation,
} = require("../../middlewares/auth/authValidation");
const auth = require("../../middlewares/auth/auth");

router.post("/login", loginValidation, authControllers.login);

router.post(
  "/getnewtoken",
  refreshTokenValidation,
  authControllers.getNewToken
);
router.get("/me", authControllers.getUserDetailsById);

router.post(
  "/logout",
  auth,
  // refreshTokenValidation,
  authControllers.logout
);

router.post(
  "/update",
  // auth,
  // refreshTokenValidation,
  authControllers.logout
);

router.route("/changepassword").post(auth, authControllers.changePassword);
module.exports = router;
