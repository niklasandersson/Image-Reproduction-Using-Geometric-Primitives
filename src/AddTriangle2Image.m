function img_out = AddTriangle2Image(img_in, x, y, color, opacity)
  [x_size, y_size, z_size] = size(img_in);

  mask  = poly2mask(x, y, x_size, y_size);

  src = zeros(x_size, y_size, 3);
  src(:,:,1) = img_in(:,:,1).*(1 - opacity.*mask) + mask.*color(1);
  src(:,:,2) = img_in(:,:,2).*(1 - opacity.*mask) + mask.*color(2);
  src(:,:,3) = img_in(:,:,3).*(1 - opacity.*mask) + mask.*color(3);

  img_out = src;
end
