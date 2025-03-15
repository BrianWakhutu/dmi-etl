with malaria_pcr_species_cte as (

    SELECT 
    malaria_pcr_species.pid,
    CASE 
        WHEN "PCR_MalariaSpecies" = 'Plasmodium' THEN 'Plasmodium unspeciated'
        WHEN "PCR_MalariaSpecies" = 'Plasmodium,P. falciparum' THEN 'P. falciparum'
        WHEN "PCR_MalariaSpecies" = 'Plasmodium,P. falciparum,P. vivax' THEN 'P. falciparum, P. vivax'
        ELSE NULL
    END AS PCR_MalariaSpecies

 from {{ ref('stg_afi_surveillance') }}  as malaria_pcr_species
) 
SELECT 
    pid,
    PCR_MalariaSpecies
FROM malaria_pcr_species_cte