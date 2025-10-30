const modules = {
    "functional_year": [
        "create_functional_year",
        "update_functional_year",
        "view_functional_year",
        "viewall_functional_year",
        "delete_functional_year",
        "allow_backdate_entry_functional_year"
    ],
    "branch": [
        "create_branch",
        "update_branch",
        "view_branch",
        "viewall_branch",
        "delete_branch",
        "allow_backdate_entry_branch"
    ],
    "department": [
        "create_department",
        "update_department",
        "view_department",
        "viewall_department",
        "delete_department",
        "allow_backdate_entry_department"
    ],
    "billing_title": [
        "create_billing_title",
        "update_billing_title",
        "view_billing_title",
        "viewall_billing_title",
        "delete_billing_title",
        "allow_backdate_entry_billing_title"
    ],
    "billing_title_mapping": [
        "create_billing_title_mapping",
        "update_billing_title_mapping",
        "view_billing_title_mapping",
        "viewall_billing_title_mapping",
        "delete_billing_title_mapping",
        "allow_backdate_entry_billing_title_mapping"
    ],
    "patient_registration": [
        "create_patient_registration",
        "update_patient_registration",
        "view_patient_registration",
        "viewall_patient_registration",
        "delete_patient_registration",
        "allow_backdate_entry_patient_registration"
    ],
    "opd_billing": [
        "create_opd_billing",
        "update_opd_billing",
        "view_opd_billing",
        "viewall_opd_billing",
        "delete_opd_billing",
        "allow_backdate_entry_opd_billing"
    ],
    "ipd_billing": [
        "create_ipd_billing",
        "update_ipd_billing",
        "view_ipd_billing",
        "viewall_ipd_billing",
        "delete_ipd_billing",
        "allow_backdate_entry_ipd_billing"
    ],
    "user": [
        "create_user",
        "update_user",
        "view_user",
        "viewall_user",
        "delete_user",
        "allow_backdate_entry_user"
    ],
    "user_permission": [
        "create_user_permission",
        "update_user_permission",
        "view_user_permission",
        "viewall_user_permission",
        "delete_user_permission",
        "allow_backdate_entry_user_permission"
    ],
    "doctor": [
        "create_doctor",
        "update_doctor",
        "view_doctor",
        "viewall_doctor",
        "delete_doctor",
        "allow_backdate_entry_doctor"
    ],
    "patient_admission": [
        "create_patient_admission",
        "update_patient_admission",
        "view_patient_admission",
        "viewall_patient_admission",
        "delete_patient_admission",
        "allow_backdate_entry_patient_admission"
    ],
    "patient_discharge": [
        "create_patient_discharge",
        "update_patient_discharge",
        "view_patient_discharge",
        "viewall_patient_discharge",
        "delete_patient_discharge",
        "allow_backdate_entry_patient_discharge"
    ],
    "unit_master": [
        "create_unit_master",
        "update_unit_master",
        "view_unit_master",
        "viewall_unit_master",
        "delete_unit_master",
        "allow_backdate_entry_unit_master"
    ],
    "catagory_master": [
        "create_catagory_master",
        "update_catagory_master",
        "view_catagory_master",
        "viewall_catagory_master",
        "delete_catagory_master",
        "allow_backdate_entry_catagory_master"
    ],
    "brand_master": [
        "create_brand_master",
        "update_brand_master",
        "view_brand_master",
        "viewall_brand_master",
        "delete_brand_master",
        "allow_backdate_entry_brand_master"
    ],
    "product_generic_master": [
        "create_product_generic_master",
        "update_product_generic_master",
        "view_product_generic_master",
        "viewall_product_generic_master",
        "delete_product_generic_master",
        "allow_backdate_entry_product_generic_master"
    ],
    "product_master": [
        "create_product_master",
        "update_product_master",
        "view_product_master",
        "viewall_product_master",
        "delete_product_master",
        "allow_backdate_entry_product_master"
    ],
    "ledger": [
        "create_ledger",
        "update_ledger",
        "view_ledger",
        "viewall_ledger",
        "delete_ledger",
        "allow_backdate_entry_ledger"
    ],
    "ledger_mapping": [
        "create_ledger_mapping",
        "update_ledger_mapping",
        "view_ledger_mapping",
        "viewall_ledger_mapping",
        "delete_ledger_mapping",
        "allow_backdate_entry_ledger_mapping"
    ],
    "party": [
        "create_party",
        "update_party",
        "view_party",
        "viewall_party",
        "delete_party",
        "allow_backdate_entry_party"
    ],
    "opening_stock": [
        "create_opening_stock",
        "update_opening_stock",
        "view_opening_stock",
        "viewall_opening_stock",
        "delete_opening_stock",
        "allow_backdate_entry_opening_stock"
    ],   
    "purchase_entry": [
        "create_purchase_entry",
        "update_purchase_entry",
        "view_purchase_entry",
        "viewall_purchase_entry",
        "delete_purchase_entry",
        "allow_backdate_entry_purchase_entry"
    ],
    "purchase_return": [
        "create_purchase_return",
        "update_purchase_return",
        "view_purchase_return",
        "viewall_purchase_return",
        "delete_purchase_return",
        "allow_backdate_entry_purchase_return"
    ],
    "sales_entry": [
        "create_sales_entry",
        "update_sales_entry",
        "view_sales_entry",
        "viewall_sales_entry",
        "delete_sales_entry",
        "allow_backdate_entry_sales_entry"
    ],
    "sales_return": [
        "create_sales_return",
        "update_sales_return",
        "view_sales_return",
        "viewall_sales_return",
        "delete_sales_return",
        "allow_backdate_entry_sales_return"
    ],
    "reports": [
        "summary_report",
        "transaction_report",
        "service_summary_report",
        "dashboard_report",
        "opd_billing_report",
        "patient_registration_report",
        "age_wise_report",        
        "lab_test_report",
        "individual_ledger_report",
        "medicine_expiry_report",
        "product_wise_sales_report",
        "product_wise_purchase_report",
        "stock_overview_report",
        "expiry_alert_report",
        "user_basis_daily_report",
        "pharmacy_daily_transaction_report",
        "stainpayee_report",
        "patientwise_sales_report",
    ],
    "lab_test_group": [
        "create_lab_test_group",
        "update_lab_test_group",
        "view_lab_test_group",
        "viewall_lab_test_group",
        "delete_lab_test_group",
        "allow_backdate_entry_lab_test_group"
    ],
    "lab_test_mapping": [
        "create_lab_test_mapping",
        "update_lab_test_mapping",
        "view_lab_test_mapping",
        "viewall_lab_test_mapping",
        "delete_lab_test_mapping",
        "allow_backdate_entry_lab_test_mapping"
    ],
    "disease_group_entry": [
        "create_disease_group_entry",
        "update_disease_group_entry",
        "view_disease_group_entry",
        "viewall_disease_group_entry",
        "delete_disease_group_entry",
        "allow_backdate_disease_group_entry"
    ],
    "disease_entry": [
        "create_disease_entry",
        "update_disease_entry",
        "view_disease_entry",
        "viewall_disease_entry",
        "delete_disease_entry",
        "allow_backdate_disease_entry"
    ],
    "purchase_payment": [
        "create_purchase_payment_entry",
        "update_purchase_payment_entry",
        "view_purchase_payment_entry",
        "viewall_purchase_payment_entry",
        "delete_purchase_payment_entry",
        "allow_backdate_purchase_payment_entry"
    ],
    "sales_receipt": [
        "create_sales_receipt_entry",
        "update_sales_receipt_entry",
        "view_sales_receipt_entry",
        "viewall_sales_receipt_entry",
        "delete_sales_receipt_entry",
        "allow_backdate_sales_receipt_entry"
    ],
    "pdc_cheque_bounce": [
        "create_pdc_cheque_bounce_entry",
        "update_pdc_cheque_bounce_entry",
        "view_pdc_cheque_bounce_entry",
        "viewall_pdc_cheque_bounce_entry",
        "delete_pdc_cheque_bounce_entry",
        "allow_backdate_pdc_cheque_bounce_entry"
    ],
    "pdc_cheque_deposit": [
        "create_pdc_cheque_deposit_entry",
        "update_pdc_cheque_deposit_entry",
        "view_pdc_cheque_deposit_entry",
        "viewall_pdc_cheque_deposit_entry",
        "delete_pdc_cheque_deposit_entry",
        "allow_backdate_pdc_cheque_deposit_entry"
    ],
    "pdc_cheque_detail": [
        "create_pdc_cheque_detail_entry",
        "update_pdc_cheque_detail_entry",
        "view_pdc_cheque_detail_entry",
        // "delete_pdc_cheque_post_details",
        "viewall_pdc_cheque_detail_entry",
        "delete_pdc_cheque_detail_entry",
        "allow_backdate_pdc_cheque_detail_entry"
    ],
    "free_lab_test_": [
        "create_free_lab_test_entry",
        "update_free_lab_test_entry",
        "view_free_lab_test_entry",
        "viewall_free_lab_test_entry",
        "delete_free_lab_test_entry",
        "allow_backdate_free_lab_test_entry"
    ],
    "free_medicine_entry": [
    "create_free_medicine_entry",
    "update_free_medicine_entry",
    "view_free_medicine_entry",
    "viewall_free_medicine_entry",
    "delete_free_medicine_entry",
    "allow_backdate_free_medicine_entry"
],
"physiotherapy_group_entry": [
    "create_physiotherapy_group_entry",
    "update_physiotherapy_group_entry",
    "view_physiotherapy_group_entry",
    "viewall_physiotherapy_group_entry",
    "delete_physiotherapy_group_entry",
    "allow_backdate_physiotherapy_group_entry"
],
"physiotherapy_mapping_entry": [
    "create_physiotherapy_mapping_entry",
    "update_physiotherapy_mapping_entry",
    "view_physiotherapy_mapping_entry",
    "viewall_physiotherapy_mapping_entry",
    "delete_physiotherapy_mappping_entry",
    "allow_backdate_physiotherapy_mapping_entry"
]

}

module.exports = {
    modules
}