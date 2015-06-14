using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx; 

class TheMazeGameView extends Ui.View {

    //! Load your resources here
    function onLayout(dc) {
		setLayout(Rez.Layouts.MainLayout(dc));
		dc.setPenWidth( 3 );
		var h = dc.getHeight();
		var w = dc.getWidth();
		dc.drawLine( w/2, (h/2) - (h/4), w/2, (h/2) + (h/4) );
		//dc.drawText(0, 0, Gfx.FONT_MEDIUM , "Hello World", Gfx.TEXT_JUSTIFY_LEFT);
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout  
		View.onUpdate(dc);      	
		var h = dc.getHeight();
		var w = dc.getWidth();
		dc.drawLine( w/2, (h/2) - (h/4), w/2, (h/2) + (h/4) );
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