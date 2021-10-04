function[disp_y, disp_x, displaced, max_ncc] = BEST_DISP(moving, fixed)
       % this function aligns one image over a fixed image using various
       % displacements.
        max_ncc = 0;
        disp_y = 0;
        disp_x = 0;

        for i = -15:15 % range for up/down displacement
            for j = -4:4 % range for left/right displacement
                
                ncc_map = normxcorr2(circshift(moving,[i,j]), fixed);
                ncc = max(max(ncc_map));
                % stores the displacement for maximum NCC, and NCC value.
                if ncc > max_ncc
                    max_ncc = ncc;
                    disp_y = i;
                    disp_x = j;
                end
            end
        end
        % produces the best suiting diplaced image (over the fixed image)
        displaced = circshift(moving,[disp_y,disp_x]);
    end     



