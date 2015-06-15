using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Position as Position;
using Toybox.System as Sys;
using Toybox.Math as Math;

class MazeInputDelegate extends Ui.BehaviorDelegate
{
    function onPreviousPage()
    {
        Ui.popView(Ui.SLIDE_RIGHT);
    }
    function onBack()
    {
    	Ui.popView(Ui.SLIDE_RIGHT);
    }
}

class MazeView extends Ui.View
{
    var posnInfo = null;
    var width = 0.0;
    var height = 0.0;
    var maze_init = false;
    var maze;
    var wall_dist = 0.00005; //5.5m Each path is double this
	var maze_coords;
	var wall_num;
    
    function onHide() {
        Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
    }
    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
    }
    
    function onUpdate(dc)
    {
        width = dc.getWidth();
        height = dc.getHeight();

        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

 		if( posnInfo != null && posnInfo.accuracy >= 1) {        
        	dc.fillPolygon(rotateArrowtoHeading(posnInfo.heading));//Math.PI/2));
			//Sys.println(posnInfo.accuracy);
			draw_maze(posnInfo.position, dc);
        } else {
			var c_x = width/2;
			var c_y = height/2;
			var arrow = [[c_x,c_y-10],[c_x-10,c_y+10],[c_x,c_y+4],[c_x+10,c_y+10]];
			dc.drawText(width/2, 20, Gfx.FONT_MEDIUM, "Waiting for Location", Gfx.TEXT_JUSTIFY_CENTER);
				
			dc.drawLine(arrow[0][0], arrow[0][1], arrow[1][0], arrow[1][1]);
			dc.drawLine(arrow[1][0], arrow[1][1], arrow[2][0], arrow[2][1]);
			dc.drawLine(arrow[2][0], arrow[2][1], arrow[3][0], arrow[3][1]);
			dc.drawLine(arrow[3][0], arrow[3][1], arrow[0][0], arrow[0][1]);
        }
    }
    
    function onPosition(info) {
        posnInfo = info;
        Ui.requestUpdate();
    }
    
    function rotateArrowtoHeading(heading)
    {
    	var c_x = width/2;
    	var c_y = height/2;
    	var arrow = [[c_x,c_y-10],[c_x-10,c_y+10],[c_x,c_y+4],[c_x+10,c_y+10]];
    	var tempArrow = [[0,0],[0,0],[0,0],[0,0]];
    	
    	for(var i = 0; i < 4; i++)
    	{
    		var temp_x = Math.cos(heading) * ( arrow[i][0] - c_x ) - Math.sin(heading) * (arrow[i][1] - c_y) + c_x;
    		var temp_y = Math.sin(heading) * ( arrow[i][0] - c_x ) + Math.cos(heading) * (arrow[i][1] - c_y) + c_y;
    		tempArrow[i] = [temp_x, temp_y];
    	}
    	return tempArrow;
    }
    
    function draw_maze(pos, dc) {
    
    //var lat = pos.latitude;
    //var lon = pos.longitude;
    
    if(maze_init)
    	{
    	//Actaully Draw maze
		
    	}
    else
    	{
    	//Gen Maze
		maze_init = true;
		maze = new mazeFiles().getMaze();
		var c_lat = pos.toDegrees()[0].toString();
		var c_lon = pos.toDegrees()[1].toString();
		
		
		
   		}
    }
}