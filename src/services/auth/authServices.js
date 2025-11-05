const { User, RefreshToken } = require("../../models");

const findUser = async (username) => {
  try {
    let user = await User.findByUsername(username);
    return user;
  } catch (error) {
    throw new Error(error);
  }
};

const saveRefreshToken = async (userid, token) => {
  try {
    let result = await RefreshToken.save(userid, token);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const findRefreshToken = async (refresh_token) => {
  try {
    let result = await RefreshToken.find(refresh_token);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const updateRefreshToken = async (userid, oldRefreshToken, newRefreshToken) => {
  try {
    let result = await RefreshToken.updateRefreshToken(
      userid,
      oldRefreshToken,
      newRefreshToken
    );
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const logout = async (refresh_token) => {
  try {
    let result = await RefreshToken.revokeRefreshToken(refresh_token);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const getUserDetailsById = async (id) => {
  try {
    let user = await User.findByUserId(id);
    return user;
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  findUser,
  saveRefreshToken,
  findRefreshToken,
  updateRefreshToken,
  logout,
  getUserDetailsById,
};
