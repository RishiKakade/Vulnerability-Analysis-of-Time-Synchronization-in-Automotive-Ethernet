import inet.common.scenario.ScenarioManager;
import inet.networks.base.TsnNetworkBase;
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnClock;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;

network VehicleSync extends TsnNetworkBase
{
    submodules:
        scenarioManager: ScenarioManager {
            @display("p=100,800;is=s");
        }
        masterClock: TsnClock {
            @display("p=500,150");
        }
        masterClock2: TsnClock {
            @display("p=900,600");
        }
        frontSwitch: TsnSwitch {
            @display("p=700,150");
        }
        frontLeftSwitch: TsnSwitch {
            @display("p=500,300");
        }
        rearLeftSwitch: TsnSwitch {
            @display("p=500,450");
        }
        rearSwitch: TsnSwitch {
            @display("p=700,600");
        }
        rearRightSwitch: TsnSwitch {
            @display("p=900,450");
        }
        frontRightSwitch: TsnSwitch {
            @display("p=900,300");
        }
        frontLeftWheel: TsnDevice {
            @display("p=300,300");
        }
        rearLeftWheel: TsnDevice {
            @display("p=300,450");
        }
        rearRightWheel: TsnDevice {
            @display("p=1100,450");
        }
        frontRightWheel: TsnDevice {
            @display("p=1100,300");
        }
        engineActuator: TsnDevice {
            @display("p=700,377");
        }
    connections:
        masterClock.ethg++ <--> EthernetLink <--> frontSwitch.ethg++;
        masterClock2.ethg++ <--> EthernetLink <--> rearSwitch.ethg++;
        frontSwitch.ethg++ <--> EthernetLink <--> frontLeftSwitch.ethg++;
        frontLeftSwitch.ethg++ <--> EthernetLink <--> rearLeftSwitch.ethg++;
        rearLeftSwitch.ethg++ <--> EthernetLink <--> rearSwitch.ethg++;
        rearSwitch.ethg++ <--> EthernetLink <--> rearRightSwitch.ethg++;
        rearRightSwitch.ethg++ <--> EthernetLink <--> frontRightSwitch.ethg++;
        frontRightSwitch.ethg++ <--> EthernetLink <--> frontSwitch.ethg++;
        frontLeftSwitch.ethg++ <--> EthernetLink <--> frontLeftWheel.ethg++;
        rearLeftSwitch.ethg++ <--> EthernetLink <--> rearLeftWheel.ethg++;
        rearRightSwitch.ethg++ <--> EthernetLink <--> rearRightWheel.ethg++;
        frontRightSwitch.ethg++ <--> EthernetLink <--> frontRightWheel.ethg++;
        frontSwitch.ethg++ <--> EthernetLink <--> engineActuator.ethg++;
        rearSwitch.ethg++ <--> EthernetLink <--> engineActuator.ethg++;

}

