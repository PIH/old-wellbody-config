-- This file is used to set up metadata required for capturing Orders

set @concept_id = 0;

-- "All Orderables" concept set
call ensure_concept(@concept_id, '7f84e270-e42f-11e5-8c3e-08002715d519', 'All Orderables','All Orderables', 'N/A', 'ConvSet', true);
set @all_orderables_concept_id = @concept_id;


-- "Lab Order" concept set
call ensure_concept(@concept_id, 'B11CC46F-A6F4-4A52-A4AF-3CC94EF7B006', 'Lab Order','Lab Order', 'N/A', 'Misc', true);
set @lab_order_concept_id = @concept_id;
call ensure_concept_set_members(@all_orderables_concept_id, @lab_order_concept_id, 1);


-- "All_Tests_and_Panels" concept set
call ensure_concept(@concept_id, '7e67abb5-e42f-11e5-8c3e-08002715d519', 'All_Tests_and_Panels','All Tests', 'N/A', 'ConvSet', true);
set @all_tests_and_panels_concept_id = @concept_id;
call ensure_concept_set_members(@lab_order_concept_id, @all_tests_and_panels_concept_id, 1);

-- Serum ConvSet
call ensure_concept(@concept_id, '86b52764-d24f-4900-beb7-0f5d91a4adc5', 'Serum','Serum', 'N/A', 'Sample', true);
set @serum_concept_id = @concept_id;
call ensure_concept_set_members(@lab_order_concept_id, @serum_concept_id, 2);

-- Blood ConvSet
call ensure_concept(@concept_id, '23c1ac3f-9aa9-4261-b434-622dab8fe2bd', 'Blood','Blood', 'N/A', 'Sample', true);
set @blood_concept_id = @concept_id;
call ensure_concept_set_members(@lab_order_concept_id, @blood_concept_id, 3);

-- Add Creatinine
call ensure_concept(@concept_id, 'e1945bb9-596d-43d9-9046-3f160e21378d', 'Creatinine','Creatinine', 'Numeric', 'LabTest', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@serum_concept_id, @child_concept_id, 1);
call ensure_concept_set_members(@all_tests_and_panels_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- Add Lab Order Fulfillment Form
call ensure_concept(@concept_id, '916F9A78-BBC7-4E84-9157-78C52F5AAA3B', 'Lab Order Fulfillment Form','Lab Order Fulfillment Form', 'N/A', 'Misc', true);
set @lab_order_fulfillment_form_concept_id = @concept_id;

-- add Lab Order Notes
call ensure_concept(@concept_id, '7e66764b-e42f-11e5-8c3e-08002715d519', 'Lab Order Notes','Lab Order Notes', 'Text', 'Misc', false);
call ensure_concept_set_members(@lab_order_fulfillment_form_concept_id, @concept_id, 1);

-- add Malaria Lab Test
call ensure_concept(@concept_id, '471f9328-b30a-4607-aa5a-ed7ad8558a5d', 'Malaria Abs','Malaria Abs', 'Text', 'LabTest', false);
call ensure_concept_set_members(@blood_concept_id, @concept_id, 1);
call ensure_concept_set_members(@all_tests_and_panels_concept_id, @concept_id, 2);

-- add Pregnancy Lab Test
call ensure_concept(@concept_id, '8FEA7D5D-B6A3-4222-AFDA-982421BC77D1', 'Pregnancy','Pregnancy', 'Text', 'LabTest', false);
call ensure_concept_set_members(@all_tests_and_panels_concept_id, @concept_id, 3);

-- add RVS Lab Test
call ensure_concept(@concept_id, 'EA76A711-4336-47B3-B6A8-5D54B0C30539', 'RVS','RVS', 'Text', 'LabTest', false);
call ensure_concept_set_members(@all_tests_and_panels_concept_id, @concept_id, 4);

-- add TB Lab Test
call ensure_concept(@concept_id, 'F686CBB7-ECDE-42A5-9DE9-1A0EDB95B6D3', 'TB','TB', 'Text', 'LabTest', false);
call ensure_concept_set_members(@all_tests_and_panels_concept_id, @concept_id, 5);

-- add LFT Lab Test
call ensure_concept(@concept_id, '74FF8F93-8A09-468E-B953-BEA386B34F6C', 'LFT','LFT', 'Text', 'LabTest', false);
call ensure_concept_set_members(@all_tests_and_panels_concept_id, @concept_id, 6);