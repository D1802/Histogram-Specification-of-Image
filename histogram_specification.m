%Histogram Specification of Matrix
%Created by DARPAN V SARODE
%BT17ECE056

clc; clear all; close all;

image = [1 3 5; 4 4 3; 5 2 2];
level = [0 1 2 3 4 5 6 7];
pixels = zeros(1,9);

for i = 1:7
    for j = 1:9
        if image(j) == level(i)
            pixels(i) = pixels(i) + 1;
        end
    end
end
pixels = pixels(1:8);

cdf = zeros(1,8);
cdf(1) = pixels(1);
for i = 2:8
    cdf(i) = cdf(i-1) + pixels(i);
end

input_equ = round(cdf*7./9);

target = [0 0 0 0 2 2 4 1];

cdf_t = zeros(1,8);
cdf_t(1) = target(1);
for i = 2:8
    cdf_t(i) = cdf_t(i-1) + target(i);
end

target_equ = round(cdf_t*7./9);

map = zeros(1,8);
j = 1;
for i = 1:8
    for j = 1:8
        if input_equ(i) <= target_equ(j)
            map(i) = level(j);
            break;
        end
	end
end

