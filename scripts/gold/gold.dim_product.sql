CREATE VIEW gold.dim_product AS
SELECT
	ROW_NUMBER() OVER(ORDER BY pn.prd_key) AS product_number,
	pn.prd_id AS product_id,
	pn.prd_key AS product_key,
	pn.prd_nm AS product_name,
	pn.cat_id AS category_id,
	pc.cat AS category,
	pc.subcat AS subcategory,
	pc.maintenance,
	pn.prd_cost AS product_cost,
	pn.prd_line AS product_line,
	pn.prd_start_dt AS product_start_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_glv2 pc
ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL


SELECT * FROM gold.dim_product