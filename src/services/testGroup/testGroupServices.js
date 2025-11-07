const { Group } = require("../../models"); // the model we just created

// Create a new Group
const createtestGroup = async (GroupData) => {
  try {
    const result = await Group.save(GroupData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all Groups
const getAlltestGroups = async () => {
  try {
    const Groups = await Group.findAll();
    return Groups;
  } catch (error) {
    console.log(error);

    throw new Error(error.message);
  }
};

// Get a Group by ID
const getTestGroupById = async (Group_id) => {
  try {
    const Groups = await Group.findById(Group_id);
    return Groups;
  } catch (error) {
    throw new Error(error);
  }
};

// Update a Group by ID
const updateTestGroup = async (Group_id, updateData) => {
  try {
    const result = await Group.update(Group_id, updateData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete a Group by ID
const deleteTestGroup = async (Group_id) => {
  try {
    const result = await Group.remove(Group_id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const findTestGroupsByStatus = async (Group_id) => {
  try {
    const Groups = await Group.findByStatus(Group_id);
    return Groups;
  } catch (error) {
    throw new Error(error);
  }
};

const findAllTestGroups = async () => {
  try {
    const groups = await Group.findAllGroupsWithTests(); // fetch all groups from DB
    return groups;
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  createtestGroup,
  getAlltestGroups,
  getTestGroupById,
  updateTestGroup,
  deleteTestGroup,
  findTestGroupsByStatus,
  findAllTestGroups,
};
