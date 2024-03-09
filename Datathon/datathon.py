import pandas as pd

data1 = pd.read_csv('datathon_table.csv', 
                    # usecols=['current_total_value_of_award',
                    #          'potential_total_value_of_award',
                    #          'action_date_fiscal_year',
                    #          'woman_owned_business', 
                    #          'women_owned_small_business',
                    #          'minority_owned_business',
                    #          'asian_pacific_american_owned_business',
                    #          'black_american_owned_business',
                    #          'hispanic_american_owned_business',
                    #          'native_american_owned_business',
                    #          'alaskan_native_corporation_owned_firm',
                    #          'native_hawaiian_organization_owned_firm',
                    #          'native_american_owned_business',
                    #          'american_indian_owned_business',
                    #          'subcontinent_asian_asian_indian_american_owned_business',
                    #          'tribally_owned_firm',
                    #          'other_minority_owned_business',
                    #          'economically_disadvantaged_women_owned_small_business',
                    #          'joint_venture_women_owned_small_business',
                    #          'joint_venture_economic_disadvantaged_women_owned_small_bus',
                    #          'indian_tribe_federally_recognized',
                    #          'emerging_small_business',
                    #          'community_developed_corporation_owned_firm',
                    #          'self_certified_small_disadvantaged_business',
                    #          'small_disadvantaged_business',
                    #          'c8a_program_participant',
                    #          'sba_certified_8a_joint_venture',
                    #          ]
                )

data_2020 = data1[data1['action_date_fiscal_year'] == 2020]

# Calculate the sum of total dollars obligated for all business types
total_dollars_obligated_all = data_2020['total_dollars_obligated'].sum()

print(f"Total dollars obligated for all business types in 2020: ${total_dollars_obligated_all}")


# Filter the DataFrame for the year 2020
# data_2020 = data1[data1['action_date_fiscal_year'] == 2020]

# # Calculate total potential value of awards for each category
# # women_owned_minority_businesses_potential_total = data_2020[data_2020['woman_owned_business', 'women_owned_small_business', 'economically_disadvantaged_women_owned_small_business', 'joint_venture_women_owned_small_business' ,'joint_venture_economic_disadvantaged_women_owned_small_bus'] == 't']['potential_total_value_of_award'].sum()
# # minority_businesses_potential_total = data_2020[data_2020['american_indian_owned_business', 'indian_tribe_federally_recognized', 'native_hawaiian_organization_owned_firm', 'tribally_owned_firm', 'minority_owned_business', 'subcontinent_asian_asian_indian_american_owned_business', 'asian_pacific_american_owned_business', 'black_american_owned_business', 'hispanic_american_owned_business', 'native_american_owned_business',  'other_minority_owned_business','us_tribal_government'] == 't']['potential_total_value_of_award'].sum()
# # small_businesses_potential_total = data_2020[(data_2020['women_owned_small_business', 'emerging_small_business', 'community_developed_corporation_owned_firm' , 'self_certified_small_disadvantaged_business', 'small_disadvantaged_business' , 'c8a_program_participant','sba_certified_8a_joint_venture'] == 't')]['potential_total_value_of_award'].sum()
# women_owned_minority_businesses_potential_total = data_2020[data_2020['woman_owned_business'] == 't']['potential_total_value_of_award'].sum()
# minority_businesses_potential_total = data_2020[data_2020['minority_owned_business'] == 't']['potential_total_value_of_award'].sum()
# small_businesses_potential_total = data_2020[(data_2020['small_disadvantaged_business'] == 't')]['potential_total_value_of_award'].sum()



# # Count the total number of awards for each category
# num_awards_women_owned_minority_businesses = data_2020[data_2020['woman_owned_business'] == 't'].shape[0]
# num_awards_minority_businesses = data_2020[data_2020['minority_owned_business'] == 't'].shape[0]
# num_awards_small_businesses = data_2020[(data_2020['small_disadvantaged_business'] == 't')].shape[0]

# print("1", num_awards_women_owned_minority_businesses)
# print("2", num_awards_minority_businesses)
# print("3", num_awards_small_businesses)

# # Calculate the average potential total value of awards for each category
# if num_awards_women_owned_minority_businesses != 0:
#     average_potential_total_value_women_owned_minority = women_owned_minority_businesses_potential_total / 14930
#     # average_potential_total_value_women_owned_minority = women_owned_minority_businesses_potential_total / num_awards_women_owned_minority_businesses
# else:
#     average_potential_total_value_women_owned_minority = 0

# if num_awards_minority_businesses != 0:
#     average_potential_total_value_minority = minority_businesses_potential_total / 14930
#     # average_potential_total_value_minority = minority_businesses_potential_total / num_awards_minority_businesses
# else:
#     average_potential_total_value_minority = 0

# if num_awards_small_businesses != 0:
#     average_potential_total_value_small = small_businesses_potential_total / 14930
#     # average_potential_total_value_small = small_businesses_potential_total / num_awards_small_businesses
# else:
#     average_potential_total_value_small = 0

# # Calculate percentages
# total_potential_value = women_owned_minority_businesses_potential_total + minority_businesses_potential_total + small_businesses_potential_total
# print("t", total_potential_value)
# percent_women_owned_minority = (average_potential_total_value_women_owned_minority / total_potential_value) * 100
# percent_minority = (average_potential_total_value_minority / total_potential_value) * 100
# percent_small = (average_potential_total_value_small / total_potential_value) * 100

# print("a1", average_potential_total_value_women_owned_minority)
# print("a2", average_potential_total_value_minority)
# print("a3", average_potential_total_value_small)

# # Print the averages
# print(f"Average potential total value of awards for women-owned businesses among minority-owned businesses in 2020: {percent_women_owned_minority:.2f}%")
# print(f"Average potential total value of awards for minority-owned businesses in 2020: {percent_minority:.2f}%")
# print(f"Average potential total value of awards for small businesses in 2020: {percent_small:.2f}%")






# check if value is in data set anywhere
# num = '68HERC24C0025'
# is_eps50602 = data1.eq(num).any().any()

# if is_eps50602:
#     print(f"The value '{num}' is present in the DataFrame.")
# else:
#     print(f"The value '{num}' is not present in the DataFrame.")






# # print award counts for each year
# years = [2020, 2021, 2022, 2023, 2024]

# award_counts = {year: 0 for year in years}

# for index, row in data1.iterrows():
#     year = row['action_date_fiscal_year']
#     for column in data1.columns[1:]: 
#         if 'T' in str(row[column]):
#             award_counts[year] += 1

# for year, count in award_counts.items():
#     print(f"Number of awards in {year}: {count}")






# # find average difference of potential and current total value of award for sepcific year
# # find total potential value of award for specific year
# year_of_interest = 2024

# data1['current_total_value_of_award'].fillna(0, inplace=True)
# data1['potential_total_value_of_award'].fillna(0, inplace=True)

# difference_sum = 0
# count = 0
# p_sum = 0

# for index, row in data1.iterrows():
#     year = row['action_date_fiscal_year']
#     if year == year_of_interest:
#         difference = row['potential_total_value_of_award'] - row['current_total_value_of_award']
#         difference_sum += difference
#         p = row['potential_total_value_of_award']
#         p_sum += p
#         count += 1

# if count > 0:
#     average_difference = difference_sum / count
# else:
#     average_difference = 0  

# print(f"Average difference for year {year_of_interest}: {average_difference}")
# print(f"Potential sum for year {year_of_interest}: {p_sum}")
