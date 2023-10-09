
#Serial monitor using powershell 

$portName = "COM7"   #insert your comport here
$baudRate = 115200   #insert your baudrate here

# Create and open the serial port
$port = New-Object System.IO.Ports.SerialPort
$port.PortName = $portName
$port.BaudRate = $baudRate
$port.Open()

# Continuously read and display data with a timestamp
while ($true) {
    if ($port.IsOpen) {
        $data = $port.ReadLine()
        $timestamp = Get-Date -Format "HH:mm:ss"
        Write-Host "$timestamp - Received data: $data"
    }
    else {
        Write-Host "Port is not open. Exiting."
        break
    }
}

# Close the serial port when done
$port.Close()

