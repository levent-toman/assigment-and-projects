create FUNCTION udf_fac (@input int)
returns INT
AS
begin 
    declare @count int ,@result int, @num int
    set @count = 1
    set @result = 1
    set @num = @input

    while @count <= @num
        begin
            set @result = @result * @count
            set @count = @count + 1
    END
    return @result
end


select dbo.udf_fac(1)
