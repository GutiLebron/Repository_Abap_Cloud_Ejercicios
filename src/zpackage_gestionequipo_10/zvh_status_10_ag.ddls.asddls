@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS //VALUE HELP TIPO SELECTION
define view entity ZVH_STATUS_10_AG 
as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                            p_domain_name: 'ZDD_STATUS_10_AG') as Text
                            
{

    @UI.textArrangement: #TEXT_FIRST // VALUE HELP TIPO SELECTION
    key Text.value_low as Value,
    
    @Semantics.text: true
    Text.text          as Description
    
}
where
    Text.language = $session.system_language
