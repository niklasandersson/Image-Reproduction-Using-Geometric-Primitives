function color = ComputeColor(image, mask)
    patch = mask.*image;
    
%     color = mean(mean(patch))
    r = patch(:,:,1);
    g = patch(:,:,2);
    b = patch(:,:,3);
    
    r_m = mean(mean(r(r ~= 0)));
    g_m = mean(mean(g(g ~= 0)));
    b_m = mean(mean(b(b ~= 0)));
    
    color = [r_m, g_m, b_m];
end