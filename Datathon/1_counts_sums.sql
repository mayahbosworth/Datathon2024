--  =============================================== COUNTS ===============================================

-- TOTAL COUNT OF CONTRACTS: 70,169
SELECT *
FROM (
	SELECT 
		action_date_fiscal_year,
		COUNT(contract_award_unique_key) AS total_number_of_contract_awards
	FROM epa_contracts
	GROUP BY action_date_fiscal_year
) AS total_number_of_contract_awards;


-- TOTAL COUNT OF NON TARGET CONTRACTS: 54,466
SELECT *
FROM (
    SELECT 
        action_date_fiscal_year,
        COUNT(contract_award_unique_key) AS count_of_non_target_contracts
    FROM epa_contracts
    WHERE alaskan_native_corporation_owned_firm = 'f' AND
    american_indian_owned_business = 'f' AND
    indian_tribe_federally_recognized = 'f' AND
    native_hawaiian_organization_owned_firm = 'f' AND
    tribally_owned_firm = 'f' AND
    minority_owned_business = 'f' AND
    subcontinent_asian_asian_indian_american_owned_business = 'f' AND
    asian_pacific_american_owned_business = 'f' AND
    black_american_owned_business = 'f' AND
    hispanic_american_owned_business = 'f' AND
    native_american_owned_business = 'f' AND
    other_minority_owned_business = 'f' AND
    us_tribal_government = 'f' AND
    woman_owned_business = 'f' AND
    women_owned_small_business = 'f' AND
    economically_disadvantaged_women_owned_small_business = 'f' AND
    joint_venture_women_owned_small_business = 'f' AND
    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
    GROUP BY action_date_fiscal_year
) AS count_of_non_target_contracts;


-- TOTAL COUNT OF TARGET CONTRACTS: 15,703
SELECT *
FROM (
	SELECT 
		action_date_fiscal_year,
		COUNT(contract_award_unique_key) AS total_number_of_contract_awards_target_groups
	FROM epa_contracts
	WHERE alaskan_native_corporation_owned_firm = 't' OR
	american_indian_owned_business = 't' OR
	indian_tribe_federally_recognized = 't' OR
	native_hawaiian_organization_owned_firm = 't' OR
	tribally_owned_firm = 't' OR
	minority_owned_business = 't' OR
	subcontinent_asian_asian_indian_american_owned_business = 't' OR
	asian_pacific_american_owned_business = 't' OR
	black_american_owned_business = 't' OR
	hispanic_american_owned_business = 't' OR
	native_american_owned_business = 't' OR
	other_minority_owned_business = 't' OR
	us_tribal_government = 't' OR
	woman_owned_business = 't' OR
	women_owned_small_business = 't' OR
	economically_disadvantaged_women_owned_small_business = 't' OR
	joint_venture_women_owned_small_business = 't' OR
	joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
	emerging_small_business = 't' OR
	community_developed_corporation_owned_firm = 't' OR
	self_certified_small_disadvantaged_business = 't' OR
	small_disadvantaged_business = 't' OR
	c8a_program_participant = 't' OR
	sba_certified_8a_joint_venture = 't'
	GROUP BY action_date_fiscal_year
) AS count_of_target_contracts;

