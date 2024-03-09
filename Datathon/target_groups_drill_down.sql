

--  WILL COMPARE TO COUNTS AND SUMS
-- =============================================== CONTRACT COUNTS ===============================================

-- WOMAN OWNED
SELECT 
    action_date_fiscal_year,
    COUNT(contract_award_unique_key) AS total_number_of_woman_owned_contract_awards
FROM epa_contracts
WHERE 
    -- Woman-owned conditions
    (woman_owned_business = 't' OR
    women_owned_small_business = 't' OR
    economically_disadvantaged_women_owned_small_business = 't' OR
    joint_venture_women_owned_small_business = 't' OR
    joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
    -- Ensuring it's not a minority-owned business
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
    -- Ensuring it's not classified as a small business
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
GROUP BY action_date_fiscal_year;
-- MINORITY
SELECT 
    action_date_fiscal_year,
    COUNT(contract_award_unique_key) AS total_number_of_minority_contract_awards
FROM epa_contracts
WHERE 
    (american_indian_owned_business = 't' OR
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
    us_tribal_government = 't') AND
    -- Woman-owned conditions
    woman_owned_business = 'f' AND
    women_owned_small_business = 'f' AND
    economically_disadvantaged_women_owned_small_business = 'f' AND
    joint_venture_women_owned_small_business = 'f' AND
    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
    -- Ensuring it's not classified as a small business
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
GROUP BY action_date_fiscal_year;
-- SMALL BUSINESSES
SELECT 
    action_date_fiscal_year,
    COUNT(contract_award_unique_key) AS total_number_of_small_business_contract_awards
FROM epa_contracts
WHERE 
	(emerging_small_business = 't' OR
    community_developed_corporation_owned_firm = 't' OR
    self_certified_small_disadvantaged_business = 't' OR
    small_disadvantaged_business = 't' OR
    c8a_program_participant = 't' OR
    sba_certified_8a_joint_venture = 't' OR
    women_owned_small_business = 't' OR
    economically_disadvantaged_women_owned_small_business = 't' OR
    joint_venture_women_owned_small_business = 't' OR
    joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
    -- Minority conditions
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
    -- Woman-owned conditions
    woman_owned_business = 'f'
GROUP BY action_date_fiscal_year;
-- COMBINED QUERY VIEW
SELECT 
    action_date_fiscal_year,
    COUNT(CASE 
            WHEN woman_owned_business = 't' OR
                 women_owned_small_business = 't' OR
                 economically_disadvantaged_women_owned_small_business = 't' OR
                 joint_venture_women_owned_small_business = 't' OR
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 't' THEN 1 END
         ) AS total_number_of_woman_owned_contract_awards,
    COUNT(CASE 
            WHEN (american_indian_owned_business = 't' OR
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
                  us_tribal_government = 't') AND
                 woman_owned_business = 'f' THEN 1 END
         ) AS total_number_of_minority_contract_awards,
    COUNT(CASE 
            WHEN emerging_small_business = 't' OR
                 community_developed_corporation_owned_firm = 't' OR
                 self_certified_small_disadvantaged_business = 't' OR
                 small_disadvantaged_business = 't' OR
                 c8a_program_participant = 't' OR
                 sba_certified_8a_joint_venture = 't' AND
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
                 woman_owned_business = 'f' THEN 1 END
         ) AS total_number_of_small_business_contract_awards
FROM epa_contracts
GROUP BY action_date_fiscal_year;

--  =============================================== $ OBLIGATED ===============================================

-- WOMAN OWNED
SELECT 
    action_date_fiscal_year,
    SUM(total_dollars_obligated) AS total_number_of_dollars_obligated_woman_owned
FROM epa_contracts
WHERE 
    -- Woman-owned conditions
    (woman_owned_business = 't' OR
    women_owned_small_business = 't' OR
    economically_disadvantaged_women_owned_small_business = 't' OR
    joint_venture_women_owned_small_business = 't' OR
    joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
    -- Ensuring it's not a minority-owned business
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
    -- Ensuring it's not classified as a small business
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
GROUP BY action_date_fiscal_year;
-- MINORITY
SELECT 
    action_date_fiscal_year,
    SUM(total_dollars_obligated) AS total_number_of_dollars_obligated_minority
FROM epa_contracts
WHERE 
    (american_indian_owned_business = 't' OR
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
    us_tribal_government = 't') AND
    -- Woman-owned conditions
    woman_owned_business = 'f' AND
    women_owned_small_business = 'f' AND
    economically_disadvantaged_women_owned_small_business = 'f' AND
    joint_venture_women_owned_small_business = 'f' AND
    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
    -- Ensuring it's not classified as a small business
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
GROUP BY action_date_fiscal_year;
-- SMALL BUSINESSES
SELECT 
    action_date_fiscal_year,
    SUM(total_dollars_obligated) AS total_number_of_dollars_obligated_small_businesses
FROM epa_contracts
WHERE 
	(emerging_small_business = 't' OR
    community_developed_corporation_owned_firm = 't' OR
    self_certified_small_disadvantaged_business = 't' OR
    small_disadvantaged_business = 't' OR
    c8a_program_participant = 't' OR
    sba_certified_8a_joint_venture = 't' OR
    women_owned_small_business = 't' OR
    economically_disadvantaged_women_owned_small_business = 't' OR
    joint_venture_women_owned_small_business = 't' OR
    joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
    -- Minority conditions
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
    -- Woman-owned conditions
    woman_owned_business = 'f'
GROUP BY action_date_fiscal_year;
-- COMBINED QUERY VIEW
SELECT 
    action_date_fiscal_year,
    SUM(CASE 
            WHEN (woman_owned_business = 't' OR
                  women_owned_small_business = 't' OR
                  economically_disadvantaged_women_owned_small_business = 't' OR
                  joint_venture_women_owned_small_business = 't' OR
                  joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
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
                 emerging_small_business = 'f' AND
                 community_developed_corporation_owned_firm = 'f' AND
                 self_certified_small_disadvantaged_business = 'f' AND
                 small_disadvantaged_business = 'f' AND
                 c8a_program_participant = 'f' AND
                 sba_certified_8a_joint_venture = 'f' THEN total_dollars_obligated ELSE 0 END
        ) AS total_number_of_dollars_obligated_woman_owned,
    SUM(CASE 
            WHEN (american_indian_owned_business = 't' OR
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
                  us_tribal_government = 't') AND
                 woman_owned_business = 'f' THEN total_dollars_obligated ELSE 0 END
        ) AS total_number_of_dollars_obligated_minority,
    SUM(CASE 
            WHEN emerging_small_business = 't' OR
                 community_developed_corporation_owned_firm = 't' OR
                 self_certified_small_disadvantaged_business = 't' OR
                 small_disadvantaged_business = 't' OR
                 c8a_program_participant = 't' OR
                 sba_certified_8a_joint_venture = 't' OR
                 women_owned_small_business = 't' OR
                 economically_disadvantaged_women_owned_small_business = 't' OR
                 joint_venture_women_owned_small_business = 't' OR
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 't' AND
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
                 woman_owned_business = 'f' THEN total_dollars_obligated ELSE 0 END
        ) AS total_number_of_dollars_obligated_small_businesses
FROM epa_contracts
GROUP BY action_date_fiscal_year;

--  =============================================== $ POTENTIAL ===============================================

-- WOMAN OWNED
SELECT 
    action_date_fiscal_year,
    SUM(potential_total_value_of_award) AS total_potential_value_awardedwoman_owned
FROM epa_contracts
WHERE 
    -- Woman-owned conditions
    (woman_owned_business = 't' OR
    women_owned_small_business = 't' OR
    economically_disadvantaged_women_owned_small_business = 't' OR
    joint_venture_women_owned_small_business = 't' OR
    joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
    -- Ensuring it's not a minority-owned business
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
    -- Ensuring it's not classified as a small business
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
GROUP BY action_date_fiscal_year;
-- MINORITY
SELECT 
    action_date_fiscal_year,
    SUM(potential_total_value_of_award) AS total_potential_value_awarded_minority
FROM epa_contracts
WHERE 
    (american_indian_owned_business = 't' OR
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
    us_tribal_government = 't') AND
    -- Woman-owned conditions
    woman_owned_business = 'f' AND
    women_owned_small_business = 'f' AND
    economically_disadvantaged_women_owned_small_business = 'f' AND
    joint_venture_women_owned_small_business = 'f' AND
    joint_venture_economic_disadvantaged_women_owned_small_bus = 'f' AND
    -- Ensuring it's not classified as a small business
    emerging_small_business = 'f' AND
    community_developed_corporation_owned_firm = 'f' AND
    self_certified_small_disadvantaged_business = 'f' AND
    small_disadvantaged_business = 'f' AND
    c8a_program_participant = 'f' AND
    sba_certified_8a_joint_venture = 'f'
GROUP BY action_date_fiscal_year;
-- SMALL BUSINESSES
SELECT 
    action_date_fiscal_year,
    SUM(potential_total_value_of_award) AS total_potential_value_awarded_small_businesses
FROM epa_contracts
WHERE 
	(emerging_small_business = 't' OR
    community_developed_corporation_owned_firm = 't' OR
    self_certified_small_disadvantaged_business = 't' OR
    small_disadvantaged_business = 't' OR
    c8a_program_participant = 't' OR
    sba_certified_8a_joint_venture = 't' OR
    women_owned_small_business = 't' OR
    economically_disadvantaged_women_owned_small_business = 't' OR
    joint_venture_women_owned_small_business = 't' OR
    joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
    -- Minority conditions
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
    -- Woman-owned conditions
    woman_owned_business = 'f'
GROUP BY action_date_fiscal_year;

-- COMBINED QUERY VIEW
SELECT 
    action_date_fiscal_year,
    SUM(CASE 
            WHEN (woman_owned_business = 't' OR
                  women_owned_small_business = 't' OR
                  economically_disadvantaged_women_owned_small_business = 't' OR
                  joint_venture_women_owned_small_business = 't' OR
                  joint_venture_economic_disadvantaged_women_owned_small_bus = 't') AND
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
                 emerging_small_business = 'f' AND
                 community_developed_corporation_owned_firm = 'f' AND
                 self_certified_small_disadvantaged_business = 'f' AND
                 small_disadvantaged_business = 'f' AND
                 c8a_program_participant = 'f' AND
                 sba_certified_8a_joint_venture = 'f' THEN potential_total_value_of_award ELSE 0 END
        ) AS total_potential_value_awarded_woman_owned,
    SUM(CASE 
            WHEN (american_indian_owned_business = 't' OR
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
                  us_tribal_government = 't') AND
                 woman_owned_business = 'f' THEN potential_total_value_of_award ELSE 0 END
        ) AS total_potential_value_awarded_minority,
    SUM(CASE 
            WHEN emerging_small_business = 't' OR
                 community_developed_corporation_owned_firm = 't' OR
                 self_certified_small_disadvantaged_business = 't' OR
                 small_disadvantaged_business = 't' OR
                 c8a_program_participant = 't' OR
                 sba_certified_8a_joint_venture = 't' OR
                 women_owned_small_business = 't' OR
                 economically_disadvantaged_women_owned_small_business = 't' OR
                 joint_venture_women_owned_small_business = 't' OR
                 joint_venture_economic_disadvantaged_women_owned_small_bus = 't' AND
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
                 woman_owned_business = 'f' THEN potential_total_value_of_award ELSE 0 END
        ) AS total_potential_value_awarded_small_businesses
FROM epa_contracts
GROUP BY action_date_fiscal_year;



