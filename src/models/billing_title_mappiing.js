const con = require("../config/database"); // your MySQL connection

// 1️⃣ Create Billing Mapping
const createBillingMapping = async (data) => {
  const sql = `
    INSERT INTO billing_title_mapping_info 
      (branch_id, billing_title_id, label_id, status, created_at, updated_at)
    VALUES (?, ?, ?, 1, NOW(), NOW())
  `;
  const [result] = await con.execute(sql, [
    data.branch_id,
    data.billing_title_id,
    data.label_id,
  ]);
  return result.insertId;
};

// 2️⃣ Find All Billing Mappings (with optional filters)
const findAllBillingMapping = async ({
  branch_id,
  status,
  limit = 10,
  offset = 0,
} = {}) => {
  const sql = `
      SELECT 
        btm.id,
        btm.branch_id,
        btm.billing_title_id,
        btm.label_id,
        btm.status,
        btm.created_at,
        btm.updated_at,
        bt.billing_title,
        l.label_name,
        br.name AS branch_name
      FROM billing_title_mapping_info btm
      LEFT JOIN billing_title_info bt ON btm.billing_title_id = bt.billing_title_id
      LEFT JOIN label_info l ON btm.label_id = l.id
      LEFT JOIN branch_info br ON btm.branch_id = br.branch_id
      WHERE (? IS NULL OR btm.branch_id = ?)
        AND (? IS NULL OR btm.status = ?)
      ORDER BY btm.id ASC
      LIMIT ? OFFSET ?
    `;
  const [rows] = await con.execute(sql, [
    branch_id,
    branch_id,
    status,
    status,
    limit,
    offset,
  ]);

  const countSql = `
      SELECT COUNT(*) AS total
      FROM billing_title_mapping_info btm
      WHERE (? IS NULL OR btm.branch_id = ?)
        AND (? IS NULL OR btm.status = ?)
    `;
  const [countResult] = await con.execute(countSql, [
    branch_id,
    branch_id,
    status,
    status,
  ]);

  return { rows, count: countResult[0].total };
};

// 3️⃣ Find One Billing Mapping
const findOneBillingMapping = async (id) => {
  const sql = `
    SELECT 
      btm.*,
      bt.billing_title,
      l.label_name,
      br.name AS branch_name
    FROM billing_title_mapping_info btm
    LEFT JOIN billing_title_info bt ON btm.billing_title_id = bt.billing_title_id
    LEFT JOIN label_info l ON btm.label_id = l.id
    LEFT JOIN branch_info br ON btm.branch_id = br.branch_id
    WHERE btm.id = ? AND btm.status = 1
  `;
  const [rows] = await con.execute(sql, [id]);
  return rows[0] || null;
};

// 4️⃣ Update Billing Mapping
const updateBillingMapping = async (id, data) => {
  const sql = `
    UPDATE billing_title_mapping_info 
    SET branch_id = ?, billing_title_id = ?, label_id = ?, updated_at = NOW()
    WHERE id = ? AND status = 1
  `;
  const [result] = await con.execute(sql, [
    data.branch_id,
    data.billing_title_id,
    data.label_id,
    id,
  ]);
  return result.affectedRows > 0;
};

// 5️⃣ Delete Billing Mapping (soft delete)
const deleteBillingMapping = async (id) => {
  const sql = `
    UPDATE billing_title_mapping_info 
    SET status = 0, updated_at = NOW()
    WHERE id = ?
  `;
  const [result] = await con.execute(sql, [id]);
  return result.affectedRows > 0;
};

// 6️⃣ Get Billing Mapping by Billing Title
const getBillingMappedByBillingTitle = async (billing_title_id) => {
  const sql = `
    SELECT btm.id, l.label_name
    FROM billing_title_mapping_info btm
    LEFT JOIN label_info l ON btm.label_id = l.id
    WHERE btm.billing_title_id = ? AND btm.status = 1
  `;
  const [rows] = await con.execute(sql, [billing_title_id]);
  return rows[0] || null;
};

module.exports = {
  createBillingMapping,
  findAllBillingMapping,
  findOneBillingMapping,
  updateBillingMapping,
  deleteBillingMapping,
  getBillingMappedByBillingTitle,
};
