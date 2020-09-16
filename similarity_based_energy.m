function energies = similarity_based_energy(image, rows, cols)
    energies = zeros(rows, cols);
    for x = 1:rows
        for y = 1:cols
            diff_rx = 0;
            diff_gx = 0;
            diff_bx = 0;
            diff_ry = 0;
            diff_gy = 0;
            diff_by = 0;
            if y == 1
                diff_rx = diff_rx + image(x, y, 1);
                diff_gx = diff_gx + image(x, y, 2);
                diff_bx = diff_bx + image(x, y, 3);
            else
                diff_rx = diff_rx + image(x, y-1, 1);
                diff_gx = diff_gx + image(x, y-1, 2);
                diff_bx = diff_bx + image(x, y-1, 3);
            end
            
            if y == cols
                diff_rx = diff_rx - image(x, y, 1);
                diff_gx = diff_gx - image(x, y, 2);
                diff_bx = diff_bx - image(x, y, 3);
            else
                diff_rx = diff_rx - image(x, y+1, 1);
                diff_gx = diff_gx - image(x, y+1, 2);
                diff_bx = diff_bx - image(x, y+1, 3);
            end
            
            if x == 1
                diff_ry = diff_ry + image(x, y, 1);
                diff_gy = diff_gy + image(x, y, 2);
                diff_by = diff_by + image(x, y, 3);
            else
                diff_ry = diff_ry + image(x-1, y, 1);
                diff_gy = diff_gy + image(x-1, y, 2);
                diff_by = diff_by + image(x-1, y, 3);
            end
            
            if x == rows
                diff_ry = diff_ry - image(x, y, 1);
                diff_gy = diff_gy - image(x, y, 2);
                diff_by = diff_by - image(x, y, 3);
            else
                diff_ry = diff_ry - image(x+1, y, 1);
                diff_gy = diff_gy - image(x+1, y, 2);
                diff_by = diff_by - image(x+1, y, 3);
            end
                
            ex = (diff_rx .^ 2) + (diff_gx .^ 2) + (diff_bx .^ 2);
            ey = (diff_ry .^ 2) + (diff_gy .^ 2) + (diff_by .^ 2);
            energies(x, y) = ex + ey;
        end
    end
end