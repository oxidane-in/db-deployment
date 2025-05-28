
--changeset IntkhabShaikh:0008-mdm-seed-material-manufacturer
INSERT INTO mdm_schema.material_manufacturer 
(material_manufacturer_name, material_manufacturer_contact_person, material_manufacturer_contact_number, material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc, material_manufacturer_handle, created_by, updated_by)
VALUES
('BASF', 'Rajiv Mehra', '9876543210', 'rajiv.mehra@basf.com', '27AABCB1234C1Z5', 'Global leader in chemical construction products', 'basf', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Sika', 'Meenakshi Rao', '9823123456', 'meenakshi.rao@sika.in', '29AACCS2345D1Z3', 'Experts in sealing, bonding, and waterproofing', 'sika', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Fosroc', 'Anil Kumar', '9765432108', 'anil.kumar@fosroc.com', '19AABCF5432E1Z2', 'Manufacturer of construction chemical products', 'fosroc', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Pidilite', 'Sneha Shah', '9988776655', 'sneha.shah@pidilite.in', '27AABCP8765L1Z6', 'Innovators in adhesives, sealants, and construction', 'pidilite', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Ardex Endura', 'Harish Patel', '9012345678', 'harish.patel@ardexendura.com', '33AADCA7654F1Z1', 'Tile fixing and flooring systems specialist', 'ardex_endura', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('MYK Arment', 'Jaqen H''ghar', '9012345672', 'jaqen@mykarment.com', '33AADCA7654F1Z2', 'Fastest growing Construction Chemical Manufacturer', 'myk_arment', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001');


--changeset IntkhabShaikh:0008-mdm-seed-material-vendor
INSERT INTO mdm_schema.material_vendor 
(material_vendor_name, material_vendor_contact_person, material_vendor_contact_number, material_vendor_email, material_vendor_gst, material_vendor_desc, material_vendor_handle, created_by, updated_by)
VALUES
('Saifi Solutions', 'Ayaz Khan', '9812345670', 'ayaz.khan@saifisolutions.in', '27AABCS1234K1Z2', 'Leading supplier of waterproofing materials and tools', 'saifi_solutions', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Netra Traders', 'Pooja Deshmukh', '9822113344', 'pooja.deshmukh@netratraders.com', '27AACCN4567M1Z4', 'Distributors of construction chemicals and sealants', 'netra_traders', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('AB Trading', 'Baldev Singh', '9944556677', 'baldev.singh@abtrading.in', '29AABTA7890E1Z5', 'Authorized vendor for flooring and bonding agents', 'ab_trading', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Safe Enterprises', 'Ritika Mehta', '9001122334', 'ritika.mehta@safeenterprises.com', '19AACSE5432R1Z1', 'Specialized vendor for site safety and protection gear', 'safe_enterprises', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Unity Infra Supplies', 'Ravi Nair', '9877001122', 'ravi.nair@unityinfra.com', '27AABCU9876T1Z3', 'All-in-one vendor for civil and chemical materials', 'unity_infra_supplies', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('BuildPro Mart', 'Deepali Joshi', '9766098765', 'deepali.joshi@buildpromart.in', '33AABCB4321F1Z6', 'Wholesale distributor of construction-grade materials', 'buildpro_mart', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001');


--changeset IntkhabShaikh:0008-mdm-seed-material-type
INSERT INTO mdm_schema.material_type 
(material_type_name, material_type_desc, material_type_handle, created_by, updated_by)
VALUES
('Waterproofing Chemical', 'Chemical products used to prevent water ingress into structures such as basements, roofs, and tanks. Includes PU, bituminous, crystalline, and acrylic systems.', 'waterproofing_chemical', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Civil Material', 'Core construction materials used for structural and foundational works such as cement, sand, aggregates, bricks, concrete, and steel.', 'civil_material', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('RMC', 'Ready Mix Concrete prepared in batching plants and delivered to construction sites for immediate use, ensuring quality and saving time.', 'rmc', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Commercial Flooring', 'Flooring systems designed for offices, malls, hospitals, and public areas prioritizing aesthetics, durability, and ease of maintenance.', 'commercial_flooring', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Industrial Flooring', 'Heavy-duty resin or concrete-based floors built to endure mechanical loads, chemical exposure, and abrasion in factories and warehouses.', 'industrial_flooring', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Miscellaneous Site Materials', 'Support materials used during construction such as scaffolding, shuttering plywood, nails, wires, and geotextiles.', 'miscellaneous_site_materials', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Safety Equipments', 'Personal and site safety gear including helmets, gloves, boots, safety nets, signage, and barriers to protect workers and ensure compliance.', 'safety_equipments', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001');


--material table insert