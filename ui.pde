import controlP5.*;
import java.util.*;


ControlP5 cp5;

class UI {
  Loader loader;
  Stats stats;
  UI(PApplet pa) {
    cp5 = new ControlP5(pa);

    loader = new Loader();
    stats = new Stats();

    // LOADER -> Choose simulation


    // Display stats of the current simulation
    Accordion accordion = cp5.addAccordion("acc")
      .setPosition(0, 0)
      .setWidth(200)
      // .setHeight(height)
      .setCollapseMode(Accordion.MULTI)
      // .setMinItemHeight(200)
      .addItem(loader.container)
      .addItem(stats.container)
      .open(0,1);
  }

  class Loader {
    Group container;
    ScrollableList drop;
    Slider  itsl;
    Slider  dtsl;

    Loader() {
      container = cp5.addGroup("loader")
        .setBackgroundColor(color(18, 18, 18))
        .setBackgroundHeight(150);
      drop = cp5.addScrollableList("dropdown")
        .setPosition(10, 10)
        .setSize(180, 100)
        .setBarHeight(20)
        .setItemHeight(20)
        .setHeight(85)
        .setType(ScrollableList.LIST)
        .moveTo(container);
      for (Situation sit : situations) {
        drop.addItem(sit.name, sit);
      }



      CallbackListener cb = new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
          sim.iter = itsl.getValue();
          sim.deltaTime = dtsl.getValue();
          // switch(theEvent.getAction()) {
          //   case(ControlP5.ACTION_ENTER):
            
          //   break;
          //   case(ControlP5.ACTION_LEAVE):
          //   case(ControlP5.ACTION_RELEASEDOUTSIDE):
          //   info.n = 0;
          //   cursor(ARROW);
          //   break;
          // }
        }
      };
      itsl = cp5.addSlider("it/f")
        .setPosition(10, 100)
        .setSize(160, 15)
        .setRange(1, 100000)
        .setValue(1000)
        .moveTo(container)
        .onChange(cb);

      dtsl = cp5.addSlider("dt")
        .setPosition(10, 117)
        .setSize(160, 20)
        .setRange(0.1, 0.0001)
        .setValue(0.01)
        .moveTo(container)
        .onChange(cb);
    }
  }

  class Stats {
    Group container;
    Textlabel lbl;
    Stats() {
      container = cp5.addGroup("simulationStats")
        .setBackgroundColor(color(18, 18, 18))
        .setBackgroundHeight(150);

      lbl = cp5.addTextlabel("label")

        //   .setPosition(100, 50)
        .moveTo(container);
    }

    void update(float dt, float iter, double elapsed, int scale) {
      lbl.setText(String.format(
"""FPS: %s 
DT: %s s IT/S: %s
T: %s j %s h %s m


1 px = %s Km 
""", 
frameRate,
 dt,
  iter,
   round((float)(elapsed / (60 * 60 * 24))),
    round((float)(elapsed / (60 * 60))) % 24,
    round((float)(elapsed / 60)) % 60,
     scale));
    }
  }
}

void dropdown(int n) {
  /* request the selected item based on index n */
  Situation sit = Situation.class.cast(cp5.get(ScrollableList.class, "dropdown").getItem(n).get("value"));

  sim.load(sit);
}
