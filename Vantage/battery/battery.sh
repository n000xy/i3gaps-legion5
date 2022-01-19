#!/bin/bash
echo "Switch between conservation charging to rapid charging, options: rapid, conservation"
if [ "$1" = "rapid" ]
then
	bash -c "echo '\_SB.PCI0.LPC0.EC0.QCHO' > /proc/acpi/call"
	kurwa=$(cat /proc/acpi/call | cut -d '' -f1)	
	if [ $kurwa == "0x0" ]
	then
		echo "Enabling"
		bash -c "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x07' > /proc/acpi/call"
		echo "Rapid Charging - ON"
	elif [ $kurwa == "0x1" ]
	then
		echo "Disabling"
		bash -c "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x08' > /proc/acpi/call"
		echo "Rapid Charging - OFF"
	fi
fi
if [ "$1" = "cons" ]
then
	bash -c "echo '\_SB.PCI0.LPC0.EC0.BTSM' > /proc/acpi/call"
	conservationoutput=$(cat /proc/acpi/call | cut -d '' -f1)
	if [ $conservationoutput == "0x0" ]
	then
		bash -c "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' > /proc/acpi/call"
		echo "Conservation Charging = ON"
	elif [ $conservationoutput == "0x1" ]
	then 
		bash -c "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x05' > /proc/acpi/call"
		echo "Conservation Charging = OFF"
	fi
fi


