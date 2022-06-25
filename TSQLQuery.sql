/*Hacer una funci�n que dado un art�culo y un deposito devuelva un string que
indique el estado del dep�sito seg�n el art�culo. Si la cantidad almacenada es
menor al l�mite retornar �OCUPACION DEL DEPOSITO XX %� siendo XX el
% de ocupaci�n. Si la cantidad almacenada es mayor o igual al l�mite retornar
�DEPOSITO COMPLETO�.*/IF OBJECT_ID('FX_PRIMER_EJERCICIO')IS NOT NULL	DROP FUNCTION FX_PRIMER_EJERCICIOCREATE FUNCTION FX_PRIMER_EJERCICIO (@PRODUCTO CHAR(8), @DEPOSITO CHAR(8))RETURNS CHAR(25)ASBEGIN	DECLARE @CANTIDAD DECIMAL (12,2)	DECLARE @LIMITE DECIMAL (12,2)	DECLARE @MENSAJE CHAR(25)	DECLARE @PROMEDIO DECIMAL (12,2)	SELECT		@CANTIDAD=stoc_cantidad,		@LIMITE=stoc_stock_maximo	from STOCK	join DEPOSITO on depo_codigo=stoc_deposito	where stoc_producto=@PRODUCTO and depo_codigo=@DEPOSITO	IF (@CANTIDAD<@LIMITE)		BEGIN			SET @PROMEDIO =  (@CANTIDAD/@LIMITE)*100 			SET @MENSAJE = CONCAT('OCUADO GUACHIN ',@PROMEDIO,'TOMA')			RETURN @MENSAJE		END	ELSE		SET @MENSAJE='OCUAPADO GIL'	RETURN @MENSAJE	 END	SELECT		item_cantidad,		stoc_stock_maximo,		depo_codigo	from Item_Factura 	join STOCK on item_producto=stoc_producto	join DEPOSITO on depo_codigo=stoc_deposito	SELECT		stoc_cantidad,		stoc_stock_maximo	from STOCK	join DEPOSITO on depo_codigo=stoc_deposito	where stoc_producto='00000030'and depo_codigo='00'	SELECT DBO.FX_PRIMER_EJERCICIO ('00000030','00')