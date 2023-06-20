% Code is designed for a HTC matlab tutorial
%Input: csv file name for the spills incident and the output is a table 
%with the file name, number of spills and quantity of spills for the decade 
function spill_calculation(file_name)
    data=readtable(file_name);
    try
        index=data.Units('Pounds');
    catch
        index=[];
    end
    [number_of_spills,~]=size(data)
    if(~isempty(index))
       spills_in_gallons=sum(data.Quantity(index))/8+ sum(data.Quantity(setdiff(1:number_of_spills,index)));
    else
        spills_in_gallons= sum(data.Quantity)
    end
    output={file_name,number_of_spills,spills_in_gallons};
cell2table(output,"VariableNames",["File Name" "Number of Spills" "Quantity of Spills (Gallons)"])
end