-- COMBINED QUERY DISPLAY TABLE
SELECT 
    action_date_fiscal_year,
    COUNT(*) AS total_number_of_contract_awards,
    COUNT(CASE WHEN alaskan_native_corporation_owned_firm = 'f' AND
                    american_indian_owned_business = 'f' AND
                    indian_tribe_federally_recognized = 'f' AND
                    native_hawaiian_organization_owned_firm = 'f' AND
                    tribally_owned_firm = 'f' AND
                    minority_owned_business = 'f' AND
                    subcontinent_asian_asian_indian_american_owned_business = 'f' AND
                    asian_pacific_american_owned_business = 'f' AND
                    black_american_owned_business = 'f' AND
                    hispanic_american_owned_business = 'f' AND
                    native_american_owned_business = 'f' AND
                    other_minority_owned_business = 'f' AND
                    us_tribal_government = 'f' AND
                    woman_owned_business = 'f' AND
                    women_owned_small_business = 'f' AND
                    economically_disadvantaged_women_owned_small_business = 'f' AND
                    joint_venture_women_owned_small_business = 'f' AND
                    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
                    emerging_small_business = 'f' AND
                    community_developed_corporation_owned_firm = 'f' AND
                    self_certified_small_disadvantaged_business = 'f' AND
                    small_disadvantaged_business = 'f' AND
                    c8a_program_participant = 'f' AND
                    sba_certified_8a_joint_venture = 'f' THEN 1 END) AS count_of_non_target_contracts,
    COUNT(CASE WHEN alaskan_native_corporation_owned_firm = 't' OR
                    american_indian_owned_business = 't' OR
                    indian_tribe_federally_recognized = 't' OR
                    native_hawaiian_organization_owned_firm = 't' OR
                    tribally_owned_firm = 't' OR
                    minority_owned_business = 't' OR
                    subcontinent_asian_asian_indian_american_owned_business = 't' OR
                    asian_pacific_american_owned_business = 't' OR
                    black_american_owned_business = 't' OR
                    hispanic_american_owned_business = 't' OR
                    native_american_owned_business = 't' OR
                    other_minority_owned_business = 't' OR
                    us_tribal_government = 't' OR
                    woman_owned_business = 't' OR
                    women_owned_small_business = 't' OR
                    economically_disadvantaged_women_owned_small_business = 't' OR
                    joint_venture_women_owned_small_business = 't' OR
                    joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
                    emerging_small_business = 't' OR
                    community_developed_corporation_owned_firm = 't' OR
                    self_certified_small_disadvantaged_business = 't' OR
                    small_disadvantaged_business = 't' OR
                    c8a_program_participant = 't' OR
                    sba_certified_8a_joint_venture = 't' THEN 1 END) AS total_number_of_contract_awards_target_groups
FROM epa_contracts
GROUP BY action_date_fiscal_year;



--  =============================================== $ OBLIGATED ===============================================

-- TOTAL $ OF OBLIGATED BY YEAR: 205,721,490,205.54
SELECT *
FROM (
	SELECT 
		action_date_fiscal_year,
		SUM(total_dollars_obligated) AS total_number_of_dollars_obligated
	FROM epa_contracts
	GROUP BY action_date_fiscal_year
) AS total_number_of_dollars_obligated;

-- TOTAL $ OBLIGATED TO NON TARGET: 156,556,210,885.76
SELECT *
FROM (
    SELECT 
        action_date_fiscal_year,
        SUM(total_dollars_obligated) AS total_non_target_dollars_obligated
    FROM epa_contracts
    WHERE alaskan_native_corporation_owned_firm = 'f' AND
    american_indian_owned_business = 'f' AND
    indian_tribe_federally_recognized = 'f' AND
    native_hawaiian_organization_owned_firm = 'f' AND
    tribally_owned_firm = 'f' AND
    minority_owned_business = 'f' AND
    subcontinent_asian_asian_indian_american_owned_business = 'f' AND
    asian_pacific_american_owned_business = 'f' AND
    black_american_owned_business = 'f' AND
    hispanic_american_owned_business = 'f' AND
    native_american_owned_business = 'f' AND
    other_minority_owned_business = 'f' AND
    us_tribal_government = 'f' AND
    woman_owned_business = 'f' AND
    women_owned_small_business = 'f' AND
    economically_disadvantaged_women_owned_small_business = 'f' AND
    joint_venture_women_owned_small_business = 'f' AND
    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
    GROUP BY action_date_fiscal_year
) AS total_non_target_dollars_obligated;

-- TOTAL $ OBLIGATED TO TARGET CONTRACTS:  49,165,279,319.78
SELECT *
FROM (
	SELECT 
		action_date_fiscal_year,
		SUM(total_dollars_obligated) AS total_target_dollars_obligated
	FROM epa_contracts
	WHERE alaskan_native_corporation_owned_firm = 't' OR
	american_indian_owned_business = 't' OR
	indian_tribe_federally_recognized = 't' OR
	native_hawaiian_organization_owned_firm = 't' OR
	tribally_owned_firm = 't' OR
	minority_owned_business = 't' OR
	subcontinent_asian_asian_indian_american_owned_business = 't' OR
	asian_pacific_american_owned_business = 't' OR
	black_american_owned_business = 't' OR
	hispanic_american_owned_business = 't' OR
	native_american_owned_business = 't' OR
	other_minority_owned_business = 't' OR
	us_tribal_government = 't' OR
	woman_owned_business = 't' OR
	women_owned_small_business = 't' OR
	economically_disadvantaged_women_owned_small_business = 't' OR
	joint_venture_women_owned_small_business = 't' OR
	joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
	emerging_small_business = 't' OR
	community_developed_corporation_owned_firm = 't' OR
	self_certified_small_disadvantaged_business = 't' OR
	small_disadvantaged_business = 't' OR
	c8a_program_participant = 't' OR
	sba_certified_8a_joint_venture = 't'
	GROUP BY action_date_fiscal_year
) AS total_target_dollars_obligated;

