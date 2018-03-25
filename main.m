addpath('src')

original_image = im2double(imread('img1.jpg'));
% scale = 250/size(original_image,2);
scale = 1;
original_image = imresize(original_image ,scale);

image_size = size(original_image);

reproduced_image = ones(image_size).*mean(mean(original_image));
new_image = zeros(image_size);

old_delta = CompareImage(reproduced_image, original_image);
match_counter = 0;

figure
number_of_iterations = 50;

% for k=1:number_of_iterations
new_images = zeros([image_size, 10]);
new_deltas = zeros(10,1);
k = 0;
triangle_size = 2000;
while k < number_of_iterations
 color = rand(1,3);
 opacity = rand(1,1);
 x(1) = rand(1).*image_size(2);
 y(1) = rand(1).*image_size(1);

 x(2) = x(1) + min(rand(1) + 0.5,1)*triangle_size - triangle_size/2;
 x(3) = x(1) + min(rand(1) + 0.5,1)*triangle_size - triangle_size/2;

 y(2) = y(1) + min(rand(1) + 0.5,1)*triangle_size - triangle_size/2;
 y(3) = y(1) + min(rand(1) + 0.5,1)*triangle_size - triangle_size/2;


 for n = 1 : 10
 new_images(:,:,:,n) = AddTriangle2Image(reproduced_image, x, y, color, 0.5, original_image);

 new_deltas(n) = CompareImageRGB(new_images(:,:,:,n), original_image, reproduced_image, old_delta);

 
 
 end
 [new_delta, index] = min(new_deltas);
 new_image = new_images(:,:,:,index);
 imshow(new_image)
 if new_delta < old_delta
  reproduced_image = new_image;
  old_delta = new_delta;
  match_counter = match_counter + 1;
  disp('Found match: ')
  disp(match_counter)
  k = k + 1;
 end
 fprintf('Old delta: %d New delta %d\n', old_delta, new_delta);
%  waitbar(k / number_of_iterations)
end

reproduced_image = imgaussfilt(reproduced_image, 1.5);
figure, imshow(reproduced_image)
% close all
