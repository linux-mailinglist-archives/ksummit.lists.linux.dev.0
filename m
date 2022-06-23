Return-Path: <ksummit+bounces-697-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AA246558B94
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 226622E0A7E
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA924699;
	Thu, 23 Jun 2022 23:13:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BD1FAC
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 23:13:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E914DD;
	Fri, 24 Jun 2022 01:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1656026024;
	bh=YPkdO+oYvYoF3O4gWoOmyqztGPDqfvyem0Ek32v0K+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpAM5W4Fyw+Pkbhc1Do9Ue2bhEfZsYNvTid+8W6bu1tcuZIvVHtICiJSvNEd7OMHs
	 7kWmSRBPyGtys8Mgm+hS1NR4IfjjgDR4U79sghRIgk9gK3CiqJm6WVm1il6GQT3+7w
	 DLjpw9s46MFCaJrTmAevLeTVBMPm3O0Nj/fbT2mE=
Date: Fri, 24 Jun 2022 02:13:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
Message-ID: <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>

Hi Shuah,

On Thu, Jun 23, 2022 at 05:05:30PM -0600, Shuah Khan wrote:
> I have been debugging a driver probe failure and noticed that driver gets
> registered even when driver probe fails. This is not a new behavior. The
> code in question is the same since 2005.
> 
> dmesg will say that a driver probe failed with error code and then the very
> next message from interface core that says driver is registered successfully.
> It will create sysfs interfaces.
> 
> The probe failure is propagated from the drive probe routine all the way up to
> __driver_attach(). __driver_attach() ignores the error and and returns success.
> 
>          __device_driver_lock(dev, dev->parent);
>          driver_probe_device(drv, dev);
>          __device_driver_unlock(dev, dev->parent);
> 
>          return 0;
> 
> Interface driver register goes on to create sysfs entries as if driver probe
> worked. It handles errors from driver_register() and unwinds the register
> properly, however in this case it doesn't know about the failure.
> 
> At this point the driver is defunct with sysfs interfaces. User has to run
> rmmod to get rid of the defunct driver.
> 
> Simply returning the error from __driver_attach() didn't work as expected.
> I figured it would fail since not all interface drivers can handle errors
> from driver probe routines.
> 
> I propose that we discuss the scenario to find possible solutions to avoid
> defunct drivers.

This seems to be the expected behaviour to me. The probe failure doesn't
necessarily indicate that the driver is at fault, it means that
something went wrong when associating a particular device with the
driver. It could be that the device is faulty for instance, and that
shouldn't prevent the driver from being registered, especially if
multiple instances of the device can be present in the system, as that
would then prevent any of those instances from working due to one faulty
device.

What other behaviour would you expect ?

-- 
Regards,

Laurent Pinchart

