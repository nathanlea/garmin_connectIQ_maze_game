using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx; 
using Toybox.System as Sys;

var START_BUTTON_X = 22;
var START_BUTTON_SIZE_X = 100;
var START_BUTTON_Y = 52;
var START_BUTTON_SIZE_Y = 30;

class BaseInputDelegate extends Ui.BehaviorDelegate
{
	//function onMenu() {
    //    Ui.pushView(new Rez.Menus.MainMenu(), new TheMazeGameMenuDelegate(), Ui.SLIDE_UP);
    //    return true;
    //}
    function onTap(evt)
    {
        //Ui.pushView(new MazeView(), new MazeInputDelegate(), Ui.SLIDE_IMMEDIATE );
		//Sys.print(evt);
		var coords = evt.getCoordinates();
		if(startButtonBounds(coords[0], coords[1]))
		{
			//Sys.print("Start Button Pressed\n");
			Ui.pushView(new MazeView(), new MazeInputDelegate(), Ui.SLIDE_IMMEDIATE );
		}
		//Sys.print(coords[0]);
		//Sys.print(coords[1]);
    }

    function onMenu()
    {
        //Ui.pushView( new MenuView(), new MenuInputDelegate(), Ui.SLIDE_IMMEDIATE );
		Sys.print("MENU");
    }
    
    function startButtonBounds( x, y )
    {
    	if(x >= START_BUTTON_X-4 && y >= START_BUTTON_Y && x <= (START_BUTTON_X-4)+(START_BUTTON_SIZE_X+6) && y <= START_BUTTON_Y+START_BUTTON_SIZE_Y)
    	{
    		return true;
    	}
    	else
    	{
    		return false;
    	}
    }
}

class TheMazeGameView extends Ui.View {

	function initialize()
    {
        
    }

    //! Load your resources here
    function onLayout(dc) {
		//setLayout(Rez.Layouts.MainLayout(dc));
		//dc.setPenWidth( 3 );
		//var h = dc.getHeight();
		//var w = dc.getWidth();
		//dc.drawLine( w/2, (h/2) - (h/4), w/2, (h/2) + (h/4) );
		//dc.drawText(0, 0, Gfx.FONT_MEDIUM , "Hello World", Gfx.TEXT_JUSTIFY_LEFT);
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout  
		//View.onUpdate(dc);
		dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		 
		var h = dc.getHeight();
		var w = dc.getWidth();
		dc.drawText(w/2, 5, 4, "The Maze Game", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawRectangle(START_BUTTON_X-4, START_BUTTON_Y, START_BUTTON_SIZE_X+6, START_BUTTON_SIZE_Y);
		dc.drawText(START_BUTTON_X, START_BUTTON_Y, 3, "Start Game", Gfx.TEXT_JUSTIFY_LEFT);
		//View.onUpdate(dc);
		//dc.drawLine( w/2, (h/2) - (h/4), w/2, (h/2) + (h/4) );
		//dc.drawText(0, 0, Gfx.FONT_MEDIUM , "Hello World", Gfx.TEXT_JUSTIFY_LEFT);	
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }
    
    function arrPos() {
    	return 5;
    }    

}