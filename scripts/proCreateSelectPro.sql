USE [TokenShop]
GO
/****** Object:  StoredProcedure [dbo].[proCreateSelectPro]    Script Date: 11/17/2018 10:05:42 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[proCreateSelectPro]
AS

DECLARE @table nvarchar(500)
DECLARE @sql nvarchar(520)


DECLARE CursorSelect CURSOR FOR
    select table_name from INFORMATION_SCHEMA.tables where table_name not like 'sys%'

OPEN CursorSelect
FETCH NEXT FROM CursorSelect
INTO @table


WHILE @@FETCH_STATUS = 0
BEGIN
        DECLARE CursorSelectFiled CURSOR FOR
            SELECT COLUMN_NAME,DATA_TYPE FROM TokenShop.INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @table
		Declare @id nvarchar(50)=''
       DECLARE @type nvarchar(100)=''
       DECLARE @field nvarchar(100)=''
       DECLARE @fields nvarchar(1220)=''
        OPEN CursorSelectFiled
        FETCH NEXT FROM CursorSelectFiled
        INTO @field,@type
        WHILE @@FETCH_STATUS = 0
        BEGIN
		
        	set @fields=(SELECT CONCAT(@fields+',', @field));
			if(@field='Id')
			set @id='@Id as '+@type;
            FETCH NEXT FROM CursorSelectFiled
            INTO @field,@type 
        END
        CLOSE CursorSelectFiled
        DEALLOCATE CursorSelectFiled
		set @fields=RIGHT(@fields,LEN(@fields)-1)
         --print @fields
            SET @sql = ' CREATE Procedure dbo.SelectAll_'+@table +
        ' AS BEGIN 
        select '+@fields+' from [dbo].[' + @table +']'+
        ' END'
		
            exec(@sql)
			 SET @sql = ' CREATE Procedure dbo.SelectOne_'+@table +
			 ' '+@id+
        ' AS BEGIN 
        select '+@fields+' from [dbo].[' + @table +']'+
        ' where Id=@id 
		 END'
		
            exec(@sql)

            FETCH NEXT FROM CursorSelect
            INTO @table     
END
CLOSE CursorSelect
DEALLOCATE CursorSelect
RETURN