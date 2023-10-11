package main

import (
	"fmt"
	"github.com/godbus/dbus"
	"log"
)

func main() {
	conn, err := dbus.SessionBus()
	if err != nil {
		log.Fatalf("Failed to connect to session bus: %v", err)
	}

	obj := conn.Object("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop")

	var response map[string]dbus.Variant
	err = obj.Call("org.freedesktop.portal.Screenshot.Screenshot", 0, "", false, map[string]dbus.Variant{"interactive": dbus.MakeVariant(true)}).Store(&response)
	if err != nil {
		log.Fatalf("Failed to call method: %v", err)
	}

	uri, ok := response["uri"]
	if ok {
		fmt.Println("Screenshot saved to:", uri.Value().(string))
	} else {
		fmt.Println("Could not retrieve the screenshot URI")
	}
}