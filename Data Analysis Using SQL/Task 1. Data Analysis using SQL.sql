-- TASK 1
use latihansql;
select*from tabel1;
-- NOMOR 1
select count(target) from (select name_contract_type,TARGET,CODE_GENDER,NAME_CONTRACT_STATUS from application inner join previous
on application.SK_ID_CURR=previous.SK_ID_CURR
where code_gender ='F' and Target =0 and cnt_children>0 and NAME_CONTRACT_STATUS='approved') as nosatu;

-- NOMOR 2,3,4,5
-- cara singkat menggunakan group by
select NAME_CONTRACT_TYPE,count(NAME_CONTRACT_TYPE) from (select name_contract_type,TARGET,CODE_GENDER,NAME_CONTRACT_STATUS from application inner join previous
on application.SK_ID_CURR=previous.SK_ID_CURR
where code_gender ='F' and Target =0 and cnt_children>0 and NAME_CONTRACT_STATUS='approved' ) as nodua group by NAME_CONTRACT_TYPE;

-- one by one
select count(target) from (select name_contract_type,TARGET,CODE_GENDER,NAME_CONTRACT_STATUS from application inner join previous
on application.SK_ID_CURR=previous.SK_ID_CURR
where code_gender ='F' and Target =0 and cnt_children>0 and NAME_CONTRACT_STATUS='approved' and NAME_CONTRACT_TYPE='cash loans') as nodua;

select count(target) from (select name_contract_type,TARGET,CODE_GENDER,NAME_CONTRACT_STATUS from application inner join previous
on application.SK_ID_CURR=previous.SK_ID_CURR
where code_gender ='F' and Target =0 and cnt_children>0 and NAME_CONTRACT_STATUS='approved' and NAME_CONTRACT_TYPE='consumer loans') as nodua;

select count(target) from (select name_contract_type,TARGET,CODE_GENDER,NAME_CONTRACT_STATUS from application inner join previous
on application.SK_ID_CURR=previous.SK_ID_CURR
where code_gender ='F' and Target =0 and cnt_children>0 and NAME_CONTRACT_STATUS='approved' and NAME_CONTRACT_TYPE='revolving loans') as nodua;

-- NOMOR 6
select count(SK_ID_CURR) from
(SELECT SK_ID_CURR ,count(SK_ID_CURR) as jumlah
FROM (select application.SK_ID_CURR,name_contract_type,TARGET,CODE_GENDER,NAME_CONTRACT_STATUS 
from application left join previous
on application.SK_ID_CURR=previous.SK_ID_CURR
where code_gender ='F' 
and Target =0 
and NAME_CONTRACT_STATUS='APPROVED' 
and name_contract_type='consumer loans' 
AND CNT_CHILDREN>0) as noenam group by sk_id_curr) as final where jumlah>=3;