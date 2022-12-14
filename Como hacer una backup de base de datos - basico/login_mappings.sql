-- ------------------- ---
-- Tottix Channel 2020
--  ------------------ ---
-- Script para generar otro script donde
-- se pueden recrear el mapping entre login
-- y usuario dentro de una determinada base de datos.
-- Este script no require parametros.
--
-- Creado por Ernesto Vazquez Junio 2020.
-- para mas informacion tottixchannel@gmail.com
set nocount on
go

create table #login_mappings (
    login_name nvarchar(max),
    dbname nvarchar(max),
    uname nvarchar(max), 
    alias nvarchar(max)
)
go

insert into #login_mappings 
	exec master.sys.sp_MSloginmappings 
go


select 'use ['+dbname+']; alter user ['+uname+'] with login = ['+login_name+'];' 
	from #login_mappings where login_name not like '%#%' and login_name <> 'sa' and dbname is not null;
go

drop table #login_mappings
go