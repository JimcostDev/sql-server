
-- Script para generar otro script donde
-- se pueden regenerar lo configuracion de los miembros
-- adscritos a un determinado rol.

set nocount off;
go

select 'alter server role [' + sp_roles.name + '] add member [' + sp_miembros.name + ']; ' 
from sys.server_role_members
join sys.server_principals as sp_roles  
    on sys.server_role_members.role_principal_id = sp_roles.principal_id  
join sys.server_principals as sp_miembros 
    on sys.server_role_members.member_principal_id = sp_miembros.principal_id
	where sp_miembros.name <> 'sa'