SELECT 
  "Unique_ID", 
  "source", 
  pid, 
  NULLIF(screening_interviewdate, '')::DATE AS screening_interviewdate,
  -- Ensure proper integer conversion for screeningpoint
  CASE WHEN screeningpoint ~ '^\d+$' THEN screeningpoint::INTEGER ELSE NULL END AS screeningpoint,  
  -- Handle NULLs or empty strings for eligible
  CASE WHEN eligible ~ '^\d+$' THEN eligible::INTEGER ELSE NULL END AS eligible,  
  -- Handle NULLs or empty strings for gender
  CASE WHEN gender ~ '^\d+$' THEN gender::INTEGER ELSE NULL END AS gender,  
  -- Handle consent as integer
  CASE WHEN consent ~ '^\d+$' THEN consent::INTEGER ELSE NULL END AS consent,  
  non_enr_reason, 
  -- Handle exactfeverdays as integer
  CASE WHEN exactfeverdays ~ '^\d+$' THEN exactfeverdays::INTEGER ELSE NULL END AS exactfeverdays,  
  NULLIF(enr_interviewdate, '')::DATE AS enr_interviewdate,
  -- Handle high_temp_recorded as DECIMAL
  CASE WHEN high_temp_recorded ~ '^\d+(\.\d+)?$' THEN high_temp_recorded::DECIMAL ELSE NULL END AS high_temp_recorded,  
  -- Handle diagnosis as integer
  CASE WHEN diagnosis ~ '^\d+$' THEN diagnosis::INTEGER ELSE NULL END AS diagnosis,  
  discharge_diagnosis, 
  causeofdeathother, 
  -- Handle outcome as integer
  CASE WHEN outcome ~ '^\d+$' THEN outcome::INTEGER ELSE NULL END AS outcome,  
  proposed_combined_case, 
  -- Handle sampled as integer
  CASE WHEN sampled ~ '^\d+$' THEN sampled::INTEGER ELSE NULL END AS sampled,  
  swabsamplebarcodes, 
  NULLIF(swabspecimencolldate, '')::DATE AS swabspecimencolldate,
  NULLIF(sars_datereceived, '')::DATE AS sars_datereceived,
  NULLIF(sars_datetested, '')::DATE AS sars_datetested,
  -- Handle swab_tat_receiving as DECIMAL
  CASE WHEN swab_tat_receiving ~ '^\d+(\.\d+)?$' THEN swab_tat_receiving::DECIMAL ELSE NULL END AS swab_tat_receiving,  
  -- Handle swab_tat_testing as DECIMAL
  CASE WHEN swab_tat_testing ~ '^\d+(\.\d+)?$' THEN swab_tat_testing::DECIMAL ELSE NULL END AS swab_tat_testing,  
  fluresult, 
  rsvresult, 
  sc2result, 
  wholebloodbarcode, 
  -- Handle tac_tat_receiving as DECIMAL
  CASE WHEN tac_tat_receiving ~ '^\d+(\.\d+)?$' THEN tac_tat_receiving::DECIMAL ELSE NULL END AS tac_tat_receiving,  
  -- Handle tac_tat_testing as DECIMAL
  CASE WHEN tac_tat_testing ~ '^\d+(\.\d+)?$' THEN tac_tat_testing::DECIMAL ELSE NULL END AS tac_tat_testing,  
  "Target", 
  "TacResult", 
  "PCR_MalariaSpecies", 
  "TACmalariaResult", 
  malariasmear_barcode, 
  -- Handle smear_tat_receiving as DECIMAL
  CASE WHEN smear_tat_receiving ~ '^\d+(\.\d+)?$' THEN smear_tat_receiving::DECIMAL ELSE NULL END AS smear_tat_receiving,  
  -- Handle read1_tat_testing as DECIMAL
  CASE WHEN read1_tat_testing ~ '^\d+(\.\d+)?$' THEN read1_tat_testing::DECIMAL ELSE NULL END AS read1_tat_testing,  
  -- Handle read2_tat_testing as DECIMAL
  CASE WHEN read2_tat_testing ~ '^\d+(\.\d+)?$' THEN read2_tat_testing::DECIMAL ELSE NULL END AS read2_tat_testing,  
  -- Handle read1_result as INTEGER
  CASE WHEN read1_result ~ '^\d+$' THEN read1_result::INTEGER ELSE NULL END AS read1_result,  
  -- Handle read2_result as INTEGER
  CASE WHEN read2_result ~ '^\d+$' THEN read2_result::INTEGER ELSE NULL END AS read2_result,  
  "Read_1_2_outcome", 
  con_dis_check, 
  -- Handle Final_Result as INTEGER
  CASE WHEN "Final_Result" ~ '^\d+$' THEN "Final_Result"::INTEGER ELSE NULL END AS "Final_Result",  
  malariardt_barcode, 
  -- Handle malariardtres as INTEGER
  CASE WHEN malariardtres ~ '^\d+$' THEN malariardtres::INTEGER ELSE NULL END AS malariardtres,  
  malariares, 
  serum_barcode, 
  -- Handle site as INTEGER
  CASE WHEN site ~ '^\d+$' THEN site::INTEGER ELSE NULL END AS site,  
  -- Handle calculated_age_days as DECIMAL, and round it to integer
  CASE WHEN calculated_age_days ~ '^\d+(\.\d+)?$' THEN ROUND(calculated_age_days::DECIMAL) ELSE NULL END AS calculated_age_days,  
  diagnosisother 

FROM   {{source('central_raw_afi', 'afi_surveillance_table')}}


