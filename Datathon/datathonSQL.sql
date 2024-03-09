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
minority_institution = 't' OR
historically_black_college = 't' OR
tribal_college = 't' OR
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



SELECT
	award_type,
	SUM(CASE WHEN action_date_fiscal_year = 2020 THEN total_dollars_obligated ELSE NULL END) AS "2020",
	SUM(CASE WHEN action_date_fiscal_year = 2021 THEN total_dollars_obligated ELSE NULL END) AS "2021",
	SUM(CASE WHEN action_date_fiscal_year = 2022 THEN total_dollars_obligated ELSE NULL END) AS "2022",
	SUM(CASE WHEN action_date_fiscal_year = 2023 THEN total_dollars_obligated ELSE NULL END) AS "2023",
	SUM(CASE WHEN action_date_fiscal_year = 2024 THEN total_dollars_obligated ELSE NULL END) AS "2024",
	COUNT(contract_award_unique_key) AS total_contract_awards,
	ROUND(AVG(current_total_value_of_award),2) AS avg_current_total_value_of_award,
	ROUND(AVG(potential_total_value_of_award),2) AS avg_potential_total_value_of_award,
	funding_agency_name
FROM epa_contracts ec
WHERE woman_owned_business = 't'
AND women_owned_small_business = 't'
GROUP BY award_type;




SELECT
   action_date_fiscal_year,
   COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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




SELECT
   action_date_fiscal_year,
   COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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






SELECT
   action_date_fiscal_year,
   COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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






SELECT
	award_type,
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2020 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2020_women_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2021 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2021_women_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2022 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2022_women_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2023 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2023_women_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2024 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2024_women_ratio",
	ROUND(AVG(current_total_value_of_award),2) AS avg_current_total_value_of_award,
	ROUND(AVG(potential_total_value_of_award),2) AS avg_potential_total_value_of_award
FROM epa_contracts ec
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
GROUP BY award_type;






SELECT
	award_type,
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2020 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2020_minority_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2021 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2021_minority_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2022 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2022_minority_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2023 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2023_minority_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2024 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2024_minority_ratio",
	ROUND(AVG(current_total_value_of_award),2) AS avg_current_total_value_of_award,
	ROUND(AVG(potential_total_value_of_award),2) AS avg_potential_total_value_of_award
FROM epa_contracts ec
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





SELECT
	award_type,
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2020 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2020_small_bus_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2021 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2021_small_bus_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2022 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2022_small_bus_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2023 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2023_small_bus_ratio",
	ROUND((SUM(CASE WHEN action_date_fiscal_year = 2024 THEN total_dollars_obligated ELSE NULL END)/ COUNT(contract_award_unique_key)),2) AS "2024_small_bus_ratio",
	ROUND(AVG(current_total_value_of_award),2) AS avg_current_total_value_of_award,
	ROUND(AVG(potential_total_value_of_award),2) AS avg_potential_total_value_of_award
FROM epa_contracts ec
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




-- TOTAL COUNT OF OTHER CONTRACTS (NOT WOMAN, MINORITY, SB)
SELECT
	action_date_fiscal_year,
	COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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
GROUP BY action_date_fiscal_year;
-- TOTAL COUNT OF CONTRACTS
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
GROUP BY action_date_fiscal_year;
-- COMPARE THE COUNTS
-- minority
SELECT
	action_date_fiscal_year,
	COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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
	us_tribal_government = 't'
GROUP BY action_date_fiscal_year;
-- woman
SELECT
	action_date_fiscal_year,
	COUNT(contract_award_unique_key) AS total_number_of_contract_awards
FROM epa_contracts
WHERE woman_owned_business = 't' OR
women_owned_small_business = 't' OR
economically_disadvantaged_women_owned_small_business = 't' OR
joint_venture_women_owned_small_business = 't' OR
joint_venture_economic_disadvantaged_women_owned_small_bus = 't'
GROUP BY action_date_fiscal_year;
-- small business
SELECT
	action_date_fiscal_year,
	COUNT(contract_award_unique_key) AS total_number_of_contract_awards
FROM epa_contracts
WHERE women_owned_small_business = 't' OR
economically_disadvantaged_women_owned_small_business = 't' OR
joint_venture_women_owned_small_business = 't' OR
joint_venture_economic_disadvantaged_women_owned_small_bus = 't' OR
emerging_small_business = 't' OR
community_developed_corporation_owned_firm = 't' OR
self_certified_small_disadvantaged_business = 't' OR
small_disadvantaged_business = 't' OR
c8a_program_participant = 't' OR
sba_certified_8a_joint_venture = 't'
GROUP BY action_date_fiscal_year;
-- COMPARING TYPE 1 AND TYPE 2
-- woman owned
SELECT
   action_date_fiscal_year,
   COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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
-- minority
SELECT
   action_date_fiscal_year,
   COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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
-- small business
SELECT
   action_date_fiscal_year,
   COUNT(contract_award_unique_key) AS total_number_of_contract_awards
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
-- TOTAL POTENTIAL DOLLAR OBLIGATED
SELECT
	action_date_fiscal_year,
	SUM(total_dollars_obligated) AS total_dollar_obligated_per_year
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
GROUP BY action_date_fiscal_year;
-- COMPARING TYPE 1 AND TYPE 2
-- woman owned
SELECT
   action_date_fiscal_year,
   SUM(total_dollars_obligated) AS total_dollar_obligated_per_year_woman
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
-- minority
SELECT
   action_date_fiscal_year,
   SUM(total_dollars_obligated) AS total_dollar_obligated_per_year_minorities
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
-- small business
SELECT
   action_date_fiscal_year,
   SUM(total_dollars_obligated) AS total_dollar_obligated_per_year_small_businesses
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
-- COMPARING TYPE 1 AND TYPE 2
-- woman owned
SELECT
   action_date_fiscal_year,
   SUM(potential_total_value_of_award) AS potential_total_value_of_award_woman
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
-- minority
SELECT
   action_date_fiscal_year,
   SUM(potential_total_value_of_award) AS potential_total_value_of_award_minorities
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
-- small business
SELECT
   action_date_fiscal_year,
   SUM(potential_total_value_of_award) AS potential_total_value_of_award_small_businesses
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
-- TOTAL COUNT OF CONTRACTS
SELECT
	action_date_fiscal_year,
	SUM(potential_total_value_of_award) AS potential_total_value_of_awards
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
GROUP BY action_date_fiscal_year;
