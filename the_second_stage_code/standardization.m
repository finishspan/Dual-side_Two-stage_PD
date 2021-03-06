%==========================================================================
%
% 函数名：standardization
% 函数介绍：归一化。方法：（x－基因均值）/基因方差。
%          计算每类样本的个数。
% 输入参数：a是原始基因表达谱数据。行是基因，列是样本。a的第一行是样本标记。0表示normal；1表示tumor。
% 输出参数：b是归一化之后的a。
%          style_1是normal样本的个数。
%          style_2是tumor样本的个数。
%==========================================================================
function [b,style_1,style_2] = standardization ( a , dim)

style = a ( 13*dim+1 , : );%找到样本标记行。
[row, column] = size ( a );

%对基因表达谱数据标准化。
%a = a ( 2 : row , : );%将样本标记行去掉。

for i = 1 : row-1
    m = mean ( a ( i , : ) );%样本均值
    s = std ( a ( i , :) );%样本方差。
    b ( i , : ) = ( a ( i , : ) - m ) ./ s;
end

%标准化结束

%计算每类样本的个数。
style_1 = 0;%normal的个数。
style_2 = 0;%tumor的个数。

for i = 1 : column
    if style (i) == 0
        style_1 = style_1 + 1;
    else
        style_2 = style_2 + 1;
    end
end
%计算样本个数结束。

%end of function