
module balon_weight_holder()
{
    inner_d=83.7;
    wall=5;
    height=15;
    
    holder_count=4;
    holder_hole_d=6;
    
    
    difference()
    {
       union()
       {
           //tělo
           cylinder(d=inner_d+2*wall,h=height,center=true, $fn=300);            
              
        //packy
        for( angle = [0:holder_count])
            rotate([0,0,90*angle])
                {
                    translate([inner_d/2+wall-(height/2-holder_hole_d/2),0,0])
                        rotate([90,0,0])
                        {
                            difference()
                            {
                                union()
                                {
                                    cube([height,height,wall],center=true);
                                      translate([height/2,0,0])
                                        cylinder(d=height,h=wall, center=true,$fn=60);
                                }
                                translate([height/2,0,0])
                                  cylinder(d=holder_hole_d,h=wall+1,center=true, $fn=30);
                            }
                        }
                }
        }
            
        cylinder(d=inner_d,h=height+0.1,center=true, $fn=300);            
    }

}

balon_weight_holder();