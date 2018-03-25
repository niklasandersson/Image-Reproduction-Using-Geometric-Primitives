function delta = CompareImageRGB(new_image, original_image, reproduced_image, score)
    image_size = size(original_image);
%     delta = sum(sum(sqrt((original_image(:,:,1) - new_image(:,:,1)).^2 + (original_image(:,:,2) - new_image(:,:,2)).^2 + (original_image(:,:,3) - new_image(:,:,3)).^2)));
%     delta = delta / (image_size(1) * image_size(2));


%             tr := int(target.Pix[i])
% 			tg := int(target.Pix[i+1])
% 			tb := int(target.Pix[i+2])
% 			ta := int(target.Pix[i+3])
% 			br := int(before.Pix[i])
% 			bg := int(before.Pix[i+1])
% 			bb := int(before.Pix[i+2])
% 			ba := int(before.Pix[i+3])
% 			ar := int(after.Pix[i])
% 			ag := int(after.Pix[i+1])
% 			ab := int(after.Pix[i+2])
% 			aa := int(after.Pix[i+3])
% 			i += 4
% 			dr1 := tr - br
% 			dg1 := tg - bg
% 			db1 := tb - bb
% 			da1 := ta - ba
% 			dr2 := tr - ar
% 			dg2 := tg - ag
% 			db2 := tb - ab
% 			da2 := ta - aa
% 			total -= uint64(dr1*dr1 + dg1*dg1 + db1*db1 + da1*da1)
%             total += uint64(dr2*dr2 + dg2*dg2 + db2*db2 + da2*da2)

            
    total = score^2 * image_size(1)*image_size(2)*3;
    
    or = original_image(:,:,1);
    og = original_image(:,:,2);
    ob = original_image(:,:,3);
    
    rr = reproduced_image(:,:,1);
    rg = reproduced_image(:,:,2);
    rb = reproduced_image(:,:,3);
    
    nr = new_image(:,:,1);
    ng = new_image(:,:,2);
    nb = new_image(:,:,3);
    
    dr1 = or - rr;
    dg1 = og - rg;
    db1 = ob - rb;
    
    dr2 = or - nr;
    dg2 = og - ng;
    db2 = ob - nb;
    
    total = total - sum(sum((dr1.*dr1 + dg1.*dg1 + db1.*db1)));
    total = total + sum(sum((dr2.*dr2 + dg2.*dg2 + db2.*db2)));
    
    delta = sqrt(total/(image_size(1)*image_size(2)*3));

end