-- COMBINED QUERY DISPLAY TABLE
SELECT 
    action_date_fiscal_year,
    SUM(total_dollars_obligated) AS total_number_of_dollars_obligated,
    SUM(CASE 
            WHEN alaskan_native_corporation_owned_firm = 'f' AND
                 american_indian_owned_business = 'f' AND
                 indian_tribe_federally_recognized = 'f' AND
                 native_hawaiian_organization_owned_firm = 'f' AND
                 tribally_owned_firm = 'f' AND
                 minority_owned_business = 'f' AND
                 subcontinent_asian_asian_indian_american_owned_business = 'f' AND
                 asian_pacific_american_owned_business = 'f' AND
                 black_american_owned_business = 'f' AND
                 hispanic_american_owned_business = 'f' AND
                 native_american_owned_business = 'f' AND
                 other_minority_owned_business = 'f' AND
                 us_tribal_government = 'f' AND
                 woman_owned_business = 'f' AND
                 women_owned_small_business = 'f' AND
                 economically_disadvantaged_women_owned_small_business = 'f' AND
                 joint_venture_women_owned_small_business = 'f' AND
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
                 emerging_small_business = 'f' AND
                 community_developed_corporation_owned_firm = 'f' AND
                 self_certified_small_disadvantaged_business = 'f' AND
                 small_disadvantaged_business = 'f' AND
                 c8a_program_participant = 'f' AND
                 sba_certified_8a_joint_venture = 'f' THEN total_dollars_obligated ELSE 0 END
       ) AS total_non_target_dollars_obligated,
    SUM(CASE 
            WHEN alaskan_native_corporation_owned_firm = 't' OR
                 american_indian_owned_business = 't' OR
                 indian_tribe_federally_recognized = 't' OR
                 native_hawaiian_organization_owned_firm = 't' OR
                 tribally_owned_firm = 't' OR
                 minority_owned_business = 't' OR
                 subcontinent_asian_asian_indian_american_owned_business = 't' OR
                 asian_pacific_american_owned_business = 't' OR
                 black_american_owned_business = 't' OR
                 hispanic_american_owned_business = 't' OR
                 native_american_owned_business = 't' OR
                 other_minority_owned_business = 't' OR
                 us_tribal_government = 't' OR
                 woman_owned_business = 't' OR
                 women_owned_small_business = 't' OR
                 economically_disadvantaged_women_owned_small_business = 't' OR
                 joint_venture_women_owned_small_business = 't' OR
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
                 emerging_small_business = 't' OR
                 community_developed_corporation_owned_firm = 't' OR
                 self_certified_small_disadvantaged_business = 't' OR
                 small_disadvantaged_business = 't' OR
                 c8a_program_participant = 't' OR
                 sba_certified_8a_joint_venture = 't' THEN total_dollars_obligated ELSE 0 END
       ) AS total_target_dollars_obligated
FROM epa_contracts
GROUP BY action_date_fiscal_year;


--  =============================================== $ POTENTIAL ===============================================

-- TOTAL POTENTIAL $ BY YEAR: 1,998,312,077,108.01
SELECT *
FROM (
	SELECT 
		action_date_fiscal_year,
		SUM(potential_total_value_of_award) AS total_potential_value_awarded
	FROM epa_contracts
	GROUP BY action_date_fiscal_year
) AS total_potential_value_awarded;

-- TOTAL POTENTIAL $ NON TARGET: 1,779,207,335,148.14
SELECT *
FROM (
    SELECT 
        action_date_fiscal_year,
        SUM(potential_total_value_of_award) AS total_potential_value_non_target_awarded
    FROM epa_contracts
    WHERE alaskan_native_corporation_owned_firm = 'f' AND
    american_indian_owned_business = 'f' AND
    indian_tribe_federally_recognized = 'f' AND
    native_hawaiian_organization_owned_firm = 'f' AND
    tribally_owned_firm = 'f' AND
    minority_owned_business = 'f' AND
    subcontinent_asian_asian_indian_american_owned_business = 'f' AND
    asian_pacific_american_owned_business = 'f' AND
    black_american_owned_business = 'f' AND
    hispanic_american_owned_business = 'f' AND
    native_american_owned_business = 'f' AND
    other_minority_owned_business = 'f' AND
    us_tribal_government = 'f' AND
    woman_owned_business = 'f' AND
    women_owned_small_business = 'f' AND
    economically_disadvantaged_women_owned_small_business = 'f' AND
    joint_venture_women_owned_small_business = 'f' AND
    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
    GROUP BY action_date_fiscal_year
) AS total_potential_value_non_target_awarded;

