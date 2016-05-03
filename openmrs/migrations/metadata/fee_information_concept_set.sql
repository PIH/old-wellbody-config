-- This file is used to set up Fee Information concept_set

set @concept_id = 0;
set @answer_concept_id = 0;

-- Fee Information concept set
call ensure_concept(@concept_id, '35EF6E9E-B439-4369-989A-6D74A63CFEFD', 'Fee Information','Fee Information', 'N/A', 'Misc', true);
set @fee_information_concept_id = @concept_id;

-- Payment Type Question
call ensure_concept(@concept_id, '8d255e34-b772-45f0-9bf6-cb5879d8d9ce', 'Payment type','Payment type', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- add Payment Type to the Fee Information set
call ensure_concept_set_members(@fee_information_concept_id, @parent_concept_id, 1);

-- 10.000 Le
call ensure_concept(@concept_id, 'e40f0da3-c2d7-44d4-bf46-94c6e1c40642', '10.000 Le','10.000 Le', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Free
call ensure_concept(@concept_id, 'f13f75dd-0cb5-4627-9bb6-de9409141cba', 'Free','Free', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);


-- Payment Received Question
call ensure_concept(@concept_id, '375F6A27-C121-4B17-A549-31E4A46F9702', 'Payment received','Payment received', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- add Payment Received to the Fee Information set
call ensure_concept_set_members(@fee_information_concept_id, @parent_concept_id, 2);

-- Yes
call ensure_concept(@concept_id, '17BD7650-C745-45BE-880F-FF323880DDF4', 'Yes', 'Yes', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- No
call ensure_concept(@concept_id, '83930A21-C3DD-400C-A24D-91A835D77FFC', 'No','No', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);
