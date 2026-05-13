@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista para VH'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVH_DEMARCACION_10_AG 
as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                            p_domain_name: 'ZDD_POSICION_10_AG') as Text
                            
{

    @UI.textArrangement: #TEXT_ONLY
    key Text.value_low as Value,
    
    @Semantics.text: true
    Text.text          as Description
    
}
where
    Text.language = $session.system_language
