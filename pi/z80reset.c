//****************************************************************************
//
//    2065-Z80-programmer I2C Z80 Retro software reset Application
//
//    Copyright (C) 2021 John Winans
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public
//    License as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//    Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public
//    License along with this library; if not, write to the Free Software
//    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
//    USA
//
//****************************************************************************

// Raspberry PI application to program to reset the Z80 Retro computer
//
// The PI communicates with the 2065-Z80-programmer using I2C.

#include <fcntl.h>
#include <linux/i2c-dev.h>
#include <stdio.h>
#include <stdint.h>
#include <sys/ioctl.h>
#include <unistd.h>

#include "dbg.h"


#define I2C_DEV "/dev/i2c-1"

/**
* Open the I2C port.
* @param dev The device file to open (on a PI, use /dev/i2c-1)
* @return The file-descriptor or -1 if the open failed.
*****************************************************************************/
static int openIIC(
    const char *dev
    )
{
    // Create a file descriptor for the I2C bus
    int fd = open(dev, O_RDWR);
    if (fd<0)
        DBG("open failed. dev='%s'\n", dev);

    return fd;
}

/**
* Modus operandi:
*
* Open the I2C port.
* Assert \RESET on the Z80 BUS.
*****************************************************************************/
int main()
{
    int iic = openIIC(I2C_DEV);
    int rc = ioctl(iic, I2C_SLAVE, (0x24));
    if (rc < 0)	{
        DBG("ioctl(I2C_SLAVE, %d) failed.  rc=%d\n", (0x24), rc);
	return -1;
    }
    if ((rc = write(iic, (char []){0x13, 0x01}, 2)) != 2) { // IO_RESET on I2C_EX2
        DBG("write() failed %d\n", rc);
	return -1;
    }
    if ((rc = write(iic, (char []){0x13, ~(0x01)}, 2)) != 2) { // ~IO_RESET on I2C_EX2
        DBG("write() failed %d\n", rc);
	return -1;
    }
    puts("Z80 Retro has been reset!");
    return 0;
}