-- TOTAL POTENTIAL $ TARGET: 219,104,741,959.87
SELECT *
FROM (
	SELECT 
		action_date_fiscal_year,
		SUM(potential_total_value_of_award) AS total_potential_value_target_awarded
	FROM epa_contracts
	WHERE alaskan_native_corporation_owned_firm = 't' OR
	american_indian_owned_business = 't' OR
	indian_tribe_federally_recognized = 't' OR
	native_hawaiian_organization_owned_firm = 't' OR
	tribally_owned_firm = 't' OR
	minority_owned_business = 't' OR
	subcontinent_asian_asian_indian_american_owned_business = 't' OR
	asian_pacific_american_owned_business = 't' OR
	black_american_owned_business = 't' OR
	hispanic_american_owned_business = 't' OR
	native_american_owned_business = 't' OR
	other_minority_owned_business = 't' OR
	us_tribal_government = 't' OR
	woman_owned_business = 't' OR
	women_owned_small_business = 't' OR
	economically_disadvantaged_women_owned_small_business = 't' OR
	joint_venture_women_owned_small_business = 't' OR
	joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
	emerging_small_business = 't' OR
	community_developed_corporation_owned_firm = 't' OR
	self_certified_small_disadvantaged_business = 't' OR
	small_disadvantaged_business = 't' OR
	c8a_program_participant = 't' OR
	sba_certified_8a_joint_venture = 't'
	GROUP BY action_date_fiscal_year
) AS total_potential_value_target_awarded;

-- COMBINED QUERY DISPLAY TABLE
SELECT 
    action_date_fiscal_year,
    SUM(potential_total_value_of_award) AS total_potential_value_awarded,
    SUM(CASE 
            WHEN alaskan_native_corporation_owned_firm = 'f' AND
                 american_indian_owned_business = 'f' AND
                 indian_tribe_federally_recognized = 'f' AND
                 native_hawaiian_organization_owned_firm = 'f' AND
                 tribally_owned_firm = 'f' AND
                 minority_owned_business = 'f' AND
                 subcontinent_asian_asian_indian_american_owned_business = 'f' AND
                 asian_pacific_american_owned_business = 'f' AND
                 black_american_owned_business = 'f' AND
                 hispanic_american_owned_business = 'f' AND
                 native_american_owned_business = 'f' AND
                 other_minority_owned_business = 'f' AND
                 us_tribal_government = 'f' AND
                 woman_owned_business = 'f' AND
                 women_owned_small_business = 'f' AND
                 economically_disadvantaged_women_owned_small_business = 'f' AND
                 joint_venture_women_owned_small_business = 'f' AND
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
                 emerging_small_business = 'f' AND
                 community_developed_corporation_owned_firm = 'f' AND
                 self_certified_small_disadvantaged_business = 'f' AND
                 small_disadvantaged_business = 'f' AND
                 c8a_program_participant = 'f' AND
                 sba_certified_8a_joint_venture = 'f' THEN potential_total_value_of_award ELSE 0 END
       ) AS total_potential_value_non_target_awarded,
    SUM(CASE 
            WHEN alaskan_native_corporation_owned_firm = 't' OR
                 american_indian_owned_business = 't' OR
                 indian_tribe_federally_recognized = 't' OR
                 native_hawaiian_organization_owned_firm = 't' OR
                 tribally_owned_firm = 't' OR
                 minority_owned_business = 't' OR
                 subcontinent_asian_asian_indian_american_owned_business = 't' OR
                 asian_pacific_american_owned_business = 't' OR
                 black_american_owned_business = 't' OR
                 hispanic_american_owned_business = 't' OR
                 native_american_owned_business = 't' OR
                 other_minority_owned_business = 't' OR
                 us_tribal_government = 't' OR
                 woman_owned_business = 't' OR
                 women_owned_small_business = 't' OR
                 economically_disadvantaged_women_owned_small_business = 't' OR
                 joint_venture_women_owned_small_business = 't' OR
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
                 emerging_small_business = 't' OR
                 community_developed_corporation_owned_firm = 't' OR
                 self_certified_small_disadvantaged_business = 't' OR
                 small_disadvantaged_business = 't' OR
                 c8a_program_participant = 't' OR
                 sba_certified_8a_joint_venture = 't' THEN potential_total_value_of_award ELSE 0 END
       ) AS total_potential_value_target_awarded
FROM epa_contracts
GROUP BY action_date_fiscal_year;



