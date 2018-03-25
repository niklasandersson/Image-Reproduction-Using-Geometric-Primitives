function delta = CompareImage(new_image, original_image)

lab_orignal = rgb2lab(original_image);
lab_new = rgb2lab(new_image);

image_size = size(lab_orignal);

delta = sum(sum(sqrt((lab_orignal(:,:,1) - lab_new(:,:,1)).^2 + (lab_orignal(:,:,2) - lab_new(:,:,2)).^2 + (lab_orignal(:,:,3) - lab_new(:,:,3)).^2)));

delta = delta / (image_size(1) * image_size(2));


end
