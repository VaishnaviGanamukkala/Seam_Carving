function remove_col = shortest_path(energy, r, c)
    remove_col = zeros(1, r);
    dp = zeros(r, c);
    path = zeros(r, c);
    for y = 1:c
        dp(r, y) = energy(r, y);
    end
    for x = r-1:-1:1
        for y = 1:c
            min_energy = energy(x, y) + dp(x + 1, y);
            min_pos = y;
            if y-1 > 0
                e = energy(x, y) + dp(x+1, y-1);
                if e < min_energy
                    min_energy = e;
                    min_pos = y-1;
                end
            end
            if y+1 <= c
                e = energy(x, y) + dp(x+1, y+1);
                if e < min_energy
                    min_energy = e;
                    min_pos = y+1;
                end
            end
            dp(x, y) = min_energy;
            path(x, y) = min_pos;
        end
    end
    min_wt = dp(1, 1);
    min_st_col = 1;
    for y = 2:c
        if dp(1, y) < min_wt
            min_wt = dp(1, y);
            min_st_col = y;
        end
    end
    
    y = min_st_col;
    remove_col(1) = y;
    for x = 1:r-1
        remove_col(x+1) = path(x, y);
        y = path(x, y);
    end
end