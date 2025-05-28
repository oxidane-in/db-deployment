
--changeset IntkhabShaikh:0008-mdm-seed-business-segment
INSERT INTO mdm_schema.business_segment 
(business_segment_name, business_segment_desc, business_segment_handle, created_by, updated_by)
VALUES
('Infrastructure - Roads', 'Construction of national highways, state roads, expressways, and rural roads to enhance connectivity and transport efficiency.', 'infrastructure_roads', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Infrastructure - Bridges', 'Development of overpasses, river-crossing bridges, and elevated structures to improve vehicular and rail movement.', 'infrastructure_bridges', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Infrastructure - Tunnels', 'Construction of underground tunnels for roads, metros, and utilities through difficult terrain or urban zones.', 'infrastructure_tunnels', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - Residential', 'Apartment complexes, villas, and township development.', 'buildings_residential', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - Commercial', 'Office towers, shopping malls, and mixed-use business spaces.', 'buildings_commercial', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - IT & ITES', 'Technology parks, software campuses, and data operation centers.', 'buildings_it_ites', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - Hospital', 'Construction of medical colleges, super-specialty hospitals, and diagnostic centers.', 'buildings_hospital', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - Data Centers', 'High-availability, secure IT infrastructure for cloud, backup, and internet services.', 'buildings_data_centers', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - Hospitality', 'Hotels, resorts, and convention centers for tourism and business.', 'buildings_hospitality', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Buildings - Government Buildings', 'Administrative blocks, secretariats, courts, and public institutions.', 'buildings_government_buildings', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001');

--changeset IntkhabShaikh:0008-mdm-seed-scope
INSERT INTO mdm_schema.scope 
(scope_name, scope_desc, scope_handle, created_by, updated_by)
VALUES
('Basements', 'Waterproofing to prevent groundwater ingress through retaining walls and base slabs.', 'basements', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Tanks', 'Internal waterproofing to ensure water retention and prevent contamination.', 'tanks', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Terraces / Roof Slabs', 'Prevents rainwater leakage into top floors through exposed slab areas.', 'terraces_roof_slabs', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Wet Areas', 'Wet area waterproofing to prevent moisture transfer to adjacent rooms.', 'wet_areas', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Podium Slabs', 'Waterproofing podiums to protect basements or spaces beneath landscaped decks.', 'podium_slabs', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Planter Boxes / Garden Beds', 'Prevents root intrusion and leakage in soil-retaining structures.', 'planter_boxes_garden_beds', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Swimming Pools / Water Bodies', 'Ensures full water retention and protection from structural leakage.', 'swimming_pools_water_bodies', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Jacuzzis & Fountains', 'Waterproofing internal finishes for decorative water elements.', 'jacuzzis_fountains', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Commercial Flooring', 'Aesthetic and durable flooring designed for high-footfall areas like offices, malls, and hospitals, balancing appearance with ease of maintenance.', 'commercial_flooring', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Industrial Flooring', 'Heavy-duty flooring built to withstand mechanical loads, abrasion, and chemical exposure in factories, warehouses, and production units.', 'industrial_flooring', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001');

--changeset IntkhabShaikh:0008-mdm-seed-status
INSERT INTO mdm_schema.status 
(status_name, status_desc, status_handle, created_by, updated_by)
VALUES
('Proposed', 'Project idea is under discussion or awaiting formal initiation.', 'proposed', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Under Feasibility Study', 'Technical and financial viability is being assessed.', 'under_feasibility_study', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Design Stage', 'Architectural, structural, and service drawings are being prepared.', 'design_stage', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Tendering / Bidding', 'Project is open for contractor/vendor bids.', 'tendering_bidding', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Awarded', 'Project has been assigned to a contractor or executing agency.', 'awarded', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Mobilization', 'Site setup and pre-construction activities are underway.', 'mobilization', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Work In Progress (WIP)', 'Active construction work is ongoing at the site.', 'work_in_progress_wip', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Delayed / On Hold', 'Work is temporarily paused due to various issues.', 'delayed_on_hold', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Partially Completed', 'Some stages or components of the project are finished.', 'partially_completed', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Testing & Commissioning', 'Systems and equipment are being tested before handover.', 'testing_commissioning', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Substantially Completed', 'Major construction is done; minor work remains.', 'substantially_completed', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Completed', 'Project is fully constructed and ready for handover.', 'completed', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Operational', 'The facility is in use and functioning as intended.', 'operational', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001'),
('Terminated / Abandoned', 'Project was canceled or permanently stopped before completion.', 'terminated_abandoned', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001');